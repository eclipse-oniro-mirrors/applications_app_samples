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

import { pageChangeDestination } from './PageChangeDestination';

@Builder
function pageChangeNavDestination(name: string) {
  if (name === 'pageChangeDestination') {
    pageChangeDestination()
  }
}

@Entry
@Component
// [Start page_ChangeSource]
struct pageChangeSource {
  // 创建一个导航控制器对象并传入Navigation
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Navigation(this.pathStack) {
        Column({ space: 30 }) {
          Blank().height(150)
          TextInput({ placeholder: 'TextInput' })
          Button('跳转到下一个页面')
            .onClick(() => {
              this.pathStack.pushPath({ name: 'pageChangeDestination' })
            })
        }
        .height('100%')
        .width('80%')
        .margin('10%')
      }
      .title('用Navigation实现页面跳转')
      .navDestination(pageChangeNavDestination)
    }
  }
}
// [End page_ChangeSource]

export { pageChangeSource };
