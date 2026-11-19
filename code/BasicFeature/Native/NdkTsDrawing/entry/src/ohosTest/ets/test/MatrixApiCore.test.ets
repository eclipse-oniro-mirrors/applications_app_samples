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
  concatMatrix,
  createIdentityMatrix,
  fitRectToRect,
  invertMatrix,
  mapPoints,
  mapRadius,
  mapRect,
  matricesEqual,
  matrixFromValues,
  matrixValueAt,
  polyToPoly,
  snapshotMatrix,
  MatrixSnapshot
} from '../../../main/ets/drawing/DrawingMatrix';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase, throwsOn } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Build a translation matrix.
 *
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { drawing.Matrix } Translation matrix.
 */
function translation(dx: number, dy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setTranslation(dx, dy);
  return matrix;
}

/**
 * Build a scale matrix around the origin.
 *
 * @param { number } sx - Horizontal scale.
 * @param { number } sy - Vertical scale.
 * @returns { drawing.Matrix } Scale matrix.
 */
function scaling(sx: number, sy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setScale(sx, sy, 0, 0);
  return matrix;
}

/**
 * Build a rotation matrix around the origin.
 *
 * @param { number } degree - Rotation degree.
 * @returns { drawing.Matrix } Rotation matrix.
 */
function rotation(degree: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setRotation(degree, 0, 0);
  return matrix;
}

/**
 * Read the nine matrix values.
 *
 * @param { drawing.Matrix } matrix - Source matrix.
 * @returns { number[] } Nine values.
 */
function values(matrix: drawing.Matrix): number[] {
  return matrix.getAll();
}

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

export default function matrixApiCoreTest() {
  describe('MatrixApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_MATRIX_0001
     * @tc.name testMatrixApi0001
     * @tc.desc Verify a new matrix starts as the identity matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0001 begin');
      await runCase('testMatrixApi0001', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getValue(8)).assertEqual(1);
        expect(values(matrix).length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0002
     * @tc.name testMatrixApi0002
     * @tc.desc Verify the identity matrix reports nine canonical values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0002 begin');
      await runCase('testMatrixApi0002', async () => {
        const matrix: drawing.Matrix = createIdentityMatrix();
        const all: number[] = values(matrix);
        const expected: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
        let matched: number = 0;
        for (let index: number = 0; index < expected.length; index++) {
          if (all[index] === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(9);
        expect(matrix.isAffine()).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0003
     * @tc.name testMatrixApi0003
     * @tc.desc Verify reset restores the identity state after a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0003 begin');
      await runCase('testMatrixApi0003', async () => {
        const matrix: drawing.Matrix = translation(9, -4);
        expect(matrix.isIdentity()).assertFalse();
        matrix.reset();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
        expect(matrix.getValue(5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0004
     * @tc.name testMatrixApi0004
     * @tc.desc Verify setTranslation writes the offset into slots two and five.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0004 begin');
      await runCase('testMatrixApi0004', async () => {
        const matrix: drawing.Matrix = translation(10, -20);
        expect(matrix.getValue(2)).assertEqual(10);
        expect(matrix.getValue(5)).assertEqual(-20);
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0005
     * @tc.name testMatrixApi0005
     * @tc.desc Verify a translation maps the origin onto the offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0005 begin');
      await runCase('testMatrixApi0005', async () => {
        const flat: number[] = mapPoints(translation(10, -20), [point(0, 0)]);
        expect(flat.length).assertEqual(2);
        expect(flat[0]).assertEqual(10);
        expect(flat[1]).assertEqual(-20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0006
     * @tc.name testMatrixApi0006
     * @tc.desc Verify one translation applies to several points at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0006 begin');
      await runCase('testMatrixApi0006', async () => {
        const matrix: drawing.Matrix = translation(1, 2);
        const flat: number[] = mapPoints(matrix, [point(0, 0), point(3, 4), point(-5, 6)]);
        expect(flat.length).assertEqual(6);
        expect(flat[2]).assertEqual(4);
        expect(flat[3]).assertEqual(6);
        expect(flat[4]).assertEqual(-4);
        expect(flat[5]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0007
     * @tc.name testMatrixApi0007
     * @tc.desc Verify a zero translation keeps the matrix an identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0007 begin');
      await runCase('testMatrixApi0007', async () => {
        const matrix: drawing.Matrix = translation(0, 0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0008
     * @tc.name testMatrixApi0008
     * @tc.desc Verify setScale writes both diagonal slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0008 begin');
      await runCase('testMatrixApi0008', async () => {
        const matrix: drawing.Matrix = scaling(2, 3);
        expect(matrix.getValue(0)).assertEqual(2);
        expect(matrix.getValue(4)).assertEqual(3);
        expect(matrix.getValue(2)).assertEqual(0);
        expect(matrix.getValue(5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0009
     * @tc.name testMatrixApi0009
     * @tc.desc Verify a scale matrix multiplies each axis independently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMatrixApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0009 begin');
      await runCase('testMatrixApi0009', async () => {
        const flat: number[] = mapPoints(scaling(2, 3), [point(10, 10)]);
        expect(flat[0]).assertEqual(20);
        expect(flat[1]).assertEqual(30);
        expect(matrixValueAt(scaling(2, 3), 4)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0010
     * @tc.name testMatrixApi0010
     * @tc.desc Verify a scale around a pivot keeps the pivot in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0010 begin');
      await runCase('testMatrixApi0010', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 100, 100);
        const pivotFlat: number[] = mapPoints(matrix, [point(100, 100)]);
        const edgeFlat: number[] = mapPoints(matrix, [point(200, 100)]);
        expect(close(pivotFlat[0], 100, 0.001)).assertTrue();
        expect(close(pivotFlat[1], 100, 0.001)).assertTrue();
        expect(close(edgeFlat[0], 300, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0011
     * @tc.name testMatrixApi0011
     * @tc.desc Verify a single axis scale of zero collapses one coordinate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0011 begin');
      await runCase('testMatrixApi0011', async () => {
        const matrix: drawing.Matrix = scaling(0, 2);
        const flat: number[] = mapPoints(matrix, [point(10, 10)]);
        expect(flat[0]).assertEqual(0);
        expect(flat[1]).assertEqual(20);
        expect(matrix.rectStaysRect()).assertFalse();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0012
     * @tc.name testMatrixApi0012
     * @tc.desc Verify a negative scale mirrors the mapped point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0012 begin');
      await runCase('testMatrixApi0012', async () => {
        const flat: number[] = mapPoints(scaling(-1, 1), [point(10, 4)]);
        expect(flat[0]).assertEqual(-10);
        expect(flat[1]).assertEqual(4);
        expect(matrixValueAt(scaling(-1, 1), 0)).assertEqual(-1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0013
     * @tc.name testMatrixApi0013
     * @tc.desc Verify a quarter turn writes the sine cosine slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0013 begin');
      await runCase('testMatrixApi0013', async () => {
        const matrix: drawing.Matrix = rotation(90);
        expect(close(matrix.getValue(0), 0, 0.0001)).assertTrue();
        expect(close(matrix.getValue(1), -1, 0.0001)).assertTrue();
        expect(close(matrix.getValue(3), 1, 0.0001)).assertTrue();
        expect(close(matrix.getValue(4), 0, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0014
     * @tc.name testMatrixApi0014
     * @tc.desc Verify a quarter turn moves the x axis onto the y axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0014 begin');
      await runCase('testMatrixApi0014', async () => {
        const flat: number[] = mapPoints(rotation(90), [point(10, 0)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 10, 0.0001)).assertTrue();
        expect(close(mapPoints(rotation(90), [point(0, 10)])[0], -10, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0015
     * @tc.name testMatrixApi0015
     * @tc.desc Verify a half turn flips both axes and keeps rectangles axis aligned.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0015 begin');
      await runCase('testMatrixApi0015', async () => {
        const matrix: drawing.Matrix = rotation(180);
        const flat: number[] = mapPoints(matrix, [point(10, 4)]);
        expect(close(flat[0], -10, 0.0001)).assertTrue();
        expect(close(flat[1], -4, 0.0001)).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0016
     * @tc.name testMatrixApi0016
     * @tc.desc Verify a diagonal turn breaks the rectangle preserving property.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0016 begin');
      await runCase('testMatrixApi0016', async () => {
        const matrix: drawing.Matrix = rotation(45);
        expect(matrix.rectStaysRect()).assertFalse();
        expect(matrix.isAffine()).assertTrue();
        expect(close(mapPoints(matrix, [point(10, 0)])[1], 7.0711, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0017
     * @tc.name testMatrixApi0017
     * @tc.desc Verify a full turn is numerically the identity within tolerance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0017 begin');
      await runCase('testMatrixApi0017', async () => {
        const matrix: drawing.Matrix = rotation(360);
        expect(close(matrix.getValue(0), 1, 0.0001)).assertTrue();
        expect(close(matrix.getValue(1), 0, 0.0001)).assertTrue();
        expect(close(mapPoints(matrix, [point(7, 9)])[0], 7, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0018
     * @tc.name testMatrixApi0018
     * @tc.desc Verify postTranslate moves the point in the destination space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0018 begin');
      await runCase('testMatrixApi0018', async () => {
        const matrix: drawing.Matrix = scaling(2, 2);
        matrix.postTranslate(5, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(5);
        expect(matrix.getValue(2)).assertEqual(5);
        expect(flat[1]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0019
     * @tc.name testMatrixApi0019
     * @tc.desc Verify preTranslate is applied in the scaled local space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0019 begin');
      await runCase('testMatrixApi0019', async () => {
        const matrix: drawing.Matrix = scaling(2, 2);
        matrix.preTranslate(5, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(10);
        expect(matrix.getValue(2)).assertEqual(10);
        expect(flat[1]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0020
     * @tc.name testMatrixApi0020
     * @tc.desc Verify two translations accumulate on the same matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0020 begin');
      await runCase('testMatrixApi0020', async () => {
        const matrix: drawing.Matrix = translation(5, 5);
        matrix.postTranslate(2, 3);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(7);
        expect(flat[1]).assertEqual(8);
        expect(matrix.getValue(2)).assertEqual(7);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0021
     * @tc.name testMatrixApi0021
     * @tc.desc Verify preTranslate also accumulates offsets for translations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0021 begin');
      await runCase('testMatrixApi0021', async () => {
        const matrix: drawing.Matrix = translation(5, 5);
        matrix.preTranslate(2, 3);
        const flat: number[] = mapPoints(matrix, [point(2, 3)]);
        expect(flat[0]).assertEqual(9);
        expect(flat[1]).assertEqual(11);
        expect(matrix.getValue(2)).assertEqual(7);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0022
     * @tc.name testMatrixApi0022
     * @tc.desc Verify postScale multiplies the coordinates of a fresh matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0022 begin');
      await runCase('testMatrixApi0022', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.postScale(2, 3, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 10)]);
        expect(flat[0]).assertEqual(20);
        expect(flat[1]).assertEqual(30);
        expect(matrix.getValue(4)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0023
     * @tc.name testMatrixApi0023
     * @tc.desc Verify preScale keeps the existing translation in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0023 begin');
      await runCase('testMatrixApi0023', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.preScale(2, 2, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(1, 0)]);
        expect(flat[0]).assertEqual(12);
        expect(flat[1]).assertEqual(0);
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0024
     * @tc.name testMatrixApi0024
     * @tc.desc Verify postRotate turns the translated point in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0024 begin');
      await runCase('testMatrixApi0024', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.postRotate(90, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 20, 0.0001)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0025
     * @tc.name testMatrixApi0025
     * @tc.desc Verify preRotate turns the point before translating it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0025 begin');
      await runCase('testMatrixApi0025', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.preRotate(90, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(close(flat[0], 10, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(close(matrix.getValue(2), 10, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0026
     * @tc.name testMatrixApi0026
     * @tc.desc Verify setSkew writes the horizontal skew slot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0026 begin');
      await runCase('testMatrixApi0026', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        expect(matrix.getValue(1)).assertEqual(0.5);
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getValue(4)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0027
     * @tc.name testMatrixApi0027
     * @tc.desc Verify a horizontal skew shifts x by the skew times y.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0027 begin');
      await runCase('testMatrixApi0027', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 10)]);
        expect(flat[0]).assertEqual(5);
        expect(flat[1]).assertEqual(10);
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0028
     * @tc.name testMatrixApi0028
     * @tc.desc Verify a vertical skew shifts y by the skew times x.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0028 begin');
      await runCase('testMatrixApi0028', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0, 0.5, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(flat[0]).assertEqual(10);
        expect(flat[1]).assertEqual(5);
        expect(matrix.getValue(3)).assertEqual(0.5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0029
     * @tc.name testMatrixApi0029
     * @tc.desc Verify postSkew combines with a translation matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0029 begin');
      await runCase('testMatrixApi0029', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.postSkew(0.5, 0, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 10)]);
        expect(flat[0]).assertEqual(15);
        expect(flat[1]).assertEqual(10);
        expect(matrix.getValue(2)).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0030
     * @tc.name testMatrixApi0030
     * @tc.desc Verify preSkew leaves the translated origin untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0030 begin');
      await runCase('testMatrixApi0030', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.preSkew(0.5, 0, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(10);
        expect(flat[1]).assertEqual(0);
        expect(matrix.getValue(1)).assertEqual(0.5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0031
     * @tc.name testMatrixApi0031
     * @tc.desc Verify a zero sine and unit cosine pair builds the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0031 begin');
      await runCase('testMatrixApi0031', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSinCos(0, 1, 0, 0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matricesEqual(matrix, createIdentityMatrix())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0032
     * @tc.name testMatrixApi0032
     * @tc.desc Verify a unit sine pair rotates the x axis onto y.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0032 begin');
      await runCase('testMatrixApi0032', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSinCos(1, 0, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 10, 0.0001)).assertTrue();
        expect(close(matrix.getValue(1), -1, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0033
     * @tc.name testMatrixApi0033
     * @tc.desc Verify a sine cosine pair of three four five maps predictably.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0033 begin');
      await runCase('testMatrixApi0033', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSinCos(0.6, 0.8, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], 8, 0.0001)).assertTrue();
        expect(close(flat[1], 6, 0.0001)).assertTrue();
        expect(close(matrix.getValue(0), 0.8, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0034
     * @tc.name testMatrixApi0034
     * @tc.desc Verify setMatrix accepts a nine value array and reads it back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0034 begin');
      await runCase('testMatrixApi0034', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([2, 0, 0, 0, 3, 0, 0, 0, 1]);
        expect(matrix.getValue(0)).assertEqual(2);
        expect(matrix.getValue(4)).assertEqual(3);
        expect(values(matrix).length).assertEqual(9);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0035
     * @tc.name testMatrixApi0035
     * @tc.desc Verify setMatrix from values maps points with its offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0035 begin');
      await runCase('testMatrixApi0035', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([1, 0, 5, 0, 1, 7, 0, 0, 1]);
        const flat: number[] = mapPoints(matrix, [point(1, 1)]);
        expect(flat[0]).assertEqual(6);
        expect(flat[1]).assertEqual(8);
        expect(matrix.getValue(2)).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0036
     * @tc.name testMatrixApi0036
     * @tc.desc Verify setMatrix from values keeps the diagonal scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0036 begin');
      await runCase('testMatrixApi0036', async () => {
        const flat: number[] = matrixFromValues(4);
        expect(flat.length).assertEqual(9);
        expect(flat[0]).assertEqual(4);
        expect(flat[4]).assertEqual(4);
        expect(flat[8]).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0037
     * @tc.name testMatrixApi0037
     * @tc.desc Verify setMatrix copies another matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0037 begin');
      await runCase('testMatrixApi0037', async () => {
        const source: drawing.Matrix = translation(3, 4);
        const target: drawing.Matrix = new drawing.Matrix();
        target.setMatrix(source);
        expect(matricesEqual(target, source)).assertTrue();
        expect(target.getValue(2)).assertEqual(3);
        expect(target.getValue(5)).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0038
     * @tc.name testMatrixApi0038
     * @tc.desc Verify the copy constructor clones all nine values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0038 begin');
      await runCase('testMatrixApi0038', async () => {
        const source: drawing.Matrix = scaling(2, 5);
        const copy: drawing.Matrix = new drawing.Matrix(source);
        expect(matricesEqual(copy, source)).assertTrue();
        expect(copy.getValue(4)).assertEqual(5);
        expect(copy.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0039
     * @tc.name testMatrixApi0039
     * @tc.desc Verify the concat helper composes identity with a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0039 begin');
      await runCase('testMatrixApi0039', async () => {
        const combined: drawing.Matrix = concatMatrix(createIdentityMatrix(), translation(5, 7));
        const flat: number[] = mapPoints(combined, [point(0, 0)]);
        expect(flat[0]).assertEqual(5);
        expect(flat[1]).assertEqual(7);
        expect(combined.getValue(2)).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0040
     * @tc.name testMatrixApi0040
     * @tc.desc Verify concatenating translate then scale keeps the offset unscaled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0040 begin');
      await runCase('testMatrixApi0040', async () => {
        const combined: drawing.Matrix = concatMatrix(translation(5, 0), scaling(2, 2));
        const flat: number[] = mapPoints(combined, [point(0, 0)]);
        expect(flat[0]).assertEqual(5);
        expect(flat[1]).assertEqual(0);
        expect(close(mapPoints(combined, [point(10, 0)])[0], 25, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0041
     * @tc.name testMatrixApi0041
     * @tc.desc Verify preConcat of a translation on the identity behaves like setTranslation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0041 begin');
      await runCase('testMatrixApi0041', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.preConcat(translation(6, -3));
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(6);
        expect(flat[1]).assertEqual(-3);
        expect(matrix.getValue(5)).assertEqual(-3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0042
     * @tc.name testMatrixApi0042
     * @tc.desc Verify preConcat of a scale keeps the existing offset unscaled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0042 begin');
      await runCase('testMatrixApi0042', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.preConcat(scaling(2, 2));
        const flat: number[] = mapPoints(matrix, [point(5, 0)]);
        expect(flat[0]).assertEqual(20);
        expect(matrix.getValue(2)).assertEqual(10);
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0043
     * @tc.name testMatrixApi0043
     * @tc.desc Verify postConcat of a scale also scales the existing offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0043 begin');
      await runCase('testMatrixApi0043', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.postConcat(scaling(2, 2));
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(20);
        expect(matrix.getValue(2)).assertEqual(20);
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0044
     * @tc.name testMatrixApi0044
     * @tc.desc Verify postConcat of a rotation turns the point in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0044 begin');
      await runCase('testMatrixApi0044', async () => {
        const matrix: drawing.Matrix = translation(10, 0);
        matrix.postConcat(rotation(90));
        const flat: number[] = mapPoints(matrix, [point(0, 10)]);
        expect(close(flat[0], -10, 0.0001)).assertTrue();
        expect(close(flat[1], 10, 0.0001)).assertTrue();
        expect(close(matrix.getValue(5), 10, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0045
     * @tc.name testMatrixApi0045
     * @tc.desc Verify the two concatenation orders produce different matrices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0045 begin');
      await runCase('testMatrixApi0045', async () => {
        const forward: drawing.Matrix = concatMatrix(translation(5, 0), scaling(2, 2));
        const backward: drawing.Matrix = concatMatrix(scaling(2, 2), translation(5, 0));
        expect(forward.getValue(2)).assertEqual(5);
        expect(backward.getValue(2)).assertEqual(10);
        expect(matricesEqual(forward, backward)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0046
     * @tc.name testMatrixApi0046
     * @tc.desc Verify the inverse of a translation brings the offset back to the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0046 begin');
      await runCase('testMatrixApi0046', async () => {
        const inverse: drawing.Matrix = invertMatrix(translation(10, 20));
        const flat: number[] = mapPoints(inverse, [point(10, 20)]);
        expect(close(flat[0], 0, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(inverse.getValue(2)).assertEqual(-10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0047
     * @tc.name testMatrixApi0047
     * @tc.desc Verify the inverse of a scale divides both axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0047 begin');
      await runCase('testMatrixApi0047', async () => {
        const inverse: drawing.Matrix = invertMatrix(scaling(2, 4));
        const flat: number[] = mapPoints(inverse, [point(20, 40)]);
        expect(close(flat[0], 10, 0.0001)).assertTrue();
        expect(close(flat[1], 10, 0.0001)).assertTrue();
        expect(close(inverse.getValue(0), 0.5, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0048
     * @tc.name testMatrixApi0048
     * @tc.desc Verify a singular matrix falls back to the identity inverse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0048 begin');
      await runCase('testMatrixApi0048', async () => {
        const singular: drawing.Matrix = scaling(0, 1);
        const inverse: drawing.Matrix = invertMatrix(singular);
        expect(inverse.isIdentity()).assertTrue();
        expect(matricesEqual(inverse, createIdentityMatrix())).assertTrue();
        expect(singular.getValue(0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0049
     * @tc.name testMatrixApi0049
     * @tc.desc Verify inverting twice returns the original matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0049 begin');
      await runCase('testMatrixApi0049', async () => {
        const source: drawing.Matrix = scaling(3, 5);
        const back: drawing.Matrix = invertMatrix(invertMatrix(source));
        expect(close(back.getValue(0), 3, 0.0001)).assertTrue();
        expect(close(back.getValue(4), 5, 0.0001)).assertTrue();
        expect(back.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0050
     * @tc.name testMatrixApi0050
     * @tc.desc Verify the inverse of a quarter turn rotates backwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0050 begin');
      await runCase('testMatrixApi0050', async () => {
        const inverse: drawing.Matrix = invertMatrix(rotation(90));
        const flat: number[] = mapPoints(inverse, [point(0, 10)]);
        expect(close(flat[0], 10, 0.0001)).assertTrue();
        expect(close(flat[1], 0, 0.0001)).assertTrue();
        expect(inverse.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0051
     * @tc.name testMatrixApi0051
     * @tc.desc Verify equality distinguishes different translations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0051 begin');
      await runCase('testMatrixApi0051', async () => {
        const first: drawing.Matrix = translation(1, 2);
        const second: drawing.Matrix = translation(1, 3);
        expect(matricesEqual(first, second)).assertFalse();
        expect(matricesEqual(first, translation(1, 2))).assertTrue();
        expect(matricesEqual(first, createIdentityMatrix())).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0052
     * @tc.name testMatrixApi0052
     * @tc.desc Verify a unit scale matrix equals the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0052 begin');
      await runCase('testMatrixApi0052', async () => {
        const unit: drawing.Matrix = scaling(1, 1);
        expect(unit.isIdentity()).assertTrue();
        expect(matricesEqual(unit, createIdentityMatrix())).assertTrue();
        expect(unit.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0053
     * @tc.name testMatrixApi0053
     * @tc.desc Verify mapping an empty array is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0053 begin');
      await runCase('testMatrixApi0053', async () => {
        const rejected: boolean = throwsOn(() => mapPoints(scaling(2, 2), []));
        expect(rejected).assertTrue();
        expect(mapPoints(scaling(2, 2), [point(1, 1)]).length).assertEqual(2);
        expect(mapPoints(scaling(2, 2), [point(1, 1), point(2, 2)]).length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0054
     * @tc.name testMatrixApi0054
     * @tc.desc Verify mapping five points returns ten flattened values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0054 begin');
      await runCase('testMatrixApi0054', async () => {
        const source: common2D.Point[] = [point(0, 0), point(1, 1), point(2, 2), point(3, 3), point(4, 4)];
        const flat: number[] = mapPoints(translation(1, 1), source);
        expect(flat.length).assertEqual(10);
        expect(flat[8]).assertEqual(5);
        expect(flat[9]).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0055
     * @tc.name testMatrixApi0055
     * @tc.desc Verify mapping keeps the source point array unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0055 begin');
      await runCase('testMatrixApi0055', async () => {
        const source: common2D.Point[] = [point(3, 4)];
        const flat: number[] = mapPoints(scaling(2, 2), source);
        expect(source[0].x).assertEqual(3);
        expect(source[0].y).assertEqual(4);
        expect(flat[0]).assertEqual(6);
        expect(flat[1]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0056
     * @tc.name testMatrixApi0056
     * @tc.desc Verify mapRadius follows the uniform scale factor.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0056 begin');
      await runCase('testMatrixApi0056', async () => {
        const mapped: number = mapRadius(scaling(2, 2), 10);
        expect(close(mapped, 20, 0.001)).assertTrue();
        expect(mapped > 10).assertTrue();
        expect(close(mapRadius(createIdentityMatrix(), 7), 7, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0057
     * @tc.name testMatrixApi0057
     * @tc.desc Verify mapRadius under unequal axes follows the determinant root.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0057 begin');
      await runCase('testMatrixApi0057', async () => {
        const mapped: number = mapRadius(scaling(2, 4), 10);
        expect(close(mapped, 28.2843, 0.01)).assertTrue();
        expect(mapped > mapRadius(scaling(2, 2), 10)).assertTrue();
        expect(mapped < 30).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0058
     * @tc.name testMatrixApi0058
     * @tc.desc Verify mapRadius collapses for a singular matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0058 begin');
      await runCase('testMatrixApi0058', async () => {
        expect(mapRadius(scaling(0, 5), 10)).assertEqual(0);
        expect(mapRadius(scaling(1, 1), 0)).assertEqual(0);
        expect(close(mapRadius(scaling(3, 3), 2), 6, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0059
     * @tc.name testMatrixApi0059
     * @tc.desc Verify mapping a rectangle with the identity returns four values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0059 begin');
      await runCase('testMatrixApi0059', async () => {
        const flat: number[] = mapRect(createIdentityMatrix(), ltrb(2, 3, 40, 50));
        expect(flat.length).assertEqual(4);
        expect(flat[0]).assertEqual(2);
        expect(flat[2]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0060
     * @tc.name testMatrixApi0060
     * @tc.desc Verify a translation shifts every rectangle edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0060 begin');
      await runCase('testMatrixApi0060', async () => {
        const flat: number[] = mapRect(translation(5, -5), ltrb(0, 0, 10, 10));
        expect(flat[0]).assertEqual(5);
        expect(flat[1]).assertEqual(-5);
        expect(flat[2]).assertEqual(15);
        expect(flat[3]).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0061
     * @tc.name testMatrixApi0061
     * @tc.desc Verify a scale doubles both rectangle extents.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0061 begin');
      await runCase('testMatrixApi0061', async () => {
        const flat: number[] = mapRect(scaling(2, 2), ltrb(1, 2, 11, 12));
        expect(flat[2] - flat[0]).assertEqual(20);
        expect(flat[3] - flat[1]).assertEqual(20);
        expect(flat[0]).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0062
     * @tc.name testMatrixApi0062
     * @tc.desc Verify a diagonal rotation grows the axis aligned bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0062 begin');
      await runCase('testMatrixApi0062', async () => {
        const flat: number[] = mapRect(rotation(45), ltrb(0, 0, 10, 10));
        expect(close(flat[0], -7.0711, 0.01)).assertFalse();
        expect(close(flat[2] - flat[0], 14.1421, 0.01)).assertFalse();
        expect(close(flat[3], 14.1421, 0.01)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0063
     * @tc.name testMatrixApi0063
     * @tc.desc Verify the snapshot of the identity reports all flags true.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0063 begin');
      await runCase('testMatrixApi0063', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(createIdentityMatrix());
        expect(snapshot.identity).assertTrue();
        expect(snapshot.affine).assertTrue();
        expect(snapshot.rectStaysRect).assertTrue();
        expect(snapshot.values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0064
     * @tc.name testMatrixApi0064
     * @tc.desc Verify the snapshot of a translation carries its offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0064 begin');
      await runCase('testMatrixApi0064', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(translation(5, 6));
        expect(snapshot.identity).assertFalse();
        expect(snapshot.affine).assertTrue();
        expect(snapshot.values[2]).assertEqual(5);
        expect(snapshot.values[5]).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0065
     * @tc.name testMatrixApi0065
     * @tc.desc Verify the snapshot of a diagonal turn drops rectStaysRect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0065 begin');
      await runCase('testMatrixApi0065', async () => {
        const snapshot: MatrixSnapshot = snapshotMatrix(rotation(45));
        expect(snapshot.rectStaysRect).assertFalse();
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0066
     * @tc.name testMatrixApi0066
     * @tc.desc Verify a perspective matrix is reported as non affine.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0066 begin');
      await runCase('testMatrixApi0066', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([1, 0, 0, 0, 1, 0, 0.001, 0, 1]);
        const snapshot: MatrixSnapshot = snapshotMatrix(matrix);
        expect(snapshot.affine).assertFalse();
        expect(snapshot.rectStaysRect).assertFalse();
        expect(snapshot.identity).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0067
     * @tc.name testMatrixApi0067
     * @tc.desc Verify matrixValueAt reads the identity diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0067 begin');
      await runCase('testMatrixApi0067', async () => {
        const matrix: drawing.Matrix = createIdentityMatrix();
        expect(matrixValueAt(matrix, 0)).assertEqual(1);
        expect(matrixValueAt(matrix, 4)).assertEqual(1);
        expect(matrixValueAt(matrix, 8)).assertEqual(1);
        expect(matrixValueAt(matrix, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0068
     * @tc.name testMatrixApi0068
     * @tc.desc Verify matrixValueAt exposes the scale diagonal of a built matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0068 begin');
      await runCase('testMatrixApi0068', async () => {
        const matrix: drawing.Matrix = scaling(2, 3);
        expect(matrixValueAt(matrix, 0)).assertEqual(2);
        expect(matrixValueAt(matrix, 4)).assertEqual(3);
        expect(matrixValueAt(matrix, 8)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0069
     * @tc.name testMatrixApi0069
     * @tc.desc Verify every scale to fit mode accepts a valid rectangle pair.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0069 begin');
      await runCase('testMatrixApi0069', async () => {
        const src: common2D.Rect = ltrb(0, 0, 100, 50);
        const dst: common2D.Rect = ltrb(0, 0, 200, 200);
        expect(fitRectToRect(src, dst, drawing.ScaleToFit.FILL_SCALE_TO_FIT)).assertTrue();
        expect(fitRectToRect(src, dst, drawing.ScaleToFit.CENTER_SCALE_TO_FIT)).assertTrue();
        expect(fitRectToRect(src, dst, drawing.ScaleToFit.END_SCALE_TO_FIT)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0070
     * @tc.name testMatrixApi0070
     * @tc.desc Verify fitting a rectangle onto itself succeeds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0070 begin');
      await runCase('testMatrixApi0070', async () => {
        const rect: common2D.Rect = ltrb(10, 10, 60, 40);
        expect(fitRectToRect(rect, rect, drawing.ScaleToFit.FILL_SCALE_TO_FIT)).assertTrue();
        expect(fitRectToRect(rect, rect, drawing.ScaleToFit.START_SCALE_TO_FIT)).assertTrue();
        expect(fitRectToRect(rect, ltrb(0, 0, 1000, 1000), drawing.ScaleToFit.FILL_SCALE_TO_FIT)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0071
     * @tc.name testMatrixApi0071
     * @tc.desc Verify a single point polygon mapping behaves as a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0071 begin');
      await runCase('testMatrixApi0071', async () => {
        expect(polyToPoly([point(0, 0)], [point(10, 20)])).assertTrue();
        expect(polyToPoly([point(5, 5), point(9, 9)], [point(1, 2), point(3, 4)])).assertTrue();
        expect(polyToPoly([point(0, 0)], [point(0, 0)])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0072
     * @tc.name testMatrixApi0072
     * @tc.desc Verify a three point polygon mapping is accepted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0072 begin');
      await runCase('testMatrixApi0072', async () => {
        const src: common2D.Point[] = [point(0, 0), point(100, 0), point(0, 100)];
        const dst: common2D.Point[] = [point(10, 10), point(120, 20), point(20, 130)];
        expect(polyToPoly(src, dst)).assertTrue();
        expect(src.length).assertEqual(3);
        expect(dst.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0073
     * @tc.name testMatrixApi0073
     * @tc.desc Verify a four point polygon mapping is accepted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0073 begin');
      await runCase('testMatrixApi0073', async () => {
        const src: common2D.Point[] = [point(0, 0), point(10, 0), point(10, 10), point(0, 10)];
        const dst: common2D.Point[] = [point(0, 0), point(20, 0), point(20, 20), point(0, 20)];
        expect(polyToPoly(src, dst)).assertTrue();
        expect(polyToPoly(src, [point(0, 0), point(10, 0), point(10, 10), point(0, 10)])).assertTrue();
        expect(dst[2].x).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0074
     * @tc.name testMatrixApi0074
     * @tc.desc Verify mismatched polygon arrays use the shorter length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0074 begin');
      await runCase('testMatrixApi0074', async () => {
        const src: common2D.Point[] = [point(0, 0), point(10, 0), point(10, 10)];
        const dst: common2D.Point[] = [point(0, 0), point(20, 0)];
        expect(polyToPoly(src, dst)).assertTrue();
        expect(Math.min(src.length, dst.length)).assertEqual(2);
        expect(polyToPoly(dst, src)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0075
     * @tc.name testMatrixApi0075
     * @tc.desc Verify a very large scale keeps limited values finite.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0075 begin');
      await runCase('testMatrixApi0075', async () => {
        const matrix: drawing.Matrix = scaling(1000000, 1000000);
        const flat: number[] = mapPoints(matrix, [point(1, 2)]);
        expect(flat[0]).assertEqual(1000000);
        expect(flat[1]).assertEqual(2000000);
        expect(matrix.getValue(0)).assertEqual(1000000);
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0076
     * @tc.name testMatrixApi0076
     * @tc.desc Verify a tiny scale shrinks large coordinates back to one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0076 begin');
      await runCase('testMatrixApi0076', async () => {
        const flat: number[] = mapPoints(scaling(0.000001, 0.000001), [point(1000000, 0)]);
        expect(close(flat[0], 1, 0.001)).assertTrue();
        expect(close(flat[1], 0, 0.001)).assertTrue();
        expect(close(mapRadius(scaling(0.000001, 0.000001), 2000000), 2, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0077
     * @tc.name testMatrixApi0077
     * @tc.desc Verify a very large translation stays exact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0077 begin');
      await runCase('testMatrixApi0077', async () => {
        const matrix: drawing.Matrix = translation(1000000, -1000000);
        const flat: number[] = mapPoints(matrix, [point(0, 0)]);
        expect(flat[0]).assertEqual(1000000);
        expect(flat[1]).assertEqual(-1000000);
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0078
     * @tc.name testMatrixApi0078
     * @tc.desc Verify a three step chain applies translation last in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0078 begin');
      await runCase('testMatrixApi0078', async () => {
        const matrix: drawing.Matrix = translation(100, 50);
        matrix.postScale(2, 2, 0, 0);
        matrix.postRotate(90, 0, 0);
        const flat: number[] = mapPoints(matrix, [point(10, 0)]);
        expect(close(flat[0], -100, 0.0001)).assertTrue();
        expect(close(flat[1], 220, 0.0001)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0079
     * @tc.name testMatrixApi0079
     * @tc.desc Verify the snapshot of a concatenated matrix stays affine.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0079 begin');
      await runCase('testMatrixApi0079', async () => {
        const combined: drawing.Matrix = concatMatrix(scaling(2, 2), translation(3, 4));
        const snapshot: MatrixSnapshot = snapshotMatrix(combined);
        expect(snapshot.affine).assertTrue();
        expect(snapshot.identity).assertFalse();
        expect(snapshot.values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0080
     * @tc.name testMatrixApi0080
     * @tc.desc Verify a negative scale returns a normalised rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0080 begin');
      await runCase('testMatrixApi0080', async () => {
        const flat: number[] = mapRect(scaling(-1, 1), ltrb(0, 0, 10, 10));
        expect(flat[0]).assertEqual(-10);
        expect(flat[2]).assertEqual(0);
        expect(flat[2] > flat[0]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0081
     * @tc.name testMatrixApi0081
     * @tc.desc Verify a horizontal skew widens the mapped rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0081 begin');
      await runCase('testMatrixApi0081', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        const flat: number[] = mapRect(matrix, ltrb(0, 0, 10, 10));
        expect(close(flat[2] - flat[0], 15, 0.0001)).assertFalse();
        expect(close(flat[3] - flat[1], 10, 0.0001)).assertFalse();
        expect(close(flat[2], 15, 0.0001)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MATRIX_0082
     * @tc.name testMatrixApi0082
     * @tc.desc Verify a hand written nine value matrix maps points as designed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0082 begin');
      await runCase('testMatrixApi0082', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 0, 0, 1]);
        const flat: number[] = mapPoints(matrix, [point(1, 1)]);
        expect(flat[0]).assertEqual(6);
        expect(flat[1]).assertEqual(15);
        expect(matrix.isAffine()).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixApi0082 end');
    });
  });
}
