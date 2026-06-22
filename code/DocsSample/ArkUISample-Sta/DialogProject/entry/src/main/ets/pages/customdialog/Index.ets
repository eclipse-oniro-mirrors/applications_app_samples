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
  ForEach,
  Component,
  NavPathInfo,
  ResourceStr,
  BlurStyle,
  Entry,
  BarStyle,
  Builder,
  $r
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CreateDialog } from './CreateCustomDialog';
import { DialogAnimation } from './DialogAnimation';
import { DialogInteraction } from './DialogInteraction';
import { DialogInteraction1 } from './DialogInteraction1';
import { DialogStyle } from './DialogStyle';
import { NestDialog } from './NestDialog';
import { CreateCustomDialogNew } from './CreateCustomDialogNew';
import { DialogInteractionUseConstructor } from './DialogInteractionUseConstructor';
import { DialogInteractionUseButton } from './DialogInteractionUseButton';
import { DialogAnimationNew } from './DialogAnimationNew';
import { DialogStyleNew } from './DialogStyleNew';
import { NestDialogNew } from './NestDialogNew';
import { DialogWithPhysicalBack } from './DialogWithPhysicalBack';
import { DialogAvoidSoftKeyboard } from './DialogAvoidSoftKeyboard';
import { GetDialogStatus } from './GetDialogStatus';
import { Index as DialogFocusStrategy } from './dialogboxfocuspolicy/DialogFocusStrategy';
import { DialogController } from './dialogcontroller/DialogController';
import { PageLevelDialogBox } from './pageleveldialogbox/PageLevelDialogBox';
import { PageLevelDialogInNavigation, PageLevelDialogInNavigationTestTwo } from './pageleveldialogbox/PageLevelDialogInNavigation';
import { DialogBoxLayer } from './dialogboxlayermanagement/DialogBoxLayer';

export const Custom_ROUTE_PREFIX: string = 'Custom_ROUTE_PREFIX';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Array<Route> = [
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_create_title')),
    `Custom_ROUTE_PREFIX/dialog`,
    undefined,
    $r('app.string.CustomDialog_create_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_interaction_title')),
    `Custom_ROUTE_PREFIX/dialoginteraction`,
    undefined,
    $r('app.string.CustomDialog_interaction_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_interaction1_title')),
    `Custom_ROUTE_PREFIX/dialoginteraction1`,
    undefined,
    $r('app.string.CustomDialog_interaction1_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_animation_title')),
    `Custom_ROUTE_PREFIX/DialogAnimation`,
    undefined,
    $r('app.string.CustomDialog_animation_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_Style_title')),
    `Custom_ROUTE_PREFIX/DialogStyle`,
    undefined,
    $r('app.string.CustomDialog_Style_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_nest')),
    `Custom_ROUTE_PREFIX/NestDialog`,
    undefined,
    $r('app.string.CustomDialog_nest_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CreateCustomDialogNew_title')),
    `Custom_ROUTE_PREFIX/CreateCustomDialogNew`,
    undefined,
    $r('app.string.CreateCustomDialogNew_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogInteractionUseConstructor_title')),
    `Custom_ROUTE_PREFIX/DialogInteractionUseConstructor`,
    undefined,
    $r('app.string.DialogInteractionUseConstructor_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogInteractionUseButton_title')),
    `Custom_ROUTE_PREFIX/DialogInteractionUseButton`,
    undefined,
    $r('app.string.DialogInteractionUseButton_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogAnimationNew_title')),
    `Custom_ROUTE_PREFIX/DialogAnimationNew`,
    undefined,
    $r('app.string.DialogAnimationNew_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogStyleNew_title')),
    `Custom_ROUTE_PREFIX/DialogStyleNew`,
    undefined,
    $r('app.string.DialogStyleNew_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.NestDialogNew_title')),
    `Custom_ROUTE_PREFIX/NestDialogNew`,
    undefined,
    $r('app.string.NestDialogNew_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogWithPhysicalBack_title')),
    `Custom_ROUTE_PREFIX/DialogWithPhysicalBack`,
    undefined,
    $r('app.string.DialogWithPhysicalBack_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DialogAvoidSoftKeyboard_title')),
    `Custom_ROUTE_PREFIX/DialogAvoidSoftKeyboard`,
    undefined,
    $r('app.string.DialogAvoidSoftKeyboard_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.GetDialogStatus_title')),
    `Custom_ROUTE_PREFIX/GetDialogStatus`,
    undefined,
    $r('app.string.GetDialogStatus_desc')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_focus')),
    `Custom_ROUTE_PREFIX/DialogFocusStrategy`,
    undefined,
    $r('app.string.CustomDialog_focus_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_controller')),
    `Custom_ROUTE_PREFIX/DialogController`,
    undefined,
    $r('app.string.CustomDialog_controller_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_page_level')),
    `Custom_ROUTE_PREFIX/PageLevelDialog`,
    undefined,
    $r('app.string.CustomDialog_controller_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_page_level_navigation')),
    `Custom_ROUTE_PREFIX/PageLevelDialogInNavigation`,
    undefined,
    $r('app.string.CustomDialog_page_level_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog_box_layer')),
    `Custom_ROUTE_PREFIX/DialogBoxLayer`,
    undefined,
    $r('app.string.CustomDialog_layer_des')
  )
];

@Builder
export function CustomDestination(name: string): void {
  if (name === Custom_ROUTE_PREFIX) {
    CustomExample();
  } else if (name === routes[0].name) {
    CreateDialog();
  } else if (name === routes[1].name) {
    DialogInteraction();
  } else if (name === routes[2].name) {
    DialogInteraction1();
  } else if (name === routes[3].name) {
    DialogAnimation();
  } else if (name === routes[4].name) {
    DialogStyle();
  } else if (name === routes[5].name) {
    NestDialog();
  } else if (name === routes[6].name) {
    CreateCustomDialogNew();
  } else if (name === routes[7].name) {
    DialogInteractionUseConstructor();
  } else if (name === routes[8].name) {
    DialogInteractionUseButton();
  } else if (name === routes[9].name) {
    DialogAnimationNew();
  } else if (name === routes[10].name) {
    DialogStyleNew();
  } else if (name === routes[11].name) {
    NestDialogNew();
  } else if (name === routes[12].name) {
    DialogWithPhysicalBack();
  } else if (name === routes[13].name) {
    DialogAvoidSoftKeyboard();
  } else if (name === routes[14].name) {
    GetDialogStatus();
  } else if (name === routes[15].name) {
    DialogFocusStrategy();
  } else if (name === routes[16].name) {
    DialogController();
  } else if (name === routes[17].name) {
    PageLevelDialogBox();
  } else if (name === routes[18].name) {
    DialogBoxLayer();
  } else if (name === routes[19].name) {
    DialogBoxLayer();
  } else if (name === `Custom_ROUTE_PREFIX/PageLevelDialogInNavigationPageTwo`) {
    PageLevelDialogInNavigationTestTwo()
  }
}

@Entry
@Component
struct CustomExample {
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
    // 请将$r('app.string.CustomDialog_dialog')替换为实际资源文件，在本示例中该资源文件的value值为"自定义弹窗"
    .title($r('app.string.CustomDialog_dialog'))
  }
}