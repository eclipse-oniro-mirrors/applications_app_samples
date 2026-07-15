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

// [Start PageOne]
@Builder
export function PageOneBuilder() {
  PageOne()
}

@Entry
@Component
struct PageOne {
  @State pageStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text(`PageOne`)
          .margin(10)
        Button('PageTwo')
          .margin(10)
          .onClick(() => {
            // 跳转到PageTwo页面
            this.pageStack.pushPath({ name: 'PageTwo' });
          })
          .width('40%')
        Button(`back`)
          .margin(10)
          .onClick(() => {
            // 返回上一页
            this.pageStack.pop();
          })
          .width('40%')
      }
    }
    .onReady((context: NavDestinationContext) => {
      // 页面准备就绪时，获取导航路径栈
      this.pageStack = context.pathStack;
    })
  }
}
// [End PageOne]

@Builder
export function pageOne() {
  NavDestination() {
    PageOne()
  }
}
