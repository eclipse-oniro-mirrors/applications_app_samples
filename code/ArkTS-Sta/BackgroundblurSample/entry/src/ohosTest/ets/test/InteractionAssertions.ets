/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Rect } from '@ohos.UiTest';
import { expect } from '@ohos/hypium';
import { bounds, driver, DrawingGeometry, readDrawingGeometry } from './SharedDriver';

export const DRAWING_POSITION_PRECISION: number = 1 / 8192;

export function assertUnclippedGeometry(actual: Rect, drawing: DrawingGeometry): void {
  expect(drawing.width > 0 && drawing.height > 0).assertTrue();
  expect(Math.abs(actual.left - drawing.left) < 1).assertTrue();
  expect(Math.abs(actual.right - drawing.left - drawing.width) < 1).assertTrue();
  expect(Math.abs(actual.top - drawing.top) < 1).assertTrue();
  expect(Math.abs(actual.bottom - drawing.top - drawing.height) < 1).assertTrue();
}

export function sameRect(first: Rect, second: Rect): boolean {
  return first.left === second.left && first.top === second.top &&
    first.right === second.right && first.bottom === second.bottom;
}

export function assertSameRect(actual: Rect, expected: Rect): void {
  expect(actual.left).assertEqual(expected.left);
  expect(actual.right).assertEqual(expected.right);
  expect(actual.top).assertEqual(expected.top);
  expect(actual.bottom).assertEqual(expected.bottom);
}

export async function waitForOriginalRect(id: string, expected: Rect): Promise<void> {
  const deadline = Date.now() + 1800;
  let matchingSamples = 0;
  while (Date.now() < deadline) {
    matchingSamples = sameRect(await bounds(id), expected) ? matchingSamples + 1 : 0;
    if (matchingSamples >= 2) return;
    await driver().delayMs(80);
  }
  throw new Error('Component did not remain at its original geometry: ' + id);
}

export async function waitForOriginalDrawingGeometry(id: string,
  expected: DrawingGeometry): Promise<DrawingGeometry> {
  const deadline = Date.now() + 1800;
  let matchingSamples = 0;
  let actual = readDrawingGeometry(id);
  while (Date.now() < deadline) {
    actual = readDrawingGeometry(id);
    const matches = actual.left === expected.left && actual.width === expected.width &&
      actual.height === expected.height && Math.abs(actual.top - expected.top) <= DRAWING_POSITION_PRECISION;
    matchingSamples = matches ? matchingSamples + 1 : 0;
    if (matchingSamples >= 2) return actual;
    await driver().delayMs(80);
  }
  throw new Error('Component did not return to its original drawing geometry: ' + id +
    ', expected=' + JSON.stringify(expected) + ', actual=' + JSON.stringify(actual));
}

export async function settledRect(id: string): Promise<Rect> {
  const idle = await driver().waitForIdle(200, 1200);
  if (!idle) throw new Error('Component did not become idle: ' + id);
  const deadline = Date.now() + 1800;
  let previous = await bounds(id);
  let matchingSamples = 0;
  while (Date.now() < deadline) {
    await driver().delayMs(100);
    const current = await bounds(id);
    matchingSamples = sameRect(previous, current) ? matchingSamples + 1 : 0;
    if (matchingSamples >= 2) return current;
    previous = current;
  }
  throw new Error('Component geometry did not settle: ' + id);
}
