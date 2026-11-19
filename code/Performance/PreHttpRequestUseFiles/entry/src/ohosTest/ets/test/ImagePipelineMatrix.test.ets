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
