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

import { ComponentCard } from '../../common/Card';
import {
  Entry,
  Component,
  Button,
  ButtonType,
  ButtonOptions,
  Column,
  ColumnOptions,
  NavDestination,
  NavPathStack,
  Resource,
  $r
} from '@kit.ArkUI'
import resourceToStringManager from '../../common/resource';

@Entry
@Component
export struct SetButtonType {
  pathStack: NavPathStack = new NavPathStack();

  resourceToString(resource: Resource): string {
    return resourceToStringManager.resourceToString(resource);
  }

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        ComponentCard({
          title: $r('app.string.SetButtonType_titleOne'),
          description: $r('app.string.SetButtonType_descriptionOne')
        }) {
          // [Start create_capsule_button]
          Button('Button', { type: ButtonType.Capsule } as ButtonOptions)
            .id('Capsule')
          // [End create_capsule_button]

          // [Start create_capsule_button2]
          Button('Disable', { type: ButtonType.Capsule, stateEffect: false } as ButtonOptions)
            .backgroundColor(0x317aff)
            .width(90)
            .height(40)
          // [End create_capsule_button2]
        }

        ComponentCard({
          title: $r('app.string.SetButtonType_titleTwo'),
          description: $r('app.string.SetButtonType_descriptionTwo')
        }) {
          // [Start create_circle_button]
          Button('Button', { type: ButtonType.Circle } as ButtonOptions)
            .id('Circle')
            .width(80)
          // [End create_circle_button]

          // [Start create_circle_button2]
          Button('Circle', { type: ButtonType.Circle, stateEffect: false } as ButtonOptions)
            .backgroundColor(0x317aff)
            .width(90)
            .height(90)
          // [End create_circle_button2]
        }

        ComponentCard({
          title: $r('app.string.SetButtonType_titleThree'),
          description: $r('app.string.SetButtonType_descriptionThree')
        }) {
          // [Start create_normal_button]
          Button('Button', { type: ButtonType.Normal } as ButtonOptions)
            .id('Normal')
          // [End create_normal_button]

          // [Start create_normal_button2]
          Button('Ok', { type: ButtonType.Normal, stateEffect: true } as ButtonOptions)
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .height(40)
          // [End create_normal_button2]
        }

        ComponentCard({
          title: $r('app.string.SetButtonType_titleFour'),
          description: $r('app.string.SetButtonType_descriptionFour')
        }) {
          Button('Button', { type: ButtonType.ROUNDED_RECTANGLE } as ButtonOptions)
            .id('Round')

          // [Start create_rounded_rectangle_button]
          Button('Disable', { type: ButtonType.ROUNDED_RECTANGLE, stateEffect: true } as ButtonOptions)
            .backgroundColor(0x317aff)
            .width(90)
            .height(40)
          // [End create_rounded_rectangle_button]
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor('#f1f2f3')
    .title(this.resourceToString($r('app.string.SetButtonType_title')))
  }
}