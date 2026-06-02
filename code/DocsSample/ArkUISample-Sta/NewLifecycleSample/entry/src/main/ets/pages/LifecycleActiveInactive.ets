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
// [Start LifecycleActiveInactive]
import { BarMode, BarPosition, Button, ButtonType, Color, Column, ComponentActive, ComponentInactive, ComponentV2, Consumer, Entry, FontWeight, IMonitor, Local, Margin, Monitor, NavDestination, NavPathInfo, NavPathStack, Navigation, NavigationMode, Param, Provider, Require, Row, TabContent, Tabs, TabsController, Text } from '@kit.ArkUI';

@ComponentV2
struct ChildOfParamComponent {
  @Require @Param child_val: int;
  // 处于激活状态的ChildOfParamComponent才可以立刻触发@Monitor
  @Monitor(['child_val']) onMessageUpdated(m: IMonitor) {
    console.info(`Appmonitor ChildOfParamComponent: changed ${m.dirty[0]}: ${m.value<int>()?.before} -> ${m.value<int>()?.now}`);
  }

  build() {
    Column() {
      Text(`Child Param： ${this.child_val}`)
    }
  }
}

@ComponentV2
struct ParamComponent {
  @Require @Param val: int;
  // 处于激活状态的ParamComponent才可以立刻触发@Monitor
  @Monitor(['val']) onMessageUpdated(m: IMonitor) {
    console.info(`Appmonitor ParamComponent: changed ${m.dirty[0]}: ${m.value<int>()?.before} -> ${m.value<int>()?.now}`);
  }
  @ComponentActive
  myActive() {
    // 从非激活态切换至激活态时触发
    console.info(`ParamComponent myActive, val: ${this.val}`);
  }
  @ComponentInactive
  myInactive() {
    // 从激活态切换至非激活态时触发
    console.info(`ParamComponent myInactive, val: ${this.val}`);
  }
  build() {
    Column() {
      Text(`val： ${this.val}`)
      ChildOfParamComponent({child_val: this.val})
    }
  }
}

@ComponentV2
struct DelayComponent {
  @Require @Param delayVal1: int;
  // 处于激活状态的DelayComponent才可以立刻触发@Monitor
  @Monitor(['delayVal1']) onMessageUpdated(m: IMonitor) {
    console.info(`Appmonitor DelayComponent: changed ${m.dirty[0]}: ${m.value<int>()?.before} -> ${m.value<int>()?.now}`);
  }
  @ComponentActive
  myActive() {
    // 从非激活态切换至激活态时触发
    console.info(`DelayComponent myActive, val: ${this.delayVal1}`);
  }
  @ComponentInactive
  myInactive() {
    // 从激活态切换至非激活态时触发
    console.info(`DelayComponent myInactive, val: ${this.delayVal1}`);
  }
  build() {
    Column() {
      Text(`Delay Param： ${this.delayVal1}`);
    }
  }
}

@ComponentV2
struct TabsComponent {
  private controller: TabsController = new TabsController();
  @Local tabState: int = 47;

  // 监听tabState的变化
  @Monitor(['tabState']) onTabStateChanged(m: IMonitor) {
    console.info(`Appmonitor TabsComponent: changed ${m.dirty[0]}: ${m.value<int>()?.before} -> ${m.value<int>()?.now}`);
  }

  build() {
    Column() {
      Button(`Incr state ${this.tabState}`)
        .fontSize(25)
        .onClick(() => {
          console.info('Button increment state value');
          this.tabState = this.tabState + 1;
        })

      // 定义Tabs组件
      Tabs({ barPosition: BarPosition.Start, index: 0, controller: this.controller}) {
        TabContent() {
          ParamComponent({val: this.tabState})
        }
        .tabBar('Update')
        TabContent() {
          DelayComponent({delayVal1: this.tabState})
        }
        .tabBar('DelayUpdate')
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

@ComponentV2
struct PageOneStack {
  @Consumer('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        TabsComponent();

        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            // 跳转到pageTwo
            let info: NavPathInfo = new NavPathInfo('pageTwo', undefined);
            this.pageInfo.pushPath(info);
          })
        }
      .width('100%')
      .height('100%')
    }
    .title('pageOne')
  }
}

@ComponentV2
struct PageTwoStack {
  @Consumer('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            // 返回上一个页面后仅解冻可见的TabContent
            this.pageInfo.pop();
          })
        }
      .width('100%')
      .height('100%')
    }
    .title('pageTwo')
  }
}

@Entry
@ComponentV2
struct LifecycleActiveInactiveIndex {
  @Provider('pageInfo') pageInfo: NavPathStack = new NavPathStack();

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
            .onClick(() => {
              // 跳转到pageOne
              let info: NavPathInfo = new NavPathInfo('pageOne', undefined);
              this.pageInfo.pushPath(info);
            })
        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
    }
  }
}
// [End LifecycleActiveInactive]

@Builder
export function lifecycleActiveInactive(): void {
  NavDestination() {
    LifecycleActiveInactiveIndex();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.lifecycle_active_inactive_title'))
}
