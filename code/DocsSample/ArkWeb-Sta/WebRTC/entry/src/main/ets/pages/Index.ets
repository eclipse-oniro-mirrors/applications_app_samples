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

// xxx.ets
import { $rawfile, Web, Column, Component, Entry, Button, OnPermissionRequestEvent, Context } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { UIContext } from "@kit.ArkUI";
import { AlertDialogParamWithButtons, AlertDialogButtonBaseOptions } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { PermissionRequestResult, common } from '@kit.AbilityKit';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  uiContext: UIContext = this.getUIContext();

  aboutToAppear(): void {
    let context: Context | undefined = this.uiContext.getHostContext() as common.UIAbilityContext;
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE'],
      (err: BusinessError | null, data?: PermissionRequestResult) => {
        if (data) {
          console.info('data:' + JSON.stringify(data));
          console.info('data permissions:' + data.permissions);
          console.info('data authResults:' + data.authResults);
        }
      })
  }

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPermissionRequest((event: OnPermissionRequestEvent): void => {
          if (event) {
            const dialogOptions: AlertDialogParamWithButtons = {
              title: 'title',
              message: 'text',
              primaryButton: {
                value: 'deny',
                action: () => {
                  event.request.deny();
                },
              } as AlertDialogButtonBaseOptions,
              secondaryButton: {
                value: 'onConfirm',
                action: () => {
                  event.request.grant(event.request.getAccessibleResource());
                },
              } as AlertDialogButtonBaseOptions,
              cancel: () => {
                event.request.deny();
              }
            };
            this.uiContext.showAlertDialog(dialogOptions);
          }
        })
    }
  }
}