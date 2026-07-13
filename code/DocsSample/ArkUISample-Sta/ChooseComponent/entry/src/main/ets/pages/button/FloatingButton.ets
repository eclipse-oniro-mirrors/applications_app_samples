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
  Entry,
  Component,
  Button,
  List,
  ListOptions,
  ForEach,
  Stack,
  Text,
  Image,
  NavDestination,
  NavPathStack,
  Resource,
  TextAlign,
  $r
} from '@kit.ArkUI'
import { State } from '@ohos.arkui.stateManagement'
import resourceToStringManager from '../../common/resource';

@Entry
@Component
export struct FloatingButton {
  @State private arr: Array<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  // [StartExclude floating_button]
  pathStack: NavPathStack = new NavPathStack();

  resourceToString(resource: Resource): string {
    return resourceToStringManager.resourceToString(resource);
  }
  // [EndExclude floating_button]

  build(): void {
    // [StartExclude floating_button]
    NavDestination() {
      
      Stack() {
        List({ space: 12, initialIndex: 0 } as ListOptions) {
          ForEach(this.arr, (item: int) => {
            Text(`${item}`)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }, (item: int) => item.toString())
        }
        .id('List')
        .width('100%')
        .padding({
          left: 15,
          right: 15
        })

        // [Start custom_button_function]
        Button() {
          Image($r('sys.media.ohos_ic_public_add'))
            .fillColor(0xffffff)
            .width(24)
            .height(24)
        }
        .id('Button')
        .width(40)
        .height(40)
        .position({ x: '80%', y: 570 })
        .onClick(() => {
          // 需要执行的操作
          // [StartExclude custom_button_function]
          this.arr.push(this.arr.length);
          // [EndExclude custom_button_function]
        })
        // [End custom_button_function]
      }
      .width('100%')
      .height('100%')
      .backgroundColor(0xDCDCDC)
      .padding({ top: 6 })
    }
    // [End floating_button]
    .backgroundColor('#f1f2f3')
    .title(this.resourceToString($r('app.string.FloatingButton_title')))
  }
}