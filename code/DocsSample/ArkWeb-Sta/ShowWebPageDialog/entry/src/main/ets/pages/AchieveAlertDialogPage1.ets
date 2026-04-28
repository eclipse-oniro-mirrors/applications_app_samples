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
// [Start AchieveAlertDialogPage1]
import { webview } from '@kit.ArkWeb';
import {
  Entry,
  Text,
  TextInput,
  Web,
  OnAlertEvent,
  JsResult,
  $rawfile,
  Column,
  Row,
  Component,
  UIContext,
  Button,
  ClickEvent,
  AlertDialogParamWithConfirm
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);
  uiContext: UIContext = this.getUIContext();

  build() {
    Row() {
      Web({ src: $rawfile('test.html'), controller: this.webviewController })
        .onAlert((event: OnAlertEvent) => {
          if (event) {
            console.info('event.url:' + event.url);
            console.info('event.message:' + event.message);
            let alertOption: AlertDialogParamWithConfirm = {
              title: 'Warning',
              message: event.message,
              confirm: {
                value: 'confirm',
                action: () => {
                  console.info('Alert confirmed.');
                  event.result.handleConfirm();
                }
              },
              cancel: () => {
                event.result.handleCancel();
              }
            }
            this.uiContext.showAlertDialog(alertOption)
          }
          return true;
        })
    }
  }
}

// [End AchieveAlertDialogPage1]