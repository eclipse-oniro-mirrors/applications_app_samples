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

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：func、MyNodeController、RenderTest。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { NodeController, FrameNode, RenderNode } from "@ohos.arkui.node";
import { UIContext } from '@ohos.arkui.UIContext';
import drawing from "@ohos.graphics.drawing";
import display from '@ohos.display';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {CanvasRenderNodeCropping, CanvasRenderNodeMatrix, CanvasRenderNodeCombination} from "../common/CanvasRenderNode";
import {ShapeRenderNodeCanvasPen, ShapeRenderNodeCanvasBrush} from "../common/ShapeRenderNode";
import {PathRenderNode} from "../common/PathRenderNode";
import { MyRenderNodePathBrush, MyRenderNodePathShader, MyRenderNodePathPen } from '../common/MyRenderNodePath';
import {ImageRenderNode, ImageRectRenderNode} from '../common/ImageRenderNode';
import {TextBlobRenderNode} from '../common/TextBlobRenderNode';
import {ComplexRenderNode} from '../common/ComplexRenderNode';

// const 语句
const TAG = 'tsdrawingsample';
// let 语句
let screen = display.getDefaultDisplaySync();
// let 语句
let screenWidth: number = screen.width;
// let 语句
let screenHeight: number = screen.height;

// let 语句
let canvas_: drawing.Canvas;
// let 语句
let pixelMap_: image.PixelMap | undefined;

/**
 * func：函数定义，承载本文件对应的逻辑与数据。
 */
function func(node: RenderNode) {
  node.frame = {
    // 字段 x：声明并维护该成员的状态
    x: 0,
    // 字段 y：声明并维护该成员的状态
    y: 0,
    // 字段 width：声明并维护该成员的状态
    width: screenWidth,
    // 字段 height：声明并维护该成员的状态
    height: screenHeight
  }
}

// const 语句
const canvasCroppingNode = new CanvasRenderNodeCropping();
func(canvasCroppingNode);

// const 语句
const canvasMatrixNode = new CanvasRenderNodeMatrix();
func(canvasMatrixNode);

// const 语句
const canvasCombinationNode = new CanvasRenderNodeCombination();
func(canvasCombinationNode);

// const 语句
const shapePenNode = new ShapeRenderNodeCanvasPen();
func(shapePenNode);

// const 语句
const shapeBrushNode = new ShapeRenderNodeCanvasBrush();
func(shapeBrushNode);

// const 语句
const pathNode = new PathRenderNode();
func(pathNode);

// const 语句
const pathBrushNode = new MyRenderNodePathBrush();
func(pathBrushNode);

// const 语句
const pathPenNode = new MyRenderNodePathPen();
func(pathPenNode);

// const 语句
const pathShaderNode = new MyRenderNodePathShader();
func(pathShaderNode);

// const 语句
const imagePixmapNode = new ImageRenderNode();
func(imagePixmapNode);

// const 语句
const imageRectNode = new ImageRectRenderNode();
func(imageRectNode);

// const 语句
const textblobNode = new TextBlobRenderNode();
func(textblobNode);

// const 语句
const complexNode = new ComplexRenderNode();
func(complexNode);

/**
 * MyNodeController：类定义，承载本文件对应的逻辑与数据。
 */
class MyNodeController extends NodeController {
  // 字段 rootNode：声明并维护该成员的状态
  private rootNode: FrameNode | null = null;

  /**
   * makeNode：执行 makeNode 相关逻辑。
   */
  makeNode(uiContext: UIContext): FrameNode {
    // 更新 rootNode
    this.rootNode = new FrameNode(uiContext);
    // if 语句
    if (this.rootNode === null) {
      // return 语句
      return this.rootNode;
    }
    // const 语句
    const renderNode = this.rootNode.getRenderNode();
    // if 语句
    if (renderNode !== null) {
      renderNode.frame = {
        // 字段 x：声明并维护该成员的状态
        x: 0,
        // 字段 y：声明并维护该成员的状态
        y: 0,
        // 字段 width：声明并维护该成员的状态
        width: 10,
        // 字段 height：声明并维护该成员的状态
        height: 500
      };
      renderNode.pivot = { x: 50, y: 50 };
    }
    // return 语句
    return this.rootNode;
  }

  /**
   * addNode：执行 addNode 相关逻辑。
   */
  addNode(node: RenderNode): void {
    if (this.rootNode === null) {
      return;
    }
    const renderNode = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      renderNode.appendChild(node);
    }
  }

  /**
   * clearNodes：执行 clearNodes 相关逻辑。
   */
  clearNodes(): void {
    if (this.rootNode === null) {
      return;
    }
    const renderNode = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      renderNode.clearChildren();
    }
  }
}

/**
 * RenderTest：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RenderTest {
  private myNodeController: MyNodeController = new MyNodeController();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    const imageContext: Context = getContext(this);
    const resourceMgr: resourceManager.ResourceManager = imageContext.resourceManager;
    resourceMgr.getRawFileContent('startIcon.png').then((fileData: Uint8Array) => {
      hilog.info(0x0001, TAG, 'Succeeded in getting RawFileContent');
      const buffer = fileData.buffer.slice(0);
      const imageSource: image.ImageSource = image.createImageSource(buffer);
      imageSource.createPixelMap().then((pMap: image.PixelMap) => {
        imagePixmapNode.setPixelMap(pMap);
        imageRectNode.setPixelMap(pMap);
      }).catch((err: BusinessError) => {
        hilog.error(0x0001, TAG, 'Failed to creating PixelMap');
      });
    }).catch((err: BusinessError) => {
      hilog.error(0x0001, TAG, 'Failed to get RawFileContent');
    });
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度
      Row() {
        // NodeContainer：NodeContainer 自定义组件
        // 关键属性：高度
        NodeContainer(this.myNodeController)
          .id('drawingNodeContainer')
          .height('100%')
      }.id('index_row_2')
      .width('100%')
      .height('80%')
      // GridRow：栅格行
      // 关键属性：宽度、阴影、布局权重
      GridRow({
        columns: 1,
        gutter: {x: 5, y: 10},
      }) {
        // GridCol：栅格列
        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 }, offset: 0, order: 0 }){
          // Row：水平布局容器
          Row() {
            // Button：按钮
            // 关键属性：外边距、点击事件回调、clearNodes
            // 交互：可点击交互
            Button("Canvas")
              .id('canvasBtn')
              .margin({ top: 10, right: 10 })
              .onClick(() => {
                this.myNodeController.clearNodes();
                this.myNodeController.addNode(canvasCroppingNode);
                this.myNodeController.addNode(canvasMatrixNode);
                this.myNodeController.addNode(canvasCombinationNode);
              })
            // Button：按钮
            // 关键属性：外边距、点击事件回调、clearNodes
            // 交互：可点击交互
            Button("Geometric shape")
              .id('shapeBtn')
              .margin({ top: 10, right: 10 })
              .onClick(() => {
                this.myNodeController.clearNodes();
                this.myNodeController.addNode(shapePenNode);
                this.myNodeController.addNode(shapeBrushNode);
              })
            // Button：按钮
            // 关键属性：外边距、点击事件回调、clearNodes
            // 交互：可点击交互
            Button("Path")
              .id('pathBtn')
              .margin({ top: 10, right: 10 })
              .onClick(() => {
                this.myNodeController.clearNodes();
                this.myNodeController.addNode(pathNode);
                this.myNodeController.addNode(pathBrushNode);
                this.myNodeController.addNode(pathPenNode);
                this.myNodeController.addNode(pathShaderNode);
              })
        }.id('index_row_5')
      }.id('index_grid_col_4')
        // GridCol：栅格列
        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 }, offset: 0, order: 0 }){
          // Row：水平布局容器
          Row(){
            // Button：按钮
            // 关键属性：外边距、点击事件回调、clearNodes
            // 交互：可点击交互
            Button("Image and Font")
              .id('imageFontBtn')
              .margin({ right: 8 })
              .onClick(() => {
                this.myNodeController.clearNodes();
                this.myNodeController.addNode(imageRectNode);
                this.myNodeController.addNode(imagePixmapNode);
                this.myNodeController.addNode(textblobNode);
              })
            // Button：按钮
            // 关键属性：外边距、点击事件回调、clearNodes
            // 交互：可点击交互
            Button("Complex")
              .id('complexBtn')
              .margin({ right: 8 })
              .onClick(() => {
                this.myNodeController.clearNodes();
                this.myNodeController.addNode(complexNode);
              })
          }.id('index_row_7')
        }.id('index_grid_col_6')
      }.id('index_grid_row_3')
      .width('100%')
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .layoutWeight(1)
    }.id('index_column_1')
  }

  /**
   * CreateBitmapCanvas：执行 CreateBitmapCanvas 相关逻辑。
   */
  public async CreateBitmapCanvas() {
    const color: ArrayBuffer = new ArrayBuffer(screenWidth * screenHeight * 4);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: 3, size: { height: screenHeight, width: screenWidth } };
    pixelMap_ = await image.createPixelMap(color, opts);
    if (pixelMap_ === null || pixelMap_ === undefined) {
      hilog.info(0x0001, TAG, 'create pixelMap error');
      return;
    }

    // 创建离屏canvas，与pixelMap绑定
    canvas_ = new drawing.Canvas(pixelMap_);
    if (canvas_ === null || canvas_ === undefined) {
      hilog.info(0x0001, TAG, 'create canvas_ error');
      return;
    }
    hilog.info(0x0001, TAG, 'create canvas_ success');
  }
}
