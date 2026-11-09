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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ColorMatrixUtil, MediaFilterType } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Number of values of one 4x5 color matrix. */
const MATRIX_SIZE: number = 20;
/** Tolerance used to compare non exactly representable float entries. */
const TOLERANCE_LOW: number = 0.001;

/**
 * Returns one matrix entry at the given flat index.
 * @param matrix Flat 20 value matrix.
 * @param index Flat row major index.
 * @returns Entry of the matrix.
 */
function entryOf(matrix: number[], index: number): number {
  return matrix[index];
}

/**
 * Registers the matrix composition cases of the color matrix builder of
 * the shared library. The builder is pure math wrapped by a synchronous
 * trace helper, so no ability context is required.
 */
export default function colorMatrixUtilMatrixTest() {
  describe('ColorMatrixUtilMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0100
     * @tc.name      testColorMatrixUtil0001
     * @tc.desc      Verify identity returns twenty values with ones on the
     *               four diagonal slots of the channel rows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.identity();
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(matrix, 0)).assertEqual(1);
      expect(entryOf(matrix, 6)).assertEqual(1);
      expect(entryOf(matrix, 12)).assertEqual(1);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0200
     * @tc.name      testColorMatrixUtil0002
     * @tc.desc      Verify identity places zeros on every off diagonal slot
     *               including the offset column.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.identity();
      expect(entryOf(matrix, 1)).assertEqual(0);
      expect(entryOf(matrix, 2)).assertEqual(0);
      expect(entryOf(matrix, 3)).assertEqual(0);
      expect(entryOf(matrix, 4)).assertEqual(0);
      expect(entryOf(matrix, 5)).assertEqual(0);
      expect(entryOf(matrix, 7)).assertEqual(0);
      expect(entryOf(matrix, 8)).assertEqual(0);
      expect(entryOf(matrix, 11)).assertEqual(0);
      expect(entryOf(matrix, 14)).assertEqual(0);
      expect(entryOf(matrix, 19)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0300
     * @tc.name      testColorMatrixUtil0003
     * @tc.desc      Verify two consecutive identity calls produce the very
     *               same twenty values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number[] = ColorMatrixUtil.identity();
      const second: number[] = ColorMatrixUtil.identity();
      expect(first.length).assertEqual(second.length);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(first, index)).assertEqual(entryOf(second, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0400
     * @tc.name      testColorMatrixUtil0004
     * @tc.desc      Verify multiplying the identity from the left keeps the
     *               contrast matrix unchanged entry by entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const identity: number[] = ColorMatrixUtil.identity();
      const contrast: number[] = ColorMatrixUtil.contrastMatrix(2);
      const composed: number[] = ColorMatrixUtil.multiply(identity, contrast);
      expect(composed.length).assertEqual(MATRIX_SIZE);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(composed, index)).assertEqual(entryOf(contrast, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0500
     * @tc.name      testColorMatrixUtil0005
     * @tc.desc      Verify multiplying the identity from the right keeps the
     *               contrast matrix unchanged entry by entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const identity: number[] = ColorMatrixUtil.identity();
      const contrast: number[] = ColorMatrixUtil.contrastMatrix(2);
      const composed: number[] = ColorMatrixUtil.multiply(contrast, identity);
      expect(composed.length).assertEqual(MATRIX_SIZE);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(composed, index)).assertEqual(entryOf(contrast, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0600
     * @tc.name      testColorMatrixUtil0006
     * @tc.desc      Verify any composition of two neutral alpha rows keeps
     *               the alpha row neutral in the product.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const composed: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.contrastMatrix(2),
        ColorMatrixUtil.saturationMatrix(0));
      expect(composed.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(composed, 16)).assertEqual(0);
      expect(entryOf(composed, 17)).assertEqual(0);
      expect(entryOf(composed, 18)).assertEqual(1);
      expect(entryOf(composed, 19)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0700
     * @tc.name      testColorMatrixUtil0007
     * @tc.desc      Verify composing the contrast matrix with itself squares
     *               the scale to four and the offset to minus one point five.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const composed: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.contrastMatrix(2),
        ColorMatrixUtil.contrastMatrix(2));
      expect(entryOf(composed, 0)).assertEqual(4);
      expect(entryOf(composed, 4)).assertEqual(-1.5);
      expect(entryOf(composed, 6)).assertEqual(4);
      expect(entryOf(composed, 9)).assertEqual(-1.5);
      expect(entryOf(composed, 12)).assertEqual(4);
      expect(entryOf(composed, 14)).assertEqual(-1.5);
      expect(entryOf(composed, 18)).assertEqual(1);
      const squared: number[] = ColorMatrixUtil.contrastMatrix(4);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(composed, index)).assertEqual(entryOf(squared, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0800
     * @tc.name      testColorMatrixUtil0008
     * @tc.desc      Verify composing the warm tint with itself doubles the
     *               offset column while the diagonal stays one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrixUtil0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrixUtil0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const warm: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.WARM);
      const composed: number[] = ColorMatrixUtil.multiply(warm, warm);
      expect(composed.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(composed, 0)).assertEqual(1);
      expect(entryOf(composed, 6)).assertEqual(1);
      expect(entryOf(composed, 12)).assertEqual(1);
      expect(entryOf(composed, 4)).assertEqual(0.28);
      expect(entryOf(composed, 14)).assertEqual(-0.28);
      const greenLift: number = entryOf(composed, 9) * 1000;
      expect(Math.round(greenLift)).assertEqual(84);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_0900
     * @tc.name      testColorMatrixUtil0009
     * @tc.desc      Verify the contrast matrix of scale two carries the
     *               scale on the diagonal and minus point five offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(2);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(matrix, 0)).assertEqual(2);
      expect(entryOf(matrix, 4)).assertEqual(-0.5);
      expect(entryOf(matrix, 6)).assertEqual(2);
      expect(entryOf(matrix, 9)).assertEqual(-0.5);
      expect(entryOf(matrix, 12)).assertEqual(2);
      expect(entryOf(matrix, 14)).assertEqual(-0.5);
      expect(entryOf(matrix, 18)).assertEqual(1);
      expect(entryOf(matrix, 19)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1000
     * @tc.name      testColorMatrixUtil0010
     * @tc.desc      Verify the contrast matrix of scale one equals the
     *               identity transform with zero offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(1);
      const neutral: number[] = ColorMatrixUtil.identity();
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1100
     * @tc.name      testColorMatrixUtil0011
     * @tc.desc      Verify the contrast matrix of scale zero collapses the
     *               channels and offsets them by point five.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(0);
      expect(entryOf(matrix, 0)).assertEqual(0);
      expect(entryOf(matrix, 4)).assertEqual(0.5);
      expect(entryOf(matrix, 6)).assertEqual(0);
      expect(entryOf(matrix, 9)).assertEqual(0.5);
      expect(entryOf(matrix, 12)).assertEqual(0);
      expect(entryOf(matrix, 14)).assertEqual(0.5);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1200
     * @tc.name      testColorMatrixUtil0012
     * @tc.desc      Verify the contrast matrix of scale one point five uses
     *               the exact negative quarter offset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(1.5);
      expect(entryOf(matrix, 0)).assertEqual(1.5);
      expect(entryOf(matrix, 4)).assertEqual(-0.25);
      expect(entryOf(matrix, 6)).assertEqual(1.5);
      expect(entryOf(matrix, 9)).assertEqual(-0.25);
      expect(entryOf(matrix, 12)).assertEqual(1.5);
      expect(entryOf(matrix, 14)).assertEqual(-0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1300
     * @tc.name      testColorMatrixUtil0013
     * @tc.desc      Verify a negative contrast scale is used as given and
     *               the offset formula yields one for scale minus one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrixUtil0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrixUtil0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(-1);
      expect(entryOf(matrix, 0)).assertEqual(-1);
      expect(entryOf(matrix, 4)).assertEqual(1);
      expect(entryOf(matrix, 6)).assertEqual(-1);
      expect(entryOf(matrix, 9)).assertEqual(1);
      expect(entryOf(matrix, 12)).assertEqual(-1);
      expect(entryOf(matrix, 14)).assertEqual(1);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1400
     * @tc.name      testColorMatrixUtil0014
     * @tc.desc      Verify the contrast matrix of scale point five uses the
     *               exact quarter offset on every channel row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.contrastMatrix(0.5);
      expect(entryOf(matrix, 0)).assertEqual(0.5);
      expect(entryOf(matrix, 4)).assertEqual(0.25);
      expect(entryOf(matrix, 6)).assertEqual(0.5);
      expect(entryOf(matrix, 9)).assertEqual(0.25);
      expect(entryOf(matrix, 12)).assertEqual(0.5);
      expect(entryOf(matrix, 14)).assertEqual(0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1500
     * @tc.name      testColorMatrixUtil0015
     * @tc.desc      Verify the saturation matrix of one is the identity
     *               transform because the luma weight vanishes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.saturationMatrix(1);
      const neutral: number[] = ColorMatrixUtil.identity();
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1600
     * @tc.name      testColorMatrixUtil0016
     * @tc.desc      Verify the saturation matrix of zero carries the exact
     *               luminance weights on the first row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.saturationMatrix(0);
      expect(entryOf(matrix, 0)).assertEqual(0.2126);
      expect(entryOf(matrix, 1)).assertEqual(0.7152);
      expect(entryOf(matrix, 2)).assertEqual(0.0722);
      expect(entryOf(matrix, 3)).assertEqual(0);
      expect(entryOf(matrix, 4)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1700
     * @tc.name      testColorMatrixUtil0017
     * @tc.desc      Verify the saturation matrix of zero repeats the luma
     *               weights on the green and blue rows and keeps alpha.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.saturationMatrix(0);
      expect(entryOf(matrix, 5)).assertEqual(0.2126);
      expect(entryOf(matrix, 6)).assertEqual(0.7152);
      expect(entryOf(matrix, 7)).assertEqual(0.0722);
      expect(entryOf(matrix, 10)).assertEqual(0.2126);
      expect(entryOf(matrix, 11)).assertEqual(0.7152);
      expect(entryOf(matrix, 12)).assertEqual(0.0722);
      expect(entryOf(matrix, 16)).assertEqual(0);
      expect(entryOf(matrix, 18)).assertEqual(1);
      expect(entryOf(matrix, 19)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1800
     * @tc.name      testColorMatrixUtil0018
     * @tc.desc      Verify the saturation matrix of two negates the luma
     *               weights and pushes the diagonal beyond two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrixUtil0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrixUtil0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.saturationMatrix(2);
      expect(entryOf(matrix, 1)).assertEqual(-0.7152);
      expect(entryOf(matrix, 2)).assertEqual(-0.0722);
      expect(entryOf(matrix, 5)).assertEqual(-0.2126);
      expect(entryOf(matrix, 7)).assertEqual(-0.0722);
      const redDiagonal: number = entryOf(matrix, 0);
      expect(redDiagonal).assertLarger(1.787);
      expect(redDiagonal).assertLess(1.788);
      const greenDiagonal: number = entryOf(matrix, 6);
      expect(greenDiagonal).assertLarger(1.284);
      expect(greenDiagonal).assertLess(1.285);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_1900
     * @tc.name      testColorMatrixUtil0019
     * @tc.desc      Verify the saturation matrix of point five halves the
     *               luma weights exactly and lifts the red diagonal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.saturationMatrix(0.5);
      expect(entryOf(matrix, 1)).assertEqual(0.3576);
      expect(entryOf(matrix, 2)).assertEqual(0.0361);
      expect(entryOf(matrix, 7)).assertEqual(0.0361);
      expect(entryOf(matrix, 11)).assertEqual(0.3576);
      const redDiagonal: number = entryOf(matrix, 0);
      expect(redDiagonal).assertLarger(0.606);
      expect(redDiagonal).assertLess(0.607);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2000
     * @tc.name      testColorMatrixUtil0020
     * @tc.desc      Verify the tint matrix of the original preset equals the
     *               neutral identity matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.ORIGINAL);
      const neutral: number[] = ColorMatrixUtil.identity();
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2100
     * @tc.name      testColorMatrixUtil0021
     * @tc.desc      Verify the tint matrix of the gray preset falls into the
     *               neutral branch and equals the identity matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.GRAY);
      const neutral: number[] = ColorMatrixUtil.identity();
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2200
     * @tc.name      testColorMatrixUtil0022
     * @tc.desc      Verify the tint matrix of the invert preset falls into
     *               the neutral branch and equals the identity matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.INVERT);
      const neutral: number[] = ColorMatrixUtil.identity();
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2300
     * @tc.name      testColorMatrixUtil0023
     * @tc.desc      Verify the warm tint lifts red and blue by the fixed
     *               fourteen percent offset in opposite directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.WARM);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(matrix, 0)).assertEqual(1);
      expect(entryOf(matrix, 4)).assertEqual(0.14);
      expect(entryOf(matrix, 14)).assertEqual(-0.14);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2400
     * @tc.name      testColorMatrixUtil0024
     * @tc.desc      Verify the warm tint lifts green by thirty percent of
     *               the tint offset and keeps the row structure.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.WARM);
      const greenLift: number = entryOf(matrix, 9) * 1000;
      expect(Math.round(greenLift)).assertEqual(42);
      expect(entryOf(matrix, 5)).assertEqual(0);
      expect(entryOf(matrix, 6)).assertEqual(1);
      expect(entryOf(matrix, 7)).assertEqual(0);
      expect(entryOf(matrix, 8)).assertEqual(0);
      expect(entryOf(matrix, 10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2500
     * @tc.name      testColorMatrixUtil0025
     * @tc.desc      Verify the cool tint mirrors the warm offsets by pulling
     *               red down and pushing blue up.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.COOL);
      expect(entryOf(matrix, 4)).assertEqual(-0.14);
      expect(entryOf(matrix, 14)).assertEqual(0.14);
      const greenLift: number = entryOf(matrix, 9) * 1000;
      expect(Math.round(greenLift)).assertEqual(28);
      expect(entryOf(matrix, 0)).assertEqual(1);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2600
     * @tc.name      testColorMatrixUtil0026
     * @tc.desc      Verify the high contrast preset reuses the fixed
     *               contrast matrix around the scale of one point six.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.HIGH_CONTRAST);
      const preset: number[] = ColorMatrixUtil.contrastMatrix(1.6);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(preset, index));
      }
      expect(entryOf(matrix, 0)).assertEqual(1.6);
      const offset: number = entryOf(matrix, 4);
      expect(offset).assertLess(-0.29);
      expect(offset).assertLarger(-0.31);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2700
     * @tc.name      testColorMatrixUtil0027
     * @tc.desc      Verify the builder with neutral parameters returns the
     *               identity matrix entry by entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.ORIGINAL);
      const neutral: number[] = ColorMatrixUtil.identity();
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(neutral, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2800
     * @tc.name      testColorMatrixUtil0028
     * @tc.desc      Verify the builder with neutral parameters and the warm
     *               filter equals the warm tint matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.WARM);
      const warm: number[] = ColorMatrixUtil.tintMatrix(MediaFilterType.WARM);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(matrix, index)).assertEqual(entryOf(warm, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_2900
     * @tc.name      testColorMatrixUtil0029
     * @tc.desc      Verify the builder applies the contrast stage of two and
     *               keeps the offsets at minus point five.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(2, 1, MediaFilterType.ORIGINAL);
      expect(entryOf(matrix, 0)).assertEqual(2);
      expect(entryOf(matrix, 4)).assertEqual(-0.5);
      expect(entryOf(matrix, 6)).assertEqual(2);
      expect(entryOf(matrix, 12)).assertEqual(2);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3000
     * @tc.name      testColorMatrixUtil0030
     * @tc.desc      Verify the builder applies the grayscale saturation
     *               stage and keeps the exact luminance weights.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrixUtil0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrixUtil0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 0, MediaFilterType.ORIGINAL);
      expect(entryOf(matrix, 0)).assertEqual(0.2126);
      expect(entryOf(matrix, 1)).assertEqual(0.7152);
      expect(entryOf(matrix, 2)).assertEqual(0.0722);
      expect(entryOf(matrix, 6)).assertEqual(0.7152);
      expect(entryOf(matrix, 12)).assertEqual(0.0722);
      expect(entryOf(matrix, 18)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3100
     * @tc.name      testColorMatrixUtil0031
     * @tc.desc      Verify the builder composes contrast, saturation and
     *               tint while the alpha row stays neutral.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(2, 2, MediaFilterType.WARM);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      expect(entryOf(matrix, 16)).assertEqual(0);
      expect(entryOf(matrix, 17)).assertEqual(0);
      expect(entryOf(matrix, 18)).assertEqual(1);
      expect(entryOf(matrix, 19)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3200
     * @tc.name      testColorMatrixUtil0032
     * @tc.desc      Verify the builder with neutral parameters and the high
     *               contrast filter uses the scale of one point six.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.HIGH_CONTRAST);
      expect(entryOf(matrix, 0)).assertEqual(1.6);
      expect(entryOf(matrix, 6)).assertEqual(1.6);
      expect(entryOf(matrix, 12)).assertEqual(1.6);
      const offset: number = entryOf(matrix, 4);
      expect(offset).assertLess(-0.29);
      expect(offset).assertLarger(-0.31);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3300
     * @tc.name      testColorMatrixUtil0033
     * @tc.desc      Verify the builder with neutral parameters and the cool
     *               filter mirrors the warm offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.COOL);
      expect(entryOf(matrix, 4)).assertEqual(-0.14);
      expect(entryOf(matrix, 14)).assertEqual(0.14);
      const greenLift: number = entryOf(matrix, 9) * 1000;
      expect(Math.round(greenLift)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3400
     * @tc.name      testColorMatrixUtil0034
     * @tc.desc      Verify the builder with zero contrast collapses the
     *               channels onto the middle grey offset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrixUtil0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrixUtil0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(0, 1, MediaFilterType.ORIGINAL);
      expect(entryOf(matrix, 0)).assertEqual(0);
      expect(entryOf(matrix, 4)).assertEqual(0.5);
      expect(entryOf(matrix, 6)).assertEqual(0);
      expect(entryOf(matrix, 9)).assertEqual(0.5);
      expect(entryOf(matrix, 12)).assertEqual(0);
      expect(entryOf(matrix, 14)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3500
     * @tc.name      testColorMatrixUtil0035
     * @tc.desc      Verify the builder with doubled saturation negates the
     *               luma weights and keeps the alpha row neutral.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testColorMatrixUtil0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testColorMatrixUtil0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[] = ColorMatrixUtil.build(1, 2, MediaFilterType.GRAY);
      expect(entryOf(matrix, 1)).assertEqual(-0.7152);
      expect(entryOf(matrix, 2)).assertEqual(-0.0722);
      expect(entryOf(matrix, 5)).assertEqual(-0.2126);
      expect(entryOf(matrix, 18)).assertEqual(1);
      const redDiagonal: number = entryOf(matrix, 0);
      expect(redDiagonal).assertLarger(1.787);
      expect(redDiagonal).assertLess(1.788);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_CMTMAT_3600
     * @tc.name      testColorMatrixUtil0036
     * @tc.desc      Verify multiplying the warm tint by the identity equals
     *               the builder result for neutral parameters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrixUtil0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testColorMatrixUtil0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const composed: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.tintMatrix(MediaFilterType.WARM),
        ColorMatrixUtil.identity());
      const built: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.WARM);
      expect(composed.length).assertEqual(built.length);
      for (let index: number = 0; index < MATRIX_SIZE; index++) {
        expect(entryOf(composed, index)).assertEqual(entryOf(built, index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
