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

// [Start arkts_graphics_draw_import_ui_and_graphics2d]
// [Start arkts_graphics_draw_import_ui]
import { UIContext, NodeController, FrameNode, RenderNode, DrawContext, Entry, Component, State, Row, Column, Text, NodeContainer, FlexAlign } from '@kit.ArkUI';
// [End arkts_graphics_draw_import_ui]
import { image } from '@kit.ImageKit';
// [Start arkts_graphics_draw_import_graphics2d]
import { drawing } from '@kit.ArkGraphics2D';
// [End arkts_graphics_draw_import_graphics2d]
// [End arkts_graphics_draw_import_ui_and_graphics2d]

// [Start arkts_graphics_draw_direct_canvas_api]
// 自定义 RenderNode
class MyRenderNodeDirectDisplay extends RenderNode {
  // [Start arkts_graphics_draw_direct_canvas_api_rewrite]
  // 重写draw方法
  draw(context: DrawContext): void {
    // 获取Canvas对象
    const canvas = context.canvas;
    // 创建画刷对象
    const brush = new drawing.Brush();
    // 设置画刷颜色为红色
    brush.setColor({ red: 255, blue: 0, green: 0, alpha: 255 });
    // 将画刷效果设置到Canvas中
    canvas.attachBrush(brush);
    // 绘制矩形
    canvas.drawRect({ left: 0, right: 300, top: 0, bottom: 300 });
    // 去除画刷效果
    canvas.detachBrush();
  }
  // [End arkts_graphics_draw_direct_canvas_api_rewrite]
}
// [End arkts_graphics_draw_direct_canvas_api]

// [Start arkts_graphics_draw_direct_canvas_api_node_control]
// 自定义 NodeController
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
// [End arkts_graphics_draw_direct_canvas_api_node_control]

// [Start arkts_graphics_draw_indirect_canvas_api]
// 自定义RenderNode
export class MyRenderNodeIndirectDisplay extends RenderNode {
  private pixelMap: image.PixelMap | null = null;

  setPixelMap(pixelMap: image.PixelMap): void {
    this.pixelMap = pixelMap;
  }

  draw(context: DrawContext): void {
    const canvas = context.canvas;
    if (this.pixelMap != null) {
      // 利用创建的PixelMap构造离屏Canvas
      let pm = this.pixelMap;
      const offscreenCanvas = new drawing.Canvas(pm as image.PixelMap);
      // 离屏绘制
      const brush = new drawing.Brush();
      // 设置画刷颜色为蓝色
      brush.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
      offscreenCanvas.attachBrush(brush);
      offscreenCanvas.drawRect({ left: 150, right: 575, top: 0, bottom: 600 });
      offscreenCanvas.detachBrush();
      // 将离屏Canvas的绘制结果交给RenderNode
      canvas.drawImage(pm as image.PixelMap, 0, 0);
    }
  }
}

async function createPixelMapAsync(): Promise<image.PixelMap> {
  // 4000000为需要创建的像素buffer大小，取值为：height * width *4
  const color: ArrayBuffer = new ArrayBuffer(4000000);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
  const pixel = await image.createPixelMap(color, opts);
  return pixel;
}

// 自定义NodeController
export class MyNodeControllerIndirectDisplay extends NodeController {
  private rootNode: FrameNode | null = null;
  private myRenderNode: MyRenderNodeIndirectDisplay = new MyRenderNodeIndirectDisplay();

  // 在MyNodeController的aboutToAppear中创建PixeMap
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
// [End arkts_graphics_draw_indirect_canvas_api]

// [Start arkts_graphics_draw_direct_and_indirect_canvas]
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
          Text('获取直接画布绘图结果')
          // 直接上屏显示画布
          NodeContainer(this.myNodeController_1)
            .width('100%')
            .height('40%')
        }
        Column() {
          Text('获取离屏画布绘图结果')
          // 离屏画布
          NodeContainer(this.myNodeController_2)
            .width('100%')
            .height('40%')
            .margin({ top: 20 })
        }
      }
    }
  }
}
// [End arkts_graphics_draw_direct_and_indirect_canvas]