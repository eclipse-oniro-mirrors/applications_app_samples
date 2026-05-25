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
// [Start SyncMonitorArrayOfArrays]
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button, ObservedV2, Trace, Divider } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@ObservedV2
class Person {
  @Trace firstName: string = 'first';
  @Trace lastName: string = 'last';

  constructor(first: string = 'no first', last: string = 'no last') {
    this.firstName = first;
    this.lastName = last;
  }
}

@Entry
@ComponentV2
struct DocSampleArrayOfArrays {
  @Local topArray: Person[][] = this.makeNewTopArray();

  @SyncMonitor(['topArray.1.*'])
  topArrayMonitor1Star(monitor: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `TopArray[1]: ${monitor.dirty.toString()}`);
  }

  @SyncMonitor(['topArray.*'])
  topArrayMonitorStar(monitor: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `TopArray: ${monitor.dirty.toString()}`);
  }

  makeNewTopArray(): Person[][] {
    return [
      [new Person('Adrian'), new Person('Andrew'), new Person('Aaliyah'), new Person('Amir'),
        new Person('Angel')],
      [new Person('Carter'), new Person('Charlie'), new Person('Cooper'), new Person('Cole'),
        new Person('Callie')],
      [new Person('Daniel'), new Person('Daisy'), new Person('Dawson'), new Person('Dana'),
        new Person('Dalton')]
    ];
  }

  build() {
    Column() {
      // topArrayMonitor1Star与topArrayMonitorStar回调均触发
      Button('topArray = new TopArray')
        .onClick(() => {
          this.topArray = this.makeNewTopArray();
        })

      // 当topArray[1][0]存在时，topArrayMonitor1Star回调触发，topArrayMonitorStar回调不触发
      Button('topArray[1][0] = new Person')
        .onClick(() => {
          if (this.topArray.length > 1 && this.topArray[1].length > 0) {
            this.topArray[1][0] = new Person();
          }
        })

      // 当topArray[0][1]存在时，topArrayMonitor1Star与topArrayMonitorStar回调均不触发
      Button('topArray[0][1] = new Person')
        .onClick(() => {
          if (this.topArray.length > 0 && this.topArray[0].length > 1) {
            this.topArray[0][1] = new Person();
          }
        })

      // 当topArray[1]存在时，topArrayMonitor1Star回调触发，topArrayMonitorStar回调不触发
      Button('topArray[1].push')
        .onClick(() => {
          if (this.topArray.length > 1 && this.topArray[1] instanceof Array<Person>) {
            this.topArray[1].push(new Person());
          }
        })

      // 当topArray的length大于2时，topArrayMonitor1Star与topArrayMonitorStar回调均触发
      Button('topArray.shift (length>2)')
        .onClick(() => {
          if (this.topArray.length > 2) {
            this.topArray.shift();
          }
        })

      // 当topArray[0]存在时，topArrayMonitor1Star回调不触发，topArrayMonitorStar回调触发
      Button('topArray[0] = new Person[]')
        .onClick(() => {
          if (this.topArray.length > 0) {
            this.topArray[0] = [new Person(), new Person()];
          }
        })

      // 当topArray[1][0]存在时，topArrayMonitor1Star与topArrayMonitorStar回调均不触发
      Button('topArray[1][0].last update')
        .onClick(() => {
          if (this.topArray.length > 1 && this.topArray[1].length > 0 && this.topArray[1][0] instanceof Person) {
            this.topArray[1][0].lastName += '~';
          }
        })

      // topArrayMonitor1Star回调不触发，topArrayMonitorStar回调触发
      Button('topArray = new TopArray, keep [1]')
        .onClick(() => {
          let newTop = this.makeNewTopArray();
          newTop[1] = this.topArray[1]; // topArray.1未改变，路径'topArray.1.*'中通配符前最后一个确定值未改变
          this.topArray = newTop;
        })

      // topArrayMonitor1Star回调不触发，topArrayMonitorStar回调触发
      Button('topArray.push')
        .onClick(() => {
          this.topArray.push([new Person(), new Person()]);
        })
    }
  }
}

// [End SyncMonitorArrayOfArrays]

@Builder
export function syncMonitorArrayOfArrays(): void {
  NavDestination() {
    DocSampleArrayOfArrays();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.sync_monitor_array_of_arrays_title'))
}