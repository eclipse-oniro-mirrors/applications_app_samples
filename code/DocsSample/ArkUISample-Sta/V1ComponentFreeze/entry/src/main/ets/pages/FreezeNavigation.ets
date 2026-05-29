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
// [Start FreezeNavigation]
import { Builder, Button, ButtonType, ClickEvent, Column, Component, Entry, FontWeight, Link, Margin, NavDestination, NavPathInfo, NavPathStack, Navigation, NavigationMode, State, StorageLink, Text, Watch } from '@kit.ArkUI';

@Entry
@Component
struct MyNavigationTestStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @State @Watch('info') message: number = 0;
  @State logNumber: number = 0;

  info(propertyName: string) {
    console.info(`freeze-test MyNavigation message callback ${this.message}`);
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      PageOneStack({ message: this.message, logNumber: this.logNumber })
    } else if (name === 'pageTwo') {
      PageTwoStack({ message: this.message, logNumber: this.logNumber })
    } else if (name === 'pageThree') {
      PageThreeStack({ message: this.message, logNumber: this.logNumber })
    }
  }

  build() {
    Column() {
      Button('change message')
        .onClick((e: ClickEvent) => {
          this.message++;
        })
      Navigation(this.pageInfo) {
        Column() {
          Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height(40)
            .margin(20)
            .onClick((e: ClickEvent) => {
              let info: NavPathInfo = new NavPathInfo("pageOne", undefined)
              this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
            })
        }
      }.title('NavIndex')
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
    }
  }
}

@Component
struct PageOneStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @State index: number = 1;
  @Link message: number;
  @Link logNumber: number;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("pageTwo", undefined)
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            this.pageInfo.pop();
          })
      }.width('100%').height('100%')
    }.title('pageOne')
  }
}

@Component
struct PageTwoStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @State index: number = 2;
  @Link message: number;
  @Link logNumber: number;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("pageThree", undefined)
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            this.pageInfo.pop();
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
  }
}

@Component
struct PageThreeStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @State index: number = 3;
  @Link message: number;
  @Link logNumber: number;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("pageOne", undefined)
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            this.pageInfo.pop();
          })
      }.width('100%').height('100%')
    }.title('pageThree')
  }
}

@Component
struct NavigationContentMsgStack {
  @Link @Watch('info') message: number;
  @Link index: number;
  @Link logNumber: number;

  info(propertyName: string) {
    console.info(`freeze-test NavigationContent message callback ${this.message}`);
    console.info(`freeze-test ---- called by content ${this.index}`);
    this.logNumber++;
  }

  getValue(): number {
    console.info(`freeze-test getValue ${this.index}`);
    return this.message;
  }

  build() {
    Column() {
      Button('msg:' + `${this.getValue()}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Button('log number:' + `${this.logNumber}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}
// [End FreezeNavigation]

@Builder
export function freezeNavigation(): void {
  NavDestination() {
    MyNavigationTestStack();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_navigation_title'))
}
