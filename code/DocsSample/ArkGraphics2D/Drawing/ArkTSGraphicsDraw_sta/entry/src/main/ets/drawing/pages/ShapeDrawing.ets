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

import { DrawContext, FrameNode, NodeController, RenderNode, UIContext, Entry, Component, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { VALUE_100, VALUE_200, VALUE_300, VALUE_400, VALUE_500, VALUE_600, VALUE_630, VALUE_700, VALUE_800, VALUE_900, VALUE_1000, VALUE_1800 } from '../../pages/Index';

function drawPoint(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  pen.setStrokeWidth(40);
  canvas.attachPen(pen);
  canvas.drawPoint(VALUE_200, VALUE_200);
  canvas.drawPoint(VALUE_400, VALUE_400);
  canvas.drawPoint(VALUE_600, VALUE_600);
  canvas.drawPoint(VALUE_800, VALUE_800);
  canvas.drawPoint(VALUE_1000, VALUE_1000);
  canvas.detachPen();
}

function drawArc(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  pen.setStrokeWidth(20);
  canvas.attachPen(pen);
  const rect: common2D.Rect = { left: VALUE_100, top: VALUE_200, right: VALUE_1000, bottom: VALUE_600 };
  canvas.drawArc(rect, 0, 180);
  canvas.detachPen();
}

function drawCircle(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  pen.setStrokeWidth(20);
  canvas.attachPen(pen);
  canvas.drawCircle(VALUE_630, VALUE_630, VALUE_500);
  canvas.detachPen();
}

function drawPath(canvas: drawing.Canvas): void {
  let height_ = VALUE_1800;
  let width_ = VALUE_1800;
  let len = height_ / 4;
  let aX = width_ / 3;
  let aY = height_ / 6;
  let dX = aX - len * Math.sin(18.0);
  let dY = aY + len * Math.cos(18.0);
  let cX = aX + len * Math.sin(18.0);
  let cY = dY;
  let bX = aX + (len / 2.0);
  let bY = aY + Math.sqrt((cX - dX) * (cX - dX) + (len / 2.0) * (len / 2.0));
  let eX = aX - (len / 2.0);
  let eY = bY;

  let path = new drawing.Path();
  path.moveTo(aX, aY);
  path.lineTo(bX, bY);
  path.lineTo(cX, cY);
  path.lineTo(dX, dY);
  path.lineTo(eX, eY);
  path.close();

  let pen = new drawing.Pen();
  pen.setAntiAlias(true);
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  pen.setStrokeWidth(10.0);
  canvas.attachPen(pen);
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0x00, 0xFF, 0x00);
  canvas.attachBrush(brush);
  canvas.drawPath(path);
  canvas.detachBrush();
  canvas.detachPen();
}

function drawRegion(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  canvas.attachBrush(brush);
  let region1 = new drawing.Region();
  region1.setRect(VALUE_100, VALUE_100, VALUE_600, VALUE_600);
  let region2 = new drawing.Region();
  region2.setRect(VALUE_300, VALUE_300, VALUE_900, VALUE_900);
  region1.op(region2, drawing.RegionOp.XOR);
  canvas.drawRegion(region1);
  canvas.detachBrush();
}

function drawRect(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  canvas.attachBrush(brush);
  canvas.drawRect(VALUE_200, VALUE_200, VALUE_1000, VALUE_700);
  canvas.detachBrush();
}

function drawRoundRect(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  canvas.attachBrush(brush);
  let rect: common2D.Rect = { left: VALUE_200, top: VALUE_200, right: VALUE_1000, bottom: VALUE_700 };
  let rrect = new drawing.RoundRect(rect, 30, 30);
  canvas.drawRoundRect(rrect);
  canvas.detachBrush();
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
  private myRenderNode: MyRenderNode = new MyRenderNode();
  private rootNode: FrameNode | null = null;

  constructor() {
    super();
    this.myRenderNode.addDrawFunction(drawPoint);
    this.myRenderNode.addDrawFunction(drawArc);
    this.myRenderNode.addDrawFunction(drawCircle);
    this.myRenderNode.addDrawFunction(drawPath);
    this.myRenderNode.addDrawFunction(drawRegion);
    this.myRenderNode.addDrawFunction(drawRect);
    this.myRenderNode.addDrawFunction(drawRoundRect);
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
struct ShapeDrawing {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('Point')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('Arc')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
          Button('Circle')
            .onClick(() => { this.nodeController.setDrawIndex(2) })
          Button('Path')
            .onClick(() => { this.nodeController.setDrawIndex(3) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('Region')
            .onClick(() => { this.nodeController.setDrawIndex(4) })
          Button('Rect')
            .onClick(() => { this.nodeController.setDrawIndex(5) })
          Button('RoundRect')
            .onClick(() => { this.nodeController.setDrawIndex(6) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}