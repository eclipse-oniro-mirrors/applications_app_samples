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
const TAG: string = '[Sample_CommonProblem_BundleAppIdentifierAdvanced]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdentifierAdvancedTest() {
  describe('bundleAppIdentifierAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0129
     * @tc.name      testAppIdentifier0129
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0129 begin');
      const flags: number = flagsForIndex(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0130
     * @tc.name      testAppIdentifier0130
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0130 begin');
      const flags: number = flagsForIndex(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0131
     * @tc.name      testAppIdentifier0131
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0131 begin');
      const flags: number = flagsForIndex(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0132
     * @tc.name      testAppIdentifier0132
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0132 begin');
      const flags: number = flagsForIndex(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0133
     * @tc.name      testAppIdentifier0133
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0133 begin');
      const flags: number = flagsForIndex(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0134
     * @tc.name      testAppIdentifier0134
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0134 begin');
      const flags: number = flagsForIndex(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0135
     * @tc.name      testAppIdentifier0135
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0135 begin');
      const flags: number = flagsForIndex(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0136
     * @tc.name      testAppIdentifier0136
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0136 begin');
      const flags: number = flagsForIndex(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0137
     * @tc.name      testAppIdentifier0137
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0137 begin');
      const flags: number = flagsForIndex(136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0138
     * @tc.name      testAppIdentifier0138
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0138 begin');
      const flags: number = flagsForIndex(137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0139
     * @tc.name      testAppIdentifier0139
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0139 begin');
      const flags: number = flagsForIndex(138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0140
     * @tc.name      testAppIdentifier0140
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0140 begin');
      const flags: number = flagsForIndex(139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0141
     * @tc.name      testAppIdentifier0141
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0141 begin');
      const flags: number = flagsForIndex(140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0142
     * @tc.name      testAppIdentifier0142
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0142 begin');
      const flags: number = flagsForIndex(141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0143
     * @tc.name      testAppIdentifier0143
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0143 begin');
      const flags: number = flagsForIndex(142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0144
     * @tc.name      testAppIdentifier0144
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0144 begin');
      const flags: number = flagsForIndex(143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0145
     * @tc.name      testAppIdentifier0145
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0145 begin');
      const flags: number = flagsForIndex(144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0146
     * @tc.name      testAppIdentifier0146
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0146 begin');
      const flags: number = flagsForIndex(145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0147
     * @tc.name      testAppIdentifier0147
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0147 begin');
      const flags: number = flagsForIndex(146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0148
     * @tc.name      testAppIdentifier0148
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0148 begin');
      const flags: number = flagsForIndex(147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0149
     * @tc.name      testAppIdentifier0149
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0149 begin');
      const flags: number = flagsForIndex(148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0150
     * @tc.name      testAppIdentifier0150
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0150 begin');
      const flags: number = flagsForIndex(149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0151
     * @tc.name      testAppIdentifier0151
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0151 begin');
      const flags: number = flagsForIndex(150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0152
     * @tc.name      testAppIdentifier0152
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0152 begin');
      const flags: number = flagsForIndex(151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0153
     * @tc.name      testAppIdentifier0153
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0153 begin');
      const flags: number = flagsForIndex(152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0154
     * @tc.name      testAppIdentifier0154
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0154 begin');
      const flags: number = flagsForIndex(153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0155
     * @tc.name      testAppIdentifier0155
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0155 begin');
      const flags: number = flagsForIndex(154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0156
     * @tc.name      testAppIdentifier0156
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0156 begin');
      const flags: number = flagsForIndex(155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0157
     * @tc.name      testAppIdentifier0157
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0157 begin');
      const flags: number = flagsForIndex(156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0158
     * @tc.name      testAppIdentifier0158
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0158 begin');
      const flags: number = flagsForIndex(157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0159
     * @tc.name      testAppIdentifier0159
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0159 begin');
      const flags: number = flagsForIndex(158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0160
     * @tc.name      testAppIdentifier0160
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0160 begin');
      const flags: number = flagsForIndex(159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0161
     * @tc.name      testAppIdentifier0161
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0161 begin');
      const flags: number = flagsForIndex(160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0162
     * @tc.name      testAppIdentifier0162
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0162 begin');
      const flags: number = flagsForIndex(161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0163
     * @tc.name      testAppIdentifier0163
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0163 begin');
      const flags: number = flagsForIndex(162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0164
     * @tc.name      testAppIdentifier0164
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0164 begin');
      const flags: number = flagsForIndex(163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0165
     * @tc.name      testAppIdentifier0165
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0165 begin');
      const flags: number = flagsForIndex(164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0166
     * @tc.name      testAppIdentifier0166
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0166 begin');
      const flags: number = flagsForIndex(165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0167
     * @tc.name      testAppIdentifier0167
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0167 begin');
      const flags: number = flagsForIndex(166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0168
     * @tc.name      testAppIdentifier0168
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0168 begin');
      const flags: number = flagsForIndex(167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0169
     * @tc.name      testAppIdentifier0169
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0169 begin');
      const flags: number = flagsForIndex(168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0170
     * @tc.name      testAppIdentifier0170
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0170 begin');
      const flags: number = flagsForIndex(169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0171
     * @tc.name      testAppIdentifier0171
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0171 begin');
      const flags: number = flagsForIndex(170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0172
     * @tc.name      testAppIdentifier0172
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0172 begin');
      const flags: number = flagsForIndex(171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0173
     * @tc.name      testAppIdentifier0173
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0173 begin');
      const flags: number = flagsForIndex(172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0174
     * @tc.name      testAppIdentifier0174
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0174 begin');
      const flags: number = flagsForIndex(173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0175
     * @tc.name      testAppIdentifier0175
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0175 begin');
      const flags: number = flagsForIndex(174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0176
     * @tc.name      testAppIdentifier0176
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0176 begin');
      const flags: number = flagsForIndex(175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0177
     * @tc.name      testAppIdentifier0177
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0177 begin');
      const flags: number = flagsForIndex(176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0178
     * @tc.name      testAppIdentifier0178
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0178 begin');
      const flags: number = flagsForIndex(177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0179
     * @tc.name      testAppIdentifier0179
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0179 begin');
      const flags: number = flagsForIndex(178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0180
     * @tc.name      testAppIdentifier0180
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0180 begin');
      const flags: number = flagsForIndex(179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0181
     * @tc.name      testAppIdentifier0181
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0181 begin');
      const flags: number = flagsForIndex(180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0182
     * @tc.name      testAppIdentifier0182
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0182 begin');
      const flags: number = flagsForIndex(181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0183
     * @tc.name      testAppIdentifier0183
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0183 begin');
      const flags: number = flagsForIndex(182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0184
     * @tc.name      testAppIdentifier0184
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0184 begin');
      const flags: number = flagsForIndex(183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0185
     * @tc.name      testAppIdentifier0185
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0185 begin');
      const flags: number = flagsForIndex(184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0186
     * @tc.name      testAppIdentifier0186
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0186 begin');
      const flags: number = flagsForIndex(185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0187
     * @tc.name      testAppIdentifier0187
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0187 begin');
      const flags: number = flagsForIndex(186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0188
     * @tc.name      testAppIdentifier0188
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0188 begin');
      const flags: number = flagsForIndex(187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0189
     * @tc.name      testAppIdentifier0189
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0189 begin');
      const flags: number = flagsForIndex(188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0190
     * @tc.name      testAppIdentifier0190
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0190 begin');
      const flags: number = flagsForIndex(189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0191
     * @tc.name      testAppIdentifier0191
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0191 begin');
      const flags: number = flagsForIndex(190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0192
     * @tc.name      testAppIdentifier0192
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0192 begin');
      const flags: number = flagsForIndex(191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0192 end');
    })

  })
}
