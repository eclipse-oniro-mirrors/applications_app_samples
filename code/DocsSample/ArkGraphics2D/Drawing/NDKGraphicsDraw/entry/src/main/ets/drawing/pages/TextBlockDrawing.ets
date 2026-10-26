/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XComponentContext from '../../interface/XComponentContext';

@Entry
@Component
struct TextBlockDrawing {
  private xComponentContext: XComponentContext | undefined = undefined;

  build() {
    Column() {
      XComponent({ id: 'textBlockDrawingXComponent', type: XComponentType.SURFACE, libraryname: 'entry' })
        .onLoad((xComponentContext) => {
          this.xComponentContext = xComponentContext as XComponentContext;
        })
        .backgroundColor(Color.White)
        .width('100%')
        .height('62%')
      Row() {
        Button($r('app.string.BaseText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'BaseText');
            }
          })
        Button($r('app.string.StrokeText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'StrokeText');
            }
          })
        Button($r('app.string.ChineseStrokeText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'ChineseStrokeText');
            }
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height('8%')
      Row() {
        Button($r('app.string.GradientText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'GradientText');
            }
          })
        Button($r('app.string.ThemeText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'ThemeText');
            }
          })
        Button($r('app.string.SingleText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'SingleText');
            }
          })
        Button($r('app.string.FeatureText'))
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'FeatureText');
            }
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height('8%')
      Row() {
        Button($r('app.string.TextBlobStringFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'TextBlobStringFallback');
            }
          })
        Button($r('app.string.TextBlobTextFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'TextBlobTextFallback');
            }
          })
        Button($r('app.string.TextBlobPosTextFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'TextBlobPosTextFallback');
            }
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height('8%')
      Row() {
        Button($r('app.string.FontTextToGlyphsFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'FontTextToGlyphsFallback');
            }
          })
        Button($r('app.string.FontMeasureTextFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'FontMeasureTextFallback');
            }
          })
        Button($r('app.string.FontMeasureTextWithBrushOrPenFallback'))
          .layoutWeight(1)
          .fontSize(11)
          .padding({ left: 4, right: 4 })
          .onClick((): void => {
            if (this.xComponentContext) {
              this.xComponentContext.draw('CanvasGet', 'FontMeasureTextWithBrushOrPenFallback');
            }
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height('8%')
    }
  }
}