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
// [Start AppStorageV2TwoPages]
import { AppStorageV2, Builder, Button, ButtonType, ClickEvent, Column, Component, ComponentV2, Divider, Entry, FontWeight, Link, Local, LocalStorage, LocalStorageLink, NavDestination, NavPathInfo, NavPathStack, Navigation, NavigationMode, ObservedV2, PersistentStorage, Row, State, Text, Trace } from '@kit.ArkUI';
import { ISampleType, Sample } from './Sample';

@Entry
@ComponentV2
struct Page1 {
  // 在AppStorageV2中创建一个ttype为Sample的Class的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
  @Local prop: Sample = AppStorageV2.connect<Sample>(ISampleType, () => new Sample())!;
  pageStack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string, param: Object | null | undefined){
    if (name == 'Page2') {
      Page2()
    }
  }

  build() {
    Navigation(this.pageStack) {
      Column() {
        Button('Go to page2')
          .onClick((e: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo('Page2', new Object());
            this.pageStack.pushPath(info, true);
          })

        Button('Page1 connect key Sample')
          .onClick((e: ClickEvent) => {
            // 在AppStorageV2中创建一个key为Sample的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
            this.prop = AppStorageV2.connect<Sample>(ISampleType, 'Sample', () => new Sample())!;
          })

        Button('Page1 connect key Samplex')
          .onClick((e: ClickEvent) => {
            // 在AppStorageV2中创建一个key为Samplex的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
            this.prop = AppStorageV2.connect<Sample>(ISampleType, 'Samplex', () => new Sample())!;
          })

        Button('Page1 remove keyOrType ISampleType')
          .onClick((e: ClickEvent) => {
            // 从AppStorageV2中删除后，AppStorageV2中不存在ttype为Sample的Class的对象，但prop关联的对象并没有被删除，所以点击下方的Text组件修改prop.p1，其值仍然会变化。
            AppStorageV2.remove(ISampleType);
          })

        Text(`Page1 add 1 to prop.p1: ${this.prop.p1}`)
          .fontSize(30)
          .onClick((e: ClickEvent) => {
            this.prop.p1++;
          })

        Text(`Page1 add 1 to prop.p2: ${this.prop.p2}`)
          .fontSize(30)
          .onClick((e: ClickEvent) => {
            // 页面不刷新，但p2的值已改变
            this.prop.p2++;
          })

        // 获取当前AppStorageV2里面的所有key
        Text(`all keys in AppStorage: ${AppStorageV2.keys()}`)
          .onClick((e: ClickEvent) => {
            console.info(`${AppStorageV2.keys()}`)
          })
          .fontSize(30)
      }
    }.navDestination(this.PageBuilder)
  }
}

@ComponentV2
struct Page2 {
  // 在AppStorageV2中创建一个ttype为Sample的Class的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
  @Local prop: Sample = AppStorageV2.connect<Sample>(ISampleType, () => new Sample())!;
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Button('Page2 connect key Sample')
          .onClick((e: ClickEvent) => {
            // 在AppStorageV2中创建一个key为Sample的键值对（如果存在，则返回AppStorageV2中对应的数据），并且和prop关联
            this.prop = AppStorageV2.connect<Sample>(ISampleType, 'Sample', () => new Sample())!;
          })

        Text(`Page2 add 1 to prop.p1: ${this.prop.p1}`)
          .fontSize(30)
          .onClick((e: ClickEvent) => {
            this.prop.p1++;
          })

        Text(`Page2 add 1 to prop.p2: ${this.prop.p2}`)
          .fontSize(30)
          .onClick((e: ClickEvent) => {
            // 页面不刷新，但p2的值已改变
            this.prop.p2++;
          })

      }
    }
  }
}

// [End AppStorageV2TwoPages]

// 用于Navigation系统路由表的Page2Builder函数
@Builder
export function Page2Builder(): void {
  Page2(); 
}

@Builder
export function appStorageV2TwoPages(): void {
  NavDestination() {
    Page1();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.app_storage_v2_two_pages_title'))
}