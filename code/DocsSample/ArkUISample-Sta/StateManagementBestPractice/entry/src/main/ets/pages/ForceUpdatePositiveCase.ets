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

import { NavDestination, $r, Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Local, Text } from '@kit.ArkUI';

// [Start force_update_positive_case]
import { Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Local, Text } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct CompA {
  @Local realStateArr: Array<number> = [4.0, 1.0, 3.0, 2.0];
  build() {
    Column() {
      ForEach(this.realStateArr,
        (item: number) => {
          Text(`${item}`)
        })
      Text('add item')
        .onClick(() => {
          // 改变realStateArr触发UI视图更新
          this.realStateArr.push(this.realStateArr[this.realStateArr.length-1] + 1);
        })
    }
    .width(200).height(500)
  }
}
// [End force_update_positive_case]

@Builder
export function forceUpdatePositiveCaseBuilder(): void {
  NavDestination() {
    CompA();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.force_update_positive_case_title'))
}
