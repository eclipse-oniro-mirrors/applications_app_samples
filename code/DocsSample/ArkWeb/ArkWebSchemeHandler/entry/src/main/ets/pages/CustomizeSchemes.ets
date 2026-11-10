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

// [Start register_custom_schemes]
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
controller: webview.WebviewController = new webview.WebviewController();
responseWeb: WebResourceResponse = new WebResourceResponse();
scheme1: webview.WebCustomScheme = { schemeName: 'name1', isSupportCORS: true, isSupportFetch: true };
scheme2: webview.WebCustomScheme = { schemeName: 'name2', isSupportCORS: true, isSupportFetch: true };
scheme3: webview.WebCustomScheme = { schemeName: 'name3', isSupportCORS: true, isSupportFetch: true };

aboutToAppear(): void {
    try {
    webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3]);
    } catch (error) {
    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
}

build() {
    Column() {
    Web({ src: 'www.example.com', controller: this.controller })
        .onInterceptRequest((event) => {
        if (event) {
            console.info('url:' + event.request.getRequestUrl());
        }
        return this.responseWeb;
        })
    }
    }
}
// [End register_custom_schemes]