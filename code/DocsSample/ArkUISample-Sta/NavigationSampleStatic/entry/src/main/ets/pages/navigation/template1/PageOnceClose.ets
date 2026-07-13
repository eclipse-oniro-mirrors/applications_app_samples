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
import {
  Component,
  Column,
  NavPathStack,
  Button,
  NavPathInfo,
  NavDestination,
  Text,
  Navigation,
  $r,
  Entry,
  Provide,
  Consume
} from '@kit.ArkUI';
import uiObserver from '@ohos.arkui.observer';

@Entry
@Component
struct PageOnceClose {
  // [Start PageOnceClose]
  @Provide pageStack: NavPathStack = new NavPathStack();

  // [End PageOnceClose]
  @Builder
  PageBuilder(name: string) {
    MyComponent();
  }

  build() {
    Column() {
      Navigation(this.pageStack) {
        Button('push').onClick(() => {
          // [Start PageOnceCloseOne]
          this.pageStack.pushPath(new NavPathInfo('MyComponent', undefined), false);
          // [End PageOnceCloseOne]
        })
      }
      .title('Navigation')
      .navDestination(this.PageBuilder)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct MyComponent {
  navDesInfo: uiObserver.NavDestinationInfo | undefined;
  @Consume('pageStack') pageStack: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        // 请将$r('app.string.ToPage')替换为实际资源文件，在本示例中该资源文件的value值为"跳转目的页"
        Text($r('app.string.ToPage'))
          .onClick(() => {
            // [Start PageOnceCloseTwo]
            this.pageStack.pop(false);
            // [End PageOnceCloseTwo]
          })
      }.width('100%').height('100%')
    }
    .title('MyComponent')
  }
}
