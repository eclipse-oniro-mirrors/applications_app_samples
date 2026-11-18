/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so';

const QOS_LEVEL_PAGE: string = 'pages/QosLevelPage';
const BENCHMARK_PAGE: string = 'pages/BenchmarkPage';
const CONCURRENCY_PAGE: string = 'pages/ConcurrencyPage';
const DEVICE_INFO_PAGE: string = 'pages/DeviceInfoPage';
const HISTORY_PAGE: string = 'pages/HistoryPage';

@Entry
@Component
struct Index {
  @State message: ResourceStr = $r('app.string.index_title');

  // 带参数的文案走字符串资源格式化，避免在页面里拼接标点和单位
  private formatDuration(text: Resource, value: string): string {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    return context.resourceManager.getStringSync(text.id, value);
  }

  private showResult(title: ResourceStr, message: string): void {
    this.getUIContext().showAlertDialog({
      title: title,
      message: message,
      alignment: DialogAlignment.Center,
      confirm: {
        value: $r('app.string.common_ok'),
        action: () => {
        }
      }
    });
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Scroll() {
          Column({ space: 12 }) {
            Button($r('app.string.index_btn_high_qos'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                let ret: string = testNapi.useHighQos().toString();
                this.showResult(this.message, this.formatDuration($r('app.string.index_msg_high'), ret));
              })

            Button($r('app.string.index_btn_low_qos'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                let ret: string = testNapi.useLowQos().toString();
                this.showResult(this.message, this.formatDuration($r('app.string.index_msg_low'), ret));
              })

            Button($r('app.string.index_btn_qos_level'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: QOS_LEVEL_PAGE });
              })

            Button($r('app.string.index_btn_benchmark'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: BENCHMARK_PAGE });
              })

            Button($r('app.string.index_btn_concurrency'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: CONCURRENCY_PAGE });
              })

            Button($r('app.string.index_btn_device_info'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: DEVICE_INFO_PAGE });
              })

            Button($r('app.string.index_btn_history'), { type: ButtonType.Normal })
              .height(44)
              .width('80%')
              .borderRadius(8)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r('app.color.qos_button_bg'))
              .fontColor($r('app.color.qos_text_primary'))
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: HISTORY_PAGE });
              })
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)
        .align(Alignment.Top)
      }
      .width('100%')
      .height('100%')
      .padding({ top: 40, bottom: 20 })
    }
    .height('100%')
  }
}
