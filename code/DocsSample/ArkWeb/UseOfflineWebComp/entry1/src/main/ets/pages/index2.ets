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
// [Start nodeContainer_bind_controller_show_dynamic_pages]
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct index2 {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Row() {
      Column() {
        Web({src: 'www.example.com', controller: this.webviewController})
          .width('100%')
          .height('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End nodeContainer_bind_controller_show_dynamic_pages]