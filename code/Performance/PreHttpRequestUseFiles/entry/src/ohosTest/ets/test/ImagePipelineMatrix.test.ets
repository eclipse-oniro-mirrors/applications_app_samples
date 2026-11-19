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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { resourceManager } from '@kit.LocalizationKit';
import { moduleContext } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

interface MediaFacts {
  bytes: Uint8Array;
  width: number;
  height: number;
}

const mediaCache: Map<string, MediaFacts> = new Map<string, MediaFacts>();

function readU32(bytes: Uint8Array, offset: number): number {
  const high: number = (bytes[offset] << 24) >>> 0;
  const low: number = (bytes[offset + 1] << 16) + (bytes[offset + 2] << 8) + bytes[offset + 3];
  return high + low;
}

function mediaFacts(name: string): MediaFacts {
  const cached: MediaFacts | undefined = mediaCache.get(name);
  if (cached !== undefined) {
    return cached;
  }
  const manager: resourceManager.ResourceManager = moduleContext('entry').resourceManager;
  const bytes: Uint8Array = manager.getMediaByNameSync(name);
  expect(bytes.length > 8).assertTrue();
  expect(String.fromCharCode(bytes[1], bytes[2], bytes[3])).assertEqual('PNG');
  const facts: MediaFacts = {
    bytes: bytes,
    width: readU32(bytes, 16),
    height: readU32(bytes, 20)
  };
  mediaCache.set(name, facts);
  return facts;
}

export default function imagePipelineMatrixTest() {
  describe('ImagePipelineMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0001
     * @tc.name      testImagePipeline0001
     * @tc.desc      startIcon decodes at 1/1 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0001', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0002
     * @tc.name      testImagePipeline0002
     * @tc.desc      startIcon decodes at 1/1 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0002', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0003
     * @tc.name      testImagePipeline0003
     * @tc.desc      startIcon decodes at 1/1 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0003', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0004
     * @tc.name      testImagePipeline0004
     * @tc.desc      startIcon decodes at 1/1 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0004', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0005
     * @tc.name      testImagePipeline0005
     * @tc.desc      startIcon decodes at 1/1 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0005', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0006
     * @tc.name      testImagePipeline0006
     * @tc.desc      startIcon decodes at 1/1 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0006', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0007
     * @tc.name      testImagePipeline0007
     * @tc.desc      startIcon decodes at 1/1 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0007', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0008
     * @tc.name      testImagePipeline0008
     * @tc.desc      startIcon decodes at 1/1 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0008', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0009
     * @tc.name      testImagePipeline0009
     * @tc.desc      startIcon decodes at 1/1 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0009', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0010
     * @tc.name      testImagePipeline0010
     * @tc.desc      startIcon decodes at 1/1 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0010', `media=startIcon div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0011
     * @tc.name      testImagePipeline0011
     * @tc.desc      startIcon decodes at 1/2 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0011', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0012
     * @tc.name      testImagePipeline0012
     * @tc.desc      startIcon decodes at 1/2 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0012', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0013
     * @tc.name      testImagePipeline0013
     * @tc.desc      startIcon decodes at 1/2 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0013', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0014
     * @tc.name      testImagePipeline0014
     * @tc.desc      startIcon decodes at 1/2 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0014', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0015
     * @tc.name      testImagePipeline0015
     * @tc.desc      startIcon decodes at 1/2 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0015', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0016
     * @tc.name      testImagePipeline0016
     * @tc.desc      startIcon decodes at 1/2 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0016', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0017
     * @tc.name      testImagePipeline0017
     * @tc.desc      startIcon decodes at 1/2 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0017', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0018
     * @tc.name      testImagePipeline0018
     * @tc.desc      startIcon decodes at 1/2 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0018', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0019
     * @tc.name      testImagePipeline0019
     * @tc.desc      startIcon decodes at 1/2 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0019', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0020
     * @tc.name      testImagePipeline0020
     * @tc.desc      startIcon decodes at 1/2 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0020', `media=startIcon div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0021
     * @tc.name      testImagePipeline0021
     * @tc.desc      startIcon decodes at 1/3 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0021', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0022
     * @tc.name      testImagePipeline0022
     * @tc.desc      startIcon decodes at 1/3 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0022', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0023
     * @tc.name      testImagePipeline0023
     * @tc.desc      startIcon decodes at 1/3 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0023', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0024
     * @tc.name      testImagePipeline0024
     * @tc.desc      startIcon decodes at 1/3 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0024', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0025
     * @tc.name      testImagePipeline0025
     * @tc.desc      startIcon decodes at 1/3 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0025', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0026
     * @tc.name      testImagePipeline0026
     * @tc.desc      startIcon decodes at 1/3 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0026', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0027
     * @tc.name      testImagePipeline0027
     * @tc.desc      startIcon decodes at 1/3 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0027', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0028
     * @tc.name      testImagePipeline0028
     * @tc.desc      startIcon decodes at 1/3 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0028', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0029
     * @tc.name      testImagePipeline0029
     * @tc.desc      startIcon decodes at 1/3 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0029', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0030
     * @tc.name      testImagePipeline0030
     * @tc.desc      startIcon decodes at 1/3 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 48, height: 48 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0030', `media=startIcon div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0031
     * @tc.name      testImagePipeline0031
     * @tc.desc      startIcon decodes at 1/4 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0031', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0032
     * @tc.name      testImagePipeline0032
     * @tc.desc      startIcon decodes at 1/4 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0032', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0033
     * @tc.name      testImagePipeline0033
     * @tc.desc      startIcon decodes at 1/4 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0033', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0034
     * @tc.name      testImagePipeline0034
     * @tc.desc      startIcon decodes at 1/4 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0034', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0035
     * @tc.name      testImagePipeline0035
     * @tc.desc      startIcon decodes at 1/4 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0035', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0036
     * @tc.name      testImagePipeline0036
     * @tc.desc      startIcon decodes at 1/4 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0036', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0037
     * @tc.name      testImagePipeline0037
     * @tc.desc      startIcon decodes at 1/4 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0037', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0038
     * @tc.name      testImagePipeline0038
     * @tc.desc      startIcon decodes at 1/4 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0038', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0039
     * @tc.name      testImagePipeline0039
     * @tc.desc      startIcon decodes at 1/4 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0039', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0040
     * @tc.name      testImagePipeline0040
     * @tc.desc      startIcon decodes at 1/4 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 36, height: 36 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0040', `media=startIcon div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0041
     * @tc.name      testImagePipeline0041
     * @tc.desc      startIcon decodes at 1/5 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0041', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0042
     * @tc.name      testImagePipeline0042
     * @tc.desc      startIcon decodes at 1/5 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0042', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0043
     * @tc.name      testImagePipeline0043
     * @tc.desc      startIcon decodes at 1/5 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0043', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0044
     * @tc.name      testImagePipeline0044
     * @tc.desc      startIcon decodes at 1/5 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0044', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0045
     * @tc.name      testImagePipeline0045
     * @tc.desc      startIcon decodes at 1/5 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0045', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0046
     * @tc.name      testImagePipeline0046
     * @tc.desc      startIcon decodes at 1/5 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0046', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0047
     * @tc.name      testImagePipeline0047
     * @tc.desc      startIcon decodes at 1/5 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0047', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0048
     * @tc.name      testImagePipeline0048
     * @tc.desc      startIcon decodes at 1/5 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0048', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0049
     * @tc.name      testImagePipeline0049
     * @tc.desc      startIcon decodes at 1/5 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0049', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0050
     * @tc.name      testImagePipeline0050
     * @tc.desc      startIcon decodes at 1/5 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('startIcon');
      expect(facts.bytes.length).assertEqual(20093);
      expect(facts.width).assertEqual(144);
      expect(facts.height).assertEqual(144);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 28, height: 28 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0050', `media=startIcon div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0051
     * @tc.name      testImagePipeline0051
     * @tc.desc      background decodes at 1/1 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0051', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0052
     * @tc.name      testImagePipeline0052
     * @tc.desc      background decodes at 1/1 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0052', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0053
     * @tc.name      testImagePipeline0053
     * @tc.desc      background decodes at 1/1 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0053', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0054
     * @tc.name      testImagePipeline0054
     * @tc.desc      background decodes at 1/1 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0054', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0055
     * @tc.name      testImagePipeline0055
     * @tc.desc      background decodes at 1/1 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0055', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0056
     * @tc.name      testImagePipeline0056
     * @tc.desc      background decodes at 1/1 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0056', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0057
     * @tc.name      testImagePipeline0057
     * @tc.desc      background decodes at 1/1 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0057', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0058
     * @tc.name      testImagePipeline0058
     * @tc.desc      background decodes at 1/1 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0058', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0059
     * @tc.name      testImagePipeline0059
     * @tc.desc      background decodes at 1/1 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0059', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0060
     * @tc.name      testImagePipeline0060
     * @tc.desc      background decodes at 1/1 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testImagePipeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0060', `media=background div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0061
     * @tc.name      testImagePipeline0061
     * @tc.desc      background decodes at 1/2 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0061', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0062
     * @tc.name      testImagePipeline0062
     * @tc.desc      background decodes at 1/2 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0062', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0063
     * @tc.name      testImagePipeline0063
     * @tc.desc      background decodes at 1/2 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0063', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0064
     * @tc.name      testImagePipeline0064
     * @tc.desc      background decodes at 1/2 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0064', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0065
     * @tc.name      testImagePipeline0065
     * @tc.desc      background decodes at 1/2 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0065', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0066
     * @tc.name      testImagePipeline0066
     * @tc.desc      background decodes at 1/2 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0066', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0067
     * @tc.name      testImagePipeline0067
     * @tc.desc      background decodes at 1/2 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0067', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0068
     * @tc.name      testImagePipeline0068
     * @tc.desc      background decodes at 1/2 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0068', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0069
     * @tc.name      testImagePipeline0069
     * @tc.desc      background decodes at 1/2 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0069', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0070
     * @tc.name      testImagePipeline0070
     * @tc.desc      background decodes at 1/2 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0070', `media=background div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0071
     * @tc.name      testImagePipeline0071
     * @tc.desc      background decodes at 1/3 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0071', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0072
     * @tc.name      testImagePipeline0072
     * @tc.desc      background decodes at 1/3 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0072', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0073
     * @tc.name      testImagePipeline0073
     * @tc.desc      background decodes at 1/3 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0073', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0074
     * @tc.name      testImagePipeline0074
     * @tc.desc      background decodes at 1/3 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0074', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0075
     * @tc.name      testImagePipeline0075
     * @tc.desc      background decodes at 1/3 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0075', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0076
     * @tc.name      testImagePipeline0076
     * @tc.desc      background decodes at 1/3 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0076', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0077
     * @tc.name      testImagePipeline0077
     * @tc.desc      background decodes at 1/3 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0077', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0078
     * @tc.name      testImagePipeline0078
     * @tc.desc      background decodes at 1/3 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0078', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0079
     * @tc.name      testImagePipeline0079
     * @tc.desc      background decodes at 1/3 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0079', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0080
     * @tc.name      testImagePipeline0080
     * @tc.desc      background decodes at 1/3 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0080', `media=background div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0081
     * @tc.name      testImagePipeline0081
     * @tc.desc      background decodes at 1/4 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0081', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0082
     * @tc.name      testImagePipeline0082
     * @tc.desc      background decodes at 1/4 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0082', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0083
     * @tc.name      testImagePipeline0083
     * @tc.desc      background decodes at 1/4 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0083', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0084
     * @tc.name      testImagePipeline0084
     * @tc.desc      background decodes at 1/4 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0084', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0085
     * @tc.name      testImagePipeline0085
     * @tc.desc      background decodes at 1/4 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0085', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0086
     * @tc.name      testImagePipeline0086
     * @tc.desc      background decodes at 1/4 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0086', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0087
     * @tc.name      testImagePipeline0087
     * @tc.desc      background decodes at 1/4 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0087', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0088
     * @tc.name      testImagePipeline0088
     * @tc.desc      background decodes at 1/4 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0088', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0089
     * @tc.name      testImagePipeline0089
     * @tc.desc      background decodes at 1/4 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0089', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0090
     * @tc.name      testImagePipeline0090
     * @tc.desc      background decodes at 1/4 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0090', `media=background div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0091
     * @tc.name      testImagePipeline0091
     * @tc.desc      background decodes at 1/5 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0091', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0092
     * @tc.name      testImagePipeline0092
     * @tc.desc      background decodes at 1/5 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0092', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0093
     * @tc.name      testImagePipeline0093
     * @tc.desc      background decodes at 1/5 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0093', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0094
     * @tc.name      testImagePipeline0094
     * @tc.desc      background decodes at 1/5 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0094', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0095
     * @tc.name      testImagePipeline0095
     * @tc.desc      background decodes at 1/5 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0095', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0096
     * @tc.name      testImagePipeline0096
     * @tc.desc      background decodes at 1/5 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0096', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0097
     * @tc.name      testImagePipeline0097
     * @tc.desc      background decodes at 1/5 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0097', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0098
     * @tc.name      testImagePipeline0098
     * @tc.desc      background decodes at 1/5 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0098', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0099
     * @tc.name      testImagePipeline0099
     * @tc.desc      background decodes at 1/5 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0099', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0100
     * @tc.name      testImagePipeline0100
     * @tc.desc      background decodes at 1/5 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('background');
      expect(facts.bytes.length).assertEqual(57364);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 57, height: 57 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0100', `media=background div=5 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0101
     * @tc.name      testImagePipeline0101
     * @tc.desc      foreground decodes at 1/1 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0101', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0102
     * @tc.name      testImagePipeline0102
     * @tc.desc      foreground decodes at 1/1 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0102', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0103
     * @tc.name      testImagePipeline0103
     * @tc.desc      foreground decodes at 1/1 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0103', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0104
     * @tc.name      testImagePipeline0104
     * @tc.desc      foreground decodes at 1/1 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0104', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0105
     * @tc.name      testImagePipeline0105
     * @tc.desc      foreground decodes at 1/1 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0105', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0106
     * @tc.name      testImagePipeline0106
     * @tc.desc      foreground decodes at 1/1 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0106', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0107
     * @tc.name      testImagePipeline0107
     * @tc.desc      foreground decodes at 1/1 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0107', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0108
     * @tc.name      testImagePipeline0108
     * @tc.desc      foreground decodes at 1/1 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0108', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0109
     * @tc.name      testImagePipeline0109
     * @tc.desc      foreground decodes at 1/1 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0109', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0110
     * @tc.name      testImagePipeline0110
     * @tc.desc      foreground decodes at 1/1 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 288, height: 288 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width).assertEqual(meta.size.width);
      expect(info.size.height).assertEqual(meta.size.height);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0110', `media=foreground div=1 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0111
     * @tc.name      testImagePipeline0111
     * @tc.desc      foreground decodes at 1/2 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0111', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0112
     * @tc.name      testImagePipeline0112
     * @tc.desc      foreground decodes at 1/2 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0112', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0113
     * @tc.name      testImagePipeline0113
     * @tc.desc      foreground decodes at 1/2 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0113', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0114
     * @tc.name      testImagePipeline0114
     * @tc.desc      foreground decodes at 1/2 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0114', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0115
     * @tc.name      testImagePipeline0115
     * @tc.desc      foreground decodes at 1/2 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0115', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0116
     * @tc.name      testImagePipeline0116
     * @tc.desc      foreground decodes at 1/2 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0116', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0117
     * @tc.name      testImagePipeline0117
     * @tc.desc      foreground decodes at 1/2 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0117', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0118
     * @tc.name      testImagePipeline0118
     * @tc.desc      foreground decodes at 1/2 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0118', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0119
     * @tc.name      testImagePipeline0119
     * @tc.desc      foreground decodes at 1/2 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0119', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0120
     * @tc.name      testImagePipeline0120
     * @tc.desc      foreground decodes at 1/2 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 144, height: 144 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0120', `media=foreground div=2 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0121
     * @tc.name      testImagePipeline0121
     * @tc.desc      foreground decodes at 1/3 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0121', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0122
     * @tc.name      testImagePipeline0122
     * @tc.desc      foreground decodes at 1/3 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0122', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0123
     * @tc.name      testImagePipeline0123
     * @tc.desc      foreground decodes at 1/3 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0123', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0124
     * @tc.name      testImagePipeline0124
     * @tc.desc      foreground decodes at 1/3 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0124', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0125
     * @tc.name      testImagePipeline0125
     * @tc.desc      foreground decodes at 1/3 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0125', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0126
     * @tc.name      testImagePipeline0126
     * @tc.desc      foreground decodes at 1/3 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0126', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0127
     * @tc.name      testImagePipeline0127
     * @tc.desc      foreground decodes at 1/3 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0127', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0128
     * @tc.name      testImagePipeline0128
     * @tc.desc      foreground decodes at 1/3 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0128', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0129
     * @tc.name      testImagePipeline0129
     * @tc.desc      foreground decodes at 1/3 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0129', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0130
     * @tc.name      testImagePipeline0130
     * @tc.desc      foreground decodes at 1/3 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 96, height: 96 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(facts.bytes.length > 1000).assertTrue();
      logCase('testImagePipeline0130', `media=foreground div=3 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0131
     * @tc.name      testImagePipeline0131
     * @tc.desc      foreground decodes at 1/4 scale, area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.size.width * info.size.height > 0).assertTrue();
      logCase('testImagePipeline0131', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0132
     * @tc.name      testImagePipeline0132
     * @tc.desc      foreground decodes at 1/4 scale, repeated height stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.height).assertEqual(info.size.height);
      logCase('testImagePipeline0132', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0133
     * @tc.name      testImagePipeline0133
     * @tc.desc      foreground decodes at 1/4 scale, repeated width stays stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(pixelMap.getImageInfoSync().size.width).assertEqual(info.size.width);
      logCase('testImagePipeline0133', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0134
     * @tc.name      testImagePipeline0134
     * @tc.desc      foreground decodes at 1/4 scale, row holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row >= 4).assertTrue();
      logCase('testImagePipeline0134', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0135
     * @tc.name      testImagePipeline0135
     * @tc.desc      foreground decodes at 1/4 scale, row aligns to four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(row % 4).assertEqual(0);
      logCase('testImagePipeline0135', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0136
     * @tc.name      testImagePipeline0136
     * @tc.desc      foreground decodes at 1/4 scale, total span holds at least four bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(total >= 4).assertTrue();
      logCase('testImagePipeline0136', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0137
     * @tc.name      testImagePipeline0137
     * @tc.desc      foreground decodes at 1/4 scale, pixel format stays RGBA
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(info.pixelFormat === image.PixelMapFormat.RGBA_8888).assertTrue();
      logCase('testImagePipeline0137', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0138
     * @tc.name      testImagePipeline0138
     * @tc.desc      foreground decodes at 1/4 scale, decoded width fits source width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.width >= info.size.width).assertTrue();
      logCase('testImagePipeline0138', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0139
     * @tc.name      testImagePipeline0139
     * @tc.desc      foreground decodes at 1/4 scale, decoded height fits source height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
      const total: number = pixelMap.getPixelBytesNumber();
      expect(row >= info.size.width * 4).assertTrue();
      expect(total >= row * info.size.height).assertTrue();
      expect(meta.size.height >= info.size.height).assertTrue();
      logCase('testImagePipeline0139', `media=foreground div=4 width=${info.size.width}`);
      await pixelMap.release();
      await source.release();
    });
    /**
     * @tc.number    SUB_PREHTTP_IMAGE_0140
     * @tc.name      testImagePipeline0140
     * @tc.desc      foreground decodes at 1/4 scale, packed bytes exceed one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImagePipeline0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const facts: MediaFacts = mediaFacts('foreground');
      expect(facts.bytes.length).assertEqual(12430);
      expect(facts.width).assertEqual(288);
      expect(facts.height).assertEqual(288);
      const source: image.ImageSource = image.createImageSource(facts.bytes.buffer as ArrayBuffer);
      const meta: image.ImageInfo = source.getImageInfoSync();
      expect(meta.size.width).assertEqual(facts.width);
      expect(meta.size.height).assertEqual(facts.height);
      const options: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 72, height: 72 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap: image.PixelMap = await source.createPixelMap(options);
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      expect(info.size.width > 0).assertTrue();
      expect(info.size.height > 0).assertTrue();
      expect(info.size.width <= meta.size.width).assertTrue();
      expect(info.size.height <= meta.size.height).assertTrue();
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(pixelMap.isEditable).assertFalse();
      const row: number = pixelMap.getBytesNumberPerRow();
