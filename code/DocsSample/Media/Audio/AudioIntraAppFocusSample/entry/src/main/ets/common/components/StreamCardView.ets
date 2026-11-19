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

@Component
export struct StreamCardView {
  title: string = '';
  @Prop isPlaying: boolean = false;
  @Prop logs: string[] = [];
  idPrefix: string = '';
  onPlayStop: () => void = () => {};
  onClearLog: () => void = () => {};

  build() {
    Column() {
      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 8 })

      Row() {
        Button(this.isPlaying ? $r('app.string.stop_btn') : $r('app.string.play_btn'))
          .id('playStop' + this.idPrefix)
          .fontSize(14)
          .height(40)
          .backgroundColor(this.isPlaying ? '#F44336' : '#4CAF50')
          .fontColor('#FFFFFF')
          .borderRadius(8)
          .onClick(() => {
            this.onPlayStop();
          })

        Button($r('app.string.clear_log_btn'))
          .id('clearLog' + this.idPrefix)
          .fontSize(14)
          .height(40)
          .backgroundColor('#E0E0E0')
          .fontColor('#333')
          .borderRadius(8)
          .margin({ left: 12 })
          .onClick(() => {
            this.onClearLog();
          })
      }
      .margin({ bottom: 8 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#F44336')
              .width('100%')
              .padding(4)
          }, (log: string, index: number) => `${index}`)
        }
      }
      .width('100%')
      .height(80)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin({ left: 16, right: 16, bottom: 12 })
  }
}
