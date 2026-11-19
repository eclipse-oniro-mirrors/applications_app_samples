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
 * Draw rectangles with both brush and pen, covering the two drawRect overloads.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintRects(canvas: drawing.Canvas): void {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x33, 0x66, 0x99));
  canvas.attachBrush(brush);
  canvas.drawRect(ltrb(10, 10, 90, 60));
  canvas.drawRect(20, 70, 120, 130);
  canvas.detachBrush();

  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 0x11, 0x22, 0x33));
  pen.setStrokeWidth(3);
  pen.setAntiAlias(true);
  canvas.attachPen(pen);
  canvas.drawRect(ltrb(100, 20, 180, 90));
  canvas.detachPen();
}

/**
 * Draw a rounded rectangle and a nested rounded rectangle.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintRoundRects(canvas: drawing.Canvas): void {
  const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 180, 120), 24, 24);
  const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 35, 150, 95), 16, 16);

  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 0x00, 0x66, 0xAA));
  pen.setStrokeWidth(4);
  pen.setAntiAlias(true);
  canvas.attachPen(pen);
  canvas.drawRoundRect(outer);
  canvas.drawNestedRoundRect(outer, inner);
  canvas.detachPen();

  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(0x66, 0xFF, 0xCC, 0x00));
  canvas.attachBrush(brush);
  canvas.drawRoundRect(inner);
  canvas.detachBrush();
}

/**
 * Draw circles and ovals.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintCirclesAndOvals(canvas: drawing.Canvas): void {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x22, 0x88, 0x44));
  canvas.attachBrush(brush);
  canvas.drawCircle(60, 60, 40);
  canvas.drawOval(ltrb(90, 20, 190, 110));
  canvas.detachBrush();
}

/**
 * Draw arcs, including the arc with center variant.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintArcs(canvas: drawing.Canvas): void {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 0xCC, 0x33, 0x00));
  pen.setStrokeWidth(5);
  pen.setAntiAlias(true);
  canvas.attachPen(pen);
  canvas.drawArc(ltrb(10, 10, 110, 110), 0, 120);
  canvas.drawArcWithCenter(ltrb(90, 60, 190, 160), 30, 200, true);
  canvas.detachPen();
}

/**
 * Draw points and lines with every point mode.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintPointsAndLines(canvas: drawing.Canvas): void {
  const points: common2D.Point[] = [point(20, 20), point(60, 80), point(120, 30), point(170, 150)];
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 0x00, 0x44, 0x88));
  pen.setStrokeWidth(4);
  pen.setAntiAlias(true);
  canvas.attachPen(pen);
  canvas.drawPoint(100, 100);
  canvas.drawPoints(points, drawing.PointMode.POINTS);
  canvas.drawPoints(points, drawing.PointMode.LINES);
  canvas.drawPoints(points, drawing.PointMode.POLYGON);
  canvas.drawLine(10, 180, 190, 180);
  canvas.detachPen();
}

/**
 * Fill the canvas with colors and a background brush.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintColorAndBackground(canvas: drawing.Canvas): void {
  canvas.clear(rgba(255, 0xF5, 0xF5, 0xF5));
  canvas.drawColor(rgba(0, 0x00, 0x00, 0x00), drawing.BlendMode.SRC_OVER);
  canvas.drawColor(0x11, 0x22, 0x33, 0x44);
  canvas.drawColor(0x7F112233);

  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0xFF, 0xFF, 0xFF));
  canvas.drawBackground(brush);
}

/**
 * Draw a region shape.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintRegion(canvas: drawing.Canvas): void {
  const region: drawing.Region = new drawing.Region(20, 20, 120, 120);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x55, 0x99, 0xEE));
  canvas.attachBrush(brush);
  canvas.drawRegion(region);
  canvas.detachBrush();
}

/**
 * Draw every basic shape in one pass, used by the page entry.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintBasicShapes(canvas: drawing.Canvas): void {
  canvas.clear(rgba(255, 0xFF, 0xFF, 0xFF));
  paintRects(canvas);
  paintRoundRects(canvas);
  paintCirclesAndOvals(canvas);
  paintArcs(canvas);
  paintPointsAndLines(canvas);
  paintRegion(canvas);
}
