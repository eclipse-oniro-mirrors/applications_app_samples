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
// [Start LocalStorageSet]
import { Button, ClickEvent, Column, Component, Entry, LocalStorageLink, Row, Text } from '@kit.ArkUI';

@Entry
@Component
struct SetSample {
  @LocalStorageLink('set') memberSet: Set<number> = new Set<number>([0, 1, 2, 3, 4]);

  build() {
    Row() {
      Column() {
        Text(`${this.memberSet}`)
        Button('init set')
          .onClick((e: ClickEvent) => {
            this.memberSet = new Set<number>([0, 1, 2, 3, 4]);
          })
        Button('set new one')
          .onClick((e: ClickEvent) => {
            this.memberSet.add(5);
          })
        Button('clear')
          .onClick((e: ClickEvent) => {
            this.memberSet.clear();
          })
        Button('delete the first one')
          .onClick((e: ClickEvent) => {
            this.memberSet.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End LocalStorageSet]

@Builder
export function localStorageSet(): void {
  NavDestination() {
    SetSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_set_title'))
}