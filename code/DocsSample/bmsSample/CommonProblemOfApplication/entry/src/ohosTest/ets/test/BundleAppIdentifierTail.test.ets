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
const TAG: string = '[Sample_CommonProblem_BundleAppIdentifierTail]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdentifierTailTest() {
  describe('bundleAppIdentifierTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0193
     * @tc.name      testAppIdentifier0193
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0193 begin');
      const flags: number = flagsForIndex(192);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0194
     * @tc.name      testAppIdentifier0194
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0194 begin');
      const flags: number = flagsForIndex(193);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0195
     * @tc.name      testAppIdentifier0195
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0195 begin');
      const flags: number = flagsForIndex(194);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0196
     * @tc.name      testAppIdentifier0196
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0196 begin');
      const flags: number = flagsForIndex(195);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0197
     * @tc.name      testAppIdentifier0197
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0197 begin');
      const flags: number = flagsForIndex(196);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0198
     * @tc.name      testAppIdentifier0198
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0198 begin');
      const flags: number = flagsForIndex(197);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0199
     * @tc.name      testAppIdentifier0199
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0199 begin');
      const flags: number = flagsForIndex(198);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0200
     * @tc.name      testAppIdentifier0200
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0200 begin');
      const flags: number = flagsForIndex(199);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0201
     * @tc.name      testAppIdentifier0201
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0201 begin');
      const flags: number = flagsForIndex(200);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0202
     * @tc.name      testAppIdentifier0202
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0202 begin');
      const flags: number = flagsForIndex(201);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0203
     * @tc.name      testAppIdentifier0203
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0203 begin');
      const flags: number = flagsForIndex(202);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0204
     * @tc.name      testAppIdentifier0204
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0204 begin');
      const flags: number = flagsForIndex(203);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0205
     * @tc.name      testAppIdentifier0205
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0205 begin');
      const flags: number = flagsForIndex(204);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0206
     * @tc.name      testAppIdentifier0206
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0206 begin');
      const flags: number = flagsForIndex(205);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0207
     * @tc.name      testAppIdentifier0207
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0207 begin');
      const flags: number = flagsForIndex(206);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0208
     * @tc.name      testAppIdentifier0208
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0208 begin');
      const flags: number = flagsForIndex(207);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0209
     * @tc.name      testAppIdentifier0209
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0209 begin');
      const flags: number = flagsForIndex(208);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0210
     * @tc.name      testAppIdentifier0210
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0210 begin');
      const flags: number = flagsForIndex(209);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0211
     * @tc.name      testAppIdentifier0211
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0211 begin');
      const flags: number = flagsForIndex(210);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0212
     * @tc.name      testAppIdentifier0212
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0212 begin');
      const flags: number = flagsForIndex(211);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0213
     * @tc.name      testAppIdentifier0213
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0213 begin');
      const flags: number = flagsForIndex(212);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0214
     * @tc.name      testAppIdentifier0214
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0214 begin');
      const flags: number = flagsForIndex(213);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0215
     * @tc.name      testAppIdentifier0215
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0215 begin');
      const flags: number = flagsForIndex(214);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0216
     * @tc.name      testAppIdentifier0216
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0216 begin');
      const flags: number = flagsForIndex(215);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0217
     * @tc.name      testAppIdentifier0217
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0217 begin');
      const flags: number = flagsForIndex(216);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0218
     * @tc.name      testAppIdentifier0218
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0218 begin');
      const flags: number = flagsForIndex(217);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0219
     * @tc.name      testAppIdentifier0219
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0219 begin');
      const flags: number = flagsForIndex(218);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0220
     * @tc.name      testAppIdentifier0220
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0220 begin');
      const flags: number = flagsForIndex(219);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0221
     * @tc.name      testAppIdentifier0221
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0221 begin');
      const flags: number = flagsForIndex(220);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0222
     * @tc.name      testAppIdentifier0222
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0222 begin');
      const flags: number = flagsForIndex(221);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0223
     * @tc.name      testAppIdentifier0223
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0223 begin');
      const flags: number = flagsForIndex(222);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0224
     * @tc.name      testAppIdentifier0224
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0224 begin');
      const flags: number = flagsForIndex(223);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0225
     * @tc.name      testAppIdentifier0225
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0225 begin');
      const flags: number = flagsForIndex(224);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0226
     * @tc.name      testAppIdentifier0226
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0226 begin');
      const flags: number = flagsForIndex(225);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0227
     * @tc.name      testAppIdentifier0227
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0227 begin');
      const flags: number = flagsForIndex(226);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0228
     * @tc.name      testAppIdentifier0228
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0228 begin');
      const flags: number = flagsForIndex(227);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0229
     * @tc.name      testAppIdentifier0229
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0229 begin');
      const flags: number = flagsForIndex(228);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0230
     * @tc.name      testAppIdentifier0230
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0230 begin');
      const flags: number = flagsForIndex(229);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0231
     * @tc.name      testAppIdentifier0231
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0231 begin');
      const flags: number = flagsForIndex(230);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0232
     * @tc.name      testAppIdentifier0232
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0232 begin');
      const flags: number = flagsForIndex(231);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0233
     * @tc.name      testAppIdentifier0233
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0233 begin');
      const flags: number = flagsForIndex(232);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0234
     * @tc.name      testAppIdentifier0234
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0234 begin');
      const flags: number = flagsForIndex(233);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0235
     * @tc.name      testAppIdentifier0235
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0235 begin');
      const flags: number = flagsForIndex(234);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0236
     * @tc.name      testAppIdentifier0236
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0236 begin');
      const flags: number = flagsForIndex(235);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0237
     * @tc.name      testAppIdentifier0237
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0237 begin');
      const flags: number = flagsForIndex(236);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0238
     * @tc.name      testAppIdentifier0238
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0238 begin');
      const flags: number = flagsForIndex(237);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0239
     * @tc.name      testAppIdentifier0239
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0239 begin');
      const flags: number = flagsForIndex(238);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0240
     * @tc.name      testAppIdentifier0240
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0240 begin');
      const flags: number = flagsForIndex(239);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0241
     * @tc.name      testAppIdentifier0241
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0241 begin');
      const flags: number = flagsForIndex(240);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0242
     * @tc.name      testAppIdentifier0242
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0242 begin');
      const flags: number = flagsForIndex(241);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0243
     * @tc.name      testAppIdentifier0243
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0243 begin');
      const flags: number = flagsForIndex(242);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0244
     * @tc.name      testAppIdentifier0244
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0244 begin');
      const flags: number = flagsForIndex(243);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0245
     * @tc.name      testAppIdentifier0245
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0245 begin');
      const flags: number = flagsForIndex(244);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0246
     * @tc.name      testAppIdentifier0246
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0246 begin');
      const flags: number = flagsForIndex(245);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0247
     * @tc.name      testAppIdentifier0247
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0247 begin');
      const flags: number = flagsForIndex(246);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0248
     * @tc.name      testAppIdentifier0248
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0248 begin');
      const flags: number = flagsForIndex(247);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0249
     * @tc.name      testAppIdentifier0249
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0249 begin');
      const flags: number = flagsForIndex(248);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0250
     * @tc.name      testAppIdentifier0250
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0250 begin');
      const flags: number = flagsForIndex(249);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0251
     * @tc.name      testAppIdentifier0251
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0251 begin');
      const flags: number = flagsForIndex(250);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0252
     * @tc.name      testAppIdentifier0252
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0252 begin');
      const flags: number = flagsForIndex(251);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0253
     * @tc.name      testAppIdentifier0253
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0253 begin');
      const flags: number = flagsForIndex(252);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0254
     * @tc.name      testAppIdentifier0254
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0254 begin');
      const flags: number = flagsForIndex(253);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0255
     * @tc.name      testAppIdentifier0255
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0255 begin');
      const flags: number = flagsForIndex(254);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0256
     * @tc.name      testAppIdentifier0256
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0256 begin');
      const flags: number = flagsForIndex(255);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_SIGNATURE)) {
        expect(info.signatureInfo !== undefined).assertTrue();
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        expect(appIdentifier.indexOf(' ')).assertEqual(-1);
        expect(appIdentifier.indexOf('\n')).assertEqual(-1);
        expect(appIdentifier).assertEqual(appIdentifier.trim());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0256 end');
    })

  })
}
