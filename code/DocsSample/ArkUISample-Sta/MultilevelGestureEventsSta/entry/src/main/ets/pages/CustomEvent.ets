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
import { Entry, Component, Column, Stack, TapGesture, FlexAlign } from '@kit.ArkUI'
import type { HitTestMode, Color, Rectangle } from '@kit.ArkUI'

// 使用接口来定义矩形区域
const rect1: Rectangle = {
  x: 10,
  y: 10,
  width: 80,
  height: 40
} as Rectangle;
const rect2: Rectangle = {
  x: 110,
  y: 10,
  width: 80,
  height: 40
} as Rectangle;
const rect3: Rectangle = {
  x: 10,
  y: 60,
  width: 80,
  height: 40
} as Rectangle;
const rect4: Rectangle = {
  x: 0,
  y: 0,
  width: 200,
  height: 150
} as Rectangle;

@Entry
@Component
struct CustomEvent {
  build() {
    Column(undefined) {
      // [Start response_region]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))
          .responseRegion([rect1, rect2, rect3])
      }
      .id('ComponentA')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))
      .responseRegion([rect4])

      // [End response_region]

      // [Start hittestbehavior_first]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))

        Column(undefined) {
          Column(undefined)
            .id('ComponentD')
            .onTouch(() => {
            })
            .gesture(TapGesture({ count: 1 }))
        }
        .id('ComponentC')
        .onTouch(() => {
        })
        .gesture(TapGesture({ count: 1 }))
        .hitTestBehavior(HitTestMode.Block)
      }
      .id('ComponentA')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))

      // [End hittestbehavior_first]

      // [Start responseregion_second]
      Stack(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))

        Column(undefined)
          .id('ComponentC')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))
          .hitTestBehavior(HitTestMode.Transparent)
      }
      .id('Stack A')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))

      // [End responseregion_second]

      // [Start responseregion_thirdly]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))
      }
      .id('ComponentA')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))
      .hitTestBehavior(HitTestMode.None)

      // [End responseregion_thirdly]

      // [Start responseregion_fourth]
      Stack(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))
        Column(undefined) {
          Column(undefined)
            .id('ComponentD')
            .onTouch(() => {
            })
            .gesture(TapGesture({ count: 1 }))
        }
        .id('ComponentC')
        .onTouch(() => {
        })
        .gesture(TapGesture({ count: 1 }))
        .hitTestBehavior(HitTestMode.Block)
      }
      .id('Stack A')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))

      // [End responseregion_fourth]

      // [Start responseregion_fifth]
      Stack(undefined) {
        Column(undefined)
          .id('ComponentB')
          .onTouch(() => {
          })
          .gesture(TapGesture({ count: 1 }))
        Column(undefined) {
          Column(undefined)
            .id('ComponentD')
            .onTouch(() => {
            })
            .gesture(TapGesture({ count: 1 }))
        }
        .id('ComponentC')
        .onTouch(() => {
        })
        .gesture(TapGesture({ count: 1 }))
        .hitTestBehavior(HitTestMode.Block)
      }
      .id('Stack A')
      .onTouch(() => {
      })
      .gesture(TapGesture({ count: 1 }))

      // [End responseregion_fifth]

      // [Start bindingfirst_gesture]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .gesture(TapGesture({ count: 1 }))
      }
      .id('ComponentA')
      .gesture(TapGesture({ count: 1 }))

      // [End bindingfirst_gesture]

      // [Start bindingsecond_gesture]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .gesture(TapGesture({ count: 1 }))
      }
      .id('ComponentA')
      .priorityGesture(TapGesture({ count: 1 }))

      // [End bindingsecond_gesture]

      // [Start bindingthirdly_gesture]
      Column(undefined) {
        Column(undefined)
          .id('ComponentB')
          .gesture(TapGesture({ count: 1 }))
      }
      .id('ComponentA')
      .parallelGesture(TapGesture({ count: 1 }))

      // [End bindingthirdly_gesture]
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
  }
}
