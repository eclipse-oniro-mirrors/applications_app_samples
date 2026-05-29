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
  Environment,
  StoragePropRef,
  LayoutDirection,
  ColorMode
} from '@kit.ArkUI';

@Entry
@Component
struct EnvironmentUIComponent {
  @StoragePropRef('languageCode') languageCode: string = 'en';
  @StoragePropRef('layoutDirection') layoutDirection: LayoutDirection = LayoutDirection.RTL;
  @StoragePropRef('colorMode') colorMode: ColorMode = ColorMode.DARK;
  @StoragePropRef('accessibilityEnabled') accessibilityEnabled: boolean = true;
  @StoragePropRef('fontScale') fontScale: number = 5;
  @StoragePropRef('fontWeightScale') fontWeightScale: number = 10;
  @StoragePropRef('info') info: string = 'Hi';
  static {
    Environment.envProp<string>('languageCode', 'en');
    Environment.envProp<LayoutDirection>('layoutDirection', LayoutDirection.RTL);
    Environment.envProp<ColorMode>('colorMode', ColorMode.LIGHT);
    Environment.envProp<boolean>('accessibilityEnabled', true);
    Environment.envProp<number>('fontScale', 10);
    Environment.envProp<number>('fontWeightScale', 50);
    Environment.envProp<string>('info', 'Hello World!');
  }

  build() {
    Row() {
      Column() {
        Text(`Device languageCode is ${this.languageCode}`)
        Text(`Device layoutDirection is ${this.layoutDirection}`)
        Text(`Device colorMode is ${this.colorMode}`)
        Text(`Device accessibilityEnabled is ${this.accessibilityEnabled}`)
        Text(`Device fontScale is ${this.fontScale}`)
        Text(`Device fontWeightScale is ${this.fontWeightScale}`)
        Text(`info value is ${this.info}`)
      }
    }
  }
}

// [End EnvironmentUI]

@Builder
export function environmentUI(): void {
  NavDestination() {
    EnvironmentUIComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.environment_ui_title'))
}