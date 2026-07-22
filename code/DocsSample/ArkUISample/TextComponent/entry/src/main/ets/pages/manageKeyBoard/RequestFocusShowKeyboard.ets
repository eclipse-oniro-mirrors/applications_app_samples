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
// [Start requestFocus_ShowKeyboard]
struct requestFocusShowKeyboard {
  controller: TextInputController = new TextInputController();
  @State inputValue: string = '';

  build() {
    NavDestination() {
      Column({ space: 20 }) {
        Button('输入框请求焦点').onClick(() => {
          this.getUIContext().getFocusController().requestFocus('textInput1')
        })
        TextInput({ controller: this.controller, text: this.inputValue })
          .id('textInput1')
      }
      .height('100%')
      .width('80%')
      .margin('10%')
      .justifyContent(FlexAlign.Center)
    }
  }
}
// [End requestFocus_ShowKeyboard]

export { requestFocusShowKeyboard };
