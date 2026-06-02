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
      name: 'ReusableV2BasicUsage',
      path: 'pages/ReusableV2BasicUsage'
    },
    {
      name: 'ReusableV2Lifecycle',
      path: 'pages/ReusableV2Lifecycle'
    },
    {
      name: 'ReusableV2Freeze',
      path: 'pages/ReusableV2Freeze'
    },
    {
      name: 'ReusableV2Reset',
      path: 'pages/ReusableV2Reset'
    },
    {
      name: 'ReusableV2ResetMonitor',
      path: 'pages/ReusableV2ResetMonitor'
    },
    {
      name: 'ReusableV2IfUsage',
      path: 'pages/ReusableV2IfUsage'
    },
    {
      name: 'ReusableV2RepeatUsage',
      path: 'pages/ReusableV2RepeatUsage'
    },
    {
      name: 'ReusableV2RepeatTemplate',
      path: 'pages/ReusableV2RepeatTemplate'
    },
    {
      name: 'ReusableV2RepeatNoLazy',
      path: 'pages/ReusableV2RepeatNoLazy'
    },
    {
      name: 'ReusableV2ForEachUsage',
      path: 'pages/ReusableV2ForEachUsage'
    },
    {
      name: 'ReusableV2LazyForEachUsage',
      path: 'pages/ReusableV2LazyForEachUsage'
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
