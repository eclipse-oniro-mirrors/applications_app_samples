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

import { Entry, NavDestination, $r } from '@kit.ArkUI';
// [Start reusable_v2_basic_usage]
import { ComponentV2, ReusableV2, Local, Column, Text } from '@kit.ArkUI';

@ReusableV2 // 装饰ComponentV2的自定义组件
@ComponentV2
struct ReusableV2Component {
  @Local message: string = 'Hello World';
  build () {
    Column() {
      Text(this.message)
    }
  }
}
// [End reusable_v2_basic_usage]

@Entry
@ComponentV2
struct ReusableV2BasicUsageExample {
  build() {
    Column() {
      ReusableV2Component()
    }
  }
}

@Builder
export function reusableV2BasicUsage(): void {
  NavDestination() {
    ReusableV2BasicUsageExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_basic_usage_title'))
}
