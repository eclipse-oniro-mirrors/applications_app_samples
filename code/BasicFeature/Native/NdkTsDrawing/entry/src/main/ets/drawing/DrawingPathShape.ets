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
import { ltrb, point } from './DrawingTypes';

/**
 * Build the five pointed star path used by the main page.
 *
 * @returns { drawing.Path } Closed star path.
 */
export function createStarPath(): drawing.Path {
  const height: number = 600;
  const width: number = 600;
  const len: number = height / 4;
  const aX: number = width / 3;
  const aY: number = height / 6;
  const dX: number = aX - len * Math.sin(18.0);
  const dY: number = aY + len * Math.cos(18.0);
  const cX: number = aX + len * Math.sin(18.0);
  const cY: number = dY;
  const bX: number = aX + (len / 2.0);
  const bY: number = aY + Math.sqrt((cX - dX) * (cX - dX) + (len / 2.0) * (len / 2.0));
  const eX: number = aX - (len / 2.0);
  const eY: number = bY;

  const path: drawing.Path = new drawing.Path();
  path.moveTo(aX, aY);
  path.lineTo(bX, bY);
  path.lineTo(cX, cY);
  path.lineTo(dX, dY);
  path.lineTo(eX, eY);
  path.close();
  return path;
}

/**
 * Build a path with an arc tangent segment.
 *
 * @returns { drawing.Path } Path containing an arc.
 */
export function createArcPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(20, 20);
  path.arcTo(20, 20, 120, 120, 0, 90);
  path.lineTo(180, 180);
  return path;
}

/**
 * Build a path with quadratic and cubic bezier segments.
 *
 * @returns { drawing.Path } Bezier path.
 */
export function createBezierPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(10, 150);
  path.quadTo(60, 20, 110, 150);
  path.cubicTo(130, 60, 170, 60, 190, 150);
  return path;
}

/**
 * Build a path with conic segments, absolute and relative.
 *
 * @returns { drawing.Path } Conic path.
 */
export function createConicPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(10, 100);
  path.conicTo(60, 20, 110, 100, 0.5);
  path.rConicTo(30, -40, 60, 0, 0.8);
  return path;
}

/**
 * Build a path using relative move and line segments only.
 *
 * @returns { drawing.Path } Relative path.
 */
export function createRelativePath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.rMoveTo(20, 20);
  path.rLineTo(60, 0);
  path.rQuadTo(20, 40, 40, 0);
  path.rCubicTo(20, -30, 40, -30, 60, 0);
  return path;
}

/**
 * Build a path from primitive shapes.
 *
 * @returns { drawing.Path } Path containing arc, circle, oval, rect and round rect.
 */
export function createPrimitivePath(): drawing.Path {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 80, 80), 12, 12);
  const path: drawing.Path = new drawing.Path();
  path.addArc(ltrb(0, 0, 40, 40), 0, 180);
  path.addCircle(100, 100, 20, drawing.PathDirection.CLOCKWISE);
  path.addOval(ltrb(0, 60, 60, 100), 0, drawing.PathDirection.COUNTER_CLOCKWISE);
  path.addRect(ltrb(120, 120, 180, 180));
  path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
  return path;
}

/**
 * Build a path by combining two paths, transforming and offsetting it.
 *
 * @returns { drawing.Path } Combined path.
 */
export function createCombinedPath(): drawing.Path {
  const base: drawing.Path = new drawing.Path();
  base.addRect(ltrb(10, 10, 90, 90));

  const other: drawing.Path = new drawing.Path();
  other.addCircle(90, 90, 40);

  base.addPath(other);

  const delta: drawing.Matrix = new drawing.Matrix();
  delta.setTranslation(0, 0);
  base.addPath(other, delta);

  base.op(other, drawing.PathOp.UNION);
  base.transform(delta);
  const shifted: drawing.Path = base.offset(5, 5);
  return shifted;
}

/**
 * Build a polygon path from a point array.
 *
 * @param { boolean } close - Whether the polygon is closed.
 * @returns { drawing.Path } Polygon path.
 */
export function createPolygonPath(close: boolean): drawing.Path {
  const points: common2D.Point[] = [point(20, 20), point(100, 40), point(60, 120), point(10, 90)];
  const path: drawing.Path = new drawing.Path();
  path.addPolygon(points, close);
  return path;
}

/**
 * Build a path from svg path commands.
 *
 * @param { string } svg - Svg path string, for example "M10 10 L100 10 L100 100 Z".
 * @returns { drawing.Path } Parsed path, empty when the svg string is invalid.
 */
export function createSvgPath(svg: string): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  const parsed: boolean = path.buildFromSvgString(svg);
  if (!parsed) {
    return new drawing.Path();
  }
  return path;
}

/**
 * Build a path by copying another path with both the copy constructor and set.
 *
 * @param { drawing.Path } source - Source path.
 * @returns { drawing.Path } Copied path.
 */
export function createPathFromPath(source: drawing.Path): drawing.Path {
  const copy: drawing.Path = new drawing.Path(source);
  const target: drawing.Path = new drawing.Path();
  target.set(copy);
  return target;
}
