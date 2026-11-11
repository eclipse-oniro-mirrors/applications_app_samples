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
const TAG: string = '[Sample_CommonProblem_BundleFieldAdvanced]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFieldAdvancedTest() {
  describe('bundleFieldAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0129
     * @tc.name      testBundleField0129
     * @tc.desc      Verify bundleField with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0129 begin');
      const flags: number = flagsForIndex(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0130
     * @tc.name      testBundleField0130
     * @tc.desc      Verify bundleField with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0130 begin');
      const flags: number = flagsForIndex(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0131
     * @tc.name      testBundleField0131
     * @tc.desc      Verify bundleField with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0131 begin');
      const flags: number = flagsForIndex(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0132
     * @tc.name      testBundleField0132
     * @tc.desc      Verify bundleField with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0132 begin');
      const flags: number = flagsForIndex(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0133
     * @tc.name      testBundleField0133
     * @tc.desc      Verify bundleField with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0133 begin');
      const flags: number = flagsForIndex(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0134
     * @tc.name      testBundleField0134
     * @tc.desc      Verify bundleField with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0134 begin');
      const flags: number = flagsForIndex(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0135
     * @tc.name      testBundleField0135
     * @tc.desc      Verify bundleField with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0135 begin');
      const flags: number = flagsForIndex(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0136
     * @tc.name      testBundleField0136
     * @tc.desc      Verify bundleField with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0136 begin');
      const flags: number = flagsForIndex(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0137
     * @tc.name      testBundleField0137
     * @tc.desc      Verify bundleField with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0137 begin');
      const flags: number = flagsForIndex(136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0138
     * @tc.name      testBundleField0138
     * @tc.desc      Verify bundleField with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0138 begin');
      const flags: number = flagsForIndex(137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0139
     * @tc.name      testBundleField0139
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0139 begin');
      const flags: number = flagsForIndex(138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0140
     * @tc.name      testBundleField0140
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0140 begin');
      const flags: number = flagsForIndex(139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0141
     * @tc.name      testBundleField0141
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0141 begin');
      const flags: number = flagsForIndex(140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0142
     * @tc.name      testBundleField0142
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0142 begin');
      const flags: number = flagsForIndex(141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0143
     * @tc.name      testBundleField0143
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0143 begin');
      const flags: number = flagsForIndex(142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0144
     * @tc.name      testBundleField0144
     * @tc.desc      Verify bundleField with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0144 begin');
      const flags: number = flagsForIndex(143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0145
     * @tc.name      testBundleField0145
     * @tc.desc      Verify bundleField with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0145 begin');
      const flags: number = flagsForIndex(144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0146
     * @tc.name      testBundleField0146
     * @tc.desc      Verify bundleField with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0146 begin');
      const flags: number = flagsForIndex(145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0147
     * @tc.name      testBundleField0147
     * @tc.desc      Verify bundleField with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0147 begin');
      const flags: number = flagsForIndex(146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0148
     * @tc.name      testBundleField0148
     * @tc.desc      Verify bundleField with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0148 begin');
      const flags: number = flagsForIndex(147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0149
     * @tc.name      testBundleField0149
     * @tc.desc      Verify bundleField with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0149 begin');
      const flags: number = flagsForIndex(148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0150
     * @tc.name      testBundleField0150
     * @tc.desc      Verify bundleField with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0150 begin');
      const flags: number = flagsForIndex(149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0151
     * @tc.name      testBundleField0151
     * @tc.desc      Verify bundleField with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0151 begin');
      const flags: number = flagsForIndex(150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0152
     * @tc.name      testBundleField0152
     * @tc.desc      Verify bundleField with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0152 begin');
      const flags: number = flagsForIndex(151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0153
     * @tc.name      testBundleField0153
     * @tc.desc      Verify bundleField with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0153 begin');
      const flags: number = flagsForIndex(152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0154
     * @tc.name      testBundleField0154
     * @tc.desc      Verify bundleField with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0154 begin');
      const flags: number = flagsForIndex(153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0155
     * @tc.name      testBundleField0155
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0155 begin');
      const flags: number = flagsForIndex(154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0156
     * @tc.name      testBundleField0156
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0156 begin');
      const flags: number = flagsForIndex(155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0157
     * @tc.name      testBundleField0157
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0157 begin');
      const flags: number = flagsForIndex(156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0158
     * @tc.name      testBundleField0158
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0158 begin');
      const flags: number = flagsForIndex(157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0159
     * @tc.name      testBundleField0159
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0159 begin');
      const flags: number = flagsForIndex(158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0160
     * @tc.name      testBundleField0160
     * @tc.desc      Verify bundleField with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0160 begin');
      const flags: number = flagsForIndex(159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0161
     * @tc.name      testBundleField0161
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0161 begin');
      const flags: number = flagsForIndex(160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0162
     * @tc.name      testBundleField0162
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0162 begin');
      const flags: number = flagsForIndex(161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0163
     * @tc.name      testBundleField0163
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0163 begin');
      const flags: number = flagsForIndex(162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0164
     * @tc.name      testBundleField0164
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0164 begin');
      const flags: number = flagsForIndex(163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0165
     * @tc.name      testBundleField0165
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0165 begin');
      const flags: number = flagsForIndex(164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0166
     * @tc.name      testBundleField0166
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0166 begin');
      const flags: number = flagsForIndex(165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0167
     * @tc.name      testBundleField0167
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0167 begin');
      const flags: number = flagsForIndex(166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0168
     * @tc.name      testBundleField0168
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0168 begin');
      const flags: number = flagsForIndex(167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0169
     * @tc.name      testBundleField0169
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0169 begin');
      const flags: number = flagsForIndex(168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0170
     * @tc.name      testBundleField0170
     * @tc.desc      Verify bundleField with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0170 begin');
      const flags: number = flagsForIndex(169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0171
     * @tc.name      testBundleField0171
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0171 begin');
      const flags: number = flagsForIndex(170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0172
     * @tc.name      testBundleField0172
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0172 begin');
      const flags: number = flagsForIndex(171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0173
     * @tc.name      testBundleField0173
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0173 begin');
      const flags: number = flagsForIndex(172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0174
     * @tc.name      testBundleField0174
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0174 begin');
      const flags: number = flagsForIndex(173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0175
     * @tc.name      testBundleField0175
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0175 begin');
      const flags: number = flagsForIndex(174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0176
     * @tc.name      testBundleField0176
     * @tc.desc      Verify bundleField with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0176 begin');
      const flags: number = flagsForIndex(175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0177
     * @tc.name      testBundleField0177
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0177 begin');
      const flags: number = flagsForIndex(176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0178
     * @tc.name      testBundleField0178
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0178 begin');
      const flags: number = flagsForIndex(177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0179
     * @tc.name      testBundleField0179
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0179 begin');
      const flags: number = flagsForIndex(178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0180
     * @tc.name      testBundleField0180
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0180 begin');
      const flags: number = flagsForIndex(179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0181
     * @tc.name      testBundleField0181
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0181 begin');
      const flags: number = flagsForIndex(180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0182
     * @tc.name      testBundleField0182
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0182 begin');
      const flags: number = flagsForIndex(181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0183
     * @tc.name      testBundleField0183
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0183 begin');
      const flags: number = flagsForIndex(182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0184
     * @tc.name      testBundleField0184
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0184 begin');
      const flags: number = flagsForIndex(183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0185
     * @tc.name      testBundleField0185
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0185 begin');
      const flags: number = flagsForIndex(184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0186
     * @tc.name      testBundleField0186
     * @tc.desc      Verify bundleField with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0186 begin');
      const flags: number = flagsForIndex(185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0187
     * @tc.name      testBundleField0187
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0187 begin');
      const flags: number = flagsForIndex(186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0188
     * @tc.name      testBundleField0188
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0188 begin');
      const flags: number = flagsForIndex(187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0189
     * @tc.name      testBundleField0189
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0189 begin');
      const flags: number = flagsForIndex(188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0190
     * @tc.name      testBundleField0190
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0190 begin');
      const flags: number = flagsForIndex(189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0191
     * @tc.name      testBundleField0191
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0191 begin');
      const flags: number = flagsForIndex(190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0192
     * @tc.name      testBundleField0192
     * @tc.desc      Verify bundleField with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0192 begin');
      const flags: number = flagsForIndex(191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0192 end');
    })

  })
}
