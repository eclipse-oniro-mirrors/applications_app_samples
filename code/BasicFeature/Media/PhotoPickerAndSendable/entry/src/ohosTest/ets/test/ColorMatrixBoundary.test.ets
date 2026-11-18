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

/** Expected number of values in one flat 4x5 color matrix. */
const MATRIX_SIZE: number = 20;
/** Row length of the flat 4x5 matrix. */
const ROW_SIZE: number = 5;
/** Tolerance used for every floating point matrix comparison. */
const MATRIX_TOLERANCE: number = 0.0001;
/** Standard luminance weight of the red channel used by the saturation stage. */
const LUMA_RED: number = 0.2126;
/** Standard luminance weight of the green channel used by the saturation stage. */
const LUMA_GREEN: number = 0.7152;
/** Standard luminance weight of the blue channel used by the saturation stage. */
const LUMA_BLUE: number = 0.0722;
/** Lower bound of the offset column accepted by effectKit. */
const OFFSET_LOW: number = -1;
/** Upper bound of the offset column accepted by effectKit. */
const OFFSET_HIGH: number = 1;
/** Normalized tint offset of the warm and cool preset filters. */
const TINT_OFFSET: number = 0.14;

/**
 * Returns true when the actual value stays inside the tolerance around the expected value.
 * @param expected Value the implementation is supposed to produce.
 * @param actual Value the implementation produced.
 * @return True when both values match within the tolerance.
 */
function near(expected: number, actual: number): boolean {
  return Math.abs(actual - expected) < MATRIX_TOLERANCE;
}

/**
 * Returns true when the offset column value stays inside the effectKit range.
 * @param value Offset column value of one matrix row.
 * @return True when the value stays inside the closed range of minus one to one.
 */
function inOffsetRange(value: number): boolean {
  return value >= OFFSET_LOW && value <= OFFSET_HIGH;
}

/**
 * Registers every color matrix boundary case of the shared library.
 * All methods under test are pure static helpers, no ability context is required.
 */
export default function colorMatrixBoundaryTest() {
  describe('ColorMatrixBoundaryTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0100
     * @tc.name      testColorMatrix0003
     * @tc.desc      Verify the identity matrix structure and that multiplying
     *               by the identity keeps any composed matrix unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The identity matrix puts one on every diagonal slot and zero everywhere else.
      const identity: number[] = ColorMatrixUtil.identity();
      expect(identity.length).assertEqual(MATRIX_SIZE);
      for (let index = 0; index < MATRIX_SIZE; index++) {
        const row: number = Math.floor(index / ROW_SIZE);
        const column: number = index % ROW_SIZE;
        const expected: number = row === column ? 1 : 0;
        expect(identity[index]).assertEqual(expected);
      }
      // Multiplying the contrast matrix by the identity from the right keeps every value.
      const contrast: number[] = ColorMatrixUtil.contrastMatrix(2);
      const rightProduct: number[] = ColorMatrixUtil.multiply(contrast, ColorMatrixUtil.identity());
      for (let index = 0; index < MATRIX_SIZE; index++) {
        expect(near(contrast[index], rightProduct[index])).assertTrue();
      }
      // Multiplying the grayscale matrix by the identity from the left keeps every value too.
      const saturation: number[] = ColorMatrixUtil.saturationMatrix(0);
      const leftProduct: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.identity(), saturation);
      for (let index = 0; index < MATRIX_SIZE; index++) {
        expect(near(saturation[index], leftProduct[index])).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0200
     * @tc.name      testColorMatrix0004
     * @tc.desc      Verify the composed contrast, saturation and preset tint
     *               matrix for every crossed parameter pair and filter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // One contrast value is paired with one saturation value per crossed row.
      const pairContrasts: number[] = [0.5, 0.5, 2, 2];
      const pairSaturations: number[] = [0, 2, 0, 2];
      // Three presets cover the no tint, default branch and offset tint behaviour.
      const filters: MediaFilterType[] = [MediaFilterType.ORIGINAL, MediaFilterType.GRAY,
        MediaFilterType.COOL];
      // Extra red offset the preset tint adds on top of the composed stages.
      const tintRedDelta: number[] = [0, 0, -TINT_OFFSET];
      for (let pairIdx = 0; pairIdx < pairContrasts.length; pairIdx++) {
        const contrast: number = pairContrasts[pairIdx];
        const saturation: number = pairSaturations[pairIdx];
        for (let filterIdx = 0; filterIdx < filters.length; filterIdx++) {
          const matrix: number[] = ColorMatrixUtil.build(contrast, saturation, filters[filterIdx]);
          // Every composed matrix keeps the effectKit value count.
          expect(matrix.length).assertEqual(MATRIX_SIZE);
          // The alpha row stays neutral for every crossed combination.
          expect(matrix[18]).assertEqual(1);
          // The red factor carries the saturation luma blend scaled by the contrast stage.
          const expectedRedFactor: number = ((1 - saturation) * LUMA_RED + saturation) * contrast;
          expect(near(expectedRedFactor, matrix[0])).assertTrue();
          // The red offset carries the contrast shift plus the tint delta of the preset.
          const expectedRedOffset: number = (1 - contrast) * 0.5 + tintRedDelta[filterIdx];
          expect(near(expectedRedOffset, matrix[4])).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0300
     * @tc.name      testColorMatrix0005
     * @tc.desc      Verify the contrast stage output for zero, negative and
     *               extreme multipliers including the exact range edges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Zero contrast collapses every channel onto the stable middle grey offset.
      const zero: number[] = ColorMatrixUtil.build(0, 1, MediaFilterType.ORIGINAL);
      expect(zero[0]).assertEqual(0);
      expect(zero[6]).assertEqual(0);
      expect(zero[4]).assertEqual(0.5);
      expect(zero[9]).assertEqual(0.5);
      expect(zero[18]).assertEqual(1);
      // Minus one contrast flips the channels while the offset reaches the upper edge.
      const flip: number[] = ColorMatrixUtil.build(-1, 1, MediaFilterType.ORIGINAL);
      expect(flip[0]).assertEqual(-1);
      expect(flip[4]).assertEqual(1);
      expect(flip[18]).assertEqual(1);
      // Minus two contrast keeps the linear rule and drives the offset past the edge.
      const deepFlip: number[] = ColorMatrixUtil.build(-2, 1, MediaFilterType.ORIGINAL);
      expect(deepFlip[0]).assertEqual(-2);
      expect(near(1.5, deepFlip[4])).assertTrue();
      // Three contrast still sits exactly on the lower range edge.
      const strong: number[] = ColorMatrixUtil.build(3, 1, MediaFilterType.ORIGINAL);
      expect(strong[0]).assertEqual(3);
      expect(strong[4]).assertEqual(-1);
      // Four contrast drives the offset past the lower edge with the factor still linear.
      const extreme: number[] = ColorMatrixUtil.build(4, 1, MediaFilterType.ORIGINAL);
      expect(extreme[0]).assertEqual(4);
      expect(near(-1.5, extreme[4])).assertTrue();
      expect(extreme[18]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0400
     * @tc.name      testColorMatrix0006
     * @tc.desc      Verify the saturation stage output for zero, negative and
     *               extreme multipliers keeps the white point stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Zero, negative and extreme saturation values exercise the luma rule.
      const saturationList: number[] = [2, -0.5, 5];
      for (let sIdx = 0; sIdx < saturationList.length; sIdx++) {
        const saturation: number = saturationList[sIdx];
        const matrix: number[] = ColorMatrixUtil.saturationMatrix(saturation);
        const inverse: number = 1 - saturation;
        // Every colour row keeps the white point because the three factors sum to one.
        expect(near(1, matrix[0] + matrix[1] + matrix[2])).assertTrue();
        expect(near(1, matrix[5] + matrix[6] + matrix[7])).assertTrue();
        expect(near(1, matrix[10] + matrix[11] + matrix[12])).assertTrue();
        // Each diagonal carries the scaled luma weight plus the saturation lift.
        expect(near(inverse * LUMA_RED + saturation, matrix[0])).assertTrue();
        expect(near(inverse * LUMA_GREEN + saturation, matrix[6])).assertTrue();
        expect(near(inverse * LUMA_BLUE + saturation, matrix[12])).assertTrue();
      }
      // Full grayscale keeps every offset column at zero and the alpha row neutral.
      const gray: number[] = ColorMatrixUtil.saturationMatrix(0);
      expect(near(LUMA_RED + LUMA_GREEN + LUMA_BLUE, gray[0] + gray[1] + gray[2])).assertTrue();
      expect(gray[4]).assertEqual(0);
      expect(gray[19]).assertEqual(0);
      expect(gray[18]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0500
     * @tc.name      testColorMatrix0007
     * @tc.desc      Verify every preset filter keeps the effectKit value
     *               count, the offset range and the exact tint values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Five presets share the offset only tint shape checked in the sweep below.
      const presets: MediaFilterType[] = [MediaFilterType.ORIGINAL, MediaFilterType.GRAY,
        MediaFilterType.INVERT, MediaFilterType.WARM, MediaFilterType.COOL];
      for (let pIdx = 0; pIdx < presets.length; pIdx++) {
        const matrix: number[] = ColorMatrixUtil.build(1, 1, presets[pIdx]);
        // Every preset keeps the effectKit value count.
        expect(matrix.length).assertEqual(MATRIX_SIZE);
        // The offset column of every row stays inside the effectKit range.
        expect(inOffsetRange(matrix[4])).assertTrue();
        expect(inOffsetRange(matrix[9])).assertTrue();
        expect(inOffsetRange(matrix[14])).assertTrue();
        expect(inOffsetRange(matrix[19])).assertTrue();
        // The green and blue diagonal factors stay at one for the offset only presets.
        expect(near(1, matrix[6])).assertTrue();
        expect(near(1, matrix[12])).assertTrue();
      }
      // The warm preset lifts the green channel slightly to keep skin tones natural.
      const warm: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.WARM);
      expect(near(TINT_OFFSET * 0.3, warm[9])).assertTrue();
      // The cool preset lowers the red channel and lifts the green one a bit less.
      const cool: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.COOL);
      expect(near(-TINT_OFFSET, cool[4])).assertTrue();
      expect(near(TINT_OFFSET * 0.2, cool[9])).assertTrue();
      // The invert preset takes the default branch and applies no tint at all.
      const invert: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.INVERT);
      expect(invert[0]).assertEqual(1);
      expect(invert[4]).assertEqual(0);
      // The high contrast preset reuses the fixed contrast matrix around middle grey.
      const highContrast: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.HIGH_CONTRAST);
      expect(near(1.6, highContrast[0])).assertTrue();
      expect(near(-0.3, highContrast[4])).assertTrue();
      expect(near(-0.3, highContrast[14])).assertTrue();
      expect(highContrast[18]).assertEqual(1);
      // The fixed contrast offset of the preset stays inside the effectKit range.
      expect(inOffsetRange(highContrast[4])).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIXX_0600
     * @tc.name      testColorMatrix0008
     * @tc.desc      Verify the stage composition order is not commutative and
     *               the build pipeline applies the preset tint last.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testColorMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Tint over contrast: the warm red offset rides on the contrast shift.
      const tintFirst: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.tintMatrix(MediaFilterType.WARM),
        ColorMatrixUtil.contrastMatrix(2));
      expect(near(-0.36, tintFirst[4])).assertTrue();
      // Contrast over tint: the contrast stage scales the warm red offset instead.
      const contrastFirst: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.contrastMatrix(2),
        ColorMatrixUtil.tintMatrix(MediaFilterType.WARM));
      expect(near(-0.22, contrastFirst[4])).assertTrue();
      // Both orders differ, so the stage composition is not commutative.
      expect(Math.abs(tintFirst[4] - contrastFirst[4]) > 0.001).assertTrue();
      // The build pipeline applies the tint last and matches the tint over contrast order.
      const composed: number[] = ColorMatrixUtil.build(2, 1, MediaFilterType.WARM);
      expect(near(tintFirst[4], composed[4])).assertTrue();
      // The red factor still carries the linear contrast scale of the composed pipeline.
      expect(composed[0]).assertEqual(2);
      // The warm green offset rides on the contrast shift of the green row as well.
      expect(near(-0.458, composed[9])).assertTrue();
      // A saturation change alone never moves the red offset away from the tint value.
      const saturated: number[] = ColorMatrixUtil.build(1, 2, MediaFilterType.WARM);
      expect(near(TINT_OFFSET, saturated[4])).assertTrue();
      // The saturated composition still carries the luma blend on the red factor.
      expect(near(2 - LUMA_RED, saturated[0])).assertTrue();
    });
  });
}
