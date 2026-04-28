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
import { VALUE_200, VALUE_300, VALUE_600 } from '../../pages/Index';

function drawClipOperation(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0x00, 0x00, 0xFF);
  canvas.attachBrush(brush);
  let rect: common2D.Rect = { left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 };
  canvas.clipRect(rect);
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_300);
  canvas.detachBrush();
}

function drawTranslationOperation(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  canvas.attachBrush(brush);
  canvas.translate(VALUE_300, VALUE_300);
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  canvas.detachBrush();
}

function drawRotationOperation(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  canvas.attachBrush(brush);
  canvas.rotate(45, VALUE_200, VALUE_200);
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  canvas.detachBrush();
}

function drawScaleOperation(canvas: drawing.Canvas): void {
  let brush = new drawing.Brush();
  brush.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  canvas.attachBrush(brush);
  canvas.scale(2, 2);
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  canvas.detachBrush();
}

function drawStateOperation(canvas: drawing.Canvas): void {
  let pen = new drawing.Pen();
  pen.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  pen.setStrokeWidth(20);
  canvas.attachPen(pen);
  canvas.save();
  canvas.scale(2, 2);
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_200);
  canvas.restore();
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_200);
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
    this.myRenderNode.addDrawFunction(drawClipOperation);
    this.myRenderNode.addDrawFunction(drawTranslationOperation);
    this.myRenderNode.addDrawFunction(drawRotationOperation);
    this.myRenderNode.addDrawFunction(drawScaleOperation);
    this.myRenderNode.addDrawFunction(drawStateOperation);
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
struct CanvasOperationState {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('Clip')
            .onClick(() => {
              this.nodeController.setDrawIndex(0)
            })
          Button('Translation')
            .onClick(() => {
              this.nodeController.setDrawIndex(1)
            })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('Rotation')
            .onClick(() => {
              this.nodeController.setDrawIndex(2)
            })
          Button('Scale')
            .onClick(() => {
              this.nodeController.setDrawIndex(3)
            })
          Button('State')
            .onClick(() => {
              this.nodeController.setDrawIndex(4)
            })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}