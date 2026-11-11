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
const TAG: string = '[Sample_CommonProblem_BundleAppIdentifierCore]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


export default function bundleAppIdentifierCoreTest() {
  describe('bundleAppIdentifierCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0001
     * @tc.name      testAppIdentifier0001
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0001 begin');
      const flags: number = flagsForIndex(0);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0002
     * @tc.name      testAppIdentifier0002
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0002 begin');
      const flags: number = flagsForIndex(1);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0003
     * @tc.name      testAppIdentifier0003
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0003 begin');
      const flags: number = flagsForIndex(2);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0004
     * @tc.name      testAppIdentifier0004
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0004 begin');
      const flags: number = flagsForIndex(3);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0005
     * @tc.name      testAppIdentifier0005
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0005 begin');
      const flags: number = flagsForIndex(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0006
     * @tc.name      testAppIdentifier0006
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0006 begin');
      const flags: number = flagsForIndex(5);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0007
     * @tc.name      testAppIdentifier0007
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0007 begin');
      const flags: number = flagsForIndex(6);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0008
     * @tc.name      testAppIdentifier0008
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0008 begin');
      const flags: number = flagsForIndex(7);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0009
     * @tc.name      testAppIdentifier0009
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0009 begin');
      const flags: number = flagsForIndex(8);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0010
     * @tc.name      testAppIdentifier0010
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0010 begin');
      const flags: number = flagsForIndex(9);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0011
     * @tc.name      testAppIdentifier0011
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0011 begin');
      const flags: number = flagsForIndex(10);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0012
     * @tc.name      testAppIdentifier0012
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0012 begin');
      const flags: number = flagsForIndex(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0013
     * @tc.name      testAppIdentifier0013
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0013 begin');
      const flags: number = flagsForIndex(12);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0014
     * @tc.name      testAppIdentifier0014
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0014 begin');
      const flags: number = flagsForIndex(13);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0015
     * @tc.name      testAppIdentifier0015
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0015 begin');
      const flags: number = flagsForIndex(14);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0016
     * @tc.name      testAppIdentifier0016
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0016 begin');
      const flags: number = flagsForIndex(15);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0017
     * @tc.name      testAppIdentifier0017
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0017 begin');
      const flags: number = flagsForIndex(16);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0018
     * @tc.name      testAppIdentifier0018
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0018 begin');
      const flags: number = flagsForIndex(17);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0019
     * @tc.name      testAppIdentifier0019
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0019 begin');
      const flags: number = flagsForIndex(18);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0020
     * @tc.name      testAppIdentifier0020
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0020 begin');
      const flags: number = flagsForIndex(19);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0021
     * @tc.name      testAppIdentifier0021
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0021 begin');
      const flags: number = flagsForIndex(20);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0022
     * @tc.name      testAppIdentifier0022
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0022 begin');
      const flags: number = flagsForIndex(21);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0023
     * @tc.name      testAppIdentifier0023
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0023 begin');
      const flags: number = flagsForIndex(22);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0024
     * @tc.name      testAppIdentifier0024
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0024 begin');
      const flags: number = flagsForIndex(23);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0025
     * @tc.name      testAppIdentifier0025
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0025 begin');
      const flags: number = flagsForIndex(24);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0026
     * @tc.name      testAppIdentifier0026
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0026 begin');
      const flags: number = flagsForIndex(25);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0027
     * @tc.name      testAppIdentifier0027
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0027 begin');
      const flags: number = flagsForIndex(26);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0028
     * @tc.name      testAppIdentifier0028
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0028 begin');
      const flags: number = flagsForIndex(27);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0029
     * @tc.name      testAppIdentifier0029
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0029 begin');
      const flags: number = flagsForIndex(28);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0030
     * @tc.name      testAppIdentifier0030
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0030 begin');
      const flags: number = flagsForIndex(29);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0031
     * @tc.name      testAppIdentifier0031
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0031 begin');
      const flags: number = flagsForIndex(30);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0032
     * @tc.name      testAppIdentifier0032
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0032 begin');
      const flags: number = flagsForIndex(31);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0033
     * @tc.name      testAppIdentifier0033
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0033 begin');
      const flags: number = flagsForIndex(32);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0034
     * @tc.name      testAppIdentifier0034
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0034 begin');
      const flags: number = flagsForIndex(33);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0035
     * @tc.name      testAppIdentifier0035
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0035 begin');
      const flags: number = flagsForIndex(34);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0036
     * @tc.name      testAppIdentifier0036
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0036 begin');
      const flags: number = flagsForIndex(35);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0037
     * @tc.name      testAppIdentifier0037
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0037 begin');
      const flags: number = flagsForIndex(36);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0038
     * @tc.name      testAppIdentifier0038
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0038 begin');
      const flags: number = flagsForIndex(37);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0039
     * @tc.name      testAppIdentifier0039
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0039 begin');
      const flags: number = flagsForIndex(38);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0040
     * @tc.name      testAppIdentifier0040
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0040 begin');
      const flags: number = flagsForIndex(39);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0041
     * @tc.name      testAppIdentifier0041
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0041 begin');
      const flags: number = flagsForIndex(40);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0042
     * @tc.name      testAppIdentifier0042
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0042 begin');
      const flags: number = flagsForIndex(41);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0043
     * @tc.name      testAppIdentifier0043
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0043 begin');
      const flags: number = flagsForIndex(42);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0044
     * @tc.name      testAppIdentifier0044
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0044 begin');
      const flags: number = flagsForIndex(43);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0045
     * @tc.name      testAppIdentifier0045
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0045 begin');
      const flags: number = flagsForIndex(44);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0046
     * @tc.name      testAppIdentifier0046
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0046 begin');
      const flags: number = flagsForIndex(45);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0047
     * @tc.name      testAppIdentifier0047
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0047 begin');
      const flags: number = flagsForIndex(46);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0048
     * @tc.name      testAppIdentifier0048
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0048 begin');
      const flags: number = flagsForIndex(47);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0049
     * @tc.name      testAppIdentifier0049
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0049 begin');
      const flags: number = flagsForIndex(48);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0050
     * @tc.name      testAppIdentifier0050
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0050 begin');
      const flags: number = flagsForIndex(49);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0051
     * @tc.name      testAppIdentifier0051
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0051 begin');
      const flags: number = flagsForIndex(50);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0052
     * @tc.name      testAppIdentifier0052
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0052 begin');
      const flags: number = flagsForIndex(51);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0053
     * @tc.name      testAppIdentifier0053
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0053 begin');
      const flags: number = flagsForIndex(52);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0054
     * @tc.name      testAppIdentifier0054
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0054 begin');
      const flags: number = flagsForIndex(53);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0055
     * @tc.name      testAppIdentifier0055
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0055 begin');
      const flags: number = flagsForIndex(54);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0056
     * @tc.name      testAppIdentifier0056
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0056 begin');
      const flags: number = flagsForIndex(55);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0057
     * @tc.name      testAppIdentifier0057
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0057 begin');
      const flags: number = flagsForIndex(56);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0058
     * @tc.name      testAppIdentifier0058
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0058 begin');
      const flags: number = flagsForIndex(57);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0059
     * @tc.name      testAppIdentifier0059
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0059 begin');
      const flags: number = flagsForIndex(58);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0060
     * @tc.name      testAppIdentifier0060
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0060 begin');
      const flags: number = flagsForIndex(59);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0061
     * @tc.name      testAppIdentifier0061
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0061 begin');
      const flags: number = flagsForIndex(60);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0062
     * @tc.name      testAppIdentifier0062
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0062 begin');
      const flags: number = flagsForIndex(61);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0063
     * @tc.name      testAppIdentifier0063
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0063 begin');
      const flags: number = flagsForIndex(62);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_APPIDENT_0064
     * @tc.name      testAppIdentifier0064
     * @tc.desc      Verify bundleAppIdentifier with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAppIdentifier0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0064 begin');
      const flags: number = flagsForIndex(63);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppIdentifier0064 end');
    })

  })
}
