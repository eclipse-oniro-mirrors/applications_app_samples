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
// [Start observed_map_usage]
import { Button, Column, Component, Divider, Entry, ForEach, ObservedMap, Row, Text } from '@kit.ArkUI';

@Entry
@Component
struct MapSample {
  // 直接创建ObservedMap实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  message: ObservedMap<int, string> = new ObservedMap<int, string>([[0, 'a'], [1, 'b']]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [int, string]) => {
          Text(`${item[0]}: ${item[1]}`)
          Divider()
        })
        Button('set')
          .onClick(() => {
            // 添加新的键值对，UI会刷新
            this.message.set(2, 'c');
          })
        Button('delete')
          .onClick(() => {
            // 删除key为0的键值对，UI会刷新
            this.message.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End observed_map_usage]

@Builder
export function observedMapUsage(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_map_usage_title'))
}