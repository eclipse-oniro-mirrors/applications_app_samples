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

// [Start create_web_print_document]
import print from '@ohos.print';
import { Entry, Column, Component, Button, Web } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError, AsyncCallback } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

const myPrintAttributes: print.PrintAttributes = {
  copyNumber: 1 as int,
  pageRange: {
    startPage: 1 as int,
    endPage: 1 as int,
    pages: [1] as Array<int>
  },
  pageSize: {
    id: 'PAGE_ISO_A4',
    name: 'A4',
    width: 210 as int,
    height: 297 as int
  },
  directionMode: print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT,
  colorMode: print.PrintColorMode.COLOR_MODE_COLOR,
  duplexMode: print.PrintDuplexMode.DUPLEX_MODE_NONE,
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);

  build() {
    Column() {
      Button('createWebPrintDocumentAdapter')
        .onClick(() => {
          try {
            let webPrintDocadapter = this.controller.createWebPrintDocumentAdapter('example.pdf');
            print.print('example_jobid', webPrintDocadapter, myPrintAttributes, this.getUIContext().getHostContext() as common.UIAbilityContext);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
// [End create_web_print_document]
