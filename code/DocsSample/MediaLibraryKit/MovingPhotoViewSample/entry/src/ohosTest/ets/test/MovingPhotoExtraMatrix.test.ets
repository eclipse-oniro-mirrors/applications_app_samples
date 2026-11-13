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
import { bundleManager, common } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
let bundleInfo: bundleManager.BundleInfo;
let appContext: common.Context;

export default function movingPhotoExtraMatrixTest() {
  describe('MovingPhotoExtraMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testExtraMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0001
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0002
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0003
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0004
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0005
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0006
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0007
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0008
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0009
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0010
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0011
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0012
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0013
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0014
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0015
     * @tc.desc   Test packaged moving-photo raw assets. Extra matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testExtraMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0016
     * @tc.desc   Test bundle identity fields. Extra matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0017
     * @tc.desc   Test bundle identity fields. Extra matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0018
     * @tc.desc   Test bundle identity fields. Extra matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0019
     * @tc.desc   Test bundle identity fields. Extra matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0020
     * @tc.desc   Test bundle identity fields. Extra matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0021
     * @tc.desc   Test bundle identity fields. Extra matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0022
     * @tc.desc   Test bundle identity fields. Extra matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0023
     * @tc.desc   Test bundle identity fields. Extra matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0024
     * @tc.desc   Test bundle identity fields. Extra matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testExtraMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_EXTRA_0025
     * @tc.desc   Test bundle identity fields. Extra matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExtraMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })
  })
}
