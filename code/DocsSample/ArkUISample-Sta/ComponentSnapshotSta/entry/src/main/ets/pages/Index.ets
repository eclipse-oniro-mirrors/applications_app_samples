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

import { Entry, Component } from '@kit.ArkUI';
import { Scroll, Column, Button, ForEach, Padding, ColumnOptions } from '@kit.ArkUI';

interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    {
      name: 'GlobalSnapshot',
      path: 'pages/GlobalSnapshot'
    } as Ary,
    {
      name: 'ScrollSnapshot',
      path: 'pages/ScrollSnapshot'
    } as Ary,
  ];

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        ForEach(this.ary, (item: Ary) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path });
            })
        }, (item: Ary) => item.name)
      }
      .width(300)
    }.padding({ top: 100 } as Padding)
  }
}
