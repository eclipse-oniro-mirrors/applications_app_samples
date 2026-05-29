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
      name: 'ComponentBasicUsage',
      path: 'pages/ComponentBasicUsage'
    },
    {
      name: 'EntryDecorator',
      path: 'pages/EntryDecorator'
    },
    {
      name: 'ComponentParams',
      path: 'pages/ComponentParams'
    },
    {
      name: 'BuildFunction',
      path: 'pages/BuildFunction'
    },
    {
      name: 'BuildVariableDeclaration',
      path: 'pages/BuildVariableDeclaration'
    },
    {
      name: 'BuildLogPrint',
      path: 'pages/BuildLogPrint'
    },
    {
      name: 'BuildSwitchCase',
      path: 'pages/BuildSwitchCase'
    },
    {
      name: 'BuildLocalScope',
      path: 'pages/BuildLocalScope'
    },
    {
      name: 'BuildExpression',
      path: 'pages/BuildExpression'
    },
    {
      name: 'BuildNotRecommended',
      path: 'pages/BuildNotRecommended'
    },
    {
      name: 'ComponentStyle',
      path: 'pages/ComponentStyle'
    },
    {
      name: 'ComponentExtend',
      path: 'pages/ComponentExtend'
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
