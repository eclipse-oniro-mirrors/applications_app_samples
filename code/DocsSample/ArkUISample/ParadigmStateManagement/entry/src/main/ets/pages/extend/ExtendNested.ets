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

@Component
export struct LocalExtendNested {
  @State egLanes: LengthConstrain = { minLength: 200, maxLength: 300 };

  build() {
    NavDestination() {
      NestedExtendUseDemo()
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.extend_nested'))
  }
}

// [Start Extend_Nested]
// 公共样式：不携带版本条件，在全部系统版本上生效
@Extend(Text)
function commonTextStyle() {
  .fontSize(16)
  .padding(10)
}

// 低版本样式：仅在系统版本大于等于12且小于26.0.0时生效
@Extend(Text, { minApiVersion: 12, maxApiVersion: '26.0.0' })
function lowVersionTextStyle() {
  .fontColor(Color.Gray)
}

// 高版本样式：仅在系统版本大于等于26.0.0时生效
@Extend(Text, { minApiVersion: '26.0.0' })
function highVersionTextStyle() {
  .fontColor(Color.Blue)
  .fontWeight(700)
}

// 嵌套样式：同时嵌套调用公共样式、低版本样式与高版本样式，设备系统版本位于对应区间时自动呈现相应样式
@Extend(Text)
function nestedTextStyle() {
  .commonTextStyle()
  .lowVersionTextStyle()
  .highVersionTextStyle()
}

@Entry
@Component
struct NestedExtendUseDemo {
  build() {
    Column({ space: 30 }) {
      Text('FancyA')
        .nestedTextStyle()
    }
    .width('90%')
    .margin(20)
    .borderWidth(1)
  }
}
// [End Extend_Nested]
