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
import { MediaMeta, MediaFilterType, EditParams, EditOutcome, ProcessOutput, CacheFile, ExportResult } from 'photopickersendable';

/**
 * Registers every media model case of the shared library.
 * All types under test are plain enums and data classes, no ability context is required.
 */
export default function mediaModelsSuiteTest() {
  describe('MediaModelsSuiteTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0100
     * @tc.name      testMediaModels0001
     * @tc.desc      Verify every preset filter enum carries the exact wire
     *               text shared between the UI and the worker thread.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The no filter preset keeps the original colours.
      expect(MediaFilterType.ORIGINAL).assertEqual('original');
      // The grayscale preset converts every channel to luma.
      expect(MediaFilterType.GRAY).assertEqual('gray');
      // The invert preset negates every colour channel.
      expect(MediaFilterType.INVERT).assertEqual('invert');
      // The warm preset pushes red up and blue down.
      expect(MediaFilterType.WARM).assertEqual('warm');
      // The cool preset pushes blue up and red down.
      expect(MediaFilterType.COOL).assertEqual('cool');
      // The high contrast preset scales the distance to middle grey.
      expect(MediaFilterType.HIGH_CONTRAST).assertEqual('highContrast');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0200
     * @tc.name      testMediaModels0002
     * @tc.desc      Verify the metadata of one image asset stores every
     *               media library column value unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const meta: MediaMeta = new MediaMeta('file://media/image/11.jpg', 'IMG_1101.jpg', 1, 2048000, 4096,
        3072, 'image/jpeg');
      // The uri identifies the asset inside the media library.
      expect(meta.uri).assertEqual('file://media/image/11.jpg');
      // The display name keeps the user visible file name.
      expect(meta.displayName).assertEqual('IMG_1101.jpg');
      // The media type reports the image enum value.
      expect(meta.mediaType).assertEqual(1);
      // The size keeps the byte count of the asset.
      expect(meta.size).assertEqual(2048000);
      // The width keeps the pixel width of the asset.
      expect(meta.width).assertEqual(4096);
      // The height keeps the pixel height of the asset.
      expect(meta.height).assertEqual(3072);
      // The mime type keeps the media library text.
      expect(meta.mimeType).assertEqual('image/jpeg');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0300
     * @tc.name      testMediaModels0003
     * @tc.desc      Verify the metadata of one video asset keeps the video
     *               media type and the zero pixel columns of the record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaModels0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const meta: MediaMeta = new MediaMeta('file://media/video/22.mp4', 'VID_2202.mp4', 2, 52428800, 0, 0,
        'video/mp4');
      // The uri identifies the video asset inside the media library.
      expect(meta.uri).assertEqual('file://media/video/22.mp4');
      // The display name keeps the user visible file name of the video.
      expect(meta.displayName).assertEqual('VID_2202.mp4');
      // The media type reports the video enum value.
      expect(meta.mediaType).assertEqual(2);
      // The size keeps the byte count of the video.
      expect(meta.size).assertEqual(52428800);
      // The width stays zero when the pixel column was not fetched.
      expect(meta.width).assertEqual(0);
      // The height stays zero when the pixel column was not fetched.
      expect(meta.height).assertEqual(0);
      // The mime type keeps the video media library text.
      expect(meta.mimeType).assertEqual('video/mp4');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0400
     * @tc.name      testMediaModels0004
     * @tc.desc      Verify the edit parameters start with the identity
     *              transform defaults of every editor switch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const params: EditParams = new EditParams();
      // No rotation is applied by default.
      expect(params.rotation).assertEqual(0);
      // The crop window starts as the full image.
      expect(params.cropLeft).assertEqual(0);
      expect(params.cropTop).assertEqual(0);
      expect(params.cropRight).assertEqual(1);
      expect(params.cropBottom).assertEqual(1);
      // The filter defaults to the original colours preset.
      expect(params.filter).assertEqual(MediaFilterType.ORIGINAL);
      // No brightness lift is applied by default.
      expect(params.brightness).assertEqual(0);
      // Contrast and saturation stay at the identity multiplier one.
      expect(params.contrast).assertEqual(1);
      expect(params.saturation).assertEqual(1);
      // No watermark text is drawn by default.
      expect(params.watermark).assertEqual('');
      // The compression quality defaults to the sample standard.
      expect(params.quality).assertEqual(80);
      // The longest output edge defaults to the sample standard.
      expect(params.maxEdge).assertEqual(1600);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0500
     * @tc.name      testMediaModels0005
     * @tc.desc      Verify the edit parameters store every editor switch
     *               value assigned by the UI unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaModels0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const params: EditParams = new EditParams();
      params.rotation = 90;
      params.cropLeft = 0.1;
      params.cropTop = 0.2;
      params.cropRight = 0.8;
      params.cropBottom = 0.9;
      params.filter = MediaFilterType.GRAY;
      params.brightness = 0.5;
      params.contrast = 1.5;
      params.saturation = 0.5;
      params.watermark = 'OH';
      params.quality = 95;
      params.maxEdge = 2048;
      // Every assigned switch value reaches the matching field unchanged.
      expect(params.rotation).assertEqual(90);
      expect(params.cropLeft).assertEqual(0.1);
      expect(params.cropTop).assertEqual(0.2);
      expect(params.cropRight).assertEqual(0.8);
      expect(params.cropBottom).assertEqual(0.9);
      expect(params.filter).assertEqual(MediaFilterType.GRAY);
      expect(params.brightness).assertEqual(0.5);
      expect(params.contrast).assertEqual(1.5);
      expect(params.saturation).assertEqual(0.5);
      expect(params.watermark).assertEqual('OH');
      expect(params.quality).assertEqual(95);
      expect(params.maxEdge).assertEqual(2048);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0600
     * @tc.name      testMediaModels0006
     * @tc.desc      Verify the raw worker output starts as an empty buffer
     *               with zero sized dimensions and byte counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const output: ProcessOutput = new ProcessOutput();
      // The encoded buffer starts empty.
      expect(output.buffer.byteLength).assertEqual(0);
      // The processed dimensions start at zero.
      expect(output.width).assertEqual(0);
      expect(output.height).assertEqual(0);
      // The encoded byte counter starts at zero.
      expect(output.byteLength).assertEqual(0);
      // The source byte counter starts at zero.
      expect(output.sourceByteLength).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0700
     * @tc.name      testMediaModels0007
     * @tc.desc      Verify the raw worker output stores the encoded buffer
     *               and the processed dimension values assigned by the worker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaModels0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const output: ProcessOutput = new ProcessOutput();
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      output.buffer = buffer;
      output.width = 800;
      output.height = 600;
      output.byteLength = 4096;
      output.sourceByteLength = 8192;
      // The assigned buffer is stored by reference with its real byte length.
      expect(output.buffer.byteLength).assertEqual(64);
      // The processed dimensions store the assigned pixel values.
      expect(output.width).assertEqual(800);
      expect(output.height).assertEqual(600);
      // The byte counters store the assigned values for the ratio calculation.
      expect(output.byteLength).assertEqual(4096);
      expect(output.sourceByteLength).assertEqual(8192);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0800
     * @tc.name      testMediaModels0008
     * @tc.desc      Verify the edit outcome starts with a null pixel map, a
     *               fresh raw output and zero cost counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const outcome: EditOutcome = new EditOutcome();
      // The pixel map stays null before the first decode.
      expect(outcome.pixelMap).assertNull();
      // The raw output is a fresh ProcessOutput instance with its own defaults.
      expect(outcome.output instanceof ProcessOutput).assertTrue();
      expect(outcome.output.width).assertEqual(0);
      expect(outcome.output.byteLength).assertEqual(0);
      // Both cost counters start at zero.
      expect(outcome.workerCost).assertEqual(0);
      expect(outcome.decodeCost).assertEqual(0);
      // The cost counters store the measured values after the assignment.
      outcome.workerCost = 120;
      outcome.decodeCost = 45;
      expect(outcome.workerCost).assertEqual(120);
      expect(outcome.decodeCost).assertEqual(45);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_0900
     * @tc.name      testMediaModels0009
     * @tc.desc      Verify one sandbox cache entry stores its file name,
     *               absolute path, byte size and modification time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMediaModels0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const file: CacheFile = new CacheFile('edit_1001.jpg',
        '/data/storage/el2/base/files/outputs/edit_1001.jpg', 358400, 1735689600000);
      // The file name keeps the name shown in the cache list.
      expect(file.name).assertEqual('edit_1001.jpg');
      // The path keeps the absolute sandbox path of the cached file.
      expect(file.path).assertEqual('/data/storage/el2/base/files/outputs/edit_1001.jpg');
      // The size keeps the byte count used by the total size calculation.
      expect(file.size).assertEqual(358400);
      // The modification time keeps the epoch milliseconds of the file.
      expect(file.modifiedTime).assertEqual(1735689600000);
      // A later listing refresh stores the updated name and size.
      file.name = 'edit_1002.jpg';
      file.size = 4096;
      expect(file.name).assertEqual('edit_1002.jpg');
      expect(file.size).assertEqual(4096);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_MEDIAMODEL_1000
     * @tc.name      testMediaModels0010
     * @tc.desc      Verify the export result starts as a failed empty result
     *               and stores every success field assigned by the worker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMediaModels0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: ExportResult = new ExportResult();
      // The fresh result carries no uris, no path and no bytes.
      expect(result.sourceUri).assertEqual('');
      expect(result.targetPath).assertEqual('');
      expect(result.size).assertEqual(0);
      // A fresh result is marked as failed.
      expect(result.success).assertFalse();
      // A fresh result carries no error text.
      expect(result.message).assertEqual('');
      // The worker fills every success field of a completed export.
      result.sourceUri = 'file://media/image/33.jpg';
      result.targetPath = '/data/storage/el2/base/files/outputs/export_33.jpg';
      result.size = 1234567;
      result.success = true;
      // Every success field is stored unchanged.
      expect(result.sourceUri).assertEqual('file://media/image/33.jpg');
      expect(result.targetPath).assertEqual('/data/storage/el2/base/files/outputs/export_33.jpg');
      expect(result.size).assertEqual(1234567);
      expect(result.success).assertTrue();
      // A successful export keeps the error text empty.
      expect(result.message).assertEqual('');
    });
  });
}
