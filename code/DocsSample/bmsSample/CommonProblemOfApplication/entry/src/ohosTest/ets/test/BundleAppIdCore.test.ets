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
const TAG: string = '[Sample_CommonProblem_BundleAppIdCore]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdCoreTest() {
  describe('bundleAppIdCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0001
     * @tc.name      testAppId0001
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0001 begin');
      const flags: number = flagsForIndex(0);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0002
     * @tc.name      testAppId0002
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0002 begin');
      const flags: number = flagsForIndex(1);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0003
     * @tc.name      testAppId0003
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0003 begin');
      const flags: number = flagsForIndex(2);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0004
     * @tc.name      testAppId0004
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0004 begin');
      const flags: number = flagsForIndex(3);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0005
     * @tc.name      testAppId0005
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0005 begin');
      const flags: number = flagsForIndex(4);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0006
     * @tc.name      testAppId0006
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0006 begin');
      const flags: number = flagsForIndex(5);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0007
     * @tc.name      testAppId0007
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0007 begin');
      const flags: number = flagsForIndex(6);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0008
     * @tc.name      testAppId0008
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0008 begin');
      const flags: number = flagsForIndex(7);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0009
     * @tc.name      testAppId0009
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0009 begin');
      const flags: number = flagsForIndex(8);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0010
     * @tc.name      testAppId0010
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0010 begin');
      const flags: number = flagsForIndex(9);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0011
     * @tc.name      testAppId0011
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0011 begin');
      const flags: number = flagsForIndex(10);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0012
     * @tc.name      testAppId0012
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0012 begin');
      const flags: number = flagsForIndex(11);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0013
     * @tc.name      testAppId0013
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0013 begin');
      const flags: number = flagsForIndex(12);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0014
     * @tc.name      testAppId0014
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0014 begin');
      const flags: number = flagsForIndex(13);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0015
     * @tc.name      testAppId0015
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0015 begin');
      const flags: number = flagsForIndex(14);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0016
     * @tc.name      testAppId0016
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0016 begin');
      const flags: number = flagsForIndex(15);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0017
     * @tc.name      testAppId0017
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0017 begin');
      const flags: number = flagsForIndex(16);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0018
     * @tc.name      testAppId0018
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0018 begin');
      const flags: number = flagsForIndex(17);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0019
     * @tc.name      testAppId0019
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0019 begin');
      const flags: number = flagsForIndex(18);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0020
     * @tc.name      testAppId0020
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0020 begin');
      const flags: number = flagsForIndex(19);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0021
     * @tc.name      testAppId0021
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0021 begin');
      const flags: number = flagsForIndex(20);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0022
     * @tc.name      testAppId0022
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0022 begin');
      const flags: number = flagsForIndex(21);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0023
     * @tc.name      testAppId0023
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0023 begin');
      const flags: number = flagsForIndex(22);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0024
     * @tc.name      testAppId0024
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0024 begin');
      const flags: number = flagsForIndex(23);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0025
     * @tc.name      testAppId0025
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0025 begin');
      const flags: number = flagsForIndex(24);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0026
     * @tc.name      testAppId0026
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0026 begin');
      const flags: number = flagsForIndex(25);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0027
     * @tc.name      testAppId0027
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0027 begin');
      const flags: number = flagsForIndex(26);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0028
     * @tc.name      testAppId0028
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0028 begin');
      const flags: number = flagsForIndex(27);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0029
     * @tc.name      testAppId0029
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0029 begin');
      const flags: number = flagsForIndex(28);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0030
     * @tc.name      testAppId0030
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0030 begin');
      const flags: number = flagsForIndex(29);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0031
     * @tc.name      testAppId0031
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0031 begin');
      const flags: number = flagsForIndex(30);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0032
     * @tc.name      testAppId0032
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0032 begin');
      const flags: number = flagsForIndex(31);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0033
     * @tc.name      testAppId0033
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0033 begin');
      const flags: number = flagsForIndex(32);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0034
     * @tc.name      testAppId0034
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0034 begin');
      const flags: number = flagsForIndex(33);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0035
     * @tc.name      testAppId0035
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0035 begin');
      const flags: number = flagsForIndex(34);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0036
     * @tc.name      testAppId0036
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0036 begin');
      const flags: number = flagsForIndex(35);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0037
     * @tc.name      testAppId0037
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0037 begin');
      const flags: number = flagsForIndex(36);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0038
     * @tc.name      testAppId0038
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0038 begin');
      const flags: number = flagsForIndex(37);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0039
     * @tc.name      testAppId0039
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0039 begin');
      const flags: number = flagsForIndex(38);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0040
     * @tc.name      testAppId0040
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0040 begin');
      const flags: number = flagsForIndex(39);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0041
     * @tc.name      testAppId0041
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0041 begin');
      const flags: number = flagsForIndex(40);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0042
     * @tc.name      testAppId0042
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0042 begin');
      const flags: number = flagsForIndex(41);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0043
     * @tc.name      testAppId0043
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0043 begin');
      const flags: number = flagsForIndex(42);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0044
     * @tc.name      testAppId0044
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0044 begin');
      const flags: number = flagsForIndex(43);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0045
     * @tc.name      testAppId0045
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0045 begin');
      const flags: number = flagsForIndex(44);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0046
     * @tc.name      testAppId0046
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0046 begin');
      const flags: number = flagsForIndex(45);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0047
     * @tc.name      testAppId0047
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0047 begin');
      const flags: number = flagsForIndex(46);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0048
     * @tc.name      testAppId0048
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0048 begin');
      const flags: number = flagsForIndex(47);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0049
     * @tc.name      testAppId0049
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0049 begin');
      const flags: number = flagsForIndex(48);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0050
     * @tc.name      testAppId0050
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0050 begin');
      const flags: number = flagsForIndex(49);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0051
     * @tc.name      testAppId0051
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0051 begin');
      const flags: number = flagsForIndex(50);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0052
     * @tc.name      testAppId0052
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0052 begin');
      const flags: number = flagsForIndex(51);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0053
     * @tc.name      testAppId0053
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0053 begin');
      const flags: number = flagsForIndex(52);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0054
     * @tc.name      testAppId0054
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0054 begin');
      const flags: number = flagsForIndex(53);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0055
     * @tc.name      testAppId0055
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0055 begin');
      const flags: number = flagsForIndex(54);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0056
     * @tc.name      testAppId0056
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0056 begin');
      const flags: number = flagsForIndex(55);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0057
     * @tc.name      testAppId0057
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0057 begin');
      const flags: number = flagsForIndex(56);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0058
     * @tc.name      testAppId0058
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0058 begin');
      const flags: number = flagsForIndex(57);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0059
     * @tc.name      testAppId0059
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0059 begin');
      const flags: number = flagsForIndex(58);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0060
     * @tc.name      testAppId0060
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0060 begin');
      const flags: number = flagsForIndex(59);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0061
     * @tc.name      testAppId0061
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0061 begin');
      const flags: number = flagsForIndex(60);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0062
     * @tc.name      testAppId0062
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0062 begin');
      const flags: number = flagsForIndex(61);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0063
     * @tc.name      testAppId0063
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0063 begin');
      const flags: number = flagsForIndex(62);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0064
     * @tc.name      testAppId0064
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0064 begin');
      const flags: number = flagsForIndex(63);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appId: string = info.signatureInfo.appId;
        expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
        expect(appId.length).assertLarger(SELF_BUNDLE_NAME.length + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0064 end');
    })

  })
}
