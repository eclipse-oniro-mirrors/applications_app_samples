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

import { describe, expect, it } from '@ohos/hypium';
import { drawing } from '@kit.ArkGraphics2D';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  buildRotateMatrix,
  buildScaleMatrix,
  buildSinCosMatrix,
  buildSkewMatrix,
  buildTranslateMatrix,
  concatMatrix,
  createIdentityMatrix,
  fitRectToRect,
  invertMatrix,
  mapPoints,
  mapRadius,
  mapRect,
  matrixFromValues,
  matrixValueAt,
  matricesEqual,
  MatrixSnapshot,
  paintMatrixShowcase,
  polyToPoly,
  polyToPolyShowcase,
  prePostMatrix,
  snapshotMatrix
} from '../../../main/ets/drawing/DrawingMatrix';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, readPixelBuffer, runCase, throwsOn } from './DrawingTestRunner';

export default function drawingMatrixTest() {
  describe('DrawingMatrixTest', () => {
    /**
     * @tc.number SUB_MATRIX_0100
     * @tc.name testMatrix0001
     * @tc.desc Verify the identity matrix flags and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0001', 0, async (done: Function) => {
      await runCase('testMatrix0001', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(createIdentityMatrix());
        expect(snapshot.identity).assertTrue();
        expect(snapshot.affine).assertTrue();
        expect(snapshot.rectStaysRect).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0200
     * @tc.name testMatrix0002
     * @tc.desc Verify the nine values of the identity matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0002', 0, async (done: Function) => {
      await runCase('testMatrix0002', async () => {
        const values: number[] = snapshotMatrix(createIdentityMatrix()).values;
        expect(values.length).assertEqual(9);
        expect(values[0]).assertEqual(1);
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0300
     * @tc.name testMatrix0003
     * @tc.desc Verify the rotation matrix is not identity any more.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0003', 0, async (done: Function) => {
      await runCase('testMatrix0003', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildRotateMatrix(30));
        expect(snapshot.identity).assertFalse();
        expect(snapshot.rectStaysRect).assertFalse();
        expect(snapshot.values.length).assertEqual(9);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0400
     * @tc.name testMatrix0004
     * @tc.desc Verify the scale matrix multiplies the diagonal three times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0004', 0, async (done: Function) => {
      await runCase('testMatrix0004', async () => {
        const values: number[] = snapshotMatrix(buildScaleMatrix(2, 2)).values;
        expect(values[0]).assertEqual(8);
        expect(values[4]).assertEqual(8);
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0500
     * @tc.name testMatrix0005
     * @tc.desc Verify the scale matrix around a pivot adds a translation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0005', 0, async (done: Function) => {
      await runCase('testMatrix0005', async () => {
        const values: number[] = snapshotMatrix(buildScaleMatrix(3, 3)).values;
        expect(values[0]).assertEqual(27);
        expect(values[4]).assertEqual(27);
        expect(values[2] === 0).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0600
     * @tc.name testMatrix0006
     * @tc.desc Verify the translation matrix sums the three translations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0006', 0, async (done: Function) => {
      await runCase('testMatrix0006', async () => {
        const values: number[] = snapshotMatrix(buildTranslateMatrix(10, 15)).values;
        expect(values[2]).assertEqual(30);
        expect(values[5]).assertEqual(45);
        expect(values[0]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0700
     * @tc.name testMatrix0007
     * @tc.desc Verify the skew matrix keeps the perspective value and adds a skew term.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0007', 0, async (done: Function) => {
      await runCase('testMatrix0007', async () => {
        const values: number[] = snapshotMatrix(buildSkewMatrix(0.5, 0.5)).values;
        expect(values[1] === 0).assertFalse();
        expect(values[3] === 0).assertFalse();
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0800
     * @tc.name testMatrix0008
     * @tc.desc Verify the sine cosine matrix builds a quarter turn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0008', 0, async (done: Function) => {
      await runCase('testMatrix0008', async () => {
        const values: number[] = snapshotMatrix(buildSinCosMatrix(1, 0)).values;
        expect(Math.abs(values[0]) < 0.0001).assertTrue();
        expect(Math.abs(Math.abs(values[1]) - 1) < 0.0001).assertTrue();
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_0900
     * @tc.name testMatrix0009
     * @tc.desc Verify the concatenation of a translation and a scale.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0009', 0, async (done: Function) => {
      await runCase('testMatrix0009', async () => {
        const translated: drawing.Matrix = buildTranslateMatrix(3, 6);
        const scaled: drawing.Matrix = buildScaleMatrix(2, 2);
        const values: number[] = snapshotMatrix(concatMatrix(translated, scaled)).values;
        expect(values.length).assertEqual(9);
        expect(values[0] === 0).assertFalse();
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1000
     * @tc.name testMatrix0010
     * @tc.desc Verify the base matrix is kept after pre and post concatenation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0010', 0, async (done: Function) => {
      await runCase('testMatrix0010', async () => {
        const base: drawing.Matrix = buildTranslateMatrix(2, 4);
        const delta: drawing.Matrix = buildScaleMatrix(2, 2);
        const result: drawing.Matrix = prePostMatrix(base, delta);
        expect(matricesEqual(result, base)).assertTrue();
        expect(snapshotMatrix(result).values[2]).assertEqual(6);
        expect(snapshotMatrix(result).values[5]).assertEqual(12);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1100
     * @tc.name testMatrix0011
     * @tc.desc Invert a scale matrix and verify the reciprocal diagonal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0011', 0, async (done: Function) => {
      await runCase('testMatrix0011', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        const values: number[] = snapshotMatrix(invertMatrix(matrix)).values;
        expect(values[0]).assertEqual(0.5);
        expect(values[4]).assertEqual(0.5);
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1200
     * @tc.name testMatrix0012
     * @tc.desc Verify a singular matrix falls back to the identity matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0012', 0, async (done: Function) => {
      await runCase('testMatrix0012', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([0, 0, 0, 0, 0, 0, 0, 0, 0]);
        const snapshot: MatrixSnapshot = snapshotMatrix(invertMatrix(matrix));
        expect(snapshot.identity).assertTrue();
        expect(snapshot.values[0]).assertEqual(1);
        expect(snapshot.values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1300
     * @tc.name testMatrix0013
     * @tc.desc Map two points with a translation matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0013', 0, async (done: Function) => {
      await runCase('testMatrix0013', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 20);
        const flat: number[] = mapPoints(matrix, [point(0, 0), point(5, 5)]);
        expect(flat.length).assertEqual(4);
        expect(flat[0]).assertEqual(10);
        expect(flat[3]).assertEqual(25);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1400
     * @tc.name testMatrix0014
     * @tc.desc Verify mapping an empty point array is rejected while one point still maps.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0014', 0, async (done: Function) => {
      await runCase('testMatrix0014', async () => {
        const rejected: boolean = throwsOn(() => mapPoints(createIdentityMatrix(), []));
        const flat: number[] = mapPoints(createIdentityMatrix(), [point(1, 1)]);
        expect(rejected).assertTrue();
        expect(flat.length).assertEqual(2);
        expect(matricesEqual(createIdentityMatrix(), createIdentityMatrix())).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1500
     * @tc.name testMatrix0015
     * @tc.desc Map a radius with a scale matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0015', 0, async (done: Function) => {
      await runCase('testMatrix0015', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        expect(mapRadius(matrix, 10)).assertEqual(20);
        expect(mapRadius(matrix, 0)).assertEqual(0);
        expect(mapRadius(createIdentityMatrix(), 7)).assertEqual(7);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1600
     * @tc.name testMatrix0016
     * @tc.desc Map a rectangle with a scale matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0016', 0, async (done: Function) => {
      await runCase('testMatrix0016', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        const flat: number[] = mapRect(matrix, ltrb(0, 0, 10, 10));
        expect(flat.length).assertEqual(4);
        expect(flat[2]).assertEqual(20);
        expect(flat[3]).assertEqual(20);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1700
     * @tc.name testMatrix0017
     * @tc.desc Fit one rectangle into another with the fill mode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0017', 0, async (done: Function) => {
      await runCase('testMatrix0017', async () => {
        const ok: boolean = fitRectToRect(ltrb(0, 0, 10, 10), ltrb(0, 0, 20, 20), drawing.ScaleToFit.FILL_SCALE_TO_FIT);
        expect(ok).assertTrue();
        expect(ok === false).assertFalse();
        expect(matricesEqual(createIdentityMatrix(), new drawing.Matrix())).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1800
     * @tc.name testMatrix0018
     * @tc.desc Verify the start mode of the rectangle fitting keeps the aspect ratio.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0018', 0, async (done: Function) => {
      await runCase('testMatrix0018', async () => {
        const ok: boolean =
          fitRectToRect(ltrb(0, 0, 40, 20), ltrb(0, 0, 40, 40), drawing.ScaleToFit.START_SCALE_TO_FIT);
        expect(ok).assertTrue();
        expect(fitRectToRect(ltrb(0, 0, 10, 10), ltrb(0, 0, 10, 10),
          drawing.ScaleToFit.CENTER_SCALE_TO_FIT)).assertTrue();
        expect(fitRectToRect(ltrb(0, 0, 10, 10), ltrb(0, 0, 10, 10), drawing.ScaleToFit.END_SCALE_TO_FIT)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_1900
     * @tc.name testMatrix0019
     * @tc.desc Map a three point polygon onto another polygon.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0019', 0, async (done: Function) => {
      await runCase('testMatrix0019', async () => {
        const ok: boolean = polyToPoly([point(0, 0), point(100, 0), point(0, 100)],
          [point(10, 10), point(120, 20), point(20, 130)]);
        expect(ok).assertTrue();
        expect(polyToPolyShowcase()).assertTrue();
        expect(ok === false).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2000
     * @tc.name testMatrix0020
     * @tc.desc Verify a single point polygon cannot build the matrix and more than four points are rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0020', 0, async (done: Function) => {
      await runCase('testMatrix0020', async () => {
        const single: boolean = polyToPoly([point(0, 0)], [point(10, 10)]);
        const rejected: boolean = throwsOn(() => polyToPoly(
          [point(0, 0), point(1, 0), point(1, 1), point(0, 1), point(2, 2)],
          [point(0, 0), point(1, 0), point(1, 1), point(0, 1), point(2, 2)]));
        expect(single).assertTrue();
        expect(rejected).assertTrue();
        expect(matricesEqual(createIdentityMatrix(), new drawing.Matrix())).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2100
     * @tc.name testMatrix0021
     * @tc.desc Read one value of the identity matrix by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0021', 0, async (done: Function) => {
      await runCase('testMatrix0021', async () => {
        const matrix: drawing.Matrix = createIdentityMatrix();
        expect(matrixValueAt(matrix, 0)).assertEqual(1);
        expect(matrixValueAt(matrix, 1)).assertEqual(0);
        expect(matrixValueAt(matrix, 8)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2200
     * @tc.name testMatrix0022
     * @tc.desc Compare equal and different matrices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0022', 0, async (done: Function) => {
      await runCase('testMatrix0022', async () => {
        expect(matricesEqual(createIdentityMatrix(), createIdentityMatrix())).assertTrue();
        expect(matricesEqual(createIdentityMatrix(), buildTranslateMatrix(1, 1))).assertFalse();
        expect(matricesEqual(buildTranslateMatrix(1, 1), buildTranslateMatrix(1, 1))).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2300
     * @tc.name testMatrix0023
     * @tc.desc Build a matrix from a nine value array and read it back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0023', 0, async (done: Function) => {
      await runCase('testMatrix0023', async () => {
        const values: number[] = matrixFromValues(3);
        expect(values.length).assertEqual(9);
        expect(values[0]).assertEqual(3);
        expect(values[4]).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2400
     * @tc.name testMatrix0024
     * @tc.desc Verify the perspective value of the matrix built from values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0024', 0, async (done: Function) => {
      await runCase('testMatrix0024', async () => {
        const values: number[] = matrixFromValues(1);
        expect(values[0]).assertEqual(1);
        expect(values[4]).assertEqual(1);
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2500
     * @tc.name testMatrix0025
     * @tc.desc Draw a matrix transformed rectangle on the offscreen canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMatrix0025', 0, async (done: Function) => {
      await runCase('testMatrix0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintMatrixShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2600
     * @tc.name testMatrix0026
     * @tc.desc Draw the matrix showcase twice on the same canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0026', 0, async (done: Function) => {
      await runCase('testMatrix0026', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintMatrixShowcase(target.canvas);
        paintMatrixShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2700
     * @tc.name testMatrix0027
     * @tc.desc Verify the translate matrix keeps the perspective row.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0027', 0, async (done: Function) => {
      await runCase('testMatrix0027', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildTranslateMatrix(-5, -5));
        expect(snapshot.values[6]).assertEqual(0);
        expect(snapshot.values[7]).assertEqual(0);
        expect(snapshot.affine).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_MATRIX_2800
     * @tc.name testMatrix0028
     * @tc.desc Verify the rotation matrix keeps the rectangle flag false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMatrix0028', 0, async (done: Function) => {
      await runCase('testMatrix0028', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildRotateMatrix(90));
        expect(snapshot.rectStaysRect).assertFalse();
        expect(snapshot.affine).assertTrue();
        expect(snapshot.values.length).assertEqual(9);
      }, done);
    });
  });
}
