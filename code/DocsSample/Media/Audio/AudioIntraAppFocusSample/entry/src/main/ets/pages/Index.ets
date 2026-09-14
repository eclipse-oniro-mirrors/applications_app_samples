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
import { router, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { InterruptMode, SCENARIO_LIST, ScenarioItem } from '../common/constants/AudioConstants';

const TOAST_DURATION = 2000;

@Entry
@Component
struct Index {
  @State currentMode: InterruptMode = InterruptMode.SHARE_MODE;
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })

      Text($r('app.string.page_subtitle'))
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Column() {
        Row() {
          Text($r('app.string.focus_mode_label'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)

          Blank()

          Row() {
            Button($r('app.string.share_mode_btn'))
              .fontSize(12)
              .height(36)
              .backgroundColor(this.currentMode === InterruptMode.SHARE_MODE ? '#4CAF50' : '#E0E0E0')
              .fontColor(this.currentMode === InterruptMode.SHARE_MODE ? '#FFFFFF' : '#333333')
              .margin({ right: 8 })
              .onClick(() => {
                this.currentMode = InterruptMode.SHARE_MODE;
              })

            Button($r('app.string.independent_mode_btn'))
              .fontSize(12)
              .height(36)
              .backgroundColor(this.currentMode === InterruptMode.INDEPENDENT_MODE ? '#F44336' : '#E0E0E0')
              .fontColor(this.currentMode === InterruptMode.INDEPENDENT_MODE ? '#FFFFFF' : '#333333')
              .onClick(() => {
                this.currentMode = InterruptMode.INDEPENDENT_MODE;
              })
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12, bottom: 12 })

        Divider().color('#E0E0E0')

        Row() {
          Text(this.currentMode === InterruptMode.SHARE_MODE
            ? $r('app.string.share_mode_desc')
            : $r('app.string.independent_mode_desc'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.currentMode === InterruptMode.SHARE_MODE ? '#4CAF50' : '#F44336')
          Blank()
          Text(this.currentMode === InterruptMode.SHARE_MODE
            ? $r('app.string.share_mode_detail')
            : $r('app.string.independent_mode_detail'))
            .fontSize(12)
            .fontColor('#666')
            .width('60%') // Limit detail text width for readability
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12, bottom: 12 })
      }
      .width('100%')
      .backgroundColor('#FAFAFA')
      .borderRadius(12)
      .margin({ left: 16, right: 16, bottom: 20 })

      Text($r('app.string.scenario_label'))
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 12 })

      List({ space: 12 }) {
        ForEach(SCENARIO_LIST, (item: ScenarioItem) => {
          ListItem() {
            Row() {
              Column() {
                Text(item.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                Text(item.desc)
                  .fontSize(12)
                  .fontColor('#666')
                  .margin({ top: 4 })
              }
              .alignItems(HorizontalAlign.Start)

              Blank()

              Button($r('app.string.enter_btn'))
                .fontSize(14)
                .height(36)
                .backgroundColor('#0A59F7')
                .fontColor('#FFFFFF')
                .borderRadius(18)
                .onClick(() => {
                  router.pushUrl({
                    url: item.page,
                    params: { interruptMode: this.currentMode }
                  }).catch((err: BusinessError) => {
                    this.promptAction.showToast({
                      message: $r('app.string.page_open_failed'),
                      duration: TOAST_DURATION
                    });
                  });
                })
            }
            .width('100%')
            .padding(16)
            .backgroundColor('#FAFAFA')
            .borderRadius(12)
          }
        }, (item: ScenarioItem) => item.id)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
