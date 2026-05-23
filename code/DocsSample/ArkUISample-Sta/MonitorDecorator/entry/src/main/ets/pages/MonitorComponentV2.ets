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
// [Start MonitorComponentV2]
import { Button, Column, ComponentV2, Entry, IMonitor, Local, Monitor } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Local message: string = 'Hello World';
  @Local name: string = 'Tom';
  // 监听message、name的变化
  @Monitor(['message', 'name'])
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.info(`${path} changed from ${monitor.value<Any>(path)?.before} to ${monitor.value<Any>(path)?.now}`);
    });
  }
  build() {
    Column() {
      Button('change string')
        .onClick((e) => {
          // 修改message、name的值
          this.message += '!';
          this.name = 'Jack';
      })
    }
  }
}

// [End MonitorComponentV2]

@Builder
export function monitorComponentV2(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_component_v2_title'))
}