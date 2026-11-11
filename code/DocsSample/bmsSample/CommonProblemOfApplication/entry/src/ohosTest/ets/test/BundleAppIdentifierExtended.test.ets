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
const TAG: string = '[Sample_CommonProblem_BundleAppIdentifierExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdentifierExtendedTest() {
  describe('bundleAppIdentifierExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0065
     * @tc.name      testAppIdentifier0065
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0065 begin');
      const flags: number = flagsForIndex(64);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0066
     * @tc.name      testAppIdentifier0066
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0066 begin');
      const flags: number = flagsForIndex(65);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0067
     * @tc.name      testAppIdentifier0067
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0067 begin');
      const flags: number = flagsForIndex(66);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0068
     * @tc.name      testAppIdentifier0068
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0068 begin');
      const flags: number = flagsForIndex(67);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0069
     * @tc.name      testAppIdentifier0069
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0069 begin');
      const flags: number = flagsForIndex(68);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0070
     * @tc.name      testAppIdentifier0070
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0070 begin');
      const flags: number = flagsForIndex(69);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0071
     * @tc.name      testAppIdentifier0071
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0071 begin');
      const flags: number = flagsForIndex(70);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0072
     * @tc.name      testAppIdentifier0072
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0072 begin');
      const flags: number = flagsForIndex(71);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0073
     * @tc.name      testAppIdentifier0073
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0073 begin');
      const flags: number = flagsForIndex(72);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0074
     * @tc.name      testAppIdentifier0074
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0074 begin');
      const flags: number = flagsForIndex(73);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0075
     * @tc.name      testAppIdentifier0075
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0075 begin');
      const flags: number = flagsForIndex(74);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0076
     * @tc.name      testAppIdentifier0076
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0076 begin');
      const flags: number = flagsForIndex(75);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0077
     * @tc.name      testAppIdentifier0077
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0077 begin');
      const flags: number = flagsForIndex(76);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0078
     * @tc.name      testAppIdentifier0078
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0078 begin');
      const flags: number = flagsForIndex(77);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0079
     * @tc.name      testAppIdentifier0079
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0079 begin');
      const flags: number = flagsForIndex(78);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0080
     * @tc.name      testAppIdentifier0080
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0080 begin');
      const flags: number = flagsForIndex(79);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0081
     * @tc.name      testAppIdentifier0081
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0081 begin');
      const flags: number = flagsForIndex(80);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0082
     * @tc.name      testAppIdentifier0082
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0082 begin');
      const flags: number = flagsForIndex(81);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0083
     * @tc.name      testAppIdentifier0083
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0083 begin');
      const flags: number = flagsForIndex(82);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0084
     * @tc.name      testAppIdentifier0084
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0084 begin');
      const flags: number = flagsForIndex(83);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0085
     * @tc.name      testAppIdentifier0085
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0085 begin');
      const flags: number = flagsForIndex(84);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0086
     * @tc.name      testAppIdentifier0086
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0086 begin');
      const flags: number = flagsForIndex(85);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0087
     * @tc.name      testAppIdentifier0087
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0087 begin');
      const flags: number = flagsForIndex(86);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0088
     * @tc.name      testAppIdentifier0088
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0088 begin');
      const flags: number = flagsForIndex(87);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0089
     * @tc.name      testAppIdentifier0089
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0089 begin');
      const flags: number = flagsForIndex(88);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0090
     * @tc.name      testAppIdentifier0090
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0090 begin');
      const flags: number = flagsForIndex(89);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0091
     * @tc.name      testAppIdentifier0091
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0091 begin');
      const flags: number = flagsForIndex(90);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0092
     * @tc.name      testAppIdentifier0092
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0092 begin');
      const flags: number = flagsForIndex(91);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0093
     * @tc.name      testAppIdentifier0093
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0093 begin');
      const flags: number = flagsForIndex(92);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0094
     * @tc.name      testAppIdentifier0094
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0094 begin');
      const flags: number = flagsForIndex(93);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0095
     * @tc.name      testAppIdentifier0095
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0095 begin');
      const flags: number = flagsForIndex(94);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0096
     * @tc.name      testAppIdentifier0096
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0096 begin');
      const flags: number = flagsForIndex(95);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0097
     * @tc.name      testAppIdentifier0097
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0097 begin');
      const flags: number = flagsForIndex(96);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0098
     * @tc.name      testAppIdentifier0098
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0098 begin');
      const flags: number = flagsForIndex(97);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0099
     * @tc.name      testAppIdentifier0099
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0099 begin');
      const flags: number = flagsForIndex(98);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0100
     * @tc.name      testAppIdentifier0100
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0100 begin');
      const flags: number = flagsForIndex(99);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0101
     * @tc.name      testAppIdentifier0101
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0101 begin');
      const flags: number = flagsForIndex(100);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0102
     * @tc.name      testAppIdentifier0102
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0102 begin');
      const flags: number = flagsForIndex(101);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0103
     * @tc.name      testAppIdentifier0103
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0103 begin');
      const flags: number = flagsForIndex(102);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0104
     * @tc.name      testAppIdentifier0104
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0104 begin');
      const flags: number = flagsForIndex(103);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0105
     * @tc.name      testAppIdentifier0105
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0105 begin');
      const flags: number = flagsForIndex(104);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0106
     * @tc.name      testAppIdentifier0106
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0106 begin');
      const flags: number = flagsForIndex(105);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0107
     * @tc.name      testAppIdentifier0107
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0107 begin');
      const flags: number = flagsForIndex(106);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0108
     * @tc.name      testAppIdentifier0108
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0108 begin');
      const flags: number = flagsForIndex(107);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0109
     * @tc.name      testAppIdentifier0109
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0109 begin');
      const flags: number = flagsForIndex(108);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0110
     * @tc.name      testAppIdentifier0110
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0110 begin');
      const flags: number = flagsForIndex(109);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0111
     * @tc.name      testAppIdentifier0111
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0111 begin');
      const flags: number = flagsForIndex(110);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0112
     * @tc.name      testAppIdentifier0112
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0112 begin');
      const flags: number = flagsForIndex(111);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0113
     * @tc.name      testAppIdentifier0113
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0113 begin');
      const flags: number = flagsForIndex(112);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0114
     * @tc.name      testAppIdentifier0114
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0114 begin');
      const flags: number = flagsForIndex(113);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0115
     * @tc.name      testAppIdentifier0115
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0115 begin');
      const flags: number = flagsForIndex(114);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0116
     * @tc.name      testAppIdentifier0116
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0116 begin');
      const flags: number = flagsForIndex(115);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0117
     * @tc.name      testAppIdentifier0117
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0117 begin');
      const flags: number = flagsForIndex(116);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0118
     * @tc.name      testAppIdentifier0118
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0118 begin');
      const flags: number = flagsForIndex(117);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0119
     * @tc.name      testAppIdentifier0119
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0119 begin');
      const flags: number = flagsForIndex(118);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0120
     * @tc.name      testAppIdentifier0120
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0120 begin');
      const flags: number = flagsForIndex(119);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0121
     * @tc.name      testAppIdentifier0121
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0121 begin');
      const flags: number = flagsForIndex(120);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0122
     * @tc.name      testAppIdentifier0122
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0122 begin');
      const flags: number = flagsForIndex(121);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0123
     * @tc.name      testAppIdentifier0123
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0123 begin');
      const flags: number = flagsForIndex(122);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0124
     * @tc.name      testAppIdentifier0124
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0124 begin');
      const flags: number = flagsForIndex(123);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0125
     * @tc.name      testAppIdentifier0125
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0125 begin');
      const flags: number = flagsForIndex(124);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0126
     * @tc.name      testAppIdentifier0126
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0126 begin');
      const flags: number = flagsForIndex(125);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0127
     * @tc.name      testAppIdentifier0127
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0127 begin');
      const flags: number = flagsForIndex(126);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0128
     * @tc.name      testAppIdentifier0128
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0128 begin');
      const flags: number = flagsForIndex(127);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0128 end');
    })

  })
}
