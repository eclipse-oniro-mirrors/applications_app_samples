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
let info: bundleManager.BundleInfo;

export default function movingPhotoPlusBundleDeepTest() {
  describe('MovingPhotoPlusBundleDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE); })

    /**
     * @tc.name   testMpPlusBundleDeep0001
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0001
     * @tc.desc   Inspect moving photo application metadata 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0002
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0002
     * @tc.desc   Inspect moving photo application metadata 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0003
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0003
     * @tc.desc   Inspect moving photo application metadata 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0004
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0004
     * @tc.desc   Inspect moving photo application metadata 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0005
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0005
     * @tc.desc   Inspect moving photo application metadata 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0006
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0006
     * @tc.desc   Inspect moving photo application metadata 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0007
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0007
     * @tc.desc   Inspect moving photo application metadata 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0008
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0008
     * @tc.desc   Inspect moving photo application metadata 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0009
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0009
     * @tc.desc   Inspect moving photo application metadata 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0010
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0010
     * @tc.desc   Inspect moving photo application metadata 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0011
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0011
     * @tc.desc   Inspect moving photo application metadata 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0012
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0012
     * @tc.desc   Inspect moving photo application metadata 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0013
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0013
     * @tc.desc   Inspect moving photo application metadata 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0014
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0014
     * @tc.desc   Inspect moving photo application metadata 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0015
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0015
     * @tc.desc   Inspect moving photo application metadata 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0016
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0016
     * @tc.desc   Inspect moving photo application metadata 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(16 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0017
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0017
     * @tc.desc   Inspect moving photo application metadata 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(17 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0018
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0018
     * @tc.desc   Inspect moving photo application metadata 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(18 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0019
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0019
     * @tc.desc   Inspect moving photo application metadata 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(19 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0020
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0020
     * @tc.desc   Inspect moving photo application metadata 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(20 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0021
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0021
     * @tc.desc   Inspect moving photo application metadata 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(21 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0022
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0022
     * @tc.desc   Inspect moving photo application metadata 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(22 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0023
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0023
     * @tc.desc   Inspect moving photo application metadata 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(23 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0024
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0024
     * @tc.desc   Inspect moving photo application metadata 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(24 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0025
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0025
     * @tc.desc   Inspect moving photo application metadata 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(25 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0026
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0026
     * @tc.desc   Inspect moving photo application metadata 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(26 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0027
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0027
     * @tc.desc   Inspect moving photo application metadata 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(27 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0028
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0028
     * @tc.desc   Inspect moving photo application metadata 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(28 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0029
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0029
     * @tc.desc   Inspect moving photo application metadata 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(29 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0030
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0030
     * @tc.desc   Inspect moving photo application metadata 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(30 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0031
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0031
     * @tc.desc   Inspect moving photo application metadata 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(31 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0032
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0032
     * @tc.desc   Inspect moving photo application metadata 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(32 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0033
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0033
     * @tc.desc   Inspect moving photo application metadata 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(33 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0034
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0034
     * @tc.desc   Inspect moving photo application metadata 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(34 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0035
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0035
     * @tc.desc   Inspect moving photo application metadata 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(35 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0036
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0036
     * @tc.desc   Inspect moving photo application metadata 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(36 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0037
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0037
     * @tc.desc   Inspect moving photo application metadata 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(37 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0038
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0038
     * @tc.desc   Inspect moving photo application metadata 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(38 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0039
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0039
     * @tc.desc   Inspect moving photo application metadata 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(39 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0040
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0040
     * @tc.desc   Inspect moving photo application metadata 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(40 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0041
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0041
     * @tc.desc   Inspect moving photo application metadata 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(41 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0042
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0042
     * @tc.desc   Inspect moving photo application metadata 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(42 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0043
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0043
     * @tc.desc   Inspect moving photo application metadata 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(43 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0044
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0044
     * @tc.desc   Inspect moving photo application metadata 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(44 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0045
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0045
     * @tc.desc   Inspect moving photo application metadata 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(45 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0046
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0046
     * @tc.desc   Inspect moving photo application metadata 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(46 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0047
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0047
     * @tc.desc   Inspect moving photo application metadata 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(47 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0048
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0048
     * @tc.desc   Inspect moving photo application metadata 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(48 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0049
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0049
     * @tc.desc   Inspect moving photo application metadata 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(49 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0050
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0050
     * @tc.desc   Inspect moving photo application metadata 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(50 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0051
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0051
     * @tc.desc   Inspect moving photo application metadata 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(51 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0052
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0052
     * @tc.desc   Inspect moving photo application metadata 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(52 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0053
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0053
     * @tc.desc   Inspect moving photo application metadata 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(53 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0054
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0054
     * @tc.desc   Inspect moving photo application metadata 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(54 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0055
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0055
     * @tc.desc   Inspect moving photo application metadata 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(55 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0056
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0056
     * @tc.desc   Inspect moving photo application metadata 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(56 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0057
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0057
     * @tc.desc   Inspect moving photo application metadata 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(57 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0058
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0058
     * @tc.desc   Inspect moving photo application metadata 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(58 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0059
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0059
     * @tc.desc   Inspect moving photo application metadata 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(59 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusBundleDeep0060
     * @tc.number MOVING_PHOTO_PLUS_BUNDLE_DEEP_0060
     * @tc.desc   Inspect moving photo application metadata 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusBundleDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.name).assertEqual('com.example.movingphotoviewsample');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(60 > 0).assertTrue();
    })
  })
}
