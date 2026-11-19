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

import { DemoTitle } from '../common/DemoTitle';
import { DemoNodeController, DemoRenderNode } from '../common/DemoRenderNode';
import { SCENE_SHAPE, SHAPE_ROUND_RECT } from '../common/SceneType';
import { toVp } from '../common/UnitUtil';

const BLUR_NONE: number = 0;
const BLUR_BACKGROUND: number = 1;
const BLUR_CONTENT: number = 2;
const BLUR_FOREGROUND: number = 3;
const MAX_BLUR_RADIUS: number = 40;

// 模糊效果演示：API 26 起 RenderNode 支持背景、内容与前景模糊。
@Entry
@Component
struct BlurDemo {
  private controller: DemoNodeController = new DemoNodeController();
  @State private mode: number = BLUR_NONE;
  @State private radius: number = 16;

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  private applyBlur(): void {
    const node: DemoRenderNode | null = this.controller.getNode();
    if (node === null) {
      return;
    }
    // 每次切换前清空三类模糊，保证同一时刻只有一种生效。
    node.backgroundBlur = undefined;
    node.contentBlur = undefined;
    node.foregroundBlur = undefined;
    if (this.mode === BLUR_BACKGROUND) {
      node.backgroundBlur = { radius: this.radius };
    } else if (this.mode === BLUR_CONTENT) {
      node.contentBlur = { radius: this.radius };
    } else if (this.mode === BLUR_FOREGROUND) {
      node.foregroundBlur = { radius: this.radius };
    }
    node.invalidate();
  }

  private selectMode(mode: number): void {
    this.mode = mode;
    this.applyBlur();
  }

  private modeBackground(mode: number): ResourceColor {
    return this.mode === mode ? $r('app.color.primary') : $r('app.color.panel');
  }

  private modeColor(mode: number): ResourceColor {
    return this.mode === mode ? $r('app.color.text_on_primary') : $r('app.color.text_primary');
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.blur_title'), pageKey: 'blur' })
      Text($r('app.string.blur_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Stack() {
        Image($rawfile('test.jpg'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
        NodeContainer(this.controller)
          .id('blur_canvas')
          .width('100%')
          .height('100%')
          .onAreaChange((_oldValue: Area, newValue: Area) => {
            this.controller.resize(toVp(newValue.width), toVp(newValue.height));
          })
          .onAppear(() => {
            this.controller.setScene(SCENE_SHAPE, SHAPE_ROUND_RECT);
            this.applyBlur();
          })
      }
      .width('100%')
      .layoutWeight(1)
      .borderRadius(12)
      .clip(true)
      Row() {
        Button($r('app.string.blur_background'))
          .id('blur_mode_background')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.modeBackground(BLUR_BACKGROUND))
          .fontColor(this.modeColor(BLUR_BACKGROUND))
          .onClick(() => {
            this.selectMode(BLUR_BACKGROUND);
          })
        Button($r('app.string.blur_content'))
          .id('blur_mode_content')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.modeBackground(BLUR_CONTENT))
          .fontColor(this.modeColor(BLUR_CONTENT))
          .onClick(() => {
            this.selectMode(BLUR_CONTENT);
          })
        Button($r('app.string.blur_foreground'))
          .id('blur_mode_foreground')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.modeBackground(BLUR_FOREGROUND))
          .fontColor(this.modeColor(BLUR_FOREGROUND))
          .onClick(() => {
            this.selectMode(BLUR_FOREGROUND);
          })
        Button($r('app.string.btn_reset'))
          .id('blur_reset')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.selectMode(BLUR_NONE);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 })
      Row() {
        Text($r('app.string.blur_radius'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
        Slider({ value: this.radius, min: 0, max: MAX_BLUR_RADIUS, step: 1 })
          .id('blur_radius')
          .width('70%')
          .margin({ left: 8 })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.radius = value;
            this.applyBlur();
          })
      }
      .width('100%')
      .height(40)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
