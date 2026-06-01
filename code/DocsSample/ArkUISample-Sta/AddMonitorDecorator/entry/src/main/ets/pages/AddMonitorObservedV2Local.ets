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
// [Start AddMonitorObservedV2Local]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Text, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace value: int = 0;
  valueMonitor?: IMonitorDecoratedVariable;

  constructor() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);
  }

  onChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
    })
  }
}

@ComponentV2
struct Child {
  @Local value: double = 0.0;
  valueMonitor?: IMonitorDecoratedVariable;

  aboutToAppear() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);
  }

  onChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<double>(path)?.before} to ${m.value<double>(path)?.now}`);
    })
  }

  build() {
    Column() {
      Text(`Current ComponentV2 value is ${this.value}`)
      Button(`Add value in ComponentV2`)
        .onClick(() => {
          this.value += 0.1;
        })
    }
  }
}

@Entry
@ComponentV2
struct Page {
  @Local obj: Test = new Test();

  aboutToAppear(): void {
    console.info(`[DynamicMonitor] Test case begin.`)
  }

  build() {
    Column() {
      Text(`Current ObservedV2 value is ${this.obj.value}`)
      Button(`Add value in ObservedV2`)
        .fontSize(20)
        .onClick(() => {
          this.obj.value++;
        })
      Child()
    }
  }
}
// [End AddMonitorObservedV2Local]

@Builder
export function addMonitorObservedV2Local(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_observed_v2_local_title'))
}