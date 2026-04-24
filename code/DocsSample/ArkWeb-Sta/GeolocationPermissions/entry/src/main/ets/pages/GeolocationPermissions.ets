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

// [Start geolocation_permissions]
// xxx.ets
'use static'
import { Entry, Column, Component, Web, Button } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  origin: string = "www.example.com";

  build() {
    Column() {
      // 新增指定源的位置权限，再次获取位置信息时则不再触发onGeolocationShow的回调
      Button('allowGeolocation')
        .onClick(() => {
          try {
            webview.GeolocationPermissions.allowGeolocation(this.origin);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      // 删除指定源的位置权限，再次获取位置信息时则触发onGeolocationShow的回调
      Button('deleteGeolocation')
        .onClick(() => {
          try {
            webview.GeolocationPermissions.deleteGeolocation(this.origin);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      // 查询指定源的位置权限
      Button('getAccessibleGeolocation')
        .onClick(() => {
          try {
            webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
              .then(result => {
                console.info('getAccessibleGeolocationPromise result: ' + result);
              }).catch((error) => {
              console.error(`getAccessibleGeolocationPromise error, ErrorCode: ${error.code},  Message: ${error.message}`);
            });
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      // 注意添加网络权限ohos.permission.INTERNET
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
// [End geolocation_permissions]
