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
// [Start MonitorWildcardDate]
import { Entry, Text, Column, ComponentV2, Button,
  ObservedV2, Trace, Local, Monitor, IMonitor } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@Entry
@ComponentV2
struct MonitorWildcardDate {
  @Local date: Date = new Date();

  // 使能通配符
  @Monitor(['date.*'])
  onDateChanged(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `onDateChanged, dirty: ${m.dirty.toString()}`);
  }

  build() {
    Column() {
      // API调用触发onDateChanged
      Button(`date.setMilliseconds(1000)`)
        .onClick(() => {
          this.date.setMilliseconds(1000);
        })
      // API调用触发onDateChanged
      Button(`date.setTime(1000000)`)
        .onClick(() => {
          this.date.setTime(1000000);
        })
      // API调用触发onDateChanged
      Button(`Assign new Date`)
        .onClick(() => {
          this.date = new Date();
        })
      // 整体赋相同值，不触发onDateChanged
      Button(`Re-assign the same Date`)
        .onClick(() => {
          let sameDate = this.date;
          this.date = sameDate;
        })
    }
  }
}

// [End MonitorWildcardDate]

@Builder
export function monitorWildcardDate(): void {
  NavDestination() {
    MonitorWildcardDate();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_wildcard_date_title'))
}