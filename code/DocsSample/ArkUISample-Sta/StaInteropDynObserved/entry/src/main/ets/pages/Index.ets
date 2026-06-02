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

import { Entry, Component, Scroll, Column, ForEach, Button } from '@kit.ArkUI';

export interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    {
      name: '在ArkTS-Sta中使用ArkTS-Dyn的@Observed装饰的类',
      path: 'pages/StaDynObserved'
    },
    {
      name: 'ArkTS-Sta中@ObjectLink装饰的变量仅支持一层监听',
      path: 'pages/StaDynObjectLink'
    },
    {
      name: '在ArkTS-Sta中使用ArkTS-Dyn的Map类型',
      path: 'pages/StaDynObservedMap'
    },
    {
      name: '在ArkTS-Sta中使用ArkTS-Dyn的Set类型',
      path: 'pages/StaDynObservedSet'
    }
  ]

  build() {
    Scroll() {
      Column() {
        ForEach(this.ary, (item: Ary) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
        }, (item: Ary) => item.name)
      }
      .width('100%')
    }
  }
}