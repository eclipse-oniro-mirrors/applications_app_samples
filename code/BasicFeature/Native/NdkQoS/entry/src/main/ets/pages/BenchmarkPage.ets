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
import { BenchmarkReport, LevelSample, RunSummary } from 'libentry.so';
import { buildQosLevelOptions, QosLevelOption } from '../model/QosLevelModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkQosBench]';
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;

class BenchSample {
  public level: number;
  public successCount: number;
  public failCount: number;
  public avgDuration: number;
  public minDuration: number;
  public maxDuration: number;

  constructor(level: number, successCount: number, failCount: number, avgDuration: number, minDuration: number,
    maxDuration: number) {
    this.level = level;
    this.successCount = successCount;
    this.failCount = failCount;
    this.avgDuration = avgDuration;
    this.minDuration = minDuration;
    this.maxDuration = maxDuration;
  }
}

@Entry
@Component
struct BenchmarkPage {
  private levelOptions: QosLevelOption[] = buildQosLevelOptions();
  private roundOptions: number[] = [1, 2, 3];
  @State rounds: number = 1;
  @State busy: boolean = false;
  @State statusText: Resource = $r('app.string.bench_status_idle');
  @State samples: BenchSample[] = [];
  @State fastestLevel: number = INVALID_RESULT;
  @State slowestLevel: number = INVALID_RESULT;
  @State totalRuns: number = 0;
  @State summaryRunCount: number = 0;
  @State summaryLastLevel: number = INVALID_RESULT;
  @State summaryAvg: number = INVALID_DURATION;
  @State summaryMin: number = INVALID_DURATION;
  @State summaryMax: number = INVALID_DURATION;

  private labelFor(level: number): Resource {
    for (let index = 0; index < this.levelOptions.length; index++) {
      if (this.levelOptions[index].level === level) {
        return this.levelOptions[index].label;
      }
    }
    return $r('app.string.qos_level_default');
  }

  private applyReport(report: BenchmarkReport): void {
    const rows: BenchSample[] = [];
    for (let index = 0; index < report.samples.length; index++) {
      const sample: LevelSample = report.samples[index];
      rows.push(new BenchSample(sample.level, sample.successCount, sample.failCount, sample.avgDuration,
        sample.minDuration, sample.maxDuration));
    }
    this.samples = rows;
    this.fastestLevel = report.fastestLevel;
    this.slowestLevel = report.slowestLevel;
    this.totalRuns = report.totalRuns;
  }

  private applySummary(summary: RunSummary): void {
    this.summaryRunCount = summary.runCount;
    this.summaryLastLevel = summary.lastLevel;
    this.summaryAvg = summary.avgDuration;
    this.summaryMin = summary.minDuration;
    this.summaryMax = summary.maxDuration;
  }

  private async runBenchmark(): Promise<void> {
    if (this.busy) {
      return;
    }
    this.busy = true;
    this.statusText = $r('app.string.bench_status_running');
    try {
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(this.rounds);
      this.applyReport(report);
      this.applySummary(testNapi.getRunSummary());
      this.statusText = report.code === 0 ? $r('app.string.bench_status_done') : $r('app.string.bench_status_failed');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'benchmark rejected, rounds: %{public}d', this.rounds);
      this.statusText = $r('app.string.bench_status_rejected');
    }
    this.busy = false;
  }

  private resetSummary(): void {
    testNapi.resetRunSummary();
    this.applySummary(testNapi.getRunSummary());
    this.samples = [];
    this.totalRuns = 0;
    this.fastestLevel = INVALID_RESULT;
    this.slowestLevel = INVALID_RESULT;
    this.statusText = $r('app.string.bench_status_idle');
  }

  @Builder
  private summaryRow(label: Resource, value: string) {
    Row() {
      Text(label)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_secondary'))
        .layoutWeight(1)
      Text(value)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_primary'))
    }
    .width('100%')
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
        Text($r('app.string.bench_title'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.qos_text_primary'))
          .layoutWeight(1)
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.bench_rounds_label'))
          .fontSize(14)
          .fontColor($r('app.color.qos_text_secondary'))
          .layoutWeight(1)
        ForEach(this.roundOptions, (round: number) => {
          Button(round.toString(), { type: ButtonType.Normal })
            .height(32)
            .width(48)
            .borderRadius(8)
            .fontSize(14)
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

      if (this.samples.length === 0) {
        Text($r('app.string.bench_empty'))
          .fontSize(13)
          .fontColor($r('app.color.qos_text_secondary'))
          .width('100%')
          .layoutWeight(1)
      } else {
        Scroll() {
          Column({ space: 8 }) {
            Row({ space: 4 }) {
              Text($r('app.string.bench_col_level'))
                .fontSize(12)
                .fontColor($r('app.color.qos_text_secondary'))
                .layoutWeight(2)
              Text($r('app.string.bench_col_avg'))
                .fontSize(12)
                .fontColor($r('app.color.qos_text_secondary'))
                .layoutWeight(2)
              Text($r('app.string.bench_col_pass'))
                .fontSize(12)
                .fontColor($r('app.color.qos_text_secondary'))
                .layoutWeight(1)
              Text($r('app.string.bench_col_fail'))
                .fontSize(12)
                .fontColor($r('app.color.qos_text_secondary'))
                .layoutWeight(1)
            }
            .width('100%')

            ForEach(this.samples, (sample: BenchSample) => {
              Column({ space: 2 }) {
                Row({ space: 4 }) {
                  Text(this.labelFor(sample.level))
                    .fontSize(13)
                    .fontColor($r('app.color.qos_text_primary'))
                    .layoutWeight(2)
                  Text(sample.avgDuration.toFixed(2))
                    .fontSize(13)
                    .fontColor($r('app.color.qos_text_primary'))
                    .layoutWeight(2)
                  Text(sample.successCount.toString())
                    .fontSize(13)
                    .fontColor($r('app.color.qos_text_primary'))
                    .layoutWeight(1)
                  Text(sample.failCount.toString())
                    .fontSize(13)
                    .fontColor($r('app.color.qos_text_primary'))
                    .layoutWeight(1)
                }
                .width('100%')
                Row({ space: 4 }) {
                  Text($r('app.string.bench_col_min'))
                    .fontSize(11)
                    .fontColor($r('app.color.qos_text_secondary'))
                    .layoutWeight(1)
                  Text(sample.minDuration.toFixed(2))
                    .fontSize(11)
                    .fontColor($r('app.color.qos_text_secondary'))
                    .layoutWeight(2)
                  Text($r('app.string.bench_col_max'))
                    .fontSize(11)
                    .fontColor($r('app.color.qos_text_secondary'))
                    .layoutWeight(1)
                  Text(sample.maxDuration.toFixed(2))
                    .fontSize(11)
                    .fontColor($r('app.color.qos_text_secondary'))
                    .layoutWeight(2)
                }
                .width('100%')
              }
              .width('100%')
              .padding(8)
              .borderRadius(8)
              .backgroundColor($r('app.color.qos_card_bg'))
            }, (sample: BenchSample) => sample.level.toString())
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)
        .align(Alignment.TopStart)
      }

      Button($r('app.string.bench_btn_run'), { type: ButtonType.Normal })
        .height(40)
        .width('100%')
        .borderRadius(8)
        .fontWeight(FontWeight.Bold)
        .backgroundColor($r('app.color.qos_button_selected'))
        .fontColor($r('app.color.qos_text_light'))
        .enabled(!this.busy)
        .onClick(() => {
          this.runBenchmark();
        })

      Text(this.statusText)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_primary'))
        .width('100%')

      Column({ space: 4 }) {
        this.summaryRow($r('app.string.bench_summary_runs'), this.summaryRunCount.toString())
        this.summaryRow($r('app.string.bench_summary_last'), this.summaryLastLevel.toString())
        this.summaryRow($r('app.string.bench_summary_avg'), this.summaryAvg.toFixed(2))
        this.summaryRow($r('app.string.bench_summary_min'), this.summaryMin.toFixed(2))
        this.summaryRow($r('app.string.bench_summary_max'), this.summaryMax.toFixed(2))
        this.summaryRow($r('app.string.bench_summary_fastest'), this.fastestLevel.toString())
        this.summaryRow($r('app.string.bench_summary_slowest'), this.slowestLevel.toString())
        this.summaryRow($r('app.string.bench_summary_total'), this.totalRuns.toString())
      }
      .width('100%')
      .padding(10)
      .borderRadius(8)
      .backgroundColor($r('app.color.qos_card_bg'))

      Row({ space: 8 }) {
        Button($r('app.string.bench_btn_refresh'), { type: ButtonType.Normal })
          .height(36)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .enabled(!this.busy)
          .onClick(() => {
            this.applySummary(testNapi.getRunSummary());
          })
        Button($r('app.string.bench_btn_reset'), { type: ButtonType.Normal })
          .height(36)
          .layoutWeight(1)
          .borderRadius(8)
          .fontSize(13)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .enabled(!this.busy)
          .onClick(() => {
            this.resetSummary();
          })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.qos_page_bg'))
  }
}
