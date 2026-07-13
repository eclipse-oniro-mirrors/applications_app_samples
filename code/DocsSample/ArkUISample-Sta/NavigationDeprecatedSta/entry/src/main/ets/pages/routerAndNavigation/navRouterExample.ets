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
// [Start navRouter]
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  NavPathStack,
  Navigation,
  NavPathInfo,
  NavDestination,
  State
} from '@kit.ArkUI'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private pageInfos: NavPathStack = new NavPathStack();

  @Builder
  MyPageMap(name: string) {
    if (name === 'pageOne') {
      PageOne()
    } else if (name === 'pageTwo') {
      PageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Text("pageOne").onClick(() => {
        this.pageInfos.pushPath(new NavPathInfo("pageOne", undefined));
      })
      Text("pageTwo").onClick(() => {
        this.pageInfos.pushPath(new NavPathInfo("pageTwo", undefined));
      })
    }.navDestination(this.MyPageMap)
  }
}

@Component
export struct PageOne {
  build(): void {
    NavDestination() {
      Text("当前页面为pageOne")
    }.title("PageOne")
  }
}

@Component
export struct PageTwo {
  build(): void {
    NavDestination() {
      Text("当前页面为pageTwo")
    }.title("PageTwo")
  }
}
// [End navRouter]