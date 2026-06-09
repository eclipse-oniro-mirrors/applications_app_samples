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

import {
  Component,
  Column,
  Entry,
  NavDestination,
  NavPathStack,
  Navigation,
  Button,
  NavPathInfo,
  NavigationTitleMode,
  ButtonType,
  ButtonOptions,
  NavigationOperation,
  NavDestinationTransition,
  Curve
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavDestinationCustomTransition {
  stack: NavPathStack = new NavPathStack();

  @Builder
  pageMap(name: string) {
    if (name) {
      NavDest();
    }
  }

  aboutToAppear(): void {
    this.stack.pushPath(new NavPathInfo('dest0', undefined));
  }

  build() {
    Navigation(this.stack) {
      // empty
    }
    .navDestination(this.pageMap)
    .hideNavBar(true)
    .title('Main Page')
    .titleMode(NavigationTitleMode.Mini)
  }
}

declare type voidFunc = () => void;

@Component
struct NavDest {
  @State name: string = 'NA';
  @State destWidth: string = '100%';
  stack: NavPathStack = new NavPathStack();
  @State y: string = '0';

  build() {
    NavDestination() {
      Column() {
        Button('push next page', { stateEffect: true, type: ButtonType.Capsule } as ButtonOptions)
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.stack.pushPath(new NavPathInfo(this.name == 'PageOne' ? 'PageTwo' : 'PageOne', undefined));
          })
      }
      .size({ width: '100%', height: '100%' })
    }
    .title(this.name)
    .translate({ y: this.y })
    .onReady((context) => {
      this.name = context.pathInfo.name;
      this.stack = context.pathStack;
    })
    .backgroundColor(this.name == 'PageOne' ? '#F1F3F5' : '#ff11dee5')
    .customTransition(
      (op: NavigationOperation, isEnter: boolean)
        : Array<NavDestinationTransition> | undefined => {
        console.info('[NavDestinationTransition]', 'reached delegate in frontend, op: ' + op + ', isEnter: ' + isEnter);

        let transitionOneEvent: voidFunc = () => { console.info('[NavDestinationTransition]', 'reached transitionOne, empty now!'); };
        let transitionOneFinishEvent: voidFunc = () => { console.info('[NavDestinationTransition]', 'reached transitionOneFinish, empty now!'); };
        let transitionOneDuration: int = 500;
        if (op === NavigationOperation.PUSH) {
          if (isEnter) {
            // ENTER_PUSH
            this.y = '100%';
            transitionOneEvent = () => {
              console.info('[NavDestinationTransition]', 'transitionOne, push & isEnter');
              this.y = '0';
            };
          } else {
            // EXIT_PUSH
            this.y = '0';
            transitionOneEvent = () => {
              console.info('[NavDestinationTransition]', 'transitionOne, push & !isEnter');
              this.y = '0';
            };
            transitionOneDuration = 450;
          }
        } else if (op === NavigationOperation.POP) {
          if (isEnter) {
            // ENTER_POP
            this.y = '0';
            transitionOneEvent = () => {
              console.info('[NavDestinationTransition]', 'transitionOne, pop & isEnter');
              this.y = '0';
            };
          } else {
            // EXIT_POP
            this.y = '0';
            transitionOneEvent = () => {
              console.info('[NavDestinationTransition]', 'transitionOne, pop & !isEnter');
              this.y = '100%';
            };
          }
        } else {
          console.info('[NavDestinationTransition]', '----- NOT-IMPL BRANCH of NAV-DESTINATION CUSTOM TRANSITION -----');
        }

        let transitionOne: NavDestinationTransition = {
          duration: transitionOneDuration,
          delay: 0,
          curve: Curve.Friction,
          event: transitionOneEvent,
          onTransitionEnd: transitionOneFinishEvent
        };

        let transitionTwoEvent: voidFunc = () => { console.info('[NavDestinationTransition]', 'reached transitionTwo, empty now!'); };
        let transitionTwo: NavDestinationTransition = {
          duration: 1000,
          delay: 0,
          curve: Curve.EaseInOut,
          event: transitionTwoEvent,
          onTransitionEnd: () => { console.info('[NavDestinationTransition]', 'reached Two\'s finish'); }
        };

        return [
          transitionOne,
          transitionTwo,
        ];
      })
  }
}