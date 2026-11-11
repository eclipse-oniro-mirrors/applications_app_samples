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

/** Models for a one-root recycle operation, not a loop of independent per-note commits. */
export enum RecycleBatchAction {
  RESTORE = 'restore',
  PURGE = 'purge'
}

export class RecycleBatchRow {
  public trashId: string = '';
  public noteId: string = '';
  public title: string = '';
  public deletedAt: number = 0;
  public historyCount: number = 0;
  public eligible: boolean = false;
  public reason: string = '';
}

export class RecycleBatchPreview {
  public token: string = '';
  public action: RecycleBatchAction = RecycleBatchAction.RESTORE;
  public epoch: number = 0;
  public rootRevision: number = 0;
  public selectedCount: number = 0;
  public availableSlots: number = 0;
  public resultingActiveCount: number = 0;
  public resultingTrashCount: number = 0;
  public resultingHistoryCount: number = 0;
  public resultingBytes: number = 0;
  public observedAt: number = 0;
  public eligible: boolean = false;
  public rows: RecycleBatchRow[] = [];
  public errors: string[] = [];
}

export class RecycleBatchResult {
  public token: string = '';
  public action: RecycleBatchAction = RecycleBatchAction.RESTORE;
  public success: boolean = false;
  public affected: number = 0;
  public requiresRecovery: boolean = false;
  public message: string = '';
}

export function copyRecycleBatchPreview(value: RecycleBatchPreview): RecycleBatchPreview {
  const copy: RecycleBatchPreview = new RecycleBatchPreview();
  copy.token = value.token;
  copy.action = value.action;
  copy.epoch = value.epoch;
  copy.rootRevision = value.rootRevision;
  copy.selectedCount = value.selectedCount;
  copy.availableSlots = value.availableSlots;
  copy.resultingActiveCount = value.resultingActiveCount;
  copy.resultingTrashCount = value.resultingTrashCount;
  copy.resultingHistoryCount = value.resultingHistoryCount;
  copy.resultingBytes = value.resultingBytes;
  copy.observedAt = value.observedAt;
  copy.eligible = value.eligible;
  copy.errors = value.errors.slice();
  copy.rows = value.rows.map((row: RecycleBatchRow): RecycleBatchRow => {
    const result: RecycleBatchRow = new RecycleBatchRow();
    result.trashId = row.trashId;
    result.noteId = row.noteId;
    result.title = row.title;
    result.deletedAt = row.deletedAt;
    result.historyCount = row.historyCount;
    result.eligible = row.eligible;
    result.reason = row.reason;
    return result;
  });
  return copy;
}

export function copyRecycleBatchResult(value: RecycleBatchResult): RecycleBatchResult {
  const copy: RecycleBatchResult = new RecycleBatchResult();
  copy.token = value.token;
  copy.action = value.action;
  copy.success = value.success;
  copy.affected = value.affected;
  copy.requiresRecovery = value.requiresRecovery;
  copy.message = value.message;
  return copy;
}
