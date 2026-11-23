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
 * @file entry/src/main/ets/common/ShapeRenderNode.ets
 * 文件职责：ShapeRenderNode 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShapeRenderNodeCanvasPen、ShapeRenderNodeCanvasBrush。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { RenderNode, DrawContext } from '@ohos.arkui.node';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import display from '@ohos.display';

// let 语句
let screen = display.getDefaultDisplaySync();
// let 语句
let screenWidth: number = screen.width;

/**
 * ShapeRenderNodeCanvasPen：类定义，承载本文件对应的逻辑与数据。
 */
export class ShapeRenderNodeCanvasPen extends RenderNode {
  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    // const 语句
    const w = screenWidth / 4;
    // const 语句
    const canvas = context.canvas;
    canvas.detachBrush();
    // const 语句
    const startX = 200;
    // const 语句
    const startY = 60;
    // const 语句
    const fontTitle = new drawing.Font();
    fontTitle.setSize(30); // 30 font size
    // let 语句
    let text = getContext().resourceManager.getStringSync($r('app.string.GeometryWithPen'));
    // const 语句
    const textBlob =
      drawing.TextBlob.makeFromString(text, fontTitle, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, startX, startY);
    // font
    const font = new drawing.Font();
    font.setSize(22); // 22 font size
    // pen
    const pen = new drawing.Pen();
    // const 语句
    const color: common2D.Color = {
      // 字段 alpha：声明并维护该成员的状态
      alpha: 0xFF,
      // 字段 red：声明并维护该成员的状态
      red: 0x44,
      // 字段 green：声明并维护该成员的状态
      green: 0x72,
      // 字段 blue：声明并维护该成员的状态
      blue: 0xC3
    };
    pen.setColor(color);
    pen.setAntiAlias(true);
    pen.setStrokeWidth(3);
    // rect
    const startX1 = 20;
    // const 语句
    const startY1 = 120;
    // const 语句
    const stringRect =
      drawing.TextBlob.makeFromString('DrawRect', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringRect, startX1, startY1);
    canvas.attachPen(pen);
    // const 语句
    const rect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: 20,
      // 字段 top：声明并维护该成员的状态
      top: 150,
      // 字段 right：声明并维护该成员的状态
      right: w - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 250
    };
    canvas.drawRect(rect);
    canvas.detachPen();
    // roundrect
    const startX2 = w;
    // const 语句
    const startY2 = 120;
    // const 语句
    const stringRoundRect =
      drawing.TextBlob.makeFromString('DrawRoundRect', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringRoundRect, startX2, startY2);
    canvas.attachPen(pen);
    // const 语句
    const rectRoundRect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w + 20,
      // 字段 top：声明并维护该成员的状态
      top: 150,
      // 字段 right：声明并维护该成员的状态
      right: w * 2 - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 250
    };
    // const 语句
    const roundRect = new drawing.RoundRect(rectRoundRect, 20, 20);
    canvas.drawRoundRect(roundRect);
    canvas.detachPen();
    // line
    const startX3 = w * 2 + 30;
    // const 语句
    const startY3 = 120;
    // const 语句
    const stringLine =
      drawing.TextBlob.makeFromString('DrawLine', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringLine, startX3, startY3);
    canvas.attachPen(pen);
    canvas.drawLine(w * 2 + 20, 200, w * 3 - 20, 200);
    canvas.detachPen();
    // arc
    const startX4 = w * 3 + 10;
    // const 语句
    const startY4 = 120;
    // const 语句
    const stringArc =
      drawing.TextBlob.makeFromString('DrawArc', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringArc, startX4, startY4);
    canvas.attachPen(pen);
    // const 语句
    const rectArc: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 3 - 50,
      // 字段 top：声明并维护该成员的状态
      top: 150,
      // 字段 right：声明并维护该成员的状态
      right: w * 4 - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 350
    };
    canvas.drawArc(rectArc, 0, -90);
    canvas.detachPen();
    // path
    const startX5 = 20;
    // const 语句
    const startY5 = 320;
    // const 语句
    const stringPath =
      drawing.TextBlob.makeFromString('DrawPath', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringPath, startX5, startY5);
    canvas.attachPen(pen);
    // const 语句
    const path = new drawing.Path();
    // const 语句
    const rectFirst: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: 10,
      // 字段 top：声明并维护该成员的状态
      top: 350,
      // 字段 right：声明并维护该成员的状态
      right: w / 2,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 450
    };
    path.addArc(rectFirst, 0, -130);
    // const 语句
    const rectSecond: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w / 2,
      // 字段 top：声明并维护该成员的状态
      top: 350,
      // 字段 right：声明并维护该成员的状态
      right: w - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 450
    };
    path.addArc(rectSecond, 50, 130);
    canvas.drawPath(path);
    canvas.detachPen();
    // circle
    const startX6 = w + 20;
    // const 语句
    const startY6 = 320;
    // const 语句
    const stringCircle =
      drawing.TextBlob.makeFromString('DrawCircle', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringCircle, startX6, startY6);
    canvas.attachPen(pen);
    canvas.drawCircle(w * 3 / 2, 400, 50);
    canvas.detachPen();
    // oval
    const startX7 = w * 2 + 25;
    // const 语句
    const startY7 = 320;
    // const 语句
    const stringOval =
      drawing.TextBlob.makeFromString('DrawOval', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringOval, startX7, startY7);
    canvas.attachPen(pen);
    // const 语句
    const rectOval: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 2 + 20,
      // 字段 top：声明并维护该成员的状态
      top: 350,
      // 字段 right：声明并维护该成员的状态
      right: w * 3 - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 430
    };
    canvas.drawOval(rectOval);
    canvas.detachPen();

    // Region
    const textBlob1 = drawing.TextBlob.makeFromString('DrawRegion', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob1, 20, 520);
    canvas.detachBrush();
    canvas.attachPen(pen);
    // let 语句
    let centerX = 70;
    // let 语句
    let centerY = 600;
    // let 语句
    let sideLength = 60;
    // let 语句
    let angleIncrement = 2 * Math.PI / 5;
    // let 语句
    let regionPath = new drawing.Path();
    // for 语句
    for (let i = 0; i < 5; ++i) {
      // let 语句
      let angle = angleIncrement * i;
      // let 语句
      let x = centerX + sideLength * Math.cos(angle - 60);
      // let 语句
      let y = centerY - sideLength * Math.sin(angle - 60);
      // if 语句
      if (i === 0) {
        regionPath.moveTo(x, y);
      } else {
        regionPath.lineTo(x, y);
      }
    }
    ;
    regionPath.close();
    // let 语句
    let region = new drawing.Region();
    // let 语句
    let clip = new drawing.Region();
    clip.setRect(10, 400, 690, 650);
    region.setPath(regionPath, clip);
    canvas.drawRegion(region);
    canvas.detachPen();

    // Point
    let startX9 = 20.0+w;
    // let 语句
    let startY9 = 520.0;
    // const 语句
    const stringPoint = drawing.TextBlob.makeFromString('DrawPoint', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringPoint, startX9, startY9);
    // let 语句
    let pPen = new drawing.Pen();
    pPen.setStrokeWidth(8.0);
    canvas.attachPen(pPen);
    canvas.drawPoint(80.0 + w, 580.0);
    canvas.detachPen();
  }
}

/**
 * ShapeRenderNodeCanvasBrush：类定义，承载本文件对应的逻辑与数据。
 */
export class ShapeRenderNodeCanvasBrush extends RenderNode {
  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    // const 语句
    const w = screenWidth / 4;
    // const 语句
    const dis = screenWidth / 2;
    // const 语句
    const canvas = context.canvas;
    canvas.detachBrush();
    // const 语句
    const startX = 200;
    // const 语句
    const startY = 60 + dis;
    // const 语句
    const fontTitle = new drawing.Font();
    fontTitle.setSize(30); // 30 font size
    // let 语句
    let text1 = getContext().resourceManager.getStringSync($r('app.string.GeometryWithBrush'));
    // const 语句
    const textBlob =
      drawing.TextBlob.makeFromString(text1, fontTitle, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, startX, startY);
    // font
    const font = new drawing.Font();
    font.setSize(22); // 22 font size
    // set brush
    const brush = new drawing.Brush();
    // const 语句
    const color: common2D.Color = {
      // 字段 alpha：声明并维护该成员的状态
      alpha: 0xFF,
      // 字段 red：声明并维护该成员的状态
      red: 0x44,
      // 字段 green：声明并维护该成员的状态
      green: 0x72,
      // 字段 blue：声明并维护该成员的状态
      blue: 0xC3
    };
    brush.setColor(color);
    // rect
    const startX1 = 20;
    // const 语句
    const startY1 = 120;
    // const 语句
    const stringRect =
      drawing.TextBlob.makeFromString('DrawRect', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringRect, startX1, startY1 + dis);
    canvas.attachBrush(brush);
    // const 语句
    const rect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: 20,
      // 字段 top：声明并维护该成员的状态
      top: 150 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 250 + dis
    };
    canvas.drawRect(rect);
    canvas.detachBrush();
    // roundrect
    const startX2 = w;
    // const 语句
    const startY2 = 120;
    // const 语句
    const stringRoundRect =
      drawing.TextBlob.makeFromString('DrawRoundRect', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringRoundRect, startX2, startY2 + dis);
    canvas.attachBrush(brush);
    // const 语句
    const rectRoundRect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w + 20,
      // 字段 top：声明并维护该成员的状态
      top: 150 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 2 - 20,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 250 + dis
    };
    // const 语句
    const roundRect = new drawing.RoundRect(rectRoundRect, 20, 20);
    canvas.drawRoundRect(roundRect);
    canvas.detachBrush();
    // line
    const startX3 = w * 2 + 30;
    // const 语句
    const startY3 = 120;
    // const 语句
    const stringLine =
      drawing.TextBlob.makeFromString('DrawLine', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringLine, startX3, startY3 + dis);
    canvas.attachBrush(brush);
    canvas.drawLine(w * 2 + 20, 200 + dis, w * 3 - 20, 200 + dis);
    canvas.detachBrush();
    // arc
    const startX4 = w * 3 + 10;
    // const 语句
    const startY4 = 120;
    // const 语句
    const stringArc =
      drawing.TextBlob.makeFromString('DrawArc', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringArc, startX4, startY4+dis);
    canvas.attachBrush(brush);
    // const 语句
    const rectArc: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 3 - 50,
      // 字段 top：声明并维护该成员的状态
      top: 150 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 4 - 20,
      bottom: 350 + dis
    };
    canvas.drawArc(rectArc, 0, -90);
    canvas.detachBrush();
    // path
    const startX5 = 20;
    const startY5 = 320;
    const stringPath =
      drawing.TextBlob.makeFromString('DrawPath', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringPath, startX5, startY5 + dis);
    canvas.attachBrush(brush);
    const path = new drawing.Path();
    const rectFirst: common2D.Rect = {
      left: 10,
      top: 350 + dis,
      right: w / 2,
      bottom: 450 + dis
    };
    path.addArc(rectFirst, 0, -130);
    const rectSecond: common2D.Rect = {
      left: w / 2,
      top: 350 + dis,
      right: w - 20,
      bottom: 450 + dis
    };
    path.addArc(rectSecond, 50, 130);
    canvas.drawPath(path);
    canvas.detachBrush();
    // circle
    const startX6 = w + 20;
    const startY6 = 320;
    const stringCircle =
      drawing.TextBlob.makeFromString('DrawCircle', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringCircle, startX6, startY6 + dis);
    canvas.attachBrush(brush);
    canvas.drawCircle(w * 3 / 2, 400 + dis, 50);
    canvas.detachBrush();
    // oval
    const startX7 = w * 2 + 25;
    const startY7 = 320;
    const stringOval =
      drawing.TextBlob.makeFromString('DrawOval', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringOval, startX7, startY7 + dis);
    canvas.attachBrush(brush);
    const rectOval: common2D.Rect = {
      left: w * 2 + 20,
      top: 350 + dis,
      right: w * 3 - 20,
      bottom: 430 + dis
    };
    canvas.drawOval(rectOval);
    canvas.detachBrush();
    // background
    const brushLayer = new drawing.Brush;
    brushLayer.setColor({ alpha:0xFF,red:0xFF,green:0xFF,blue:0xFF });
    const rectLayer: common2D.Rect = {
      left: 0,
      top: 0,
      right: 0,
      bottom: 0
    };
    canvas.saveLayer(rectLayer, brushLayer);
    const startX8 = w * 3 - 10;
    const startY8 = 320;
    font.setSize(20);
    const stringBackground =
      drawing.TextBlob.makeFromString('DrawBackground', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(stringBackground, startX8, startY8 + dis);
    const rectBackground: common2D.Rect = {
      left: w * 3 + 20,
      top: 350 + dis,
      right: w * 4 - 20,
      bottom: 450 + dis
    };
    canvas.clipRect(rectBackground, drawing.ClipOp.INTERSECT);
    canvas.attachBrush(brush);
    canvas.drawBackground(brush);
    canvas.detachBrush();
    canvas.restore();

    // Region
    const textBlob1 = drawing.TextBlob.makeFromString('DrawRegion', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob1, 20, 680 + dis);
    canvas.detachBrush();
    const brushBitmap = new drawing.Brush();
    brushBitmap.setColor({alpha: 0xFF, red: 0x44, green: 0x72, blue: 0xC3});
    canvas.attachBrush(brushBitmap);
    let centerX = 70;
    let centerY = 780 + dis;
    let sideLength = 60;
    let angleIncrement = 2 * Math.PI / 5;
    let regionPath = new drawing.Path();
    for (let i = 0; i < 5; ++i) {
      let angle = angleIncrement * i;
      let x = centerX + sideLength * Math.cos(angle - 60);
      let y = centerY - sideLength * Math.sin(angle - 60);
      if (i === 0) {
        regionPath.moveTo(x, y);
      } else {
        regionPath.lineTo(x, y);
      }
    };
    regionPath.close();
    let region = new drawing.Region();
    let clip = new drawing.Region();
    clip.setRect(10, 600 + dis, 690, 850 + dis);
    region.setPath(regionPath, clip);
    canvas.drawRegion(region);
    canvas.detachBrush();
  }
}