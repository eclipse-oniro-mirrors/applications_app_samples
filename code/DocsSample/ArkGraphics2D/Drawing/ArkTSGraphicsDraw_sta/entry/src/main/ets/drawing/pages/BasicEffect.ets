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
  // [Start arkts_graphics_draw_create_brush]
  // 设置画刷
  const brush = new drawing.Brush();
  // [End arkts_graphics_draw_create_brush]
  // [Start arkts_graphics_draw_brush_set_color]
  // 填充颜色设为红色
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  // [End arkts_graphics_draw_brush_set_color]
  // [Start arkts_graphics_draw_brush_set_antialias]
  // 开启抗锯齿效果
  brush.setAntiAlias(true);
  // [End arkts_graphics_draw_brush_set_antialias]
  // [Start arkts_graphics_draw_canvas_attach_brush]
  // 为画布设置画刷
  canvas.attachBrush(brush);
  // [End arkts_graphics_draw_canvas_attach_brush]
  canvas.drawCircle(VALUE_400, VALUE_400, VALUE_400);
  // [Start arkts_graphics_draw_canvas_detach_brush]
  // 去除画刷
  canvas.detachBrush();
  // [End arkts_graphics_draw_canvas_detach_brush]
}

function drawStroke(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_create_drawing_pen]
  // 创建画笔
  let pen = new drawing.Pen();
  // [End arkts_graphics_draw_create_drawing_pen]
  // [Start arkts_graphics_draw_pen_set_color]
  // 设置颜色为红色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // [End arkts_graphics_draw_pen_set_color]
  // [Start arkts_graphics_draw_pen_set_stroke_width]
  // 设置线宽
  pen.setStrokeWidth(15);
  // [End arkts_graphics_draw_pen_set_stroke_width]
  // [Start arkts_graphics_draw_pen_set_antialias]
  // 设置抗锯齿效果
  pen.setAntiAlias(true);
  // [End arkts_graphics_draw_pen_set_antialias]
  // [Start arkts_graphics_draw_pen_set_cap_style]
  // 设置画笔线帽样式
  pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
  // [End arkts_graphics_draw_pen_set_cap_style]
  // [Start arkts_graphics_draw_pen_set_join_style]
  // 设置画笔转角样式
  pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
  // [End arkts_graphics_draw_pen_set_join_style]
  // [Start arkts_graphics_draw_canvas_attach_pen]
  // 为画布设置画笔
  canvas.attachPen(pen);
  // [End arkts_graphics_draw_canvas_attach_pen]
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
  // [Start arkts_graphics_draw_canvas_detach_pen]
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_canvas_detach_pen]
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