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

import { Entry, Button, ClickEvent, Column, ColumnOptions, Component, Entry } from '@ohos.arkui.component';
const COLUMN_SPACE: number = 10;

@Entry
@Component
struct Index {
  build() {
    Column({ space: COLUMN_SPACE } as ColumnOptions) {
      Button('HighLighting')
        .onClick((_: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/WebDataDetectorHighlighting',
          })
        })
      Button('LongPress')
        .onClick((_: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/WebDataDetectorLongPress',
          })
        })
    }.height('100%')
    .width('100%')
  }
}