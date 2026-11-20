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
let appContext: common.Context;

export default function movingPhotoPlusResourceTest() {
  describe('MovingPhotoPlusResourceTest', () => {
    beforeAll(() => { appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext(); })

    /**
     * @tc.name   testMpPlusResource0001
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0001
     * @tc.desc   Load packaged moving photo assets with threshold 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 1).assertTrue();
      expect(video.byteLength > 1).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0002
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0002
     * @tc.desc   Load packaged moving photo assets with threshold 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 2).assertTrue();
      expect(video.byteLength > 2).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0003
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0003
     * @tc.desc   Load packaged moving photo assets with threshold 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 3).assertTrue();
      expect(video.byteLength > 3).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0004
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0004
     * @tc.desc   Load packaged moving photo assets with threshold 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 4).assertTrue();
      expect(video.byteLength > 4).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0005
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0005
     * @tc.desc   Load packaged moving photo assets with threshold 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 5).assertTrue();
      expect(video.byteLength > 5).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0006
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0006
     * @tc.desc   Load packaged moving photo assets with threshold 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 6).assertTrue();
      expect(video.byteLength > 6).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0007
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0007
     * @tc.desc   Load packaged moving photo assets with threshold 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 7).assertTrue();
      expect(video.byteLength > 7).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0008
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0008
     * @tc.desc   Load packaged moving photo assets with threshold 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 8).assertTrue();
      expect(video.byteLength > 8).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0009
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0009
     * @tc.desc   Load packaged moving photo assets with threshold 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 9).assertTrue();
      expect(video.byteLength > 9).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0010
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0010
     * @tc.desc   Load packaged moving photo assets with threshold 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 10).assertTrue();
      expect(video.byteLength > 10).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0011
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0011
     * @tc.desc   Load packaged moving photo assets with threshold 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 11).assertTrue();
      expect(video.byteLength > 11).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0012
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0012
     * @tc.desc   Load packaged moving photo assets with threshold 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 12).assertTrue();
      expect(video.byteLength > 12).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0013
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0013
     * @tc.desc   Load packaged moving photo assets with threshold 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 13).assertTrue();
      expect(video.byteLength > 13).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0014
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0014
     * @tc.desc   Load packaged moving photo assets with threshold 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 14).assertTrue();
      expect(video.byteLength > 14).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0015
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0015
     * @tc.desc   Load packaged moving photo assets with threshold 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 15).assertTrue();
      expect(video.byteLength > 15).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0016
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0016
     * @tc.desc   Load packaged moving photo assets with threshold 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 16).assertTrue();
      expect(video.byteLength > 16).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0017
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0017
     * @tc.desc   Load packaged moving photo assets with threshold 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 17).assertTrue();
      expect(video.byteLength > 17).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0018
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0018
     * @tc.desc   Load packaged moving photo assets with threshold 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 18).assertTrue();
      expect(video.byteLength > 18).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0019
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0019
     * @tc.desc   Load packaged moving photo assets with threshold 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 19).assertTrue();
      expect(video.byteLength > 19).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0020
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0020
     * @tc.desc   Load packaged moving photo assets with threshold 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 20).assertTrue();
      expect(video.byteLength > 20).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0021
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0021
     * @tc.desc   Load packaged moving photo assets with threshold 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 21).assertTrue();
      expect(video.byteLength > 21).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0022
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0022
     * @tc.desc   Load packaged moving photo assets with threshold 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 22).assertTrue();
      expect(video.byteLength > 22).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0023
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0023
     * @tc.desc   Load packaged moving photo assets with threshold 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 23).assertTrue();
      expect(video.byteLength > 23).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0024
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0024
     * @tc.desc   Load packaged moving photo assets with threshold 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 24).assertTrue();
      expect(video.byteLength > 24).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0025
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0025
     * @tc.desc   Load packaged moving photo assets with threshold 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 25).assertTrue();
      expect(video.byteLength > 25).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0026
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0026
     * @tc.desc   Load packaged moving photo assets with threshold 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 26).assertTrue();
      expect(video.byteLength > 26).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0027
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0027
     * @tc.desc   Load packaged moving photo assets with threshold 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 27).assertTrue();
      expect(video.byteLength > 27).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0028
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0028
     * @tc.desc   Load packaged moving photo assets with threshold 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 28).assertTrue();
      expect(video.byteLength > 28).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0029
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0029
     * @tc.desc   Load packaged moving photo assets with threshold 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 29).assertTrue();
      expect(video.byteLength > 29).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0030
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0030
     * @tc.desc   Load packaged moving photo assets with threshold 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 30).assertTrue();
      expect(video.byteLength > 30).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0031
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0031
     * @tc.desc   Load packaged moving photo assets with threshold 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 31).assertTrue();
      expect(video.byteLength > 31).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0032
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0032
     * @tc.desc   Load packaged moving photo assets with threshold 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 32).assertTrue();
      expect(video.byteLength > 32).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0033
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0033
     * @tc.desc   Load packaged moving photo assets with threshold 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 33).assertTrue();
      expect(video.byteLength > 33).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0034
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0034
     * @tc.desc   Load packaged moving photo assets with threshold 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 34).assertTrue();
      expect(video.byteLength > 34).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0035
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0035
     * @tc.desc   Load packaged moving photo assets with threshold 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 35).assertTrue();
      expect(video.byteLength > 35).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0036
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0036
     * @tc.desc   Load packaged moving photo assets with threshold 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 36).assertTrue();
      expect(video.byteLength > 36).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0037
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0037
     * @tc.desc   Load packaged moving photo assets with threshold 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 37).assertTrue();
      expect(video.byteLength > 37).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0038
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0038
     * @tc.desc   Load packaged moving photo assets with threshold 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 38).assertTrue();
      expect(video.byteLength > 38).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0039
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0039
     * @tc.desc   Load packaged moving photo assets with threshold 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 39).assertTrue();
      expect(video.byteLength > 39).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0040
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0040
     * @tc.desc   Load packaged moving photo assets with threshold 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 40).assertTrue();
      expect(video.byteLength > 40).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0041
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0041
     * @tc.desc   Load packaged moving photo assets with threshold 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 41).assertTrue();
      expect(video.byteLength > 41).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0042
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0042
     * @tc.desc   Load packaged moving photo assets with threshold 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 42).assertTrue();
      expect(video.byteLength > 42).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0043
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0043
     * @tc.desc   Load packaged moving photo assets with threshold 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 43).assertTrue();
      expect(video.byteLength > 43).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0044
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0044
     * @tc.desc   Load packaged moving photo assets with threshold 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 44).assertTrue();
      expect(video.byteLength > 44).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0045
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0045
     * @tc.desc   Load packaged moving photo assets with threshold 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 45).assertTrue();
      expect(video.byteLength > 45).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0046
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0046
     * @tc.desc   Load packaged moving photo assets with threshold 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 46).assertTrue();
      expect(video.byteLength > 46).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0047
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0047
     * @tc.desc   Load packaged moving photo assets with threshold 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 47).assertTrue();
      expect(video.byteLength > 47).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0048
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0048
     * @tc.desc   Load packaged moving photo assets with threshold 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 48).assertTrue();
      expect(video.byteLength > 48).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0049
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0049
     * @tc.desc   Load packaged moving photo assets with threshold 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 49).assertTrue();
      expect(video.byteLength > 49).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0050
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0050
     * @tc.desc   Load packaged moving photo assets with threshold 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 50).assertTrue();
      expect(video.byteLength > 50).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0051
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0051
     * @tc.desc   Load packaged moving photo assets with threshold 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 51).assertTrue();
      expect(video.byteLength > 51).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0052
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0052
     * @tc.desc   Load packaged moving photo assets with threshold 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 52).assertTrue();
      expect(video.byteLength > 52).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0053
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0053
     * @tc.desc   Load packaged moving photo assets with threshold 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 53).assertTrue();
      expect(video.byteLength > 53).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0054
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0054
     * @tc.desc   Load packaged moving photo assets with threshold 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 54).assertTrue();
      expect(video.byteLength > 54).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0055
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0055
     * @tc.desc   Load packaged moving photo assets with threshold 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 55).assertTrue();
      expect(video.byteLength > 55).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0056
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0056
     * @tc.desc   Load packaged moving photo assets with threshold 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 56).assertTrue();
      expect(video.byteLength > 56).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0057
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0057
     * @tc.desc   Load packaged moving photo assets with threshold 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 57).assertTrue();
      expect(video.byteLength > 57).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0058
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0058
     * @tc.desc   Load packaged moving photo assets with threshold 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 58).assertTrue();
      expect(video.byteLength > 58).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0059
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0059
     * @tc.desc   Load packaged moving photo assets with threshold 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 59).assertTrue();
      expect(video.byteLength > 59).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusResource0060
     * @tc.number MOVING_PHOTO_PLUS_RESOURCE_0060
     * @tc.desc   Load packaged moving photo assets with threshold 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusResource0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 60).assertTrue();
      expect(video.byteLength > 60).assertTrue();
      expect(image[0]).assertEqual(255);
      expect(image[1]).assertEqual(216);
      expect(video.byteLength > 0).assertTrue();
    })
  })
}
