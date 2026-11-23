/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect } from '@ohos/hypium';
import { AVDataSource } from '../../../../main/ets/model/AVDataSource';

class RecordingListener implements DataChangeListener {
  private events: string[] = [];

  drain(): string {
    const recorded = this.events.join(',');
    this.events.length = 0;
    return recorded;
  }

  onDataReloaded(): void { this.events.push('reload'); }
  onDataAdd(index: number): void { this.events.push(`add:${index}`); }
  onDataChange(index: number): void { this.events.push(`change:${index}`); }
  onDataDelete(index: number): void { this.events.push(`delete:${index}`); }
  onDataMove(from: number, to: number): void { this.events.push(`move:${from}:${to}`); }
  onDataAdded(index: number): void { this.events.push(`legacy-add:${index}`); }
  onDataChanged(index: number): void { this.events.push(`legacy-change:${index}`); }
  onDataDeleted(index: number): void { this.events.push(`legacy-delete:${index}`); }
  onDataMoved(from: number, to: number): void { this.events.push(`legacy-move:${from}:${to}`); }
  onDatasetChange(operations: DataOperation[]): void { this.events.push(`batch:${operations.length}`); }
}

export function makeSources(size: number, text: string, repeat: boolean): string[] {
  const sources: string[] = [];
  for (let index = 0; index < size; index++) {
    sources.push(repeat ? text : `${text}${index}`);
  }
  return sources;
}

export function checkNotificationPlan(plan: string, index: number, first: string, second: string): void {
  const source = new AVDataSource(['clip0', 'clip1']);
  const left = new RecordingListener();
  const right = new RecordingListener();
  for (let i = 0; i < plan.length; i++) {
    switch (plan[i]) {
      case 'L': source.registerDataChangeListener(left); break;
      case 'R': source.registerDataChangeListener(right); break;
      case 'l': source.unregisterDataChangeListener(left); break;
      case 'r': source.unregisterDataChangeListener(right); break;
      case 'A': source.addData(index); break;
      case 'C': source.notifyDataChange(index); break;
      case 'N': source.notifyDataReload(); break;
      default: throw new Error(`Unknown notification operation ${plan[i]}`);
    }
  }
  expect(left.drain()).assertEqual(first);
  expect(right.drain()).assertEqual(second);
  expect(source.totalCount()).assertEqual(2);
  expect(source.getData(0)).assertEqual('clip0');
  expect(source.getData(1)).assertEqual('clip1');
  source.unregisterDataChangeListener(left);
  source.unregisterDataChangeListener(right);
  source.notifyDataReload();
  expect(left.drain()).assertEqual('');
  expect(right.drain()).assertEqual('');
}
