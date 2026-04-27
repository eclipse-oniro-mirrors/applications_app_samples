'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start show_text_input_static]
// Index.ets
import hilog from '@ohos.hilog'
import { $rawfile, TextAlign, Color, Web, Row, Text, ColumnOptions, Entry, Component, Column, Button, WebKeyboardAvoidMode } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      Web({ src: $rawfile("SetSKBModeIndex.html"), controller: this.controller})
        .onPageEnd(() => {
          this.controller.runJavaScript(`document.getElementById('input_a').focus()`).then(() => {
            setTimeout(() => {
              inputMethod.getController().showTextInput();
            }, 10);
          });
        });
    }
  }
}

// [End show_text_input_static]