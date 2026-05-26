'use static';
/**
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
  Entry, Component, Column, Row, Text, Button, Stack, Navigation, NavPathStack,
  NavDestination, NavDestinationMode, NavigationMode, NavigationTitleMode, Builder,
  Color
} from '@ohos.arkui.component'
import { State, Provide, Consume } from '@ohos.arkui.stateManagement'

@Component
struct Page01 {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Button('push Page01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Page01', '');
        })
        .margin({ top: 10, bottom: 10 })
      Button('push Dialog01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Dialog01', '');
        })
        .margin({ top: 10, bottom: 10 })
    }
    .title('Page01')
  }
}

@Component
struct Dialog01 {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Stack() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .opacity(0.1)
          .onClick(() => {
            this.pageInfos.pop();
          })
        Column() {
          Text('Dialog01')
            .fontSize(30)
            .fontWeight(2)
          Button('push Page01')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pushPathByName('Page01', '');
            })
            .margin({ top: 10, bottom: 10 })
          Button('push Dialog01')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pushPathByName('Dialog01', '');
            })
            .margin({ top: 10, bottom: 10 })
          Button('pop')
            .width('80%')
            .onClick(() => {
              this.pageInfos.pop();
            })
            .margin({ top: 10, bottom: 10 })
        }
        .padding(10)
        .width(250)
        .backgroundColor(Color.White)
        .borderRadius(10)
      }
    }
    .hideTitleBar(true)
    .mode(NavDestinationMode.DIALOG)
  }
}

@Entry
@Component
struct Index {
  @Provide({ alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string) {
    if (name == 'Page01') {
      Page01()
    } else if (name == 'Dialog01') {
      Dialog01()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('push Page01')
        .width('80%')
        .onClick(() => {
          this.pageInfos.pushPathByName('Page01', '');
        })
    }
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .title('navigation')
    .navDestination(this.PagesMap)
  }
}
