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
// [Start reusable_v2_freeze]
import { ObservedV2, Trace, Entry, ComponentV2, Local, Column, Button, Monitor, IMonitor, Text, ReusableV2 } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace age: int = 25;
}

const info: Info = new Info();

@Entry
@ComponentV2
struct ReusableV2FreezeExample {
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('复用/回收').onClick(()=>{this.condition=!this.condition;})
      Button('改值').onClick(()=>{info.age++;})
      if (this.condition) {
        ReusableV2Component()
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Local info: Info = info; // 仅做演示使用，并不建议@Local赋值全局变量
  @Monitor(['info.age'])
  onValChange(m: IMonitor) {
    console.info('info.age change');
  }
  aboutToRecycle() {
    console.info('aboutToRecycle');
    this.info.age++;
  }
  aboutToReuse() {
    console.info('aboutToReuse');
    this.info.age++;
  }
  onRender(): string {
    console.info('info.age onRender');
    return this.info.age.toString();
  }
  build() {
    Column() {
      Text(this.onRender())
    }
  }
}
// [End reusable_v2_freeze]

@Builder
export function reusableV2Freeze(): void {
  NavDestination() {
    ReusableV2FreezeExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_freeze_title'))
}
