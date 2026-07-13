'use static'

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

// [Start navigation_page]
// entry\src\main\ets\pages\NavigationPage.ets
import {
  Entry,
  Builder,
  Button,
  ClickEvent,
  Column,
  Component,
  NavPathStack,
  Navigation,
  NavPathInfo,
  NavDestination,
} from '@kit.ArkUI';
import { PageOne } from 'library';

let pathStack: NavPathStack = new NavPathStack()

@Entry
@Component
struct NavigationPage {
  @Builder
  PageBuilder(name: string, param: Object | null | undefined) {
    if (name == "PageOne") {
      PageOne()
    }
  }

  build() {
    Navigation(pathStack) {
      Column() {
        Button(`pushPath`)
          .width('80%')
          .height(40)
          .margin(10)
          .onClick((e?: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("PageOne", new Object())
            pathStack.pushPath(info)
          })
      }
    }
    .navDestination(this.PageBuilder)
    .title('PageHome')
    .height("100%")
  }
}
// [End navigation_page]