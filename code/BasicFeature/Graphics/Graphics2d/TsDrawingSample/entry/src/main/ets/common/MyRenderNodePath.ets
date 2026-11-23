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
 * @file entry/src/main/ets/common/MyRenderNodePath.ets
 * 文件职责：MyRenderNodePath 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MyRenderNodePathBrush、MyRenderNodePathPen、MyRenderNodePathShader。
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
 * MyRenderNodePathBrush：类定义，承载本文件对应的逻辑与数据。
 */
export class MyRenderNodePathBrush extends RenderNode {
  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    // title
    const canvas = context.canvas;
    canvas.detachBrush();
    // const 语句
    const startX = 200;
    // const 语句
    const startY = 60;
    // const 语句
    const dis = 1000;
    // const 语句
    const w = screenWidth / 6;
    // const 语句
    const font = new drawing.Font();
    font.setSize(screenWidth / 25);
    // let 语句
    let text = getContext().resourceManager.getStringSync($r('app.string.DrawPathWithBrush'));
    // const 语句
    const textBlob =
      drawing.TextBlob.makeFromString(text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, startX, startY + dis);
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
    canvas.attachBrush(brush);
    // rect
    const pathRect = new drawing.Path();
    // const 语句
    const rect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w + 10,
      // 字段 top：声明并维护该成员的状态
      top: 100 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 2 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 160 + dis
    };
    pathRect.addRect(rect);
    canvas.drawPath(pathRect);
    // oval
    const pathOval = new drawing.Path();
    // const 语句
    const rectOval: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 2 + 10,
      // 字段 top：声明并维护该成员的状态
      top: 100 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 3 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 160 + dis
    };
    pathOval.addOval(rectOval, 0);
    canvas.drawPath(pathOval);
    // roundrect
    const pathRoundRect = new drawing.Path();
    // const 语句
    const rectRoundRect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 3 + 10,
      // 字段 top：声明并维护该成员的状态
      top: 100 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 4 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 160 + dis
    };
    // const 语句
    const roundRect = new drawing.RoundRect(rectRoundRect, 20, 20);
    pathRoundRect.addRoundRect(roundRect);
    canvas.drawPath(pathRoundRect);
    // polygon
    const pathPolygon = new drawing.Path();
    // let 语句
    let points: common2D.Point[] = [];
    // const 语句
    const point1: common2D.Point = { x: w * 4 + 10, y: 160 + dis };
    // const 语句
    const point2: common2D.Point = { x: w * 5 - 10, y: 160 + dis };
    // const 语句
    const point3: common2D.Point = { x: w * 9 / 2, y: 100 + dis };
    points.push(point1);
    points.push(point2);
    points.push(point3);
    pathPolygon.addPolygon(points, true);
    canvas.drawPath(pathPolygon);
    // arc
    const pathArc = new drawing.Path();
    // const 语句
    const rectArc: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 5 - 50,
      // 字段 top：声明并维护该成员的状态
      top: 100 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 6 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 220 + dis
    };
    pathArc.addArc(rectArc, 0, -90);
    canvas.drawPath(pathArc);
    // detach
    canvas.detachBrush();
  }
}

/**
 * MyRenderNodePathPen：类定义，承载本文件对应的逻辑与数据。
 */
export class MyRenderNodePathPen extends RenderNode {
  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    // title
    const canvas = context.canvas;
    canvas.detachBrush();
    // const 语句
    const startX = 200;
    // const 语句
    const startY = 230;
    // const 语句
    const dis = 1000;
    // const 语句
    const w = screenWidth / 6;
    // const 语句
    const font = new drawing.Font();
    font.setSize(screenWidth / 25);
    // let 语句
    let text1 = getContext().resourceManager.getStringSync($r('app.string.DrawPathWithPen'));
    // const 语句
    const textBlob = drawing.TextBlob.makeFromString(text1,
      font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, startX, startY + dis);
    // set pen
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
    canvas.attachPen(pen);
    // lineto
    const pathLine = new drawing.Path();
    pathLine.moveTo(20, 290 + dis);
    pathLine.lineTo(w - 20, 290 + dis);
    canvas.drawPath(pathLine);
    // rect
    const pathRect = new drawing.Path();
    // const 语句
    const rect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w + 10,
      // 字段 top：声明并维护该成员的状态
      top: 260 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 2 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 320 + dis
    };
    pathRect.addRect(rect);
    canvas.drawPath(pathRect);
    // oval
    const pathOval = new drawing.Path();
    // const 语句
    const rectOval: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 2 + 10,
      // 字段 top：声明并维护该成员的状态
      top: 260 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 3 - 10,
      // 字段 bottom：声明并维护该成员的状态
      bottom: 320 + dis
    };
    pathOval.addOval(rectOval, 0);
    canvas.drawPath(pathOval);
    // roundRect
    const pathRoundRect = new drawing.Path();
    // const 语句
    const rectRoundRect: common2D.Rect = {
      // 字段 left：声明并维护该成员的状态
      left: w * 3 + 10,
      // 字段 top：声明并维护该成员的状态
      top: 260 + dis,
      // 字段 right：声明并维护该成员的状态
      right: w * 4 - 10,
      bottom: 320 + dis
    };
    const roundRect = new drawing.RoundRect(rectRoundRect, 20, 20);
    pathRoundRect.addRoundRect(roundRect);
    canvas.drawPath(pathRoundRect);
    // polygon
    const pathPolygon = new drawing.Path();
    let points: common2D.Point[] = [];
    const point1: common2D.Point = { x: w * 4 + 10, y: 320 + dis };
    const point2: common2D.Point = { x: w * 5 - 10, y: 320 + dis };
    const point3: common2D.Point = { x: w * 9 / 2, y: 260 + dis };
    points.push(point1);
    points.push(point2);
    points.push(point3);
    pathPolygon.addPolygon(points, true);
    canvas.drawPath(pathPolygon);
    // arc
    const pathArc = new drawing.Path();
    const rectArc: common2D.Rect = {
      left: w * 5 - 50,
      top: 260 + dis,
      right: w * 6 - 10,
      bottom: 380 + dis
    };
    pathArc.addArc(rectArc, 0, -90);
    canvas.drawPath(pathArc);
    // detach
    canvas.detachPen();
  }
}

/**
 * MyRenderNodePathShader：类定义，承载本文件对应的逻辑与数据。
 */
export class MyRenderNodePathShader extends RenderNode {
  /**
   * draw：执行 draw 相关逻辑。
   */
  async draw(context: DrawContext) {
    // title
    const canvas = context.canvas;
    canvas.detachBrush();
    const startX = 200;
    const startY = 380;
    const dis = 1000;
    const w = screenWidth / 6;
    const font = new drawing.Font();
    font.setSize(screenWidth / 25);
    let text2 = getContext().resourceManager.getStringSync($r('app.string.DrawPathWithShader'));
    const textBlob = drawing.TextBlob.makeFromString(text2,
      font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, startX, startY + dis);
    // rect
    const brushRect = new drawing.Brush();
    const startPt1: common2D.Point = { x: w * 3 / 2, y: 410 + dis };
    const endPt1: common2D.Point = { x: w * 3 / 2, y: 470 + dis };
    const shaderEffectRect =
      drawing.ShaderEffect.createLinearGradient(startPt1, endPt1, [0xFFF8FA12, 0xFFACC3DD], drawing.TileMode.CLAMP);
    brushRect.setShaderEffect(shaderEffectRect);
    canvas.attachBrush(brushRect);
    const pathRect = new drawing.Path();
    const rect: common2D.Rect = {
      left: w + 10,
      top: 410 + dis,
      right: w * 2 - 10,
      bottom: 470 + dis
    };
    pathRect.addRect(rect);
    canvas.drawPath(pathRect);
    canvas.detachBrush();
    // oval
    const brushOval = new drawing.Brush();
    const startPt2: common2D.Point = { x: w * 5 / 2, y: 410 + dis };
    const endPt2: common2D.Point = { x: w * 5 / 2, y: 470 + dis };
    const shaderEffectOval =
      drawing.ShaderEffect.createLinearGradient(startPt2, endPt2, [0xFFF8FA12, 0xFFACC3DD], drawing.TileMode.CLAMP);
    brushOval.setShaderEffect(shaderEffectOval);
    canvas.attachBrush(brushOval);
    const pathOval = new drawing.Path();
    const rectOval: common2D.Rect = {
      left: w * 2 + 10,
      top: 410 + dis,
      right: w * 3 - 10,
      bottom: 470 + dis
    };
    pathOval.addOval(rectOval, 0);
    canvas.drawPath(pathOval);
    canvas.detachBrush();
    // roundrect
    const brushRoundRect = new drawing.Brush();
    const startPt3: common2D.Point = { x: w * 7 / 2, y: 410 + dis };
    const endPt3: common2D.Point = { x: w * 7 / 2, y: 470 + dis };
    const shaderEffectRoundRect =
      drawing.ShaderEffect.createLinearGradient(startPt3, endPt3, [0xFFF8FA12, 0xFFACC3DD], drawing.TileMode.CLAMP);
    brushRoundRect.setShaderEffect(shaderEffectRoundRect);
    canvas.attachBrush(brushRoundRect);
    const pathRoundRect = new drawing.Path();
    const rectRoundRect: common2D.Rect = {
      left: w * 3 + 10,
      top: 410 + dis,
      right: w * 4 - 10,
      bottom: 470 + dis
    };
    const roundRect = new drawing.RoundRect(rectRoundRect, 20, 20 + dis);
    pathRoundRect.addRoundRect(roundRect);
    canvas.drawPath(pathRoundRect);
    canvas.detachBrush();
    // polygon
    const brushPolygon = new drawing.Brush();
    const startPt4: common2D.Point = { x: w * 9 / 2, y: 410 + dis };
    const endPt4: common2D.Point = { x: w * 9 / 2, y: 470 + dis };
    const shaderEffectPolygon =
      drawing.ShaderEffect.createLinearGradient(startPt4, endPt4, [0xFFF8FA12, 0xFFACC3DD], drawing.TileMode.CLAMP);
    brushPolygon.setShaderEffect(shaderEffectPolygon);
    canvas.attachBrush(brushPolygon);
    const pathPolygon = new drawing.Path();
    let points: common2D.Point[] = [];
    const point1: common2D.Point = { x: w * 4 + 10, y: 470 + dis };
    const point2: common2D.Point = { x: w * 5 - 10, y: 470 + dis };
    const point3: common2D.Point = { x: w * 9 / 2, y: 410 + dis };
    points.push(point1);
    points.push(point2);
    points.push(point3);
    pathPolygon.addPolygon(points, true);
    canvas.drawPath(pathPolygon);
    canvas.detachBrush();
    // arc
    const brushArc = new drawing.Brush();
    const startPt5: common2D.Point = { x: w * 11 / 2, y: 410 + dis };
    const endPt5: common2D.Point = { x: w * 6 - 10, y: 470 + dis };
    const shaderEffectArc =
      drawing.ShaderEffect.createLinearGradient(startPt5, endPt5, [0xFFF8FA12, 0xFFACC3DD], drawing.TileMode.CLAMP);
    brushArc.setShaderEffect(shaderEffectArc);
    canvas.attachBrush(brushArc);
    const pathArc = new drawing.Path();
    const rectArc: common2D.Rect = {
      left: w * 5 - 50,
      top: 410 + dis,
      right: w * 6 - 10,
      bottom: 530 + dis
    };
    pathArc.addArc(rectArc, 0, -90);
    canvas.drawPath(pathArc);
    canvas.detachBrush();
  }
}