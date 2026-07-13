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
  BarStyle,
  BlurStyle,
  ResourceStr,
  ForEach,
  Component,
  Entry,
  $r
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { ButtonPopupExample } from './ButtonPopup';
import { CustomPopupExample } from './CustomPopup';
import { AnimationPopupExample } from './PopupAnimation';
import { StatePopupExample } from './PopupStateChange';
import { StylePopupExample } from './PopupStyle';
import { TextPopupExample } from './TextPrompts';
import { AvoidSoftKeyboardPopupExample } from './PopupAvoidSoftKeyboard';
import { PolymorphicEffectPopupExample } from './PopupPolymorphicEffect';
import { SupportedAvoidAxisPopupExample } from './PopupSupportedAvoidAxis';
import { OpenPopup } from './globalpopupsindependentofuicomponents/OpenPopup';
import { OpenPopupWithTargetIdString } from './globalpopupsindependentofuicomponents/OpenPopupWithTargetIdString';

export const Popup_ROUTE_PREFIX: string = 'Popup_ROUTE_PREFIX';

const routes: Array<Route> = [
  new Route(
    resourceToStringManager.resourceToString($r('app.string.TextPopup_title')),
    `Popup_ROUTE_PREFIX/TextPopupExample`,
    undefined,
    $r('app.string.TextPopup_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.onStateChange_title')),
    `Popup_ROUTE_PREFIX/onStateChange`,
    undefined,
    $r('app.string.onStateChange_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.ButtonPopup_title')),
    `Popup_ROUTE_PREFIX/ButtonPopupExample`,
    undefined,
    $r('app.string.ButtonPopup_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.AnimationPopup_title')),
    `Popup_ROUTE_PREFIX/AnimationPopupExample`,
    undefined,
    $r('app.string.AnimationPopup_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomPopup_title')),
    `Popup_ROUTE_PREFIX/CustomPopupExample`,
    undefined,
    $r('app.string.CustomPopup_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.StylePopup_title')),
    `Popup_ROUTE_PREFIX/StylePopupExample`,
    undefined,
    $r('app.string.StylePopup_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.AvoidSoftKeyboardPopupExample_title')),
    `Popup_ROUTE_PREFIX/AvoidSoftKeyboardPopupExample`,
    undefined,
    $r('app.string.AvoidSoftKeyboardPopupExample_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.PolymorphicEffectPopupExample_title')),
    `Popup_ROUTE_PREFIX/PolymorphicEffectPopupExample`,
    undefined,
    $r('app.string.PolymorphicEffectPopupExample_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.SupportedAvoidAxisPopupExample_title')),
    `Popup_ROUTE_PREFIX/SupportedAvoidAxisPopupExample`,
    undefined,
    $r('app.string.SupportedAvoidAxisPopupExample_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.StylePopup_global')),
    `Popup_ROUTE_PREFIX/OpenPopupExample`,
    undefined,
    $r('app.string.StylePopup_global_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.OpenPopupWithTargetIdString')),
    `Popup_ROUTE_PREFIX/OpenPopupWithTargetIdString`,
    undefined,
    $r('app.string.StylePopup_global_des')
  )
];

@Builder
export function PopupDestination(name: string): void {
  if (name === Popup_ROUTE_PREFIX) {
    PopupExample();
  } else if (name === routes[0].name) {
    TextPopupExample();
  } else if (name === routes[1].name) {
    StatePopupExample();
  } else if (name === routes[2].name) {
    ButtonPopupExample();
  } else if (name === routes[3].name) {
    AnimationPopupExample();
  } else if (name === routes[4].name) {
    CustomPopupExample();
  } else if (name === routes[5].name) {
    StylePopupExample();
  } else if (name === routes[6].name) {
    AvoidSoftKeyboardPopupExample();
  } else if (name === routes[7].name) {
    PolymorphicEffectPopupExample();
  } else if (name === routes[8].name) {
    SupportedAvoidAxisPopupExample();
  } else if (name === routes[9].name) {
    OpenPopup();
  } else if (name === routes[10].name) {
    OpenPopupWithTargetIdString();
  }
}

@Entry
@Component
struct PopupExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route) => {
          CompletedRoutableCard({ title: route.title, description: route.description as ResourceStr})
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
    // 请将$r('app.string.popup')替换为实际资源文件，在本示例中该资源文件的value值为"气泡提示"
    .title($r('app.string.popup'))
  }
}