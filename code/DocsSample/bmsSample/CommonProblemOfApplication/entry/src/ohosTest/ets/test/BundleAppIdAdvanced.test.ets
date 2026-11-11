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
const TAG: string = '[Sample_CommonProblem_BundleAppIdAdvanced]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdAdvancedTest() {
  describe('bundleAppIdAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0129
     * @tc.name      testAppId0129
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0129 begin');
      const flags: number = flagsForIndex(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0130
     * @tc.name      testAppId0130
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0130 begin');
      const flags: number = flagsForIndex(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0131
     * @tc.name      testAppId0131
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0131 begin');
      const flags: number = flagsForIndex(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0132
     * @tc.name      testAppId0132
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0132 begin');
      const flags: number = flagsForIndex(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0133
     * @tc.name      testAppId0133
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0133 begin');
      const flags: number = flagsForIndex(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0134
     * @tc.name      testAppId0134
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0134 begin');
      const flags: number = flagsForIndex(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0135
     * @tc.name      testAppId0135
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0135 begin');
      const flags: number = flagsForIndex(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0136
     * @tc.name      testAppId0136
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0136 begin');
      const flags: number = flagsForIndex(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0137
     * @tc.name      testAppId0137
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0137 begin');
      const flags: number = flagsForIndex(136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0138
     * @tc.name      testAppId0138
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0138 begin');
      const flags: number = flagsForIndex(137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0139
     * @tc.name      testAppId0139
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0139 begin');
      const flags: number = flagsForIndex(138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0140
     * @tc.name      testAppId0140
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0140 begin');
      const flags: number = flagsForIndex(139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0141
     * @tc.name      testAppId0141
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0141 begin');
      const flags: number = flagsForIndex(140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0142
     * @tc.name      testAppId0142
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0142 begin');
      const flags: number = flagsForIndex(141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0143
     * @tc.name      testAppId0143
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0143 begin');
      const flags: number = flagsForIndex(142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0144
     * @tc.name      testAppId0144
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0144 begin');
      const flags: number = flagsForIndex(143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0145
     * @tc.name      testAppId0145
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0145 begin');
      const flags: number = flagsForIndex(144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0146
     * @tc.name      testAppId0146
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0146 begin');
      const flags: number = flagsForIndex(145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0147
     * @tc.name      testAppId0147
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0147 begin');
      const flags: number = flagsForIndex(146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0148
     * @tc.name      testAppId0148
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0148 begin');
      const flags: number = flagsForIndex(147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0149
     * @tc.name      testAppId0149
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0149 begin');
      const flags: number = flagsForIndex(148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0150
     * @tc.name      testAppId0150
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0150 begin');
      const flags: number = flagsForIndex(149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0151
     * @tc.name      testAppId0151
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0151 begin');
      const flags: number = flagsForIndex(150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0152
     * @tc.name      testAppId0152
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0152 begin');
      const flags: number = flagsForIndex(151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0153
     * @tc.name      testAppId0153
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0153 begin');
      const flags: number = flagsForIndex(152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0154
     * @tc.name      testAppId0154
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0154 begin');
      const flags: number = flagsForIndex(153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0155
     * @tc.name      testAppId0155
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0155 begin');
      const flags: number = flagsForIndex(154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0156
     * @tc.name      testAppId0156
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0156 begin');
      const flags: number = flagsForIndex(155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0157
     * @tc.name      testAppId0157
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0157 begin');
      const flags: number = flagsForIndex(156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0158
     * @tc.name      testAppId0158
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0158 begin');
      const flags: number = flagsForIndex(157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0159
     * @tc.name      testAppId0159
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0159 begin');
      const flags: number = flagsForIndex(158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0160
     * @tc.name      testAppId0160
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0160 begin');
      const flags: number = flagsForIndex(159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0161
     * @tc.name      testAppId0161
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0161 begin');
      const flags: number = flagsForIndex(160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0162
     * @tc.name      testAppId0162
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0162 begin');
      const flags: number = flagsForIndex(161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0163
     * @tc.name      testAppId0163
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0163 begin');
      const flags: number = flagsForIndex(162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0164
     * @tc.name      testAppId0164
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0164 begin');
      const flags: number = flagsForIndex(163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0165
     * @tc.name      testAppId0165
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0165 begin');
      const flags: number = flagsForIndex(164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0166
     * @tc.name      testAppId0166
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0166 begin');
      const flags: number = flagsForIndex(165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0167
     * @tc.name      testAppId0167
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0167 begin');
      const flags: number = flagsForIndex(166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0168
     * @tc.name      testAppId0168
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0168 begin');
      const flags: number = flagsForIndex(167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0169
     * @tc.name      testAppId0169
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0169 begin');
      const flags: number = flagsForIndex(168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0170
     * @tc.name      testAppId0170
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0170 begin');
      const flags: number = flagsForIndex(169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0171
     * @tc.name      testAppId0171
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0171 begin');
      const flags: number = flagsForIndex(170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0172
     * @tc.name      testAppId0172
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0172 begin');
      const flags: number = flagsForIndex(171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0173
     * @tc.name      testAppId0173
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0173 begin');
      const flags: number = flagsForIndex(172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0174
     * @tc.name      testAppId0174
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0174 begin');
      const flags: number = flagsForIndex(173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0175
     * @tc.name      testAppId0175
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0175 begin');
      const flags: number = flagsForIndex(174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0176
     * @tc.name      testAppId0176
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0176 begin');
      const flags: number = flagsForIndex(175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0177
     * @tc.name      testAppId0177
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0177 begin');
      const flags: number = flagsForIndex(176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0178
     * @tc.name      testAppId0178
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0178 begin');
      const flags: number = flagsForIndex(177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0179
     * @tc.name      testAppId0179
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0179 begin');
      const flags: number = flagsForIndex(178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0180
     * @tc.name      testAppId0180
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0180 begin');
      const flags: number = flagsForIndex(179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0181
     * @tc.name      testAppId0181
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0181 begin');
      const flags: number = flagsForIndex(180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0182
     * @tc.name      testAppId0182
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0182 begin');
      const flags: number = flagsForIndex(181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0183
     * @tc.name      testAppId0183
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0183 begin');
      const flags: number = flagsForIndex(182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0184
     * @tc.name      testAppId0184
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0184 begin');
      const flags: number = flagsForIndex(183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0185
     * @tc.name      testAppId0185
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0185 begin');
      const flags: number = flagsForIndex(184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0186
     * @tc.name      testAppId0186
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0186 begin');
      const flags: number = flagsForIndex(185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0187
     * @tc.name      testAppId0187
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0187 begin');
      const flags: number = flagsForIndex(186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0188
     * @tc.name      testAppId0188
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0188 begin');
      const flags: number = flagsForIndex(187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0189
     * @tc.name      testAppId0189
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0189 begin');
      const flags: number = flagsForIndex(188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0190
     * @tc.name      testAppId0190
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0190 begin');
      const flags: number = flagsForIndex(189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0191
     * @tc.name      testAppId0191
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0191 begin');
      const flags: number = flagsForIndex(190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0192
     * @tc.name      testAppId0192
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0192 begin');
      const flags: number = flagsForIndex(191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0192 end');
    })

  })
}
