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
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME } from './shared/BundleProbe';
import {
  FLAG_APPLICATION,
  FLAG_ABILITY,
  FLAG_EXTENSION,
  FLAG_HAP_MODULE,
  FLAG_SIGNATURE,
  flagsForIndex,
  hasFlag
} from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_BundleFieldExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFieldExtendedTest() {
  describe('bundleFieldExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0065
     * @tc.name      testBundleField0065
     * @tc.desc      Verify bundleField with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0065 begin');
      const flags: number = flagsForIndex(64);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0066
     * @tc.name      testBundleField0066
     * @tc.desc      Verify bundleField with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0066 begin');
      const flags: number = flagsForIndex(65);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0067
     * @tc.name      testBundleField0067
     * @tc.desc      Verify bundleField with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0067 begin');
      const flags: number = flagsForIndex(66);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0068
     * @tc.name      testBundleField0068
     * @tc.desc      Verify bundleField with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0068 begin');
      const flags: number = flagsForIndex(67);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0069
     * @tc.name      testBundleField0069
     * @tc.desc      Verify bundleField with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0069 begin');
      const flags: number = flagsForIndex(68);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0070
     * @tc.name      testBundleField0070
     * @tc.desc      Verify bundleField with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0070 begin');
      const flags: number = flagsForIndex(69);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0071
     * @tc.name      testBundleField0071
     * @tc.desc      Verify bundleField with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0071 begin');
      const flags: number = flagsForIndex(70);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0072
     * @tc.name      testBundleField0072
     * @tc.desc      Verify bundleField with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0072 begin');
      const flags: number = flagsForIndex(71);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0073
     * @tc.name      testBundleField0073
     * @tc.desc      Verify bundleField with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0073 begin');
      const flags: number = flagsForIndex(72);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0074
     * @tc.name      testBundleField0074
     * @tc.desc      Verify bundleField with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0074 begin');
      const flags: number = flagsForIndex(73);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0075
     * @tc.name      testBundleField0075
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0075 begin');
      const flags: number = flagsForIndex(74);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0076
     * @tc.name      testBundleField0076
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0076 begin');
      const flags: number = flagsForIndex(75);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0077
     * @tc.name      testBundleField0077
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0077 begin');
      const flags: number = flagsForIndex(76);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0078
     * @tc.name      testBundleField0078
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0078 begin');
      const flags: number = flagsForIndex(77);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0079
     * @tc.name      testBundleField0079
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0079 begin');
      const flags: number = flagsForIndex(78);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0080
     * @tc.name      testBundleField0080
     * @tc.desc      Verify bundleField with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0080 begin');
      const flags: number = flagsForIndex(79);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0081
     * @tc.name      testBundleField0081
     * @tc.desc      Verify bundleField with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0081 begin');
      const flags: number = flagsForIndex(80);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0082
     * @tc.name      testBundleField0082
     * @tc.desc      Verify bundleField with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0082 begin');
      const flags: number = flagsForIndex(81);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0083
     * @tc.name      testBundleField0083
     * @tc.desc      Verify bundleField with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0083 begin');
      const flags: number = flagsForIndex(82);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0084
     * @tc.name      testBundleField0084
     * @tc.desc      Verify bundleField with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0084 begin');
      const flags: number = flagsForIndex(83);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0085
     * @tc.name      testBundleField0085
     * @tc.desc      Verify bundleField with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0085 begin');
      const flags: number = flagsForIndex(84);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0086
     * @tc.name      testBundleField0086
     * @tc.desc      Verify bundleField with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0086 begin');
      const flags: number = flagsForIndex(85);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0087
     * @tc.name      testBundleField0087
     * @tc.desc      Verify bundleField with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0087 begin');
      const flags: number = flagsForIndex(86);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0088
     * @tc.name      testBundleField0088
     * @tc.desc      Verify bundleField with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0088 begin');
      const flags: number = flagsForIndex(87);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0089
     * @tc.name      testBundleField0089
     * @tc.desc      Verify bundleField with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0089 begin');
      const flags: number = flagsForIndex(88);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0090
     * @tc.name      testBundleField0090
     * @tc.desc      Verify bundleField with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0090 begin');
      const flags: number = flagsForIndex(89);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0091
     * @tc.name      testBundleField0091
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0091 begin');
      const flags: number = flagsForIndex(90);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0092
     * @tc.name      testBundleField0092
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0092 begin');
      const flags: number = flagsForIndex(91);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0093
     * @tc.name      testBundleField0093
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0093 begin');
      const flags: number = flagsForIndex(92);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0094
     * @tc.name      testBundleField0094
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0094 begin');
      const flags: number = flagsForIndex(93);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0095
     * @tc.name      testBundleField0095
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0095 begin');
      const flags: number = flagsForIndex(94);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0096
     * @tc.name      testBundleField0096
     * @tc.desc      Verify bundleField with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0096 begin');
      const flags: number = flagsForIndex(95);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0097
     * @tc.name      testBundleField0097
     * @tc.desc      Verify bundleField with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0097 begin');
      const flags: number = flagsForIndex(96);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0098
     * @tc.name      testBundleField0098
     * @tc.desc      Verify bundleField with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0098 begin');
      const flags: number = flagsForIndex(97);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0099
     * @tc.name      testBundleField0099
     * @tc.desc      Verify bundleField with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0099 begin');
      const flags: number = flagsForIndex(98);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0100
     * @tc.name      testBundleField0100
     * @tc.desc      Verify bundleField with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0100 begin');
      const flags: number = flagsForIndex(99);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0101
     * @tc.name      testBundleField0101
     * @tc.desc      Verify bundleField with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0101 begin');
      const flags: number = flagsForIndex(100);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0102
     * @tc.name      testBundleField0102
     * @tc.desc      Verify bundleField with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0102 begin');
      const flags: number = flagsForIndex(101);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0103
     * @tc.name      testBundleField0103
     * @tc.desc      Verify bundleField with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0103 begin');
      const flags: number = flagsForIndex(102);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0104
     * @tc.name      testBundleField0104
     * @tc.desc      Verify bundleField with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0104 begin');
      const flags: number = flagsForIndex(103);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0105
     * @tc.name      testBundleField0105
     * @tc.desc      Verify bundleField with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0105 begin');
      const flags: number = flagsForIndex(104);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0106
     * @tc.name      testBundleField0106
     * @tc.desc      Verify bundleField with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0106 begin');
      const flags: number = flagsForIndex(105);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0107
     * @tc.name      testBundleField0107
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0107 begin');
      const flags: number = flagsForIndex(106);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0108
     * @tc.name      testBundleField0108
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0108 begin');
      const flags: number = flagsForIndex(107);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0109
     * @tc.name      testBundleField0109
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0109 begin');
      const flags: number = flagsForIndex(108);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0110
     * @tc.name      testBundleField0110
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0110 begin');
      const flags: number = flagsForIndex(109);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0111
     * @tc.name      testBundleField0111
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0111 begin');
      const flags: number = flagsForIndex(110);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0112
     * @tc.name      testBundleField0112
     * @tc.desc      Verify bundleField with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0112 begin');
      const flags: number = flagsForIndex(111);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0113
     * @tc.name      testBundleField0113
     * @tc.desc      Verify bundleField with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0113 begin');
      const flags: number = flagsForIndex(112);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0114
     * @tc.name      testBundleField0114
     * @tc.desc      Verify bundleField with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0114 begin');
      const flags: number = flagsForIndex(113);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0115
     * @tc.name      testBundleField0115
     * @tc.desc      Verify bundleField with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0115 begin');
      const flags: number = flagsForIndex(114);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0116
     * @tc.name      testBundleField0116
     * @tc.desc      Verify bundleField with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0116 begin');
      const flags: number = flagsForIndex(115);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0117
     * @tc.name      testBundleField0117
     * @tc.desc      Verify bundleField with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0117 begin');
      const flags: number = flagsForIndex(116);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0118
     * @tc.name      testBundleField0118
     * @tc.desc      Verify bundleField with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0118 begin');
      const flags: number = flagsForIndex(117);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0119
     * @tc.name      testBundleField0119
     * @tc.desc      Verify bundleField with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0119 begin');
      const flags: number = flagsForIndex(118);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0120
     * @tc.name      testBundleField0120
     * @tc.desc      Verify bundleField with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0120 begin');
      const flags: number = flagsForIndex(119);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0121
     * @tc.name      testBundleField0121
     * @tc.desc      Verify bundleField with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0121 begin');
      const flags: number = flagsForIndex(120);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0122
     * @tc.name      testBundleField0122
     * @tc.desc      Verify bundleField with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0122 begin');
      const flags: number = flagsForIndex(121);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0123
     * @tc.name      testBundleField0123
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0123 begin');
      const flags: number = flagsForIndex(122);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0124
     * @tc.name      testBundleField0124
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0124 begin');
      const flags: number = flagsForIndex(123);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0125
     * @tc.name      testBundleField0125
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0125 begin');
      const flags: number = flagsForIndex(124);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0126
     * @tc.name      testBundleField0126
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0126 begin');
      const flags: number = flagsForIndex(125);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0127
     * @tc.name      testBundleField0127
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0127 begin');
      const flags: number = flagsForIndex(126);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0128
     * @tc.name      testBundleField0128
     * @tc.desc      Verify bundleField with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0128 begin');
      const flags: number = flagsForIndex(127);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_APPLICATION)) {
        expect(info.appInfo !== undefined).assertTrue();
        expect(info.appInfo.name).assertEqual(info.name);
        expect(info.appInfo.uid).assertLarger(0);
        expect(info.appInfo.accessTokenId).assertLarger(0);
        expect(info.appInfo.enabled).assertTrue();
        expect(info.appInfo.codePath.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0128 end');
    })

  })
}
