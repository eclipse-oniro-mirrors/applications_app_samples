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

/**
 * @file entry/src/main/ets/common/ImageRenderNode.ets
 * 文件职责：ImageRenderNode 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageRenderNode、ImageRectRenderNode。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { RenderNode, DrawContext } from '@ohos.arkui.node';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';
import display from '@ohos.display';

// let 语句
let screen = display.getDefaultDisplaySync();

let screenWidth: number = screen.width;

/**
 * ImageRenderNode：类定义，承载本文件对应的逻辑与数据。
 */
export class ImageRenderNode extends RenderNode {
  private pMap: image.PixelMap | undefined = undefined;

  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    const canvas = context.canvas;
    let font = new drawing.Font();
    font.setSize(23);
    // DrawImage
    let text = getContext().resourceManager.getStringSync($r('app.string.DrawImage'));
    const textBlob1 = drawing.TextBlob.makeFromString(text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob1, 20, 300);
    canvas.drawImage(this.pMap, 60, 320);

    // DrawPixelMapMesh
    let text2 = getContext().resourceManager.getStringSync($r('app.string.DrawPixelMapMesh'));
    const textBlob2 = drawing.TextBlob.makeFromString(text2,
      font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob2, 320, 300);
    const brush = new drawing.Brush();
    canvas.attachBrush(brush);
    let verts: number[] =
      [320, 320, 390, 320, 460, 320, 320, 380, 390, 380, 460, 380, 320, 450, 390, 450, 460, 450];
    canvas.drawPixelMapMesh(this.pMap, 2, 2, verts, 0, null, 0);
    canvas.detachBrush();
  }

  /**
   * setPixelMap：执行 setPixelMap 相关逻辑。
   */
  setPixelMap(p: PixelMap) {
    this.pMap = p;
  }
}

/**
 * ImageRectRenderNode：类定义，承载本文件对应的逻辑与数据。
 */
export class ImageRectRenderNode extends RenderNode {
  private pMap: image.PixelMap | undefined = undefined;

  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    const canvas = context.canvas;
    // DrawImageRectWithSrc
    let font = new drawing.Font();
    font.setSize(23); // 23 is font size;
    let fontTitle = new drawing.Font();
    fontTitle.setSize(screenWidth / 25);

    let text3 = getContext().resourceManager.getStringSync($r('app.string.DrawPicture'));
    const stringImage = drawing.TextBlob.makeFromString(text3,
      fontTitle, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringImage, screenWidth / 3, 50.0);
    let text4 = getContext().resourceManager.getStringSync($r('app.string.DrawImageRectWithSrc'));
    const textBlob1 = drawing.TextBlob.makeFromString(text4,
      font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob1, 20, 80.0);
    canvas.detachBrush();

    // DrawImageRectWithSrc
    let srcRect: common2D.Rect = {
      left: 0,
      top: 0,
      right: 140,
      bottom: 140
    };
    let dstRect: common2D.Rect = {
      left: 60,
      top: 100,
      right: 200,
      bottom: 240
    };
    canvas.drawImageRectWithSrc(this.pMap, srcRect, dstRect);

    // DrawImageRect
    let font1 = new drawing.Font();
    font1.setSize(23); // 23 is font size;
    let text5 = getContext().resourceManager.getStringSync($r('app.string.DrawImageRect'));
    const textBlob2 = drawing.TextBlob.makeFromString(text5, font1, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob2, 320, 80.0);
    canvas.detachBrush();
    let rect: common2D.Rect = {
      left: 330,
      top: 100,
      right: 470,
      bottom: 240
    };
    canvas.drawImageRect(this.pMap, rect);
  }

  /**
   * setPixelMap：执行 setPixelMap 相关逻辑。
   */
  setPixelMap(p: PixelMap) {
    this.pMap = p;
  }
}