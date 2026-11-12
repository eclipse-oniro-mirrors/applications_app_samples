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

@Entry
@Component
struct Index {
  @State status: string = 'Screenshot test ability ready';

  build() {
    Column() {
      Text(this.status)
        .fontSize(24)
        .fontColor('#FFFFFF')
        .textAlign(TextAlign.Center)
      Text('Capture suites are executed by OpenHarmonyTestRunner')
        .fontSize(16)
        .fontColor('#CCCCCC')
        .margin({ top: 12 })
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#000000')
  }
}
