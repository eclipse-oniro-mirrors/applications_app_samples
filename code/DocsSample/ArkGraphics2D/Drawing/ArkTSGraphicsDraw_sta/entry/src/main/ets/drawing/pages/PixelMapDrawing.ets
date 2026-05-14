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

import { DrawContext, FrameNode, NodeController, RenderNode, UIContext, Entry, Component, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { drawing } from '@kit.ArkGraphics2D';
import { image } from '@kit.ImageKit';
import { VALUE_100, VALUE_200 } from '../../pages/Index';

let pixelMap: image.PixelMap | null = null;

function drawImage(canvas: drawing.Canvas): void {
  let width = 600;
  let height = 400;
  let byteLength = width * height * 4;
  const color: ArrayBuffer = new ArrayBuffer(byteLength);
  let bufferArr = new Uint8Array(color);
  for (let i = 0; i < bufferArr.length; i += 4) {
    bufferArr[i] = 0x00;
    bufferArr[i + 1] = 0x00;
    bufferArr[i + 2] = 0x00;
    bufferArr[i + 3] = 0xFF;
    let n = Math.floor(i / 80) % 3;
    if (n == 0) {
      bufferArr[i] = 0xFF;
    } else if (n == 1) {
      bufferArr[i + 1] = 0xFF;
    } else {
      bufferArr[i + 2] = 0xFF;
    }
  }
  let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: height, width: width } };
  let pm = image.createPixelMapSync(color, opts);
  if (pm != null) {
    canvas.drawImage(pm, 0, 0);
  }
}

function editPixel(canvas: drawing.Canvas): void {
  if (pixelMap == null) {
    return;
  }
  let pm = pixelMap;
  let innerWidth = 400;
  let innerHeight = 200;
  let innerByteLength = innerWidth * innerHeight * 4;
  const innerColor: ArrayBuffer = new ArrayBuffer(innerByteLength);
  let innerBufferArr = new Uint8Array(innerColor);
  for (let i = 0; i < innerBufferArr.length; i += 4) {
    let n = Math.floor(i / 80) % 2;
    if (n == 0) {
      innerBufferArr[i] = 0x00;
      innerBufferArr[i + 1] = 0x00;
      innerBufferArr[i + 2] = 0x00;
    } else {
      innerBufferArr[i] = 0xFF;
      innerBufferArr[i + 1] = 0xFF;
      innerBufferArr[i + 2] = 0xFF;
    }
    innerBufferArr[i + 3] = 0xFF;
  }
  const area: image.PositionArea = {
    pixels: innerColor,
    offset: 0,
    stride: innerWidth * 4,
    region: { size: { height: innerHeight, width: innerWidth }, x: 100, y: 100 }
  };
  pm!.writePixelsSync(area);
  canvas.drawImage(pm as image.PixelMap, 0, 0);
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
    this.myRenderNode.addDrawFunction(drawImage);
    this.myRenderNode.addDrawFunction(editPixel);
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
struct ImageDrawing {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('绘制图片')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('编辑中间像素')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}