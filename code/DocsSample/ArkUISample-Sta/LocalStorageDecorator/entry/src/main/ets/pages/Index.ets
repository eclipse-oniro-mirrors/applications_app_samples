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
      name: 'LocalStorageUI',
      path: 'pages/LocalStorageUI'
    },
    {
      name: 'LocalStoragePropRef',
      path: 'pages/LocalStoragePropRef'
    },
    {
      name: 'LocalStoragePropRefDataRef',
      path: 'pages/LocalStoragePropRefDataRef'
    },
    {
      name: 'LocalStorageLinkSync',
      path: 'pages/LocalStorageLinkSync'
    },
    {
      name: 'LocalStorageLinkBrother',
      path: 'pages/LocalStorageLinkBrother'
    },
    {
      name: 'LocalStorageSharedUIAbility',
      path: 'pages/LocalStorageSharedUIAbility'
    },
    {
      name: 'LocalStorageComponent',
      path: 'pages/LocalStorageComponent'
    },
    {
      name: 'LocalStorageComponentNoProp',
      path: 'pages/LocalStorageComponentNoProp'
    },
    {
      name: 'LocalStorageUnionType',
      path: 'pages/LocalStorageUnionType'
    },
    {
      name: 'LocalStorageDate',
      path: 'pages/LocalStorageDate'
    },
    {
      name: 'LocalStorageMap',
      path: 'pages/LocalStorageMap'
    },
    {
      name: 'LocalStorageSet',
      path: 'pages/LocalStorageSet'
    },
    {
      name: 'LocalStorageOutside',
      path: 'pages/LocalStorageOutside'
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