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
// [Start ComputedMonitor]
import { Button, ClickEvent, Column, ComponentV2, Computed, Entry, IMonitor, Local, Monitor, ObservedV2, Row, Text, Trace } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MyView {
  @Local celsius: number = 20;

  @Computed
  get fahrenheit(): number {
    return this.celsius * 9 / 5 + 32; // C -> F
  }

  @Computed
  get kelvin(): number {
    return (this.fahrenheit - 32) * 5 / 9 + 273.15; // F -> K
  }

  @Monitor(['kelvin'])
  onKelvinMonitor(mon: IMonitor) {
    console.info('kelvin changed from ' + mon.value<Any>()?.before + ' to ' + mon.value<Any>()?.now);
  }

  build() {
    Column() {
      Row() {
        Button('-')
          .onClick((e: ClickEvent) => {
            this.celsius--;
          })

        Text(`Celsius ${this.celsius.toFixed(1)}`).fontSize(50)

        Button('+')
          .onClick((e: ClickEvent) => {
            this.celsius++;
          })
      }

      Text(`Fahrenheit ${this.fahrenheit.toFixed(2)}`).fontSize(50)
      Text(`Kelvin ${this.kelvin.toFixed(2)}`).fontSize(50)
    }
    .width('100%')
  }
}

// [End ComputedMonitor]

@Builder
export function computedMonitor(): void {
  NavDestination() {
    MyView();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.computed_monitor_title'))
}