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

// Section card container
@Component
export struct SectionCard {
  title: ResourceStr = '';
  testId: string = '';
  @BuilderParam content: () => void;

  build() {
    Column() {
      if (this.title !== '') {
        Text(this.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .margin({ bottom: 12 })
          .alignSelf(ItemAlign.Start)
      }
      this.content()
    }
    .id(this.testId)
    .width('100%')
    .padding(16)
    .margin({ bottom: 12 })
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#08000000', offsetY: 2 })
  }
}

// Top navigation bar
@Component
export struct NavBar {
  title: ResourceStr = '';
  onBack?: () => void = undefined;

  build() {
    Row() {
      Row() {
        Text('‹')
          .fontSize(28)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
      .id('btn_nav_back')
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .borderRadius(20)
      .backgroundColor('#20FFFFFF')
      .onClick(() => {
        if (this.onBack) {
          this.onBack();
        }
      })

      Text(this.title)
        .id('nav_title_text')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin({ left: 12 })
        .layoutWeight(1)
    }
    .width('100%')
    .padding({ top: 12, bottom: 12, left: 16, right: 16 })
    .linearGradient({
      angle: 135,
      colors: [[$r('app.color.color_primary'), 0.0], [$r('app.color.color_primary_dark'), 1.0]]
    })
  }
}

// Label-value row for displaying a piece of read-only data
@Component
export struct LabelRow {
  @Prop label: ResourceStr = '';
  @Prop value: ResourceStr = '';

  build() {
    Row() {
      Text(this.label)
        .fontSize(14)
        .fontColor($r('app.color.text_hint'))
        .layoutWeight(1)
      Text(this.value)
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .textAlign(TextAlign.End)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .padding({ top: 6, bottom: 6 })
  }
}

// Log area
@Component
export struct LogArea {
  @Prop logMessages: string[] = [];

  build() {
    Column() {
      Text($r('app.string.operation_log'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 8 })
      if (this.logMessages.length === 0) {
        Text($r('app.string.no_logs_yet'))
          .fontSize(14)
          .fontColor($r('app.color.text_light'))
      } else {
        Scroll() {
          Column() {
            ForEach(this.logMessages, (msg: string) => {
              Text(msg)
                .fontSize(12)
                .fontColor($r('app.color.divider'))
                .fontFamily('monospace')
                .margin({ bottom: 2 })
                .width('100%')
            })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .height(200)
        .backgroundColor('#2D2D2D')
        .borderRadius(8)
        .padding(12)
      }
    }
    .width('100%')
  }
}

// Maximum number of log messages kept on each page
export const MAX_LOG_MESSAGES: number = 50;
