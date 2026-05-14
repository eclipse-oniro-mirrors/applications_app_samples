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
import { DrawContext, FrameNode, NodeController, RenderNode, UIContext, Entry, Component, Row, Column, Button, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { common2D, drawing } from '@kit.ArkGraphics2D';
// [End arkts_graphics_draw_import_ui_and_graphics2d]
import { VALUE_100, VALUE_200, VALUE_300, VALUE_500, VALUE_600, VALUE_700, VALUE_900, VALUE_1000 } from '../../pages/Index';

function drawMixedMode(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_mixed_mode]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置目标像素颜色，即矩形的颜色
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 将目标像素的画刷效果设置到Canvas中
  canvas.attachBrush(brush);
  // 创建矩形对象
  let rect: common2D.Rect = { left: VALUE_100, top: VALUE_100, right: VALUE_600, bottom: VALUE_600 };
  // 绘制矩形（目标像素）
  canvas.drawRect(rect);
  // 设置源像素颜色，即圆形的颜色
  brush.setColor(0xFF, 0x00, 0x00, 0xFF);
  // 设置混合模式为叠加模式
  brush.setBlendMode(drawing.BlendMode.PLUS);
  // 将源像素的画刷效果设置到Canvas中
  canvas.attachBrush(brush);
  // 绘制圆（源像素）
  canvas.drawCircle(VALUE_600, VALUE_600, VALUE_300);
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_mixed_mode]
}

// [Start arkts_graphics_draw_render_node]
function drawRenderNode(canvas: drawing.Canvas): void {
  canvas.saveLayer(null, null);
  const brushCircle = new drawing.Brush();
  brushCircle.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
  canvas.attachBrush(brushCircle);
  canvas.drawCircle(500, 500, 200);
  const brush = new drawing.Brush();
  // 设置混合模式
  brush.setBlendMode(drawing.BlendMode.SRC_IN);
  canvas.saveLayer(null, brush);
  const brushRect = new drawing.Brush();
  brushRect.setColor({ alpha: 255, red: 255, green: 255, blue: 0 });
  canvas.attachBrush(brushRect);
  const rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 500 };
  canvas.drawRect(rect);
  canvas.restore();
  canvas.restore();
  canvas.detachBrush();
}
// [End arkts_graphics_draw_render_node]

function drawPathEffect(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_path_effect]
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置线宽
  pen.setStrokeWidth(10.0);
  // 设置颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 表示10px的实线，5px的间隔，2px的实线，5px的间隔，以此循环
  let intervals: number[] = [10.0, 5.0, 2.0, 5.0];
  // 设置虚线路径效果
  let effect = drawing.PathEffect.createDashPathEffect(intervals, 0);
  if (effect) {
    pen.setPathEffect(effect);
  }
  // 设置画笔描边效果
  canvas.attachPen(pen);
  // 创建矩形
  let rect: common2D.Rect = { left: VALUE_200, top: VALUE_200, right: VALUE_1000, bottom: VALUE_700 };
  // 绘制矩形
  canvas.drawRect(rect);
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_path_effect]
}

function drawLinearGradient(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_linear_gradient]
  // 设置渐变起点和终点
  console.log("wll-0000")
  let startPt: common2D.Point = { x: VALUE_100, y: VALUE_100 };
  let endPt: common2D.Point = { x: VALUE_900, y: VALUE_900 };
  let colors = [(0xFFFFFF00).toInt(), (0xFFFF0000).toInt(), (0xFF0000FF).toInt()];
  // 创建线性渐变着色器
  let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
  if (shaderEffect != null) {
    // 创建画刷
    console.log("wll-11111")
    let brush = new drawing.Brush();
    // 设置线性着色器
    brush.setShaderEffect(shaderEffect);
    // 设置画刷填充效果
    canvas.attachBrush(brush);
    let rect: common2D.Rect = { left: VALUE_100, top: VALUE_100, right: VALUE_900, bottom: VALUE_900 };
    // 绘制矩形
    canvas.drawRect(rect);
    // 去除填充效果
    canvas.detachBrush();
  }
  console.log("wll-2222")
  // [End arkts_graphics_draw_linear_gradient]
}

function drawPathGradient(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_path_gradient]
  // 设置径向渐变中心点
  let centerPt: common2D.Point = { x: VALUE_500, y: VALUE_500 };
  let colors = [(0xFFFFFF00).toInt(), (0xFFFF0000).toInt(), (0xFF0000FF).toInt()];
  // 创建径向渐变着色器
  let shaderEffect = drawing.ShaderEffect.createRadialGradient(centerPt, VALUE_600, colors, drawing.TileMode.CLAMP);
  if (shaderEffect != null) {
    // 创建画刷
    let brush = new drawing.Brush();
    // 设置径向渐变着色器
    brush.setShaderEffect(shaderEffect);
    // 设置画刷填充效果
    canvas.attachBrush(brush);
    let rect: common2D.Rect = { left: VALUE_100, top: VALUE_100, right: VALUE_900, bottom: VALUE_900 };
    // 绘制矩形
    canvas.drawRect(rect);
    // 去除填充效果
    canvas.detachBrush();
  }
  // [End arkts_graphics_draw_path_gradient]
}

function drawSectorGradient(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_sector_gradient]
  // 设置扇形渐变中心点
  let centerPt: common2D.Point = { x: VALUE_500, y: VALUE_500 };
  let colors = [(0xFFFFFF00).toInt(), (0xFFFF0000).toInt(), (0xFF0000FF).toInt()];
  // 创建扇形渐变着色器
  let shaderEffect = drawing.ShaderEffect.createSweepGradient(centerPt, colors, drawing.TileMode.CLAMP, 0, 360);
  if (shaderEffect != null) {
    // 创建画刷
    let brush = new drawing.Brush();
    // 设置扇形渐变着色器
    brush.setShaderEffect(shaderEffect);
    // 设置画刷填充效果
    canvas.attachBrush(brush);
    let rect: common2D.Rect = { left: VALUE_100, top: VALUE_100, right: VALUE_900, bottom: VALUE_900 };
    // 绘制矩形
    canvas.drawRect(rect);
    // 去除填充效果
    canvas.detachBrush();
  }
  // [End arkts_graphics_draw_sector_gradient]
}

function drawColorFilter(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_color_filter]
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置颜色
  brush.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 设置颜色矩阵
  let matrix: number[] = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5, 0.5, 0, 0, 0, 0.5, 0.5, 0];
  // 创建5x4颜色矩阵的颜色滤波器
  let filter = drawing.ColorFilter.createMatrixColorFilter(matrix);
  if (filter) {
    // 设置颜色滤波器
    brush.setColorFilter(filter);
  }
  // 设置画刷填充效果
  canvas.attachBrush(brush);
  let rect: common2D.Rect = { left: VALUE_300, top: VALUE_300, right: VALUE_900, bottom: VALUE_900 };
  // 绘制矩形
  canvas.drawRect(rect);
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_color_filter]
}

function drawImageFilter(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_image_filter]
  // 设置画笔
  let pen = new drawing.Pen();
  // 设置线宽
  pen.setStrokeWidth(10.0);
  // 设置颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 创建模糊效果图像滤波器
  let filter = drawing.ImageFilter.createBlurImageFilter(20, 20, drawing.TileMode.CLAMP);
  if (filter) {
    // 设置图像滤波器
    pen.setImageFilter(filter);
  }
  // 设置画笔描边效果
  canvas.attachPen(pen);
  let rect: common2D.Rect = { left: VALUE_300, top: VALUE_300, right: VALUE_900, bottom: VALUE_900 };
  // 绘制矩形
  canvas.drawRect(rect);
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_image_filter]
}

function drawMaskFilter(canvas: drawing.Canvas): void {
  // [Start arkts_graphics_draw_mask_filter]
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置线宽
  pen.setStrokeWidth(10.0);
  // 设置颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 创建模糊效果的蒙版滤波器
  let filter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 20);
  if (filter) {
    // 设置模糊效果
    pen.setMaskFilter(filter);
  }
  // 设置画笔描边效果
  canvas.attachPen(pen);
  let rect: common2D.Rect = { left: VALUE_300, top: VALUE_300, right: VALUE_900, bottom: VALUE_900 };
  // 绘制矩形
  canvas.drawRect(rect);
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_mask_filter]
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
    this.myRenderNode.addDrawFunction(drawRenderNode);
    this.myRenderNode.addDrawFunction(drawPathEffect);
    this.myRenderNode.addDrawFunction(drawLinearGradient);
    this.myRenderNode.addDrawFunction(drawPathGradient);
    this.myRenderNode.addDrawFunction(drawSectorGradient);
    this.myRenderNode.addDrawFunction(drawColorFilter);
    this.myRenderNode.addDrawFunction(drawImageFilter);
    this.myRenderNode.addDrawFunction(drawMaskFilter);
    this.myRenderNode.addDrawFunction(drawMixedMode);
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
    this.myRenderNode.backgroundColor = -1;
  }
}

@Entry
@Component
struct ComplexEffect {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%')
        Row() {
          Button('混合模式')
            .onClick(() => { this.nodeController.setDrawIndex(0) })
          Button('路径效果')
            .onClick(() => { this.nodeController.setDrawIndex(1) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('线性渐变')
            .onClick(() => { this.nodeController.setDrawIndex(2) })
          Button('径向渐变')
            .onClick(() => { this.nodeController.setDrawIndex(3) })
          Button('扇形渐变')
            .onClick(() => { this.nodeController.setDrawIndex(4) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
        Row() {
          Button('颜色滤波器')
            .onClick(() => { this.nodeController.setDrawIndex(5) })
          Button('图像滤波器')
            .onClick(() => { this.nodeController.setDrawIndex(6) })
          Button('蒙版滤波器')
            .onClick(() => { this.nodeController.setDrawIndex(7) })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}