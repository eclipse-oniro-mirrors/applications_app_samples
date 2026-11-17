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
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import {
  AppendRecordReport,
  ClearRecordReport,
  QosRunInfo,
  RecordQueryReport,
  RecordStatsReport,
  RunRecord
} from 'libentry.so';
import { buildQosLevelOptions, QosLevelOption } from '../model/QosLevelModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkQosHistory]';
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;

class RecordRow {
  public index: number;
  public level: number;
  public duration: number;
  public setResult: number;

  constructor(index: number, level: number, duration: number, setResult: number) {
    this.index = index;
    this.level = level;
    this.duration = duration;
    this.setResult = setResult;
  }
}

@Entry
@Component
struct HistoryPage {
  private levelOptions: QosLevelOption[] = buildQosLevelOptions();
  private limitOptions: number[] = [10, 50, 100];
  @State selectedLevel: number = 5;
  @State limit: number = 10;
  @State recordDir: string = '';
  @State rows: RecordRow[] = [];
  @State total: number = 0;
  @State capacity: number = 0;
  @State successCount: number = 0;
  @State failureCount: number = 0;
  @State avgDuration: number = INVALID_DURATION;
  @State minDuration: number = INVALID_DURATION;
  @State maxDuration: number = INVALID_DURATION;
  @State busy: boolean = false;
  @State statusText: Resource = $r('app.string.history_status_idle');

  aboutToAppear(): void {
    const hostContext: common.Context | undefined =
      this.getUIContext().getHostContext() as common.Context | undefined;
    if (hostContext !== undefined) {
      this.recordDir = hostContext.filesDir;
    }
  }

  private applyQuery(report: RecordQueryReport): void {
    const list: RecordRow[] = [];
    for (let index = 0; index < report.records.length; index++) {
      const record: RunRecord = report.records[index];
      list.push(new RecordRow(record.index, record.level, record.duration, record.setResult));
    }
    this.rows = list;
    this.total = report.total;
  }

  private applyStats(report: RecordStatsReport): void {
    this.total = report.total;
    this.successCount = report.successCount;
    this.failureCount = report.failureCount;
    this.avgDuration = report.avgDuration;
    this.minDuration = report.minDuration;
    this.maxDuration = report.maxDuration;
  }

  private async runAndRecord(): Promise<void> {
    if (this.busy || this.recordDir.length === 0) {
      this.statusText = $r('app.string.history_status_failed');
      return;
    }
    this.busy = true;
    this.statusText = $r('app.string.history_status_running');
    try {
      const duration: number = await testNapi.useQosAsync(this.selectedLevel);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      const appended: AppendRecordReport = testNapi.appendRunRecord(this.recordDir, this.selectedLevel, duration,
        info.setResult, info.queryLevel, info.resetResult, info.bindResult);
      this.capacity = appended.capacity;
      if (appended.code === 0) {
        this.statusText = $r('app.string.history_status_recorded');
      } else {
        this.statusText = $r('app.string.history_status_failed');
      }
      this.applyQuery(testNapi.readRunRecords(this.recordDir, this.limit));
      this.applyStats(testNapi.getRecordStats(this.recordDir));
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'record rejected, level: %{public}d', this.selectedLevel);
      this.statusText = $r('app.string.history_status_rejected');
    }
    this.busy = false;
  }

  private readRecords(): void {
    if (this.recordDir.length === 0) {
      this.statusText = $r('app.string.history_status_failed');
      return;
    }
    const report: RecordQueryReport = testNapi.readRunRecords(this.recordDir, this.limit);
    this.applyQuery(report);
    this.statusText = report.code === 0 ? $r('app.string.history_status_read') : $r('app.string.history_status_failed');
  }

  private refreshStats(): void {
    if (this.recordDir.length === 0) {
      this.statusText = $r('app.string.history_status_failed');
      return;
    }
    const report: RecordStatsReport = testNapi.getRecordStats(this.recordDir);
    this.applyStats(report);
    this.statusText = report.code === 0 ? $r('app.string.history_status_read') : $r('app.string.history_status_failed');
  }

  private clearRecords(): void {
    if (this.recordDir.length === 0) {
      this.statusText = $r('app.string.history_status_failed');
      return;
    }
    const report: ClearRecordReport = testNapi.clearRunRecords(this.recordDir);
    this.rows = [];
    this.total = 0;
    this.successCount = 0;
    this.failureCount = 0;
    this.avgDuration = INVALID_DURATION;
    this.minDuration = INVALID_DURATION;
    this.maxDuration = INVALID_DURATION;
    if (report.code === 0) {
      this.statusText = $r('app.string.history_status_cleared');
    } else {
      this.statusText = $r('app.string.history_status_failed');
    }
  }

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Button($r('app.string.common_back'), { type: ButtonType.Normal })
          .height(36)
          .borderRadius(8)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
        Text($r('app.string.history_title'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.qos_text_primary'))
          .layoutWeight(1)
      }
      .width('100%')

      Text($r('app.string.history_level_label'))
        .fontSize(14)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')

      Row({ space: 6 }) {
        ForEach(this.levelOptions, (option: QosLevelOption) => {
          Button(option.level.toString(), { type: ButtonType.Normal })
            .height(32)
            .layoutWeight(1)
            .borderRadius(8)
            .fontSize(13)
            .fontColor(this.selectedLevel === option.level ? $r('app.color.qos_text_light') :
              $r('app.color.qos_text_primary'))
            .backgroundColor(this.selectedLevel === option.level ? $r('app.color.qos_button_selected') :
              $r('app.color.qos_button_bg'))
            .enabled(!this.busy)
            .onClick(() => {
              this.selectedLevel = option.level;
            })
        }, (option: QosLevelOption) => option.level.toString())
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.history_limit_label'))
          .fontSize(14)
          .fontColor($r('app.color.qos_text_secondary'))
          .layoutWeight(1)
        ForEach(this.limitOptions, (item: number) => {
          Button(item.toString(), { type: ButtonType.Normal })
            .height(32)
            .width(48)
            .borderRadius(8)
            .fontSize(13)
            .fontColor(this.limit === item ? $r('app.color.qos_text_light') : $r('app.color.qos_text_primary'))
            .backgroundColor(this.limit === item ? $r('app.color.qos_button_selected') : $r('app.color.qos_button_bg'))
            .enabled(!this.busy)
            .onClick(() => {
              this.limit = item;
            })
        }, (item: number) => item.toString())
      }
      .width('100%')

      Row({ space: 8 }) {
        Button($r('app.string.history_btn_record'), { type: ButtonType.Normal })
          .height(38)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .backgroundColor($r('app.color.qos_button_selected'))
          .fontColor($r('app.color.qos_text_light'))
          .enabled(!this.busy)
          .onClick(() => {
            this.runAndRecord();
          })
        Button($r('app.string.history_btn_read'), { type: ButtonType.Normal })
          .height(38)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .enabled(!this.busy)
          .onClick(() => {
            this.readRecords();
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Button($r('app.string.history_btn_stats'), { type: ButtonType.Normal })
          .height(36)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .enabled(!this.busy)
          .onClick(() => {
            this.refreshStats();
          })
        Button($r('app.string.history_btn_clear'), { type: ButtonType.Normal })
          .height(36)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .enabled(!this.busy)
          .onClick(() => {
            this.clearRecords();
          })
      }
      .width('100%')

      Text(this.statusText)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_primary'))
        .width('100%')

      if (this.rows.length === 0) {
        Text($r('app.string.history_empty'))
          .fontSize(13)
          .fontColor($r('app.color.qos_text_secondary'))
          .width('100%')
          .layoutWeight(1)
      } else {
        Scroll() {
          Column({ space: 6 }) {
            ForEach(this.rows, (row: RecordRow) => {
              Row({ space: 8 }) {
                Text('#' + row.index.toString())
                  .fontSize(12)
                  .fontColor($r('app.color.qos_text_secondary'))
                  .width(48)
                Text($r('app.string.history_col_level'))
                  .fontSize(12)
                  .fontColor($r('app.color.qos_text_secondary'))
                  .width(36)
                Text(row.level.toString())
                  .fontSize(13)
                  .fontColor($r('app.color.qos_text_primary'))
                  .width(28)
                Text(row.duration.toFixed(2) + ' ms')
                  .fontSize(13)
                  .fontColor($r('app.color.qos_text_primary'))
                  .layoutWeight(1)
                Text(row.setResult.toString())
                  .fontSize(12)
                  .fontColor($r('app.color.qos_text_secondary'))
                  .width(40)
              }
              .width('100%')
              .padding(8)
              .borderRadius(8)
              .backgroundColor($r('app.color.qos_card_bg'))
            }, (row: RecordRow) => row.index.toString())
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)
        .align(Alignment.TopStart)
      }

      Column({ space: 4 }) {
        Row() {
          Text($r('app.string.history_total'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.total.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_capacity'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.capacity.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_pass'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.successCount.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_fail'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.failureCount.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_avg'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.avgDuration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_min'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.minDuration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.history_max'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.maxDuration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')
      }
      .width('100%')
      .padding(10)
      .borderRadius(8)
      .backgroundColor($r('app.color.qos_card_bg'))

      Text($r('app.string.history_note'))
        .fontSize(12)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.qos_page_bg'))
  }
}
