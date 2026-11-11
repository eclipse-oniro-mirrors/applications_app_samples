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
import {
  BusinessStore, StoredData, NoteItem, NoteRevision, RecycledNote
} from '../../../main/ets/business/BusinessStore';
import { BusinessWriteError } from '../../../main/ets/business/BusinessStorage';
import { ControlledBusinessStorage, loadBusiness } from './CoverageFixture';
import { FixedBusinessClock } from './BusinessFixture';
import { CaseScope } from './CaseScope';

export enum RecycleWriteFault {
  NONE = 'none',
  UNKNOWN_BEFORE = 'unknown-before',
  UNKNOWN_AFTER = 'unknown-after'
}

/** Storage effects and failure stages only; the real Store performs every business decision. */
export class RecycleBusinessStorage extends ControlledBusinessStorage {
  public fault: RecycleWriteFault = RecycleWriteFault.NONE;
  public reloads: number = 0;
  public failReload: boolean = false;
  public reloadValue: string | undefined = undefined;
  async write(value: string): Promise<void> {
    if (this.fault === RecycleWriteFault.UNKNOWN_BEFORE) {
      this.writes++;
      this.submitted.push(value);
      throw new BusinessWriteError('effect not known to caller', true);
    }
    await super.write(value);
    if (this.fault === RecycleWriteFault.UNKNOWN_AFTER) {
      throw new BusinessWriteError('flush response lost after effect', true);
    }
  }
  async reload(context: common.ApplicationContext): Promise<string> {
    this.reloads++;
    if (this.failReload) { throw new Error('fresh read unavailable'); }
    const value: string | undefined = this.reloadValue;
    return value === undefined ? super.reload(context) : value;
  }
}

/** Input data built with production classes, never a copied recycle implementation. */
export function recycleInput(active: number = 2, recycled: number = 0,
  deletedAt: number = new FixedBusinessClock().now()): StoredData {
  const data: StoredData = new StoredData();
  data.draftTitle = '独立新草稿';
  data.draftBody = '独立草稿正文';
  for (let index: number = 0; index < active; index++) {
    const id: string = `active-${index}`;
    data.notes.push(new NoteItem(id, `正式标题${index}`, `正式正文${index}`, index + 1));
    data.noteHistory.push(new NoteRevision(`active-history-${index}`, id, `旧标题${index}`,
      `旧正文${index}`, index + 1, 'edit'));
  }
  for (let index: number = 0; index < recycled; index++) {
    const entry: RecycledNote = new RecycledNote();
    entry.trashId = `trash-${index + 1}`;
    entry.note = new NoteItem(`recycled-${index}`, `回收标题${index}`, `回收正文${index}`, index + 100);
    entry.deletedAt = deletedAt;
    entry.history = [new NoteRevision(`recycled-history-${index}`, entry.note.id, `回收旧标题${index}`,
      `回收旧正文${index}`, index + 100, 'edit')];
    data.recycleBin.push(entry);
  }
  data.recycleSequence = recycled;
  return data;
}

export async function openRecycle(scope: CaseScope, io: RecycleBusinessStorage,
  clock: FixedBusinessClock = new FixedBusinessClock()): Promise<BusinessStore> {
  return loadBusiness(scope, io, clock.now);
}
