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
import { ltrb, rgba } from './DrawingTypes';

/**
 * Save count observed while drawing with canvas state stack.
 */
export interface SaveStateSnapshot {
  before: number;
  afterSave: number;
  afterRestore: number;
  layerCount: number;
}

/**
 * Draw a shape inside a save/restore pair and report the save count transitions.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { SaveStateSnapshot } Save count before saving, after saving and after restoring.
 */
export function paintWithSaveRestore(canvas: drawing.Canvas): SaveStateSnapshot {
  const before: number = canvas.getSaveCount();
  canvas.save();
  const afterSave: number = canvas.getSaveCount();
  canvas.translate(20, 20);
  canvas.rotate(15, 90, 90);
  canvas.scale(1.2, 1.2);
  canvas.skew(0.1, 0.1);

  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x00, 0xAA, 0x66));
  canvas.attachBrush(brush);
  canvas.drawRect(ltrb(10, 10, 90, 60));
  canvas.detachBrush();

  canvas.restore();
  const afterRestore: number = canvas.getSaveCount();
  const snapshot: SaveStateSnapshot = {
    before: before,
    afterSave: afterSave,
    afterRestore: afterRestore,
    layerCount: afterRestore
  };
  return snapshot;
}

/**
 * Draw inside a saved layer and return the save count after the layer is pushed.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { number } Save count while the layer is active.
 */
export function paintWithLayers(canvas: drawing.Canvas): number {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(0x80, 0x33, 0x99, 0xFF));
  const layerCount: number = canvas.saveLayer(ltrb(0, 0, 200, 200), brush);
  canvas.drawRect(ltrb(30, 30, 170, 170));
  canvas.restore();
  canvas.saveLayer();
  canvas.restore();
  return layerCount;
}

/**
 * Apply translate, scale, rotate and skew, then read back the total matrix.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { number[] } Nine matrix values of the current transform.
 */
export function paintWithTransforms(canvas: drawing.Canvas): number[] {
  canvas.translate(10, 15);
  canvas.scale(1.5, 1.5);
  canvas.rotate(30, 100, 100);
  canvas.skew(0.2, 0.2);
  const matrix: drawing.Matrix = canvas.getTotalMatrix();
  return matrix.getAll();
}

/**
 * Replace the canvas matrix with a prepared one and restore it afterwards.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { number[] } Matrix values after resetting to identity.
 */
export function paintWithMatrix(canvas: drawing.Canvas): number[] {
  const delta: drawing.Matrix = new drawing.Matrix();
  delta.setTranslation(30, 40);
  canvas.concatMatrix(delta);

  const absolute: drawing.Matrix = new drawing.Matrix();
  absolute.setScale(2, 2, 0, 0);
  canvas.setMatrix(absolute);

  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x99, 0x33, 0x00));
  canvas.attachBrush(brush);
  canvas.drawRect(ltrb(5, 5, 45, 45));
  canvas.detachBrush();

  canvas.resetMatrix();
  const matrix: drawing.Matrix = canvas.getTotalMatrix();
  return matrix.getAll();
}

/**
 * Read the nine values of the canvas total matrix.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { number[] } Matrix values row by row.
 */
export function describeTransform(canvas: drawing.Canvas): number[] {
  const matrix: drawing.Matrix = canvas.getTotalMatrix();
  const values: number[] = matrix.getAll();
  return values;
}

/**
 * Read the local clip bounds of the canvas.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @returns { common2D.Rect } Clip bounds in canvas coordinates.
 */
export function localClipBounds(canvas: drawing.Canvas): common2D.Rect {
  return canvas.getLocalClipBounds();
}
