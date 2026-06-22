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

// [Start index_start]
import {
  Entry,
  Component,
  Button,
  Column,
  ColumnOptions,
  Scroll,
  ForEach
} from '@kit.ArkUI'

class Ary {
  path: string;
  name: string;

  constructor(path: string, name: string) {
    this.path = path;
    this.name = name;
  }
}

@Entry
@Component
struct Index {
  ary: Array<Ary> = [
    new Ary('pages/MyCheckboxStyle', 'MyCheckboxStyle')
  ];

  build(): void {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        ForEach(this.ary, (item: Ary) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path as string })
            })
        }, (item: Ary) => item.name)
      }
      .width('100%')
    }
  }
}
// [End index_start]