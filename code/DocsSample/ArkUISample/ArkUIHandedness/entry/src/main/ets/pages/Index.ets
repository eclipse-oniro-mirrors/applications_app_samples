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

import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_ArkUIHandedness]';

@Entry
@Component
struct Index {
  private toPage(url: string): void {
    hilog.info(DOMAIN, TAG, 'navigate to %{public}s', url);
    router.pushUrl({ url: url });
  }

  build() {
    Column({ space: 12 }) {
      Text('ArkUIHandedness')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })

      Text($r('app.string.follow_anchor_title'))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Button($r('app.string.alert_dialog_entry'))
        .id('entry_follow_anchor_dialog')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/followanchor/FollowAnchorAlertDialog');
        })
      Button($r('app.string.bind_sheet_entry'))
        .id('entry_follow_anchor_sheet')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/followanchor/FollowAnchorSheet');
        })

      Text($r('app.string.follow_grip_hand_title'))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Button($r('app.string.alert_dialog_entry'))
        .id('entry_follow_grip_hand_dialog')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/followgriphand/FollowGripHandAlertDialog');
        })
      Button($r('app.string.bind_sheet_entry'))
        .id('entry_follow_grip_hand_sheet')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/followgriphand/FollowGripHandSheet');
        })

      Text($r('app.string.no_follow_title'))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Button($r('app.string.alert_dialog_entry'))
        .id('entry_no_follow_dialog')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/nofollow/NoFollowAlertDialog');
        })
      Button($r('app.string.bind_sheet_entry'))
        .id('entry_no_follow_sheet')
        .width('80%')
        .fontSize(16)
        .onClick(() => {
          this.toPage('pages/nofollow/NoFollowSheet');
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
