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
// [Start BuilderParamJumpLogic]
import { Entry, Component, Column, Builder, BuilderParam, Text, Color, Navigation, NavigationMode, Button, NavPathStack, ButtonType, NavPathInfo, NavDestination, State, FontWeight, NavDestinationContext } from '@kit.ArkUI';

class NavigationParams {
  boo: boolean = true;
  pathStack: NavPathStack = new NavPathStack();
  constructor(boo: boolean) {
    this.boo = boo;
  }
}

@Component
struct HelloWorldPage {
  @State message: string = 'Hello World';
  @State pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Button(`call back`)
          .onClick(() => {
            this.pathStack.pop();
          })
          .width('80%')
          .margin(20)
      }
    }
    .height('100%')
    .width('100%')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}
@Builder
function PageBuilder(name: string, param: Object|null|undefined) {
  if (name == 'HelloWorldPage') {
    HelloWorldPage()
  }
}
@Builder
function navigationAction(params: NavigationParams) {
  Column() {
    Navigation(params?.pathStack) {
      Button('router to page', { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick((e) => {
          // 通过修改@BuilderParam参数决定是否跳转。
          if (params.boo) {
            try{
              let info: NavPathInfo = new NavPathInfo('HelloWorldPage',new Object());
              params?.pathStack?.pushPath(info, true);
            } catch(e) {
              console.error(e);
            }
          } else {
            console.info('@BuilderParam setting does not jump');
          }
        })
    }
    .navDestination(PageBuilder)
    .hideTitleBar(true, true)
    .height('100%')
    .width('100%')
  }
  .height('25%')
  .width('100%')
}

@Entry
@Component
struct ParentPage {
  @State info: NavigationParams = new NavigationParams(true);

  build() {
    Column() {
      Text('ParentPage')
      navigationAction(this.info)
      ChildPageOne()
      ChildPageBuilderParam({ eventBuilder: navigationAction })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ChildPageOne {
  @State info: NavigationParams = new NavigationParams(true);

  build() {
    Column() {
      Text('ChildPage')
      navigationAction(this.info)
    }
  }
}

@Component
struct ChildPageBuilderParam {
  @State info: NavigationParams = new NavigationParams(false);
  @BuilderParam eventBuilder: (param: NavigationParams) => void = navigationAction;

  build() {
    Column() {
      Text('ChildPageBuilderParam')
      // 对传递过来的全局@Builder进行参数修改，可以实现禁用点击跳转的功能。
      this.eventBuilder(this.info)
    }
  }
}

// [End BuilderParamJumpLogic]

@Builder
export function builderParamJumpLogic(): void {
  NavDestination() {
    ParentPage();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builderparam_jump_logic_title'))
}
