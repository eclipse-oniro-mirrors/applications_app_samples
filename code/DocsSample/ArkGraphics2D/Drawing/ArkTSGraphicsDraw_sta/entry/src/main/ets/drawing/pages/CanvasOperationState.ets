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
import { VALUE_200, VALUE_300, VALUE_600 } from '../../pages/Index';

function drawClipOperation(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_canvas_clip]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置颜色为蓝色
  brush.setColor(0xFF, 0x00, 0x00, 0xFF);
  // 设置画刷填充效果
  canvas.attachBrush(brush);
  // 创建矩形对象
  let rect: common2D.Rect = { left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 };
  // 裁剪矩形区域
  canvas.clipRect(rect);
  // 绘制圆形
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_300);
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_canvas_clip]
}

function drawTranslationOperation(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_canvas_translation]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置颜色为红色
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 设置画刷填充效果
  canvas.attachBrush(brush);
  // 执行平移操作
  canvas.translate(VALUE_300, VALUE_300);
  // 绘制矩形
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_canvas_translation]
}

function drawRotationOperation(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_canvas_rotation]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置颜色为红色
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 设置画刷填充效果
  canvas.attachBrush(brush);
  // 顺时针旋转45度
  canvas.rotate(45, VALUE_200, VALUE_200);
  // 绘制矩形
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_canvas_rotation]
}

function drawScaleOperation(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_canvas_scale]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置颜色为红色
  brush.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  // 设置画刷填充效果
  canvas.attachBrush(brush);
  // 执行放大操作
  canvas.scale(2, 2);
  // 绘制矩形
  canvas.drawRect({ left: VALUE_200, top: VALUE_200, right: VALUE_600, bottom: VALUE_600 });
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_canvas_scale]
}

function drawStateOperation(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_canvas_state_operation]
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置颜色为红色
  pen.setColor({ alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 });
  // 设置描边宽度为20px
  pen.setStrokeWidth(20);
  // 设置画笔描边效果
  canvas.attachPen(pen);
  // 保存操作，当前是不存在放大等操作的，这个原始状态会被保存下来
  canvas.save();
  // x轴和y轴方向分别放大2倍
  canvas.scale(2, 2);
  // 绘制圆形，因为执行过放大操作，所以此时绘制的是大圆
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_200);
  // 恢复操作，恢复到没有放大的原始状态
  canvas.restore();
  // 绘制圆形，因为已经恢复到没有放大的原始状态，所以此时绘制的是小圆
  canvas.drawCircle(VALUE_300, VALUE_300, VALUE_200);
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_canvas_state_operation]
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
          Button('裁剪操作')
            .onClick(() => {
              this.nodeController.setDrawIndex(0)
            })
          Button('平移操作')
            .onClick(() => {
              this.nodeController.setDrawIndex(1)
            })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('旋转操作')
            .onClick(() => {
              this.nodeController.setDrawIndex(2)
            })
          Button('缩放操作')
            .onClick(() => {
              this.nodeController.setDrawIndex(3)
            })
          Button('画布状态操作')
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