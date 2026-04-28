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

import { $rawfile, State, Web, FullScreenEnterEvent, FullScreenExitHandler, Visibility, Text, Column, Component, Entry } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct ShortWebPage {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State marginTop: number = 100;
  @State isVisible: boolean = true; // 自定义标志位isVisible，来控制是否需要显示组件
  private handler: FullScreenExitHandler = new FullScreenExitHandler();

  build() {
    Column() {
      Text('TextTextTextText')
        .width('100%')
        .height(this.marginTop)
        .backgroundColor('#e1dede') // 当isVisible标志位为true的时候，组件状态为可见，否则组件状态为不可见，不参与布局、不进行占位
        .visibility(this.isVisible ? Visibility.Visible :
          Visibility.None)
      Web({
        src: $rawfile('FullScreen.html'), // 示例网址
        controller: this.controller
      })
        .onFullScreenEnter((event: FullScreenEnterEvent): void => {
          console.info('onFullScreenEnter...');
          // 当全屏的时候，isVisible标志位为false，组件状态为不可见，不参与布局、不进行占位
          this.isVisible = false;
          this.handler = event.handler;
        })
        .onFullScreenExit((): void => {
          console.info("onFullScreenExit...")
          if (this.handler) {
            this.handler.exitFullScreen();
            // 当退出全屏的时候，isVisible标志位为true，组件状态为可见
            this.isVisible = true;
          }
        })
        .width('100%')
        .height('100%')
        .zIndex(10)
        .zoomAccess(true)
    }.width('100%').height('100%')
  }
}