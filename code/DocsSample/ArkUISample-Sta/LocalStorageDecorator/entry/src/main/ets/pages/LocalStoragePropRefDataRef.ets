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
// [Start LocalStoragePropRefDataRef]
import { 
  Entry,
  Text, 
  Column, 
  Component, 
  Button, 
  ClickEvent,
  LocalStorage,
  LocalStoragePropRef,
  Observed,
  Track
} from '@kit.ArkUI';

@Observed
class Data {
  @Track code: number;

  constructor(code: number) {
    this.code = code;
  }
}

let storage = new LocalStorage();
storage.setOrCreate('PropA', new Data(50));
let storageFunc = (): LocalStorage => {
  return storage;
};

@Entry({ storage: 'storageFunc' })
@Component
struct Index {
  @LocalStoragePropRef('PropA') data: Data = new Data(100);

  build() {
    Column() {
      Text(`data property code is ${this.data.code}`)
        .fontSize(20)
        .margin(10)
      Button('modify data property code')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.data.code += 10;
          // 如果只点击该Button，由于data是LocalStorage中数据源的引用，则LocalStorage中数据源的属性也会修改。
          console.info(`PropA in LocalStorage ${storage.get<Data>('PropA')!.code}`);
        })

      Button('replace data')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.data = new Data(200);
          // 如果点击该Button，本地的data变量会引用新的对象，所以不会影响LocalStorage中的数据源。
          console.info(`PropA in LocalStorage ${storage.get<Data>('PropA')!.code}`);
        })
    }
    .width('100%')
  }
}
// [End LocalStoragePropRefDataRef]

@Builder
export function localStoragePropRefDataRef(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_prop_ref_data_ref_title'))
}