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
import { QosRunInfo } from 'libentry.so';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkQosPage]';
const INVALID_RESULT: number = -1;

class QosLevelOption {
  public level: number;
  public label: Resource;

  constructor(level: number, label: Resource) {
    this.level = level;
    this.label = label;
  }
}

@Entry
@Component
struct QosLevelPage {
  private options: QosLevelOption[] = [
    new QosLevelOption(0, $r('app.string.qos_level_background')),
    new QosLevelOption(1, $r('app.string.qos_level_utility')),
    new QosLevelOption(2, $r('app.string.qos_level_default')),
    new QosLevelOption(3, $r('app.string.qos_level_user_initiated')),
    new QosLevelOption(4, $r('app.string.qos_level_deadline_request')),
    new QosLevelOption(5, $r('app.string.qos_level_user_interactive'))
  ];
  @State selectedLevel: number = 5;
  @State duration: number = INVALID_RESULT;
  @State setResult: number = INVALID_RESULT;
  @State queryLevel: number = INVALID_RESULT;
  @State resetResult: number = INVALID_RESULT;
  @State bindResult: number = INVALID_RESULT;
  @State statusText: Resource = $r('app.string.qos_status_idle');
  @State busy: boolean = false;

  private applyRunInfo(info: QosRunInfo): void {
    this.setResult = info.setResult;
    this.queryLevel = info.queryLevel;
    this.resetResult = info.resetResult;
    this.bindResult = info.bindResult;
    this.duration = info.duration;
  }

  private async runSelected(): Promise<void> {
    if (this.busy) {
      return;
    }
    this.busy = true;
    this.statusText = $r('app.string.qos_status_running');
    try {
      const duration: number = await testNapi.useQosAsync(this.selectedLevel);
      this.applyRunInfo(testNapi.getLastQosInfo());
      this.duration = duration;
      this.statusText = duration >= 0 ? $r('app.string.qos_status_done') : $r('app.string.qos_status_failed');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'async qos task rejected, level: %{public}d', this.selectedLevel);
      this.duration = INVALID_RESULT;
      this.statusText = $r('app.string.qos_status_invalid');
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
        Text($r('app.string.qos_level_title'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.qos_text_primary'))
          .layoutWeight(1)
      }
      .width('100%')

      Text($r('app.string.qos_level_label'))
        .fontSize(14)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')

      Scroll() {
        Column({ space: 8 }) {
          ForEach(this.options, (option: QosLevelOption) => {
            Button(option.label, { type: ButtonType.Normal })
              .height(38)
              .width('100%')
              .borderRadius(8)
              .fontSize(14)
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
      }
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)

      Button($r('app.string.qos_btn_run'), { type: ButtonType.Normal })
        .height(40)
        .width('100%')
        .borderRadius(8)
        .fontWeight(FontWeight.Bold)
        .backgroundColor($r('app.color.qos_button_selected'))
        .fontColor($r('app.color.qos_text_light'))
        .enabled(!this.busy)
        .onClick(() => {
          this.runSelected();
        })

      Text(this.statusText)
        .fontSize(14)
        .fontColor($r('app.color.qos_text_primary'))
        .width('100%')

      Column({ space: 4 }) {
        Row() {
          Text($r('app.string.qos_info_set'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.setResult.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.qos_info_query'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.queryLevel.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.qos_info_reset'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.resetResult.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.qos_info_bind'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.bindResult.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.qos_info_duration'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.duration.toFixed(2))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')
      }
      .width('100%')
      .padding(10)
      .borderRadius(8)
      .backgroundColor($r('app.color.qos_card_bg'))

      Text($r('app.string.qos_note'))
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
