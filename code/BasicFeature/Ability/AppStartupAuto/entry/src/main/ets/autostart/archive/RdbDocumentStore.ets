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
import { relationalStore } from '@kit.ArkData';

/** Opaque payload: schema and business validation stay with the caller. */
export class StoredDocument {
  public revision: number = 0;
  public operation: string = '';
  public payload: string = '';

  constructor(revision: number = 0, operation: string = '', payload: string = '') {
    this.revision = revision;
    this.operation = operation;
    this.payload = payload;
  }
}

export interface DocumentValidator {
  validate(document: StoredDocument | undefined): void;
}

export class DocumentStoreFailure extends Error {
  public code: string;

  constructor(code: string) {
    super(code);
    this.name = 'DocumentStoreFailure';
    this.code = code;
  }
}

export const DOCUMENT_STATE_TABLE: string = 'startup_archive_state';
export const DOCUMENT_CREATE_SQL: string = 'CREATE TABLE IF NOT EXISTS startup_archive_state (' +
  'singleton INTEGER PRIMARY KEY CHECK(singleton = 1), revision INTEGER NOT NULL, ' +
  'operation TEXT NOT NULL, payload TEXT NOT NULL)';

export function validDocumentDatabaseName(name: string): boolean {
  return /^[A-Za-z0-9_-]{1,64}\.db$/.test(name);
}

/** Serialized private RDB document port, independent of entry codecs and resources. */
export class RdbDocumentStore {
  private store: relationalStore.RdbStore;
  private closed: boolean = false;
  private closing: boolean = false;
  private chain: Promise<void> = Promise.resolve();
  private identityValue: string;

  private constructor(store: relationalStore.RdbStore, identity: string) {
    this.store = store;
    this.identityValue = identity;
  }

  identity(): string {
    return this.identityValue;
  }

  static async open(context: common.Context, name: string, schema: number): Promise<RdbDocumentStore> {
    if (!validDocumentDatabaseName(name)) {
      throw new DocumentStoreFailure('NAME');
    }
    if (!Number.isSafeInteger(schema) || schema < 1) {
      throw new DocumentStoreFailure('SCHEMA');
    }
    const config: relationalStore.StoreConfig = { name: name, securityLevel: relationalStore.SecurityLevel.S1 };
    const store = await relationalStore.getRdbStore(context, config);
    try {
      if (store.version !== 0 && store.version !== schema) {
        throw new DocumentStoreFailure('SCHEMA');
      }
      await store.executeSql(DOCUMENT_CREATE_SQL);
      if (store.version === 0) {
        store.version = schema;
      }
      return new RdbDocumentStore(store, `${context.databaseDir}/${name}`);
    } catch (error) {
      try {
        await store.close();
      } catch (_) {
        // Preserve the open/schema failure when resource cleanup also fails.
      }
      throw error as Error;
    }
  }

  /** Call only after closing all instances, using a dedicated private database name. */
  static async delete(context: common.Context, name: string): Promise<void> {
    if (!validDocumentDatabaseName(name)) {
      throw new DocumentStoreFailure('NAME');
    }
    await relationalStore.deleteRdbStore(context, name);
  }

  canWrite(): boolean {
    return !this.closed && !this.closing;
  }

  load(): Promise<StoredDocument | undefined> {
    if (this.closed || this.closing) {
      return Promise.reject(new DocumentStoreFailure('CLOSED'));
    }
    const task = this.chain.then((): Promise<StoredDocument | undefined> => this.readCurrent());
    this.chain = task.then((): void => {}, (): void => {});
    return task;
  }

  commit(expectedRevision: number, document: StoredDocument, validator: DocumentValidator): Promise<void> {
    if (this.closed || this.closing) {
      return Promise.reject(new DocumentStoreFailure('CLOSED'));
    }
    // Snapshot mutable caller DTO fields before joining the queue.
    const candidate = new StoredDocument(document.revision, document.operation, document.payload);
    if (!Number.isSafeInteger(expectedRevision) || expectedRevision < 0 ||
      candidate.revision !== expectedRevision + 1 || candidate.operation.length === 0) {
      return Promise.reject(new DocumentStoreFailure('REVISION'));
    }
    const task = this.chain.then(async (): Promise<void> => {
      if (this.closed) {
        throw new DocumentStoreFailure('CLOSED');
      }
      let transaction = false;
      try {
        this.store.beginTransaction();
        transaction = true;
        const current = await this.readCurrent();
        // Business codec validation is injected and runs inside the same transaction.
        validator.validate(current);
        if ((current === undefined ? 0 : current.revision) !== expectedRevision) {
          throw new DocumentStoreFailure('CONFLICT');
        }
        await this.store.executeSql('INSERT OR REPLACE INTO startup_archive_state ' +
          '(singleton, revision, operation, payload) VALUES (1, ?, ?, ?)',
          [candidate.revision, candidate.operation, candidate.payload]);
        this.store.commit();
        transaction = false;
      } catch (error) {
        if (transaction) {
          try {
            this.store.rollBack();
          } catch (_) {
            // The caller must reread an ambiguous result; never replace the write failure.
          }
        }
        throw error as Error;
      }
    });
    this.chain = task.then((): void => {}, (): void => {});
    return task;
  }

  async close(): Promise<void> {
    if (this.closed) {
      return;
    }
    if (this.closing) {
      await this.chain;
      return;
    }
    this.closing = true;
    const task = this.chain.then(async (): Promise<void> => {
      await this.store.close();
      this.closed = true;
    });
    this.chain = task.then((): void => {}, (): void => {});
    try {
      await task;
    } finally {
      this.closing = false;
    }
  }

  private async readCurrent(): Promise<StoredDocument | undefined> {
    if (this.closed) {
      throw new DocumentStoreFailure('CLOSED');
    }
    const rows = await this.store.querySql(
      'SELECT revision, operation, payload FROM startup_archive_state WHERE singleton = 1');
    try {
      if (rows.rowCount === 0) {
        return undefined;
      }
      if (rows.rowCount !== 1 || !rows.goToFirstRow()) {
        throw new DocumentStoreFailure('INVALID');
      }
      return new StoredDocument(rows.getLong(rows.getColumnIndex('revision')),
        rows.getString(rows.getColumnIndex('operation')), rows.getString(rows.getColumnIndex('payload')));
    } finally {
      rows.close();
    }
  }
}
