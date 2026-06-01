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
// [Start AddMonitorObjectProperty]
import { Entry, Text, Column, ComponentV2, Button,
  ObservedV2, Trace, Local, Monitor, IMonitor, UIUtils, IMonitorDecoratedVariable } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@ObservedV2
export class ClassA {
  @Trace propA: int = 8;
  @Trace propB: int = 99;

  constructor(a: int, b: int) {
    this.propA = a;
    this.propB = b;
  }
}

@Entry
@ComponentV2
struct AddMonitorObject {
  @Local cls: ClassA = new ClassA(100, 100);
  monitorHandle: IMonitorDecoratedVariable | undefined = undefined;
  onClsChanged(m: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s', `### onClsChanged, dirty: ${m.dirty.toString()}`);
  }

  aboutToAppear(): void {
    this.monitorHandle = UIUtils.addMonitor({ valueCallback: () => this.cls, observeProps: true, path: 'cls.*'}, this.onClsChanged);
  }

  build() {
    Column() {
      Button(`Change propA: ${this.cls.propA}`)
        .onClick(() => {
          this.cls.propA += 1;
        })
      Button(`Change propB: ${this.cls.propB}`)
        .onClick(() => {
          this.cls.propB += 1;
        })
      Button('Assign new object')
        .onClick(() => {
          this.cls = new ClassA(-200, -200);
        })
      Button('clear').onClick(() => {
        UIUtils.clearMonitor(this.monitorHandle!);
      })
    }
  }
}
// [End AddMonitorObjectProperty]

@Builder
export function addMonitorObjectProperty(): void {
  NavDestination() {
    AddMonitorObject();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_object_property_title'))
}