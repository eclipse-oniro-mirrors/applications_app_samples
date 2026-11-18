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
 * Summary of a path, filled by one single call so cases can assert several fields.
 */
export interface PathSummary {
  isEmpty: boolean;
  isClosed: boolean;
  length: number;
  pointCount: number;
  verbCount: number;
  left: number;
  top: number;
  right: number;
  bottom: number;
}

/**
 * Read the path iterator verb name.
 *
 * @param { drawing.PathIteratorVerb } verb - Iterator verb.
 * @returns { string } Readable verb name.
 */
export function verbName(verb: drawing.PathIteratorVerb): string {
  switch (verb) {
    case drawing.PathIteratorVerb.MOVE:
      return 'MOVE';
    case drawing.PathIteratorVerb.LINE:
      return 'LINE';
    case drawing.PathIteratorVerb.QUAD:
      return 'QUAD';
    case drawing.PathIteratorVerb.CONIC:
      return 'CONIC';
    case drawing.PathIteratorVerb.CUBIC:
      return 'CUBIC';
    case drawing.PathIteratorVerb.CLOSE:
      return 'CLOSE';
    default:
      return 'DONE';
  }
}

/**
 * Collect bounds, length and segment counts of a path.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { PathSummary } Path summary.
 */
export function summarize(path: drawing.Path): PathSummary {
  const bounds: common2D.Rect = path.getBounds();
  const points: common2D.Point[] = path.getPointData();
  const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
  const summary: PathSummary = {
    isEmpty: path.isEmpty(),
    isClosed: path.isClosed(),
    length: path.getLength(true),
    pointCount: points.length,
    verbCount: verbs.length,
    left: bounds.left,
    top: bounds.top,
    right: bounds.right,
    bottom: bounds.bottom
  };
  return summary;
}

/**
 * Query whether a point is inside the path area.
 *
 * @param { drawing.Path } path - Source path.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { boolean } Whether the point is contained.
 */
export function queryContains(path: drawing.Path, x: number, y: number): boolean {
  return path.contains(x, y);
}

/**
 * Query the path length.
 *
 * @param { drawing.Path } path - Source path.
 * @param { boolean } forceClosed - Whether open contours are treated as closed.
 * @returns { number } Path length in px.
 */
export function queryLength(path: drawing.Path, forceClosed: boolean): number {
  return path.getLength(forceClosed);
}

/**
 * Query position and tangent at a distance along the path.
 *
 * @param { drawing.Path } path - Source path.
 * @param { number } distance - Distance from the path start.
 * @returns { number[] } Position x, position y, tangent x, tangent y.
 */
export function queryPositionAndTangent(path: drawing.Path, distance: number): number[] {
  const position: common2D.Point = point(0, 0);
  const tangent: common2D.Point = point(0, 0);
  const ok: boolean = path.getPositionAndTangent(true, distance, position, tangent);
  if (!ok) {
    return [];
  }
  const result: number[] = [position.x, position.y, tangent.x, tangent.y];
  return result;
}

/**
 * Extract a segment of the path into a new path.
 *
 * @param { drawing.Path } path - Source path.
 * @param { number } start - Start distance.
 * @param { number } stop - Stop distance.
 * @returns { drawing.Path } Extracted segment path.
 */
export function extractSegment(path: drawing.Path, start: number, stop: number): drawing.Path {
  const dst: drawing.Path = new drawing.Path();
  const ok: boolean = path.getSegment(true, start, stop, true, dst);
  if (!ok) {
    return new drawing.Path();
  }
  return dst;
}

/**
 * Query whether the path is a single rectangle.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { boolean } Whether the path is a rectangle.
 */
export function queryIsRect(path: drawing.Path): boolean {
  const rect: common2D.Rect = ltrb(0, 0, 0, 0);
  return path.isRect(rect);
}

/**
 * Read the matrix at a distance along the path.
 *
 * @param { drawing.Path } path - Source path.
 * @param { number } distance - Distance from the path start.
 * @returns { number[] } Nine matrix values, empty when the distance is invalid.
 */
export function queryMatrixAt(path: drawing.Path, distance: number): number[] {
  const matrix: drawing.Matrix = new drawing.Matrix();
  const ok: boolean = path.getMatrix(false, distance, matrix,
    drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
  if (!ok) {
    return [];
  }
  return matrix.getAll();
}

/**
 * Convert the path into an svg path string.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { string } Svg path string.
 */
export function svgRoundTrip(path: drawing.Path): string {
  return path.convertToSvgString();
}

/**
 * Collect path verbs from the verb data array.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { string[] } Verb names in order.
 */
export function collectVerbs(path: drawing.Path): string[] {
  const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
  const names: string[] = [];
  for (let index: number = 0; index < verbs.length; index++) {
    names.push(verbName(verbs[index]));
  }
  return names;
}

/**
 * Collect path points as flat x, y numbers.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { number[] } Flat coordinate array.
 */
export function collectPoints(path: drawing.Path): number[] {
  const points: common2D.Point[] = path.getPointData();
  const flat: number[] = [];
  for (let index: number = 0; index < points.length; index++) {
    flat.push(points[index].x);
    flat.push(points[index].y);
  }
  return flat;
}

/**
 * Collect conic weights of the path.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { number[] } Conic weights.
 */
export function collectConicWeights(path: drawing.Path): number[] {
  return path.getConicWeightData();
}

/**
 * Walk the path with a path iterator.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { string[] } Verb names reported by the iterator.
 */
export function iterateVerbs(path: drawing.Path): string[] {
  const iterator: drawing.PathIterator = path.getPathIterator();
  const names: string[] = [];
  names.push(verbName(iterator.peek()));
  const points: common2D.Point[] = [];
  for (let index: number = 0; index < 8; index++) {
    points.push(point(0, 0));
  }
  let guard: number = 0;
  while (iterator.hasNext() && guard < 256) {
    const verb: drawing.PathIteratorVerb = iterator.next(points, 0);
    names.push(verbName(verb));
    if (verb === drawing.PathIteratorVerb.DONE) {
      break;
    }
    guard = guard + 1;
  }
  return names;
}

/**
 * Approximate the path with a point array.
 *
 * @param { drawing.Path } path - Source path.
 * @param { number } error - Acceptable error.
 * @returns { number[] } Approximated coordinate array.
 */
export function approximatePath(path: drawing.Path, error: number): number[] {
  return path.approximate(error);
}

/**
 * Interpolate between two paths.
 *
 * @param { drawing.Path } start - Start path.
 * @param { drawing.Path } end - End path.
 * @param { number } weight - Interpolation weight, 0 returns start, 1 returns end.
 * @returns { drawing.Path } Interpolated path.
 */
export function interpolatePath(start: drawing.Path, end: drawing.Path, weight: number): drawing.Path {
  const result: drawing.Path = new drawing.Path();
  const ok: boolean = start.interpolate(end, weight, result);
  if (!ok) {
    return new drawing.Path();
  }
  return result;
}

/**
 * Query whether two paths can be interpolated.
 *
 * @param { drawing.Path } start - Start path.
 * @param { drawing.Path } end - End path.
 * @returns { boolean } Whether the paths are interpolatable.
 */
export function pathsInterpolatable(start: drawing.Path, end: drawing.Path): boolean {
  return start.isInterpolate(end);
}

/**
 * Query whether two paths are equal.
 *
 * @param { drawing.Path } first - First path.
 * @param { drawing.Path } second - Second path.
 * @returns { boolean } Whether both paths are equal.
 */
export function pathsEqual(first: drawing.Path, second: drawing.Path): boolean {
  return first.isEqual(second);
}

/**
 * Set the fill type and read it back.
 *
 * @param { drawing.Path } path - Target path.
 * @param { drawing.PathFillType } type - Fill type to apply.
 * @returns { number[] } Applied fill type value.
 */
export function fillTypeRoundTrip(path: drawing.Path, type: drawing.PathFillType): number[] {
  path.setFillType(type);
  const applied: number = path.getFillType();
  const result: number[] = [applied];
  return result;
}

/**
 * Read the inverse fill flag after toggling it.
 *
 * @param { drawing.Path } path - Target path.
 * @returns { boolean } Inverse fill flag after toggling.
 */
export function inverseFillFlag(path: drawing.Path): boolean {
  path.toggleInverseFillType();
  return path.isInverseFillType();
}

/**
 * Move the last point of the path and read it back.
 *
 * @param { drawing.Path } path - Target path.
 * @param { number } x - New horizontal coordinate.
 * @param { number } y - New vertical coordinate.
 * @returns { number[] } New last point coordinates.
 */
export function setLastPoint(path: drawing.Path, x: number, y: number): number[] {
  path.setLastPoint(x, y);
  const last: common2D.Point = path.getLastPoint();
  const result: number[] = [last.x, last.y];
  return result;
}

/**
 * Read the last point of the path.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { number[] } Last point coordinates.
 */
export function lastPoint(path: drawing.Path): number[] {
  const last: common2D.Point = path.getLastPoint();
  const result: number[] = [last.x, last.y];
  return result;
}

/**
 * Reset the path and report whether it became empty.
 *
 * @param { drawing.Path } path - Target path.
 * @returns { boolean } Whether the path is empty after resetting.
 */
export function resetPath(path: drawing.Path): boolean {
  path.reset();
  return path.isEmpty();
}

/**
 * Rewind the path and report whether it became empty.
 *
 * @param { drawing.Path } path - Target path.
 * @returns { boolean } Whether the path is empty after rewinding.
 */
export function rewindPath(path: drawing.Path): boolean {
  path.rewind();
  return path.isEmpty();
}
