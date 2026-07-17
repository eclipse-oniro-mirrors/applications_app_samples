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

// [Start ComponentActiveLazyCreate]
// Index.ets
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State pageStack: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Navigation(this.pageStack) {
        Text(this.message)
          .margin(10)
        Button(`PageOne`)
          .margin(10)
          .onClick(() => {
            // 跳转到PageOne页面
            this.pageStack.pushPath({ name: 'PageOne' });
          })
          .width('40%')
        Button(`PageTwo`)
          .margin(10)
          .onClick(() => {
            // 跳转到PageTwo页面
            this.pageStack.pushPath({ name: 'PageTwo' });
          })
          .width('40%')
      }
    }
  }
}
// [End ComponentActiveLazyCreate]

@Builder
export function componentActiveLazyCreate() {
  NavDestination() {
    Index()
  }
}
