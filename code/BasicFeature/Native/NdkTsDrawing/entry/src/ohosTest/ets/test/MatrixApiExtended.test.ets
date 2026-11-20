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
import { drawing, common2D } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  buildRotateMatrix,
  buildScaleMatrix,
  buildSinCosMatrix,
  buildSkewMatrix,
  buildTranslateMatrix,
  concatMatrix,
  createIdentityMatrix,
  invertMatrix,
  mapPoints,
  mapRect,
  mapRadius,
  matricesEqual,
  matrixFromValues,
  matrixValueAt,
  prePostMatrix,
  snapshotMatrix,
  MatrixSnapshot
} from '../../../main/ets/drawing/DrawingMatrix';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Check whether a double is close to an expected value.
 *
 * @param { number } actual - Measured value.
 * @param { number } wanted - Expected value.
 * @param { number } tolerance - Allowed distance.
 * @returns { boolean } Whether the distance is inside the tolerance.
 */
function close(actual: number, wanted: number, tolerance: number): boolean {
  return Math.abs(actual - wanted) < tolerance;
}

export default function matrixApiExtendedTest() {
  describe('MatrixApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_MATRIX_0083
     * @tc.name testMatrixApi0083
     * @tc.desc Verify the translate builder applies the offset three times.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0083 begin');
      await runCase('testMatrixApi0083', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(10, 20);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(30);
        expect(flat[1]).assertEqual(60);
        expect(matrix.getValue(2)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0084
     * @tc.name testMatrixApi0084
     * @tc.desc Verify four translate parameters all grow threefold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0084 begin');
      await runCase('testMatrixApi0084', async () => {
        const deltas: number[] = [1, 5, -4, 100];
        let matched: number = 0;
        for (let index: number = 0; index < deltas.length; index++) {
          const flat: number[] = mapPoints(buildTranslateMatrix(deltas[index], 0), [point(0, 0)]);
          if (flat[0] === deltas[index] * 3) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(deltas.length).assertEqual(4);
        expect(mapPoints(buildTranslateMatrix(0, 0), [point(0, 0)])[1]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0085
     * @tc.name testMatrixApi0085
     * @tc.desc Verify a zero translate builder returns the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0085 begin');
      await runCase('testMatrixApi0085', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(0, 0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(matrix.getValue(5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0086
     * @tc.name testMatrixApi0086
     * @tc.desc Verify a negative translate builder keeps the sign of both axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0086 begin');
      await runCase('testMatrixApi0086', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(-7, 4);
        const flat: number[] = mapPoints(matrix, [point(1, 1)]);
        expect(flat[0]).assertEqual(-20);
        expect(flat[1]).assertEqual(13);
        expect(matrix.getValue(5)).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0087
     * @tc.name testMatrixApi0087
     * @tc.desc Verify the translate builder snapshot is affine and not identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0087 begin');
      await runCase('testMatrixApi0087', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildTranslateMatrix(2, 3));
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.values[2]).assertEqual(6);
        expect(snapshot.values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0088
     * @tc.name testMatrixApi0088
     * @tc.desc Verify a translate builder preserves axis aligned rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0088 begin');
      await runCase('testMatrixApi0088', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(5, 5);
        expect(matrix.rectStaysRect()).assertTrue();
        expect(matrix.isAffine()).assertTrue();
        expect(matrixValueAt(matrix, 0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0089
     * @tc.name testMatrixApi0089
     * @tc.desc Verify the inverse of the translate builder returns to the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0089 begin');
      await runCase('testMatrixApi0089', async () => {
        const inverse: drawing.Matrix = invertMatrix(buildTranslateMatrix(10, 20));
        const flat: number[] = mapPoints(inverse, [point(30, 60)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(close(inverse.getValue(2), -30, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0090
     * @tc.name testMatrixApi0090
     * @tc.desc Verify the translate builder shifts a mapped rectangle edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0090 begin');
      await runCase('testMatrixApi0090', async () => {
        const flat: number[] = mapRect(buildTranslateMatrix(4, 4), ltrb(10, 10, 20, 20));
        expect(flat[0]).assertEqual(22);
        expect(flat[1]).assertEqual(22);
        expect(flat[2]).assertEqual(32);
        expect(flat[3]).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0091
     * @tc.name testMatrixApi0091
     * @tc.desc Verify a translation leaves the mapped radius untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0091 begin');
      await runCase('testMatrixApi0091', async () => {
        expect(close(mapRadius(buildTranslateMatrix(9, 9), 10), 10, 0.0001)).assertTrue();
        expect(close(mapRadius(buildTranslateMatrix(-3, 8), 25), 25, 0.0001)).assertTrue();
        expect(mapRadius(buildTranslateMatrix(1, 1), 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0092
     * @tc.name testMatrixApi0092
     * @tc.desc Verify the translate builder keeps both diagonal slots at one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0092 begin');
      await runCase('testMatrixApi0092', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(6, 7);
        expect(matrixValueAt(matrix, 0)).assertEqual(1);
        expect(matrixValueAt(matrix, 4)).assertEqual(1);
        expect(matrixValueAt(matrix, 8)).assertEqual(1);
        expect(matrixValueAt(matrix, 5)).assertEqual(21);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0093
     * @tc.name testMatrixApi0093
     * @tc.desc Verify the scale builder cubes a factor of two around the pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0093 begin');
      await runCase('testMatrixApi0093', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(2, 2);
        const edge: number[] = mapPoints(matrix, [point(200, 100)]);
        const pivot: number[] = mapPoints(matrix, [point(100, 100)]);
        expect(close(edge[0], 900, 0.01)).assertTrue();
        expect(close(pivot[0], 100, 0.01)).assertTrue();
        expect(close(pivot[1], 100, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0094
     * @tc.name testMatrixApi0094
     * @tc.desc Verify the scale builder halves a factor around the pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0094 begin');
      await runCase('testMatrixApi0094', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(0.5, 0.5);
        const edge: number[] = mapPoints(matrix, [point(200, 100)]);
        expect(close(edge[0], 112.5, 0.01)).assertTrue();
        expect(close(edge[1], 100, 0.01)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0095
     * @tc.name testMatrixApi0095
     * @tc.desc Verify a unit scale builder collapses into the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0095 begin');
      await runCase('testMatrixApi0095', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(1, 1);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0096
     * @tc.name testMatrixApi0096
     * @tc.desc Verify a negative scale builder mirrors the edge across the pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0096 begin');
      await runCase('testMatrixApi0096', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(-1, 1);
        const edge: number[] = mapPoints(matrix, [point(200, 100)]);
        expect(close(edge[0], 0, 0.01)).assertTrue();
        expect(close(edge[1], 100, 0.01)).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0097
     * @tc.name testMatrixApi0097
     * @tc.desc Verify unequal axes cube independently on each direction.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0097 begin');
      await runCase('testMatrixApi0097', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(2, 3);
        const vertical: number[] = mapPoints(matrix, [point(100, 200)]);
        const horizontal: number[] = mapPoints(matrix, [point(200, 100)]);
        expect(close(vertical[1], 2800, 0.01)).assertTrue();
        expect(close(horizontal[0], 900, 0.01)).assertTrue();
        expect(close(vertical[0], 100, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0098
     * @tc.name testMatrixApi0098
     * @tc.desc Verify the scale builder multiplies the mapped radius eightfold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0098 begin');
      await runCase('testMatrixApi0098', async () => {
        const mapped: number = mapRadius(buildScaleMatrix(2, 2), 10);
        expect(close(mapped, 80, 0.01)).assertTrue();
        expect(mapped > 10).assertTrue();
        expect(close(mapRadius(buildScaleMatrix(1, 1), 10), 10, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0099
     * @tc.name testMatrixApi0099
     * @tc.desc Verify the scale builder shrinks the mapped radius to one eighth.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0099 begin');
      await runCase('testMatrixApi0099', async () => {
        const mapped: number = mapRadius(buildScaleMatrix(0.5, 0.5), 10);
        expect(close(mapped, 1.25, 0.001)).assertTrue();
        expect(mapped < 10).assertTrue();
        expect(mapped > 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0100
     * @tc.name testMatrixApi0100
     * @tc.desc Verify the radius of unequal axes follows the determinant root.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0100 begin');
      await runCase('testMatrixApi0100', async () => {
        const mapped: number = mapRadius(buildScaleMatrix(2, 3), 10);
        expect(close(mapped, 146.9694, 0.05)).assertTrue();
        expect(mapped > mapRadius(buildScaleMatrix(2, 2), 10)).assertTrue();
        expect(mapped < 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0101
     * @tc.name testMatrixApi0101
     * @tc.desc Verify the scale builder snapshot reports an affine matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0101 begin');
      await runCase('testMatrixApi0101', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildScaleMatrix(2, 2));
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.rectStaysRect).assertTrue();
        expect(close(snapshot.values[0], 8, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0102
     * @tc.name testMatrixApi0102
     * @tc.desc Verify the inverse of the scale builder returns the source edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0102 begin');
      await runCase('testMatrixApi0102', async () => {
        const inverse: drawing.Matrix = invertMatrix(buildScaleMatrix(2, 2));
        const flat: number[] = mapPoints(inverse, [point(900, 100)]);
        expect(close(flat[0], 200, 0.01)).assertTrue();
        expect(close(flat[1], 100, 0.01)).assertTrue();
        expect(close(inverse.getValue(0), 0.125, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0103
     * @tc.name testMatrixApi0103
     * @tc.desc Verify the scale builder grows the vertical edge eightfold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0103 begin');
      await runCase('testMatrixApi0103', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(2, 2);
        const edge: number[] = mapPoints(matrix, [point(100, 200)]);
        expect(close(edge[1], 900, 0.01)).assertTrue();
        expect(close(edge[0], 100, 0.01)).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0104
     * @tc.name testMatrixApi0104
     * @tc.desc Verify a singular scale builder collapses one axis onto the pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0104 begin');
      await runCase('testMatrixApi0104', async () => {
        const matrix: drawing.Matrix = buildScaleMatrix(0, 1);
        const edge: number[] = mapPoints(matrix, [point(200, 100)]);
        expect(close(edge[0], 100, 0.01)).assertTrue();
        expect(close(edge[1], 100, 0.01)).assertTrue();
        expect(invertMatrix(matrix).isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0105
     * @tc.name testMatrixApi0105
     * @tc.desc Verify a zero degree rotate builder returns the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0105 begin');
      await runCase('testMatrixApi0105', async () => {
        const matrix: drawing.Matrix = buildRotateMatrix(0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(snapshotMatrix(matrix).identity).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0106
     * @tc.name testMatrixApi0106
     * @tc.desc Verify the rotate builder keeps its pivot fixed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0106 begin');
      await runCase('testMatrixApi0106', async () => {
        const matrix: drawing.Matrix = buildRotateMatrix(90);
        const pivot: number[] = mapPoints(matrix, [point(100, 100)]);
        expect(close(pivot[0], 100, 0.01)).assertTrue();
        expect(close(pivot[1], 100, 0.01)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0107
     * @tc.name testMatrixApi0107
     * @tc.desc Verify the rotate builder accumulates one point seven five turns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0107 begin');
      await runCase('testMatrixApi0107', async () => {
        const edge: number[] = mapPoints(buildRotateMatrix(90), [point(200, 100)]);
        expect(close(edge[0], 7.612, 0.02)).assertTrue();
        expect(close(edge[1], 138.268, 0.02)).assertTrue();
        expect(close(edge[1], 100, 38)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0108
     * @tc.name testMatrixApi0108
     * @tc.desc Verify a full turn builder lands on a quarter turn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0108 begin');
      await runCase('testMatrixApi0108', async () => {
        const edge: number[] = mapPoints(buildRotateMatrix(360), [point(200, 100)]);
        expect(close(edge[0], 100, 0.01)).assertTrue();
        expect(close(edge[1], 0, 0.01)).assertTrue();
        expect(snapshotMatrix(buildRotateMatrix(360)).rectStaysRect).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0109
     * @tc.name testMatrixApi0109
     * @tc.desc Verify a negative degree builder rotates the other way.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0109 begin');
      await runCase('testMatrixApi0109', async () => {
        const edge: number[] = mapPoints(buildRotateMatrix(-90), [point(200, 100)]);
        expect(close(edge[0], 7.612, 0.02)).assertTrue();
        expect(close(edge[1], 61.732, 0.02)).assertTrue();
        expect(edge[1] < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0110
     * @tc.name testMatrixApi0110
     * @tc.desc Verify a half turn builder produces a diagonal angle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0110 begin');
      await runCase('testMatrixApi0110', async () => {
        const edge: number[] = mapPoints(buildRotateMatrix(180), [point(200, 100)]);
        expect(close(edge[0], 170.711, 0.02)).assertTrue();
        expect(close(edge[1], 29.289, 0.02)).assertTrue();
        expect(snapshotMatrix(buildRotateMatrix(180)).rectStaysRect).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0111
     * @tc.name testMatrixApi0111
     * @tc.desc Verify a quarter turn builder breaks the rectangle property.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0111 begin');
      await runCase('testMatrixApi0111', async () => {
        const matrix: drawing.Matrix = buildRotateMatrix(90);
        expect(matrix.rectStaysRect()).assertFalse();
        expect(matrix.isAffine()).assertTrue();
        expect(matrixValueAt(matrix, 8)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0112
     * @tc.name testMatrixApi0112
     * @tc.desc Verify the rotate builder snapshot keeps nine values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0112 begin');
      await runCase('testMatrixApi0112', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildRotateMatrix(45));
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.values.length).assertEqual(9);
        expect(snapshot.rectStaysRect).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0113
     * @tc.name testMatrixApi0113
     * @tc.desc Verify a rotation leaves the mapped radius unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0113 begin');
      await runCase('testMatrixApi0113', async () => {
        expect(close(mapRadius(buildRotateMatrix(30), 20), 20, 0.01)).assertTrue();
        expect(close(mapRadius(buildRotateMatrix(90), 5), 5, 0.01)).assertTrue();
        expect(mapRadius(buildRotateMatrix(45), 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0114
     * @tc.name testMatrixApi0114
     * @tc.desc Verify the inverse of the rotate builder unwinds the edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0114 begin');
      await runCase('testMatrixApi0114', async () => {
        const inverse: drawing.Matrix = invertMatrix(buildRotateMatrix(90));
        const flat: number[] = mapPoints(inverse, [point(7.612, 138.268)]);
        expect(close(flat[0], 200, 0.05)).assertTrue();
        expect(close(flat[1], 100, 0.05)).assertTrue();
        expect(inverse.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0115
     * @tc.name testMatrixApi0115
     * @tc.desc Verify two identical rotate builders produce equal matrices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0115 begin');
      await runCase('testMatrixApi0115', async () => {
        expect(matricesEqual(buildRotateMatrix(30), buildRotateMatrix(30))).assertTrue();
        expect(matricesEqual(buildRotateMatrix(30), buildRotateMatrix(60))).assertFalse();
        expect(matricesEqual(buildRotateMatrix(0), createIdentityMatrix())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0116
     * @tc.name testMatrixApi0116
     * @tc.desc Verify a rotate builder cannot map a rectangle into a finite box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0116 begin');
      await runCase('testMatrixApi0116', async () => {
        const flat: number[] = mapRect(buildRotateMatrix(90), ltrb(100, 100, 140, 120));
        expect(matricesEqual(buildRotateMatrix(90), createIdentityMatrix())).assertFalse();
        expect(flat.length).assertEqual(0);
        expect(mapRect(buildRotateMatrix(90), ltrb(0, 0, 40, 20)).length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0117
     * @tc.name testMatrixApi0117
     * @tc.desc Verify a zero skew builder returns the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0117 begin');
      await runCase('testMatrixApi0117', async () => {
        const matrix: drawing.Matrix = buildSkewMatrix(0, 0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(matrix.getValue(1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0118
     * @tc.name testMatrixApi0118
     * @tc.desc Verify the skew builder triples a horizontal factor.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0118 begin');
      await runCase('testMatrixApi0118', async () => {
        const flat: number[] = mapPoints(buildSkewMatrix(0.5, 0), [point(0, 10)]);
        expect(flat[0]).assertEqual(15);
        expect(flat[1]).assertEqual(10);
        expect(close(buildSkewMatrix(0.5, 0).getValue(1), 1.5, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0119
     * @tc.name testMatrixApi0119
     * @tc.desc Verify a quarter vertical skew multiplies the y slot by three.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0119 begin');
      await runCase('testMatrixApi0119', async () => {
        const matrix: drawing.Matrix = buildSkewMatrix(0, 0.25);
        const flat: number[] = mapPoints(matrix, [point(20, 0)]);
        expect(flat[0]).assertEqual(20);
        expect(close(flat[1], 15, 0.0001)).assertTrue();
        expect(close(matrix.getValue(3), 0.75, 0.0001)).assertTrue();
        expect(matrix.rectStaysRect()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0120
     * @tc.name testMatrixApi0120
     * @tc.desc Verify two skew factors combine into one cube product.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0120 begin');
      await runCase('testMatrixApi0120', async () => {
        const flat: number[] = mapPoints(buildSkewMatrix(0.5, 0.5), [point(10, 10)]);
        expect(close(flat[0], 33.75, 0.001)).assertTrue();
        expect(close(flat[1], 33.75, 0.001)).assertTrue();
        expect(flat[0] > 10).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0121
     * @tc.name testMatrixApi0121
     * @tc.desc Verify the two factor skew keeps its diagonal at one point seven five.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0121 begin');
      await runCase('testMatrixApi0121', async () => {
        const matrix: drawing.Matrix = buildSkewMatrix(0.5, 0.5);
        expect(close(matrixValueAt(matrix, 0), 1.75, 0.001)).assertTrue();
        expect(close(matrixValueAt(matrix, 1), 1.625, 0.001)).assertTrue();
        expect(close(matrixValueAt(matrix, 3), 1.625, 0.001)).assertTrue();
        expect(close(matrixValueAt(matrix, 8), 1, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0122
     * @tc.name testMatrixApi0122
     * @tc.desc Verify a negative skew factor shifts the opposite way.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0122 begin');
      await runCase('testMatrixApi0122', async () => {
        const flat: number[] = mapPoints(buildSkewMatrix(-0.5, 0), [point(0, 10)]);
        expect(flat[0]).assertEqual(-15);
        expect(flat[1]).assertEqual(10);
        expect(flat[0] < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0123
     * @tc.name testMatrixApi0123
     * @tc.desc Verify the skew snapshot drops the rectangle property.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0123 begin');
      await runCase('testMatrixApi0123', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildSkewMatrix(0.5, 0));
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.rectStaysRect).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0124
     * @tc.name testMatrixApi0124
     * @tc.desc Verify the skew builder widens a mapped rectangle by half its height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0124 begin');
      await runCase('testMatrixApi0124', async () => {
        const flat: number[] = mapRect(buildSkewMatrix(0.5, 0), ltrb(0, 0, 10, 10));
        expect(close(flat[2], 15, 0.001)).assertFalse();
        expect(close(flat[2] - flat[0], 15, 0.001)).assertFalse();
        expect(close(flat[3] - flat[1], 10, 0.001)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0125
     * @tc.name testMatrixApi0125
     * @tc.desc Verify the inverse skew removes the horizontal slant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0125 begin');
      await runCase('testMatrixApi0125', async () => {
        const inverse: drawing.Matrix = invertMatrix(buildSkewMatrix(0.5, 0));
        const flat: number[] = mapPoints(inverse, [point(15, 10)]);
        expect(close(flat[0], 0, 0.001)).assertTrue();
        expect(close(flat[1], 10, 0.001)).assertTrue();
        expect(close(inverse.getValue(1), -1.5, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0126
     * @tc.name testMatrixApi0126
     * @tc.desc Verify skew builds differ when their factors differ.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0126 begin');
      await runCase('testMatrixApi0126', async () => {
        expect(matricesEqual(buildSkewMatrix(0.5, 0), buildSkewMatrix(0.5, 0))).assertTrue();
        expect(matricesEqual(buildSkewMatrix(0.5, 0), buildSkewMatrix(0, 0.5))).assertFalse();
        expect(matricesEqual(buildSkewMatrix(0, 0), createIdentityMatrix())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0127
     * @tc.name testMatrixApi0127
     * @tc.desc Verify a zero sine and unit cosine pair builds the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0127 begin');
      await runCase('testMatrixApi0127', async () => {
        const matrix: drawing.Matrix = buildSinCosMatrix(0, 1);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0128
     * @tc.name testMatrixApi0128
     * @tc.desc Verify the sine cosine builder keeps the pivot fixed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0128 begin');
      await runCase('testMatrixApi0128', async () => {
        const matrix: drawing.Matrix = buildSinCosMatrix(1, 0);
        const pivot: number[] = mapPoints(matrix, [point(100, 100)]);
        expect(close(pivot[0], 100, 0.001)).assertTrue();
        expect(close(pivot[1], 100, 0.001)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0129
     * @tc.name testMatrixApi0129
     * @tc.desc Verify a unit sine pair turns the edge ninety degrees.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0129 begin');
      await runCase('testMatrixApi0129', async () => {
        const flat: number[] = mapPoints(buildSinCosMatrix(1, 0), [point(200, 100)]);
        expect(close(flat[0], 100, 0.001)).assertTrue();
        expect(close(flat[1], 200, 0.001)).assertTrue();
        expect(close(buildSinCosMatrix(1, 0).getValue(1), -1, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0130
     * @tc.name testMatrixApi0130
     * @tc.desc Verify a three four five pair turns by about thirty seven degrees.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0130 begin');
      await runCase('testMatrixApi0130', async () => {
        const flat: number[] = mapPoints(buildSinCosMatrix(0.6, 0.8), [point(200, 100)]);
        expect(close(flat[0], 180, 0.01)).assertTrue();
        expect(close(flat[1], 160, 0.01)).assertTrue();
        expect(close(buildSinCosMatrix(0.6, 0.8).getValue(0), 0.8, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0131
     * @tc.name testMatrixApi0131
     * @tc.desc Verify the sine cosine snapshot stays affine and rect friendly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0131 begin');
      await runCase('testMatrixApi0131', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(buildSinCosMatrix(1, 0));
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.rectStaysRect).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0132
     * @tc.name testMatrixApi0132
     * @tc.desc Verify the sine cosine builder leaves the mapped radius unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0132 begin');
      await runCase('testMatrixApi0132', async () => {
        expect(close(mapRadius(buildSinCosMatrix(1, 0), 5), 5, 0.0001)).assertTrue();
        expect(close(mapRadius(buildSinCosMatrix(0.6, 0.8), 9), 9, 0.0001)).assertTrue();
        expect(mapRadius(buildSinCosMatrix(0, 1), 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0133
     * @tc.name testMatrixApi0133
     * @tc.desc Verify a negative sine pair turns the opposite quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0133 begin');
      await runCase('testMatrixApi0133', async () => {
        const flat: number[] = mapPoints(buildSinCosMatrix(-1, 0), [point(200, 100)]);
        expect(close(flat[0], 100, 0.001)).assertTrue();
        expect(close(flat[1], 0, 0.001)).assertTrue();
        expect(flat[1] < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0134
     * @tc.name testMatrixApi0134
     * @tc.desc Verify equality of sine cosine builds follows the pair values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0134 begin');
      await runCase('testMatrixApi0134', async () => {
        expect(matricesEqual(buildSinCosMatrix(0, 1), createIdentityMatrix())).assertTrue();
        expect(matricesEqual(buildSinCosMatrix(1, 0), buildSinCosMatrix(0, 1))).assertFalse();
        expect(matricesEqual(buildSinCosMatrix(1, 0), buildSinCosMatrix(1, 0))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0135
     * @tc.name testMatrixApi0135
     * @tc.desc Verify the pre and post helper returns a copy of the base matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0135 begin');
      await runCase('testMatrixApi0135', async () => {
        const base: drawing.Matrix = buildTranslateMatrix(10, 5);
        const result: drawing.Matrix = prePostMatrix(base, buildScaleMatrix(2, 2));
        const flat: number[] = mapPoints(result, [point(0, 0)]);
        expect(matricesEqual(result, base)).assertTrue();
        expect(close(flat[0], 30, 0.0001)).assertTrue();
        expect(close(flat[1], 15, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0136
     * @tc.name testMatrixApi0136
     * @tc.desc Verify the pre and post helper ignores a rotating delta matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0136 begin');
      await runCase('testMatrixApi0136', async () => {
        const base: drawing.Matrix = buildScaleMatrix(2, 2);
        const result: drawing.Matrix = prePostMatrix(base, buildRotateMatrix(45));
        const flat: number[] = mapPoints(result, [point(200, 100)]);
        expect(close(flat[0], 900, 0.01)).assertTrue();
        expect(snapshotMatrix(result).values.length).assertEqual(9);
        expect(snapshotMatrix(result).rectStaysRect).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0137
     * @tc.name testMatrixApi0137
     * @tc.desc Verify the pre and post helper keeps the translated slots of the base.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0137 begin');
      await runCase('testMatrixApi0137', async () => {
        const base: drawing.Matrix = buildTranslateMatrix(7, -3);
        const delta: drawing.Matrix = buildTranslateMatrix(1, 1);
        const result: drawing.Matrix = prePostMatrix(base, delta);
        expect(close(result.getValue(2), 21, 0.0001)).assertTrue();
        expect(close(result.getValue(5), -9, 0.0001)).assertTrue();
        expect(matricesEqual(result, base)).assertTrue();
        expect(matricesEqual(result, concatMatrix(base, delta))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0138
     * @tc.name testMatrixApi0138
     * @tc.desc Verify the pre and post helper preserves the skew slots of the base.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0138 begin');
      await runCase('testMatrixApi0138', async () => {
        const base: drawing.Matrix = buildSkewMatrix(0.5, 0);
        const result: drawing.Matrix = prePostMatrix(base, buildRotateMatrix(30));
        expect(result.rectStaysRect()).assertFalse();
        expect(close(result.getValue(1), 1.5, 0.0001)).assertTrue();
        expect(matricesEqual(result, base)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0139
     * @tc.name testMatrixApi0139
     * @tc.desc Verify the identity works as both the left and right concat operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0139 begin');
      await runCase('testMatrixApi0139', async () => {
        const identity: drawing.Matrix = createIdentityMatrix();
        const right: drawing.Matrix = concatMatrix(buildTranslateMatrix(1, 2), identity);
        const left: drawing.Matrix = concatMatrix(identity, buildTranslateMatrix(1, 2));
        expect(close(mapPoints(right, [point(0, 0)])[0], 3, 0.0001)).assertTrue();
        expect(close(mapPoints(left, [point(0, 0)])[1], 6, 0.0001)).assertTrue();
        expect(matricesEqual(right, left)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0140
     * @tc.name testMatrixApi0140
     * @tc.desc Verify concat applies the second operand first.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0140 begin');
      await runCase('testMatrixApi0140', async () => {
        const translate: drawing.Matrix = new drawing.Matrix();
        translate.setTranslation(4, 0);
        const scale: drawing.Matrix = new drawing.Matrix();
        scale.setScale(2, 2, 0, 0);
        const composed: drawing.Matrix = concatMatrix(translate, scale);
        const flat: number[] = mapPoints(composed, [point(5, 5)]);
        expect(flat[0]).assertEqual(14);
        expect(flat[1]).assertEqual(10);
        expect(composed.getValue(2)).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0141
     * @tc.name testMatrixApi0141
     * @tc.desc Verify concat order changes the mapped result of a scale and a shift.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0141 begin');
      await runCase('testMatrixApi0141', async () => {
        const scale: drawing.Matrix = new drawing.Matrix();
        scale.setScale(2, 2, 0, 0);
        const translate: drawing.Matrix = new drawing.Matrix();
        translate.setTranslation(4, 0);
        const scaleThenMove: drawing.Matrix = concatMatrix(translate, scale);
        const moveThenScale: drawing.Matrix = concatMatrix(scale, translate);
        expect(mapPoints(scaleThenMove, [point(5, 5)])[0]).assertEqual(14);
        expect(mapPoints(moveThenScale, [point(5, 5)])[0]).assertEqual(18);
        expect(matricesEqual(scaleThenMove, moveThenScale)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0142
     * @tc.name testMatrixApi0142
     * @tc.desc Verify two translate builders fold into a single six times offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0142 begin');
      await runCase('testMatrixApi0142', async () => {
        const composed: drawing.Matrix = concatMatrix(buildTranslateMatrix(1, 2), buildTranslateMatrix(3, 4));
        const flat: number[] = mapPoints(composed, [point(0, 0)]);
        expect(close(flat[0], 12, 0.0001)).assertTrue();
        expect(close(flat[1], 18, 0.0001)).assertTrue();
        expect(close(composed.getValue(2), 12, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0143
     * @tc.name testMatrixApi0143
     * @tc.desc Verify the inverse of a concatenated shift returns to the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0143 begin');
      await runCase('testMatrixApi0143', async () => {
        const composed: drawing.Matrix = concatMatrix(buildTranslateMatrix(4, 0), buildTranslateMatrix(6, 0));
        const inverse: drawing.Matrix = invertMatrix(composed);
        const flat: number[] = mapPoints(inverse, [point(30, 0)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(close(inverse.getValue(2), -30, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0144
     * @tc.name testMatrixApi0144
     * @tc.desc Verify equality of two rotate builds is symmetric.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0144 begin');
      await runCase('testMatrixApi0144', async () => {
        const first: drawing.Matrix = buildRotateMatrix(45);
        const second: drawing.Matrix = buildRotateMatrix(45);
        expect(matricesEqual(first, second)).assertTrue();
        expect(matricesEqual(second, first)).assertTrue();
        expect(matricesEqual(first, buildRotateMatrix(90))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0145
     * @tc.name testMatrixApi0145
     * @tc.desc Verify distinct rotate builds differ in both compare directions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0145 begin');
      await runCase('testMatrixApi0145', async () => {
        const flatBuild: drawing.Matrix = buildRotateMatrix(60);
        const steepBuild: drawing.Matrix = buildRotateMatrix(120);
        expect(matricesEqual(flatBuild, steepBuild)).assertFalse();
        expect(matricesEqual(steepBuild, flatBuild)).assertFalse();
        expect(close(snapshotMatrix(steepBuild).values[0], snapshotMatrix(flatBuild).values[0], 0.1))
          .assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0146
     * @tc.name testMatrixApi0146
     * @tc.desc Verify identity equality holds only for zero offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0146 begin');
      await runCase('testMatrixApi0146', async () => {
        const zero: drawing.Matrix = new drawing.Matrix();
        zero.setTranslation(0, 0);
        expect(matricesEqual(zero, createIdentityMatrix())).assertTrue();
        expect(matricesEqual(createIdentityMatrix(), buildTranslateMatrix(0, 0))).assertTrue();
        expect(matricesEqual(createIdentityMatrix(), buildTranslateMatrix(1, 0))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0147
     * @tc.name testMatrixApi0147
     * @tc.desc Verify the value helper writes the diagonal scale and the third one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0147 begin');
      await runCase('testMatrixApi0147', async () => {
        const nine: number[] = matrixFromValues(3);
        expect(nine.length).assertEqual(9);
        expect(nine[0]).assertEqual(3);
        expect(nine[4]).assertEqual(3);
        expect(nine[8]).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0148
     * @tc.name testMatrixApi0148
     * @tc.desc Verify a unit scale from values rebuilds the identity matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0148 begin');
      await runCase('testMatrixApi0148', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix(matrixFromValues(1));
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.isAffine()).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0149
     * @tc.name testMatrixApi0149
     * @tc.desc Verify a zero diagonal from values collapses every mapped point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0149 begin');
      await runCase('testMatrixApi0149', async () => {
        const values: number[] = matrixFromValues(0);
        expect(values[0]).assertEqual(0);
        expect(values[8]).assertEqual(1);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix(values);
        const flat: number[] = mapPoints(matrix, [point(5, 5)]);
        expect(flat[0]).assertEqual(0);
        expect(flat[1]).assertEqual(0);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0150
     * @tc.name testMatrixApi0150
     * @tc.desc Verify a negative diagonal from values flips both coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0150 begin');
      await runCase('testMatrixApi0150', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix(matrixFromValues(-2));
        const flat: number[] = mapPoints(matrix, [point(3, 4)]);
        expect(flat[0]).assertEqual(-6);
        expect(flat[1]).assertEqual(-8);
        expect(snapshotMatrix(matrix).affine).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0151
     * @tc.name testMatrixApi0151
     * @tc.desc Verify inverting a singular matrix falls back to the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0151 begin');
      await runCase('testMatrixApi0151', async () => {
        const singular: drawing.Matrix = new drawing.Matrix();
        singular.setMatrix(matrixFromValues(0));
        const inverse: drawing.Matrix = invertMatrix(singular);
        expect(inverse.isIdentity()).assertTrue();
        expect(matricesEqual(inverse, createIdentityMatrix())).assertTrue();
        expect(inverse.getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0152
     * @tc.name testMatrixApi0152
     * @tc.desc Verify a post translate is not amplified by an existing scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0152 begin');
      await runCase('testMatrixApi0152', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        matrix.postTranslate(5, 0);
        const snapshot: MatrixSnapshot = snapshotMatrix(matrix);
        expect(snapshot.values[0]).assertEqual(2);
        expect(snapshot.values[2]).assertEqual(5);
        expect(snapshot.identity).assertFalse();
        expect(snapshot.affine).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0153
     * @tc.name testMatrixApi0153
     * @tc.desc Verify the value helper reads the four rotation slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0153 begin');
      await runCase('testMatrixApi0153', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        expect(close(matrixValueAt(matrix, 0), 0, 0.0001)).assertTrue();
        expect(close(matrixValueAt(matrix, 1), 1, 0.0001)).assertFalse();
        expect(close(matrixValueAt(matrix, 3), -1, 0.0001)).assertFalse();
        expect(close(matrixValueAt(matrix, 4), 0, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0154
     * @tc.name testMatrixApi0154
     * @tc.desc Verify the inverse of a quarter turn maps a vertical point sideways.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0154 begin');
      await runCase('testMatrixApi0154', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        const inverse: drawing.Matrix = invertMatrix(matrix);
        const flat: number[] = mapPoints(inverse, [point(0, 10)]);
        expect(close(flat[0], 10, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(close(matrixValueAt(inverse, 0), 0, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0155
     * @tc.name testMatrixApi0155
     * @tc.desc Verify reset only clears the matrix it is called on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0155 begin');
      await runCase('testMatrixApi0155', async () => {
        const first: drawing.Matrix = buildTranslateMatrix(2, 2);
        const second: drawing.Matrix = buildScaleMatrix(2, 2);
        first.reset();
        expect(first.isIdentity()).assertTrue();
        expect(close(mapPoints(second, [point(200, 100)])[0], 900, 0.01)).assertTrue();
        expect(second.getValue(0)).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0156
     * @tc.name testMatrixApi0156
     * @tc.desc Verify two builder calls return independent matrix instances.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0156 begin');
      await runCase('testMatrixApi0156', async () => {
        const small: drawing.Matrix = buildTranslateMatrix(1, 1);
        const big: drawing.Matrix = buildTranslateMatrix(2, 2);
        small.reset();
        const flat: number[] = mapPoints(big, [point(0, 0)]);
        expect(small.isIdentity()).assertTrue();
        expect(flat[0]).assertEqual(6);
        expect(flat[1]).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0157
     * @tc.name testMatrixApi0157
     * @tc.desc Verify all five builders stay affine with nine values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0157 begin');
      await runCase('testMatrixApi0157', async () => {
        const builders: drawing.Matrix[] = [
          buildTranslateMatrix(1, 1),
          buildRotateMatrix(0),
          buildScaleMatrix(1, 1),
          buildSkewMatrix(0, 0),
          buildSinCosMatrix(0, 1)
        ];
        let affineCount: number = 0;
        let valueCount: number = 0;
        for (let index: number = 0; index < builders.length; index++) {
          if (builders[index].isAffine()) {
            affineCount += 1;
          }
          if (snapshotMatrix(builders[index]).values.length === 9) {
            valueCount += 1;
          }
        }
        expect(affineCount).assertEqual(5);
        expect(valueCount).assertEqual(5);
        expect(builders.length).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0157 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0158
     * @tc.name testMatrixApi0158
     * @tc.desc Verify only right angle preserving builders keep rectangles rectangular.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0158 begin');
      await runCase('testMatrixApi0158', async () => {
        const builders: drawing.Matrix[] = [
          buildTranslateMatrix(3, 4),
          buildRotateMatrix(0),
          buildScaleMatrix(2, 2),
          buildSkewMatrix(0.25, 0),
          buildRotateMatrix(90)
        ];
        const expected: boolean[] = [true, true, true, false, false];
        let matched: number = 0;
        for (let index: number = 0; index < builders.length; index++) {
          if (builders[index].rectStaysRect() === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(builders[3].rectStaysRect()).assertFalse();
        expect(builders[2].rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0159
     * @tc.name testMatrixApi0159
     * @tc.desc Verify the mapped radius follows the uniform scale factor.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0159 begin');
      await runCase('testMatrixApi0159', async () => {
        expect(close(mapRadius(buildTranslateMatrix(9, 9), 10), 10, 0.0001)).assertTrue();
        expect(close(mapRadius(buildScaleMatrix(2, 2), 10), 80, 0.01)).assertTrue();
        expect(mapRadius(buildTranslateMatrix(1, 1), 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0160
     * @tc.name testMatrixApi0160
     * @tc.desc Verify a skewed matrix stretches the mapped radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0160 begin');
      await runCase('testMatrixApi0160', async () => {
        const skewed: drawing.Matrix = buildSkewMatrix(0.5, 0);
        expect(mapRadius(skewed, 10) > 10).assertTrue();
        expect(close(mapRadius(buildSkewMatrix(0, 0), 10), 10, 0.0001)).assertTrue();
        expect(close(mapRadius(skewed, 0), 0, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0161
     * @tc.name testMatrixApi0161
     * @tc.desc Verify the inverse of the scale builder undoes the cubic growth.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0161 begin');
      await runCase('testMatrixApi0161', async () => {
        const inverse: drawing.Matrix = invertMatrix(buildScaleMatrix(2, 2));
        const edge: number[] = mapPoints(inverse, [point(900, 100)]);
        const pivot: number[] = mapPoints(inverse, [point(100, 100)]);
        expect(close(edge[0], 200, 0.01)).assertTrue();
        expect(close(edge[1], 100, 0.01)).assertTrue();
        expect(close(pivot[0], 100, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0162
     * @tc.name testMatrixApi0162
     * @tc.desc Verify a post scale then post rotate chain maps the sample point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0162 begin');
      await runCase('testMatrixApi0162', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(10, 0);
        matrix.postScale(2, 2, 0, 0);
        matrix.postRotate(90, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 80, 0.0001)).assertTrue();
        expect(close(matrix.getValue(2), 0, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0163
     * @tc.name testMatrixApi0163
     * @tc.desc Verify a pre scale keeps the translated slot untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0163 begin');
      await runCase('testMatrixApi0163', async () => {
        const matrix: drawing.Matrix = buildTranslateMatrix(10, 0);
        matrix.preScale(2, 2, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], 50, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(close(matrix.getValue(2), 30, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0164
     * @tc.name testMatrixApi0164
     * @tc.desc Verify a zero degree rotation folded with a shift keeps the shift.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0164 begin');
      await runCase('testMatrixApi0164', async () => {
        const composed: drawing.Matrix = concatMatrix(buildTranslateMatrix(1, 0), buildRotateMatrix(0));
        const snapshot: MatrixSnapshot = snapshotMatrix(composed);
        expect(close(snapshot.values[2], 3, 0.0001)).assertTrue();
        expect(snapshot.rectStaysRect).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0164 end');
    });
  });
}
