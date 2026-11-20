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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { ConcurrentReport } from 'libentry.so';
import { buildQosLevelOptions, QosLevelOption } from '../model/QosLevelModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkQosConcurrent]';
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;

@Entry
@Component
struct ConcurrencyPage {
  private levelOptions: QosLevelOption[] = buildQosLevelOptions();
  private threadOptions: number[] = [1, 2, 4, 8];
  private roundOptions: number[] = [1, 3, 5];
  @State selectedLevel: number = 5;
  @State threads: number = 1;
  @State rounds: number = 1;
  @State busy: boolean = false;
  @State statusText: Resource = $r('app.string.concurrency_status_idle');
  @State successCount: number = 0;
  @State failCount: number = 0;
  @State avgDuration: number = INVALID_DURATION;
  @State minDuration: number = INVALID_DURATION;
  @State maxDuration: number = INVALID_DURATION;
  @State totalRequested: number = 0;

  private applyReport(report: ConcurrentReport): void {
    this.successCount = report.successCount;
    this.failCount = report.failCount;
    this.avgDuration = report.avgDuration;
    this.minDuration = report.minDuration;
    this.maxDuration = report.maxDuration;
    this.totalRequested = report.threads * report.rounds;
  }

  private async runStress(): Promise<void> {
    if (this.busy) {
      return;
    }
    this.busy = true;
    this.statusText = $r('app.string.concurrency_status_running');
    try {
      const report: ConcurrentReport =
        await testNapi.runConcurrentAsync(this.selectedLevel, this.threads, this.rounds);
      this.applyReport(report);
      this.statusText =
        report.code === 0 ? $r('app.string.concurrency_status_done') : $r('app.string.concurrency_status_failed');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'stress test rejected, level: %{public}d, threads: %{public}d',
        this.selectedLevel, this.threads);
      this.successCount = 0;
      this.failCount = 0;
      this.avgDuration = INVALID_DURATION;
      this.minDuration = INVALID_DURATION;
      this.maxDuration = INVALID_DURATION;
      this.totalRequested = 0;
      this.statusText = $r('app.string.concurrency_status_rejected');
    }
    this.busy = false;
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
        Text($r('app.string.concurrency_title'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.qos_text_primary'))
          .layoutWeight(1)
      }
      .width('100%')

      Text($r('app.string.concurrency_level_label'))
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

      Text(this.levelOptions[this.selectedLevel].label)
        .fontSize(12)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.concurrency_threads_label'))
          .fontSize(14)
          .fontColor($r('app.color.qos_text_secondary'))
          .layoutWeight(1)
        ForEach(this.threadOptions, (thread: number) => {
          Button(thread.toString(), { type: ButtonType.Normal })
            .height(32)
            .width(44)
            .borderRadius(8)
            .fontSize(13)
            .fontColor(this.threads === thread ? $r('app.color.qos_text_light') : $r('app.color.qos_text_primary'))
            .backgroundColor(this.threads === thread ? $r('app.color.qos_button_selected') :
              $r('app.color.qos_button_bg'))
            .enabled(!this.busy)
            .onClick(() => {
              this.threads = thread;
            })
        }, (thread: number) => thread.toString())
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.concurrency_rounds_label'))
          .fontSize(14)
          .fontColor($r('app.color.qos_text_secondary'))
          .layoutWeight(1)
        ForEach(this.roundOptions, (round: number) => {
          Button(round.toString(), { type: ButtonType.Normal })
            .height(32)
            .width(44)
            .borderRadius(8)
            .fontSize(13)
            .fontColor(this.rounds === round ? $r('app.color.qos_text_light') : $r('app.color.qos_text_primary'))
            .backgroundColor(this.rounds === round ? $r('app.color.qos_button_selected') :
              $r('app.color.qos_button_bg'))
            .enabled(!this.busy)
            .onClick(() => {
              this.rounds = round;
            })
        }, (round: number) => round.toString())
      }
      .width('100%')

      Blank()

      Button($r('app.string.concurrency_btn_run'), { type: ButtonType.Normal })
        .height(40)
        .width('100%')
        .borderRadius(8)
        .fontWeight(FontWeight.Bold)
        .backgroundColor($r('app.color.qos_button_selected'))
        .fontColor($r('app.color.qos_text_light'))
        .enabled(!this.busy)
        .onClick(() => {
          this.runStress();
        })

      Text(this.statusText)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_primary'))
        .width('100%')

      Column({ space: 4 }) {
        Row() {
          Text($r('app.string.concurrency_total'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.totalRequested.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.concurrency_pass'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.successCount.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.concurrency_fail'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.failCount.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.concurrency_avg'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.avgDuration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.concurrency_min'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.minDuration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.concurrency_max'))
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

      Text($r('app.string.concurrency_note'))
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
