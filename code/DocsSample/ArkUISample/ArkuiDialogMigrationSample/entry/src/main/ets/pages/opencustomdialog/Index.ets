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
import resource from '../../common/resource';
import { Route } from '../../common/Route';
import { OpenDialogAndUpdate } from './OpenDialogAndUpdate';
import { CustomDialogNewInterface } from './CustomDialogNewInterface';
import { CustomDialogOldInterface } from './CustomDialogOldInterface';
import { OpenCustomDialogWithControllerAfterMigrate } from './OpenCustomDialogWithControllerAfterMigrate';
import { OpenCustomDialogWithControllerBeforeMigrate } from './OpenCustomDialogWithControllerBeforeMigrate';
import { PresentCustomDialogAfterMigrate } from './PresentCustomDialogAfterMigrate';
import { PresentCustomDialogBeforeMigrate } from './PresentCustomDialogBeforeMigrate';
import { ActionMenuAfterMigrate } from './ActionMenuAfterMigrate';
import { ActionMenuBeforeMigrate } from './ActionMenuBeforeMigrate';
import { ShowDialogAfterMigrate } from './ShowDialogAfterMigrate';
import { ShowDialogBeforeMigrate } from './ShowDialogBeforeMigrate';
import { ActionSheetAfterMigrate } from './ActionSheetAfterMigrate';
import { ActionSheetBeforeMigrate } from './ActionSheetBeforeMigrate';
import { AlertDialogAfterMigrate } from './AlertDialogAfterMigrate';
import { AlertDialogBeforeMigrate } from './AlertDialogBeforeMigrate';
import { CustomDialogAfterMigrate } from './CustomDialogAfterMigrate'
import { CustomDialogBeforeMigrate } from './CustomDialogBeforeMigrate'

export const CustomDialog_ROUTE_PREFIX: string = 'CustomDialog_ROUTE_PREFIX';

// $r('app.string.xxx')需要替换为开发者所需的资源文件
const routes: Route[] = [
  {
    name: `${CustomDialog_ROUTE_PREFIX}/OpenDialogAndUpdate`,
    title: resource.resourceToString($r('app.string.Customdialog_title')),
    description: $r('app.string.OpenDialogAndUpdate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/CustomDialogNewInterface`,
    title: resource.resourceToString($r('app.string.CustomDialogNewInterface_title')),
    description: $r('app.string.CustomDialogNewInterface_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/CustomDialogOldInterface`,
    title: resource.resourceToString($r('app.string.CustomDialogOldInterface_title')),
    description: $r('app.string.CustomDialogOldInterface_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/OpenCustomDialogWithControllerAfterMigrate`,
    title: resource.resourceToString($r('app.string.OpenCustomDialogWithControllerAfterMigrate_title')),
    description: $r('app.string.OpenCustomDialogWithControllerAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/OpenCustomDialogWithControllerBeforeMigrate`,
    title: resource.resourceToString($r('app.string.OpenCustomDialogWithControllerBeforeMigrate_title')),
    description: $r('app.string.OpenCustomDialogWithControllerBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/PresentCustomDialogAfterMigrate`,
    title: resource.resourceToString($r('app.string.PresentCustomDialogAfterMigrate_title')),
    description: $r('app.string.PresentCustomDialogAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/PresentCustomDialogBeforeMigrate`,
    title: resource.resourceToString($r('app.string.PresentCustomDialogBeforeMigrate_title')),
    description: $r('app.string.PresentCustomDialogBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ActionMenuAfterMigrate`,
    title: resource.resourceToString($r('app.string.ActionMenuAfterMigrate_title')),
    description: $r('app.string.ActionMenuAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ActionMenuBeforeMigrate`,
    title: resource.resourceToString($r('app.string.ActionMenuBeforeMigrate_title')),
    description: $r('app.string.ActionMenuBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ShowDialogAfterMigrate`,
    title: resource.resourceToString($r('app.string.ShowDialogAfterMigrate_title')),
    description: $r('app.string.ShowDialogAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ShowDialogBeforeMigrate`,
    title: resource.resourceToString($r('app.string.ShowDialogBeforeMigrate_title')),
    description: $r('app.string.ShowDialogBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ActionSheetAfterMigrate`,
    title: resource.resourceToString($r('app.string.ActionSheetAfterMigrate_title')),
    description: $r('app.string.ActionSheetAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/ActionSheetBeforeMigrate`,
    title: resource.resourceToString($r('app.string.ActionSheetBeforeMigrate_title')),
    description: $r('app.string.ActionSheetBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/AlertDialogAfterMigrate`,
    title: resource.resourceToString($r('app.string.AlertDialogAfterMigrate_title')),
    description: $r('app.string.AlertDialogAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/AlertDialogBeforeMigrate`,
    title: resource.resourceToString($r('app.string.AlertDialogBeforeMigrate_title')),
    description: $r('app.string.AlertDialogBeforeMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/CustomDialogAfterMigrate`,
    title: resource.resourceToString($r('app.string.CustomDialogAfterMigrate_title')),
    description: $r('app.string.CustomDialogAfterMigrate_desc'),
  },
  {
    name: `${CustomDialog_ROUTE_PREFIX}/CustomDialogBeforeMigrate`,
    title: resource.resourceToString($r('app.string.CustomDialogBeforeMigrate_title')),
    description: $r('app.string.CustomDialogBeforeMigrate_desc'),
  }
]

@Builder
export function CustomDialogDestination(name: string) {
  if (name === CustomDialog_ROUTE_PREFIX) {
    CustomDialogExample();
  } else if (name === routes[0].name) {
    OpenDialogAndUpdate();
  } else if (name === routes[1].name) {
    CustomDialogNewInterface();
  } else if (name === routes[2].name) {
    CustomDialogOldInterface();
  } else if (name === routes[3].name) {
    OpenCustomDialogWithControllerAfterMigrate();
  } else if (name === routes[4].name) {
    OpenCustomDialogWithControllerBeforeMigrate();
  } else if (name === routes[5].name) {
    PresentCustomDialogAfterMigrate();
  } else if (name === routes[6].name) {
    PresentCustomDialogBeforeMigrate();
  } else if (name === routes[7].name) {
    ActionMenuAfterMigrate();
  } else if (name === routes[8].name) {
    ActionMenuBeforeMigrate();
  } else if (name === routes[9].name) {
    ShowDialogAfterMigrate();
  } else if (name === routes[10].name) {
    ShowDialogBeforeMigrate();
  } else if (name === routes[11].name) {
    ActionSheetAfterMigrate();
  } else if (name === routes[12].name) {
    ActionSheetBeforeMigrate();
  } else if (name === routes[13].name) {
    AlertDialogAfterMigrate();
  } else if (name === routes[14].name) {
    AlertDialogBeforeMigrate();
  } else if (name === routes[15].name) {
    CustomDialogAfterMigrate();
  } else if (name === routes[16].name) {
    CustomDialogBeforeMigrate();
  }
}

@Entry
@Component
struct CustomDialogExample {
  @Consume pathStack: NavPathStack;

  build() {
    NavDestination() {
      List({ space: 12 }) {
        ForEach(routes, (route: Route) => {
          ListItem() {
            CompletedRoutableCard({ title: route.title, description: route.description })
          }
          .width('100%')
          .onClick(() => {
            this.pathStack.pushPath({ name: route.name })
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