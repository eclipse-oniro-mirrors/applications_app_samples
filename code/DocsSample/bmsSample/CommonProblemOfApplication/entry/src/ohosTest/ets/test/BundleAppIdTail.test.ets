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
const TAG: string = '[Sample_CommonProblem_BundleAppIdTail]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdTailTest() {
  describe('bundleAppIdTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0193
     * @tc.name      testAppId0193
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0193 begin');
      const flags: number = flagsForIndex(192);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0194
     * @tc.name      testAppId0194
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0194 begin');
      const flags: number = flagsForIndex(193);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0195
     * @tc.name      testAppId0195
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0195 begin');
      const flags: number = flagsForIndex(194);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0196
     * @tc.name      testAppId0196
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0196 begin');
      const flags: number = flagsForIndex(195);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0197
     * @tc.name      testAppId0197
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0197 begin');
      const flags: number = flagsForIndex(196);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0198
     * @tc.name      testAppId0198
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0198 begin');
      const flags: number = flagsForIndex(197);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0199
     * @tc.name      testAppId0199
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0199 begin');
      const flags: number = flagsForIndex(198);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0200
     * @tc.name      testAppId0200
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0200 begin');
      const flags: number = flagsForIndex(199);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0201
     * @tc.name      testAppId0201
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0201 begin');
      const flags: number = flagsForIndex(200);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0202
     * @tc.name      testAppId0202
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0202 begin');
      const flags: number = flagsForIndex(201);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0203
     * @tc.name      testAppId0203
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0203 begin');
      const flags: number = flagsForIndex(202);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0204
     * @tc.name      testAppId0204
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0204 begin');
      const flags: number = flagsForIndex(203);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0205
     * @tc.name      testAppId0205
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0205 begin');
      const flags: number = flagsForIndex(204);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0206
     * @tc.name      testAppId0206
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0206 begin');
      const flags: number = flagsForIndex(205);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0207
     * @tc.name      testAppId0207
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0207 begin');
      const flags: number = flagsForIndex(206);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0208
     * @tc.name      testAppId0208
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0208 begin');
      const flags: number = flagsForIndex(207);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0209
     * @tc.name      testAppId0209
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0209 begin');
      const flags: number = flagsForIndex(208);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0210
     * @tc.name      testAppId0210
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0210 begin');
      const flags: number = flagsForIndex(209);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0211
     * @tc.name      testAppId0211
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0211 begin');
      const flags: number = flagsForIndex(210);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0212
     * @tc.name      testAppId0212
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0212 begin');
      const flags: number = flagsForIndex(211);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0213
     * @tc.name      testAppId0213
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0213 begin');
      const flags: number = flagsForIndex(212);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0214
     * @tc.name      testAppId0214
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0214 begin');
      const flags: number = flagsForIndex(213);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0215
     * @tc.name      testAppId0215
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0215 begin');
      const flags: number = flagsForIndex(214);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0216
     * @tc.name      testAppId0216
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0216 begin');
      const flags: number = flagsForIndex(215);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0217
     * @tc.name      testAppId0217
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0217 begin');
      const flags: number = flagsForIndex(216);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0218
     * @tc.name      testAppId0218
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0218 begin');
      const flags: number = flagsForIndex(217);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0219
     * @tc.name      testAppId0219
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0219 begin');
      const flags: number = flagsForIndex(218);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0220
     * @tc.name      testAppId0220
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0220 begin');
      const flags: number = flagsForIndex(219);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0221
     * @tc.name      testAppId0221
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0221 begin');
      const flags: number = flagsForIndex(220);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0222
     * @tc.name      testAppId0222
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0222 begin');
      const flags: number = flagsForIndex(221);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0223
     * @tc.name      testAppId0223
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0223 begin');
      const flags: number = flagsForIndex(222);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0224
     * @tc.name      testAppId0224
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0224 begin');
      const flags: number = flagsForIndex(223);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0225
     * @tc.name      testAppId0225
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0225 begin');
      const flags: number = flagsForIndex(224);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0226
     * @tc.name      testAppId0226
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0226 begin');
      const flags: number = flagsForIndex(225);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0227
     * @tc.name      testAppId0227
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0227 begin');
      const flags: number = flagsForIndex(226);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0228
     * @tc.name      testAppId0228
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0228 begin');
      const flags: number = flagsForIndex(227);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0229
     * @tc.name      testAppId0229
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0229 begin');
      const flags: number = flagsForIndex(228);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0230
     * @tc.name      testAppId0230
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0230 begin');
      const flags: number = flagsForIndex(229);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0231
     * @tc.name      testAppId0231
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0231 begin');
      const flags: number = flagsForIndex(230);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0232
     * @tc.name      testAppId0232
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0232 begin');
      const flags: number = flagsForIndex(231);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0233
     * @tc.name      testAppId0233
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0233 begin');
      const flags: number = flagsForIndex(232);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0234
     * @tc.name      testAppId0234
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0234 begin');
      const flags: number = flagsForIndex(233);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0235
     * @tc.name      testAppId0235
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0235 begin');
      const flags: number = flagsForIndex(234);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0236
     * @tc.name      testAppId0236
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0236 begin');
      const flags: number = flagsForIndex(235);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0237
     * @tc.name      testAppId0237
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0237 begin');
      const flags: number = flagsForIndex(236);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0238
     * @tc.name      testAppId0238
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0238 begin');
      const flags: number = flagsForIndex(237);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0239
     * @tc.name      testAppId0239
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0239 begin');
      const flags: number = flagsForIndex(238);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0240
     * @tc.name      testAppId0240
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0240 begin');
      const flags: number = flagsForIndex(239);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0241
     * @tc.name      testAppId0241
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0241 begin');
      const flags: number = flagsForIndex(240);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0242
     * @tc.name      testAppId0242
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0242 begin');
      const flags: number = flagsForIndex(241);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0243
     * @tc.name      testAppId0243
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0243 begin');
      const flags: number = flagsForIndex(242);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0244
     * @tc.name      testAppId0244
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0244 begin');
      const flags: number = flagsForIndex(243);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0245
     * @tc.name      testAppId0245
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0245 begin');
      const flags: number = flagsForIndex(244);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0246
     * @tc.name      testAppId0246
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0246 begin');
      const flags: number = flagsForIndex(245);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0247
     * @tc.name      testAppId0247
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0247 begin');
      const flags: number = flagsForIndex(246);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0248
     * @tc.name      testAppId0248
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0248 begin');
      const flags: number = flagsForIndex(247);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0249
     * @tc.name      testAppId0249
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0249 begin');
      const flags: number = flagsForIndex(248);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0250
     * @tc.name      testAppId0250
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0250 begin');
      const flags: number = flagsForIndex(249);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0251
     * @tc.name      testAppId0251
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0251 begin');
      const flags: number = flagsForIndex(250);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0252
     * @tc.name      testAppId0252
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0252 begin');
      const flags: number = flagsForIndex(251);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0253
     * @tc.name      testAppId0253
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0253 begin');
      const flags: number = flagsForIndex(252);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0254
     * @tc.name      testAppId0254
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0254 begin');
      const flags: number = flagsForIndex(253);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0255
     * @tc.name      testAppId0255
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0255 begin');
      const flags: number = flagsForIndex(254);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPID_0256
     * @tc.name      testAppId0256
     * @tc.desc      Verify bundleAppId with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppId0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0256 begin');
      const flags: number = flagsForIndex(255);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppId0256 end');
    })

  })
}
