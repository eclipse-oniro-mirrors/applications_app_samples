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
// [Start keepEditableState_OnSubmit]
struct keepEditableStateOnSubmit {
  build() {
    NavDestination() {
      Column({ space: 20 }) {
        TextArea({ placeholder: '点击发送收起键盘' })
          .enterKeyType(EnterKeyType.Send)

        TextArea({ placeholder: 'onSubmit中设置keepEditableState，点击发送不收起键盘' })
          .enterKeyType(EnterKeyType.Send)
          .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
            // 调用keepEditableState方法，输入框保持编辑态
            event.keepEditableState();
          })
      }
      .justifyContent(FlexAlign.Center)
      .height('100%')
      .width('80%')
      .margin('10%')
    }
  }
}
// [End keepEditableState_OnSubmit]

export { keepEditableStateOnSubmit };
