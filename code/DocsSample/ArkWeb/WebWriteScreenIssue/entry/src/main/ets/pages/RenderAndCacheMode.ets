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
// [Start RenderAndCacheMode]
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void {
    // [Start set_render_process_mode]
    // 设置渲染进程为单进程模式，解决 Tablet/PC/2in1 设备上多进程 iframe 加载白屏问题
    try {
      webview.WebviewController.setRenderProcessMode(webview.RenderProcessMode.SINGLE);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
    }
    // [End set_render_process_mode]
  }

  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        // [Start cache_mode]
        // 设置缓存模式为 Online，绕过缓存协商校验（避免 412 导致白屏）
        .cacheMode(CacheMode.Online)
        // [End cache_mode]
    }
  }
}
// [End RenderAndCacheMode]
