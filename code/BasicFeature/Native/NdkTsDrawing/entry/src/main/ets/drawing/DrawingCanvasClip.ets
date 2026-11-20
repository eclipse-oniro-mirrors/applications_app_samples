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

import { drawing } from '@kit.ArkGraphics2D';
import { ltrb, rgba } from './DrawingTypes';

/**
 * Clip the canvas with a rectangle and report whether the clip became empty.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the clip is empty after clipping.
 */
export function clipWithRect(canvas: drawing.Canvas): boolean {
  canvas.clipRect(ltrb(20, 20, 180, 180), drawing.ClipOp.INTERSECT, true);
  return canvas.isClipEmpty();
}

/**
 * Clip the canvas with a closed path.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the clip is empty after clipping.
 */
export function clipWithPath(canvas: drawing.Canvas): boolean {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(100, 100, 60);
  canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
  return canvas.isClipEmpty();
}

/**
 * Clip the canvas with a region.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the clip is empty after clipping.
 */
export function clipWithRegion(canvas: drawing.Canvas): boolean {
  const region: drawing.Region = new drawing.Region(10, 10, 150, 150);
  canvas.clipRegion(region, drawing.ClipOp.INTERSECT);
  return canvas.isClipEmpty();
}

/**
 * Clip the canvas with a rounded rectangle.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the clip is empty after clipping.
 */
export function clipWithRoundRect(canvas: drawing.Canvas): boolean {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 190, 190), 20, 20);
  canvas.clipRoundRect(roundRect, drawing.ClipOp.INTERSECT, true);
  return canvas.isClipEmpty();
}

/**
 * Reset every clip applied to the canvas.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the clip is still empty after resetting.
 */
export function resetAllClips(canvas: drawing.Canvas): boolean {
  canvas.clipRect(ltrb(50, 50, 60, 60), drawing.ClipOp.INTERSECT, false);
  canvas.resetClip();
  return canvas.isClipEmpty();
}

/**
 * Read the opaque flag of the canvas.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } Whether the canvas is fully opaque.
 */
export function probeOpaque(canvas: drawing.Canvas): boolean {
  const opaque: boolean = canvas.isOpaque();
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x00, 0x00, 0x00));
  canvas.attachBrush(brush);
  canvas.drawRect(ltrb(0, 0, 200, 200));
  canvas.detachBrush();
  return opaque;
}

/**
 * Ask the canvas to reject a path far outside the current clip.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the path can be rejected.
 */
export function rejectOutsidePath(canvas: drawing.Canvas): boolean {
  canvas.clipRect(ltrb(0, 0, 100, 100), drawing.ClipOp.INTERSECT, false);
  const outside: drawing.Path = new drawing.Path();
  outside.addRect(ltrb(5000, 5000, 5100, 5100));
  return canvas.quickRejectPath(outside);
}

/**
 * Ask the canvas to reject a rectangle far outside the current clip.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { boolean } True when the rectangle can be rejected.
 */
export function rejectOutsideRect(canvas: drawing.Canvas): boolean {
  canvas.clipRect(ltrb(0, 0, 100, 100), drawing.ClipOp.INTERSECT, false);
  return canvas.quickRejectRect(ltrb(6000, 6000, 6100, 6100));
}

/**
 * Read the canvas size.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { number[] } Width and height in px.
 */
export function readCanvasSize(canvas: drawing.Canvas): number[] {
  const size: number[] = [canvas.getWidth(), canvas.getHeight()];
  return size;
}
