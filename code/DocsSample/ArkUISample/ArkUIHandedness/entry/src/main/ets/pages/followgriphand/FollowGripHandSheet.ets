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

// [Start follow_grip_hand_import]
import { HandednessFollowMode } from '@kit.ArkUI';
// [End follow_grip_hand_import]

@Entry
@Component
struct FollowGripHandSheet {
  @State isShow: boolean = false;

  // [Start follow_grip_hand_sheet_builder]
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
  // [End follow_grip_hand_sheet_builder]

  build() {
    Column() {
      Row() {
        Button('Open sheet on left')
          .id('grip_hand_sheet_left')
          .onClick(() => {
            this.isShow = true;
          })
          .fontSize(20)
          .margin(10)
          // [Start follow_grip_hand_sheet]
          .bindSheet($$this.isShow, this.myBuilder(), {
            preferType: SheetType.CENTER,
            width: 400,
            showClose: true,
            title: { title: 'title', subtitle: 'subtitle' },
            adaptToHandedness: HandednessFollowMode.FOLLOW_GRIP_HAND,
          })
          // [End follow_grip_hand_sheet]

        Button('Open sheet in center')
          .id('grip_hand_sheet_center')
          .onClick(() => {
            this.isShow = true;
          })
          .fontSize(20)
          .margin(10)

        Button('Open sheet on right')
          .id('grip_hand_sheet_right')
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
