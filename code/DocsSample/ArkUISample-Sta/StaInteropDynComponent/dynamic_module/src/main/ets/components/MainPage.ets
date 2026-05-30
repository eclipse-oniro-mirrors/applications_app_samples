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

// [Start StaDynComponentMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct ChildComponent {
  message: string = 'Hello World!';

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@ComponentV2
export struct ChildComponentV2 {
  message: string = 'Hello WorldV2!';

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
// [End StaDynComponentMainPage]
