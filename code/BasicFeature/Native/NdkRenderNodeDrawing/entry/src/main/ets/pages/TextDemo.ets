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

import bridge, { TextMeasureResult } from 'libentry.so';
import { DemoTitle } from '../common/DemoTitle';
import { DemoNodeController } from '../common/DemoRenderNode';
import { ScenePanel } from '../common/ScenePanel';
import { SCENE_TEXT, TEXT_OPTIONS } from '../common/SceneType';
import { Logger } from '../common/Logger';

// 演示用文案直接交给 native 层排版与测量，不参与界面多语言切换，故此处保留硬编码。
const SAMPLE_TEXT: string = 'Hello, OpenHarmony! 你好，鸿蒙！';
const SAMPLE_FONT_SIZE: number = 24;
const SAMPLE_MAX_WIDTH: number = 300;

// 文本绘制演示：TextBlob、Typography 排版与文本测量。
@Entry
@Component
struct TextDemo {
  private controller: DemoNodeController = new DemoNodeController();
  @State private measureInfo: string = '';

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  private measureText(): void {
    const result: TextMeasureResult | undefined =
      bridge.nativeMeasureText(SAMPLE_TEXT, SAMPLE_FONT_SIZE, SAMPLE_MAX_WIDTH);
    if (result === undefined) {
      Logger.error('measure text failed');
      return;
    }
    this.measureInfo = result.width.toFixed(1) + ' x ' + result.height.toFixed(1) + ' px';
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.text_title'), pageKey: 'text' })
      Text($r('app.string.text_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Column() {
        ScenePanel({ controller: this.controller, options: TEXT_OPTIONS, scene: SCENE_TEXT, pageKey: 'text' })
      }
      .width('100%')
      .layoutWeight(1)
      Row() {
        Button($r('app.string.btn_measure'))
          .id('text_measure_btn')
          .fontSize(14)
          .height(32)
          .backgroundColor($r('app.color.primary'))
          .onClick(() => {
            this.measureText();
          })
        Text($r('app.string.state_measure'))
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .margin({ left: 8 })
        Text(this.measureInfo)
          .id('text_measure_result')
          .fontSize(12)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 4 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
