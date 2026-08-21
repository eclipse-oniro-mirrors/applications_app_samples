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

// [Start the_application_side_calls_the_callback_of_the_front_end_page]
import { $rawfile, Button, Column, Component, Entry, State, Web } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

class TestClass {
  constructor() {
  }

  test(param: (arg: string) => void): void {
    param('call callback');
  }

  toString(param: String): void {
    console.info('Web Component toString' + param);
  }
}

@Entry
@Component
struct Index {
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);
  @State testObj: TestClass = new TestClass();

  build() {
    Column() {
      Button('refresh')
        .onClick(() => {
          try {
            this.webviewController.refresh();
          } catch (err) {
            console.error(`ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
          }
        })
      Button('Register JavaScript To Window')
        .onClick(() => {
          try {
            this.webviewController.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'toString']);
          } catch (err) {
            console.error(`ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
          }
        })
      Button('deleteJavaScriptRegister')
        .onClick(() => {
          try {
            this.webviewController.deleteJavaScriptRegister('testObjName');
          } catch (err) {
            console.error(`ErrorCode: ${(err as BusinessError).code},  Message: ${(err as BusinessError).message}`);
          }
        })
      Web({ src: $rawfile('index8.html'), controller: this.webviewController })
    }
  }
}
// [End the_application_side_calls_the_callback_of_the_front_end_page]
