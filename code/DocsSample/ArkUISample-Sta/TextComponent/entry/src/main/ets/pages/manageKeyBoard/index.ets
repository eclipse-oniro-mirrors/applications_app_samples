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
  $r,
  BarStyle,
  BlurStyle,
  Builder,
  Component,
  Entry,
  ForEach,
  List,
  ListOptions,
  NavDestination,
  NavPathInfo,
  NavPathStack,
  Scroll
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { Route } from '../../common/Route';
import resourceToStringManager from '../../common/resource';
import { textInputControllerCloseKeyboard } from './TextInputControllerCloseKeyboard';
import { requestFocusCloseKeyBoard } from './RequestFocusCloseKeyBoard';

export const KEYBOARD_ROUTE_PREFIX: string = 'KeyBoard';

const routes: Array<Route> = [
  new Route('KeyBoard/TextInputControllerCloseKeyboard',
    resourceToStringManager.resourceToString($r('app.string.TextInputControllerCloseKeyboard_title')),
    $r('app.string.TextInputControllerCloseKeyboard_title')),
  new Route('KeyBoard/RequestFocusCloseKeyBoard',
    resourceToStringManager.resourceToString($r('app.string.RequestFocusCloseKeyBoard_title')),
    $r('app.string.RequestFocusCloseKeyBoard_title'))
];

@Builder
export function ManageKeyBoardDestination(name: string): void {
  if (name === KEYBOARD_ROUTE_PREFIX) {
    ManageKeyBoardExample();
  } else if (name === routes[0].name) {
    textInputControllerCloseKeyboard();
  } else if (name === routes[1].name) {
    requestFocusCloseKeyBoard();
  }
}

@Entry
@Component
export struct ManageKeyBoardExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      Scroll() {
        List({ space: 12 } as ListOptions) {
          ForEach(routes, (route: Route) => {
            CompletedRoutableCard({ title: route.title, description: route.description })
              .width('100%')
              .onClick(() => {
                this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
              })
          })
        }
        .contentStartOffset(56)
        .padding({ left: 16, right: 16 })
      }.id('scroll_1')
    }
    .backgroundColor('#f1f3f5')
    .title('keyBoard', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
