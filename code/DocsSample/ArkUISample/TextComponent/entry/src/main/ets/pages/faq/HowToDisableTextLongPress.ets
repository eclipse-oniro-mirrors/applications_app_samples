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

// [Start How_To_Disable_Text_Long_Press]
@Entry
@Component
export struct HowToDisableTextLongPressExample {
  build() {
    NavDestination() {
      Column() {
        Text('TextTextTextText')
          .copyOption(CopyOptions.InApp)
          .gesture(LongPressGesture({ repeat: false, duration: 400 })
            .onAction(() => {
            }))
          .margin({
            top: 100,
            bottom: 100,
            left: 100,
            right: 100
          })
      }
      .height('100%')
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.How_To_Disable_Text_Long_Press'))
  }
}
// [End How_To_Disable_Text_Long_Press]
