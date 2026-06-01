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
// [Start reusable_v2_foreach_usage]
import { Entry, ComponentV2, Local, Column, ForEach, Row, Button, ReusableV2, Require, Param, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ReusableV2ForEachUsageExample {
  @Local simpleList: int[] = [0, 1, 2, 3, 4, 5];
  build() {
    Column() {
      ForEach(this.simpleList, (num: int, index: int) => {
        Row() {
          Button('点击修改').onClick(()=>{this.simpleList[index]++;})
          ReusableV2Component({ num: num })
        }
      }) // 每次修改完key发生变化
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Require @Param num: int;
  aboutToAppear() {
    console.info('ReusableV2Component aboutToAppear', this.num); // 创建时触发
  }
  aboutToRecycle() {
    console.info('ReusableV2Component aboutToRecycle', this.num); // 回收时触发
  }
  aboutToReuse() {
    console.info('ReusableV2Component aboutToReuse', this.num); // 复用时触发
  }
  build() {
    Column() {
      Text(`child: ${this.num}`)
    }
  }
}
// [End reusable_v2_foreach_usage]

@Builder
export function reusableV2ForEachUsage(): void {
  NavDestination() {
    ReusableV2ForEachUsageExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_foreach_usage_title'))
}
