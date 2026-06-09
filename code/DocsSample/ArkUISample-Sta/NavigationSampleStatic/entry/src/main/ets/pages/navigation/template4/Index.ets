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

@Entry
@Component
struct NavigationExample4 {
  pageInfo: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pageInfo) {
      Column() {
        Button('StartTest', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfo.pushPath(new NavPathInfo('temp4-pageOne', undefined));
          })
      }
    }.title('NavIndex')
  }
}