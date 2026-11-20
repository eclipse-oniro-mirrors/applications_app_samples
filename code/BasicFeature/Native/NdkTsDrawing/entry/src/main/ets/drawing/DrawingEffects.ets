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
import { ltrb, point, rgba } from './DrawingTypes';

/**
 * Create a blend mode color filter.
 *
 * @param { number } hex - ARGB color value.
 * @returns { drawing.ColorFilter } Color filter.
 */
export function blendColorFilter(hex: number): drawing.ColorFilter {
  return drawing.ColorFilter.createBlendModeColorFilter(hex, drawing.BlendMode.SRC_IN);
}

/**
 * Compose a luma filter with a blend mode filter.
 *
 * @returns { drawing.ColorFilter } Composed color filter.
 */
export function composeColorFilter(): drawing.ColorFilter {
  const outer: drawing.ColorFilter = drawing.ColorFilter.createLumaColorFilter();
  const inner: drawing.ColorFilter = drawing.ColorFilter.createBlendModeColorFilter(
    rgba(255, 0x33, 0x66, 0x99), drawing.BlendMode.SRC_OVER);
  return drawing.ColorFilter.createComposeColorFilter(outer, inner);
}

/**
 * Create both gamma color filters.
 *
 * @returns { drawing.ColorFilter[] } Linear to SRGB and SRGB to linear filters.
 */
export function gammaColorFilters(): drawing.ColorFilter[] {
  const filters: drawing.ColorFilter[] = [];
  filters.push(drawing.ColorFilter.createLinearToSRGBGamma());
  filters.push(drawing.ColorFilter.createSRGBGammaToLinear());
  return filters;
}

/**
 * Create a luma color filter.
 *
 * @returns { drawing.ColorFilter } Luma color filter.
 */
export function lumaColorFilter(): drawing.ColorFilter {
  return drawing.ColorFilter.createLumaColorFilter();
}

/**
 * Create a 4x5 matrix color filter.
 *
 * @returns { drawing.ColorFilter } Matrix color filter.
 */
export function matrixColorFilter(): drawing.ColorFilter {
  const matrix: number[] = [
    1, 0, 0, 0, 0,
    0, 1, 0, 0, 0,
    0, 0, 1, 0, 0,
    0, 0, 0, 1, 0
  ];
  return drawing.ColorFilter.createMatrixColorFilter(matrix);
}

/**
 * Create a lighting color filter.
 *
 * @returns { drawing.ColorFilter } Lighting color filter.
 */
export function lightingColorFilter(): drawing.ColorFilter {
  return drawing.ColorFilter.createLightingColorFilter(0xFF884422, 0x00112233);
}

/**
 * Create a blur image filter.
 *
 * @param { number } sigma - Blur sigma.
 * @returns { drawing.ImageFilter } Blur image filter.
 */
export function blurImageFilter(sigma: number): drawing.ImageFilter {
  return drawing.ImageFilter.createBlurImageFilter(sigma, sigma, drawing.TileMode.CLAMP);
}

/**
 * Create an offset image filter.
 *
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { drawing.ImageFilter } Offset image filter.
 */
export function offsetImageFilter(dx: number, dy: number): drawing.ImageFilter {
  return drawing.ImageFilter.createOffsetImageFilter(dx, dy);
}

/**
 * Compose a blur filter with an offset filter.
 *
 * @returns { drawing.ImageFilter } Composed image filter.
 */
export function composeImageFilter(): drawing.ImageFilter {
  const outer: drawing.ImageFilter = blurImageFilter(6);
  const inner: drawing.ImageFilter = offsetImageFilter(4, 4);
  return drawing.ImageFilter.createComposeImageFilter(outer, inner);
}

/**
 * Blend two image filters.
 *
 * @returns { drawing.ImageFilter } Blended image filter.
 */
export function blendImageFilter(): drawing.ImageFilter {
  const background: drawing.ImageFilter = blurImageFilter(3);
  const foreground: drawing.ImageFilter = offsetImageFilter(2, 2);
  return drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.MULTIPLY, background, foreground);
}

/**
 * Build an image filter from a color filter.
 *
 * @returns { drawing.ImageFilter } Image filter created from a color filter.
 */
export function colorToImageFilter(): drawing.ImageFilter {
  const filter: drawing.ColorFilter = lightingColorFilter();
  return drawing.ImageFilter.createFromColorFilter(filter);
}

/**
 * Create a solid color shader.
 *
 * @param { number } hex - ARGB color value.
 * @returns { drawing.ShaderEffect } Color shader.
 */
export function colorShader(hex: number): drawing.ShaderEffect {
  return drawing.ShaderEffect.createColorShader(hex);
}

/**
 * Create a linear gradient shader.
 *
 * @returns { drawing.ShaderEffect } Linear gradient shader.
 */
export function linearGradientShader(): drawing.ShaderEffect {
  const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF];
  const positions: number[] = [0, 0.5, 1];
  return drawing.ShaderEffect.createLinearGradient(point(0, 0), point(200, 200), colors,
    drawing.TileMode.CLAMP, positions);
}

/**
 * Create a radial gradient shader.
 *
 * @returns { drawing.ShaderEffect } Radial gradient shader.
 */
export function radialGradientShader(): drawing.ShaderEffect {
  const colors: number[] = [0xFFFFAA00, 0x00000000];
  return drawing.ShaderEffect.createRadialGradient(point(100, 100), 80, colors, drawing.TileMode.REPEAT);
}

/**
 * Create a sweep gradient shader.
 *
 * @returns { drawing.ShaderEffect } Sweep gradient shader.
 */
export function sweepGradientShader(): drawing.ShaderEffect {
  const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF];
  return drawing.ShaderEffect.createSweepGradient(point(100, 100), colors, drawing.TileMode.MIRROR, 0, 360);
}

/**
 * Create a conical gradient shader.
 *
 * @returns { drawing.ShaderEffect } Conical gradient shader.
 */
export function conicalGradientShader(): drawing.ShaderEffect {
  const colors: number[] = [0xFF224466, 0xFF88AACC];
  return drawing.ShaderEffect.createConicalGradient(point(40, 40), 10, point(160, 160), 80, colors,
    drawing.TileMode.DECAL);
}

/**
 * Compose two color shaders.
 *
 * @returns { drawing.ShaderEffect } Composed shader.
 */
export function composeShader(): drawing.ShaderEffect {
  const background: drawing.ShaderEffect = colorShader(0xFF336699);
  const foreground: drawing.ShaderEffect = colorShader(0xFF996633);
  return drawing.ShaderEffect.createComposeShader(background, foreground, drawing.BlendMode.SRC_OVER);
}

/**
 * Create a blur mask filter.
 *
 * @param { number } sigma - Blur sigma.
 * @returns { drawing.MaskFilter } Blur mask filter.
 */
export function blurMaskFilter(sigma: number): drawing.MaskFilter {
  return drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, sigma);
}

/**
 * Create a dash path effect.
 *
 * @returns { drawing.PathEffect } Dash path effect.
 */
export function dashPathEffect(): drawing.PathEffect {
  const intervals: number[] = [12, 6, 4, 6];
  return drawing.PathEffect.createDashPathEffect(intervals, 0);
}

/**
 * Create a corner path effect.
 *
 * @param { number } radius - Corner radius.
 * @returns { drawing.PathEffect } Corner path effect.
 */
export function cornerPathEffect(radius: number): drawing.PathEffect {
  return drawing.PathEffect.createCornerPathEffect(radius);
}

/**
 * Create a discrete path effect.
 *
 * @returns { drawing.PathEffect } Discrete path effect.
 */
export function discretePathEffect(): drawing.PathEffect {
  return drawing.PathEffect.createDiscretePathEffect(10, 4, 0);
}

/**
 * Create a path dash effect.
 *
 * @returns { drawing.PathEffect } Path dash effect.
 */
export function pathDashEffect(): drawing.PathEffect {
  const shape: drawing.Path = new drawing.Path();
  shape.addRect(ltrb(0, 0, 6, 6));
  return drawing.PathEffect.createPathDashEffect(shape, 20, 0, drawing.PathDashStyle.ROTATE);
}

/**
 * Compose two path effects.
 *
 * @returns { drawing.PathEffect } Composed path effect.
 */
export function composePathEffect(): drawing.PathEffect {
  const outer: drawing.PathEffect = cornerPathEffect(4);
  const inner: drawing.PathEffect = dashPathEffect();
  return drawing.PathEffect.createComposePathEffect(outer, inner);
}

/**
 * Sum two path effects.
 *
 * @returns { drawing.PathEffect } Summed path effect.
 */
export function sumPathEffect(): drawing.PathEffect {
  const first: drawing.PathEffect = dashPathEffect();
  const second: drawing.PathEffect = cornerPathEffect(2);
  return drawing.PathEffect.createSumPathEffect(first, second);
}

/**
 * Create a shadow layer.
 *
 * @returns { drawing.ShadowLayer } Shadow layer.
 */
export function shadowLayer(): drawing.ShadowLayer {
  return drawing.ShadowLayer.create(8, 4, 4, rgba(0x80, 0x00, 0x00, 0x00));
}

/**
 * Create an image lattice with one vertical and one horizontal division.
 *
 * @returns { drawing.Lattice } Image lattice.
 */
export function imageLattice(): drawing.Lattice {
  const xDivs: number[] = [40, 80];
  const yDivs: number[] = [40, 80];
  const colors: common2D.Color[] = [
    rgba(0xFF, 0xFF, 0x00, 0x00),
    rgba(0xFF, 0x00, 0xFF, 0x00),
    rgba(0xFF, 0x00, 0x00, 0xFF),
    rgba(0xFF, 0x33, 0x33, 0x33)
  ];
  return drawing.Lattice.createImageLattice(xDivs, yDivs, 2, 2, null, null, colors);
}

/**
 * Draw a showcase that applies shader, path effect, shadow layer and color filter.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintEffectShowcase(canvas: drawing.Canvas): void {
  const path: drawing.Path = new drawing.Path();
  path.addRoundRect(new drawing.RoundRect(ltrb(20, 20, 180, 140), 18, 18));

  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 0x22, 0x66, 0xAA));
  pen.setStrokeWidth(6);
  pen.setShaderEffect(linearGradientShader());
  pen.setPathEffect(dashPathEffect());
  pen.setShadowLayer(shadowLayer());
  pen.setBlendMode(drawing.BlendMode.SRC_OVER);
  pen.setMaskFilter(blurMaskFilter(2));
  pen.setColorFilter(lightingColorFilter());
  pen.setImageFilter(blurImageFilter(1));
  canvas.attachPen(pen);
  canvas.drawPath(path);
  canvas.detachPen();

  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(0x88, 0xFF, 0xCC, 0x00));
  brush.setShaderEffect(radialGradientShader());
  brush.setColorFilter(composeColorFilter());
  brush.setBlendMode(drawing.BlendMode.PLUS);
  brush.setShadowLayer(shadowLayer());
  canvas.attachBrush(brush);
  canvas.drawCircle(100, 100, 40);
  canvas.detachBrush();

  canvas.drawColor(0x22000000, drawing.BlendMode.DST_OVER);
  const tint: common2D.Color = rgba(255, 0x00, 0x99, 0xFF);
  canvas.drawColor(tint, drawing.BlendMode.SRC_ATOP);
}
