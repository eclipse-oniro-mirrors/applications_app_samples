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
const TAG: string = '[Sample_CommonProblem_BundleAppIdExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdExtendedTest() {
  describe('bundleAppIdExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0065
     * @tc.name      testAppId0065
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0065 begin');
      const flags: number = flagsForIndex(64);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0066
     * @tc.name      testAppId0066
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0066 begin');
      const flags: number = flagsForIndex(65);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0067
     * @tc.name      testAppId0067
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0067 begin');
      const flags: number = flagsForIndex(66);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0068
     * @tc.name      testAppId0068
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0068 begin');
      const flags: number = flagsForIndex(67);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0069
     * @tc.name      testAppId0069
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0069 begin');
      const flags: number = flagsForIndex(68);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0070
     * @tc.name      testAppId0070
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0070 begin');
      const flags: number = flagsForIndex(69);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0071
     * @tc.name      testAppId0071
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0071 begin');
      const flags: number = flagsForIndex(70);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0072
     * @tc.name      testAppId0072
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0072 begin');
      const flags: number = flagsForIndex(71);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0073
     * @tc.name      testAppId0073
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0073 begin');
      const flags: number = flagsForIndex(72);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0074
     * @tc.name      testAppId0074
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0074 begin');
      const flags: number = flagsForIndex(73);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0075
     * @tc.name      testAppId0075
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0075 begin');
      const flags: number = flagsForIndex(74);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0076
     * @tc.name      testAppId0076
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0076 begin');
      const flags: number = flagsForIndex(75);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0077
     * @tc.name      testAppId0077
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0077 begin');
      const flags: number = flagsForIndex(76);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0078
     * @tc.name      testAppId0078
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0078 begin');
      const flags: number = flagsForIndex(77);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0079
     * @tc.name      testAppId0079
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0079 begin');
      const flags: number = flagsForIndex(78);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0080
     * @tc.name      testAppId0080
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0080 begin');
      const flags: number = flagsForIndex(79);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0081
     * @tc.name      testAppId0081
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0081 begin');
      const flags: number = flagsForIndex(80);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0082
     * @tc.name      testAppId0082
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0082 begin');
      const flags: number = flagsForIndex(81);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0083
     * @tc.name      testAppId0083
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0083 begin');
      const flags: number = flagsForIndex(82);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0084
     * @tc.name      testAppId0084
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0084 begin');
      const flags: number = flagsForIndex(83);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0085
     * @tc.name      testAppId0085
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0085 begin');
      const flags: number = flagsForIndex(84);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0086
     * @tc.name      testAppId0086
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0086 begin');
      const flags: number = flagsForIndex(85);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0087
     * @tc.name      testAppId0087
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0087 begin');
      const flags: number = flagsForIndex(86);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0088
     * @tc.name      testAppId0088
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0088 begin');
      const flags: number = flagsForIndex(87);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0089
     * @tc.name      testAppId0089
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0089 begin');
      const flags: number = flagsForIndex(88);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0090
     * @tc.name      testAppId0090
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0090 begin');
      const flags: number = flagsForIndex(89);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0091
     * @tc.name      testAppId0091
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0091 begin');
      const flags: number = flagsForIndex(90);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0092
     * @tc.name      testAppId0092
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0092 begin');
      const flags: number = flagsForIndex(91);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0093
     * @tc.name      testAppId0093
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0093 begin');
      const flags: number = flagsForIndex(92);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0094
     * @tc.name      testAppId0094
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0094 begin');
      const flags: number = flagsForIndex(93);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0095
     * @tc.name      testAppId0095
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0095 begin');
      const flags: number = flagsForIndex(94);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0096
     * @tc.name      testAppId0096
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0096 begin');
      const flags: number = flagsForIndex(95);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0097
     * @tc.name      testAppId0097
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0097 begin');
      const flags: number = flagsForIndex(96);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0098
     * @tc.name      testAppId0098
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0098 begin');
      const flags: number = flagsForIndex(97);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0099
     * @tc.name      testAppId0099
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0099 begin');
      const flags: number = flagsForIndex(98);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0100
     * @tc.name      testAppId0100
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0100 begin');
      const flags: number = flagsForIndex(99);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0101
     * @tc.name      testAppId0101
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0101 begin');
      const flags: number = flagsForIndex(100);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0102
     * @tc.name      testAppId0102
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0102 begin');
      const flags: number = flagsForIndex(101);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0103
     * @tc.name      testAppId0103
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0103 begin');
      const flags: number = flagsForIndex(102);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0104
     * @tc.name      testAppId0104
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0104 begin');
      const flags: number = flagsForIndex(103);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0105
     * @tc.name      testAppId0105
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0105 begin');
      const flags: number = flagsForIndex(104);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0106
     * @tc.name      testAppId0106
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0106 begin');
      const flags: number = flagsForIndex(105);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0107
     * @tc.name      testAppId0107
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0107 begin');
      const flags: number = flagsForIndex(106);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0108
     * @tc.name      testAppId0108
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0108 begin');
      const flags: number = flagsForIndex(107);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0109
     * @tc.name      testAppId0109
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0109 begin');
      const flags: number = flagsForIndex(108);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0110
     * @tc.name      testAppId0110
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0110 begin');
      const flags: number = flagsForIndex(109);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0111
     * @tc.name      testAppId0111
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0111 begin');
      const flags: number = flagsForIndex(110);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0112
     * @tc.name      testAppId0112
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0112 begin');
      const flags: number = flagsForIndex(111);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0113
     * @tc.name      testAppId0113
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0113 begin');
      const flags: number = flagsForIndex(112);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0114
     * @tc.name      testAppId0114
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0114 begin');
      const flags: number = flagsForIndex(113);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0115
     * @tc.name      testAppId0115
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0115 begin');
      const flags: number = flagsForIndex(114);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0116
     * @tc.name      testAppId0116
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0116 begin');
      const flags: number = flagsForIndex(115);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0117
     * @tc.name      testAppId0117
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0117 begin');
      const flags: number = flagsForIndex(116);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0118
     * @tc.name      testAppId0118
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0118 begin');
      const flags: number = flagsForIndex(117);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0119
     * @tc.name      testAppId0119
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0119 begin');
      const flags: number = flagsForIndex(118);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0120
     * @tc.name      testAppId0120
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0120 begin');
      const flags: number = flagsForIndex(119);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0121
     * @tc.name      testAppId0121
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0121 begin');
      const flags: number = flagsForIndex(120);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0122
     * @tc.name      testAppId0122
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0122 begin');
      const flags: number = flagsForIndex(121);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0123
     * @tc.name      testAppId0123
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0123 begin');
      const flags: number = flagsForIndex(122);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0124
     * @tc.name      testAppId0124
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0124 begin');
      const flags: number = flagsForIndex(123);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0125
     * @tc.name      testAppId0125
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0125 begin');
      const flags: number = flagsForIndex(124);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0126
     * @tc.name      testAppId0126
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0126 begin');
      const flags: number = flagsForIndex(125);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0127
     * @tc.name      testAppId0127
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0127 begin');
      const flags: number = flagsForIndex(126);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0128
     * @tc.name      testAppId0128
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0128 begin');
      const flags: number = flagsForIndex(127);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0128 end');
    })

  })
}
