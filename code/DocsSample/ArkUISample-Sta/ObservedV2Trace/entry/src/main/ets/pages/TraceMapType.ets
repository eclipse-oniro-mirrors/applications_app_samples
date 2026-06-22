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
// [Start TraceMapType]
import { Button, Column, ComponentV2, Divider, Entry, ForEach, ObservedV2, Row, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace memberMap: Map<number, string> = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
}

@Entry
@ComponentV2
struct MapSample {
  info: Info = new Info();

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.info.memberMap.entries()), (item: [number, string]) => {
          Text(`${item[0]}`)
            .fontSize(20)
            .margin(10)
          Text(`${item[1]}`)
            .fontSize(20)
            .margin(10)
          Divider()
        })
        Button('init map')
          .width(300)
          .margin(10)
          .onClick((e) => {
            this.info.memberMap = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
          })
        Button('set new one')
          .width(300)
          .margin(10)
          .onClick((e) => {
          // 新增键值对，触发UI刷新
            this.info.memberMap.set(4, 'd');
          })
        Button('clear')
          .width(300)
          .margin(10)
          .onClick((e) => {
          // 清空Map，触发UI刷新
            this.info.memberMap.clear();
          })
        Button('set the key: 0')
          .width(300)
          .margin(10)
          .onClick((e) => {
          // 更新键值对，触发UI刷新
            this.info.memberMap.set(0, 'aa');
          })
        Button('delete the first one')
          .width(300)
          .margin(10)
          .onClick((e) => {
          // 删除键值对，触发UI刷新
            this.info.memberMap.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

// [End TraceMapType]

@Builder
export function traceMapType(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_map_type_title'))
}