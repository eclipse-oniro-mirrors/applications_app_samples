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
import { Button, Column, ColumnOptions, Component, Entry } from '@ohos.arkui.component';

@Entry
@Component
struct Index {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('WebNestedScroll1')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ImpNestedScroll',
          })
        })
      Button('WebNestedScroll2')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/WebNestedScroll',
          })
        })
      Button('WebBackToTop')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/WebBackToTop',
          })
        })
      Button('ShowTextInput')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/ShowTextInput' }).catch(() => {
            console.error('Routing failed!');
          });
        })
      Button('OnIntKbdAttachSysCustIn')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/OnIntKbdAttachSysCustIn' }).catch(() => {
            console.error('Routing failed!');
          });
        })
      Button('SetSKBMode_one')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/SetSKBMode_one' }).catch(() => {
            console.error('Routing failed!');
          });
        })
        
    }.height('100%')
    .width('100%')
  }
}