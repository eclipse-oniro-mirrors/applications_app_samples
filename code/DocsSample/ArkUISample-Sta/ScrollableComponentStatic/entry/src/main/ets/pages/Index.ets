'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Column,
  Component,
  Navigation,
  NavPathStack,
  List,
  ForEach,
  ListItem,
  BarStyle,
  $r,
  Search,
  FlexAlign,
  Padding,
  ClickEvent,
  BlurStyle,
  NavPathInfo,
  LengthMetrics,
  State,
  Provide
} from '@kit.ArkUI';

import { Route } from '../common/Route';
import { RoutableCard } from '../common/Card';
import { swiperDestination, SWIPER_ROUTE_PREFIX } from './swiper';
import { tabsDestination, TABS_ROUTE_PREFIX } from './tabs';
import { arcSwiperDestination, ARCSWIPER_ROUTE_PREFIX } from './arcSwiper';
import resource from '../common/resource';

const routes: Route[] = [
  {
    title: resource.resourceToString($r('app.string.pageIndex_Swiper')),
    name: SWIPER_ROUTE_PREFIX
  },
  {
    title: resource.resourceToString($r('app.string.pageIndex_ArcSwiper')),
    name: ARCSWIPER_ROUTE_PREFIX
  },
  {
    title: resource.resourceToString($r('app.string.pageIndex_Tabs')),
    name: TABS_ROUTE_PREFIX
  }
];

@Builder
function destination(name: string) {
  if (name.startsWith(SWIPER_ROUTE_PREFIX)) {
    swiperDestination(name);
  } else if (name.startsWith(ARCSWIPER_ROUTE_PREFIX)) {
    arcSwiperDestination(name);
  } else if (name.startsWith(TABS_ROUTE_PREFIX)) {
    tabsDestination(name);
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
      return route.title.includes(this.condition);
    });
  }

  @Builder
  Title() {
    Column() {
      Search({ value: this.condition })
        .onChange(value => {
          this.condition = value;
        })
        .margin({ start: LengthMetrics.vp(16), end: LengthMetrics.vp(16) });
    }
    .justifyContent(FlexAlign.Center)
    .height('100%');
  }

  build() {
    Navigation(this.pathStack) {
      List() {
        ForEach(this.getFilteredRoutes(), (route: Route, index: int) => {
          ListItem() {
            RoutableCard({ title: route.title });
          }
          .width('100%')
          .onClick((e: ClickEvent) => {
            this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
          });
        }, (item: Route) => item.title)
      }
      .padding({ left: "16vp", right: "16vp" } as Padding)
      .contentStartOffset(56)
      .height('100%')
      .width('100%');
    }
    .backgroundColor('#f1f3f5')
    .title({ builder: this.Title, height: 56 }, {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    .navDestination(destination);
  }
}