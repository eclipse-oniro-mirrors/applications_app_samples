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
  Entry,
  Text,
  Component,
  $r,
  List,
  ListOptions,
  NavPathStack,
  NavPathInfo,
  NavDestination,
  NavigationTitleOptions,
  Builder,
  ForEach,
  BlurStyle,
  BarStyle,
  Scroll,
  ResourceStr
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { Route } from '../../common/Route';
import resourceToStringManager from '../../common/resource';
import { CreateRichEditor } from './CreateRichEditor';
import { SetAttributes } from './SetAttributes';
import { AddEvent } from './AddEvent';
import { SetUserPresetTextStyles } from './SetUserPresetTextStyles';
import { BackplaneHighlighting } from './BackplaneHighlighting';
import { AddTextContent } from './AddTextContent';
import { AddImageContent } from './AddImageContent';
import { AddBuilderDecoratorContent } from './AddBuilderDecoratorContent';
import { AddSymbolSpanContent } from './AddSymbolSpanContent';
import { GetGraphicInfoInComponent } from './GetGraphicInfoInComponent';
import { DisableSystemServiceMenu } from './DisableSystemServiceMenu';

export const RICH_EDITOR_ROUTE_PREFIX: string = 'RichEditor';

const routes: Array<Route> = [
  new Route('RichEditor/CreateRichEditor',
    resourceToStringManager.resourceToString($r('app.string.Create_RichEditor_Component_title')),
    $r('app.string.Create_RichEditor_Component_description')),
  new Route('RichEditor/SetAttributes',
    resourceToStringManager.resourceToString($r('app.string.Set_Attributes_title'))),
  new Route('RichEditor/AddEvent',
    resourceToStringManager.resourceToString($r('app.string.Add_Event_title'))),
  new Route('RichEditor/SetUserPresetTextStyles',
    resourceToStringManager.resourceToString($r('app.string.Set_User_PresetText_Styles_title')),
    $r('app.string.Set_User_PresetText_Styles_desc')),
  new Route('RichEditor/BackplaneHighlighting',
    resourceToStringManager.resourceToString($r('app.string.Backplane_Highlighting_title')),
    $r('app.string.Backplane_Highlighting_desc')),
  new Route('RichEditor/AddTextContent',
    resourceToStringManager.resourceToString($r('app.string.Add_TextContent_title')),
    $r('app.string.Add_TextContent_desc')),
  new Route('RichEditor/AddImageContent',
    resourceToStringManager.resourceToString($r('app.string.Add_ImageContent_title')),
    $r('app.string.Add_ImageContent_desc')),
  new Route('RichEditor/AddBuilderDecoratorContent',
    resourceToStringManager.resourceToString($r('app.string.Add_Builder_DecoratorContent_title')),
    $r('app.string.Add_Builder_DecoratorContent_desc')),
  new Route('RichEditor/AddSymbolSpanContent',
    resourceToStringManager.resourceToString($r('app.string.Add_SymbolSpanContent_title')),
    $r('app.string.Add_SymbolSpanContent_desc')),
  new Route('RichEditor/GetGraphicInfoInComponent',
    resourceToStringManager.resourceToString($r('app.string.Get_GraphicInfo_In_Component_title')),
    $r('app.string.Get_GraphicInfo_In_Component_desc')),
  new Route('RichEditor/DisableSystemServiceMenu',
    resourceToStringManager.resourceToString($r('app.string.Disable_SystemService_Menu_title')),
    $r('app.string.Disable_SystemService_Menu_title_desc'))
];

@Builder
export function RichEditorDestination(name: string): void {
  if (name === RICH_EDITOR_ROUTE_PREFIX) {
    RichEditorExample();
  } else if (name === routes[0].name) {
    CreateRichEditor();
  } else if (name === routes[1].name) {
    SetAttributes();
  } else if (name === routes[2].name) {
    AddEvent();
  } else if (name === routes[3].name) {
    SetUserPresetTextStyles();
  } else if (name === routes[4].name) {
    BackplaneHighlighting();
  } else if (name === routes[5].name) {
    AddTextContent();
  } else if (name === routes[6].name) {
    AddImageContent();
  } else if (name === routes[7].name) {
    AddBuilderDecoratorContent();
  } else if (name === routes[8].name) {
    AddSymbolSpanContent();
  } else if (name === routes[9].name) {
    GetGraphicInfoInComponent();
  } else if (name === routes[10].name) {
    DisableSystemServiceMenu();
  }
}

@Entry
@Component
struct RichEditorExample {
  @Consume pathStack: NavPathStack;

  build() {
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
    .title('RichEditor', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    } as NavigationTitleOptions)
  }
}