/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { DemoTitle } from '../common/DemoTitle';
import { DemoNodeController } from '../common/DemoRenderNode';
import { Logger } from '../common/Logger';
import { loadPixelMap, releasePixelMap } from '../common/PixelMapUtil';
import {
  IMAGE_STRETCH,
  SCENE_IMAGE,
  SCENE_SHAPE,
  SCENE_TEXT,
  SHAPE_PATH,
  TEXT_TYPOGRAPHY
} from '../common/SceneType';
import { toVp } from '../common/UnitUtil';

// 原三图元演示：路径、文本、图片，均通过统一桥接接口绘制。
@Entry
@Component
struct DrawDemo {
  private controller: DemoNodeController = new DemoNodeController();
  private pixelMap: image.PixelMap | undefined = undefined;
  @State private selected: number = 0;
  @State private imageReady: boolean = false;

  aboutToAppear(): void {
    // getHostContext 替代已废弃的全局 getContext。
    const context: common.Context | undefined = this.getUIContext().getHostContext();
    if (context === undefined) {
      Logger.warn('host context is unavailable');
      return;
    }
    loadPixelMap(context.resourceManager, 'test.jpg').then((pMap: image.PixelMap | undefined) => {
      if (pMap === undefined) {
        return;
      }
      this.pixelMap = pMap;
      this.imageReady = true;
      this.controller.setPixelMap(pMap);
    });
  }

  aboutToDisappear(): void {
    releasePixelMap(this.pixelMap).then(() => {
      this.pixelMap = undefined;
      this.imageReady = false;
    });
    this.controller.disposeNode();
  }

  private drawPath(): void {
    this.selected = 0;
    this.controller.setScene(SCENE_SHAPE, SHAPE_PATH);
  }

  private drawText(): void {
    this.selected = 1;
    this.controller.setScene(SCENE_TEXT, TEXT_TYPOGRAPHY);
  }

  private drawImage(): void {
    if (this.pixelMap === undefined) {
      Logger.warn('pixel map is not ready');
      return;
    }
    this.selected = 2;
    this.controller.setScene(SCENE_IMAGE, IMAGE_STRETCH);
  }

  private buttonBackground(index: number): ResourceColor {
    return this.selected === index ? $r('app.color.primary') : $r('app.color.panel');
  }

  private buttonColor(index: number): ResourceColor {
    return this.selected === index ? $r('app.color.text_on_primary') : $r('app.color.text_primary');
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.draw_title'), pageKey: 'draw' })
      Text($r('app.string.draw_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      NodeContainer(this.controller)
        .id('draw_canvas')
        .width('100%')
        .layoutWeight(1)
        .backgroundColor($r('app.color.canvas_background'))
        .borderRadius(12)
        .clip(true)
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          this.controller.resize(toVp(newValue.width), toVp(newValue.height));
        })
        .onAppear(() => {
          this.drawPath();
        })
      if (!this.imageReady) {
        Text($r('app.string.image_missing'))
          .fontSize(12)
          .fontColor($r('app.color.accent'))
          .margin({ top: 4 })
      }
      Row() {
        Button($r('app.string.draw_path'))
          .id('draw_path')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.buttonBackground(0))
          .fontColor(this.buttonColor(0))
          .onClick(() => {
            this.drawPath();
          })
        Button($r('app.string.draw_text'))
          .id('draw_text')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.buttonBackground(1))
          .fontColor(this.buttonColor(1))
          .onClick(() => {
            this.drawText();
          })
        Button($r('app.string.draw_image'))
          .id('draw_image')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor(this.buttonBackground(2))
          .fontColor(this.buttonColor(2))
          .onClick(() => {
            this.drawImage();
          })
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
