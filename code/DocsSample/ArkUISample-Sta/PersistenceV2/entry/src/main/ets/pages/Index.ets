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
      name: 'PersistenceV2Array',
      path: 'pages/PersistenceV2Array'
    },
    {
      name: 'PersistenceV2Map',
      path: 'pages/PersistenceV2Map'
    },
    {
      name: 'PersistenceV2Set',
      path: 'pages/PersistenceV2Set'
    },
    {
      name: 'PersistenceV2Date',
      path: 'pages/PersistenceV2Date'
    },
    {
      name: 'PersistenceV2NestedClass',
      path: 'pages/PersistenceV2NestedClass'
    },
    {
      name: 'PersistenceV2CircularRef',
      path: 'pages/PersistenceV2CircularRef'
    },
    {
      name: 'PersistenceV2MixedCollection',
      path: 'pages/PersistenceV2MixedCollection'
    },
    {
      name: 'PersistenceV2ConnectGlobalConnect',
      path: 'pages/PersistenceV2ConnectGlobalConnect'
    },
    {
      name: 'PersistenceV2NotifyOnError',
      path: 'pages/PersistenceV2NotifyOnError'
    },
    {
      name: 'PersistenceV2ConnectMigration',
      path: 'pages/PersistenceV2ConnectMigration'
    },
    {
      name: 'PersistenceV2ContainerElementChange',
      path: 'pages/PersistenceV2ContainerElementChange'
    },
    {
      name: 'PersistenceV2ConnectUsage',
      path: 'pages/PersistenceV2ConnectUsage'
    },
    {
      name: 'PersistenceV2ContainerTypeError',
      path: 'pages/PersistenceV2ContainerTypeError'
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
