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

import { CompletedRoutableCard } from '../../common/Card';

import { Route } from '../../common/Route';
import resource from '../../common/resource';
import { textInputControllerCloseKeyboard } from './TextInputControllerCloseKeyboard';
import { requestFocusCloseKeyBoard } from './RequestFocusCloseKeyBoard';
import { requestFocusShowKeyboard } from './RequestFocusShowKeyboard';
import { tabKeyFocusShowKeyboard } from './TabKeyFocusShowKeyboard';
import { closeButtonClickKeyboard } from './CloseButtonClickKeyboard';
import { dragTextCloseKeyboard } from './DragTextCloseKeyboard';
import { pageChangeSource } from './PageChangeSource';
import { listScrollClearFocus } from './ListScrollClearFocus';
import { emptyCustomKeyboard } from './EmptyCustomKeyboard';
import { keepEditableStateOnSubmit } from './KeepEditableStateOnSubmit';

export const KEYBOARD_ROUTE_PREFIX: string = 'KeyBoard';

const routes: Route[] = [
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/TextInputControllerCloseKeyboard`,
    title: resource.resourceToString($r('app.string.TextInputControllerCloseKeyboard_title')),
    description: $r('app.string.TextInputControllerCloseKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/RequestFocusCloseKeyBoard`,
    title: resource.resourceToString($r('app.string.RequestFocusCloseKeyBoard_title')),
    description: $r('app.string.RequestFocusCloseKeyBoard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/RequestFocusShowKeyboard`,
    title: resource.resourceToString($r('app.string.RequestFocusShowKeyboard_title')),
    description: $r('app.string.RequestFocusShowKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/TabKeyFocusShowKeyboard`,
    title: resource.resourceToString($r('app.string.TabKeyFocusShowKeyboard_title')),
    description: $r('app.string.TabKeyFocusShowKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/CloseButtonClickKeyboard`,
    title: resource.resourceToString($r('app.string.CloseButtonClickKeyboard_title')),
    description: $r('app.string.CloseButtonClickKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/DragTextCloseKeyboard`,
    title: resource.resourceToString($r('app.string.DragTextCloseKeyboard_title')),
    description: $r('app.string.DragTextCloseKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/PageChangeSource`,
    title: resource.resourceToString($r('app.string.PageChangeSource_title')),
    description: $r('app.string.PageChangeSource_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/ListScrollClearFocus`,
    title: resource.resourceToString($r('app.string.ListScrollClearFocus_title')),
    description: $r('app.string.ListScrollClearFocus_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/EmptyCustomKeyboard`,
    title: resource.resourceToString($r('app.string.EmptyCustomKeyboard_title')),
    description: $r('app.string.EmptyCustomKeyboard_title')
  },
  {
    name: `${KEYBOARD_ROUTE_PREFIX}/KeepEditableStateOnSubmit`,
    title: resource.resourceToString($r('app.string.KeepEditableStateOnSubmit_title')),
    description: $r('app.string.KeepEditableStateOnSubmit_title')
  }
];

@Builder
export function ManageKeyBoardDestination(name: string) {
  if (name === KEYBOARD_ROUTE_PREFIX) {
    ManageKeyBoardExample();
  } else if (name === routes[0].name) {
    textInputControllerCloseKeyboard();
  } else if (name === routes[1].name) {
    requestFocusCloseKeyBoard();
  } else if (name === routes[2].name) {
    requestFocusShowKeyboard();
  } else if (name === routes[3].name) {
    tabKeyFocusShowKeyboard();
  } else if (name === routes[4].name) {
    closeButtonClickKeyboard();
  } else if (name === routes[5].name) {
    dragTextCloseKeyboard();
  } else if (name === routes[6].name) {
    pageChangeSource();
  } else if (name === routes[7].name) {
    listScrollClearFocus();
  } else if (name === routes[8].name) {
    emptyCustomKeyboard();
  } else if (name === routes[9].name) {
    keepEditableStateOnSubmit();
  }
}

@Entry
@Component
struct ManageKeyBoardExample {
  @Consume pathStack: NavPathStack;

  build() {
    NavDestination() {
      Scroll() {
        List({ space: 12 }) {
          ForEach(routes, (route: Route) => {
            ListItem() {
              CompletedRoutableCard({ title: route.title, description: route.description })
            }
            .width('100%')
            .onClick(() => {
              this.pathStack.pushPath({ name: route.name });
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


