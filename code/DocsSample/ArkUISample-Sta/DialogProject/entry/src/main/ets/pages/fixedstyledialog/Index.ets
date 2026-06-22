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
import { Route } from '../../common/Route';
import {
  NavDestination,
  List,
  ListOptions,
  NavPathStack,
  NavPathInfo,
  Builder,
  Entry,
  Component,
  ForEach,
  BlurStyle,
  ResourceStr,
  BarStyle,
  $r
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';
import { showActionSheetExample } from './ActionSheet';
import { CalendarDialog } from './CalendarPickerDialog';
import { DatePickerDialogExample } from './DatePickerDialog';
import { DatePickerCustomDialogExample } from './DatePickerCustomDialog';
import { TextPickerDialogExample } from './TextPickerDialog';
import { TextPickerCNDialogExample } from './TextPickerCNDialog';
import { TimePickerDialogExample } from './TimePickerDialog';
import { showAlertDialogExample } from './AlertDialog';
import { ShowActionMenuExample } from './ShowActionMenu';
import { ShowDialogExample } from './ShowDialog';
import resourceToStringManager from '../../common/resource';

export const Fixed_ROUTE_PREFIX: string = 'Fixed_ROUTE_PREFIX';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Array<Route> = [
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CalendarPickerDialog_title')),
    `Fixed_ROUTE_PREFIX/CalendarPickerDialog`,
    undefined,
    $r('app.string.CalendarPickerDialog_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DatePicker_title')),
    `Fixed_ROUTE_PREFIX/DatePickerDialogExample`,
    undefined,
    $r('app.string.DatePicker_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.DatePickerCustom_title')),
    `Fixed_ROUTE_PREFIX/DatePickerCustomDialogExample`,
    undefined,
    $r('app.string.DatePickerCustom_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.TimePicker_title')),
    `Fixed_ROUTE_PREFIX/TimePickerDialog`,
    undefined,
    $r('app.string.TimePicker_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.TextPicker_title')),
    `Fixed_ROUTE_PREFIX/TextPickerDialog`,
    undefined,
    $r('app.string.TextPicker_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.TextPicker_cn_title')),
    `Fixed_ROUTE_PREFIX/TextPickerCNDialog`,
    undefined,
    $r('app.string.TextPicker_cn_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.ActionSheet_title')),
    `Fixed_ROUTE_PREFIX/ActionSheet`,
    undefined,
    $r('app.string.ActionSheet_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.AlertDialog_title')),
    `Fixed_ROUTE_PREFIX/AlertDialog`,
    undefined,
    $r('app.string.AlertDialog_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.ShowActionMenu_title')),
    `Fixed_ROUTE_PREFIX/ShowActionMenu`,
    undefined,
    $r('app.string.ShowActionMenu_des')
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.ShowDialog_title')),
    `Fixed_ROUTE_PREFIX/ShowDialog`,
    undefined,
    $r('app.string.ShowDialog_des')
  )
];

@Builder
export function FixedDialogDestination(name: string): void {
  if (name === Fixed_ROUTE_PREFIX) {
    FixedDialogExample();
  } else if (name === routes[0].name) {
    CalendarDialog();
  } else if (name === routes[1].name) {
    DatePickerDialogExample();
  } else if (name === routes[2].name) {
    DatePickerCustomDialogExample();
  } else if (name === routes[3].name) {
    TimePickerDialogExample();
  } else if (name === routes[4].name) {
    TextPickerDialogExample();
  } else if (name === routes[5].name) {
    TextPickerCNDialogExample();
  } else if (name === routes[6].name) {
    showActionSheetExample();
  } else if (name === routes[7].name) {
    showAlertDialogExample();
  } else if (name === routes[8].name) {
    ShowActionMenuExample();
  } else if (name === routes[9].name) {
    ShowDialogExample();
  }
}

@Entry
@Component
struct FixedDialogExample {
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
    // 请将$r('app.string.fixed_dialog')替换为实际资源文件，在本示例中该资源文件的value值为"固定样式弹出框"
    .title($r('app.string.fixed_dialog'))
  }
}