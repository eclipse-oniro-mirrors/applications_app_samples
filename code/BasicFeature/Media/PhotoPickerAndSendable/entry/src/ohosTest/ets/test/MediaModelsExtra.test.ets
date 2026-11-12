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
import { MediaMeta, MediaFilterType, EditParams, EditOutcome, ProcessOutput, CacheFile, ExportResult }
  from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Number of the preset filters offered by the editor. */
const FILTER_COUNT: number = 6;

/**
 * Registers the extra data class matrix cases of the shared library.
 * All types under test are plain enums and data classes, no ability
 * context is required and every case asserts synchronously.
 */
export default function mediaModelsExtraTest() {
  describe('MediaModelsExtraTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0100
     * @tc.name      testMediaExtra0001
     * @tc.desc      Verify the metadata stores empty uri, name and mime type
     *               values together with zero numeric columns unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a metadata entry from empty column values.
      const meta: MediaMeta = new MediaMeta('', '', 0, 0, 0, 0, '');
      // Every text column keeps the empty string.
      expect(meta.uri).assertEqual('');
      expect(meta.displayName).assertEqual('');
      expect(meta.mimeType).assertEqual('');
      // Every numeric column keeps zero.
      expect(meta.mediaType).assertEqual(0);
      expect(meta.size).assertEqual(0);
      expect(meta.width).assertEqual(0);
      expect(meta.height).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0200
     * @tc.name      testMediaExtra0002
     * @tc.desc      Verify the metadata stores Chinese display names and a
     *               Chinese mime text unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a metadata entry with Chinese text columns.
      const meta: MediaMeta = new MediaMeta('file://media/image/1.jpg',
        '\u56FE\u7247_\u65B0\u5E74.jpg', 1, 1024, 1920, 1080, '\u56FE\u7247/jpeg');
      // The uri keeps its identifier unchanged.
      expect(meta.uri).assertEqual('file://media/image/1.jpg');
      // The Chinese display name is stored unchanged.
      expect(meta.displayName).assertEqual('\u56FE\u7247_\u65B0\u5E74.jpg');
      // The Chinese mime text is stored unchanged.
      expect(meta.mimeType).assertEqual('\u56FE\u7247/jpeg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0300
     * @tc.name      testMediaExtra0003
     * @tc.desc      Verify the metadata keeps the surrogate pair length of an
     *               emoji display name and the emoji text unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a metadata entry whose name starts with one emoji.
      const emoji: string = '\uD83D\uDE00';
      const meta: MediaMeta = new MediaMeta('file://media/image/2.jpg', emoji + 'pic.jpg', 1, 1, 1, 1, 'image/jpeg');
      // The emoji keeps its two code units inside the stored name.
      expect(meta.displayName.length).assertEqual(9);
      // The stored name keeps the exact emoji prefix.
      expect(meta.displayName).assertEqual(emoji + 'pic.jpg');
      // The name ends with the plain suffix.
      expect(meta.displayName.charAt(2)).assertEqual('p');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0400
     * @tc.name      testMediaExtra0004
     * @tc.desc      Verify the metadata stores the largest safe byte size
     *               and very large pixel dimensions unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a metadata entry with extreme numeric columns.
      const meta: MediaMeta = new MediaMeta('file://media/image/3.jpg', 'huge.jpg', 1,
        9007199254740991, 8192, 8192, 'image/jpeg');
      // The byte size keeps the largest safe integer value.
      expect(meta.size).assertEqual(9007199254740991);
      // Both pixel dimensions keep their large values.
      expect(meta.width).assertEqual(8192);
      expect(meta.height).assertEqual(8192);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0500
     * @tc.name      testMediaExtra0005
     * @tc.desc      Verify the metadata stores negative and zero numeric
     *               column values unchanged because the class is a plain
     *               data holder without validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMediaExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testMediaExtra0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a metadata entry with negative numeric columns.
      const meta: MediaMeta = new MediaMeta('file://media/image/4.jpg', 'neg.jpg', -1, -5, -1, -1, '');
      // The negative media type is stored unchanged.
      expect(meta.mediaType).assertEqual(-1);
      // The negative size is stored unchanged.
      expect(meta.size).assertEqual(-5);
      // Both negative pixel dimensions are stored unchanged.
      expect(meta.width).assertEqual(-1);
      expect(meta.height).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0600
     * @tc.name      testMediaExtra0006
     * @tc.desc      Verify the metadata keeps image, video and unknown media
     *               type codes in three separate instances.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one image, one video and one unknown type entry.
      const imageMeta: MediaMeta = new MediaMeta('u1', 'i.jpg', 1, 1, 1, 1, 'image/jpeg');
      const videoMeta: MediaMeta = new MediaMeta('u2', 'v.mp4', 2, 1, 1, 1, 'video/mp4');
      const unknownMeta: MediaMeta = new MediaMeta('u3', 'x.bin', 0, 1, 1, 1, '');
      // Each instance keeps its own media type code.
      expect(imageMeta.mediaType).assertEqual(1);
      expect(videoMeta.mediaType).assertEqual(2);
      expect(unknownMeta.mediaType).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0700
     * @tc.name      testMediaExtra0007
     * @tc.desc      Verify every metadata field accepts a later reassignment
     *               so a refreshed listing can update one entry in place.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one metadata entry and refresh every field in place.
      const meta: MediaMeta = new MediaMeta('file://old.jpg', 'old.jpg', 1, 10, 100, 100, 'image/jpeg');
      meta.uri = 'file://new.jpg';
      meta.displayName = 'new.jpg';
      meta.mediaType = 2;
      meta.size = 20;
      meta.width = 200;
      meta.height = 200;
      meta.mimeType = 'video/mp4';
      // Every refreshed field reports its new value.
      expect(meta.uri).assertEqual('file://new.jpg');
      expect(meta.displayName).assertEqual('new.jpg');
      expect(meta.mediaType).assertEqual(2);
      expect(meta.size).assertEqual(20);
      expect(meta.width).assertEqual(200);
      expect(meta.height).assertEqual(200);
      expect(meta.mimeType).assertEqual('video/mp4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0800
     * @tc.name      testMediaExtra0008
     * @tc.desc      Verify every preset filter carries the exact wire text
     *               shared between the editor UI and the worker thread.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect all six preset filters in one list.
      const values: string[] = [MediaFilterType.ORIGINAL, MediaFilterType.GRAY, MediaFilterType.INVERT,
        MediaFilterType.WARM, MediaFilterType.COOL, MediaFilterType.HIGH_CONTRAST];
      // The list holds exactly six presets.
      expect(values.length).assertEqual(FILTER_COUNT);
      // Each preset keeps its wire text at the expected position.
      expect(values[0]).assertEqual('original');
      expect(values[1]).assertEqual('gray');
      expect(values[2]).assertEqual('invert');
      expect(values[3]).assertEqual('warm');
      expect(values[4]).assertEqual('cool');
      expect(values[5]).assertEqual('highContrast');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_0900
     * @tc.name      testMediaExtra0009
     * @tc.desc      Verify every preset filter value is unique so a switch on
     *               the wire text cannot match two presets at once.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect all six preset filters in one list.
      const values: string[] = [MediaFilterType.ORIGINAL, MediaFilterType.GRAY, MediaFilterType.INVERT,
        MediaFilterType.WARM, MediaFilterType.COOL, MediaFilterType.HIGH_CONTRAST];
      // Each preset sits at its own unique position.
      expect(values.indexOf(MediaFilterType.ORIGINAL)).assertEqual(0);
      expect(values.indexOf(MediaFilterType.GRAY)).assertEqual(1);
      expect(values.indexOf(MediaFilterType.INVERT)).assertEqual(2);
      expect(values.indexOf(MediaFilterType.WARM)).assertEqual(3);
      expect(values.indexOf(MediaFilterType.COOL)).assertEqual(4);
      expect(values.indexOf(MediaFilterType.HIGH_CONTRAST)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1000
     * @tc.name      testMediaExtra0010
     * @tc.desc      Verify the watermark field of the edit parameters stores
     *               empty, Chinese, emoji and very long texts unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty watermark disables the drawing step.
      const emptyParams: EditParams = new EditParams();
      expect(emptyParams.watermark).assertEqual('');
      // The Chinese watermark is stored unchanged.
      const chineseParams: EditParams = new EditParams();
      chineseParams.watermark = '\u7248\u6743\u6240\u6709';
      expect(chineseParams.watermark).assertEqual('\u7248\u6743\u6240\u6709');
      // The emoji watermark keeps its two code units.
      const emojiParams: EditParams = new EditParams();
      emojiParams.watermark = '\uD83D\uDCF7';
      expect(emojiParams.watermark.length).assertEqual(2);
      // A very long watermark is stored completely.
      const longParams: EditParams = new EditParams();
      longParams.watermark = 'abcdefghij'.repeat(30);
      expect(longParams.watermark.length).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1100
     * @tc.name      testMediaExtra0011
     * @tc.desc      Verify the crop handles store the full image window and
     *               fractional, out of range values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default window covers the full image.
      const fullParams: EditParams = new EditParams();
      expect(fullParams.cropLeft).assertEqual(0);
      expect(fullParams.cropTop).assertEqual(0);
      expect(fullParams.cropRight).assertEqual(1);
      expect(fullParams.cropBottom).assertEqual(1);
      // A quarter window is stored with its exact fractions.
      const quarterParams: EditParams = new EditParams();
      quarterParams.cropLeft = 0.25;
      quarterParams.cropTop = 0.25;
      quarterParams.cropRight = 0.75;
      quarterParams.cropBottom = 0.75;
      expect(quarterParams.cropLeft).assertEqual(0.25);
      expect(quarterParams.cropTop).assertEqual(0.25);
      expect(quarterParams.cropRight).assertEqual(0.75);
      expect(quarterParams.cropBottom).assertEqual(0.75);
      // Out of range handles are stored unchanged by the data class.
      const overParams: EditParams = new EditParams();
      overParams.cropLeft = -0.5;
      overParams.cropRight = 1.5;
      expect(overParams.cropLeft).assertEqual(-0.5);
      expect(overParams.cropRight).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1200
     * @tc.name      testMediaExtra0012
     * @tc.desc      Verify the rotation field stores zero, the common quarter
     *               turn angles, a full turn and negative values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default rotation is the neutral zero angle.
      const params: EditParams = new EditParams();
      expect(params.rotation).assertEqual(0);
      // Every quarter turn angle is stored unchanged.
      params.rotation = 90;
      expect(params.rotation).assertEqual(90);
      params.rotation = 180;
      expect(params.rotation).assertEqual(180);
      params.rotation = 270;
      expect(params.rotation).assertEqual(270);
      // A full turn and a negative half turn are stored unchanged.
      params.rotation = 360;
      expect(params.rotation).assertEqual(360);
      params.rotation = -90;
      expect(params.rotation).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1300
     * @tc.name      testMediaExtra0013
     * @tc.desc      Verify the quality field stores the pipeline bounds one
     *               and one hundred plus out of range values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default quality is the sample standard eighty.
      const params: EditParams = new EditParams();
      expect(params.quality).assertEqual(80);
      // Both pipeline bounds are stored unchanged.
      params.quality = 1;
      expect(params.quality).assertEqual(1);
      params.quality = 100;
      expect(params.quality).assertEqual(100);
      // Out of range values are stored unchanged by the data class.
      params.quality = 0;
      expect(params.quality).assertEqual(0);
      params.quality = 101;
      expect(params.quality).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1400
     * @tc.name      testMediaExtra0014
     * @tc.desc      Verify the max edge field stores the pipeline minimum,
     *               the sample default and out of range values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default longest edge is the sample standard.
      const params: EditParams = new EditParams();
      expect(params.maxEdge).assertEqual(1600);
      // The pipeline minimum edge is stored unchanged.
      params.maxEdge = 320;
      expect(params.maxEdge).assertEqual(320);
      // A large edge is stored unchanged.
      params.maxEdge = 4096;
      expect(params.maxEdge).assertEqual(4096);
      // Out of range values are stored unchanged by the data class.
      params.maxEdge = 0;
      expect(params.maxEdge).assertEqual(0);
      params.maxEdge = -1;
      expect(params.maxEdge).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1500
     * @tc.name      testMediaExtra0015
     * @tc.desc      Verify the brightness, contrast and saturation fields
     *               store neutral, lifted and out of range values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default colour values form the identity transform.
      const params: EditParams = new EditParams();
      expect(params.brightness).assertEqual(0);
      expect(params.contrast).assertEqual(1);
      expect(params.saturation).assertEqual(1);
      // A lifted colour triple is stored unchanged.
      params.brightness = 0.5;
      params.contrast = 1.5;
      params.saturation = 0.5;
      expect(params.brightness).assertEqual(0.5);
      expect(params.contrast).assertEqual(1.5);
      expect(params.saturation).assertEqual(0.5);
      // Out of range values are stored unchanged by the data class.
      params.brightness = -0.5;
      params.contrast = 0;
      params.saturation = 2;
      expect(params.brightness).assertEqual(-0.5);
      expect(params.contrast).assertEqual(0);
      expect(params.saturation).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1600
     * @tc.name      testMediaExtra0016
     * @tc.desc      Verify the filter field accepts every preset and keeps
     *               the assigned enum member until it is replaced.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default preset keeps the original colours.
      const params: EditParams = new EditParams();
      expect(params.filter).assertEqual(MediaFilterType.ORIGINAL);
      // Every preset can be assigned and read back.
      params.filter = MediaFilterType.GRAY;
      expect(params.filter).assertEqual(MediaFilterType.GRAY);
      params.filter = MediaFilterType.INVERT;
      expect(params.filter).assertEqual(MediaFilterType.INVERT);
      params.filter = MediaFilterType.WARM;
      expect(params.filter).assertEqual(MediaFilterType.WARM);
      params.filter = MediaFilterType.COOL;
      expect(params.filter).assertEqual(MediaFilterType.COOL);
      params.filter = MediaFilterType.HIGH_CONTRAST;
      expect(params.filter).assertEqual(MediaFilterType.HIGH_CONTRAST);
      // Assigning the original preset restores the neutral value.
      params.filter = MediaFilterType.ORIGINAL;
      expect(params.filter).assertEqual(MediaFilterType.ORIGINAL);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1700
     * @tc.name      testMediaExtra0017
     * @tc.desc      Verify the worker output stores a large encoded buffer
     *               and the full result dimension and counter values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a worker output with a one hundred kilobyte buffer.
      const output: ProcessOutput = new ProcessOutput();
      output.buffer = new ArrayBuffer(102400);
      output.width = 4096;
      output.height = 2160;
      output.byteLength = 102400;
      output.sourceByteLength = 204800;
      // The buffer reports its real byte length.
      expect(output.buffer.byteLength).assertEqual(102400);
      // The processed dimensions keep their pixel values.
      expect(output.width).assertEqual(4096);
      expect(output.height).assertEqual(2160);
      // Both byte counters keep their values for the ratio calculation.
      expect(output.byteLength).assertEqual(102400);
      expect(output.sourceByteLength).assertEqual(204800);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1800
     * @tc.name      testMediaExtra0018
     * @tc.desc      Verify two worker output instances keep independent
     *               fields and do not share their buffer objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMediaExtra0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testMediaExtra0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build two separate outputs and fill only the first one.
      const first: ProcessOutput = new ProcessOutput();
      const second: ProcessOutput = new ProcessOutput();
      first.buffer = new ArrayBuffer(32);
      first.width = 800;
      first.byteLength = 32;
      // The filled instance reports its own values.
      expect(first.buffer.byteLength).assertEqual(32);
      expect(first.width).assertEqual(800);
      // The untouched instance keeps its defaults.
      expect(second.buffer.byteLength).assertEqual(0);
      expect(second.width).assertEqual(0);
      expect(second.byteLength).assertEqual(0);
      // Writing to the second instance never changes the first one.
      second.width = 640;
      expect(first.width).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_1900
     * @tc.name      testMediaExtra0019
     * @tc.desc      Verify the edit outcome starts with a null pixel map, a
     *               fresh nested output and independent cost counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a fresh outcome.
      const outcome: EditOutcome = new EditOutcome();
      // The pixel map stays null before the first decode.
      expect(outcome.pixelMap).assertNull();
      // The nested output is a fresh ProcessOutput instance.
      expect(outcome.output instanceof ProcessOutput).assertTrue();
      // Both cost counters start at zero.
      expect(outcome.workerCost).assertEqual(0);
      expect(outcome.decodeCost).assertEqual(0);
      // Assigning one cost never touches the other.
      outcome.workerCost = 250;
      expect(outcome.workerCost).assertEqual(250);
      expect(outcome.decodeCost).assertEqual(0);
      outcome.decodeCost = 90;
      expect(outcome.decodeCost).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_2000
     * @tc.name      testMediaExtra0020
     * @tc.desc      Verify one cache entry stores a Chinese file name, a
     *               deep sandbox path and large size and time values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaExtra0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMediaExtra0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one cache entry with Chinese name and large values.
      const file: CacheFile = new CacheFile('\u5BFC\u51FA_\u56FE\u7247.jpg',
        '/data/storage/el2/base/files/outputs/\u5BFC\u51FA_\u56FE\u7247.jpg', 5242880, 4102444800000);
      // The Chinese file name is stored unchanged.
      expect(file.name).assertEqual('\u5BFC\u51FA_\u56FE\u7247.jpg');
      // The deep path is stored unchanged.
      expect(file.path).assertEqual('/data/storage/el2/base/files/outputs/\u5BFC\u51FA_\u56FE\u7247.jpg');
      // The five megabyte size is stored unchanged.
      expect(file.size).assertEqual(5242880);
      // The year 2100 timestamp is stored unchanged.
      expect(file.modifiedTime).assertEqual(4102444800000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_2100
     * @tc.name      testMediaExtra0021
     * @tc.desc      Verify the cache entry keeps zero values and accepts a
     *               full field refresh when the listing is rebuilt.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMediaExtra0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testMediaExtra0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one entry with zero values and refresh every field.
      const file: CacheFile = new CacheFile('', '', 0, 0);
      expect(file.name).assertEqual('');
      expect(file.path).assertEqual('');
      expect(file.size).assertEqual(0);
      expect(file.modifiedTime).assertEqual(0);
      // Every field accepts a later reassignment.
      file.name = 'fresh.jpg';
      file.path = '/data/storage/el2/base/files/outputs/fresh.jpg';
      file.size = 4096;
      file.modifiedTime = 1735689600000;
      expect(file.name).assertEqual('fresh.jpg');
      expect(file.path).assertEqual('/data/storage/el2/base/files/outputs/fresh.jpg');
      expect(file.size).assertEqual(4096);
      expect(file.modifiedTime).assertEqual(1735689600000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_2200
     * @tc.name      testMediaExtra0022
     * @tc.desc      Verify a failed export result carries the failed flag,
     *               zero bytes and the exact Chinese error text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a result the way the failed export branch fills it.
      const result: ExportResult = new ExportResult();
      result.sourceUri = 'file://media/image/9.jpg';
      result.targetPath = '/data/storage/el2/base/files/outputs/9.jpg';
      result.success = false;
      result.size = 0;
      result.message = '\u5BFC\u51FA\u5931\u8D25';
      // The uri fields echo the request values.
      expect(result.sourceUri).assertEqual('file://media/image/9.jpg');
      expect(result.targetPath).assertEqual('/data/storage/el2/base/files/outputs/9.jpg');
      // The failed branch reports zero bytes and the failed flag.
      expect(result.size).assertEqual(0);
      expect(result.success).assertFalse();
      // The Chinese error text is stored unchanged.
      expect(result.message).assertEqual('\u5BFC\u51FA\u5931\u8D25');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MMMAT_2300
     * @tc.name      testMediaExtra0023
     * @tc.desc      Verify a successful export result carries every copied
     *               field and keeps the error text empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaExtra0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMediaExtra0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a result the way the successful export branch fills it.
      const result: ExportResult = new ExportResult();
      result.sourceUri = 'file://media/video/10.mp4';
      result.targetPath = '/data/storage/el2/base/files/outputs/10.mp4';
      result.size = 10485760;
      result.success = true;
      // Every success field is stored unchanged.
      expect(result.sourceUri).assertEqual('file://media/video/10.mp4');
      expect(result.targetPath).assertEqual('/data/storage/el2/base/files/outputs/10.mp4');
      expect(result.size).assertEqual(10485760);
      expect(result.success).assertTrue();
      // A successful export keeps the error text empty.
      expect(result.message).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
