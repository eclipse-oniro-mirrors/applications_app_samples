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
// [Start SyncMonitorParamType]
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button, ObservedV2, Trace, Divider } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const propB: string = 'propB'; // const常量

enum ENUM {
  propC = 'propC' // enum枚举值
};
let propD: string = 'propD'; // 变量

@ObservedV2
class Info {
  @Trace public propA: number = 0;
  @Trace public propB: number = 0;
  @Trace public propC: number = 0;
  @Trace public propD: number = 0;

  // @SyncMonitor仅支持字符串字面量
  @SyncMonitor(['propA'])
  onPropAChange(monitor: IMonitor): void {
    hilog.info(0xFF00, 'testTag', '%{public}s', `propA change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  }

  // @SyncMonitor入参类型为const常量
  @SyncMonitor([propB])
  onPropBChange(monitor: IMonitor): void {
    hilog.info(0xFF00, 'testTag', '%{public}s', `propB change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  }
  
  // @SyncMonitor入参类型为enum枚举值
  @SyncMonitor([ENUM.propC])
  onPropCChange(monitor: IMonitor): void {
    hilog.info(0xFF00, 'testTag', '%{public}s', `propC change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  }
  
  // @SyncMonitor入参类型为变量，编译会报错，提示`Only constant expressions are supported as parameters in '@SyncMonitor'. Variables are not allowed.`
  // 注：此反例代码会导致编译错误，按照skill.md规范不实现反例代码
  // @SyncMonitor([propD])
  // onPropDChange(monitor: IMonitor): void {
  //   hilog.info(0xFF00, 'testTag', '%{public}s', `propD change from ${monitor.value<number>()?.before} to ${monitor.value<number>()?.now}`);
  // }
}

@Entry
@ComponentV2
struct Index {
  info: Info = new Info();

  build() {
    Column() {
      Button('Change propA')
        .onClick(() => {
          this.info.propA++; // 能够触发onPropAChange方法
        })
    }
  }
}

// [End SyncMonitorParamType]

@Builder
export function syncMonitorParamType(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.sync_monitor_param_type_title'))
}