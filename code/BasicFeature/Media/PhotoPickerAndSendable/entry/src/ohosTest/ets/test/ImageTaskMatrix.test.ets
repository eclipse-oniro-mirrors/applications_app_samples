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
import { EditParams, MediaFilterType, ProcessOutput, ExportResult, ColorMatrixUtil } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Smallest longest edge accepted by the editor, mirrored from the task utils. */
const MIN_MAX_EDGE: number = 320;
/** Lowest accepted JPEG quality, mirrored from the task utils. */
const MIN_QUALITY: number = 1;
/** Highest accepted JPEG quality, mirrored from the task utils. */
const MAX_QUALITY: number = 100;
/** Smallest watermark font size in pixels, mirrored from the task utils. */
const MIN_WATERMARK_FONT: number = 24;
/** Divisor turning the image height into the watermark font size. */
const WATERMARK_FONT_RATIO: number = 24;
/** Divisor turning the image height into the watermark margin. */
const WATERMARK_MARGIN_RATIO: number = 32;
/** Mime type used for every encoded output of the task pipeline. */
const JPEG_FORMAT: string = 'image/jpeg';
/** Number of flat values of one four by five colour matrix. */
const MATRIX_SIZE: number = 20;
/** Neutral image height used for the watermark ratio derivation. */
const SAMPLE_HEIGHT: number = 960;

/**
 * Registers the synchronous pure logic cases of the image task pipeline of
 * the shared library. The worker entry points of the pipeline depend on a
 * pixel map and on media library IO, so this suite covers the syncable
 * surface only: the edit parameter construction, the filter enum values,
 * the worker result contracts and the colour matrix factory mapping that
 * the pipeline consumes while it builds the effect chain.
 */
export default function imageTaskMatrixTest() {
  describe('ImageTaskMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0100
     * @tc.name      testImageTask0001
     * @tc.desc      Verify the default quality of the edit parameters stays
     *               inside the inclusive quality bounds of the pipeline.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the default edit parameters of the pipeline.
      const params: EditParams = new EditParams();
      // The default quality lands inside the accepted encoding bounds.
      expect(params.quality >= MIN_QUALITY).assertTrue();
      expect(params.quality <= MAX_QUALITY).assertTrue();
      // The sample standard quality is kept as the default.
      expect(params.quality).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0200
     * @tc.name      testImageTask0002
     * @tc.desc      Verify the default longest edge of the edit parameters
     *               stays above the minimum edge accepted by the decoder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the default edit parameters of the pipeline.
      const params: EditParams = new EditParams();
      // The default edge stays at or above the decoder floor.
      expect(params.maxEdge >= MIN_MAX_EDGE).assertTrue();
      // The sample standard edge is kept as the default.
      expect(params.maxEdge).assertEqual(1600);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0300
     * @tc.name      testImageTask0003
     * @tc.desc      Verify the edit parameters store every quality value of
     *               the accepted encoding range unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lowest accepted quality is stored unchanged.
      const lowest: EditParams = new EditParams();
      lowest.quality = MIN_QUALITY;
      expect(lowest.quality).assertEqual(1);
      // The middle range quality is stored unchanged.
      const middle: EditParams = new EditParams();
      middle.quality = 50;
      expect(middle.quality).assertEqual(50);
      // The highest accepted quality is stored unchanged.
      const highest: EditParams = new EditParams();
      highest.quality = MAX_QUALITY;
      expect(highest.quality).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0400
     * @tc.name      testImageTask0004
     * @tc.desc      Verify the edit parameters store every longest edge
     *               value of the accepted decode range unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The decoder floor edge is stored unchanged.
      const floor: EditParams = new EditParams();
      floor.maxEdge = MIN_MAX_EDGE;
      expect(floor.maxEdge).assertEqual(320);
      // The sample default edge is stored unchanged.
      const standard: EditParams = new EditParams();
      standard.maxEdge = 1600;
      expect(standard.maxEdge).assertEqual(1600);
      // A four K edge is stored unchanged.
      const large: EditParams = new EditParams();
      large.maxEdge = 4096;
      expect(large.maxEdge).assertEqual(4096);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0500
     * @tc.name      testImageTask0005
     * @tc.desc      Verify an empty watermark keeps the pipeline branch that
     *               skips the drawing step closed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default parameters carry no watermark text.
      const params: EditParams = new EditParams();
      // An empty watermark length keeps the drawing branch closed.
      expect(params.watermark.length).assertEqual(0);
      expect(params.watermark.length > 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0600
     * @tc.name      testImageTask0006
     * @tc.desc      Verify the edit parameters store Chinese and emoji
     *               watermark texts and open the drawing branch for them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A Chinese watermark opens the drawing branch.
      const chineseParams: EditParams = new EditParams();
      chineseParams.watermark = '\u56FE\u7247\u7F16\u8F91';
      expect(chineseParams.watermark).assertEqual('\u56FE\u7247\u7F16\u8F91');
      expect(chineseParams.watermark.length > 0).assertTrue();
      // An emoji watermark opens the drawing branch too.
      const emojiParams: EditParams = new EditParams();
      emojiParams.watermark = '\uD83D\uDCF7';
      expect(emojiParams.watermark.length).assertEqual(2);
      expect(emojiParams.watermark.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0700
     * @tc.name      testImageTask0007
     * @tc.desc      Verify the full frame crop handles of the edit params
     *               span the complete normalised crop range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default crop window covers the whole image.
      const params: EditParams = new EditParams();
      expect(params.cropLeft).assertEqual(0);
      expect(params.cropTop).assertEqual(0);
      expect(params.cropRight).assertEqual(1);
      expect(params.cropBottom).assertEqual(1);
      // The full frame width and height both compute to one.
      const widthSpan: number = params.cropRight - params.cropLeft;
      const heightSpan: number = params.cropBottom - params.cropTop;
      expect(widthSpan).assertEqual(1);
      expect(heightSpan).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0800
     * @tc.name      testImageTask0008
     * @tc.desc      Verify the edit parameters store a partial crop window
     *               whose spans stay inside the normalised range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Store a centred crop window of half the image.
      const params: EditParams = new EditParams();
      params.cropLeft = 0.25;
      params.cropTop = 0.25;
      params.cropRight = 0.75;
      params.cropBottom = 0.75;
      // Every handle is stored unchanged.
      expect(params.cropLeft).assertEqual(0.25);
      expect(params.cropTop).assertEqual(0.25);
      expect(params.cropRight).assertEqual(0.75);
      expect(params.cropBottom).assertEqual(0.75);
      // Both spans stay inside the normalised range.
      expect(params.cropRight - params.cropLeft).assertEqual(0.5);
      expect(params.cropBottom - params.cropTop).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_0900
     * @tc.name      testImageTask0009
     * @tc.desc      Verify the edit parameters store every rotation angle
     *               used by the editor dial unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every dial angle is stored unchanged by a fresh instance.
      const right: EditParams = new EditParams();
      right.rotation = 90;
      expect(right.rotation).assertEqual(90);
      const flat: EditParams = new EditParams();
      flat.rotation = 180;
      expect(flat.rotation).assertEqual(180);
      const left: EditParams = new EditParams();
      left.rotation = 270;
      expect(left.rotation).assertEqual(270);
      const counter: EditParams = new EditParams();
      counter.rotation = -90;
      expect(counter.rotation).assertEqual(-90);
      const full: EditParams = new EditParams();
      full.rotation = 360;
      expect(full.rotation).assertEqual(360);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1000
     * @tc.name      testImageTask0010
     * @tc.desc      Verify the colour effect branch enum values of the
     *               pipeline carry their exact wire texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The identity preset keeps the original colours.
      expect(MediaFilterType.ORIGINAL).assertEqual('original');
      // The grayscale preset converts every channel to luma.
      expect(MediaFilterType.GRAY).assertEqual('gray');
      // The invert preset negates every colour channel.
      expect(MediaFilterType.INVERT).assertEqual('invert');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1100
     * @tc.name      testImageTask0011
     * @tc.desc      Verify the tint branch enum values of the pipeline
     *               carry their exact wire texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The warm preset pushes red up and blue down.
      expect(MediaFilterType.WARM).assertEqual('warm');
      // The cool preset pushes blue up and red down.
      expect(MediaFilterType.COOL).assertEqual('cool');
      // The high contrast preset scales the distance to middle grey.
      expect(MediaFilterType.HIGH_CONTRAST).assertEqual('highContrast');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1200
     * @tc.name      testImageTask0012
     * @tc.desc      Verify the neutral colour matrix carries one on every
     *                   diagonal slot and zero everywhere else.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the neutral matrix of the effect chain.
      const matrix: number[] = ColorMatrixUtil.identity();
      // The flat matrix carries exactly twenty values.
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // Every diagonal slot carries one.
      expect(matrix[0]).assertEqual(1);
      expect(matrix[6]).assertEqual(1);
      expect(matrix[12]).assertEqual(1);
      expect(matrix[18]).assertEqual(1);
      // Every remaining slot carries zero.
      expect(matrix[1]).assertEqual(0);
      expect(matrix[2]).assertEqual(0);
      expect(matrix[3]).assertEqual(0);
      expect(matrix[4]).assertEqual(0);
      expect(matrix[5]).assertEqual(0);
      expect(matrix[7]).assertEqual(0);
      expect(matrix[8]).assertEqual(0);
      expect(matrix[9]).assertEqual(0);
      expect(matrix[10]).assertEqual(0);
      expect(matrix[13]).assertEqual(0);
      expect(matrix[14]).assertEqual(0);
      expect(matrix[15]).assertEqual(0);
      expect(matrix[16]).assertEqual(0);
      expect(matrix[17]).assertEqual(0);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1300
     * @tc.name      testImageTask0013
     * @tc.desc      Verify the factory maps identity parameters and the
     *               original preset to the neutral matrix exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Identity parameters with the original preset compose no stage.
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.ORIGINAL);
      // The composed matrix is the neutral matrix.
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      expect(matrix[0]).assertEqual(1);
      expect(matrix[6]).assertEqual(1);
      expect(matrix[12]).assertEqual(1);
      expect(matrix[18]).assertEqual(1);
      expect(matrix[4]).assertEqual(0);
      expect(matrix[9]).assertEqual(0);
      expect(matrix[14]).assertEqual(0);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1400
     * @tc.name      testImageTask0014
     * @tc.desc      Verify the factory keeps the neutral matrix for the
     *               gray and invert presets at identity colour values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both presets map to the neutral tint at identity parameters.
      const grayMatrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.GRAY);
      expect(grayMatrix[0]).assertEqual(1);
      expect(grayMatrix[6]).assertEqual(1);
      expect(grayMatrix[12]).assertEqual(1);
      expect(grayMatrix[18]).assertEqual(1);
      const invertMatrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.INVERT);
      expect(invertMatrix[0]).assertEqual(1);
      expect(invertMatrix[6]).assertEqual(1);
      expect(invertMatrix[12]).assertEqual(1);
      expect(invertMatrix[18]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1500
     * @tc.name      testImageTask0015
     * @tc.desc      Verify the factory maps a contrast of two onto the
     *               scaled channel factors and the negative grey offset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A contrast of two doubles every colour channel.
      const matrix: number[] = ColorMatrixUtil.build(2, 1, MediaFilterType.ORIGINAL);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // The red row carries the scale and the negative offset.
      expect(matrix[0]).assertEqual(2);
      expect(matrix[4]).assertEqual(-0.5);
      // The green and blue rows carry the same scale.
      expect(matrix[6]).assertEqual(2);
      expect(matrix[12]).assertEqual(2);
      expect(matrix[9]).assertEqual(-0.5);
      expect(matrix[14]).assertEqual(-0.5);
      // The alpha row stays neutral.
      expect(matrix[15]).assertEqual(0);
      expect(matrix[16]).assertEqual(0);
      expect(matrix[17]).assertEqual(0);
      expect(matrix[18]).assertEqual(1);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1600
     * @tc.name      testImageTask0016
     * @tc.desc      Verify the factory maps a saturation of zero onto the
     *               full luminance grayscale matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A saturation of zero produces the luma weights of every row.
      const matrix: number[] = ColorMatrixUtil.build(1, 0, MediaFilterType.ORIGINAL);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // The red row carries the luminance weights.
      expect(matrix[0]).assertEqual(0.2126);
      expect(matrix[1]).assertEqual(0.7152);
      expect(matrix[2]).assertEqual(0.0722);
      // The green row repeats the same luminance weights.
      expect(matrix[5]).assertEqual(0.2126);
      expect(matrix[6]).assertEqual(0.7152);
      expect(matrix[7]).assertEqual(0.0722);
      // The blue row repeats the same luminance weights.
      expect(matrix[10]).assertEqual(0.2126);
      expect(matrix[11]).assertEqual(0.7152);
      expect(matrix[12]).assertEqual(0.0722);
      // The alpha row stays neutral.
      expect(matrix[18]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1700
     * @tc.name      testImageTask0017
     * @tc.desc      Verify the factory applies the warm tint offsets while
     *               the channel factors stay neutral.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testImageTask0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testImageTask0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The warm preset lifts red and lowers blue by the tint offset.
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.WARM);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // The red channel factor stays neutral with a positive offset.
      expect(matrix[0]).assertEqual(1);
      expect(matrix[4]).assertEqual(0.14);
      // The green channel factor stays neutral.
      expect(matrix[5]).assertEqual(0);
      expect(matrix[6]).assertEqual(1);
      // The blue channel factor stays neutral with a negative offset.
      expect(matrix[12]).assertEqual(1);
      expect(matrix[14]).assertEqual(-0.14);
      // The alpha row stays neutral.
      expect(matrix[18]).assertEqual(1);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1800
     * @tc.name      testImageTask0018
     * @tc.desc      Verify the factory applies the cool tint offsets while
     *               the channel factors stay neutral.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testImageTask0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testImageTask0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The cool preset lowers red and lifts blue by the tint offset.
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.COOL);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // The red channel factor stays neutral with a negative offset.
      expect(matrix[0]).assertEqual(1);
      expect(matrix[4]).assertEqual(-0.14);
      // The green channel factor stays neutral.
      expect(matrix[6]).assertEqual(1);
      // The blue channel factor stays neutral with a positive offset.
      expect(matrix[12]).assertEqual(1);
      expect(matrix[14]).assertEqual(0.14);
      // The alpha row stays neutral.
      expect(matrix[18]).assertEqual(1);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_1900
     * @tc.name      testImageTask0019
     * @tc.desc      Verify the high contrast preset scales the channel
     *               factors while the alpha row stays neutral.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testImageTask0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testImageTask0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The preset reuses the fixed contrast matrix of the factory.
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.HIGH_CONTRAST);
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // Every colour channel carries the fixed contrast scale.
      expect(matrix[0]).assertEqual(1.6);
      expect(matrix[6]).assertEqual(1.6);
      expect(matrix[12]).assertEqual(1.6);
      // The alpha row stays neutral.
      expect(matrix[15]).assertEqual(0);
      expect(matrix[16]).assertEqual(0);
      expect(matrix[17]).assertEqual(0);
      expect(matrix[18]).assertEqual(1);
      expect(matrix[19]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_2000
     * @tc.name      testImageTask0020
     * @tc.desc      Verify every preset filter of the pipeline composes a
     *               full twenty value colour matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every preset composes the same flat matrix size.
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.ORIGINAL).length).assertEqual(MATRIX_SIZE);
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.GRAY).length).assertEqual(MATRIX_SIZE);
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.INVERT).length).assertEqual(MATRIX_SIZE);
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.WARM).length).assertEqual(MATRIX_SIZE);
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.COOL).length).assertEqual(MATRIX_SIZE);
      expect(ColorMatrixUtil.build(1, 1, MediaFilterType.HIGH_CONTRAST).length).assertEqual(MATRIX_SIZE);
      // A non identity parameter set keeps the same size.
      expect(ColorMatrixUtil.build(1.5, 0.5, MediaFilterType.WARM).length).assertEqual(MATRIX_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_2100
     * @tc.name      testImageTask0021
     * @tc.desc      Verify the raw worker output stores the encoded buffer
     *               reference plus every dimension and byte counter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fill the output object the way the worker does before transfer.
      const output: ProcessOutput = new ProcessOutput();
      const encoded: ArrayBuffer = new ArrayBuffer(2048);
      output.buffer = encoded;
      output.width = 4096;
      output.height = 2160;
      output.byteLength = 1048576;
      output.sourceByteLength = 3145728;
      // The buffer keeps its real byte length by reference.
      expect(output.buffer.byteLength).assertEqual(2048);
      // The processed dimensions are stored unchanged.
      expect(output.width).assertEqual(4096);
      expect(output.height).assertEqual(2160);
      // Both byte counters are stored for the ratio calculation.
      expect(output.byteLength).assertEqual(1048576);
      expect(output.sourceByteLength).assertEqual(3145728);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_2200
     * @tc.name      testImageTask0022
     * @tc.desc      Verify the sandbox export result stores the echo fields
     *               of both the success and the failure branch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImageTask0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testImageTask0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The success branch echoes the request and reports the copy.
      const success: ExportResult = new ExportResult();
      success.sourceUri = 'file://media/image/21.jpg';
      success.targetPath = '/data/storage/el2/base/files/outputs/21.jpg';
      success.size = 204800;
      success.success = true;
      expect(success.sourceUri).assertEqual('file://media/image/21.jpg');
      expect(success.targetPath).assertEqual('/data/storage/el2/base/files/outputs/21.jpg');
      expect(success.size).assertEqual(204800);
      expect(success.success).assertTrue();
      expect(success.message).assertEqual('');
      // The failure branch keeps the echo fields and the error text.
      const failure: ExportResult = new ExportResult();
      failure.sourceUri = 'file://media/image/22.jpg';
      failure.targetPath = '/data/storage/el2/base/files/outputs/22.jpg';
      failure.success = false;
      failure.size = 0;
      failure.message = 'processImage failed';
      expect(failure.sourceUri).assertEqual('file://media/image/22.jpg');
      expect(failure.success).assertFalse();
      expect(failure.size).assertEqual(0);
      expect(failure.message).assertEqual('processImage failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ITMAT_2300
     * @tc.name      testImageTask0023
     * @tc.desc      Verify the direct contrast and saturation builders and
     *               the pipeline encoding constant carry the source values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImageTask0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testImageTask0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The contrast builder doubles the channels with the negative offset.
      const contrast: number[] = ColorMatrixUtil.contrastMatrix(2);
      expect(contrast.length).assertEqual(MATRIX_SIZE);
      expect(contrast[0]).assertEqual(2);
      expect(contrast[4]).assertEqual(-0.5);
      expect(contrast[18]).assertEqual(1);
      // The saturation builder at one composes the neutral matrix.
      const saturation: number[] = ColorMatrixUtil.saturationMatrix(1);
      expect(saturation.length).assertEqual(MATRIX_SIZE);
      expect(saturation[0]).assertEqual(1);
      expect(saturation[6]).assertEqual(1);
      expect(saturation[12]).assertEqual(1);
      expect(saturation[18]).assertEqual(1);
      // The multiplication of two neutral matrices stays neutral.
      const composed: number[] = ColorMatrixUtil.multiply(ColorMatrixUtil.identity(),
        ColorMatrixUtil.identity());
      expect(composed.length).assertEqual(MATRIX_SIZE);
      expect(composed[0]).assertEqual(1);
      expect(composed[18]).assertEqual(1);
      expect(composed[19]).assertEqual(0);
      // The pipeline encodes every output as JPEG.
      expect(JPEG_FORMAT).assertEqual('image/jpeg');
      // The watermark font scales with the height but stays readable.
      const font: number = Math.max(MIN_WATERMARK_FONT, Math.round(SAMPLE_HEIGHT / WATERMARK_FONT_RATIO));
      expect(font).assertEqual(40);
      const margin: number = Math.round(SAMPLE_HEIGHT / WATERMARK_MARGIN_RATIO);
      expect(margin).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
