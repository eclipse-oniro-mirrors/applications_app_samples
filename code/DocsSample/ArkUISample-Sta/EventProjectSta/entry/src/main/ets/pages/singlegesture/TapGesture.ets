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

// [Start catch_click_twice_event]
import { $r, Column, ColumnOptions, Component, Entry, GestureEvent, NavDestination, Padding, State, TapGesture, Text } from '@kit.ArkUI';

@Entry
@Component
export struct Tap {
  @State value: string = '';

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        Column() {
          Text('Click twice').fontSize(28)
            .gesture(
              // 绑定count为2的TapGesture
              TapGesture({ count: 2 })
                .onAction((event: GestureEvent|undefined) => {
                  if(event){
                    this.value = `{\"id\":${event.fingerList[0].id},\"hand\":${event.fingerList[0].hand},` +
                      `\"globalX\":${event.fingerList[0].globalX},\"globalY\":${event.fingerList[0].globalY},` +
                      `\"localX\":${event.fingerList[0].localX},\"localY\":${event.fingerList[0].localY},` +
                      `\"displayX\":${event.fingerList[0].displayX},\"displayY\":${event.fingerList[0].displayY},` +
                      `\"globalDisplayX\":${event.fingerList[0].globalDisplayX},` +
                      `\"globalDisplayY\":${event.fingerList[0].globalDisplayY}}`;
                  }
                }))
          Text(this.value)
        }
        .height(300)
        .width(250)
        .padding(20)
        .border({ width: 3 })
        .margin(30)
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 } as Padding)
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.singlegesture_TapGesture_title')替换为实际资源文件，在本示例中该资源文件的value值为"点击手势"
    .title($r('app.string.singlegesture_TapGesture_title'))
  }
}
// [End catch_click_twice_event]