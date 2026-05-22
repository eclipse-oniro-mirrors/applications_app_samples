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
// [Start SyncMonitorMultiVars]
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Index {
  @Local message: string = 'Hello World';
  @Local name: string = 'Tom';
  @Local age: number = 24;

  @SyncMonitor(['message', 'name'])
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      hilog.info(0xFF00, 'testTag', '%{public}s',
        `${path} changed from ${monitor.value<string>(path)?.before} to ${monitor.value<string>(path)?.now}`);
    });
  }

  build() {
    Column() {
      Button('change string')
        .onClick(() => {
          this.message += '!';
          this.name = 'Jack';
        })
    }
  }
}

// [End SyncMonitorMultiVars]

@Builder
export function syncMonitorMultiVars(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.sync_monitor_multi_vars_title'))
}