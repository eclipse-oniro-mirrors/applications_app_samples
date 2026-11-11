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
const TAG: string = '[Sample_CommonProblem_BundleFieldCore]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFieldCoreTest() {
  describe('bundleFieldCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0001
     * @tc.name      testBundleField0001
     * @tc.desc      Verify bundleField with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0001 begin');
      const flags: number = flagsForIndex(0);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0002
     * @tc.name      testBundleField0002
     * @tc.desc      Verify bundleField with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0002 begin');
      const flags: number = flagsForIndex(1);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0003
     * @tc.name      testBundleField0003
     * @tc.desc      Verify bundleField with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0003 begin');
      const flags: number = flagsForIndex(2);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0004
     * @tc.name      testBundleField0004
     * @tc.desc      Verify bundleField with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0004 begin');
      const flags: number = flagsForIndex(3);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0005
     * @tc.name      testBundleField0005
     * @tc.desc      Verify bundleField with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0005 begin');
      const flags: number = flagsForIndex(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0006
     * @tc.name      testBundleField0006
     * @tc.desc      Verify bundleField with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0006 begin');
      const flags: number = flagsForIndex(5);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0007
     * @tc.name      testBundleField0007
     * @tc.desc      Verify bundleField with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0007 begin');
      const flags: number = flagsForIndex(6);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0008
     * @tc.name      testBundleField0008
     * @tc.desc      Verify bundleField with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0008 begin');
      const flags: number = flagsForIndex(7);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0009
     * @tc.name      testBundleField0009
     * @tc.desc      Verify bundleField with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0009 begin');
      const flags: number = flagsForIndex(8);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0010
     * @tc.name      testBundleField0010
     * @tc.desc      Verify bundleField with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0010 begin');
      const flags: number = flagsForIndex(9);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0011
     * @tc.name      testBundleField0011
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0011 begin');
      const flags: number = flagsForIndex(10);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0012
     * @tc.name      testBundleField0012
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0012 begin');
      const flags: number = flagsForIndex(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0013
     * @tc.name      testBundleField0013
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0013 begin');
      const flags: number = flagsForIndex(12);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0014
     * @tc.name      testBundleField0014
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0014 begin');
      const flags: number = flagsForIndex(13);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0015
     * @tc.name      testBundleField0015
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0015 begin');
      const flags: number = flagsForIndex(14);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0016
     * @tc.name      testBundleField0016
     * @tc.desc      Verify bundleField with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0016 begin');
      const flags: number = flagsForIndex(15);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0017
     * @tc.name      testBundleField0017
     * @tc.desc      Verify bundleField with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0017 begin');
      const flags: number = flagsForIndex(16);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0018
     * @tc.name      testBundleField0018
     * @tc.desc      Verify bundleField with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0018 begin');
      const flags: number = flagsForIndex(17);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0019
     * @tc.name      testBundleField0019
     * @tc.desc      Verify bundleField with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0019 begin');
      const flags: number = flagsForIndex(18);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0020
     * @tc.name      testBundleField0020
     * @tc.desc      Verify bundleField with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0020 begin');
      const flags: number = flagsForIndex(19);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0021
     * @tc.name      testBundleField0021
     * @tc.desc      Verify bundleField with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0021 begin');
      const flags: number = flagsForIndex(20);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0022
     * @tc.name      testBundleField0022
     * @tc.desc      Verify bundleField with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0022 begin');
      const flags: number = flagsForIndex(21);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0023
     * @tc.name      testBundleField0023
     * @tc.desc      Verify bundleField with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0023 begin');
      const flags: number = flagsForIndex(22);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0024
     * @tc.name      testBundleField0024
     * @tc.desc      Verify bundleField with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0024 begin');
      const flags: number = flagsForIndex(23);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0025
     * @tc.name      testBundleField0025
     * @tc.desc      Verify bundleField with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0025 begin');
      const flags: number = flagsForIndex(24);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0026
     * @tc.name      testBundleField0026
     * @tc.desc      Verify bundleField with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0026 begin');
      const flags: number = flagsForIndex(25);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0027
     * @tc.name      testBundleField0027
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0027 begin');
      const flags: number = flagsForIndex(26);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0028
     * @tc.name      testBundleField0028
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0028 begin');
      const flags: number = flagsForIndex(27);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0029
     * @tc.name      testBundleField0029
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0029 begin');
      const flags: number = flagsForIndex(28);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0030
     * @tc.name      testBundleField0030
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0030 begin');
      const flags: number = flagsForIndex(29);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0031
     * @tc.name      testBundleField0031
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0031 begin');
      const flags: number = flagsForIndex(30);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0032
     * @tc.name      testBundleField0032
     * @tc.desc      Verify bundleField with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0032 begin');
      const flags: number = flagsForIndex(31);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0033
     * @tc.name      testBundleField0033
     * @tc.desc      Verify bundleField with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0033 begin');
      const flags: number = flagsForIndex(32);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0034
     * @tc.name      testBundleField0034
     * @tc.desc      Verify bundleField with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0034 begin');
      const flags: number = flagsForIndex(33);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0035
     * @tc.name      testBundleField0035
     * @tc.desc      Verify bundleField with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0035 begin');
      const flags: number = flagsForIndex(34);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0036
     * @tc.name      testBundleField0036
     * @tc.desc      Verify bundleField with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0036 begin');
      const flags: number = flagsForIndex(35);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0037
     * @tc.name      testBundleField0037
     * @tc.desc      Verify bundleField with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0037 begin');
      const flags: number = flagsForIndex(36);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0038
     * @tc.name      testBundleField0038
     * @tc.desc      Verify bundleField with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0038 begin');
      const flags: number = flagsForIndex(37);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0039
     * @tc.name      testBundleField0039
     * @tc.desc      Verify bundleField with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0039 begin');
      const flags: number = flagsForIndex(38);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0040
     * @tc.name      testBundleField0040
     * @tc.desc      Verify bundleField with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0040 begin');
      const flags: number = flagsForIndex(39);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0041
     * @tc.name      testBundleField0041
     * @tc.desc      Verify bundleField with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0041 begin');
      const flags: number = flagsForIndex(40);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0042
     * @tc.name      testBundleField0042
     * @tc.desc      Verify bundleField with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0042 begin');
      const flags: number = flagsForIndex(41);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0043
     * @tc.name      testBundleField0043
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0043 begin');
      const flags: number = flagsForIndex(42);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0044
     * @tc.name      testBundleField0044
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0044 begin');
      const flags: number = flagsForIndex(43);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0045
     * @tc.name      testBundleField0045
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0045 begin');
      const flags: number = flagsForIndex(44);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0046
     * @tc.name      testBundleField0046
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0046 begin');
      const flags: number = flagsForIndex(45);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0047
     * @tc.name      testBundleField0047
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0047 begin');
      const flags: number = flagsForIndex(46);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0048
     * @tc.name      testBundleField0048
     * @tc.desc      Verify bundleField with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0048 begin');
      const flags: number = flagsForIndex(47);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0049
     * @tc.name      testBundleField0049
     * @tc.desc      Verify bundleField with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0049 begin');
      const flags: number = flagsForIndex(48);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0050
     * @tc.name      testBundleField0050
     * @tc.desc      Verify bundleField with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0050 begin');
      const flags: number = flagsForIndex(49);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0051
     * @tc.name      testBundleField0051
     * @tc.desc      Verify bundleField with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0051 begin');
      const flags: number = flagsForIndex(50);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0052
     * @tc.name      testBundleField0052
     * @tc.desc      Verify bundleField with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0052 begin');
      const flags: number = flagsForIndex(51);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0053
     * @tc.name      testBundleField0053
     * @tc.desc      Verify bundleField with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0053 begin');
      const flags: number = flagsForIndex(52);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0054
     * @tc.name      testBundleField0054
     * @tc.desc      Verify bundleField with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0054 begin');
      const flags: number = flagsForIndex(53);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0055
     * @tc.name      testBundleField0055
     * @tc.desc      Verify bundleField with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0055 begin');
      const flags: number = flagsForIndex(54);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0056
     * @tc.name      testBundleField0056
     * @tc.desc      Verify bundleField with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0056 begin');
      const flags: number = flagsForIndex(55);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0057
     * @tc.name      testBundleField0057
     * @tc.desc      Verify bundleField with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0057 begin');
      const flags: number = flagsForIndex(56);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0058
     * @tc.name      testBundleField0058
     * @tc.desc      Verify bundleField with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0058 begin');
      const flags: number = flagsForIndex(57);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0059
     * @tc.name      testBundleField0059
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0059 begin');
      const flags: number = flagsForIndex(58);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0060
     * @tc.name      testBundleField0060
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0060 begin');
      const flags: number = flagsForIndex(59);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0061
     * @tc.name      testBundleField0061
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0061 begin');
      const flags: number = flagsForIndex(60);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0062
     * @tc.name      testBundleField0062
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0062 begin');
      const flags: number = flagsForIndex(61);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0063
     * @tc.name      testBundleField0063
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0063 begin');
      const flags: number = flagsForIndex(62);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0064
     * @tc.name      testBundleField0064
     * @tc.desc      Verify bundleField with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0064 begin');
      const flags: number = flagsForIndex(63);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0064 end');
    })

  })
}
