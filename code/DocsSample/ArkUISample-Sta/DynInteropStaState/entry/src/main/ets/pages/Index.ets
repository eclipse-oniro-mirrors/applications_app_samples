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

export interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    {
      name: 'StatemgmtV1',
      path: 'pages/StatemgmtV1'
    },
    {
      name: 'StatemgmtV1Observed',
      path: 'pages/StatemgmtV1Observed'
    },
    {
      name: 'StatemgmtV1AppStorage',
      path: 'pages/StatemgmtV1AppStorage'
    },
    {
      name: 'StatemgmtV1AppStorageData',
      path: 'pages/StatemgmtV1AppStorageData'
    },
    {
      name: 'StatemgmtV1LocalStorage',
      path: 'pages/StatemgmtV1LocalStorage'
    },
    {
      name: 'StatemgmtV1PersistentStorage',
      path: 'pages/StatemgmtV1PersistentStorage'
    },
    {
      name: 'StatemgmtV1Environment',
      path: 'pages/StatemgmtV1Environment'
    },
    {
      name: 'StatemgmtV2',
      path: 'pages/StatemgmtV2'
    },
    {
      name: 'StatemgmtV2ObservedV2',
      path: 'pages/StatemgmtV2ObservedV2'
    },
    {
      name: 'StatemgmtV2ObservedV2Nested',
      path: 'pages/StatemgmtV2ObservedV2Nested'
    },
    {
      name: 'StatemgmtV2ObservedV2Inherit',
      path: 'pages/StatemgmtV2ObservedV2Inherit'
    },
    {
      name: 'StatemgmtV2AppStorageV2',
      path: 'pages/StatemgmtV2AppStorageV2'
    },
    {
      name: 'StatemgmtV2PersistenceV2',
      path: 'pages/StatemgmtV2PersistenceV2'
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
