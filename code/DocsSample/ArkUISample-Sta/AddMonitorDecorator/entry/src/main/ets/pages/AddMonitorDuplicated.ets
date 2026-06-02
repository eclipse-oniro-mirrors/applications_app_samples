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
// [Start AddMonitorDuplicated]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace value: int = 0;
  valueMonitor?: IMonitorDecoratedVariable;
  valueMonitorDuplicated?: IMonitorDecoratedVariable;

  constructor() {
    // 可以重复为同一对状态变量和回调函数多次添加监听关系
    // 但返回不同的唯一性句柄
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);
    this.valueMonitorDuplicated = UIUtils.addMonitor(() => this.value, this.onChange);
  }

  onChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
    })
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
          this.obj.value++;
        })
      // 清除重复监听之后，修改状态变量只会触发一次回调函数
      // 即不影响先前绑定的监听关系
      Button(`Clear the duplicated monitor.`)
        .fontSize(20)
        .onClick(() => {
          UIUtils.clearMonitor(this.obj.valueMonitorDuplicated!);
        })
    }
  }
}
// [End AddMonitorDuplicated]

@Builder
export function addMonitorDuplicated(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_duplicated_title'))
}