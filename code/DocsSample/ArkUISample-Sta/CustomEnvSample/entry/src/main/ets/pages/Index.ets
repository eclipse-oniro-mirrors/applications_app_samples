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
      name: 'CEDecorateArray',
      path: 'pages/CEDecorateArray'
    },
    {
      name: 'CEDecorateDate',
      path: 'pages/CEDecorateDate'
    },
    {
      name: 'CEDecorateMap',
      path: 'pages/CEDecorateMap'
    },
    {
      name: 'CEDecorateSet',
      path: 'pages/CEDecorateSet'
    },
    {
      name: 'CEFollowSearchClosestValue',
      path: 'pages/CEFollowSearchClosestValue'
    },
    {
      name: 'CEObserveChange',
      path: 'pages/CEObserveChange'
    },
    {
      name: 'CESupportAddMonitor',
      path: 'pages/CESupportAddMonitor'
    },
    {
      name: 'CESupportComponentFreeze',
      path: 'pages/CESupportComponentFreeze'
    },
    {
      name: 'CESupportCustomKeyValue',
      path: 'pages/CESupportCustomKeyValue'
    },
    {
      name: 'CESupportInitialDefaultValue',
      path: 'pages/CESupportInitialDefaultValue'
    },
    {
      name: 'CESupportMixV1ToV2',
      path: 'pages/CESupportMixV1ToV2'
    },
    {
      name: 'CESupportMixV2ToV1',
      path: 'pages/CESupportMixV2ToV1'
    },
    {
      name: 'CESupportMonitor',
      path: 'pages/CESupportMonitor'
    },
    {
      name: 'CESupportMultipleTypes',
      path: 'pages/CESupportMultipleTypes'
    },
    {
      name: 'CESupportResponseCapability',
      path: 'pages/CESupportResponseCapability'
    },
    {
      name: 'CESupportUseWatchDecorator',
      path: 'pages/CESupportUseWatchDecorator'
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