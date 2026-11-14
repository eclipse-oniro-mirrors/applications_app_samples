/*
 * Copyright (c) 2022-2026 Sample Device Co., Ltd.
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

import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = 'BrowserTestIndex';

/**
 * Placeholder page of the ohosTest ability.
 *
 * The real assertions run in the hypium suites; this page only proves that the
 * test ability owns a working window stage.
 */
@Entry
@Component
struct Index {
  @State message: string = 'Browser test runner';
  @State detail: string = 'Executing ohosTest suites';

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'test page aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'test page aboutToDisappear');
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 24, bottom: 12 })
      Text(this.detail)
        .fontSize(16)
        .margin({ bottom: 8 })
      Divider()
        .color('#c6c6c6')
        .width('80%')
      Text('See hilog tag BrowserTest for details')
        .fontSize(14)
        .margin({ top: 12 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
