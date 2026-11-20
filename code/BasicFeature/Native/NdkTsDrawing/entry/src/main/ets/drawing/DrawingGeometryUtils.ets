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
 * Create an empty rectangle.
 *
 * @returns { common2D.Rect } Empty rectangle.
 */
export function emptyRect(): common2D.Rect {
  return drawing.RectUtils.makeEmpty();
}

/**
 * Build a rectangle from four edges with makeLtrb.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { common2D.Rect } Rectangle.
 */
export function makeRect(left: number, top: number, right: number, bottom: number): common2D.Rect {
  return drawing.RectUtils.makeLtrb(left, top, right, bottom);
}

/**
 * Read the rectangle geometry.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { number[] } Left, top, right, bottom, width, height, center x and center y.
 */
export function rectSnapshot(rect: common2D.Rect): number[] {
  const snapshot: number[] = [
    rect.left, rect.top, rect.right, rect.bottom,
    drawing.RectUtils.getWidth(rect),
    drawing.RectUtils.getHeight(rect),
    drawing.RectUtils.centerX(rect),
    drawing.RectUtils.centerY(rect)
  ];
  return snapshot;
}

/**
 * Query whether a point is inside a rectangle.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { boolean } Whether the point is contained.
 */
export function rectContainsPoint(rect: common2D.Rect, x: number, y: number): boolean {
  return drawing.RectUtils.contains(rect, x, y);
}

/**
 * Query whether another rectangle is fully contained.
 *
 * @param { common2D.Rect } rect - Outer rectangle.
 * @param { common2D.Rect } other - Inner rectangle.
 * @returns { boolean } Whether the inner rectangle is contained.
 */
export function rectContainsRect(rect: common2D.Rect, other: common2D.Rect): boolean {
  return drawing.RectUtils.contains(rect, other);
}

/**
 * Query whether an edge rectangle is fully contained.
 *
 * @param { common2D.Rect } rect - Outer rectangle.
 * @param { common2D.Rect } other - Inner rectangle given by edges.
 * @returns { boolean } Whether the edge rectangle is contained.
 */
export function rectContainsLtrb(rect: common2D.Rect, other: common2D.Rect): boolean {
  return drawing.RectUtils.contains(rect, other.left, other.top, other.right, other.bottom);
}

/**
 * Intersect two rectangles, the first one is not modified.
 *
 * @param { common2D.Rect } rect - First rectangle.
 * @param { common2D.Rect } other - Second rectangle.
 * @returns { common2D.Rect } Intersection rectangle.
 */
export function rectIntersect(rect: common2D.Rect, other: common2D.Rect): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.intersect(target, other);
  return target;
}

/**
 * Query whether two rectangles intersect.
 *
 * @param { common2D.Rect } rect - First rectangle.
 * @param { common2D.Rect } other - Second rectangle.
 * @returns { boolean } Whether both rectangles intersect.
 */
export function rectIsIntersect(rect: common2D.Rect, other: common2D.Rect): boolean {
  return drawing.RectUtils.isIntersect(rect, other);
}

/**
 * Union two rectangles, the first one is not modified.
 *
 * @param { common2D.Rect } rect - First rectangle.
 * @param { common2D.Rect } other - Second rectangle.
 * @returns { common2D.Rect } Union rectangle.
 */
export function rectUnion(rect: common2D.Rect, other: common2D.Rect): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.union(target, other);
  return target;
}

/**
 * Inset a rectangle on every edge.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @param { number } delta - Inset value applied on every edge.
 * @returns { common2D.Rect } Inset rectangle.
 */
export function rectInset(rect: common2D.Rect, delta: number): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.inset(target, delta, delta, delta, delta);
  return target;
}

/**
 * Offset a rectangle.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { common2D.Rect } Offset rectangle.
 */
export function rectOffset(rect: common2D.Rect, dx: number, dy: number): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.offset(target, dx, dy);
  return target;
}

/**
 * Move the rectangle origin to a new left top corner.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @param { number } left - New left edge.
 * @param { number } top - New top edge.
 * @returns { common2D.Rect } Moved rectangle.
 */
export function rectOffsetTo(rect: common2D.Rect, left: number, top: number): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.offsetTo(target, left, top);
  return target;
}

/**
 * Sort the rectangle edges so left is not greater than right.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { common2D.Rect } Sorted rectangle.
 */
export function rectSort(rect: common2D.Rect): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.sort(target);
  return target;
}

/**
 * Query whether a rectangle is empty.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { boolean } Whether the rectangle is empty.
 */
export function rectIsEmpty(rect: common2D.Rect): boolean {
  return drawing.RectUtils.isEmpty(rect);
}

/**
 * Compare two rectangles.
 *
 * @param { common2D.Rect } first - First rectangle.
 * @param { common2D.Rect } second - Second rectangle.
 * @returns { boolean } Whether both rectangles are equal.
 */
export function rectIsEqual(first: common2D.Rect, second: common2D.Rect): boolean {
  return drawing.RectUtils.isEqual(first, second);
}

/**
 * Copy a rectangle.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { common2D.Rect } Copied rectangle.
 */
export function rectCopy(rect: common2D.Rect): common2D.Rect {
  return drawing.RectUtils.makeCopy(rect);
}

/**
 * Overwrite a rectangle with the edges of another rectangle.
 *
 * @param { common2D.Rect } rect - Target rectangle.
 * @param { common2D.Rect } other - Source rectangle.
 * @returns { common2D.Rect } Updated rectangle.
 */
export function rectSetRect(rect: common2D.Rect, other: common2D.Rect): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.setRect(target, other);
  return target;
}

/**
 * Overwrite a rectangle with explicit edges.
 *
 * @param { common2D.Rect } rect - Target rectangle.
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { common2D.Rect } Updated rectangle.
 */
export function rectSetLtrb(rect: common2D.Rect, left: number, top: number, right: number,
  bottom: number): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.setLtrb(target, left, top, right, bottom);
  return target;
}

/**
 * Empty a rectangle.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { common2D.Rect } Empty rectangle.
 */
export function rectSetEmpty(rect: common2D.Rect): common2D.Rect {
  const target: common2D.Rect = drawing.RectUtils.makeCopy(rect);
  drawing.RectUtils.setEmpty(target);
  return target;
}

/**
 * Create a region from four edges with the constructor.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Region } Region.
 */
export function regionFromRect(left: number, top: number, right: number, bottom: number): drawing.Region {
  return new drawing.Region(left, top, right, bottom);
}

/**
 * Create a region with setRect on a fresh region.
 *
 * @param { common2D.Rect } rect - Source rectangle.
 * @returns { drawing.Region } Region built from the rectangle.
 */
export function regionFromSetRect(rect: common2D.Rect): drawing.Region {
  const region: drawing.Region = new drawing.Region();
  region.setRect(rect.left, rect.top, rect.right, rect.bottom);
  return region;
}

/**
 * Read the region bounds.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { number[] } Left, top, right and bottom of the region bounds.
 */
export function regionSnapshot(region: drawing.Region): number[] {
  const bounds: common2D.Rect = region.getBounds();
  const snapshot: number[] = [bounds.left, bounds.top, bounds.right, bounds.bottom];
  return snapshot;
}

/**
 * Query whether a point is inside the region.
 *
 * @param { drawing.Region } region - Source region.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { boolean } Whether the point is contained.
 */
export function regionContainsPoint(region: drawing.Region, x: number, y: number): boolean {
  return region.isPointContained(x, y);
}

/**
 * Query whether another region is fully contained.
 *
 * @param { drawing.Region } region - Outer region.
 * @param { drawing.Region } other - Inner region.
 * @returns { boolean } Whether the inner region is contained.
 */
export function regionContainsRegion(region: drawing.Region, other: drawing.Region): boolean {
  return region.isRegionContained(other);
}

/**
 * Combine two regions with a region operator.
 *
 * @param { drawing.Region } region - Target region.
 * @param { drawing.Region } other - Other region.
 * @param { drawing.RegionOp } op - Region operator.
 * @returns { boolean } Whether the operation produced a new region.
 */
export function regionOp(region: drawing.Region, other: drawing.Region, op: drawing.RegionOp): boolean {
  return region.op(other, op);
}

/**
 * Query whether a rectangle can be rejected quickly.
 *
 * @param { drawing.Region } region - Source region.
 * @param { common2D.Rect } rect - Candidate rectangle.
 * @returns { boolean } Whether the rectangle is rejected.
 */
export function regionQuickReject(region: drawing.Region, rect: common2D.Rect): boolean {
  return region.quickReject(rect.left, rect.top, rect.right, rect.bottom);
}

/**
 * Query whether another region can be rejected quickly.
 *
 * @param { drawing.Region } region - Source region.
 * @param { drawing.Region } other - Candidate region.
 * @returns { boolean } Whether the other region is rejected.
 */
export function regionQuickRejectRegion(region: drawing.Region, other: drawing.Region): boolean {
  return region.quickRejectRegion(other);
}

/**
 * Query whether a rectangle is fully inside the region.
 *
 * @param { drawing.Region } region - Source region.
 * @param { common2D.Rect } rect - Candidate rectangle.
 * @returns { boolean } Whether the rectangle is fully contained.
 */
export function regionQuickContains(region: drawing.Region, rect: common2D.Rect): boolean {
  return region.quickContains(rect.left, rect.top, rect.right, rect.bottom);
}

/**
 * Build the boundary path of a region.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { drawing.Path } Boundary path.
 */
export function regionBoundaryPath(region: drawing.Region): drawing.Path {
  return region.getBoundaryPath();
}

/**
 * Build a region from a path.
 *
 * @param { drawing.Path } path - Source path.
 * @returns { drawing.Region } Region set from the path, empty when parsing fails.
 */
export function regionFromPath(path: drawing.Path): drawing.Region {
  const region: drawing.Region = new drawing.Region();
  const clip: drawing.Region = new drawing.Region(0, 0, 2000, 2000);
  const ok: boolean = region.setPath(path, clip);
  if (!ok) {
    return new drawing.Region();
  }
  return region;
}

/**
 * Query whether the region is a single rectangle.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { boolean } Whether the region is a rectangle.
 */
export function regionIsRect(region: drawing.Region): boolean {
  return region.isRect();
}

/**
 * Query whether the region is complex.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { boolean } Whether the region holds more than one rectangle.
 */
export function regionIsComplex(region: drawing.Region): boolean {
  return region.isComplex();
}

/**
 * Query whether the region is empty.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { boolean } Whether the region is empty.
 */
export function regionIsEmpty(region: drawing.Region): boolean {
  return region.isEmpty();
}

/**
 * Copy a region with the copy constructor and setRegion.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { drawing.Region } Copied region.
 */
export function regionCopy(region: drawing.Region): drawing.Region {
  const copy: drawing.Region = new drawing.Region(region);
  const target: drawing.Region = new drawing.Region();
  target.setRegion(copy);
  return target;
}

/**
 * Offset a region.
 *
 * @param { drawing.Region } region - Source region.
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { drawing.Region } Offset region.
 */
export function regionOffset(region: drawing.Region, dx: number, dy: number): drawing.Region {
  const copy: drawing.Region = regionCopy(region);
  copy.offset(dx, dy);
  return copy;
}

/**
 * Compare two regions.
 *
 * @param { drawing.Region } first - First region.
 * @param { drawing.Region } second - Second region.
 * @returns { boolean } Whether both regions are equal.
 */
export function regionIsEqual(first: drawing.Region, second: drawing.Region): boolean {
  return first.isEqual(second);
}

/**
 * Empty a region with setEmpty.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { drawing.Region } Empty region.
 */
export function regionSetEmpty(region: drawing.Region): drawing.Region {
  const copy: drawing.Region = regionCopy(region);
  copy.setEmpty();
  return copy;
}

/**
 * Read the four corner radii of a rounded rectangle.
 *
 * @returns { number[] } Eight numbers, x and y for each corner.
 */
export function roundRectCorners(): number[] {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
  roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 4, 4);
  roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 6, 6);
  roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 10, 10);
  roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 12, 12);
  const corners: number[] = [];
  const positions: drawing.CornerPos[] = [
    drawing.CornerPos.TOP_LEFT_POS,
    drawing.CornerPos.TOP_RIGHT_POS,
    drawing.CornerPos.BOTTOM_RIGHT_POS,
    drawing.CornerPos.BOTTOM_LEFT_POS
  ];
  for (let index: number = 0; index < positions.length; index++) {
    const corner: common2D.Point = roundRect.getCorner(positions[index]);
    corners.push(corner.x);
    corners.push(corner.y);
  }
  return corners;
}

/**
 * Offset a rounded rectangle and read its corners.
 *
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { number[] } Eight numbers after offsetting.
 */
export function roundRectSnapshot(dx: number, dy: number): number[] {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 10, 10);
  roundRect.offset(dx, dy);
  const copy: drawing.RoundRect = new drawing.RoundRect(roundRect);
  const corners: number[] = [];
  const positions: drawing.CornerPos[] = [
    drawing.CornerPos.TOP_LEFT_POS,
    drawing.CornerPos.TOP_RIGHT_POS,
    drawing.CornerPos.BOTTOM_RIGHT_POS,
    drawing.CornerPos.BOTTOM_LEFT_POS
  ];
  for (let index: number = 0; index < positions.length; index++) {
    const corner: common2D.Point = copy.getCorner(positions[index]);
    corners.push(corner.x);
    corners.push(corner.y);
  }
  return corners;
}

/**
 * Negate a point.
 *
 * @param { common2D.Point } source - Source point.
 * @returns { number[] } Negated coordinates.
 */
export function negatePoint(source: common2D.Point): number[] {
  const target: common2D.Point = point(source.x, source.y);
  drawing.PointUtils.negate(target);
  const result: number[] = [target.x, target.y];
  return result;
}

/**
 * Offset a point.
 *
 * @param { common2D.Point } source - Source point.
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { number[] } Offset coordinates.
 */
export function offsetPoint(source: common2D.Point, dx: number, dy: number): number[] {
  const target: common2D.Point = point(source.x, source.y);
  drawing.PointUtils.offset(target, dx, dy);
  const result: number[] = [target.x, target.y];
  return result;
}

/**
 * Build sampling options with a filter mode.
 *
 * @param { drawing.FilterMode } mode - Filter mode.
 * @returns { drawing.SamplingOptions } Sampling options.
 */
export function samplingOptions(mode: drawing.FilterMode): drawing.SamplingOptions {
  return new drawing.SamplingOptions(mode);
}

/**
 * Build sampling options with the default constructor.
 *
 * @returns { drawing.SamplingOptions } Default sampling options.
 */
export function defaultSamplingOptions(): drawing.SamplingOptions {
  return new drawing.SamplingOptions();
}

/**
 * Convert a resource color into a common2D color with the drawing tool.
 *
 * @returns { common2D.Color } Converted color.
 */
export function colorFromResource(): common2D.Color {
  return drawing.Tool.makeColorFromResourceColor($r('app.color.sample_blue_color'));
}
