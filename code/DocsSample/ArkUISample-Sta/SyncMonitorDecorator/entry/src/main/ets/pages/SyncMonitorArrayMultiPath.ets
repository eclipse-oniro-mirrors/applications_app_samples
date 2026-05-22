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
// [Start SyncMonitorArrayMultiPath]
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button, ObservedV2, Trace } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DocSampleArrayMultiPath {
  @Local arr: Array<number> = [0, 1, 2, 3, 4, 5]

  @SyncMonitor(['arr','arr.0','arr.1','arr.2','arr.3','arr.4','arr.length'])
  onArrChangedSync(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `@SyncMonitor: arr: [${this.arr}], m.dirty: [${m.dirty}]`);
  }

  build() {
    Column() {
      Button('Change array by making separate assignments')
        .onClick(() => {
          hilog.info(0xFF00, 'testTag', 'arr[1] assign ...');
          this.arr[1] = 100;
          hilog.info(0xFF00, 'testTag', 'arr[2] assign ...');
          this.arr[2] = 200;
          hilog.info(0xFF00, 'testTag', '.. done');
        })

      Button('Change array with array functions')
        .onClick(() => {
          hilog.info(0xFF00, 'testTag', 'splice execute ...');
          // changes arr from [ 0, 1, 2, 3, 4, 5 ] to [ 0, 100, 101, 102, 5]
          this.arr.splice(1, 4, 100, 101, 102);
          hilog.info(0xFF00, 'testTag', 'shift execute ...');
          // changes arr from [ 1, 100, 101, 102, 5] to [ 100, 101, 102, 5]
          this.arr.shift();
          hilog.info(0xFF00, 'testTag', '.. done');
        })
    }
  }
}

// [End SyncMonitorArrayMultiPath]

@Builder
export function syncMonitorArrayMultiPath(): void {
  NavDestination() {
    DocSampleArrayMultiPath();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.sync_monitor_array_multi_path_title'))
}