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
// [Start observed_date_usage]
import { Button, Column, Component, Entry, ObservedDate, Text } from '@kit.ArkUI';

@Entry
@Component
struct DateSample {
  // 直接创建ObservedDate实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  selectedDate: ObservedDate = new ObservedDate('2026-05-01');

  build() {
    Column() {
      Text(`${this.selectedDate}`)
      Button('increase year')
        .onClick(() => {
          // 将selectedDate实例对应的年份加1，UI会刷新
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
        })
      Button('increase month')
        .onClick(() => {
          // 将selectedDate实例对应的月份加1，UI会刷新
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1);
        })
    }
    .width('100%')
  }
}
// [End observed_date_usage]

@Builder
export function observedDateUsage(): void {
  NavDestination() {
    DateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_date_usage_title'))
}