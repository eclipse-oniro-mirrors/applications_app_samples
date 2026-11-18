/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start monitor_non_state_variable_positive]
import { hilog } from '@kit.PerformanceAnalysisKit';

@ObservedV2
class Info {
  public name: string = 'John';
  @Trace public age: number = 24;

  // 仅监听状态变量age
  @SyncMonitor('age')
  onPropertyChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      hilog.info(0xFF00, 'testTag', '%{public}s',
        `property path:${path} change from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
    })
  }
}

@Entry
@ComponentV2
struct Index {
  info: Info = new Info();

  build() {
    Column() {
      Button('change age&name')
        .onClick(() => {
          this.info.age = 25; // 状态变量age改变
          this.info.name = 'Johny';
        })
    }
  }
}
// [End monitor_non_state_variable_positive]

@Builder
export function monitorNonStateVariablePositive() {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_non_state_variable_positive'))
}
