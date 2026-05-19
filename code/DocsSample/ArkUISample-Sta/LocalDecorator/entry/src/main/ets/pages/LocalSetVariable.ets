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
// [Start LocalSetVariable]
import { Button, ClickEvent, Column, ComponentV2, Divider, Entry, ForEach, Local, Row, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SetSample {
  @Local message: Set<number> = new Set<number>([0, 1, 2, 3, 4]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
          Text(`${item[0]}`).fontSize(30)
          Divider()
        })
        Button('init set').onClick((e: ClickEvent) => {
          this.message = new Set<number>([0, 1, 2, 3, 4]);
        })
        Button('set new one').onClick((e: ClickEvent) => {
          this.message.add(5);
        })
        Button('clear').onClick((e: ClickEvent) => {
          this.message.clear();
        })
        Button('delete the first one').onClick((e: ClickEvent) => {
          this.message.delete(0);
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End LocalSetVariable]

@Builder
export function localSetVariable(): void {
  NavDestination() {
    SetSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_set_variable_title'))
}