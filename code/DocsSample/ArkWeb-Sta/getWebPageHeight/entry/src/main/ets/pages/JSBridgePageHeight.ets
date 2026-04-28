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
// [Start jsbridgepageheight]
import { $rawfile, Entry, Component, Row, Web, Column, State } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

export class TestClass {
  testController: webview.WebviewController;

  constructor(controller: webview.WebviewController) {
    this.testController = controller;
  }

  notifyToGet(): void {
    console.info('page height: ' + this.testController.getPageHeight());
  }
}

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  @State jsbObj: TestClass = new TestClass(this.controller);

  build() {
    Row() {
      Column() {
        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(true)
          .javaScriptProxy({
            jsObject: this.jsbObj,
            name: 'jsbObj',
            methodList: ['notifyToGet'],
            controller: this.controller
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
// [End jsbridgepageheight]