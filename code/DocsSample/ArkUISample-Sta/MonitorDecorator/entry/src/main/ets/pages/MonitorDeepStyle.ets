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
// [Start MonitorDeepStyle]
import { Button, Color, Column, ComponentV2, Entry, IMonitor, Monitor, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
export class Info {
  @Trace value: number = 50;
}
@ObservedV2
export class UIStyle {
  info: Info = new Info();
  @Trace color: Color = Color.Black;
  @Trace fontSize: number = 45;
  @Monitor(['info.value'])
  onValueChange(monitor: IMonitor): void {
    // lastValue与curValue决定了如何修改this.color与this.fontSize变量的值
    let lastValue: number = monitor.value<number>()?.before as number;
    let curValue: number = monitor.value<number>()?.now as number;
    if (lastValue != 0) {
      let diffPercent: number = (curValue - lastValue) / lastValue;
      if (diffPercent > 0.1) {
        this.color = Color.Red;
        this.fontSize = 50;
      } else if (diffPercent < -0.1) {
        this.color = Color.Green;
        this.fontSize = 40;
      } else {
        this.color = Color.Black;
        this.fontSize = 45;
      }
    }
  }
}
@Entry
@ComponentV2
struct Index {
  textStyle: UIStyle = new UIStyle();
  build() {
    Column() {
      Text(`Important Value: ${this.textStyle.info.value}`)
        .fontSize(20)
        .margin(10)
        .fontColor(this.textStyle.color)
        .fontSize(this.textStyle.fontSize)
      Button('change!')
        .width(300)
        .margin(10)
        .onClick((e) => {
          // 使用随机数改变this.textStyle.info.value的值
          this.textStyle.info.value = Math.floor(Math.random() * 100) + 1;
        })
    }
    .width('100%')
  }
}

// [End MonitorDeepStyle]

@Builder
export function monitorDeepStyle(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_deep_style_title'))
}