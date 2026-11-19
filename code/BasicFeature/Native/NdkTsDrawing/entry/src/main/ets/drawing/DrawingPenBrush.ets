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

import { drawing, common2D } from '@kit.ArkGraphics2D';
import { ltrb, rgba } from './DrawingTypes';
import {
  blendColorFilter, blurImageFilter, blurMaskFilter, colorShader, dashPathEffect, shadowLayer
} from './DrawingEffects';

/**
 * Snapshot of every readable pen attribute.
 */
export interface PenSnapshot {
  width: number;
  miterLimit: number;
  alpha: number;
  antiAlias: boolean;
  join: drawing.JoinStyle;
  cap: drawing.CapStyle;
  hex: number;
  red: number;
  green: number;
  blue: number;
  alphaChannel: number;
  floatAlpha: number;
}

/**
 * Snapshot of every readable brush attribute.
 */
export interface BrushSnapshot {
  alpha: number;
  antiAlias: boolean;
  hex: number;
  red: number;
  green: number;
  blue: number;
  alphaChannel: number;
  floatAlpha: number;
}

/**
 * Create a stroke pen with color, width and anti alias enabled.
 *
 * @param { common2D.Color } color - Stroke color.
 * @param { number } width - Stroke width in px.
 * @returns { drawing.Pen } Configured pen.
 */
export function createStrokePen(color: common2D.Color, width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setAntiAlias(true);
  pen.setColor(color);
  pen.setStrokeWidth(width);
  return pen;
}

/**
 * Create a fill brush with color.
 *
 * @param { common2D.Color } color - Fill color.
 * @returns { drawing.Brush } Configured brush.
 */
export function createFillBrush(color: common2D.Color): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setAntiAlias(true);
  brush.setColor(color);
  return brush;
}

/**
 * Read every readable pen attribute.
 *
 * @param { drawing.Pen } pen - Source pen.
 * @returns { PenSnapshot } Pen attribute snapshot.
 */
export function snapshotPen(pen: drawing.Pen): PenSnapshot {
  const color: common2D.Color = pen.getColor();
  const color4f: common2D.Color4f = pen.getColor4f();
  const snapshot: PenSnapshot = {
    width: pen.getWidth(),
    miterLimit: pen.getMiterLimit(),
    alpha: pen.getAlpha(),
    antiAlias: pen.isAntiAlias(),
    join: pen.getJoinStyle(),
    cap: pen.getCapStyle(),
    hex: pen.getHexColor(),
    red: color.red,
    green: color.green,
    blue: color.blue,
    alphaChannel: color.alpha,
    floatAlpha: color4f.alpha
  };
  return snapshot;
}

/**
 * Read every readable brush attribute.
 *
 * @param { drawing.Brush } brush - Source brush.
 * @returns { BrushSnapshot } Brush attribute snapshot.
 */
export function snapshotBrush(brush: drawing.Brush): BrushSnapshot {
  const color: common2D.Color = brush.getColor();
  const color4f: common2D.Color4f = brush.getColor4f();
  const snapshot: BrushSnapshot = {
    alpha: brush.getAlpha(),
    antiAlias: brush.isAntiAlias(),
    hex: brush.getHexColor(),
    red: color.red,
    green: color.green,
    blue: color.blue,
    alphaChannel: color.alpha,
    floatAlpha: color4f.alpha
  };
  return snapshot;
}

/**
 * Apply every pen style setter, including the three setColor overloads.
 *
 * @param { drawing.Pen } pen - Target pen.
 * @returns { drawing.Pen } The same pen with all styles applied.
 */
export function applyPenEffects(pen: drawing.Pen): drawing.Pen {
  pen.setMiterLimit(6);
  pen.setColor(200, 0x11, 0x22, 0x33);
  pen.setColor(0xFF445566);
  pen.setColor(rgba(0xCC, 0x77, 0x88, 0x99));
  const color4f: common2D.Color4f = { alpha: 0.8, red: 0.4, green: 0.6, blue: 0.9 };
  pen.setColor4f(color4f, null);
  pen.setAlpha(180);
  pen.setAntiAlias(true);
  pen.setDither(true);
  pen.setBlendMode(drawing.BlendMode.SRC_OVER);
  pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
  pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
  pen.setShaderEffect(colorShader(0xFF3366AA));
  pen.setColorFilter(blendColorFilter(0x8800FF00));
  pen.setImageFilter(blurImageFilter(2));
  pen.setMaskFilter(blurMaskFilter(3));
  pen.setPathEffect(dashPathEffect());
  pen.setShadowLayer(shadowLayer());
  return pen;
}

/**
 * Apply every brush style setter, including the three setColor overloads.
 *
 * @param { drawing.Brush } brush - Target brush.
 * @returns { drawing.Brush } The same brush with all styles applied.
 */
export function applyBrushEffects(brush: drawing.Brush): drawing.Brush {
  brush.setColor(190, 0x22, 0x44, 0x66);
  brush.setColor(0xFF556677);
  brush.setColor(rgba(0xAA, 0x99, 0x88, 0x77));
  const color4f: common2D.Color4f = { alpha: 0.5, red: 0.2, green: 0.3, blue: 0.4 };
  brush.setColor4f(color4f, null);
  brush.setAlpha(160);
  brush.setAntiAlias(true);
  brush.setBlendMode(drawing.BlendMode.MULTIPLY);
  brush.setShaderEffect(colorShader(0xFF00AA88));
  brush.setColorFilter(blendColorFilter(0x66FF0000));
  brush.setImageFilter(blurImageFilter(1));
  brush.setMaskFilter(blurMaskFilter(2));
  brush.setShadowLayer(shadowLayer());
  return brush;
}

/**
 * Reset the pen and read its attributes back.
 *
 * @param { drawing.Pen } pen - Target pen.
 * @returns { PenSnapshot } Snapshot after reset.
 */
export function resetPen(pen: drawing.Pen): PenSnapshot {
  pen.reset();
  return snapshotPen(pen);
}

/**
 * Reset the brush and read its attributes back.
 *
 * @param { drawing.Brush } brush - Target brush.
 * @returns { BrushSnapshot } Snapshot after reset.
 */
export function resetBrush(brush: drawing.Brush): BrushSnapshot {
  brush.reset();
  return snapshotBrush(brush);
}

/**
 * Build the stroke outline of a path with the current pen.
 *
 * @param { drawing.Pen } pen - Source pen.
 * @param { drawing.Path } source - Source path.
 * @returns { drawing.Path } Outline path, empty when conversion fails.
 */
export function strokeOutline(pen: drawing.Pen, source: drawing.Path): drawing.Path {
  const outline: drawing.Path = new drawing.Path();
  const ok: boolean = pen.getFillPath(source, outline);
  if (!ok) {
    return new drawing.Path();
  }
  return outline;
}

/**
 * Copy a pen with the copy constructor.
 *
 * @param { drawing.Pen } pen - Source pen.
 * @returns { drawing.Pen } Copied pen.
 */
export function copyPen(pen: drawing.Pen): drawing.Pen {
  return new drawing.Pen(pen);
}

/**
 * Copy a brush with the copy constructor.
 *
 * @param { drawing.Brush } brush - Source brush.
 * @returns { drawing.Brush } Copied brush.
 */
export function copyBrush(brush: drawing.Brush): drawing.Brush {
  return new drawing.Brush(brush);
}

/**
 * Draw a rectangle with the configured pen and brush.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintPenBrushShowcase(canvas: drawing.Canvas): void {
  const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
  const brush: drawing.Brush = applyBrushEffects(createFillBrush(rgba(0x99, 0xFF, 0xDD, 0x00)));
  canvas.attachPen(pen);
  canvas.attachBrush(brush);
  canvas.drawRect(ltrb(30, 30, 170, 130));
  canvas.detachBrush();
  canvas.detachPen();
}
