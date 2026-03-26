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

'use static'

import { Entry, Column, Component, Button } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { RouterInfo } from '../models/RouterInfo'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Button('CreatePageOnMultiThread')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/Page', params: { isOnUIThread: false } as RouterInfo })
        })
      Button('CreatePageOnUIThread')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/Page', params: { isOnUIThread: true } as RouterInfo })
        })
    }.width('100%').height('100%')
  }
}
