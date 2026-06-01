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
// [Start reusable_v2_if_usage]
import { Entry, ComponentV2, Local, Column, Button, ReusableV2, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ReusableV2IfUsageExample {
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('切换if分支').onClick(()=>{this.condition=!this.condition;}) // 点击切换if分支
      if (this.condition) {
        ReusableV2Component()
      } else {
        ReusableV2Component()
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Local message: string = 'Hello World';
  aboutToRecycle() {
    console.info('ReusableV2Component aboutToRecycle'); // 回收时被调用
  }
  aboutToReuse() {
    console.info('ReusableV2Component aboutToReuse'); // 复用时被调用
  }
  build() {
    Column() {
      Text(this.message)
    }
  }
}
// [End reusable_v2_if_usage]

@Builder
export function reusableV2IfUsage(): void {
  NavDestination() {
    ReusableV2IfUsageExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_if_usage_title'))
}
