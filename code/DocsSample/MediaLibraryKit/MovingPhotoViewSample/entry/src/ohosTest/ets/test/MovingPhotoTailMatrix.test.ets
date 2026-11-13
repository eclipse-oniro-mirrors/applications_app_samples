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
import { bundleManager } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
let bundleInfo: bundleManager.BundleInfo;

export default function movingPhotoTailMatrixTest() {
  describe('MovingPhotoTailMatrixTest', () => {
    beforeAll(() => {
      bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
    })

    /**
     * @tc.name   testTailMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0001
     * @tc.desc   Test final bundle identity matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0002
     * @tc.desc   Test final bundle identity matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0003
     * @tc.desc   Test final bundle identity matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0004
     * @tc.desc   Test final bundle identity matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0005
     * @tc.desc   Test final bundle identity matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0006
     * @tc.desc   Test final bundle identity matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0007
     * @tc.desc   Test final bundle identity matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0008
     * @tc.desc   Test final bundle identity matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0009
     * @tc.desc   Test final bundle identity matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testTailMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_TAIL_0010
     * @tc.desc   Test final bundle identity matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTailMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })
  })
}
