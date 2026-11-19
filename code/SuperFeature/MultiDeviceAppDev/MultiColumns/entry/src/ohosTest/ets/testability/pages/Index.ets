/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns]';
// 测试承载页专用字号，避免与 main 模块样式令牌耦合
const TEST_PAGE_TITLE_FONT: number = 50;
const TEST_PAGE_BUTTON_FONT: number = 20;

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State message: Resource = $r('app.string.test_page_message');

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(TEST_PAGE_TITLE_FONT)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text($r('app.string.test_page_next'))
            .fontSize(TEST_PAGE_BUTTON_FONT)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor($r('app.color.activity_button_background'))
        .width('35%')
        .height('5%')
        .onClick(() => {
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
