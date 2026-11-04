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

import { hilog } from '@kit.PerformanceAnalysisKit';

import {
  ResourceStr, Entry, Component, State, StorageLink, Scroll, Column, Row, Text, Button, display,
  FontWeight, HorizontalAlign, FlexAlign, Alignment, $r
} from '@kit.ArkUI';
import { previewSender } from './PreviewSender';

const DOMAIN = 0xF811;
const TAG = 'PreviewTextStyleStatic';

@Entry
@Component
struct KeyboardPanel {
  @StorageLink('previewSenderStatus') status: ResourceStr = $r('app.string.waiting_editor_connection');
  @StorageLink('previewPanelHeightVp') storedPanelHeightVp: number = 0;
  @State panelHeightVp: number = 0;


  aboutToAppear(): void {
    const screen = display.getDefaultDisplaySync();
    const panelHeight: long = (screen.height * 0.38).toInt();
    hilog.info(DOMAIN, TAG, '%{public}s', `STA root stored height ${this.storedPanelHeightVp}vp`);
    hilog.info(DOMAIN, TAG, '%{public}s', `STA root display ${screen.width}x${screen.height}, density ${screen.densityPixels}`);
    this.panelHeightVp = panelHeight / screen.densityPixels;
    hilog.info(DOMAIN, TAG, '%{public}s', `STA root local height ${this.panelHeightVp}vp`);
  }

  build(): void {
    Scroll() {
      Column() {
        Text($r('app.string.keyboard_title'))
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .maxLines(1)
          .margin({ bottom: 16 })
        Row() {
          Button($r('app.string.send_preview'))
            .layoutWeight(1)
            .height(48)
            .fontSize(16)
            .margin({ right: 12 })
            .focusable(false)
            .id('previewAsync')
            .onClick((): void => {
              previewSender.send();
            })
          Button($r('app.string.finish'))
            .layoutWeight(1)
            .height(48)
            .fontSize(16)
            .focusable(false)
            .id('previewFinish')
            .onClick((): void => {
              previewSender.finish();
            })
        }
        .width('100%')
        .margin({ bottom: 16 })
        Text(this.status)
          .id('previewSenderStatus')
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
          .height(40)
          .maxLines(2)
      }
      .width('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height(this.panelHeightVp)
    .align(Alignment.TopStart)
    .backgroundColor($r('app.color.panel_background'))
  }
}
