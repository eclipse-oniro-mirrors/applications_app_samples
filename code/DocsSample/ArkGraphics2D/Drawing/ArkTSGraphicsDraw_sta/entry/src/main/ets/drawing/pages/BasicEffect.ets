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

import { UIContext, NodeController, FrameNode, RenderNode, DrawContext, Entry, Component, State, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { drawing } from '@kit.ArkGraphics2D';
import { VALUE_100, VALUE_400, VALUE_800 } from '../../pages/Index';

function drawFilling(canvas: drawing.Canvas): void {
  const brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  brush.setAntiAlias(true);
  canvas.attachBrush(brush);
  canvas.drawCircle(VALUE_400, VALUE_400, VALUE_400);
  canvas.detachBrush();
}

function drawStroke(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  pen.setStrokeWidth(15);
  pen.setAntiAlias(true);
  pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
  pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
  canvas.attachPen(pen);
  let aX = VALUE_100;
  let aY = VALUE_100;
  let bX = VALUE_100;
  let bY = VALUE_800;
  let cX = VALUE_800;
  let cY = VALUE_800;
  let dX = VALUE_800;
  let dY = VALUE_100;
  let path = new drawing.Path();
  path.moveTo(aX, aY);
  path.lineTo(bX, bY);
  path.lineTo(cX, cY);
  path.lineTo(dX, dY);
  canvas.drawPath(path);
  canvas.detachPen();
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
    this.myRenderNode.addDrawFunction(drawFilling);
    this.myRenderNode.addDrawFunction(drawStroke);
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
struct BaseEffect {
  private nodeController: MyNodeController = new MyNodeController();
  @State flag: boolean = false;

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('填充效果')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('描边效果')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}