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
// [Start transition_effectExample5]
import {
  Entry,
  Component,
  State,
  Stack,
  Text,
  Grid,
  GridItem,
  ForEach,
  TransitionEffect,
  Curve,
  AnimateParam,
  SizeOptions
} from '@kit.ArkUI';

const ITEM_COUNTS: int = 9;
const ITEM_COLOR: string = '#ED6F21';
const INTERVAL: int = 30;
const DURATION: int = 300;

@Entry
@Component
struct Index1 {
  @State isGridShow: boolean = false;
  private dataArray: int[] = [];

  aboutToAppear(): void {
    for (let i: int = 0; i < ITEM_COUNTS; i++) {
      this.dataArray.push(i);
    }
  }

  build(): void {
    Stack() {
      if (this.isGridShow) {
        Grid() {
          ForEach(this.dataArray, (item: int, index: int) => {
            GridItem() {
              Stack() {
                Text((item + 1).toString())
              }
              .size({ width: 50, height: 50 } as SizeOptions)
              .backgroundColor(ITEM_COLOR)
              .transition(TransitionEffect.OPACITY
                .combine(TransitionEffect.scale({ x: 0.5, y: 0.5 }))// 对每个方格的转场添加delay，实现组件的渐次出现消失效果
                .animation({ duration: DURATION, curve: Curve.Friction, delay: INTERVAL * index } as AnimateParam))
              .borderRadius(10)
            }
            // 消失时，如果不对方格的所有父控件添加转场效果，则方格的消失转场不会生效
            // 此处让方格的父控件在出现消失转场时一直以0.99的透明度显示，使得方格的转场效果不受影响
            .transition(TransitionEffect.opacity(0.99))
          }, (item: int) => item.toString())
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(15)
        .columnsGap(15)
        .size({ width: 180, height: 180 } as SizeOptions)
        // 消失时，如果不对方格的所有父控件添加转场效果，则方格的消失转场不会生效
        // 此处让父控件在出现消失转场时一直以0.99的透明度显示，使得方格的转场效果不受影响
        .transition(TransitionEffect.opacity(0.99))
      }
    }
    .size({ width: '100%', height: '100%' } as SizeOptions)
    .onClick(() => {
      this.getUIContext()?.animateTo({
        duration: DURATION + INTERVAL * (ITEM_COUNTS - 1),
        curve: Curve.Friction
      } as AnimateParam, () => {
        this.isGridShow = !this.isGridShow;
      })
    })
  }
}

// [End transition_effectExample5]
