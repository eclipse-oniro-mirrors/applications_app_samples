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
import { Builder, Button, ButtonType, ClickEvent, Column, ComponentV2, Consumer, Entry, IMonitor, Local, Monitor, NavDestination, NavPathInfo, NavPathStack, Navigation, NavigationMode, Param, Provider, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MyNavigationTestStack {
  @Provider('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @Local message: number = 0;

  @Monitor(['message']) onChange(m: IMonitor) {
    console.info(`freeze-test MyNavigation message callback ${this.message}`);
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      PageOneStack({ message: this.message })
    } else if (name === 'pageTwo') {
      PageTwoStack({ message: this.message })
    } else if (name === 'pageThree') {
      PageThreeStack({ message: this.message })
    }
  }

  build() {
    Column() {
      Button('change message')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.message++;
        })
      Navigation(this.pageInfo) {
        Column() {
          Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
            .width(300)
            .margin(10)
            .onClick(() => {
              let info: NavPathInfo = new NavPathInfo('pageOne', undefined);
              this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
            })
        }
        .width('100%')
      }.title('NavIndex')
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
  }
}

@ComponentV2
struct PageOneStack {
  @Consumer('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @Local index: number = 1;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .margin(10)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width(300)
          .margin(10)
          .onClick(() => {
            let info: NavPathInfo = new NavPathInfo('pageTwo', undefined);
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width(300)
          .margin(10)
          .onClick(() => {
            this.pageInfo.pop();
          })
      }
      .width('100%')
      .height('100%')
    }.title('pageOne')
  }
}

@ComponentV2
struct PageTwoStack {
  @Consumer('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @Local index: number = 2;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .margin(10)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width(300)
          .margin(10)
          .onClick(() => {
            let info: NavPathInfo = new NavPathInfo('pageThree', undefined);
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width(300)
          .margin(10)
          .onClick(() => {
            this.pageInfo.pop();
          })
      }
      .width('100%')
      .height('100%')
    }.title('pageTwo')
  }
}

@ComponentV2
struct PageThreeStack {
  @Consumer('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @Local index: number = 3;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.pageInfo.size()}`)
          .fontSize(30)
          .margin(10)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .height(40)
          .width(300)
          .margin(10)
          .onClick(() => {
            let info: NavPathInfo = new NavPathInfo('pageOne', undefined);
            this.pageInfo.pushPath(info); //将name指定的NavDestination页面信息入栈
          })
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .height(40)
          .width(300)
          .margin(10)
          .onClick(() => {
            this.pageInfo.pop();
          })
      }
      .width('100%')
      .height('100%')
    }.title('pageThree')
  }
}

@ComponentV2
struct NavigationContentMsgStack {
  @Param message: number = 0;
  @Param index: number = 0;
  // 仅处于激活状态的NavigationContentMsgStack可以立刻触发@Monitor
  @Monitor(['message']) onChange(m: IMonitor) {
    console.info(`freeze-test NavigationContent message callback ${this.message}`);
    console.info(`freeze-test ---- called by content ${this.index}`);
  }

  build() {
    Column() {
      Text('msg:' + `${this.message}`)
        .fontSize(30)
        .margin(10)
    }
    .width('100%')
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
