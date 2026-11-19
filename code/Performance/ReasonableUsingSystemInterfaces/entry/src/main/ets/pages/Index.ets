/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
const TAG = 'Index';

@Entry
@Component
struct Index {
  /**
   * 跳转失败时打印错误信息，避免路由异常时页面没有任何反馈
   */
  private jumpToPage(url: string): void {
    router.pushUrl({ url: url }).catch((error: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to push page %{public}s, code: %{public}d, message: %{public}s',
        url, error.code, error.message);
    })
  }

  build() {
    Scroll() {
      Column() {
        Text('getStringSync(id)')
          .fontSize(32)
          .fontColor(Color.Blue)
          .margin({bottom: 30})
          .onClick(() => {
            this.jumpToPage('pages/GetStringSyncAfter');
          })
        Text('getStringSync(Resource)')
          .fontSize(32)
          .fontColor(Color.Blue)
          .margin({bottom: 30})
          .onClick(() => {
            this.jumpToPage('pages/GetStringSync');
          })
        Text('Using Word Break')
          .fontSize(32)
          .fontColor(Color.Blue)
          .margin({bottom: 30})
          .onClick(() => {
            this.jumpToPage('pages/UsingWordBreak');
          })
        Text('Using Zero Width Space')
          .fontSize(32)
          .fontColor(Color.Blue)
          .margin({bottom: 30})
          .onClick(() => {
            this.jumpToPage('pages/UsingZeroWidthSpace');
          })
        Text('RuntimeInterface')
          .fontSize(32)
          .fontColor(Color.Blue)
          .margin({bottom: 30})
          .onClick(() => {
            this.jumpToPage('pages/RuntimeInterface');
          })
        Text('LocalizationKitInterface')
          .fontSize(32)
          .fontColor(Color.Blue)
          .onClick(() => {
            this.jumpToPage('pages/LocalizationKitInterface');
          })
      }
      .width('100%')
      .padding({ top: 20, bottom: 20 })
    }
    .height('100%')
    .width('100%')
  }
}
