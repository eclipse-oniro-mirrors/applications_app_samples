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
// [Start AddMonitorSyncCallback]
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, Text, UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Page {
  @Local value: int = 0;
  valueMonitor?: IMonitorDecoratedVariable;

  aboutToAppear() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange, { isSynchronous: true });
  }

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: value ${path} has changed from ${mon.value<int>(path)?.before} to ${mon.value<int>(path)?.now}.`);
    })
  }

  build() {
    Column() {
      Text(`Current value is ${this.value}`)
      Button('Increase value')
        .onClick(() => {
          this.value++;
          this.value++;
        })
    }
  }
}
// [End AddMonitorSyncCallback]

@Builder
export function addMonitorSyncCallback(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_sync_callback_title'))
}