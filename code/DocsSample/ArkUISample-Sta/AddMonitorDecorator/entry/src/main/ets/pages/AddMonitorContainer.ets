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
// [Start add_monitor_container]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, ObservedV2, Text, Trace, UIUtils } from '@kit.ArkUI';

@ObservedV2
export class Test {
  @Trace array: Array<int> = [1, 2, 3, 4, 5];
  @Trace map: Map<number, string> = new Map<number, string>([[1, 'first'], [2, 'second']]);

  arrayMonitor?: IMonitorDecoratedVariable;
  mapMonitor?: IMonitorDecoratedVariable;

  constructor() {
    // 只监听容器替换，而不监听容器内元素变更
    // 即被监听的对象的子对象变更不会触发事件
    // 只有被监听的对象本身变化才能触发事件
    this.arrayMonitor = UIUtils.addMonitor(() => this.array, this.onChange);
    this.mapMonitor = UIUtils.addMonitor(() => this.map, this.onMapChange);
  }

  onChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<Array<int>>(path)?.before} to ${m.value<Array<int>>(path)?.now}`);
    })
  }

  onMapChange(m: IMonitor): void {
    m.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] value ${path} has changed from ${m.value<Map<number, string>>(path)?.before} to ${m.value<Map<number, string>>(path)?.now}`);
    })
  }
}

@Entry
@ComponentV2
struct AddMonitorContainerExample {
  @Local obj: Test = new Test();

  aboutToAppear(): void {
    console.info('[DynamicMonitor] Test case begin.');
  }

  build() {
    Column() {
      Text(`Current array: ${this.obj.array}`)
      Text(`Current map: ${this.obj.map}`)
      Button(`Modify container`)
        .fontSize(20)
        .onClick(() => {
          // 容器内的值发生变更不会使
          // 监听容器本身的回调函数触发
          for (let index = 0; index < 5; index++) {
            this.obj.array[index]++;
          }

          // 修改容器对象本身会触发回调函数
          this.obj.map = new Map<number, string>();
        })
    }
  }
}
// [End add_monitor_container]

@Builder
export function addMonitorContainer(): void {
  NavDestination() {
    AddMonitorContainerExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_container_title'))
}