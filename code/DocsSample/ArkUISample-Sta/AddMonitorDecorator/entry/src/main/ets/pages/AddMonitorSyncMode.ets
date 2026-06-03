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
// [Start AddMonitorSyncMode]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace value: string = '';
  @Trace value2: string = '';
  valueMonitor?: IMonitorDecoratedVariable;
  value2Monitor?: IMonitorDecoratedVariable;

  constructor() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);
    this.value2Monitor = UIUtils.addMonitor(() => this.value2, this.onSyncChange, { isSynchronous: true });
  }

  onChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
    });
  }

  onSyncChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value has changed synchronously from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
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
      Button(`Current number: ${this.obj.value} | ${this.obj.value2}`)
        .fontSize(20)
        .onClick(() => {
          // 虽然value的修改先于value2的修改
          // 但value2绑定的监听关系是同步模式
          // 因此回调函数调用value2会先于value
          this.obj.value += 'a';
          this.obj.value2 += 'b';
        })
    }
  }
}
// [End AddMonitorSyncMode]

@Builder
export function addMonitorSyncMode(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_sync_mode_title'))
}