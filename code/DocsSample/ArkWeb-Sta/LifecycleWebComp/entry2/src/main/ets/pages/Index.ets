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

// [Start on_render_exited_index_static]
import webview from '@ohos.web.webview';
import hilog from '@ohos.hilog'
import { OnRenderExitedEvent, RenderExitReason, Entry, Component, Column, Web } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct WebComponent {
  needReloadWhenVisible: boolean = false;  // Web组件不可见时render退出后阻止重新加载页面，在可见时重新加载页面。
  webIsVisible: boolean = false;            // 判断Web组件是否可见。

  // 此处是将子进程异常崩溃和其它异常原因做了区分，应用开发者可根据实际业务特点，细化对应异常的处理策略。
  renderReloadMaxForCrashed: number = 5;    // 设置因为异常崩溃后重新加载的最大重试次数，应用可根据业务特点，自行设置试错上限。
  renderReloadCountForCrashed: number = 0;  // 异常崩溃后重新加载的次数。
  renderReloadMaxForOthers: number = 10;    // 设置因为其它异常原因退出的最大重试次数，应用可根据业务特点，自行设置试错上限。
  renderReloadCountForOthers: number = 0;   // 其它异常原因退出后重新加载的次数。

  // 创建Web组件。
  controller: webview.WebviewController = new webview.WebviewController(undefined);

  // 指定加载的页面。
  url: string = "www.example.com";
  build() {
    Column() {
      Web({ src: this.url, controller: this.controller })
        .onVisibleAreaChange([0, 1.0], (isVisible) => {
          this.webIsVisible = isVisible;
          if (isVisible && this.needReloadWhenVisible) { // Web组件可见时重新加载页面。
            this.needReloadWhenVisible = false;
            this.controller.loadUrl(this.url);
          }
        })
        // 应用监听渲染子进程异常退出回调，并进行异常处理。
        .onRenderExited((event: OnRenderExitedEvent): void => {
          if (!event) {
            return;
          }
          if (event.renderExitReason == RenderExitReason.PROCESS_CRASHED) {
            if (this.renderReloadCountForCrashed >= this.renderReloadMaxForCrashed) {
              // 设置重试次数上限保护，避免必现问题导致页面被循环加载。
              return;
            }
            console.info('renderReloadCountForCrashed: ' + this.renderReloadCountForCrashed);
            this.renderReloadCountForCrashed++;
          } else {
            if (this.renderReloadCountForOthers >= this.renderReloadMaxForOthers) {
              // 设置重试次数上限保护, 避免必现问题导致页面被循环加载。
              return;
            }
            console.info('renderReloadCountForOthers: ' + this.renderReloadCountForOthers);
            this.renderReloadCountForOthers++;
          }
          if (this.webIsVisible) {
            // Web组件可见则立即重新加载。
            this.controller.loadUrl(this.url);
            return;
          }
          // Web组件不可见时不立即重新加载。
          this.needReloadWhenVisible = true;
        })
    }
  }
}

// [End on_render_exited_index_static]