'use static'
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

import { UIContext, NodeController, FrameNode, RenderNode, DrawContext, Entry, Component, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { VALUE_100, VALUE_200, VALUE_300, VALUE_900 } from '../../pages/Index';
import { STROKE_SAMPLE } from '../../pages/Index';

function drawBaseText(canvas: drawing.Canvas): void {
  const font = new drawing.Font();
  font.setSize(100);
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
}

function drawStrokeText(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setAntiAlias(true);
  pen.setStrokeWidth(3.0);
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  const font = new drawing.Font();
  font.setSize(100);
  canvas.attachPen(pen);
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
  canvas.detachPen();
}

function drawChineseStrokeText(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  let pen = new drawing.Pen();
  brush.setAntiAlias(true);
  brush.setColor(0xFF, 0xFF, 0xFF, 0xFF);
  pen.setAntiAlias(true);
  pen.setStrokeWidth(3.0);
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  const font = new drawing.Font();
  font.setSize(100);
  canvas.attachPen(pen);
  const textBlob = drawing.TextBlob.makeFromString(STROKE_SAMPLE, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
    canvas.detachPen();
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
    canvas.detachBrush();
  }
}

function drawGradientText(canvas: drawing.Canvas): void {
  let startPt: common2D.Point = { x: VALUE_100, y: VALUE_100 };
  let endPt: common2D.Point = { x: VALUE_900, y: VALUE_900 };
  let colors = [(-0xFFFFFF00).toInt(), (-0xFFFF0000).toInt(), (-0xFF0000FF).toInt()];
  let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
  if (shaderEffect != null) {
    let brush = new drawing.Brush();
    brush.setShaderEffect(shaderEffect);
    canvas.attachBrush(brush);
    const font = new drawing.Font();
    font.setSize(VALUE_200);
    const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    if (textBlob != null) {
      canvas.drawTextBlob(textBlob, VALUE_100, VALUE_300);
    }
    canvas.detachBrush();
  }
}

function drawThemeText(canvas: drawing.Canvas): void {
  const font = new drawing.Font();
  font.setSize(100);
  font.setThemeFontFollowed(true);
  const textBlob = drawing.TextBlob.makeFromString('Hello World', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  if (textBlob) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
}

function drawSingleText(canvas: drawing.Canvas): void {
  const font = new drawing.Font();
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['H', 'e', 'l', 'l', 'o'];
  for (let s of text) {
    canvas.drawSingleCharacter(s, font, startX, startY);
    let textWidth = font.measureSingleCharacter(s);
    startX += textWidth;
  }
}

function drawFeatureText(canvas: drawing.Canvas): void {
  const font = new drawing.Font();
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['a', '2', '+', 'b', '2'];
  let fontFeatures: drawing.FontFeature[] = [{ name: 'frac', value: 1 }];
  for (let s of text) {
    canvas.drawSingleCharacterWithFeatures(s, font, startX, startY, fontFeatures);
    let textWidth = font.measureSingleCharacterWithFeatures(s, fontFeatures);
    startX += textWidth;
  }
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
          Button('BaseText')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('StrokeText')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
          Button('ChineseText')
            .onClick(() => { this.nodeController.setDrawIndex(2) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('GradientText')
            .onClick(() => { this.nodeController.setDrawIndex(3) })
          Button('ThemeText')
            .onClick(() => { this.nodeController.setDrawIndex(4) })
          Button('SingleText')
            .onClick(() => { this.nodeController.setDrawIndex(5) })
          Button('FeatureText')
            .onClick(() => { this.nodeController.setDrawIndex(6) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}