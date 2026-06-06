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

import { gridDestination, GRID_ROUTE_PREFIX } from './grid';
import { List_ROUTE_PREFIX, listDestination } from './list/Index';
import { Route } from '../common/Route';
import { RoutableCard } from '../common/Card';
import { waterFlowDestination, WATERFLOW_ROUTE_PREFIX } from './waterFlow';
import { arcListDestination, ARCLIST_ROUTE_PREFIX } from './arcList';
import resource from '../common/resource';
import { Scroll_ROUTE_PREFIX, scrollDestination } from './scroll/Index';
import { LAZY_LAYOUT_ROUTE_PREFIX, lazyLayoutDestination } from './lazyLayout/Index'
import {
  Entry,
  Component,
  Builder,
  State,
  Provide,
  NavPathStack,
  NavDestination,
  Navigation,
  List,
  ListItem,
  ForEach,
  Column,
  Row,
  Text,
  Search,
  FlexAlign,
  BlurStyle,
  BarStyle,
  NavPathInfo
} from '@kit.ArkUI';
import { LengthMetrics } from '@kit.ArkUI';
import { $r } from '@kit.ArkUI';

const routes: Array<Route> = [
  new Route(List_ROUTE_PREFIX, resource.resourceToString($r('app.string.pageIndex_List'))),
  new Route(ARCLIST_ROUTE_PREFIX, resource.resourceToString($r('app.string.pageIndex_ArcList'))),
  new Route(GRID_ROUTE_PREFIX, resource.resourceToString($r('app.string.pageIndex_Grid'))),
  new Route(WATERFLOW_ROUTE_PREFIX, resource.resourceToString($r('app.string.pageIndex_WaterFlow'))),
  new Route(Scroll_ROUTE_PREFIX, resource.resourceToString($r('app.string.Scroll_Title'))),
  new Route(LAZY_LAYOUT_ROUTE_PREFIX, resource.resourceToString($r('app.string.lazyLayout_Title')))
];


@Builder
export function destination(name: string): void {
  if (name.startsWith(List_ROUTE_PREFIX)) {
    listDestination(name);
  } else if (name.startsWith(GRID_ROUTE_PREFIX)) {
    gridDestination(name);
  } else if (name.startsWith(WATERFLOW_ROUTE_PREFIX)) {
    waterFlowDestination(name);
  } else if (name.startsWith(ARCLIST_ROUTE_PREFIX)) {
    arcListDestination(name);
  } else if (name.startsWith(Scroll_ROUTE_PREFIX)) {
    scrollDestination(name);
  } else if (name.startsWith(LAZY_LAYOUT_ROUTE_PREFIX)) {
    lazyLayoutDestination(name);
  }
}

@Entry
@Component
struct Index {
  @State
  condition: string = '';
  @Provide
  pathStack: NavPathStack = new NavPathStack();

  getFilteredRoutes(): Route[] {
    if (!this.condition) {
      return routes;
    }
    return routes.filter((route: Route): boolean => {
      return route.title.includes(this.condition);
    });
  }

  @Builder
  Title() {
    Column() {
      Search({ value: this.condition })
        .onChange((value: string) => {
          this.condition = value;
        })
        .margin({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
  }

  build(): void {
    Navigation(this.pathStack) {
      List({ space: 12 }) {
        ForEach(this.getFilteredRoutes(), (route: Route) => {
          ListItem() {
            RoutableCard({ title: route.title })
          }
          .width('100%')
          .onClick(() => {
            this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
          })
        }, (route: Route): string => route.name)
      }
      .padding({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) })
      .height('100%')
      .width('100%')
    }
    .backgroundColor('#f1f3f5')
    .navDestination(destination)
  }
}
