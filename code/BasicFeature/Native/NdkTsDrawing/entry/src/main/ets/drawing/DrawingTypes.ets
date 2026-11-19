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

import { common2D } from '@kit.ArkGraphics2D';

export const DRAWING_TAG: string = 'NdkTsDrawing';
export const DEFAULT_PEN_WIDTH: number = 6;
export const DEFAULT_FONT_SIZE: number = 40;

/**
 * Truncate a color channel into the valid range [0, 255].
 *
 * @param { number } value - Raw channel value.
 * @returns { number } Channel value limited to [0, 255].
 */
export function clampChannel(value: number): number {
  if (Number.isNaN(value)) {
    return 0;
  }
  if (value <= 0) {
    return 0;
  }
  if (value >= 255) {
    return 255;
  }
  return Math.round(value);
}

/**
 * Build a color object from four channels.
 *
 * @param { number } alpha - Alpha channel.
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @returns { common2D.Color } Color with every channel clamped into [0, 255].
 */
export function rgba(alpha: number, red: number, green: number, blue: number): common2D.Color {
  const color: common2D.Color = {
    alpha: clampChannel(alpha),
    red: clampChannel(red),
    green: clampChannel(green),
    blue: clampChannel(blue)
  };
  return color;
}

/**
 * Build a rectangle from its four edges.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { common2D.Rect } Rectangle object.
 */
export function ltrb(left: number, top: number, right: number, bottom: number): common2D.Rect {
  const rect: common2D.Rect = { left: left, top: top, right: right, bottom: bottom };
  return rect;
}

/**
 * Build a point object.
 *
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { common2D.Point } Point object.
 */
export function point(x: number, y: number): common2D.Point {
  const result: common2D.Point = { x: x, y: y };
  return result;
}

/**
 * Pack a color object into a 32 bit ARGB integer.
 *
 * @param { common2D.Color } color - Source color.
 * @returns { number } ARGB integer.
 */
export function toArgb(color: common2D.Color): number {
  const alpha: number = clampChannel(color.alpha);
  const red: number = clampChannel(color.red);
  const green: number = clampChannel(color.green);
  const blue: number = clampChannel(color.blue);
  return alpha * 16777216 + red * 65536 + green * 256 + blue;
}

/**
 * Build a 2D point in physical pixel unit, used by matrix and path cases.
 *
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number[] } Array with two elements, x and y.
 */
export function toPair(x: number, y: number): number[] {
  const pair: number[] = [x, y];
  return pair;
}
