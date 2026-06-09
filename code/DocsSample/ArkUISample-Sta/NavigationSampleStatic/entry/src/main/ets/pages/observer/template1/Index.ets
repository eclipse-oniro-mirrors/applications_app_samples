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
// [Start MyComponent]
import {
  Color,
  Component,
  Column,
  NavPathStack,
  Button,
  NavPathInfo,
  NavDestinationContext,
  NavigationOperation,
  ButtonType,
  GestureEvent,
  PanGesture,
  NavDestination,
  ColumnOptions,
  Stack,
  Text,
  NavDestinationMode,
  LaunchMode,
  Context,
  Navigation,
  TextInput,
  List,
  ForEach,
  ListItem,
  TextAlign,
  $r,
  Entry,
  NavigationMode,
  NavigationMenuItem,
  HorizontalAlign,
  Row,
  Image,
  NavigationTitleMode
} from '@ohos.arkui.component'
import { State, AppStorage, Provide, Consume } from '@ohos.arkui.stateManagement';
import uiObserver from '@ohos.arkui.observer';

// NavDestination内的自定义组件
@Component
struct MyComponent {
  navDesInfo: uiObserver.NavDestinationInfo | undefined;
  context: Context | undefined = this.getUIContext().getHostContext();

  aboutToAppear() {
    this.navDesInfo = this.queryNavDestinationInfo();
  }

  build() {
    // [StartExclude MyComponent]
    NavDestination() {
      // [EndExclude MyComponent]
      Column() {
        // $r('app.string.onPageName')资源文件中的value值为“所属页面Name:”
        Text(this.context!.resourceManager.getStringSync($r('app.string.onPageName').id) + `${this.navDesInfo?.name}`)
      }.width('100%').height('100%')
      // [StartExclude MyComponent]
    }
    // [EndExclude MyComponent]
  }
}
// [End MyComponent]
@Component
struct MyComponent1 {
  build() {
    NavDestination() {
      MyComponent()
    }.title('MyComponent1')
  }
}

@Entry
@Component
struct ObserverIndex1 {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string) {
    MyComponent1();
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick(() => {
          this.stack.pushPath(new NavPathInfo('MyComponent1', undefined));
        })
      }
      .title('Navigation')
      .navDestination(this.PageBuilder)
    }
    .width('100%')
    .height('100%')
  }
}