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
 * Snapshot of the matrix state.
 */
export interface MatrixSnapshot {
  affine: boolean;
  identity: boolean;
  rectStaysRect: boolean;
  values: number[];
}

/**
 * Create an identity matrix.
 *
 * @returns { drawing.Matrix } Identity matrix.
 */
export function createIdentityMatrix(): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.reset();
  return matrix;
}

/**
 * Build a matrix with a rotation around the given pivot.
 *
 * @param { number } degree - Rotation degree.
 * @returns { drawing.Matrix } Rotation matrix.
 */
export function buildRotateMatrix(degree: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setRotation(degree, 100, 100);
  matrix.preRotate(degree / 2, 100, 100);
  matrix.postRotate(degree / 4, 100, 100);
  return matrix;
}

/**
 * Build a matrix with a scale around the given pivot.
 *
 * @param { number } sx - Horizontal scale.
 * @param { number } sy - Vertical scale.
 * @returns { drawing.Matrix } Scale matrix.
 */
export function buildScaleMatrix(sx: number, sy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setScale(sx, sy, 100, 100);
  matrix.preScale(sx, sy, 100, 100);
  matrix.postScale(sx, sy, 100, 100);
  return matrix;
}

/**
 * Build a matrix with a translation.
 *
 * @param { number } dx - Horizontal translation.
 * @param { number } dy - Vertical translation.
 * @returns { drawing.Matrix } Translation matrix.
 */
export function buildTranslateMatrix(dx: number, dy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setTranslation(dx, dy);
  matrix.preTranslate(dx, dy);
  matrix.postTranslate(dx, dy);
  return matrix;
}

/**
 * Build a matrix with a skew around the given pivot.
 *
 * @param { number } kx - Horizontal skew factor.
 * @param { number } ky - Vertical skew factor.
 * @returns { drawing.Matrix } Skew matrix.
 */
export function buildSkewMatrix(kx: number, ky: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setSkew(kx, ky, 0, 0);
  matrix.preSkew(kx, ky, 0, 0);
  matrix.postSkew(kx, ky, 0, 0);
  return matrix;
}

/**
 * Build a matrix from a sine cosine pair.
 *
 * @param { number } sinValue - Sine value.
 * @param { number } cosValue - Cosine value.
 * @returns { drawing.Matrix } Rotation matrix built from the pair.
 */
export function buildSinCosMatrix(sinValue: number, cosValue: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setSinCos(sinValue, cosValue, 100, 100);
  return matrix;
}

/**
 * Concatenate two matrices into a new one.
 *
 * @param { drawing.Matrix } first - First matrix.
 * @param { drawing.Matrix } second - Second matrix.
 * @returns { drawing.Matrix } Concatenated matrix.
 */
export function concatMatrix(first: drawing.Matrix, second: drawing.Matrix): drawing.Matrix {
  const result: drawing.Matrix = new drawing.Matrix();
  result.setConcat(first, second);
  return result;
}

/**
 * Apply the delta matrix before and after the base matrix.
 *
 * @param { drawing.Matrix } base - Base matrix.
 * @param { drawing.Matrix } delta - Delta matrix.
 * @returns { drawing.Matrix } Matrix with both pre and post concatenation.
 */
export function prePostMatrix(base: drawing.Matrix, delta: drawing.Matrix): drawing.Matrix {
  const result: drawing.Matrix = new drawing.Matrix(base);
  result.preConcat(delta);
  result.postConcat(delta);
  result.setMatrix(base);
  return result;
}

/**
 * Invert a matrix.
 *
 * @param { drawing.Matrix } matrix - Source matrix.
 * @returns { drawing.Matrix } Inverted matrix, identity when not invertible.
 */
export function invertMatrix(matrix: drawing.Matrix): drawing.Matrix {
  const inverted: drawing.Matrix = new drawing.Matrix();
  const ok: boolean = matrix.invert(inverted);
  if (!ok) {
    return new drawing.Matrix();
  }
  return inverted;
}

/**
 * Map points with a matrix.
 *
 * @param { drawing.Matrix } matrix - Transform matrix.
 * @param { common2D.Point[] } points - Source points.
 * @returns { number[] } Flat mapped coordinates.
 */
export function mapPoints(matrix: drawing.Matrix, points: common2D.Point[]): number[] {
  const mapped: common2D.Point[] = matrix.mapPoints(points);
  const flat: number[] = [];
  for (let index: number = 0; index < mapped.length; index++) {
    flat.push(mapped[index].x);
    flat.push(mapped[index].y);
  }
  return flat;
}

/**
 * Map a radius with a matrix.
 *
 * @param { drawing.Matrix } matrix - Transform matrix.
 * @param { number } radius - Source radius.
 * @returns { number } Mapped radius.
 */
export function mapRadius(matrix: drawing.Matrix, radius: number): number {
  return matrix.mapRadius(radius);
}

/**
 * Map a rectangle with a matrix.
 *
 * @param { drawing.Matrix } matrix - Transform matrix.
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { number[] } Mapped left, top, right and bottom.
 */
export function mapRect(matrix: drawing.Matrix, rect: common2D.Rect): number[] {
  const dst: common2D.Rect = ltrb(0, 0, 0, 0);
  const ok: boolean = matrix.mapRect(dst, rect);
  if (!ok) {
    return [];
  }
  const result: number[] = [dst.left, dst.top, dst.right, dst.bottom];
  return result;
}

/**
 * Fit a source rectangle into a destination rectangle.
 *
 * @param { common2D.Rect } src - Source rectangle.
 * @param { common2D.Rect } dst - Destination rectangle.
 * @param { drawing.ScaleToFit } mode - Scale mode.
 * @returns { boolean } Whether the matrix could be built.
 */
export function fitRectToRect(src: common2D.Rect, dst: common2D.Rect, mode: drawing.ScaleToFit): boolean {
  const matrix: drawing.Matrix = new drawing.Matrix();
  return matrix.setRectToRect(src, dst, mode);
}

/**
 * Map a polygon onto another polygon.
 *
 * @param { common2D.Point[] } src - Source points.
 * @param { common2D.Point[] } dst - Destination points.
 * @returns { boolean } Whether the matrix could be built.
 */
export function polyToPoly(src: common2D.Point[], dst: common2D.Point[]): boolean {
  const matrix: drawing.Matrix = new drawing.Matrix();
  const count: number = Math.min(src.length, dst.length);
  return matrix.setPolyToPoly(src, dst, count);
}

/**
 * Read the matrix state.
 *
 * @param { drawing.Matrix } matrix - Source matrix.
 * @returns { MatrixSnapshot } Matrix state snapshot.
 */
export function snapshotMatrix(matrix: drawing.Matrix): MatrixSnapshot {
  const snapshot: MatrixSnapshot = {
    affine: matrix.isAffine(),
    identity: matrix.isIdentity(),
    rectStaysRect: matrix.rectStaysRect(),
    values: matrix.getAll()
  };
  return snapshot;
}

/**
 * Read one matrix value by index.
 *
 * @param { drawing.Matrix } matrix - Source matrix.
 * @param { number } index - Value index in the nine value matrix.
 * @returns { number } Matrix value at the index.
 */
export function matrixValueAt(matrix: drawing.Matrix, index: number): number {
  return matrix.getValue(index);
}

/**
 * Compare two matrices.
 *
 * @param { drawing.Matrix } first - First matrix.
 * @param { drawing.Matrix } second - Second matrix.
 * @returns { boolean } Whether both matrices are equal.
 */
export function matricesEqual(first: drawing.Matrix, second: drawing.Matrix): boolean {
  return first.isEqual(second);
}

/**
 * Build a matrix from a nine value array and read it back.
 *
 * @param { number } scale - Scale applied on the diagonal.
 * @returns { number[] } Nine values of the built matrix.
 */
export function matrixFromValues(scale: number): number[] {
  const matrix: drawing.Matrix = new drawing.Matrix();
  const values: number[] = [scale, 0, 0, 0, scale, 0, 0, 0, 1];
  matrix.setMatrix(values);
  return matrix.getAll();
}

/**
 * Draw a rectangle transformed by a matrix.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 */
export function paintMatrixShowcase(canvas: drawing.Canvas): void {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(20, 20, 80, 60));
  const matrix: drawing.Matrix = buildRotateMatrix(20);
  path.transform(matrix);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor({ alpha: 255, red: 0x22, green: 0x88, blue: 0xCC });
  canvas.attachBrush(brush);
  canvas.drawPath(path);
  canvas.drawRect(ltrb(100, 100, 180, 160));
  canvas.detachBrush();
}

/**
 * Build a matrix from a three point polygon mapping, used by the page entry.
 *
 * @returns { boolean } Whether the polygon mapping succeeded.
 */
export function polyToPolyShowcase(): boolean {
  const src: common2D.Point[] = [point(0, 0), point(100, 0), point(0, 100)];
  const dst: common2D.Point[] = [point(10, 10), point(120, 20), point(20, 130)];
  return polyToPoly(src, dst);
}
