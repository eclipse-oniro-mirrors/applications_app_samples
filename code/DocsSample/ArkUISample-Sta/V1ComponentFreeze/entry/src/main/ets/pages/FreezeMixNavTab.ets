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
// [Start FreezeMixNavTab]
import { BarMode, BarPosition, Builder, Button, ButtonType, ClickEvent, Color, Column, Component, Entry, Link, Margin, NavDestination, NavPathInfo, NavPathStack, Navigation, NavigationMode, PropRef, Row, State, StorageLink, TabContent, Tabs, TabsController, Text, Watch } from '@kit.ArkUI';

@Component
struct ChildOfParamComponent {
  @PropRef @Watch('onChange') child_val: number;

  onChange(propertyName: string) {
    console.info(`Appmonitor ChildOfParamComponent: child_val changed:${this.child_val}`);
  }

  getValue(): number {
    console.info(`getValue child_val ${this.child_val}`)
    return this.child_val;
  }

  build() {
    Column() {
      Text(`Child Param： ${this.getValue()}`);
    }
  }
}

@Component
struct ParamComponent {
  @PropRef @Watch('onChange') paramVal: number;

  onChange(propertyName: string) {
    console.info(`Appmonitor ParamComponent: paramVal changed:${this.paramVal}`);
  }

  getValue(): number {
    console.info(`getValue paramVal ${this.paramVal}`)
    return this.paramVal;
  }

  build() {
    Column() {
      Text(`val： ${this.getValue()}`)
      ChildOfParamComponent({ child_val: this.paramVal });
    }
  }
}



@Component
struct DelayComponent {
  @PropRef @Watch('onChange') delayVal: number;

  onChange(propertyName: string) {
    console.info(`Appmonitor ParamComponent: delayVal changed:${this.delayVal}`);
  }
  getValue(): number {
    console.info(`getValue delayVal ${this.delayVal}`)
    return this.delayVal;
  }

  build() {
    Column() {
      Text(`Delay Param： ${this.getValue()}`);
    }
  }
}

@Component
struct TabsComponent {
  private controller: TabsController = new TabsController();
  @State @Watch('onChange') tabState: number = 47;

  onChange(propertyName: string) {
    console.info(`Appmonitor TabsComponent: tabState changed:${this.tabState}`);
  }

  getValue(): number {
    console.info(`getValue tabState ${this.tabState}`);
    return this.tabState;
  }

  build() {
    Column() {
      Button(`Incr state ${this.getValue()}`)
        .fontSize(25)
        .onClick((e: ClickEvent) => {
          console.info('Button increment state value');
          this.tabState = this.tabState + 1;
        })

      Tabs({ barPosition: BarPosition.Start, index: 0, controller: this.controller }) {
        TabContent() {
          ParamComponent({ paramVal: this.tabState });
        }.tabBar('Update')

        TabContent() {
          DelayComponent({ delayVal: this.tabState });
        }.tabBar('DelayUpdate')
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      .barWidth(400)
      .barHeight(150)
      .animationDuration(400)
      .width('100%')
      .height(200)
      .backgroundColor(0xF5F5F5)
    }
  }
}

@Entry
@Component
struct MyNavigationTestStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      PageOneStack()
    } else if (name === 'pageTwo') {
      PageTwoStack()
    }
  }

  build() {
    Column() {
      Navigation(this.pageInfo) {
        Column() {
          Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height(40)
            .margin(20)
            .onClick((e: ClickEvent) => {
              let info: NavPathInfo = new NavPathInfo("pageOne", undefined)
              this.pageInfo.pushPath(info);
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

  build() {
    NavDestination() {
      Column() {
        TabsComponent();

        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            let info: NavPathInfo = new NavPathInfo("pageTwo", undefined)
            this.pageInfo.pushPath(info);
          })
      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component
struct PageTwoStack {
  @StorageLink('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
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
// [End FreezeMixNavTab]

@Builder
export function freezeMixNavTab(): void {
  NavDestination() {
    MyNavigationTestStack();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_mix_nav_tab_title'))
}
