/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

// [Start Styles_Version_Condition]
const lowVersionStyleText: string = 'Lower version performance';
const hightVersionStylesText: string = 'Higher version performance';

// 低版本适配样式：仅在系统版本大于等于Api Version 12且小于Api Version 18时生效
// '5.0.0'与12、'12'写法等价，均表示系统版本5.0.0
@Styles({ minApiVersion: '5.0.0', maxApiVersion: '26.0.0' })
function lowVersionStyle() {
  .backgroundColor('#f7ce00')
  .width('90%')
  .height(60)
}

// 高版本样式：仅在系统版本大于等于Api Version 26.0.0时生效
@Styles({ minApiVersion: '26.0.0' })
function highVersionStyle() {
  .backgroundColor('#64bb5c')
  .width('90%')
  .height(60)
}

@Entry
@Component
struct VersionConditionUseDemo {
  build() {
    Column({ space: 30 }) {
      Text(lowVersionStyleText)
        .lowVersionStyle()
      Text(hightVersionStylesText)
        .highVersionStyle()
    }
    .width('90%')
    .margin(20)
    .borderWidth(1)
  }
}
// [End Styles_Version_Condition]