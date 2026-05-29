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
      name: 'AppStorageUI',
      path: 'pages/AppStorageUI'
    },
    {
      name: 'AppStoragePropRefDataRef',
      path: 'pages/AppStoragePropRefDataRef'
    },
    {
      name: 'AppStorageUnionType',
      path: 'pages/AppStorageUnionType'
    },
    {
      name: 'AppStorageDate',
      path: 'pages/AppStorageDate'
    },
    {
      name: 'AppStorageMap',
      path: 'pages/AppStorageMap'
    },
    {
      name: 'AppStorageSet',
      path: 'pages/AppStorageSet'
    },
    {
      name: 'EnvironmentUI',
      path: 'pages/EnvironmentUI'
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