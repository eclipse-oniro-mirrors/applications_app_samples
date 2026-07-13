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
  Span,
  Text,
  ResourceStr
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { CompletedRoutableCard } from '../../common/Card';
import { CreateText } from './CreateText';
import { CustomTextStyle } from './CustomTextStyle';
import { Route } from '../../common/Route';
import { TextAddEvent } from './TextAddEvent';
import { TextHotSearch } from './TextHotSearch';
import { TextSpan } from './TextSpan';
import resourceToStringManager from '../../common/resource';
import { SelectMenu } from './SelectMenu';
import { AIMenu } from './AIMenu';
import { TextSpanOnHover } from './TextSpanOnHover';
import { ContentTransitionDemo } from './ContentTransition';
import { TextLayout } from './TextLayout';
import { LineSpacing } from './LineSpacing';
import { EnableAutoSpacing } from './EnableAutoSpacing';
import { ShaderStyleDemo } from './ShaderStyle';
import { GeneralEvents } from './GeneralEvents';
import { BindSelectionMenu } from './BindSelectionMenu';
import { SelectionChange } from './SelectionChange';
import { ServiceMenuItems } from './ServiceMenuItems';
import { PrepareMenu } from './PrepareMenu';
import { WordBreakd } from './WordBreakd';
import { HeightAdaptivePolicy } from './HeightAdaptivePolicy';
import { LengthMetric } from './LengthMetric';
import { DisplayedTogether } from './DisplayedTogether';
import { TextLong } from './TextLong';
import { TextLongTow } from './TextLongTow';
import { CustomAndBlockMenus } from './CustomAndBlockMenus';
import { TextMenuShowSubWindow } from './TextMenuShowSubWindow';

export const TEXT_ROUTE_PREFIX: string = 'text';

const routes: Array<Route> = [
  new Route('text/CreateText',
    resourceToStringManager.resourceToString($r('app.string.CreatText_title')),
    $r('app.string.CreatText_description')),
  new Route('text/TextSpan',
    resourceToStringManager.resourceToString($r('app.string.TextSpan_title')),
    $r('app.string.TextSpan_description')),
  new Route('text/CustomTextStyle',
    resourceToStringManager.resourceToString($r('app.string.CustomTextStyle_title')),
    $r('app.string.CustomTextStyle_description')),
  new Route('text/TextAddEvent',
    resourceToStringManager.resourceToString($r('app.string.TextAddEvent_title')),
    $r('app.string.TextAddEvent_description')),
  new Route('text/SelectMenu',
    resourceToStringManager.resourceToString($r('app.string.SetSelectionMenu_title')),
    $r('app.string.SetSelectionMenu_description')),
  new Route('text/AIMenu',
    resourceToStringManager.resourceToString($r('app.string.SetUpAIMenu_title')),
    $r('app.string.SetUpAIMenu_description')),
  new Route('text/TextHotSearch',
    resourceToStringManager.resourceToString($r('app.string.TextHotSearch_title')),
    $r('app.string.TextHotSearch_description')),
  new Route('text/TextSpanOnHover',
    resourceToStringManager.resourceToString($r('app.string.OnClick_onHover')),
    $r('app.string.OnClickOnHover_description')),
  new Route('text/ContentTransitionDemo',
    resourceToStringManager.resourceToString($r('app.string.Set_digital_flip_effect')),
    $r('app.string.Set_digital_flip_effect_description')),
  new Route('text/TextLayout',
    resourceToStringManager.resourceToString($r('app.string.text_layout')),
    $r('app.string.text_layout_description')),
  new Route('text/LineSpacing',
    resourceToStringManager.resourceToString($r('app.string.Set_text_line_spacing')),
    $r('app.string.Set_text_line_spacing_description')),
  new Route('text/EnableAutoSpacing',
    resourceToStringManager.resourceToString($r('app.string.Automatic_spacing')),
    $r('app.string.Automatic_spacing_description')),
  new Route('text/ShaderStyleDemo',
    resourceToStringManager.resourceToString($r('app.string.Shader_Style')),
    $r('app.string.Shader_Style_description')),
  new Route('text/GeneralEvents',
    resourceToStringManager.resourceToString($r('app.string.General_Events')),
    $r('app.string.General_Events_description')),
  new Route('text/BindSelectionMenu',
    resourceToStringManager.resourceToString($r('app.string.Bind_SelectionMenu')),
    $r('app.string.Bind_SelectionMenu_description')),
  new Route('text/SelectionChange',
    resourceToStringManager.resourceToString($r('app.string.Selection_Change')),
    $r('app.string.Selection_Change_description')),
  new Route('text/ServiceMenuItems',
    resourceToStringManager.resourceToString($r('app.string.Service_MenuItems')),
    $r('app.string.Service_MenuItems_description')),
  new Route('text/PrepareMenu',
    resourceToStringManager.resourceToString($r('app.string.Prepare_Menu')),
    $r('app.string.Prepare_Menu_description')),
  new Route('text/WordBreakd',
    resourceToStringManager.resourceToString($r('app.string.Word_Break')),
    $r('app.string.Word_Break_description')),
  new Route('text/HeightAdaptivePolicy',
    resourceToStringManager.resourceToString($r('app.string.Height_AdaptivePolicy')),
    $r('app.string.Height_AdaptivePolicy_description')),
  new Route('text/LengthMetric',
    resourceToStringManager.resourceToString($r('app.string.Length_Metric')),
    $r('app.string.Length_Metric_description')),
  new Route('text/DisplayedTogether',
    resourceToStringManager.resourceToString($r('app.string.Displayed_Together')),
    $r('app.string.Displayed_Together_description')),
  new Route('text/TextLong',
    resourceToStringManager.resourceToString($r('app.string.Text_Long')),
    $r('app.string.Text_Long_description')),
  new Route('text/TextLongTow',
    resourceToStringManager.resourceToString($r('app.string.Text_Long_Tow')),
    $r('app.string.Text_Long_Tow_description')),
  new Route('text/CustomAndBlockMenus',
    resourceToStringManager.resourceToString($r('app.string.CustomAndBlockMenus')),
    $r('app.string.CustomAndBlockMenus')),
  new Route('text/TextMenuShowSubWindow',
    resourceToStringManager.resourceToString($r('app.string.TextMenuShow_title')),
    $r('app.string.TextMenuShow_description'))
];

@Builder
export function TextDestination(name: string): void {
  if (name === TEXT_ROUTE_PREFIX) {
    TextExample();
  } else if (name === routes[0].name) {
    CreateText();
  } else if (name === routes[1].name) {
    TextSpan();
  } else if (name === routes[2].name) {
    CustomTextStyle();
  } else if (name === routes[3].name) {
    TextAddEvent();
  } else if (name === routes[4].name) {
    SelectMenu();
  } else if (name === routes[5].name) {
    AIMenu();
  } else if (name === routes[6].name) {
    TextHotSearch();
  } else if (name === routes[7].name) {
    TextSpanOnHover();
  } else if (name === routes[8].name) {
    ContentTransitionDemo();
  } else if (name === routes[9].name) {
    TextLayout();
  } else if (name === routes[10].name) {
    LineSpacing();
  } else if (name === routes[11].name) {
    EnableAutoSpacing();
  } else if (name === routes[12].name) {
    ShaderStyleDemo();
  } else if (name === routes[13].name) {
    GeneralEvents();
  } else if (name === routes[14].name) {
    BindSelectionMenu();
  } else if (name === routes[15].name) {
    SelectionChange();
  } else if (name === routes[16].name) {
    ServiceMenuItems();
  } else if (name === routes[17].name) {
    PrepareMenu();
  } else if (name === routes[18].name) {
    WordBreakd();
  } else if (name === routes[19].name) {
    HeightAdaptivePolicy();
  } else if (name === routes[20].name) {
    LengthMetric();
  } else if (name === routes[21].name) {
    DisplayedTogether();
  } else if (name === routes[22].name) {
    TextLong();
  } else if (name === routes[23].name) {
    TextLongTow();
  } else if (name === routes[24].name) {
    CustomAndBlockMenus();
  } else if (name === routes[25].name) {
    TextMenuShowSubWindow();
  }
}

@Entry
@Component
export struct TextExample {
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
    .title('Text/Span', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
