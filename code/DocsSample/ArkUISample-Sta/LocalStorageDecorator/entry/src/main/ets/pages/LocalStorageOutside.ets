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
// [Start LocalStorageOutside]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, Row, Text } from '@kit.ArkUI';

let storageA = new LocalStorage();
storageA.setOrCreate<number>('count', 47);
let storageFunc = () => {
  return storageA;
}

class Model {
  storage: LocalStorage = storageA;

  call(propName: string, value: number): void {
    this.storage.setOrCreate<number>(propName, value);
  }
}

let model: Model = new Model();

@Entry({ storage: 'storageFunc' })
@Component
struct Test {
  @LocalStorageLink('count') count: number = 0;

  build() {
    Column() {
      Text(`count值: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('change')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          model.call('count', this.count + 1);
        })
    }
    .width('100%')
  }
}
// [End LocalStorageOutside]

@Builder
export function localStorageOutside(): void {
  NavDestination() {
    Test();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_outside_title'))
}