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
// [Start switch between portrait and landscape]
import { webview } from '@kit.ArkWeb';
import { window, router } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct WebVideo {
  controller: webview.WebviewController = new webview.WebviewController();
  @State isFullScreen: boolean = false;

  // [Start toggle screen orientation]
  // 改变设备横竖屏状态
  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT);
    }).catch((err: Error) => {
      console.error(`获取窗口失败: ${err.message}`);
    });
  }
  // [End toggle screen orientation]

  // [Start exit full screen]
  onBackPress(): boolean | void {
    if (this.isFullScreen) {
      this.isFullScreen = false;
      this.changeOrientation(false);
      return true;
    } else {
      router.back();
      return true;
    }
  }
  // [End exit full screen]

  build() {
    Column() {
      // [Start toggle fullscreen]
      Web({
        src: $rawfile('video.html'), // 需要替换
        controller: this.controller
      })
        .domStorageAccess(true)
        .expandSafeArea([SafeAreaType.SYSTEM])
        .onFullScreenEnter(() => {
          this.isFullScreen = true;
          this.changeOrientation(true);
        })
        .onFullScreenExit(() => {
          this.isFullScreen = false;
          this.changeOrientation(false);
        })
      // [End toggle fullscreen]
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}
// [End switch between portrait and landscape]
