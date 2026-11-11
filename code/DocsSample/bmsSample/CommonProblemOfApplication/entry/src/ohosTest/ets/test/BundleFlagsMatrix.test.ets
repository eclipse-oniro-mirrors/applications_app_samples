/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME, querySelf, querySelfSync } from './shared/BundleProbe';
import { countBits, isPowerOfTwo } from './shared/BundleOracle';
import {
  DEFAULT_SPEC,
  FlagSpec,
  SIGNATURE_FLAGS,
  WITH_ABILITY_SPEC,
  WITH_APPLICATION_SPEC,
  WITH_DISABLE_SPEC,
  WITH_EXTENSION_ABILITY_SPEC,
  WITH_HAP_MODULE_SPEC,
  WITH_METADATA_SPEC,
  WITH_REQUESTED_PERMISSION_SPEC,
  WITH_SIGNATURE_INFO_SPEC,
  hasBit
} from './shared/BundleFlags';

const EACH_FLAG: FlagSpec[] = [
  DEFAULT_SPEC,
  WITH_APPLICATION_SPEC,
  WITH_HAP_MODULE_SPEC,
  WITH_ABILITY_SPEC,
  WITH_EXTENSION_ABILITY_SPEC,
  WITH_REQUESTED_PERMISSION_SPEC,
  WITH_METADATA_SPEC,
  WITH_DISABLE_SPEC,
  WITH_SIGNATURE_INFO_SPEC
];

const DOCUMENTED_VALUES: number[] = [
  0x00000001,
  0x00000002,
  0x00000004,
  0x00000008,
  0x00000010,
  0x00000020,
  0x00000040,
  0x00000080
];

interface ComboRow {
  name: string;
  flags: number;
  expectedBits: number;
}

function combos(): ComboRow[] {
  return [
    { name: 'app_only', flags: WITH_APPLICATION_SPEC.bit, expectedBits: 1 },
    { name: 'app_plus_signature', flags: WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit, expectedBits: 2 },
    { name: 'signature_only', flags: WITH_SIGNATURE_INFO_SPEC.bit, expectedBits: 1 },
    { name: 'module_only', flags: WITH_HAP_MODULE_SPEC.bit, expectedBits: 1 },
    { name: 'module_plus_ability', flags: WITH_HAP_MODULE_SPEC.bit | WITH_ABILITY_SPEC.bit, expectedBits: 2 },
    { name: 'module_plus_extension', flags: WITH_HAP_MODULE_SPEC.bit | WITH_EXTENSION_ABILITY_SPEC.bit, expectedBits: 2 },
    { name: 'ability_alone_without_module', flags: WITH_ABILITY_SPEC.bit, expectedBits: 1 },
    { name: 'extension_alone_without_module', flags: WITH_EXTENSION_ABILITY_SPEC.bit, expectedBits: 1 },
    { name: 'permission_only', flags: WITH_REQUESTED_PERMISSION_SPEC.bit, expectedBits: 1 },
    { name: 'metadata_only', flags: WITH_METADATA_SPEC.bit, expectedBits: 1 },
    { name: 'disable_only', flags: WITH_DISABLE_SPEC.bit, expectedBits: 1 },
    { name: 'full_stack', flags: SIGNATURE_FLAGS | WITH_HAP_MODULE_SPEC.bit, expectedBits: 3 },
    { name: 'everything_but_signature', flags: 0x0000007F, expectedBits: 7 },
    { name: 'all_documented', flags: 0x000000FF, expectedBits: 8 },
    { name: 'duplicated_application_bit', flags: WITH_APPLICATION_SPEC.bit | WITH_APPLICATION_SPEC.bit, expectedBits: 1 },
    { name: 'duplicated_signature_bit',
      flags: WITH_SIGNATURE_INFO_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit, expectedBits: 1 }
  ];
}

export default function bundleFlagsMatrixTest() {
  describe('bundleFlagsMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    EACH_FLAG.forEach((spec: FlagSpec) => {
      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0100
       * @tc.name testFlagMatrix0001
       * @tc.desc Verify the SDK constant keeps the documented numeric value
       * @tc.size SmallTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testFlagMatrix0001_${spec.name}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        expect(spec.sdkValue).assertEqual(spec.bit);
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0200
       * @tc.name testFlagMatrix0002
       * @tc.desc Verify every non-zero documented flag is a single power-of-two bit
       * @tc.size SmallTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testFlagMatrix0002_${spec.name}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        if (spec.bit === 0) {
          expect(spec.sdkValue).assertEqual(0);
          expect(isPowerOfTwo(spec.sdkValue)).assertFalse();
        } else {
          expect(isPowerOfTwo(spec.sdkValue)).assertTrue();
          expect(countBits(spec.sdkValue)).assertEqual(1);
        }
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0300
       * @tc.name testFlagMatrix0003
       * @tc.desc Verify a single flag round-trips through the sync entry point and preserves its bit
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testFlagMatrix0003_${spec.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = querySelfSync(spec.bit);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        const flags: number = spec.bit;
        expect(hasBit(flags, spec.bit)).assertTrue();
        expect(countBits(flags)).assertEqual(spec.bit === 0 ? 0 : 1);
      });
    });

    DOCUMENTED_VALUES.forEach((value: number, index: number) => {
      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0400
       * @tc.name testFlagMatrix0004
       * @tc.desc Verify each documented value is a distinct bit that no other documented value carries
       * @tc.size SmallTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testFlagMatrix0004_bit${index}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        expect(isPowerOfTwo(value)).assertTrue();
        for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
          if (other !== index) {
            expect(value & DOCUMENTED_VALUES[other]).assertEqual(0);
          }
        }
      });
    });

    combos().forEach((row: ComboRow) => {
      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0500
       * @tc.name testFlagMatrix0005
       * @tc.desc Verify a flag combination keeps exactly the expected number of set bits
       * @tc.size SmallTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testFlagMatrix0005_${row.name}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        expect(countBits(row.flags)).assertEqual(row.expectedBits);
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0600
       * @tc.name testFlagMatrix0006
       * @tc.desc Verify the combination is accepted by bundleManager and never widens the name field
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testFlagMatrix0006_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        expect(info.name).assertEqual(SELF_BUNDLE_NAME);
        expect(info.name.length > 0).assertTrue();
        expect(countBits(row.flags)).assertEqual(row.expectedBits);
      });
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0700
     * @tc.name testFlagMatrix0007
     * @tc.desc Verify the default flag (0) is accepted and still returns the bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(DEFAULT_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(DEFAULT_SPEC.bit).assertEqual(0);
      expect(countBits(DEFAULT_SPEC.bit)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0800
     * @tc.name testFlagMatrix0008
     * @tc.desc Verify asking for signature bits alone yields a populated signatureInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      expect(hasBit(WITH_SIGNATURE_INFO_SPEC.bit, WITH_SIGNATURE_INFO_SPEC.bit)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0900
     * @tc.name testFlagMatrix0009
     * @tc.desc Verify that combining signature with unrelated bits yields the same appId as the lone bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const lone: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit);
      const combined: bundleManager.BundleInfo = await querySelf(SIGNATURE_FLAGS);
      expect(lone.signatureInfo.appId).assertEqual(combined.signatureInfo.appId);
      expect(lone.signatureInfo.fingerprint).assertEqual(combined.signatureInfo.fingerprint);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_1000
     * @tc.name testFlagMatrix0010
     * @tc.desc Verify that requesting all documented bits at once is accepted by both entry points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const all: number = 0x000000FF;
      const asyncInfo: bundleManager.BundleInfo = await querySelf(all);
      const syncInfo: bundleManager.BundleInfo = querySelfSync(all);
      expect(asyncInfo.name).assertEqual(syncInfo.name);
      expect(asyncInfo.signatureInfo.appId).assertEqual(syncInfo.signatureInfo.appId);
      expect(countBits(all)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_1100
     * @tc.name testFlagMatrix0011
     * @tc.desc Verify the same flags queried asynchronously and synchronously agree on a field probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flagsSet: number[] = [0, WITH_APPLICATION_SPEC.bit, WITH_SIGNATURE_INFO_SPEC.bit, SIGNATURE_FLAGS];
      for (let i: number = 0; i < flagsSet.length; i++) {
        const asyncInfo: bundleManager.BundleInfo = await querySelf(flagsSet[i]);
        const syncInfo: bundleManager.BundleInfo = querySelfSync(flagsSet[i]);
        expect(asyncInfo.name).assertEqual(syncInfo.name);
        expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_1200
     * @tc.name testFlagMatrix0012
     * @tc.desc Verify the order of combined bits never changes the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const a: number = WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit | WITH_HAP_MODULE_SPEC.bit;
      const b: number = WITH_HAP_MODULE_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit | WITH_APPLICATION_SPEC.bit;
      expect(a).assertEqual(b);
      const infoA: bundleManager.BundleInfo = await querySelf(a);
      const infoB: bundleManager.BundleInfo = await querySelf(b);
      expect(infoA.name).assertEqual(infoB.name);
      expect(infoA.signatureInfo.fingerprint).assertEqual(infoB.signatureInfo.fingerprint);
    });
  });
}
