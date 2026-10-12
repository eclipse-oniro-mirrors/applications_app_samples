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

import { UIContext, NodeController, FrameNode, RenderNode, DrawContext } from '@kit.ArkUI';
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { VALUE_100, VALUE_200, VALUE_300, VALUE_900 } from '../../pages/Index';
import { STROKE_SAMPLE } from '../../pages/Index';

function drawBaseText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_base_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  // [End arkts_graphics_draw_base_text]
}

function drawStrokeText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_stroke_text]
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置抗锯齿
  pen.setAntiAlias(true);
  // 设置描边线宽
  pen.setStrokeWidth(3.0);
  // 设置描边颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);
  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 添加画笔描边效果
  canvas.attachPen(pen);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  // 去除描边效果
  canvas.detachPen();
  // [End arkts_graphics_draw_stroke_text]
}

function drawChineseStrokeText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_chinese_stroke_text]

  // 创建画刷
  let brush = new drawing.Brush();
  // 创建画笔
  let pen = new drawing.Pen();
  // 设置抗锯齿
  brush.setAntiAlias(true);
  // 设置填充颜色
  brush.setColor(0xFF, 0xFF, 0xFF, 0xFF);

  pen.setAntiAlias(true);
  // 设置描边线宽
  pen.setStrokeWidth(3.0);
  // 设置描边颜色
  pen.setColor(0xFF, 0xFF, 0x00, 0x00);

  // 创建字型对象
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(100);
  // 添加画笔描边效果
  canvas.attachPen(pen);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString(STROKE_SAMPLE, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  canvas.drawTextBlob(textBlob, VALUE_200,  VALUE_300);
  // 去除描边效果
  canvas.detachPen(); 

  canvas.attachBrush(brush);
  canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  canvas.detachBrush();
  // [End arkts_graphics_draw_chinese_stroke_text]
}

function drawGradientText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_gradient_text]
  let startPt: common2D.Point = { x: VALUE_100, y: VALUE_100 };
  let endPt: common2D.Point = { x: VALUE_900, y: VALUE_900 };
  let colors = [0xFFFFFF00, 0xFFFF0000, 0xFF0000FF];
  // 创建线性渐变着色器
  let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
  // 创建画刷
  let brush = new drawing.Brush();
  // 设置着色器
  brush.setShaderEffect(shaderEffect);
  // 添加画刷填充效果
  canvas.attachBrush(brush);
  // 创建字型
  const font = new drawing.Font();
  // 设置字体大小
  font.setSize(VALUE_200);
  // 创建字块
  const textBlob = drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  canvas.drawTextBlob(textBlob, VALUE_100, VALUE_300);
  // 去除填充效果
  canvas.detachBrush();
  // [End arkts_graphics_draw_gradient_text]
}

function drawThemeText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_theme_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  // 设置跟随主题字体
  font.setThemeFontFollowed(true);
  // 创建字块对象
  const textBlob = drawing.TextBlob.makeFromString('Hello World', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  // 绘制字块
  canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  // [End arkts_graphics_draw_theme_text]
}

function drawSingleText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_single_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['H', 'e', 'l', 'l', 'o'];
  for (let s of text) {
    // 单字绘制
    canvas.drawSingleCharacter(s, font, startX, startY);
    // 测量单个字符的宽度
    let textWidth = font.measureSingleCharacter(s);
    startX += textWidth;
  }
  // [End arkts_graphics_draw_single_text]
}

function drawFeatureText(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_feature_text]
  // 创建字型对象
  const font = new drawing.Font();
  // 设置文字大小
  font.setSize(100);
  let startX = 100;
  let startY = 100;
  let text = ['a', '2', '+', 'b', '2'];
  // 创建字体特征对象数组
  let fontFeatures: drawing.FontFeature[] = [{name: 'frac', value: 1}];
  for (let s of text) {
    // 单字绘制
    canvas.drawSingleCharacterWithFeatures(s, font, startX, startY, fontFeatures);
    // 测量单个字符的宽度
    let textWidth = font.measureSingleCharacterWithFeatures(s, fontFeatures);
    startX += textWidth;
  }
  // [End arkts_graphics_draw_feature_text]
}

function drawTextBlobFallback(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_textblob_string_fallback]
  // 创建字型对象
  const font = new drawing.Font();
  // 创建字体对象
  const myTypeface = drawing.Typeface.makeFromFile('/system/fonts/NotoSansArmenian[wdth,wght].ttf');
  // 为字型设置字体
  font.setTypeface(myTypeface);
  // 设置字体大小
  font.setSize(VALUE_100);
  // 创建支持字体回退的字块数组
  const textBlobs = drawing.TextBlob.makeFromStringWithFallback('Hello世界', font);
  // 遍历字块数组并绘制，每个TextBlob绘制在相同原点
  for (let textBlob of textBlobs) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
  // [End arkts_graphics_draw_textblob_string_fallback]
}

function drawTextBlobPosTextFallback(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_textblob_postext_fallback]
  // 创建字型对象
  const font = new drawing.Font();
  // 创建字体对象
  const myTypeface = drawing.Typeface.makeFromFile('/system/fonts/NotoSansArmenian[wdth,wght].ttf');
  // 为字型设置字体
  font.setTypeface(myTypeface);
  // 设置字体大小
  font.setSize(VALUE_100);
  // 需要绘制的文本
  const text = 'Hello世界';
  // 获取glyph数量
  const glyphCount = font.countText(text);
  // 为每个字符指定坐标位置
  let points: common2D.Point[] = [];
  let xOffset = 0;
  for (let i = 0; i < glyphCount; i++) {
    points.push({ x: VALUE_200 + xOffset, y: VALUE_300 });
    xOffset += 60;
  }
  // 创建支持字体回退的字块数组
  const textBlobs = drawing.TextBlob.makeFromPosTextWithFallback(text, glyphCount, points, font);
  // 遍历字块数组并绘制
  for (let textBlob of textBlobs) {
    canvas.drawTextBlob(textBlob, 0, 0);
  }
  // [End arkts_graphics_draw_textblob_postext_fallback]
}

function drawFontTextToGlyphsFallback(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_font_texttoglyphs_fallback]
  // 创建字型对象
  const font = new drawing.Font();
  // 创建字体对象
  const myTypeface = drawing.Typeface.makeFromFile('/system/fonts/NotoSansArmenian[wdth,wght].ttf');
  // 为字型设置字体
  font.setTypeface(myTypeface);
  // 设置字体大小
  font.setSize(VALUE_100);
  // 需要转换的文本
  const text = 'Hello世界';
  // 获取glyph数量
  const glyphCount = font.countText(text);
  // 将文本转换为glyph索引，支持字体回退
  const fallbackInfos = font.textToGlyphsWithFallback(text, glyphCount);
  // 使用drawGlyphs按回退字体分组绘制字形
  let xOffset = 0;
  // 遍历回退信息，每个元素包含相同typeface的glyph ID数组
  for (let info of fallbackInfos) {
    // info.typeface为匹配的字体
    // info.glyphIds为该字体对应的glyph ID数组
    font.setTypeface(info.typeface);
    let positions: common2D.Point[] = [];
    let glyphWidths = font.getWidths(info.glyphIds);
    for (let j = 0; j < info.glyphIds.length; j++) {
      positions.push({ x: VALUE_200 + xOffset, y: VALUE_300 });
      xOffset += glyphWidths[j];
    }
    canvas.drawGlyphs(info.glyphIds, 0, positions, 0, info.glyphIds.length, font);
  }
  // [End arkts_graphics_draw_font_texttoglyphs_fallback]
}

function drawFontMeasureFallback(canvas: drawing.Canvas) {
  // [Start arkts_graphics_draw_font_measure_fallback]
  // 创建字型对象
  const font = new drawing.Font();
  // 创建字体对象
  const myTypeface = drawing.Typeface.makeFromFile('/system/fonts/NotoSansArmenian[wdth,wght].ttf');
  // 为字型设置字体
  font.setTypeface(myTypeface);
  // 设置字体大小
  font.setSize(VALUE_100);
  // 需要测量的文本
  const text = 'Hello世界';
  // 测量文本宽度，支持字体回退
  const textWidth = font.measureTextWithFallback(text, drawing.TextEncoding.TEXT_ENCODING_UTF8);
  console.info('textWidth: ' + textWidth);
  // [End arkts_graphics_draw_font_measure_fallback]
  // 绘制文本以展示字体回退效果
  const textBlobs = drawing.TextBlob.makeFromStringWithFallback(text, font);
  for (let textBlob of textBlobs) {
    canvas.drawTextBlob(textBlob, VALUE_200, VALUE_300);
  }
}

// 自定义RenderNode
class MyRenderNode extends RenderNode {
  private drawFunctions: ((canvas: drawing.Canvas) => void)[] = []; // 存储绘制函数的数组
  private currentDrawIndex: number = 0; // 当前绘制函数的下标

  // 添加绘制函数的接口
  addDrawFunction(func: (canvas: drawing.Canvas) => void) {
    this.drawFunctions.push(func);
  }

  // 设置当前绘制函数的下标
  setDrawIndex(index: number) {
    if (index >= 0 && index < this.drawFunctions.length) {
      this.currentDrawIndex = index;
      this.invalidate(); // 触发重绘
    }
  }

  async draw(context: DrawContext) {
    const canvas = context.canvas;
    const drawFunction = this.drawFunctions[this.currentDrawIndex];
    if (drawFunction) {
      drawFunction(canvas);
    }
  }
}

// 自定义NodeController
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private myRenderNode = new MyRenderNode();

  constructor() {
    super();
    // 添加绘制函数
    this.myRenderNode.addDrawFunction(drawBaseText);
    this.myRenderNode.addDrawFunction(drawStrokeText);
    this.myRenderNode.addDrawFunction(drawChineseStrokeText);
    this.myRenderNode.addDrawFunction(drawGradientText);
    this.myRenderNode.addDrawFunction(drawThemeText);
    this.myRenderNode.addDrawFunction(drawSingleText);
    this.myRenderNode.addDrawFunction(drawFeatureText);
    this.myRenderNode.addDrawFunction(drawTextBlobFallback);
    this.myRenderNode.addDrawFunction(drawTextBlobPosTextFallback);
    this.myRenderNode.addDrawFunction(drawFontTextToGlyphsFallback);
    this.myRenderNode.addDrawFunction(drawFontMeasureFallback);
  }

  makeNode(uiContext: UIContext): FrameNode {
    this.rootNode = new FrameNode(uiContext);
    if (this.rootNode === null) {
      return this.rootNode;
    }

    const renderNode = this.rootNode.getRenderNode();
    if (renderNode !== null) {
      this.myRenderNode.backgroundColor = 0xffffffff; // 白色背景
      this.myRenderNode.frame = { x: 0, y: 0, width: 4800, height: 4800 };
      this.myRenderNode.pivot = { x: 0.2, y: 0.8 };
      this.myRenderNode.scale = { x: 1, y: 1 };
      renderNode.appendChild(this.myRenderNode);
      renderNode.clipToFrame = true;
    }
    return this.rootNode;
  }

  // 暴露设置绘制函数下标的方法
  setDrawIndex(index: number) {
    this.myRenderNode.setDrawIndex(index);
  }
}

@Entry
@Component
struct TextBlobDrawing {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        // 将自定义NodeController进行显示
        NodeContainer(this.nodeController)
          .width('100%')
          .height('70%');
        Row() {
          Button($r('app.string.BaseText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(0); // 点击绘制基本文字
            });
          Button($r('app.string.StrokeText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(1); // 点击绘制描边文字
            });
          Button($r('app.string.ChineseStrokeText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(2); // 点击绘制中文描边文字
            });
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')

        Row() {
          Button($r('app.string.GradientText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(3); // 点击绘制渐变文字
            });
          Button($r('app.string.ThemeText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(4); // 点击绘制主题字体
            });
          Button($r('app.string.SingleText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(5); // 点击绘制单字
            });
          Button($r('app.string.FeatureText'))
            .onClick(() => {
              this.nodeController.setDrawIndex(6); // 点击绘制字体特征
            });
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')

        Row() {
          Button($r('app.string.TextBlobStringFallback'))
            .onClick(() => {
              this.nodeController.setDrawIndex(7); // 点击绘制字块字体回退
            });
          Button($r('app.string.TextBlobPosTextFallback'))
            .onClick(() => {
              this.nodeController.setDrawIndex(8); // 点击绘制定点字块回退
            });
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')

        Row() {
          Button($r('app.string.GlyphsFallback'))
            .onClick(() => {
              this.nodeController.setDrawIndex(9); // 点击绘制字形转换回退
            });
          Button($r('app.string.MeasureFallback'))
            .onClick(() => {
              this.nodeController.setDrawIndex(10); // 点击绘制文本测量回退
            });
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('8%')
      }
    }
  }
}