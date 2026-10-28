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
// [Start Extend_Version_Condition]
const lowVersionExtendText: string = 'Lower version performance';
const hightVersionExtendText: string = 'Higher version performance';

// 低版本适配样式：仅在系统版本大于等于Api version 12且小于Api version 26.0.0时生效
@Extend(Text, { minApiVersion: 12, maxApiVersion: '26.0.0' })
function lowVersionText(color: Color) {
  .fontColor(color)
  .fontSize(16)
}

// 高版本样式：仅在系统版本大于等于Api version 26.0.0时生效
@Extend(Text, { minApiVersion: '26.0.0' })
function highVersionText(color: Color) {
  .fontColor(color)
  .fontSize(20)
  .fontWeight(700)
}

@Entry
@Component
struct VersionConditionUseDemo {
  build() {
    Column({ space: 30 }) {
      Text(lowVersionExtendText)
        .lowVersionText(Color.Gray)
      Text(hightVersionExtendText)
        .highVersionText(Color.Blue)
    }
    .width('90%')
    .height(80)
    .margin(20)
    .borderWidth(1)
  }
}
// [End Extend_Version_Condition]