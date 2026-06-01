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
// [Start getTarget_usage_example]
import { Column, Component, Entry, State, Text, UIUtils } from '@kit.ArkUI';

interface Info {
  name: string;
}

@Entry
@Component
struct GetTargetUsageExampleExample {
  rawArray: int[] = [1, 2, 3];
  rawInfo: Info = { name: 'Tom' } as Info;
  @State observedArray: int[] = this.rawArray; // 会添加包装类
  @State observedInfo: Info = this.rawInfo; // 会添加包装类
  build() {
    Column() {
      Text(`${UIUtils.getTarget(this.observedArray) === this.observedArray}`) // false，说明observedArray被包装
      Text(`${UIUtils.getTarget(this.observedArray) === this.rawArray}`) // true，getTarget获得原始对象
      Text(`${UIUtils.getTarget(this.observedInfo) === this.observedInfo}`) // false，说明observedArray被包装
      Text(`${UIUtils.getTarget(this.observedInfo) === this.rawInfo}`) // true，getTarget获得原始对象
    }
  }
}
// [End getTarget_usage_example]

@Builder
export function getTargetUsageExample(): void {
  NavDestination() {
    GetTargetUsageExampleExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.get_target_usage_example_title'))
}