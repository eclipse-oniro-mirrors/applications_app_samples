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
// [Start SyncMonitorDeepProperty]
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button, ObservedV2, Trace } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@ObservedV2
class Inner {
  @Trace public num: number = 0;
}

@ObservedV2
class Outer {
  @Trace public inner: Inner = new Inner();

  @SyncMonitor(['inner.num'])
  onChange(monitor: IMonitor): void {
    hilog.info(0xFF00, 'testTag', '%{public}s',
      `inner.num change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  }
}

@Entry
@ComponentV2
struct Index {
  outer: Outer = new Outer();

  build() {
    Column() {
      Button('change num')
        .onClick(() => {
          this.outer.inner.num = 100; // 能够触发onChange方法
        })
    }
  }
}

// [End SyncMonitorDeepProperty]

@Builder
export function syncMonitorDeepProperty(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.sync_monitor_deep_property_title'))
}