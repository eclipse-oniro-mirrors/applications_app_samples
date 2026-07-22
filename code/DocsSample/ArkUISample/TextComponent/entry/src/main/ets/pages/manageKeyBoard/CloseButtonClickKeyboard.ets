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
// [Start closeButton_ClickKeyboard]
struct closeButtonClickKeyboard {
  build() {
    NavDestination() {
      Column({ space: 20 }) {
        Blank()
          .height(350)
        Flex({ direction: FlexDirection.Row }) {
          TextInput({ placeholder: 'TextInput' })
        }
        .width(250)
      }
      .height('100%')
      .width('90%')
      .padding('5%')
    }
  }
}
// [End closeButton_ClickKeyboard]

export { closeButtonClickKeyboard };
