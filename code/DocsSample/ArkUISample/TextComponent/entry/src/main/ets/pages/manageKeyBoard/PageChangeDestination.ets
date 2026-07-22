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

// [Start page_ChangeDestination]
@Builder
export function pageChangeDestinationBuilder() {
  pageChangeDestination()
}

@Component
struct pageChangeDestination {
  pathStack: NavPathStack = new NavPathStack()
  // 跳转后的页面
  build() {
    NavDestination() {
      Column({ space: 20 }) {
        Text('跳转后的页面没有需要键盘的组件')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}
// [End page_ChangeDestination]

export { pageChangeDestination };
