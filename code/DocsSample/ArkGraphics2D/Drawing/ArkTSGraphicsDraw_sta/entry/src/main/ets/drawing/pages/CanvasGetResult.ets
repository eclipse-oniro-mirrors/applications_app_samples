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

import { UIContext, NodeController, FrameNode, RenderNode, DrawContext, Entry, Component, State, Row, Column, Text, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { drawing } from '@kit.ArkGraphics2D';

class MyRenderNodeDirectDisplay extends RenderNode {
  draw(context: DrawContext): void {
    const canvas = context.canvas;
    const brush = new drawing.Brush();
    brush.setColor({ red: 255, blue: 0, green: 0, alpha: 255 });
    canvas.attachBrush(brush);
    canvas.drawRect({ left: 0, right: 300, top: 0, bottom: 300 });
    canvas.detachBrush();
  }
}

export class MyNodeControllerDirectDisplay extends NodeController {
  private rootNode: FrameNode | null = null;
  private myRenderNode: MyRenderNodeDirectDisplay = new MyRenderNodeDirectDisplay();

  makeNode(uiContext: UIContext): FrameNode {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode!.getRenderNode()?.appendChild(this.myRenderNode);
    this.myRenderNode.backgroundColor = -1;
    this.myRenderNode.frame = { x: 0, y: 0, width: 4800, height: 4800 };
    this.myRenderNode.pivot = { x: 0.2, y: 0.8 };
    this.myRenderNode.scale = { x: 1, y: 1 };
    return this.rootNode!;
  }
}

export class MyRenderNodeIndirectDisplay extends RenderNode {
  private pixelMap: image.PixelMap | null = null;

  setPixelMap(pixelMap: image.PixelMap): void {
    this.pixelMap = pixelMap;
  }

  draw(context: DrawContext): void {
    const canvas = context.canvas;
    if (this.pixelMap != null) {
      let pm = this.pixelMap;
      const offscreenCanvas = new drawing.Canvas(pm as image.PixelMap);
      const brush = new drawing.Brush();
      brush.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
      offscreenCanvas.attachBrush(brush);
      offscreenCanvas.drawRect({ left: 150, right: 575, top: 0, bottom: 600 });
      offscreenCanvas.detachBrush();
      canvas.drawImage(pm as image.PixelMap, 0, 0);
    }
  }
}

async function createPixelMapAsync(): Promise<image.PixelMap> {
  const color: ArrayBuffer = new ArrayBuffer(4000000);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
  const pixel = await image.createPixelMap(color, opts);
  return pixel;
}

export class MyNodeControllerIndirectDisplay extends NodeController {
  private rootNode: FrameNode | null = null;
  private myRenderNode: MyRenderNodeIndirectDisplay = new MyRenderNodeIndirectDisplay();

  aboutToAppear(): void {
    createPixelMapAsync().then((pixel: image.PixelMap) => {
      this.myRenderNode.setPixelMap(pixel);
      this.myRenderNode.invalidate();
    });
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
}

@Entry
@Component
struct RenderTest {
  @State message: string = 'hello';
  myNodeController_1: MyNodeControllerDirectDisplay = new MyNodeControllerDirectDisplay();
  myNodeController_2: MyNodeControllerIndirectDisplay = new MyNodeControllerIndirectDisplay();

  build() {
    Row() {
      Column() {
        Column() {
          Text('Direct Canvas')
          NodeContainer(this.myNodeController_1)
            .width('100%')
            .height('40%')
        }
        Column() {
          Text('OffScreen Canvas')
          NodeContainer(this.myNodeController_2)
            .width('100%')
            .height('40%')
            .margin({ top: 20 })
        }
      }
    }
  }
}