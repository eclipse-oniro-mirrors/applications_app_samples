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
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;
@Component
struct PageOne {
  build() {
    NavDestination() {
      Text('pageOne')
    }.title('pageOne')
  }
}

@Entry
@Component
struct ObserverIndex2 {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string) {
    PageOne();
  }

  aboutToAppear() {
    // [Start uiObserver]
    const DOMAIN = 0x0000;
    uiObserver.onNavDestinationUpdate((info) => {
      hilog.info(DOMAIN, 'testTag', 'NavDestination state update', JSON.stringify(info));
    });
    // [End uiObserver]
  }

  aboutToDisappear() {
    uiObserver.offNavDestinationUpdate();
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick(() => {
          this.stack.pushPath(new NavPathInfo('pageOne', undefined));
        })
      }
      .title('Navigation')
      .navDestination(this.PageBuilder)
    }
    .width('100%')
    .height('100%')
  }
}
