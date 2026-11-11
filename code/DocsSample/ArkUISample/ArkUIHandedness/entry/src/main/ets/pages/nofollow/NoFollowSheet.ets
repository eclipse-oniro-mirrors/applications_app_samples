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

// [Start no_follow_import]
import { HandednessFollowMode } from '@kit.ArkUI';
// [End no_follow_import]

@Entry
@Component
struct NoFollowSheet {
  @State isShow: boolean = false;

  // [Start no_follow_sheet_builder]
  @Builder
  myBuilder() {
    Column() {
      Text('Sheet Content')
        .margin(20)
        .fontSize(20)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
  // [End no_follow_sheet_builder]

  build() {
    Column() {
      Row() {
        Button('Open sheet on left')
          .id('no_follow_sheet_left')
          .onClick(() => {
            this.isShow = true;
          })
          .fontSize(20)
          .margin(10)
          // [Start no_follow_sheet]
          .bindSheet($$this.isShow, this.myBuilder(), {
            preferType: SheetType.CENTER,
            width: 400,
            showClose: true,
            title: { title: 'title', subtitle: 'subtitle' },
            adaptToHandedness: HandednessFollowMode.NONE,
          })
          // [End no_follow_sheet]

        Button('Open sheet in center')
          .id('no_follow_sheet_center')
          .onClick(() => {
            this.isShow = true;
          })
          .fontSize(20)
          .margin(10)

        Button('Open sheet on right')
          .id('no_follow_sheet_right')
          .onClick(() => {
            this.isShow = true;
          })
          .fontSize(20)
          .margin(10)
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height('50%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
