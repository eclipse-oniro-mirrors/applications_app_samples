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
  Component, Column, Button, ColumnOptions, ForEach, Entry, Scroll
} from '@kit.ArkUI';

interface RouteInfo {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Array<RouteInfo> = [
    {
      name: 'NavigationDep',
      path: 'pages/routerAndNavigation/navigationDep'
    },
    {
      name: 'NavRouter',
      path: 'pages/routerAndNavigation/navRouterExample'
    },
    {
      name: 'OhosRouter',
      path: 'pages/routerAndNavigation/ohosRouter'
    },
    {
      name: 'systemRouter',
      path: 'pages/routerAndNavigation/systemRouter'
    },
    {
      name: 'SwiperDeprecated',
      path: 'pages/swiper/SwiperDeprecated'
    },
    {
      name: 'SwiperAutoLinear',
      path: 'pages/swiper/SwiperAutoLinear'
    },
  ]

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        ForEach(this.ary, (item: RouteInfo) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
            .width('100%')
        }, (item: RouteInfo) => item.name)
      }
      .width('100%')
      .padding(10)
    }
  }
}
