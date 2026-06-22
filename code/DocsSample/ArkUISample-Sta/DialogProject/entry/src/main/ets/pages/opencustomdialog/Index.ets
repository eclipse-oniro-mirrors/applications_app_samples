'use static'

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

import {
  CompletedRoutableCard
} from '../../common/Card';
import resourceToStringManager from '../../common/resource';
import { Route } from '../../common/Route';
import {
  NavDestination,
  List,
  ListOptions,
  NavPathStack,
  NavPathInfo,
  Builder,
  BlurStyle,
  ResourceStr,
  BarStyle,
  Entry,
  Component,
  ForEach,
  $r
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { openCustomDialog } from './openCustomDialog';
import { CustomDialogComponentWithTransition } from './customDialogComponentWithTransition';
import { CustomDialogWithKeyboardAvoidDistance } from './customDialogWithKeyboardAvoidDistance';
import { OpenDialogAndUpdate } from './OpenDialogAndUpdate';

export const CustomDialog_ROUTE_PREFIX: string = 'CustomDialog_ROUTE_PREFIX';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Array<Route> = [
  new Route(
    resourceToStringManager.resourceToString($r('app.string.Customdialog_title')),
    `CustomDialog_ROUTE_PREFIX/Customdialog`,
    undefined,
    $r('app.string.Customdialog_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialogComponentWithTransition_title')),
    `CustomDialog_ROUTE_PREFIX/CustomDialogComponentWithTransition`,
    undefined,
    $r('app.string.CustomDialogComponentWithTransition_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialogWithKeyboardAvoidDistance_title')),
    `CustomDialog_ROUTE_PREFIX/CustomDialogWithKeyboardAvoidDistance`,
    undefined,
    $r('app.string.CustomDialogWithKeyboardAvoidDistance_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.OpenDialogAndUpdate_title')),
    `CustomDialog_ROUTE_PREFIX/OpenDialogAndUpdate`,
    undefined,
    $r('app.string.OpenDialogAndUpdate_desc')
  )
];

@Builder
export function CustomDialogDestination(name: string): void {
  if (name === CustomDialog_ROUTE_PREFIX) {
    CustomDialogExample();
  } else if (name === routes[0].name) {
    openCustomDialog();
  } else if (name === routes[1].name) {
    CustomDialogComponentWithTransition();
  } else if (name === routes[2].name) {
    CustomDialogWithKeyboardAvoidDistance();
  } else if (name === routes[3].name) {
    OpenDialogAndUpdate();
  }
}

@Entry
@Component
struct CustomDialogExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route) => {
          CompletedRoutableCard({ title: route.title, description: route.description as ResourceStr })
            .width('100%')
            .onClick(() => {
              this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
            })
        })
      }
      .contentStartOffset(20)
      .padding({ left: 16, right: 16 })
    }
    .backgroundColor('#f1f3f5')
    .title('', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    .title('CustomDialog')
  }
}