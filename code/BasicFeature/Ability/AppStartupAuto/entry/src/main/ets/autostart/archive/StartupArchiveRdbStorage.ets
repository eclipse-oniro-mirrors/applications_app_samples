/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { DOCUMENT_CREATE_SQL, DOCUMENT_STATE_TABLE, DocumentStoreFailure, DocumentValidator,
  RdbDocumentStore, StoredDocument, validDocumentDatabaseName } from './RdbDocumentStore';
import { ArchiveDocument, ArchiveFailure, ArchiveStorage, ARCHIVE_SCHEMA,
  decodeArchive, encodeArchive } from './StartupArchive';

export const ARCHIVE_DATABASE_NAME: string = 'startup_query_archive_v1.db';
export const ARCHIVE_STATE_TABLE: string = DOCUMENT_STATE_TABLE;
export const ARCHIVE_CREATE_SQL: string = DOCUMENT_CREATE_SQL;

export function validArchiveDatabaseName(name: string): boolean {
  return validDocumentDatabaseName(name);
}

function archiveFailure(error: Error): Error {
  return error instanceof DocumentStoreFailure ? new ArchiveFailure(error.code) : error;
}

/** Only this entry-owned codec knows query records, retention, privacy and schema-1. */
class ArchiveDocumentValidator implements DocumentValidator {
  validate(row: StoredDocument | undefined): void {
    decodeStoredDocument(row);
  }
}

function decodeStoredDocument(row: StoredDocument | undefined): ArchiveDocument {
  if (row === undefined) {
    return new ArchiveDocument();
  }
  const document = decodeArchive(row.payload);
  if (document.revision !== row.revision || document.operationId !== row.operation) {
    throw new ArchiveFailure('INVALID');
  }
  return document;
}

/** Archive codec adapter over the local serialized private RDB document store. */
export class StartupArchiveRdbStorage implements ArchiveStorage {
  private store: RdbDocumentStore;
  private validator: DocumentValidator = new ArchiveDocumentValidator();

  private constructor(store: RdbDocumentStore) {
    this.store = store;
  }

  identity(): string {
    return this.store.identity();
  }

  static async open(context: common.Context, name: string = ARCHIVE_DATABASE_NAME): Promise<StartupArchiveRdbStorage> {
    try {
      return new StartupArchiveRdbStorage(await RdbDocumentStore.open(context, name, ARCHIVE_SCHEMA));
    } catch (error) {
      throw archiveFailure(error as Error);
    }
  }

  static async delete(context: common.Context, name: string): Promise<void> {
    try {
      await RdbDocumentStore.delete(context, name);
    } catch (error) {
      throw archiveFailure(error as Error);
    }
  }

  async load(): Promise<ArchiveDocument> {
    try {
      return decodeStoredDocument(await this.store.load());
    } catch (error) {
      throw archiveFailure(error as Error);
    }
  }

  commit(expectedRevision: number, document: ArchiveDocument): Promise<void> {
    if (!this.store.canWrite()) {
      return Promise.reject(new ArchiveFailure('CLOSED'));
    }
    let candidate: ArchiveDocument;
    let payload: string;
    try {
      // Copy and validate before joining the writer queue: later caller edits cannot affect SQL.
      payload = encodeArchive(document);
      candidate = decodeArchive(payload);
      if (!Number.isSafeInteger(expectedRevision) || expectedRevision < 0 ||
        candidate.revision !== expectedRevision + 1 || candidate.operationId.length === 0) {
        throw new ArchiveFailure('REVISION');
      }
    } catch (error) {
      return Promise.reject(error as Error);
    }
    return this.store.commit(expectedRevision,
      new StoredDocument(candidate.revision, candidate.operationId, payload), this.validator)
      .catch((error: Error): void => { throw archiveFailure(error); });
  }

  async close(): Promise<void> {
    try {
      await this.store.close();
    } catch (error) {
      throw archiveFailure(error as Error);
    }
  }
}
