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
// [Start MonitorWildcardObject]
import { Entry, Text, Column, ComponentV2, Button,
  ObservedV2, Trace, Local, Monitor, IMonitor } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@ObservedV2
export class ClassA {
  @Trace public propA: int = 8;
  @Trace public propB: int = 99;

  constructor(a: int, b: int) {
    this.propA = a;
    this.propB = b;
  }
}

@Entry
@ComponentV2
struct MonitorWildcardObject {
  @Local cls: ClassA = new ClassA(100, 100);

  // 使用通配符
  @Monitor(['cls.*'])
  onClsChanged(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `onClsChanged, dirty: ${m.dirty.toString()}`);
  }

  build() {
    Column() {
      Button(`Change propA: ${this.cls.propA}`)
        .onClick(() => {
          this.cls.propA += 1; // 触发onClsChanged
        })
      Button(`Change propB: ${this.cls.propB}`)
        .onClick(() => {
          this.cls.propB += 1; // 触发onClsChanged
        })
      Button('Assign new object')
        .onClick(() => {
          this.cls = new ClassA(-200, -200); // 触发onClsChanged
        })
    }
  }
}

// [End MonitorWildcardObject]

@Builder
export function monitorWildcardObject(): void {
  NavDestination() {
    MonitorWildcardObject();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_wildcard_object_title'))
}