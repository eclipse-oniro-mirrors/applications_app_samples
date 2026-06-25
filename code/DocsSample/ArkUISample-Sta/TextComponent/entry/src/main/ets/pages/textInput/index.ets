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
  Scroll,
  TextInput,
  ResourceStr
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { Route } from '../../common/Route';
import { CreatTextInput } from './CreatTextInput';
import { CustomTextInputStyle } from './CustomTextInputStyle';
import { KeyboardAvoidance } from './KeyboardAvoidance';
import { SetTextInputType } from './SetTextInputType';
import { TextInputAddEvent } from './TextInputAddEvent';
import resourceToStringManager from '../../common/resource';
import { SelectMenu } from './SelectMenu';
import { AutoFill } from './AutoFill';
import { SetProperty } from './SetProperty';
import { CursorAvoidance } from './CursorAvoidance';
import { DisableSystemServiceMenuItems } from './DisableSystemServiceMenuItems';
import { SetTextMargin } from './SetTextMargin';
import { SetInputMultiTypeStyle } from './SetInputMultiTypeStyle';
import { NormalQuestion } from './NormalQuestion';
import { TextMenuShowSubWindow } from './TextMenuShowSubWindow';

export const INPUT_ROUTE_PREFIX: string = 'TextInput';

const routes: Array<Route> = [
  new Route('TextInput/CreatTextInput',
    resourceToStringManager.resourceToString($r('app.string.CreatTextInput_title')),
    $r('app.string.CreatTextInput_description')),
  new Route('TextInput/SetTextInputType',
    resourceToStringManager.resourceToString($r('app.string.SetTextInputType_title')),
    $r('app.string.SetTextInputType_description')),
  new Route('TextInput/CustomTextInputStyle',
    resourceToStringManager.resourceToString($r('app.string.CustomTextInputStyle_title')),
    $r('app.string.CustomTextInputStyle_description')),
  new Route('TextInput/TextInputAddEvent',
    resourceToStringManager.resourceToString($r('app.string.TextInputAddEvent_title')),
    $r('app.string.TextInputAddEvent_description')),
  new Route('TextInput/SelectMenu',
    resourceToStringManager.resourceToString($r('app.string.SelectionMenu_title')),
    $r('app.string.SelectionMenu_description')),
  new Route('TextInput/ProhibitSelectMenu',
    resourceToStringManager.resourceToString($r('app.string.ProhibitSelectionMenu_title')),
    $r('app.string.ProhibitSelectionMenu_description')),
  new Route('TextInput/AutoFill',
    resourceToStringManager.resourceToString($r('app.string.Auto_Fill')),
    $r('app.string.Auto_Fill_description')),
  new Route('TextInput/SetProperty',
    resourceToStringManager.resourceToString($r('app.string.Set_Property')),
    $r('app.string.Set_Omission_Property_description')),
  new Route('TextInput/SetTextMargin',
    resourceToStringManager.resourceToString($r('app.string.Set_Text_Margin')),
    $r('app.string.Set_Text_Margin_description')),
  new Route('TextInput/KeyboardAvoidance',
    resourceToStringManager.resourceToString($r('app.string.KeyboardAvoidance_title')),
    $r('app.string.KeyboardAvoidance_description')),
  new Route('TextInput/CursorAvoidance',
    resourceToStringManager.resourceToString($r('app.string.CursorAvoidance_title')),
    $r('app.string.CursorAvoidance_description')),
  new Route('TextInput/SetInputMultiTypeStyle',
    resourceToStringManager.resourceToString($r('app.string.SetInputBoxMultiTypeStyle_title')),
    $r('app.string.SetInputBoxMultiTypeStyle_description')),
  new Route('TextInput/NormalQuestion',
    resourceToStringManager.resourceToString($r('app.string.NormalQuestion_title')),
    $r('app.string.NormalQuestion_description')),
  new Route('text/TextMenuShowSubWindow',
    resourceToStringManager.resourceToString($r('app.string.TextMenuShow_title')),
    $r('app.string.TextMenuShow_description'))
];

@Builder
export function TextInputDestination(name: string): void {
  if (name === INPUT_ROUTE_PREFIX) {
    TextInputExample();
  } else if (name === routes[0].name) {
    CreatTextInput();
  } else if (name === routes[1].name) {
    SetTextInputType();
  } else if (name === routes[2].name) {
    CustomTextInputStyle();
  } else if (name === routes[3].name) {
    TextInputAddEvent();
  } else if (name === routes[4].name) {
    SelectMenu();
  } else if (name === routes[5].name) {
    DisableSystemServiceMenuItems();
  } else if (name === routes[6].name) {
    AutoFill();
  } else if (name === routes[7].name) {
    SetProperty();
  } else if (name === routes[8].name) {
    SetTextMargin();
  } else if (name === routes[9].name) {
    KeyboardAvoidance();
  } else if (name === routes[10].name) {
    CursorAvoidance();
  } else if (name === routes[11].name) {
    SetInputMultiTypeStyle();
  } else if (name === routes[12].name) {
    NormalQuestion();
  } else if (name === routes[13].name) {
    TextMenuShowSubWindow();
  }
}

@Entry
@Component
export struct TextInputExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      Scroll() {
        List({ space: 12 } as ListOptions) {
          ForEach(routes, (route: Route) => {
            CompletedRoutableCard({ title: route.title, description: route.description as ResourceStr })
              .width('100%')
              .onClick(() => {
                this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
              })
          })
        }
        .contentStartOffset(56)
        .padding({ left: 16, right: 16 })
      }.id('scroll_')
    }
    .backgroundColor('#f1f3f5')
    .title('TextInput/TextArea/Search', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
