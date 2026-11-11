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

import {
  ActionButton, InfoField, MemoryResultCard, CallRecordCard
} from '../../../../main/ets/components/ReactiveCards';
import { CallRecord, emptyCallRecord } from '../../../../main/ets/core/Types';

function recordAt(revision: number): CallRecord {
  return {
    id: 41,
    api: 'ui.fixture',
    target: 'entry.hap',
    status: revision % 2 === 1 ? '调用成功' : '调用中',
    kind: revision % 2 === 1 ? 'success' : 'pending',
    at: 1700000000000,
    elapsed: revision * 10,
    code: 0,
    message: `日志结果${revision}`,
    late: false
  };
}

function memoryAt(revision: number): CallRecord {
  const record = recordAt(revision);
  record.api = 'evictFilePages';
  record.message = `内存结果${revision}`;
  return record;
}

@Entry
@Component
struct ReactivePage {
  @State revision: number = 0;
  @State phase: number = 0;
  @State actionLabel: string = '等待更新';
  @State actionEnabled: boolean = false;
  @State fieldValue: string = '初始字段';
  @State memoryRecord: CallRecord = memoryAt(0);
  @State records: CallRecord[] = [recordAt(0)];
  @State expandedId: number = 41;

  private updateFixture(): void {
    this.revision++;
    this.actionLabel = `动作${this.revision}`;
    this.actionEnabled = true;
    this.fieldValue = `字段${this.revision}`;
    this.memoryRecord = memoryAt(this.revision);
    this.records = [recordAt(this.revision)];
  }

  private currentRecord(id: number): CallRecord {
    const record = this.records.find((value: CallRecord): boolean => value.id === id);
    return record === undefined ? emptyCallRecord() : record;
  }

  build(): void {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Button('更新组件')
          .id('ui-update')
          .layoutWeight(1)
          .onClick((): void => { this.updateFixture(); })
        Button('内存结果')
          .id('ui-show-memory')
          .layoutWeight(1)
          .onClick((): void => { this.phase = 1; })
        Button('记录')
          .id('ui-show-log')
          .layoutWeight(1)
          .onClick((): void => { this.phase = 2; })
      }
      .width('100%')
      // Keep the action mounted so the final check observes updates across both result panes.
      Row() {
        ActionButton({ label: this.actionLabel, isEnabled: this.actionEnabled })
      }
      .width('100%')
      if (this.phase === 0) {
        InfoField({ label: '字段', value: this.fieldValue })
      } else if (this.phase === 1) {
        MemoryResultCard({ record: this.memoryRecord })
      } else {
        ForEach(this.records.map((record: CallRecord): number => record.id), (id: number): void => {
          CallRecordCard({
            record: this.currentRecord(id),
            expanded: this.expandedId === id,
            onToggle: (recordId: number): void => {
              this.expandedId = this.expandedId === recordId ? -1 : recordId;
            }
          })
        }, (id: number): string => id.toString())
      }
    }
    .padding(12)
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#F4F6FA')
  }
}
