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
// [Start empty_CustomKeyboard]
struct emptyCustomKeyboard {
  controller: TextInputController = new TextInputController();
  @State inputValue: string = '';

  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
    }
  }

  build() {
    NavDestination() {
      Column() {
        TextInput({ placeholder: 'TextInput', controller: this.controller, text: this.inputValue })// 绑定自定义键盘
          .customKeyboard(this.CustomKeyboardBuilder())
      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .margin('10%')
      .height('100%')
    }
  }
}
// [End empty_CustomKeyboard]

export { emptyCustomKeyboard };
