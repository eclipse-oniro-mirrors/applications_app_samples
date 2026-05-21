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
// [Start MonitorWildcardSet]
import { Entry, Text, Column, ComponentV2, Button,
  ObservedV2, Trace, Local, Monitor, IMonitor } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@Entry
@ComponentV2
struct MonitorWildcardSet {
  @Local set: Set<string> = new Set<string>();
  cnt: int = 0;

  // 使能通配符
  @Monitor(['set.*'])
  onSetChanged(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `onSetChanged, dirty: ${m.dirty.toString()}`);
  }

  @Monitor(['set.size'])
  onSetSizeChanged(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `onSetSizeChanged, size dirty: ${m.dirty.toString()}`);
  }

  aboutToAppear(): void {
    this.set.add('one');
    this.set.add('two');
  }

  build() {
    Column() {
      // onSetChanged、onSetSizeChanged回调都触发
      Button(`Add three<Num> to the set`)
        .onClick(() => {
          this.cnt++;
          this.set.add('three' + this.cnt);
        })
      // 当元素不存在时，onSetChanged、onSetSizeChanged回调都不触发
      // 当元素存在时，onSetChanged、onSetSizeChanged回调都触发
      Button(`Delete 'three<Num>' from the set - set.delete(...)`)
        .onClick(() => {
          this.set.delete('three' + this.cnt);
        })
      // 当set不为空时，onSetChanged、onSetSizeChanged回调都触发
      // 当set为空时，onSetChanged、onSetSizeChanged回调都不触发
      Button(`Clear the set - set.clear()`)
        .onClick(() => {
          this.set.clear();
        })
      // 当set不为空时，onSetChanged、onSetSizeChanged回调都触发
      // 当set为空时，仅onSetChanged回调触发
      Button(`Assign new set`)
        .onClick(() => {
          this.set = new Set<string>();
        })
      // 当set不包含'one'时，onSetChanged、onSetSizeChanged回调都触发
      // 当set包含'one'时，onSetChanged、onSetSizeChanged回调都不触发
      Button(`Add 'one' to the set`)
        .onClick(() => {
          this.set.add('one');
        })
    }
  }
}

// [End MonitorWildcardSet]

@Builder
export function monitorWildcardSet(): void {
  NavDestination() {
    MonitorWildcardSet();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_wildcard_set_title'))
}