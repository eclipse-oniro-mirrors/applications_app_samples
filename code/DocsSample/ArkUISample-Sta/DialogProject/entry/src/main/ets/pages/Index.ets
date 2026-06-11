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
  LengthMetrics,
  Navigation,
  NavPathStack,
  NavPathInfo,
  List,
  ListOptions,
  Entry,
  Column,
  Component,
  BlurStyle,
  BarStyle,
  Search,
  FlexAlign,
  ForEach,
  Builder,
  $r
} from '@kit.ArkUI';
import { State, Provide } from '@ohos.arkui.stateManagement';
import { RoutableCard } from '../common/Card';
import resourceToStringManager from '../common/resource';
import { Route } from '../common/Route';
import { CustomDestination, Custom_ROUTE_PREFIX } from './customdialog/Index';
import { FixedDialogDestination, Fixed_ROUTE_PREFIX } from './fixedstyledialog/Index';
import { MenuDestination, Menu_ROUTE_PREFIX } from './Menu/Index';
import { CustomDialogDestination, CustomDialog_ROUTE_PREFIX } from './opencustomdialog/Index';
import { PopupDestination, Popup_ROUTE_PREFIX } from './popup/Index';
import { ToastDestination, Toast_ROUTE_PREFIX } from './Toast/Index';
import { MaskDestination, Mask_ROUTE_PREFIX } from './maskdialog/Index';
import { OverlayManagerDestination, OverlayManager_ROUTE_PREFIX } from './OverlayManager/Index';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Array<Route> = [
  new Route(
    resourceToStringManager.resourceToString($r('app.string.openCustomDialog')),
    CustomDialog_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.CustomDialog1')),
    Custom_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.FixedStyleDialog1')),
    Fixed_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.MaskDialog')),
    Mask_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.Menu1')),
    Menu_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.Toast1')),
    Toast_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.Popup1')),
    Popup_ROUTE_PREFIX
  ),
  new Route(
    resourceToStringManager.resourceToString($r('app.string.OverlayManager1')),
    OverlayManager_ROUTE_PREFIX
  )
];

@Builder
function Destination(name: string): void {
  if (name.startsWith(CustomDialog_ROUTE_PREFIX)) {
    CustomDialogDestination(name);
  } else if (name.startsWith(Custom_ROUTE_PREFIX)) {
    CustomDestination(name);
  } else if (name.startsWith(Fixed_ROUTE_PREFIX)) {
    FixedDialogDestination(name);
  } else if (name.startsWith(Menu_ROUTE_PREFIX)) {
    MenuDestination(name);
  } else if (name.startsWith(Toast_ROUTE_PREFIX)) {
    ToastDestination(name);
  } else if (name.startsWith(Popup_ROUTE_PREFIX)) {
    PopupDestination(name);
  } else if (name.startsWith(Mask_ROUTE_PREFIX)) {
    MaskDestination(name);
  } else if (name.startsWith(OverlayManager_ROUTE_PREFIX)) {
    OverlayManagerDestination(name);
  }
}

@Entry
@Component
struct Index {
  @State condition: string = '';
  @Provide pathStack: NavPathStack = new NavPathStack();

  getFilteredRoutes(): Array<Route> {
    if (!this.condition) {
      return routes;
    }
    return routes.filter((route: Route) => {
      return route.title.includes(this.condition);
    })
  }

  @Builder
  Title(): void {
    Column() {
      Search({ value: this.condition })
        .onChange(value => {
          this.condition = value;
        })
        .margin({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
  }

  build(): void {
    Navigation(this.pathStack) {
      List({ space: 12 } as ListOptions) {
        ForEach(this.getFilteredRoutes(), (route: Route) => {
          RoutableCard({ title: route.title })
            .width('100%')
            .onClick(() => {
              this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
            })
        })
      }
      .padding({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) })
      .contentStartOffset(56)
      .height('100%')
      .width('100%')
    }
    .backgroundColor('#f1f3f5')
    .title({ builder: this.Title, height: 56 }, {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    .navDestination(Destination)
  }
}