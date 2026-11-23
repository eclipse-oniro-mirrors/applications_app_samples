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

// Geometry computed by the draw() methods of common/*RenderNode*.ets before they call the drawing APIs.
// screenWidth stands for display.getDefaultDisplaySync().width used by every render node.

// Mirrors the five-pointed star of PathRenderNode (PathWithBrush): len, A point.
export const STAR_LENGTH: number = 120.0;
export const STAR_A_X: number = 150.0;
export const STAR_A_Y: number = 80.0;
// Mirrors the polygon star of PathRenderNode (PathWithPen).
export const POLY_CENTER_X: number = 450.0;
export const POLY_CENTER_Y: number = 180.0;
export const POLY_OUTER_RADIUS: number = 80;
export const POLY_INNER_RADIUS: number = 30;
export const POLY_POINTS: number = 5;
// Mirrors the pentagon region of ShapeRenderNode.
export const PENTAGON_CENTER_X: number = 70;
export const PENTAGON_CENTER_Y: number = 600;
export const PENTAGON_SIDE: number = 60;
// Mirrors the shape grid of ShapeRenderNode: rect / round rect / line / arc rows.
export const SHAPE_TOP: number = 150;
export const SHAPE_BOTTOM: number = 250;
export const ROUND_RADIUS: number = 20;
export const CANVAS_START_X: number = 100.0;
export const CANVAS_START_Y: number = 100.0;

// Mirrors common2D.Rect values computed by the render nodes.
export class RectBox {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;

  constructor(left: number, top: number, right: number, bottom: number) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
  }
}

// Mirrors the star points of PathRenderNode: dX = aX - len * Math.sin(18.0), dY = aY + len * Math.cos(18.0) ...
export function starPointX(index: number, aX: number, len: number): number {
  const dX: number = aX - len * Math.sin(18.0);
  const cX: number = aX + len * Math.sin(18.0);
  switch (index) {
    case 0:
      return aX;
    case 1:
      return aX + (len / 2.0);
    case 2:
      return cX;
    case 3:
      return dX;
    case 4:
      return aX - (len / 2.0);
    default:
      return Number.NaN;
  }
}

// Mirrors the star points of PathRenderNode: bY = aY + sqrt((cX - dX)^2 + (len / 2)^2), cY = dY, eY = bY.
export function starPointY(index: number, aY: number, len: number): number {
  const dX: number = STAR_A_X - len * Math.sin(18.0);
  const cX: number = STAR_A_X + len * Math.sin(18.0);
  const dY: number = aY + len * Math.cos(18.0);
  const bY: number = aY + Math.sqrt((cX - dX) * (cX - dX) + (len / 2.0) * (len / 2.0));
  switch (index) {
    case 0:
      return aY;
    case 1:
      return bY;
    case 2:
      return dY;
    case 3:
      return dY;
    case 4:
      return bY;
    default:
      return Number.NaN;
  }
}

// Mirrors the alternating radius of the PathWithPen loop: outer radius on even vertices.
export function polygonRadiusOf(i: number, outerRadius: number, innerRadius: number): number {
  return i % 2 === 0 ? outerRadius : innerRadius;
}

// Mirrors angle = (i * Math.PI) / points of the PathWithPen loop.
export function polygonAngleOf(i: number, points: number): number {
  return (i * Math.PI) / points;
}

// Mirrors x = centerX + radius * Math.cos(angle + 60.0).
export function polygonVertexX(i: number, centerX: number, points: number): number {
  const radius: number = polygonRadiusOf(i, POLY_OUTER_RADIUS, POLY_INNER_RADIUS);
  return centerX + radius * Math.cos(polygonAngleOf(i, points) + 60.0);
}

// Mirrors y = centerY + radius * Math.sin(angle + 60.0).
export function polygonVertexY(i: number, centerY: number, points: number): number {
  const radius: number = polygonRadiusOf(i, POLY_OUTER_RADIUS, POLY_INNER_RADIUS);
  return centerY + radius * Math.sin(polygonAngleOf(i, points) + 60.0);
}

// Mirrors the loop bound of the PathWithPen star: points * 2 vertices.
export function polygonVertexCount(points: number): number {
  return points * 2;
}

// Mirrors x = centerX + sideLength * Math.cos(angle - 60) of the pentagon region (angle = 2 * PI / 5 * i).
export function pentagonVertexX(i: number, centerX: number, sideLength: number): number {
  const angle: number = (2 * Math.PI / 5) * i;
  return centerX + sideLength * Math.cos(angle - 60);
}

// Mirrors y = centerY - sideLength * Math.sin(angle - 60) of the pentagon region.
export function pentagonVertexY(i: number, centerY: number, sideLength: number): number {
  const angle: number = (2 * Math.PI / 5) * i;
  return centerY - sideLength * Math.sin(angle - 60);
}

// Mirrors the second ShapeRenderNode panel: every y is shifted by dis = screenWidth / 2.
export function panelOffsetOf(screenWidth: number): number {
  return screenWidth / 2;
}

// Mirrors const w = screenWidth / 4 of ShapeRenderNode.
export function shapeColumnWidthOf(screenWidth: number): number {
  return screenWidth / 4;
}

// Mirrors the Rect of ShapeRenderNode: { left: 20, top: 150, right: w - 20, bottom: 250 }.
export function shapeRectOf(screenWidth: number, offsetY: number): RectBox {
  const w: number = shapeColumnWidthOf(screenWidth);
  return new RectBox(20, SHAPE_TOP + offsetY, w - 20, SHAPE_BOTTOM + offsetY);
}

// Mirrors the RoundRect bounds: { left: w + 20, top: 150, right: w * 2 - 20, bottom: 250 }.
export function roundRectOf(screenWidth: number, offsetY: number): RectBox {
  const w: number = shapeColumnWidthOf(screenWidth);
  return new RectBox(w + 20, SHAPE_TOP + offsetY, w * 2 - 20, SHAPE_BOTTOM + offsetY);
}

// Mirrors drawLine(w * 2 + 20, 200, w * 3 - 20, 200): the segment length.
export function shapeLineLengthOf(screenWidth: number): number {
  const w: number = shapeColumnWidthOf(screenWidth);
  return (w * 3 - 20) - (w * 2 + 20);
}

// Mirrors the arc bounds: { left: w * 3 - 50, top: 150, right: w * 4 - 20, bottom: 350 }.
export function arcRectOf(screenWidth: number, offsetY: number): RectBox {
  const w: number = shapeColumnWidthOf(screenWidth);
  return new RectBox(w * 3 - 50, SHAPE_TOP + offsetY, w * 4 - 20, 350 + offsetY);
}

// Mirrors drawCircle(w * 3 / 2, 400, 50): the circle center x.
export function shapeCircleCenterXOf(screenWidth: number): number {
  return shapeColumnWidthOf(screenWidth) * 3 / 2;
}

// Mirrors drawPoint(80.0 + w, 580.0): the point x.
export function shapePointXOf(screenWidth: number): number {
  return 80.0 + shapeColumnWidthOf(screenWidth);
}

// Mirrors clip.setRect(10, 600 + dis, 690, 850 + dis) of the second panel.
export function clipRectOf(screenWidth: number): RectBox {
  const dis: number = panelOffsetOf(screenWidth);
  return new RectBox(10, 600 + dis, 690, 850 + dis);
}

// Mirrors w = h = screenWidth / 8 of CanvasRenderNode.
export function canvasCellOf(screenWidth: number): number {
  return screenWidth / 8;
}

// Mirrors textSize = screenWidth / 25 (CanvasRenderNode, ComplexRenderNode, ImageRenderNode, TextBlobRenderNode).
export function smallTextSizeOf(screenWidth: number): number {
  return screenWidth / 25;
}

// Mirrors font.setSize(screenWidth / 20) of PathRenderNode.
export function pathTextSizeOf(screenWidth: number): number {
  return screenWidth / 20;
}

// Mirrors the CanvasRenderNode rows: startY = 100, 100 + screenWidth / 3 and 100 + screenWidth.
export function canvasRowStartYOf(screenWidth: number, row: number): number {
  if (row === 0) {
    return CANVAS_START_Y;
  }
  if (row === 1) {
    return CANVAS_START_Y + screenWidth / 3;
  }
  return CANVAS_START_Y + screenWidth;
}

// Mirrors drawCircle(startX + k * w, startY + h, w): the circle center x of column k.
export function canvasCircleXOf(screenWidth: number, k: number): number {
  return CANVAS_START_X + k * canvasCellOf(screenWidth);
}

// Mirrors canvas.rotate(15, startX + screenWidth / 2, startY + textSize + 100): the pivot x.
export function rotatePivotXOf(screenWidth: number): number {
  return CANVAS_START_X + screenWidth / 2;
}

// Mirrors canvas.rotate(15, ..., startY + textSize + 100) for the second row: the pivot y.
export function rotatePivotYOf(screenWidth: number): number {
  return canvasRowStartYOf(screenWidth, 1) + smallTextSizeOf(screenWidth) + 100;
}

// Mirrors startX2 = startX + screenWidth / 3 of the rotated rectangle.
export function rotatedRectLeftOf(screenWidth: number): number {
  return CANVAS_START_X + screenWidth / 3;
}

// Mirrors const w = screenWidth / 6 of MyRenderNodePath and the path nodes of PathRenderNode.
export function pathColumnWidthOf(screenWidth: number): number {
  return screenWidth / 6;
}

// Mirrors drawTextBlob(stringImage, screenWidth / 3, y) of ImageRenderNode / TextBlobRenderNode.
export function titleXOf(screenWidth: number): number {
  return screenWidth / 3;
}

// Mirrors the bounding box width of a RectBox (right - left).
export function rectWidthOf(box: RectBox): number {
  return box.right - box.left;
}

// Mirrors the bounding box height of a RectBox (bottom - top).
export function rectHeightOf(box: RectBox): number {
  return box.bottom - box.top;
}

// Mirrors the layout of one ShapeRenderNode panel for a given screen width.
export class ShapePanelLayout {
  screenWidth: number = 0;
  offsetY: number = 0;
  columns: number = 4;

  constructor(screenWidth: number, secondPanel: boolean) {
    this.screenWidth = screenWidth;
    this.offsetY = secondPanel ? panelOffsetOf(screenWidth) : 0;
  }

  // Mirrors the label x of column index (startX1 = 20, startX2 = w, startX3 = w * 2 + 30, startX4 = w * 3 + 10).
  labelX(column: number): number {
    const w: number = shapeColumnWidthOf(this.screenWidth);
    switch (column) {
      case 0:
        return 20;
      case 1:
        return w;
      case 2:
        return w * 2 + 30;
      case 3:
        return w * 3 + 10;
      default:
        return -1;
    }
  }

  // Mirrors the shape rows: label baseline 120 and shape top 150 shifted by the panel offset.
  labelY(): number {
    return 120 + this.offsetY;
  }

  // Mirrors the width of the plain rectangle of the panel.
  rectWidth(): number {
    return rectWidthOf(shapeRectOf(this.screenWidth, this.offsetY));
  }

  // Mirrors the width of the round rectangle of the panel.
  roundRectWidth(): number {
    return rectWidthOf(roundRectOf(this.screenWidth, this.offsetY));
  }

  // Mirrors the line y of drawLine(...) in the panel.
  lineY(): number {
    return 200 + this.offsetY;
  }
}
