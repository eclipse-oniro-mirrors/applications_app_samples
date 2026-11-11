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
const TAG: string = '[Sample_CommonProblem_BundleFieldTail]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleFieldTailTest() {
  describe('bundleFieldTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0193
     * @tc.name      testBundleField0193
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0193 begin');
      const flags: number = flagsForIndex(192);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0194
     * @tc.name      testBundleField0194
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0194 begin');
      const flags: number = flagsForIndex(193);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0195
     * @tc.name      testBundleField0195
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0195 begin');
      const flags: number = flagsForIndex(194);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0196
     * @tc.name      testBundleField0196
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0196 begin');
      const flags: number = flagsForIndex(195);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0197
     * @tc.name      testBundleField0197
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0197 begin');
      const flags: number = flagsForIndex(196);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0198
     * @tc.name      testBundleField0198
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0198 begin');
      const flags: number = flagsForIndex(197);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0199
     * @tc.name      testBundleField0199
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0199 begin');
      const flags: number = flagsForIndex(198);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0200
     * @tc.name      testBundleField0200
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0200 begin');
      const flags: number = flagsForIndex(199);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0201
     * @tc.name      testBundleField0201
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0201 begin');
      const flags: number = flagsForIndex(200);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0202
     * @tc.name      testBundleField0202
     * @tc.desc      Verify bundleField with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0202 begin');
      const flags: number = flagsForIndex(201);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0203
     * @tc.name      testBundleField0203
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0203 begin');
      const flags: number = flagsForIndex(202);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0204
     * @tc.name      testBundleField0204
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0204 begin');
      const flags: number = flagsForIndex(203);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0205
     * @tc.name      testBundleField0205
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0205 begin');
      const flags: number = flagsForIndex(204);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0206
     * @tc.name      testBundleField0206
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0206 begin');
      const flags: number = flagsForIndex(205);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0207
     * @tc.name      testBundleField0207
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0207 begin');
      const flags: number = flagsForIndex(206);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0208
     * @tc.name      testBundleField0208
     * @tc.desc      Verify bundleField with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0208 begin');
      const flags: number = flagsForIndex(207);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0209
     * @tc.name      testBundleField0209
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0209 begin');
      const flags: number = flagsForIndex(208);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0210
     * @tc.name      testBundleField0210
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0210 begin');
      const flags: number = flagsForIndex(209);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0211
     * @tc.name      testBundleField0211
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0211 begin');
      const flags: number = flagsForIndex(210);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0212
     * @tc.name      testBundleField0212
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0212 begin');
      const flags: number = flagsForIndex(211);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0213
     * @tc.name      testBundleField0213
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0213 begin');
      const flags: number = flagsForIndex(212);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0214
     * @tc.name      testBundleField0214
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0214 begin');
      const flags: number = flagsForIndex(213);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0215
     * @tc.name      testBundleField0215
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0215 begin');
      const flags: number = flagsForIndex(214);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0216
     * @tc.name      testBundleField0216
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0216 begin');
      const flags: number = flagsForIndex(215);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0217
     * @tc.name      testBundleField0217
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0217 begin');
      const flags: number = flagsForIndex(216);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0218
     * @tc.name      testBundleField0218
     * @tc.desc      Verify bundleField with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0218 begin');
      const flags: number = flagsForIndex(217);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0219
     * @tc.name      testBundleField0219
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0219 begin');
      const flags: number = flagsForIndex(218);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0220
     * @tc.name      testBundleField0220
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0220 begin');
      const flags: number = flagsForIndex(219);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0221
     * @tc.name      testBundleField0221
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0221 begin');
      const flags: number = flagsForIndex(220);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0222
     * @tc.name      testBundleField0222
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0222 begin');
      const flags: number = flagsForIndex(221);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0223
     * @tc.name      testBundleField0223
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0223 begin');
      const flags: number = flagsForIndex(222);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0224
     * @tc.name      testBundleField0224
     * @tc.desc      Verify bundleField with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0224 begin');
      const flags: number = flagsForIndex(223);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0225
     * @tc.name      testBundleField0225
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0225 begin');
      const flags: number = flagsForIndex(224);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0226
     * @tc.name      testBundleField0226
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0226 begin');
      const flags: number = flagsForIndex(225);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0227
     * @tc.name      testBundleField0227
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0227 begin');
      const flags: number = flagsForIndex(226);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0228
     * @tc.name      testBundleField0228
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0228 begin');
      const flags: number = flagsForIndex(227);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0229
     * @tc.name      testBundleField0229
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0229 begin');
      const flags: number = flagsForIndex(228);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0230
     * @tc.name      testBundleField0230
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0230 begin');
      const flags: number = flagsForIndex(229);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0231
     * @tc.name      testBundleField0231
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0231 begin');
      const flags: number = flagsForIndex(230);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0232
     * @tc.name      testBundleField0232
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0232 begin');
      const flags: number = flagsForIndex(231);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0233
     * @tc.name      testBundleField0233
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0233 begin');
      const flags: number = flagsForIndex(232);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0234
     * @tc.name      testBundleField0234
     * @tc.desc      Verify bundleField with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0234 begin');
      const flags: number = flagsForIndex(233);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0235
     * @tc.name      testBundleField0235
     * @tc.desc      Verify bundleField with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0235 begin');
      const flags: number = flagsForIndex(234);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0236
     * @tc.name      testBundleField0236
     * @tc.desc      Verify bundleField with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0236 begin');
      const flags: number = flagsForIndex(235);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0237
     * @tc.name      testBundleField0237
     * @tc.desc      Verify bundleField with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0237 begin');
      const flags: number = flagsForIndex(236);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0238
     * @tc.name      testBundleField0238
     * @tc.desc      Verify bundleField with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0238 begin');
      const flags: number = flagsForIndex(237);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0239
     * @tc.name      testBundleField0239
     * @tc.desc      Verify bundleField with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0239 begin');
      const flags: number = flagsForIndex(238);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0240
     * @tc.name      testBundleField0240
     * @tc.desc      Verify bundleField with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0240 begin');
      const flags: number = flagsForIndex(239);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0241
     * @tc.name      testBundleField0241
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0241 begin');
      const flags: number = flagsForIndex(240);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0242
     * @tc.name      testBundleField0242
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0242 begin');
      const flags: number = flagsForIndex(241);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0243
     * @tc.name      testBundleField0243
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0243 begin');
      const flags: number = flagsForIndex(242);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0244
     * @tc.name      testBundleField0244
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0244 begin');
      const flags: number = flagsForIndex(243);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0245
     * @tc.name      testBundleField0245
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0245 begin');
      const flags: number = flagsForIndex(244);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0246
     * @tc.name      testBundleField0246
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0246 begin');
      const flags: number = flagsForIndex(245);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0247
     * @tc.name      testBundleField0247
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0247 begin');
      const flags: number = flagsForIndex(246);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0248
     * @tc.name      testBundleField0248
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0248 begin');
      const flags: number = flagsForIndex(247);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0249
     * @tc.name      testBundleField0249
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0249 begin');
      const flags: number = flagsForIndex(248);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0250
     * @tc.name      testBundleField0250
     * @tc.desc      Verify bundleField with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0250 begin');
      const flags: number = flagsForIndex(249);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0251
     * @tc.name      testBundleField0251
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0251 begin');
      const flags: number = flagsForIndex(250);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0252
     * @tc.name      testBundleField0252
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0252 begin');
      const flags: number = flagsForIndex(251);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0253
     * @tc.name      testBundleField0253
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0253 begin');
      const flags: number = flagsForIndex(252);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0254
     * @tc.name      testBundleField0254
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0254 begin');
      const flags: number = flagsForIndex(253);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0255
     * @tc.name      testBundleField0255
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0255 begin');
      const flags: number = flagsForIndex(254);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_FIELDS_0256
     * @tc.name      testBundleField0256
     * @tc.desc      Verify bundleField with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleField0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0256 begin');
      const flags: number = flagsForIndex(255);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleField0256 end');
    })

  })
}
