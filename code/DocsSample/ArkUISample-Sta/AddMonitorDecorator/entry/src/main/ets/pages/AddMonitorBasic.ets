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
// [Start AddMonitorBasic]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace value: string = '';
  @Trace arrayValue: Array<int> = [1, 2, 3, 4, 5];
  valueMonitor?: IMonitorDecoratedVariable;
  arrayMonitor?: IMonitorDecoratedVariable;

  constructor() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);

    let callbackArray: Array<() => Any> = [];
    for (let index = 0; index < 5; index++) {
      callbackArray.push(() => this.arrayValue[index]);
    }
    this.arrayMonitor = UIUtils.addMonitor(callbackArray, this.onArrayChange);
  }

  onChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
    });
  }

  onArrayChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] array ${path} value has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
    });
  }
}

@Entry
@ComponentV2
struct Page {
  @Local obj: Test = new Test();

  aboutToAppear(): void {
    console.info(`[DynamicMonitor] Test case begin.`);
  }

  build() {
    Column() {
      Button(`Current number: ${this.obj.value}`)
        .fontSize(20)
        .onClick(() => {
          this.obj.value += 'a';
          for (let index = 0; index < 5; index++) {
            this.obj.arrayValue[index]++;
          }
        })
    }
  }
}
// [End AddMonitorBasic]

@Builder
export function addMonitorBasic(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_basic_title'))
}