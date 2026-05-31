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
// [Start Main_WindowTestPage]
// pages/WindowTestPage.ets
import { Entry, Component, Column, Text, ClickEvent } from '@ohos.arkui.component';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { WindowUIContextUtils } from '../Common/WindowUtils';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  private subWindow: window.Window | undefined;

  build() {
    Column() {
      Text('Create SubWindow')
        .onClick((event: ClickEvent): void => {
          let hostContext = this.getUIContext().getHostContext();
          if (!hostContext) {
            hilog.error(DOMAIN, 'testTag', `Can't get host context`);
            return;
          }
          let config: window.Configuration = {
            name: 'test',
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: hostContext
          };
          window.createWindow(config)
            .then((windowClass: window.Window): void => {
              // 在窗口创建后注册回调。
              this.subWindow = windowClass;
              windowClass.setUIContent('pages/Index')
                .then((): void => {
                  WindowUIContextUtils.registerWindowCallback(windowClass);
                  windowClass.resize(500, 1000);
                  windowClass.showWindow();
                })
                .catch((error: BusinessError): void => {
                  hilog.error(DOMAIN, 'testTag', `Failed to setUIContent. Cause : ${error.message}`);
                });
            })
            .catch((error: BusinessError): void => {
              hilog.error(DOMAIN, 'testTag', `Failed to create the window. Cause : ${error.message}`);
            });
        })
      Text('Destroy SubWindow')
        .onClick((event: ClickEvent): void => {
          let subWindow = this.subWindow;
          if (subWindow) {
            // 在窗口销毁前注销回调。
            WindowUIContextUtils.unregisterWindowCallback(subWindow);
            subWindow.destroyWindow();
            this.subWindow = undefined;
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}

// [End Main_WindowTestPage]
