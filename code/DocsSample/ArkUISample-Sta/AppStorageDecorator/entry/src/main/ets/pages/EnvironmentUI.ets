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
// [Start EnvironmentUI]
import {
  Entry,
  Text,
  Row,
  Column,
  Component,
  Button,
  ClickEvent,
  Environment,
  StoragePropRef,
  LayoutDirection,
  ColorMode
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @StoragePropRef('languageCode') languageCode: string = 'en';
  @StoragePropRef('layoutDirection') layoutDirection: LayoutDirection = LayoutDirection.RTL;
  @StoragePropRef('colorMode') colorMode: ColorMode = ColorMode.DARK;
  @StoragePropRef('accessibilityEnabled') accessibilityEnabled: boolean = true;
  @StoragePropRef('fontScale') fontScale: number = 5;
  @StoragePropRef('fontWeightScale') fontWeightScale: number = 10;
  @StoragePropRef('info') info: string = 'Hi';
  // 在ArkTS-Sta中，全局的逻辑代码不会默认执行。开发者可将需要执行的逻辑代码移至static代码块中，以达到与ArkTS-Dyn一样的效果。
  static {
    Environment.envProp<string>('languageCode', 'en');
    Environment.envProp<LayoutDirection>('layoutDirection', LayoutDirection.RTL);
    Environment.envProp<ColorMode>('colorMode', ColorMode.LIGHT);
    Environment.envProp<boolean>('accessibilityEnabled', true);
    Environment.envProp<number>('fontScale', 10);
    Environment.envProp<number>('fontWeightScale', 50);
    // 如果key不属于系统内置参数，则可自行设置，变量将会存入AppStorage中。
    Environment.envProp<string>('info', 'Hello World!');
  }

  build() {
    Row() {
      Column() {
        // 输出当前设备的languageCode
        Text(`Device languageCode is ${this.languageCode}`)
          .fontSize(20)
          .margin(10)
        // 输出当前设备的layoutDirection
        Text(`Device layoutDirection is ${this.layoutDirection}`)
          .fontSize(20)
          .margin(10)
        // 输出当前设备的colorMode
        Text(`Device colorMode is ${this.colorMode}`)
          .fontSize(20)
          .margin(10)
        // 输出当前设备的accessibilityEnabled
        Text(`Device accessibilityEnabled is ${this.accessibilityEnabled}`)
          .fontSize(20)
          .margin(10)
        // 输出当前设备的fontScale
        Text(`Device fontScale is ${this.fontScale}`)
          .fontSize(20)
          .margin(10)
        // 输出当前设备的fontWeightScale
        Text(`Device fontWeightScale is ${this.fontWeightScale}`)
          .fontSize(20)
          .margin(10)
        // 自己设置的info变量
        Text(`info value is ${this.info}`)
          .fontSize(20)
          .margin(10)
      }
      .width('100%')
    }
  }
}
// [End EnvironmentUI]

@Builder
export function environmentUI(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.environment_ui_title'))
}