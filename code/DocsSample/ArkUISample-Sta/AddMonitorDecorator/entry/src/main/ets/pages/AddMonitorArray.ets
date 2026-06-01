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
// [Start AddMonitorArray]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Text, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace array: int[] = [1, 2, 3];
  arrayMonitor?: IMonitorDecoratedVariable;

  constructor() {
    let callbackArray = this.array.map(
      (_: int, index: int): (() => Any) => () => this.array[index]
    );

    callbackArray.push(() => this.array.length);

    this.arrayMonitor = UIUtils.addMonitor(callbackArray, this.onChange);
  }

  onChange(monitor: IMonitor): void {
    console.info('[DynamicMonitor] Callback triggered.');

    monitor.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] Value ${path} has changed from ${monitor.value<int>(path)?.before} to ${monitor.value<int>(path)?.now}.`);
    });
  }
}

@Entry
@ComponentV2
struct Page {
  @Local obj: Test = new Test();

  aboutToAppear() {
    console.info('[DynamicMonitor] Test case begin.')
  }

  build() {
    Column() {
      Text(`Current array is: ${this.obj.array}`)
      Button('Add new value into array')
        .onClick(() => {
          this.obj.array.push(42);
        })
      Button('Increase registered value')
        .onClick(() => {
          for (let index: int = 0; index < 3; index++) {
            this.obj.array[index]++;
          }
        })
    }
  }
}
// [End AddMonitorArray]

@Builder
export function addMonitorArray(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_array_title'))
}