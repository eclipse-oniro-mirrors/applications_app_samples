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
export default function movingPhotoMediaDeepTest() {
  describe('MovingPhotoMediaDeepTest', () => {
    beforeAll(() => { ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext(); })

    /**
     * @tc.name   testMediaDeep0001
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0001
     * @tc.desc   Test media asset deep case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0002
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0002
     * @tc.desc   Test media asset deep case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0003
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0003
     * @tc.desc   Test media asset deep case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0004
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0004
     * @tc.desc   Test media asset deep case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0005
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0005
     * @tc.desc   Test media asset deep case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0006
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0006
     * @tc.desc   Test media asset deep case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0007
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0007
     * @tc.desc   Test media asset deep case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0008
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0008
     * @tc.desc   Test media asset deep case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0009
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0009
     * @tc.desc   Test media asset deep case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0010
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0010
     * @tc.desc   Test media asset deep case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0011
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0011
     * @tc.desc   Test media asset deep case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0012
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0012
     * @tc.desc   Test media asset deep case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0013
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0013
     * @tc.desc   Test media asset deep case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0014
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0014
     * @tc.desc   Test media asset deep case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0015
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0015
     * @tc.desc   Test media asset deep case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0016
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0016
     * @tc.desc   Test media asset deep case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0017
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0017
     * @tc.desc   Test media asset deep case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0018
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0018
     * @tc.desc   Test media asset deep case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0019
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0019
     * @tc.desc   Test media asset deep case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0020
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0020
     * @tc.desc   Test media asset deep case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0021
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0021
     * @tc.desc   Test media asset deep case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0022
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0022
     * @tc.desc   Test media asset deep case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0023
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0023
     * @tc.desc   Test media asset deep case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0024
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0024
     * @tc.desc   Test media asset deep case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0025
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0025
     * @tc.desc   Test media asset deep case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0026
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0026
     * @tc.desc   Test media asset deep case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0027
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0027
     * @tc.desc   Test media asset deep case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0028
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0028
     * @tc.desc   Test media asset deep case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0029
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0029
     * @tc.desc   Test media asset deep case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0030
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0030
     * @tc.desc   Test media asset deep case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0031
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0031
     * @tc.desc   Test media asset deep case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0032
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0032
     * @tc.desc   Test media asset deep case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0033
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0033
     * @tc.desc   Test media asset deep case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0034
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0034
     * @tc.desc   Test media asset deep case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0035
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0035
     * @tc.desc   Test media asset deep case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0036
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0036
     * @tc.desc   Test media asset deep case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0037
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0037
     * @tc.desc   Test media asset deep case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0038
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0038
     * @tc.desc   Test media asset deep case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0039
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0039
     * @tc.desc   Test media asset deep case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0040
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0040
     * @tc.desc   Test media asset deep case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0041
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0041
     * @tc.desc   Test media asset deep case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0042
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0042
     * @tc.desc   Test media asset deep case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0043
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0043
     * @tc.desc   Test media asset deep case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0044
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0044
     * @tc.desc   Test media asset deep case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0045
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0045
     * @tc.desc   Test media asset deep case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0046
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0046
     * @tc.desc   Test media asset deep case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0047
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0047
     * @tc.desc   Test media asset deep case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0048
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0048
     * @tc.desc   Test media asset deep case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0049
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0049
     * @tc.desc   Test media asset deep case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })

    /**
     * @tc.name   testMediaDeep0050
     * @tc.number MOVING_PHOTO_MEDIA_DEEP_0050
     * @tc.desc   Test media asset deep case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMediaDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { const image: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.jpg'); const video: Uint8Array = await ctx.resourceManager.getRawFileContent('moving_photo.mp4'); expect(image.byteLength > 0).assertTrue(); expect(video.byteLength > 12).assertTrue(); expect(image[0]).assertEqual(0xFF); expect(image[1]).assertEqual(0xD8); })
  })
}
