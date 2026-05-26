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
      name: 'MakeObservedBasic',
      path: 'pages/MakeObservedBasic'
    },
    {
      name: 'MakeObservedNested',
      path: 'pages/MakeObservedNested'
    },
    {
      name: 'MakeObservedOneLevel',
      path: 'pages/MakeObservedOneLevel'
    },
    {
      name: 'MakeObservedWithDecorator',
      path: 'pages/MakeObservedWithDecorator'
    },
    {
      name: 'MakeObservedArray',
      path: 'pages/MakeObservedArray'
    },
    {
      name: 'MakeObservedMap',
      path: 'pages/MakeObservedMap'
    },
    {
      name: 'MakeObservedSet',
      path: 'pages/MakeObservedSet'
    },
    {
      name: 'MakeObservedDate',
      path: 'pages/MakeObservedDate'
    },
    {
      name: 'MakeObservedInterface',
      path: 'pages/MakeObservedInterface'
    },
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