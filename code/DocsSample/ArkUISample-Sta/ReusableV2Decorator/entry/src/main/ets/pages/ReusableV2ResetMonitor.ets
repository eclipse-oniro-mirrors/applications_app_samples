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
// [Start reusable_v2_reset_monitor]
import { ObservedV2, Trace, Entry, ComponentV2, Local, Column, Button, Monitor, Text, IMonitor, ReusableV2 } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace age: int;
  constructor(age: int) {
    this.age = age;
  }
}

@Entry
@ComponentV2
struct ReusableV2ResetMonitorExample {
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('回收/复用').onClick(()=>{this.condition=!this.condition;})
      if (this.condition) {
        ReusableV2Component()
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  noDecoInfo: Info = new Info(30); // 未加装饰器，被视作常量
  @Monitor(['noDecoInfo.age'])
  onAgeChange(monitor: IMonitor) {
    console.info(`age change from ${monitor.value<int>()?.before} to ${monitor.value<int>()?.now}`);
  }
  aboutToRecycle() {
    this.noDecoInfo.age = 25;
  }
  aboutToReuse() {
    this.noDecoInfo.age = 35;
  }
  build() {
    Column() {
      Column() {
        Text(`noDecoInfo.age: ${this.noDecoInfo.age}`)
          .onClick(()=>{this.noDecoInfo.age++;}) // 能够触发刷新但是不会被重置
      }
    }
  }
}
// [End reusable_v2_reset_monitor]

@Builder
export function reusableV2ResetMonitor(): void {
  NavDestination() {
    ReusableV2ResetMonitorExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_reset_monitor_title'))
}
