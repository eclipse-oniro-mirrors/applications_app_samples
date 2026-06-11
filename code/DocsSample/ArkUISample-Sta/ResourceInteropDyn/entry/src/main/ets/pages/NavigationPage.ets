/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start navigation]
// entry\src\main\ets\pages\NavigationPage.ets
import { PageOne } from 'library';

@Entry
@Component
struct NavigationPage {
  @Builder
  PageBuilder(name: string, param: Object | null | undefined) {
    if (name == "PageOne") {
      PageOne()
    }
  }
  @State pathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pathStack) {
      Column() {
        Button(`pushPath`)
          .width('80%')
          .height(40)
          .margin(10)
          .onClick((e?: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("PageOne", undefined)
            this.pathStack.pushPath(info)
          })
      }
    }
    .navDestination(this.PageBuilder)
    .title('PageHome')
    .height("100%")
  }
}
// [End navigation]