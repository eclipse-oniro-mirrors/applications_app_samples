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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start appstoragev2_navigation]
import { ISampleType, Sample } from './Sample';
import { AppStorageV2, Builder, Button, ButtonType, ClickEvent, Column, Component, ComponentV2, Divider, Entry, FontWeight, Link, Local, LocalStorage, LocalStorageLink, NavDestination, NavDestinationContext, NavPathInfo, NavPathStack, Navigation, NavigationMode, ObservedV2, PersistentStorage, Row, State, Text, Trace } from '@kit.ArkUI';

@Builder
export function Page2Builder():void {
  Page2()
}

@ComponentV2
export struct Page2 {
  // 在AppStorageV2中创建一个ttype为Sample的Class的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
  @Local prop: Sample = AppStorageV2.connect<Sample>(ISampleType, () => new Sample())!;
  pathStack: NavPathStack = new NavPathStack();

  build(): void {
    NavDestination() {
      Column() {
        Button('Page2 connect key Sample')
          .onClick((e: ClickEvent) => {
            // 在AppStorageV2中创建一个key为Sample的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
            this.prop = AppStorageV2.connect<Sample>(ISampleType, 'Sample', () => new Sample())!;
          })
          .width(300)
          .margin(10)

        Button(`Page2 add 1 to prop.p1: ${this.prop.p1}`)
          .onClick((e: ClickEvent) => {
            this.prop.p1++;
          })
          .width(300)
          .margin(10)

        Button(`Page2 add 1 to prop.p2: ${this.prop.p2}`)
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 页面不刷新，但p2的值已改变
            this.prop.p2++;
          })

      }
      .width('100%')
    }
  }
}
// [End appstoragev2_navigation]