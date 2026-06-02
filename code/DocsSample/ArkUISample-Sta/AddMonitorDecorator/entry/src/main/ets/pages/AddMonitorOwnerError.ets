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
// [Start add_monitor_owner_error]
import { Button, Column, Component, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, State, Text, UIUtils } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
struct Test {
  @State value: int = 0;
  valueMonitor?: IMonitorDecoratedVariable;

  aboutToAppear() {
    try {
      // 触发 130000 BusinessError
      this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange, { owner: this });
    } catch (err) {
      // 错误码需要捕获异常后输出
      if (err instanceof BusinessError) {
        console.error(`[DynamicMonitor] Error code: ${err.code}, message: ${err.message}`);
      }
    }
  }

  onChange(mon: IMonitor) {
      mon.dirty.forEach((path: string) => {
        console.info(`[DynamicMonitor] value ${path} has changed from ${mon.value<int>(path)?.before} to ${mon.value<int>(path)?.now}.`);
      })
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

@Entry
@ComponentV2
struct AddMonitorOwnerErrorExample {
  build() {
    Column() {
      Test()
    }
  }
}
// [End add_monitor_owner_error]

@Builder
export function addMonitorOwnerError(): void {
  NavDestination() {
    AddMonitorOwnerErrorExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_owner_error_title'))
}