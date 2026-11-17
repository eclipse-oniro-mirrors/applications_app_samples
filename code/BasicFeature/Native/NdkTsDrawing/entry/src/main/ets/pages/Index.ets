/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { NodeController, FrameNode, RenderNode, DrawContext, UIContext, display } from '@kit.ArkUI';
import { drawing, common2D } from '@kit.ArkGraphics2D';
import { image } from '@kit.ImageKit';
import { createOffscreenTarget, OffscreenTarget } from '../drawing/DrawingCanvasFactory';
import {
  paintArcs,
  paintBasicShapes,
  paintCirclesAndOvals,
  paintColorAndBackground,
  paintPointsAndLines,
  paintRects,
  paintRoundRects
} from '../drawing/DrawingCanvasBasic';
import {
  paintWithLayers,
  paintWithMatrix,
  paintWithSaveRestore,
  paintWithTransforms
} from '../drawing/DrawingCanvasState';
import { clipWithPath, clipWithRect, rejectOutsidePath, resetAllClips } from '../drawing/DrawingCanvasClip';
import {
  createArcPath,
  createBezierPath,
  createCombinedPath,
  createConicPath,
  createPolygonPath,
  createPrimitivePath,
  createRelativePath,
  createStarPath
} from '../drawing/DrawingPathShape';
import { paintEffectShowcase } from '../drawing/DrawingEffects';
import { paintGlyphs, paintSingleCharacter, paintTextBlob } from '../drawing/DrawingFontText';
import { paintMatrixShowcase } from '../drawing/DrawingMatrix';
import { paintPenBrushShowcase } from '../drawing/DrawingPenBrush';

const TAG: string = '[Sample_Drawing]';
let screen: display.Display = display.getDefaultDisplaySync();
let screenWidth: number = screen.width;
let screenHeight: number = screen.height;

let canvas_: drawing.Canvas;
let pixelMap_: image.PixelMap | undefined;

/**
 * Render node that draws the five pointed star with drawing.Path.
 */
class MyRenderNode extends RenderNode {
  // 在RenderNode的draw中使用drawing自定义绘制
  async draw(context: DrawContext): Promise<void> {
    const canvas: drawing.Canvas = context.canvas;
    const path: drawing.Path = createStarPath();

    // 创建一个画笔Pen对象，Pen对象用于形状的边框线绘制
    let pen: drawing.Pen = new drawing.Pen();
    pen.setAntiAlias(true);
    let pen_color: common2D.Color = { alpha: 0xFF, red: 0xFF, green: 0x00, blue: 0x00 };
    pen.setColor(pen_color);
    pen.setStrokeWidth(10.0);
    canvas.attachPen(pen);

    // 创建一个画刷Brush对象，Brush对象用于形状的填充
    let brush: drawing.Brush = new drawing.Brush();
    let brush_color: common2D.Color = { alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00 };
    brush.setColor(brush_color);
    canvas.attachBrush(brush);

    // 绘制path
    canvas.drawPath(path);

    // 绘制完成后清空画布上已设置的画笔和画刷
    canvas.detachBrush();
    canvas.detachPen();
  }
}

// 创建一个MyRenderNode对象
const newNode: MyRenderNode = new MyRenderNode();
// 定义newNode的像素格式
newNode.frame = { x: 0, y: 0, width: screenWidth, height: screenHeight };

/**
 * Render node that draws a text blob with drawing.TextBlob.
 */
class TextRenderNode extends RenderNode {
  async draw(context: DrawContext): Promise<void> {
    const canvas: drawing.Canvas = context.canvas;
    let brush: drawing.Brush = new drawing.Brush();
    brush.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
    let font: drawing.Font = new drawing.Font();
    font.setSize(50);
    const textBlob: drawing.TextBlob =
      drawing.TextBlob.makeFromString('Hello World', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, 60, screenHeight / 4);
    canvas.detachBrush();
  }
}

// 创建一个TextRenderNode对象
const textNode: TextRenderNode = new TextRenderNode();
// 定义textNode的像素格式
textNode.frame = { x: 0, y: 0, width: screenWidth, height: screenHeight };

/**
 * Node controller that hosts the render nodes above.
 */
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode {
    this.rootNode = new FrameNode(uiContext);
    if (this.rootNode === null) {
      return this.rootNode;
    }
    const renderNode: RenderNode | null = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      renderNode.frame = { x: 0, y: 0, width: 10, height: 500 };
      renderNode.pivot = { x: 50, y: 50 };
    }
    return this.rootNode;
  }

  addNode(node: RenderNode): void {
    if (this.rootNode === null) {
      return;
    }
    const renderNode: RenderNode | null = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      renderNode.appendChild(node);
    }
  }

  clearNodes(): void {
    if (this.rootNode === null) {
      return;
    }
    const renderNode: RenderNode | null = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      renderNode.clearChildren();
    }
  }
}

@Entry
@Component
struct RenderTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private myNodeController: MyNodeController = new MyNodeController();
  private previewWidth: number = 240;
  private previewHeight: number = 240;
  private galleryLabels: string[] = [
    'Rects', 'RoundRect', 'Circle', 'Arc', 'Points', 'Color',
    'SaveRestore', 'Layer', 'Transform', 'Matrix', 'Clip', 'ClipReset',
    'PathArc', 'PathBezier', 'PathConic', 'PathRelative', 'PathPrimitive', 'PathCombined', 'PathPolygon',
    'PenBrush', 'TextBlob', 'Glyph', 'Effect', 'MatrixDraw'
  ];
  private galleryTitles: Resource[] = [
    $r('app.string.gallery_rects'),
    $r('app.string.gallery_round_rect'),
    $r('app.string.gallery_circle'),
    $r('app.string.gallery_arc'),
    $r('app.string.gallery_points'),
    $r('app.string.gallery_color'),
    $r('app.string.gallery_save_restore'),
    $r('app.string.gallery_layer'),
    $r('app.string.gallery_transform'),
    $r('app.string.gallery_matrix'),
    $r('app.string.gallery_clip'),
    $r('app.string.gallery_clip_reset'),
    $r('app.string.gallery_path_arc'),
    $r('app.string.gallery_path_bezier'),
    $r('app.string.gallery_path_conic'),
    $r('app.string.gallery_path_relative'),
    $r('app.string.gallery_path_primitive'),
    $r('app.string.gallery_path_combined'),
    $r('app.string.gallery_path_polygon'),
    $r('app.string.gallery_pen_brush'),
    $r('app.string.gallery_text_blob'),
    $r('app.string.gallery_glyph'),
    $r('app.string.gallery_effect'),
    $r('app.string.gallery_matrix_draw')
  ];

  build() {
    Column() {
      // 离屏绘制
      Row() {
        Canvas(this.context)
          .id('previewCanvas')
          .width('100%')
          .height('100%')
          .onReady(() => {
            this.CreateBitmapCanvas();
          })
      }
      .height('30%')

      Row() {
        Button($r('app.string.btn_draw_rect'))
          .id('btnDrawRect')
          .margin({ bottom: 10, right: 12 })
          .onClick(() => {
            if (canvas_ === null || canvas_ === undefined) {
              return;
            }
            this.drawImage();
          })
      }
      .height('8%')

      // 使用RenderNode的能力进行绘制
      Row() {
        NodeContainer(this.myNodeController)
          .id('renderNodeContainer')
          .height('100%')
        Button($r('app.string.btn_draw_path'))
          .id('btnDrawPath')
          .margin({ bottom: 10, right: 12 })
          .onClick(() => {
            this.myNodeController.clearNodes();
            this.myNodeController.addNode(newNode);
          })
        Button($r('app.string.btn_draw_text'))
          .id('btnDrawText')
          .margin({ bottom: 10, right: 12 })
          .onClick(() => {
            this.myNodeController.clearNodes();
            this.myNodeController.addNode(textNode);
          })
      }
      .width('100%')
      .height('18%')
      .justifyContent(FlexAlign.Center)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .alignItems(VerticalAlign.Bottom)

      // 分组入口：每个按钮对应一类 drawing 接口的演示
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
          ForEach(this.galleryLabels, (label: string, index: number) => {
            Button(this.galleryTitles[index])
              .id('gallery_' + label)
              .fontSize(12)
              .height(30)
              .margin(4)
              .onClick(() => {
                this.runGallery(index);
              })
          }, (label: string) => label)
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  public async CreateBitmapCanvas(): Promise<void> {
    const color: ArrayBuffer = new ArrayBuffer(screenWidth * screenHeight * 4);
    let opts: image.InitializationOptions = {
      editable: true,
      pixelFormat: image.PixelMapFormat.RGBA_8888,
      size: { height: screenHeight, width: screenWidth }
    };
    pixelMap_ = await image.createPixelMap(color, opts);
    if (pixelMap_ === null || pixelMap_ === undefined) {
      console.log(TAG, 'create pixelMap error');
      return;
    }

    // 创建离屏canvas，与pixelMap绑定
    canvas_ = new drawing.Canvas(pixelMap_);
    if (canvas_ === null || canvas_ === undefined) {
      console.log(TAG, 'create canvas_ error');
      return;
    }
    console.log(TAG, 'create canvas_ success');
    // 调用自定义函数绘制
    drawCase(canvas_);
  }

  // 将离屏绘制好的bitmap绘制到屏幕上
  public async drawImage(): Promise<void> {
    if (pixelMap_ === null || pixelMap_ === undefined) {
      console.error(TAG, 'draw image pixelMap_ is null');
      return;
    }
    console.log(TAG, 'drawImage success');
    this.context.drawImage(pixelMap_, 0, 100);
  }

  /**
   * Run one gallery demo on a fresh offscreen canvas and show the result.
   *
   * @param { number } index - Index of the gallery entry.
   */
  private async runGallery(index: number): Promise<void> {
    const target: OffscreenTarget = await createOffscreenTarget(this.previewWidth, this.previewHeight);
    const canvas: drawing.Canvas = target.canvas;
    this.paintByIndex(canvas, index);
    this.context.clearRect(0, 0, this.previewWidth, this.previewHeight);
    this.context.drawImage(target.pixelMap, 0, 0);
  }

  /**
   * Dispatch one gallery entry onto the given canvas.
   *
   * @param { drawing.Canvas } canvas - Target canvas.
   * @param { number } index - Index of the gallery entry.
   */
  private paintByIndex(canvas: drawing.Canvas, index: number): void {
    switch (index) {
      case 0:
        paintBasicShapes(canvas);
        break;
      case 1:
        paintRects(canvas);
        paintRoundRects(canvas);
        break;
      case 2:
        paintCirclesAndOvals(canvas);
        break;
      case 3:
        paintArcs(canvas);
        break;
      case 4:
        paintPointsAndLines(canvas);
        break;
      case 5:
        paintColorAndBackground(canvas);
        break;
      case 6:
        paintWithSaveRestore(canvas);
        break;
      case 7:
        paintWithLayers(canvas);
        break;
      case 8:
        paintWithTransforms(canvas);
        break;
      case 9:
        paintWithMatrix(canvas);
        break;
      case 10:
        clipWithRect(canvas);
        clipWithPath(canvas);
        paintBasicShapes(canvas);
        break;
      case 11:
        rejectOutsidePath(canvas);
        resetAllClips(canvas);
        break;
      case 12:
        this.paintPath(canvas, createArcPath());
        break;
      case 13:
        this.paintPath(canvas, createBezierPath());
        break;
      case 14:
        this.paintPath(canvas, createConicPath());
        break;
      case 15:
        this.paintPath(canvas, createRelativePath());
        break;
      case 16:
        this.paintPath(canvas, createPrimitivePath());
        break;
      case 17:
        this.paintPath(canvas, createCombinedPath());
        break;
      case 18:
        this.paintPath(canvas, createPolygonPath(true));
        break;
      case 19:
        paintPenBrushShowcase(canvas);
        break;
      case 20:
        paintTextBlob(canvas, 'Hello World');
        break;
      case 21:
        paintSingleCharacter(canvas, 'A');
        paintGlyphs(canvas, 'Hi');
        break;
      case 22:
        paintEffectShowcase(canvas);
        break;
      default:
        paintMatrixShowcase(canvas);
        break;
    }
  }

  /**
   * Stroke a path with the default pen.
   *
   * @param { drawing.Canvas } canvas - Target canvas.
   * @param { drawing.Path } path - Path to stroke.
   */
  private paintPath(canvas: drawing.Canvas, path: drawing.Path): void {
    const pen: drawing.Pen = new drawing.Pen();
    pen.setColor({ alpha: 255, red: 0x11, green: 0x66, blue: 0xCC });
    pen.setStrokeWidth(6);
    pen.setAntiAlias(true);
    canvas.attachPen(pen);
    canvas.drawPath(path);
    canvas.detachPen();
  }
}

async function drawCase(canvas: drawing.Canvas): Promise<void> {
  let pen: drawing.Pen = new drawing.Pen();
  pen.setStrokeWidth(5);
  pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
  canvas.attachPen(pen);
  canvas.drawRect({ left: 200, right: 500, top: 50, bottom: 300 });
  canvas.detachPen();
}
