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

/**
 * Placeholder page of the test ability; the real cases run inside the sample ability.
 */
@Entry
@Component
struct Index {
  /**
   * Builds the placeholder layout with a single centred hint text.
   */
  build() {
    // Full screen column centring its child.
    Column() {
      // Hint text proving that the page was loaded.
      Text('TestAbility placeholder')
        // Font size of the hint text.
        .fontSize('20fp')
        // Foreground colour of the hint text.
        .fontColor('#FF000000')
    }
    // Full screen geometry of the column.
    .width('100%')
    .height('100%')
    // Centre the child vertically and horizontally.
    .justifyContent(FlexAlign.Center)
  }
}
