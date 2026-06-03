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
  Context,
  $r,
  Builder,
  Entry,
  Component,
  State,
  Provide,
  NavPathStack,
  Column,
  Search,
  LengthMetrics,
  FlexAlign,
  Navigation,
  List,
  ListOptions,
  ForEach,
  ListItem,
  NavPathInfo,
  BlurStyle,
  BarStyle
} from '@kit.ArkUI';
import { Route } from '../common/Route';
import { RoutableCard } from '../common/Card';
import resource from '../common/resource';
import { LAZY_LAYOUT_ROUTE_PREFIX, lazyLayoutDestination } from './lazyLayout/Index'

const routes: Route[] = [
  {
    title: (context: Context) => {
      return resource.resourceToString(context, $r('app.string.lazyLayout_Title'))
    },
    name: LAZY_LAYOUT_ROUTE_PREFIX
  }
];

@Builder
function destination(name: string) {
  if (name.startsWith(LAZY_LAYOUT_ROUTE_PREFIX)) {
    lazyLayoutDestination(name);
  }
}

@Entry
@Component
struct Index {
  @State condition: string = '';
  @Provide pathStack: NavPathStack = new NavPathStack();

  getFilteredRoutes(): Route[] {
    if (!this.condition) {
      return routes;
    }
    return routes.filter((route: Route) => {
      return route.title(this.getUIContext().getHostContext()!).includes(this.condition);
    })
  }

  @Builder
  Title() {
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
          ListItem() {
            RoutableCard({ title: route.title(this.getUIContext().getHostContext()!) })
          }
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
    .navDestination(destination)
  }
}