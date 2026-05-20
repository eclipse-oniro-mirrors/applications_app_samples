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

import { UIContext, NodeController, FrameNode, RenderNode, DrawContext, Entry, Component, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { VALUE_100, VALUE_200, VALUE_300, VALUE_900 } from '../../pages/Index';
import { STROKE_SAMPLE } from '../../pages/Index';

function drawBaseText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_base_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
  // [End arkts_graphics_draw_base_text]
}

function drawStrokeText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_stroke_text]
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置抗锯齿
  pen.setAntiAlias(true);
  // 设置描边线宽
  pen.setStrokeWidth(3.0);
  // 设置描边颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 添加画笔描边效果
  canvas.attachPen(pen);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_stroke_text]
}

function drawChineseStrokeText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_chinese_stroke_text]
  // 创建画刷
  let brush = new drawing.Brush();
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置抗锯齿
  brush.setAntiAlias(true);
  // 设置描边颜色
  brush.setColor(0xFF, 0xFF, 0xFF, 0xFF);
  pen.setAntiAlias(true);
  // 设置描边线宽
  pen.setStrokeWidth(3.0);
  // 设置描边颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 添加画笔描边效果
  canvas.attachPen(pen);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString(STROKE_SAMPLE, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
    // 去除描边效果
    canvas.detachPen();
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
    canvas.detachBrush();
  }
  // [End arkts_graphics_draw_chinese_stroke_text]
}

function drawGradientText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_gradient_text]
  // 设置渐变起点和终点
  let startPt: common2D.Point = { x: VALUE_100, y: VALUE_100 };
  let endPt: common2D.Point = { x: VALUE_900, y: VALUE_900 };
  let colors = [(0xFFFFFF00).toInt(), (0xFFFF0000).toInt(), (0xFF0000FF).toInt()];
  // 创建线性渐变着色器
  let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
  if (shaderEffect != null) {
    // 创建画刷
    let brush = new drawing.Brush();
    // 设置着色器
    brush.setShaderEffect(shaderEffect);
    // 添加画刷填充效果
    canvas.attachBrush(brush);
    // 创建字型
    const font = new drawing.Font();
    // 设置字体大小
    font.setSize(VALUE_200);
    // 创建字块
    const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    // 绘制字块
    if (textBlob != null) {
      canvas.drawTextBlob(textBlob, VALUE_100, VALUE_300);
    }
    // 去除填充效果
    canvas.detachBrush();
  }
  // [End arkts_graphics_draw_gradient_text]
}

function drawThemeText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_theme_text]
  // 创建线性渐变着色器
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  // 设置跟随主题字体
  font.setThemeFontFollowed(true);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello World', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
  // [End arkts_graphics_draw_theme_text]
}

function drawSingleText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_single_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['H', 'e', 'l', 'l', 'o'];
  for (let s of text) {
    // 单字绘制
    canvas.drawSingleCharacter(s, font, startX, startY);
    // 测量单个字符的宽度
    let textWidth = font.measureSingleCharacter(s);
    startX += textWidth;
  }
  // [End arkts_graphics_draw_single_text]
}

function drawFeatureText(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_feature_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['a', '2', '+', 'b', '2'];
  // 创建字体特征对象数组
  let fontFeatures: drawing.FontFeature[] = [{ name: 'frac', value: 1 }];
  for (let s of text) {
    // 单字绘制
    canvas.drawSingleCharacterWithFeatures(s, font, startX, startY, fontFeatures);
    // 测量单个字符的宽度
    let textWidth = font.measureSingleCharacterWithFeatures(s, fontFeatures);
    startX += textWidth;
  }
  // [End arkts_graphics_draw_feature_text]
}

class MyRenderNode extends RenderNode {
  private drawFunctions: ((canvas: drawing.Canvas) => void)[] = [];
  private currentDrawIndex: int = 0;

  addDrawFunction(func: (canvas: drawing.Canvas) => void): void {
    this.drawFunctions.push(func);
  }

  setDrawIndex(index: int): void {
    if (index >= 0 && index < this.drawFunctions.length) {
      this.currentDrawIndex = index;
      this.invalidate();
    }
  }

  draw(context: DrawContext): void {
    const canvas = context.canvas;
    if (this.currentDrawIndex >= 0 && this.currentDrawIndex < this.drawFunctions.length) {
      this.drawFunctions[this.currentDrawIndex](canvas);
    }
  }
}

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private myRenderNode: MyRenderNode = new MyRenderNode();

  constructor() {
    super();
    this.myRenderNode.addDrawFunction(drawBaseText);
    this.myRenderNode.addDrawFunction(drawStrokeText);
    this.myRenderNode.addDrawFunction(drawChineseStrokeText);
    this.myRenderNode.addDrawFunction(drawGradientText);
    this.myRenderNode.addDrawFunction(drawThemeText);
    this.myRenderNode.addDrawFunction(drawSingleText);
    this.myRenderNode.addDrawFunction(drawFeatureText);
  }

  makeNode(uiContext: UIContext): FrameNode {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode!.getRenderNode()?.appendChild(this.myRenderNode);
    this.myRenderNode.backgroundColor = -1;
    this.myRenderNode.frame = { x: 0, y: 0, width: 4800, height: 4800 };
    this.myRenderNode.pivot = { x: 0.2, y: 0.8 };
    this.myRenderNode.scale = { x: 1, y: 1 };
    return this.rootNode!;
  }

  setDrawIndex(index: int): void {
    this.myRenderNode.setDrawIndex(index);
  }
}

@Entry
@Component
struct TextBlobDrawing {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('基本文字')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('文字描边')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
          Button('中文文字描边')
            .onClick(() => { this.nodeController.setDrawIndex(2) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('文字渐变')
            .onClick(() => { this.nodeController.setDrawIndex(3) })
          Button('主题文字')
            .onClick(() => { this.nodeController.setDrawIndex(4) })
          Button('单字')
            .onClick(() => { this.nodeController.setDrawIndex(5) })
          Button('特征字体')
            .onClick(() => { this.nodeController.setDrawIndex(6) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}