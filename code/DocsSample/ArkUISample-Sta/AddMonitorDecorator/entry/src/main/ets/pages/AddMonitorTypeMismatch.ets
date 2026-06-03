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
// [Start add_monitor_type_mismatch]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace value: int = 0;
  @Trace valueError: number = 0;
  valueMonitor?: IMonitorDecoratedVariable;
  valueMonitorDuplicated?: IMonitorDecoratedVariable;

  constructor() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);

    // 在这个监听关系的回调函数中
    // number（编译后为Double）与Int类型不匹配
    // 因此无法通过dirty获取监听变量的新值和旧值
    this.valueMonitorDuplicated = UIUtils.addMonitor(() => this.valueError, this.onChange);
  }

  onChange(m: IMonitor): void {
    // 日志正常打印
    console.info('[DynamicMonitor] Callback triggered.');

    // 类型不匹配抛出ClassCastError异常
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
    })
  }
}

@Entry
@ComponentV2
struct AddMonitorTypeMismatchExample {
  @Local obj: Test = new Test();

  aboutToAppear(): void {
    console.info(`[DynamicMonitor] Test case begin.`)
  }

  build() {
    Column() {
      Button(`Current number: ${this.obj.value}`)
        .fontSize(20)
        .onClick(() => {
          this.obj.value++;
          this.obj.valueError++;
        })
    }
  }
}
// [End add_monitor_type_mismatch]

@Builder
export function addMonitorTypeMismatch(): void {
  NavDestination() {
    AddMonitorTypeMismatchExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_type_mismatch_title'))
}