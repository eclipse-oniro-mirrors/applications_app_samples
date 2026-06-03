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
// [Start AddMonitorOwner]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, Text, UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Page {
  @Local value: int = 0;
  valueMonitor?: IMonitorDecoratedVariable;

  onChange(monitor: IMonitor) {
    console.info('[DynamicMonitor] Callback triggered.');

    monitor.dirty.forEach((path: string) => {
      console.info(`[DynamicMonitor] Value ${path} has changed from ${monitor.value<int>(path)?.before} to ${monitor.value<int>(path)?.now}.`);
    });
  }

  aboutToAppear() {
    console.info('[DynamicMonitor] Test case begin.')

    // 对于监听组件的状态变量
    // 建议将组件作为owner传递给addMonitor
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange, { owner: this });
  }

  build() {
    Column() {
      Text(`Current value is ${this.value}`)
      Button('Increase the value')
        .onClick(() => {
          this.value++;
        })
    }
  }
}
// [End AddMonitorOwner]

@Builder
export function addMonitorOwner(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_owner_title'))
}