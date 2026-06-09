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

// [Start CrossPackageCommon]
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
  NavigationTitleMode,
  ColumnOptions
} from '@ohos.arkui.component'
import { State, AppStorage, Provide, Consume } from '@ohos.arkui.stateManagement';

@Component
export struct ControlPanel {
  private stack: NavPathStack | undefined = undefined;

  aboutToAppear(): void {
    let info = this.queryNavigationInfo();
    this.stack = info?.pathStack;
  }

  build(): void {
    Column({ space: 20 } as ColumnOptions) {
      Button('push HapPageA').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HapPageA', undefined));
      })
      Button('push HapPageB').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HapPageB', undefined));
      })
      Button('push HarPageA').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HarPageA', undefined));
      })
      Button('push HarPageB').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HarPageB', undefined));
      })
      Button('push HspPageA').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HspPageA', undefined));
      })
      Button('push HspPageB').onClick(() => {
        this.stack?.pushPath(new NavPathInfo('HspPageB', undefined));
      })
    }
  }
}
// [End CrossPackageCommon]
