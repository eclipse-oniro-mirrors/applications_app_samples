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
// [Start InterceptTelScheme]
import { webview } from '@kit.ArkWeb';
import { call } from '@kit.TelephonyKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  // 提取拨号逻辑为私有方法，供 onInterceptRequest 和 javaScriptProxy 统一调用
  private makePhoneCall(url: string, source: string): void {
    let phoneNumber: string = url.substring('tel:'.length);
    try {
      call.makeCall(phoneNumber, (err: BusinessError) => {
        if (err) {
          console.error(`[${source}] makeCall failed, code is ${err.code}, message is ${err.message}`);
        }
      });
    } catch (error) {
      console.error(`[${source}] ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      // 加载本地 HTML，页面内 JS 通过 prompt 将 tel: URL 传递给原生层
      Web({ src: $rawfile('tel.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onInterceptRequest((event) => {
          if (!event) {
            return null;
          }
          // 拦截 tel: 协议，调用系统拨号能力，阻止 Web 默认行为导致白屏
          if (event.request.getRequestUrl().startsWith('tel:')) {
            this.makePhoneCall(event.request.getRequestUrl(), 'onInterceptRequest');
            // 返回非空 WebResourceResponse 阻止 Web 组件继续加载该 URL，避免白屏
            let response = new WebResourceResponse();
            response.setResponseCode(404);
            response.setReasonMessage('Not Found');
            return response;
          }
          return null;
        })
        // [Start intercept_tel]
        // 通过 javaScriptProxy 获取 H5 传递的 tel: URL 并调用拨号
        // 此方式不会触发页面导航，返回后页面内容保持不变，不会白屏
        .javaScriptProxy({
          object: {
            interceptPrompt: (url: string): boolean => {
              if (url.startsWith('tel:')) {
                this.makePhoneCall(url, 'interceptPrompt');
                return true;
              }
              return false;
            }
          },
          name: 'interceptProxy',
          methodList: ['interceptPrompt'],
          controller: this.controller,
        })
        // [End intercept_tel]
    }
  }
}
// [End InterceptTelScheme]
