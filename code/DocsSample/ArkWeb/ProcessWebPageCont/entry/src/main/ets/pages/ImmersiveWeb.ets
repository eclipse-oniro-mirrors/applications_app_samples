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
// [Start set_window_layout_full_screen]
import { webview } from '@kit.ArkWeb';
import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'ImmersiveWeb';
const TITLE_HEIGHT: number = 56;
const TITLE_FONT_SIZE: number = 20;

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  private win: window.Window | null = null;

  aboutToAppear(): void {
    // 设置窗口全屏，启用沉浸式效果
    const ctx = this.getUIContext().getHostContext() as common.UIAbilityContext;
    window.getLastWindow(ctx).then((win) => {
      this.win = win;
      win.setWindowLayoutFullScreen(true).catch((error: BusinessError) => {
        hilog.error(DOMAIN, TAG, `setWindowLayoutFullScreen failed: %{public}s`, error.message);
      });
    }).catch((error: BusinessError) => {
      hilog.error(DOMAIN, TAG, `getLastWindow failed: %{public}s`, error.message);
    });
  }

  aboutToDisappear(): void {
    // 离开页面时恢复窗口布局
    if (this.win) {
      this.win.setWindowLayoutFullScreen(false).catch((error: BusinessError) => {
        hilog.error(DOMAIN, TAG, `setWindowLayoutFullScreen failed: %{public}s`, error.message);
      });
    }
  }

  build() {
    Column() {
      // 顶部标题条，背景色延伸到状态栏，直观体现沉浸式全屏效果
      Text($r('app.string.immersive_web_title'))
        .width('100%')
        .height(TITLE_HEIGHT)
        .fontSize(TITLE_FONT_SIZE)
        .fontColor($r('app.color.immersive_title_font'))
        .textAlign(TextAlign.Center)
        .backgroundColor($r('app.color.immersive_title_bg'))
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

      Web({ src: 'www.example.com', controller: this.controller })
        .width('100%').height('100%')
    }
  }
}
// [End set_window_layout_full_screen]
