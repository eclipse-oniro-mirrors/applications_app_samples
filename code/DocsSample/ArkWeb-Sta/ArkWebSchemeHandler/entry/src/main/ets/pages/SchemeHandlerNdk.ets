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

import { $rawfile, Web, Row, Column, Button, Component, Entry, CacheMode } from '@kit.ArkUI';
import testNapi from 'libentry.so';
import { webview } from '@kit.ArkWeb';
import { resourceManager } from '@kit.LocalizationKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';

@Entry
@Component
struct Index {
  myController: webview.WebviewController = new webview.WebviewController('scheme-handler');

  build() {
    Row() {
      Column() {
        Button('go_back').onClick( event => {
          this.myController.backward();
        })

        Web({ src: $rawfile('test.html'), controller: this.myController})
          .javaScriptAccess(true)
          .width('100%')
          .height('100%')
          .databaseAccess(true)
          .fileAccess(false)
          .domStorageAccess(true)
          .cacheMode(CacheMode.DEFAULT)
          .onPageBegin( event => {
            if (this.getUIContext().getHostContext()) {
              testNapi.initResourceManager(this.getUIContext().getHostContext()!.resourceManager);
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
