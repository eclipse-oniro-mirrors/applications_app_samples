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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
let ctx: common.Context;
export default function movingPhotoMediaAssetsTest() {
  describe('MovingPhotoMediaAssetsTest', () => {
    beforeAll(() => { ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext(); })

    /**
     * @tc.name   testMediaAssets0001
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0001
     * @tc.desc   Test packaged moving-photo media assets, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0002
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0002
     * @tc.desc   Test packaged moving-photo media assets, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0003
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0003
     * @tc.desc   Test packaged moving-photo media assets, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0004
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0004
     * @tc.desc   Test packaged moving-photo media assets, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0005
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0005
     * @tc.desc   Test packaged moving-photo media assets, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0006
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0006
     * @tc.desc   Test packaged moving-photo media assets, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0007
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0007
     * @tc.desc   Test packaged moving-photo media assets, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0008
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0008
     * @tc.desc   Test packaged moving-photo media assets, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0009
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0009
     * @tc.desc   Test packaged moving-photo media assets, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0010
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0010
     * @tc.desc   Test packaged moving-photo media assets, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0011
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0011
     * @tc.desc   Test packaged moving-photo media assets, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0012
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0012
     * @tc.desc   Test packaged moving-photo media assets, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0013
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0013
     * @tc.desc   Test packaged moving-photo media assets, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0014
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0014
     * @tc.desc   Test packaged moving-photo media assets, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0015
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0015
     * @tc.desc   Test packaged moving-photo media assets, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0016
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0016
     * @tc.desc   Test packaged moving-photo media assets, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0017
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0017
     * @tc.desc   Test packaged moving-photo media assets, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0018
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0018
     * @tc.desc   Test packaged moving-photo media assets, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0019
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0019
     * @tc.desc   Test packaged moving-photo media assets, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0020
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0020
     * @tc.desc   Test packaged moving-photo media assets, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0021
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0021
     * @tc.desc   Test packaged moving-photo media assets, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0022
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0022
     * @tc.desc   Test packaged moving-photo media assets, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0023
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0023
     * @tc.desc   Test packaged moving-photo media assets, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0024
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0024
     * @tc.desc   Test packaged moving-photo media assets, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0025
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0025
     * @tc.desc   Test packaged moving-photo media assets, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0026
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0026
     * @tc.desc   Test packaged moving-photo media assets, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0027
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0027
     * @tc.desc   Test packaged moving-photo media assets, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0028
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0028
     * @tc.desc   Test packaged moving-photo media assets, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0029
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0029
     * @tc.desc   Test packaged moving-photo media assets, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0030
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0030
     * @tc.desc   Test packaged moving-photo media assets, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0031
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0031
     * @tc.desc   Test packaged moving-photo media assets, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0032
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0032
     * @tc.desc   Test packaged moving-photo media assets, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0033
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0033
     * @tc.desc   Test packaged moving-photo media assets, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0034
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0034
     * @tc.desc   Test packaged moving-photo media assets, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0035
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0035
     * @tc.desc   Test packaged moving-photo media assets, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0036
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0036
     * @tc.desc   Test packaged moving-photo media assets, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0037
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0037
     * @tc.desc   Test packaged moving-photo media assets, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0038
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0038
     * @tc.desc   Test packaged moving-photo media assets, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0039
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0039
     * @tc.desc   Test packaged moving-photo media assets, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })

    /**
     * @tc.name   testMediaAssets0040
     * @tc.number MOVING_PHOTO_MEDIA_ASSET_0040
     * @tc.desc   Test packaged moving-photo media assets, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaAssets0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
      expect(image[0]).assertEqual(0xFF);
      expect(image[1]).assertEqual(0xD8);
      expect(video.byteLength > 12).assertTrue();
    })
  })
}
