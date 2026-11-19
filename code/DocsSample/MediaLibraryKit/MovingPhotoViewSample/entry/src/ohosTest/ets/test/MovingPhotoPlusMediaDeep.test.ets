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

export default function movingPhotoPlusMediaDeepTest() {
  describe('MovingPhotoPlusMediaDeepTest', () => {
    beforeAll(() => { ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext(); })

    /**
     * @tc.name   testMpPlusMediaDeep0001
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0001
     * @tc.desc   Check packaged media sizes and signatures 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 100).assertTrue();
      expect(video.byteLength > 100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0002
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0002
     * @tc.desc   Check packaged media sizes and signatures 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 200).assertTrue();
      expect(video.byteLength > 200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0003
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0003
     * @tc.desc   Check packaged media sizes and signatures 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 300).assertTrue();
      expect(video.byteLength > 300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0004
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0004
     * @tc.desc   Check packaged media sizes and signatures 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 400).assertTrue();
      expect(video.byteLength > 400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0005
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0005
     * @tc.desc   Check packaged media sizes and signatures 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 500).assertTrue();
      expect(video.byteLength > 500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0006
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0006
     * @tc.desc   Check packaged media sizes and signatures 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 600).assertTrue();
      expect(video.byteLength > 600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0007
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0007
     * @tc.desc   Check packaged media sizes and signatures 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 700).assertTrue();
      expect(video.byteLength > 700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0008
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0008
     * @tc.desc   Check packaged media sizes and signatures 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 800).assertTrue();
      expect(video.byteLength > 800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0009
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0009
     * @tc.desc   Check packaged media sizes and signatures 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 900).assertTrue();
      expect(video.byteLength > 900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0010
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0010
     * @tc.desc   Check packaged media sizes and signatures 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1000).assertTrue();
      expect(video.byteLength > 1000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0011
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0011
     * @tc.desc   Check packaged media sizes and signatures 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1100).assertTrue();
      expect(video.byteLength > 1100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0012
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0012
     * @tc.desc   Check packaged media sizes and signatures 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1200).assertTrue();
      expect(video.byteLength > 1200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0013
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0013
     * @tc.desc   Check packaged media sizes and signatures 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1300).assertTrue();
      expect(video.byteLength > 1300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0014
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0014
     * @tc.desc   Check packaged media sizes and signatures 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1400).assertTrue();
      expect(video.byteLength > 1400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0015
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0015
     * @tc.desc   Check packaged media sizes and signatures 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1500).assertTrue();
      expect(video.byteLength > 1500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0016
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0016
     * @tc.desc   Check packaged media sizes and signatures 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1600).assertTrue();
      expect(video.byteLength > 1600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0017
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0017
     * @tc.desc   Check packaged media sizes and signatures 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1700).assertTrue();
      expect(video.byteLength > 1700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0018
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0018
     * @tc.desc   Check packaged media sizes and signatures 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1800).assertTrue();
      expect(video.byteLength > 1800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0019
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0019
     * @tc.desc   Check packaged media sizes and signatures 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1900).assertTrue();
      expect(video.byteLength > 1900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0020
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0020
     * @tc.desc   Check packaged media sizes and signatures 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2000).assertTrue();
      expect(video.byteLength > 2000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0021
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0021
     * @tc.desc   Check packaged media sizes and signatures 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2100).assertTrue();
      expect(video.byteLength > 2100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0022
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0022
     * @tc.desc   Check packaged media sizes and signatures 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2200).assertTrue();
      expect(video.byteLength > 2200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0023
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0023
     * @tc.desc   Check packaged media sizes and signatures 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2300).assertTrue();
      expect(video.byteLength > 2300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0024
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0024
     * @tc.desc   Check packaged media sizes and signatures 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2400).assertTrue();
      expect(video.byteLength > 2400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0025
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0025
     * @tc.desc   Check packaged media sizes and signatures 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2500).assertTrue();
      expect(video.byteLength > 2500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0026
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0026
     * @tc.desc   Check packaged media sizes and signatures 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2600).assertTrue();
      expect(video.byteLength > 2600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0027
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0027
     * @tc.desc   Check packaged media sizes and signatures 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2700).assertTrue();
      expect(video.byteLength > 2700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0028
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0028
     * @tc.desc   Check packaged media sizes and signatures 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2800).assertTrue();
      expect(video.byteLength > 2800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0029
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0029
     * @tc.desc   Check packaged media sizes and signatures 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2900).assertTrue();
      expect(video.byteLength > 2900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0030
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0030
     * @tc.desc   Check packaged media sizes and signatures 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3000).assertTrue();
      expect(video.byteLength > 3000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0031
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0031
     * @tc.desc   Check packaged media sizes and signatures 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3100).assertTrue();
      expect(video.byteLength > 3100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0032
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0032
     * @tc.desc   Check packaged media sizes and signatures 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3200).assertTrue();
      expect(video.byteLength > 3200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0033
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0033
     * @tc.desc   Check packaged media sizes and signatures 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3300).assertTrue();
      expect(video.byteLength > 3300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0034
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0034
     * @tc.desc   Check packaged media sizes and signatures 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3400).assertTrue();
      expect(video.byteLength > 3400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0035
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0035
     * @tc.desc   Check packaged media sizes and signatures 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3500).assertTrue();
      expect(video.byteLength > 3500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0036
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0036
     * @tc.desc   Check packaged media sizes and signatures 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3600).assertTrue();
      expect(video.byteLength > 3600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0037
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0037
     * @tc.desc   Check packaged media sizes and signatures 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3700).assertTrue();
      expect(video.byteLength > 3700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0038
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0038
     * @tc.desc   Check packaged media sizes and signatures 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3800).assertTrue();
      expect(video.byteLength > 3800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0039
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0039
     * @tc.desc   Check packaged media sizes and signatures 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3900).assertTrue();
      expect(video.byteLength > 3900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0040
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0040
     * @tc.desc   Check packaged media sizes and signatures 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4000).assertTrue();
      expect(video.byteLength > 4000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0041
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0041
     * @tc.desc   Check packaged media sizes and signatures 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4100).assertTrue();
      expect(video.byteLength > 4100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0042
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0042
     * @tc.desc   Check packaged media sizes and signatures 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4200).assertTrue();
      expect(video.byteLength > 4200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0043
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0043
     * @tc.desc   Check packaged media sizes and signatures 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4300).assertTrue();
      expect(video.byteLength > 4300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0044
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0044
     * @tc.desc   Check packaged media sizes and signatures 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4400).assertTrue();
      expect(video.byteLength > 4400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0045
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0045
     * @tc.desc   Check packaged media sizes and signatures 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4500).assertTrue();
      expect(video.byteLength > 4500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0046
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0046
     * @tc.desc   Check packaged media sizes and signatures 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4600).assertTrue();
      expect(video.byteLength > 4600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0047
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0047
     * @tc.desc   Check packaged media sizes and signatures 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4700).assertTrue();
      expect(video.byteLength > 4700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0048
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0048
     * @tc.desc   Check packaged media sizes and signatures 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4800).assertTrue();
      expect(video.byteLength > 4800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0049
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0049
     * @tc.desc   Check packaged media sizes and signatures 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4900).assertTrue();
      expect(video.byteLength > 4900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0050
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0050
     * @tc.desc   Check packaged media sizes and signatures 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5000).assertTrue();
      expect(video.byteLength > 5000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0051
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0051
     * @tc.desc   Check packaged media sizes and signatures 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5100).assertTrue();
      expect(video.byteLength > 5100).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0052
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0052
     * @tc.desc   Check packaged media sizes and signatures 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5200).assertTrue();
      expect(video.byteLength > 5200).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0053
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0053
     * @tc.desc   Check packaged media sizes and signatures 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5300).assertTrue();
      expect(video.byteLength > 5300).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0054
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0054
     * @tc.desc   Check packaged media sizes and signatures 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5400).assertTrue();
      expect(video.byteLength > 5400).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0055
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0055
     * @tc.desc   Check packaged media sizes and signatures 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5500).assertTrue();
      expect(video.byteLength > 5500).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0056
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0056
     * @tc.desc   Check packaged media sizes and signatures 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5600).assertTrue();
      expect(video.byteLength > 5600).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0057
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0057
     * @tc.desc   Check packaged media sizes and signatures 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5700).assertTrue();
      expect(video.byteLength > 5700).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0058
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0058
     * @tc.desc   Check packaged media sizes and signatures 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5800).assertTrue();
      expect(video.byteLength > 5800).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0059
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0059
     * @tc.desc   Check packaged media sizes and signatures 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5900).assertTrue();
      expect(video.byteLength > 5900).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })

    /**
     * @tc.name   testMpPlusMediaDeep0060
     * @tc.number MOVING_PHOTO_PLUS_MEDIA_DEEP_0060
     * @tc.desc   Check packaged media sizes and signatures 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusMediaDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 6000).assertTrue();
      expect(video.byteLength > 6000).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video[0]).assertEqual(0);
      expect(video.byteLength > image.byteLength).assertTrue();
    })
  })
}
