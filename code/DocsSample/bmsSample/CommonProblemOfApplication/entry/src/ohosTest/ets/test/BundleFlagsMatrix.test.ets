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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME, querySelf, querySelfSync } from './shared/BundleProbe';
import { countBits, isPowerOfTwo } from './shared/BundleOracle';
import {
  DEFAULT_SPEC,
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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_FlagMatrix]';

const DOCUMENTED_VALUES: number[] = [0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x00000010, 0x00000020, 0x00000040, 0x00000080];

export default function bundleFlagsMatrixTest() {
  describe('bundleFlagsMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0101
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_DEFAULT
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_DEFAULT keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_DEFAULT', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_DEFAULT begin');
      expect(DEFAULT_SPEC.sdkValue).assertEqual(DEFAULT_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_DEFAULT end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0201
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_DEFAULT
     * @tc.desc Verify GET_BUNDLE_INFO_DEFAULT is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_DEFAULT', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_DEFAULT begin');
      if (DEFAULT_SPEC.bit === 0) {
        expect(DEFAULT_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(DEFAULT_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(DEFAULT_SPEC.sdkValue)).assertTrue();
        expect(countBits(DEFAULT_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_DEFAULT end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0301
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_DEFAULT
     * @tc.desc Verify GET_BUNDLE_INFO_DEFAULT round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_DEFAULT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_DEFAULT begin');
      const info: bundleManager.BundleInfo = querySelfSync(DEFAULT_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = DEFAULT_SPEC.bit;
      expect(hasBit(flags, DEFAULT_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(DEFAULT_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_DEFAULT end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0102
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_APPLICATION
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_APPLICATION keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_APPLICATION', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_APPLICATION begin');
      expect(WITH_APPLICATION_SPEC.sdkValue).assertEqual(WITH_APPLICATION_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_APPLICATION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0202
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_APPLICATION
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_APPLICATION is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_APPLICATION', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_APPLICATION begin');
      if (WITH_APPLICATION_SPEC.bit === 0) {
        expect(WITH_APPLICATION_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_APPLICATION_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_APPLICATION_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_APPLICATION_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_APPLICATION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0302
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_APPLICATION
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_APPLICATION round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_APPLICATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_APPLICATION begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_APPLICATION_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_APPLICATION_SPEC.bit;
      expect(hasBit(flags, WITH_APPLICATION_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_APPLICATION_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_APPLICATION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0103
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_HAP_MODULE
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_HAP_MODULE keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_HAP_MODULE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_HAP_MODULE begin');
      expect(WITH_HAP_MODULE_SPEC.sdkValue).assertEqual(WITH_HAP_MODULE_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_HAP_MODULE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0203
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_HAP_MODULE
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_HAP_MODULE is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_HAP_MODULE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_HAP_MODULE begin');
      if (WITH_HAP_MODULE_SPEC.bit === 0) {
        expect(WITH_HAP_MODULE_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_HAP_MODULE_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_HAP_MODULE_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_HAP_MODULE_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_HAP_MODULE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0303
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_HAP_MODULE
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_HAP_MODULE round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_HAP_MODULE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_HAP_MODULE begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_HAP_MODULE_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_HAP_MODULE_SPEC.bit;
      expect(hasBit(flags, WITH_HAP_MODULE_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_HAP_MODULE_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_HAP_MODULE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0104
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_ABILITY
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_ABILITY keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_ABILITY', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_ABILITY begin');
      expect(WITH_ABILITY_SPEC.sdkValue).assertEqual(WITH_ABILITY_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0204
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_ABILITY
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_ABILITY is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_ABILITY', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_ABILITY begin');
      if (WITH_ABILITY_SPEC.bit === 0) {
        expect(WITH_ABILITY_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_ABILITY_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_ABILITY_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_ABILITY_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0304
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_ABILITY
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_ABILITY round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_ABILITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_ABILITY begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_ABILITY_SPEC.bit;
      expect(hasBit(flags, WITH_ABILITY_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_ABILITY_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0105
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY begin');
      expect(WITH_EXTENSION_ABILITY_SPEC.sdkValue).assertEqual(WITH_EXTENSION_ABILITY_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0205
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY begin');
      if (WITH_EXTENSION_ABILITY_SPEC.bit === 0) {
        expect(WITH_EXTENSION_ABILITY_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_EXTENSION_ABILITY_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_EXTENSION_ABILITY_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_EXTENSION_ABILITY_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0305
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_EXTENSION_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_EXTENSION_ABILITY_SPEC.bit;
      expect(hasBit(flags, WITH_EXTENSION_ABILITY_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_EXTENSION_ABILITY_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0106
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION begin');
      expect(WITH_REQUESTED_PERMISSION_SPEC.sdkValue).assertEqual(WITH_REQUESTED_PERMISSION_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0206
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION begin');
      if (WITH_REQUESTED_PERMISSION_SPEC.bit === 0) {
        expect(WITH_REQUESTED_PERMISSION_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_REQUESTED_PERMISSION_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_REQUESTED_PERMISSION_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_REQUESTED_PERMISSION_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0306
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_REQUESTED_PERMISSION_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_REQUESTED_PERMISSION_SPEC.bit;
      expect(hasBit(flags, WITH_REQUESTED_PERMISSION_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_REQUESTED_PERMISSION_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0107
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_METADATA
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_METADATA keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_METADATA', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_METADATA begin');
      expect(WITH_METADATA_SPEC.sdkValue).assertEqual(WITH_METADATA_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_METADATA end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0207
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_METADATA
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_METADATA is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_METADATA', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_METADATA begin');
      if (WITH_METADATA_SPEC.bit === 0) {
        expect(WITH_METADATA_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_METADATA_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_METADATA_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_METADATA_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_METADATA end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0307
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_METADATA
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_METADATA round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_METADATA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_METADATA begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_METADATA_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_METADATA_SPEC.bit;
      expect(hasBit(flags, WITH_METADATA_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_METADATA_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_METADATA end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0108
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_DISABLE
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_DISABLE keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_DISABLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_DISABLE begin');
      expect(WITH_DISABLE_SPEC.sdkValue).assertEqual(WITH_DISABLE_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_DISABLE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0208
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_DISABLE
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_DISABLE is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_DISABLE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_DISABLE begin');
      if (WITH_DISABLE_SPEC.bit === 0) {
        expect(WITH_DISABLE_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_DISABLE_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_DISABLE_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_DISABLE_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_DISABLE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0308
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_DISABLE
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_DISABLE round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_DISABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_DISABLE begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_DISABLE_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_DISABLE_SPEC.bit;
      expect(hasBit(flags, WITH_DISABLE_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_DISABLE_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_DISABLE end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0109
     * @tc.name testFlagMatrix0001_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO
     * @tc.desc Verify the SDK constant GET_BUNDLE_INFO_WITH_SIGNATURE_INFO keeps the documented numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0001_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO begin');
      expect(WITH_SIGNATURE_INFO_SPEC.sdkValue).assertEqual(WITH_SIGNATURE_INFO_SPEC.bit);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0001_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0209
     * @tc.name testFlagMatrix0002_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_SIGNATURE_INFO is a single power-of-two bit (or zero for default)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0002_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO begin');
      if (WITH_SIGNATURE_INFO_SPEC.bit === 0) {
        expect(WITH_SIGNATURE_INFO_SPEC.sdkValue).assertEqual(0);
        expect(isPowerOfTwo(WITH_SIGNATURE_INFO_SPEC.sdkValue)).assertFalse();
      } else {
        expect(isPowerOfTwo(WITH_SIGNATURE_INFO_SPEC.sdkValue)).assertTrue();
        expect(countBits(WITH_SIGNATURE_INFO_SPEC.sdkValue)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0002_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0309
     * @tc.name testFlagMatrix0003_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO
     * @tc.desc Verify GET_BUNDLE_INFO_WITH_SIGNATURE_INFO round-trips through the sync entry point and preserves its bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0003_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO begin');
      const info: bundleManager.BundleInfo = querySelfSync(WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      const flags: number = WITH_SIGNATURE_INFO_SPEC.bit;
      expect(hasBit(flags, WITH_SIGNATURE_INFO_SPEC.bit)).assertTrue();
      expect(countBits(flags)).assertEqual(WITH_SIGNATURE_INFO_SPEC.bit === 0 ? 0 : 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0003_GET_BUNDLE_INFO_WITH_SIGNATURE_INFO end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0401
     * @tc.name testFlagMatrix0004_bit0
     * @tc.desc Verify documented value bit0 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit0 begin');
      expect(isPowerOfTwo(0x00000001)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 0) {
          expect(0x00000001 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit0 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0402
     * @tc.name testFlagMatrix0004_bit1
     * @tc.desc Verify documented value bit1 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit1', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit1 begin');
      expect(isPowerOfTwo(0x00000002)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 1) {
          expect(0x00000002 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit1 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0403
     * @tc.name testFlagMatrix0004_bit2
     * @tc.desc Verify documented value bit2 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit2 begin');
      expect(isPowerOfTwo(0x00000004)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 2) {
          expect(0x00000004 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit2 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0404
     * @tc.name testFlagMatrix0004_bit3
     * @tc.desc Verify documented value bit3 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit3', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit3 begin');
      expect(isPowerOfTwo(0x00000008)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 3) {
          expect(0x00000008 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit3 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0405
     * @tc.name testFlagMatrix0004_bit4
     * @tc.desc Verify documented value bit4 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit4', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit4 begin');
      expect(isPowerOfTwo(0x00000010)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 4) {
          expect(0x00000010 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit4 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0406
     * @tc.name testFlagMatrix0004_bit5
     * @tc.desc Verify documented value bit5 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit5', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit5 begin');
      expect(isPowerOfTwo(0x00000020)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 5) {
          expect(0x00000020 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit5 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0407
     * @tc.name testFlagMatrix0004_bit6
     * @tc.desc Verify documented value bit6 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit6', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit6 begin');
      expect(isPowerOfTwo(0x00000040)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 6) {
          expect(0x00000040 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit6 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0408
     * @tc.name testFlagMatrix0004_bit7
     * @tc.desc Verify documented value bit7 is distinct from the other documented values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0004_bit7', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit7 begin');
      expect(isPowerOfTwo(0x00000080)).assertTrue();
      for (let other: number = 0; other < DOCUMENTED_VALUES.length; other++) {
        if (other !== 7) {
          expect(0x00000080 & DOCUMENTED_VALUES[other]).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0004_bit7 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0501
     * @tc.name testFlagMatrix0005_app_only
     * @tc.desc Verify combination app_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_app_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_app_only begin');
      expect(countBits(WITH_APPLICATION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_app_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0601
     * @tc.name testFlagMatrix0006_app_only
     * @tc.desc Verify combination app_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_app_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_app_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_APPLICATION_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_APPLICATION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_app_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0502
     * @tc.name testFlagMatrix0005_app_plus_signature
     * @tc.desc Verify combination app_plus_signature keeps exactly 2 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_app_plus_signature', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_app_plus_signature begin');
      expect(countBits(WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_app_plus_signature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0602
     * @tc.name testFlagMatrix0006_app_plus_signature
     * @tc.desc Verify combination app_plus_signature is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_app_plus_signature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_app_plus_signature begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_app_plus_signature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0503
     * @tc.name testFlagMatrix0005_signature_only
     * @tc.desc Verify combination signature_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_signature_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_signature_only begin');
      expect(countBits(WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_signature_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0603
     * @tc.name testFlagMatrix0006_signature_only
     * @tc.desc Verify combination signature_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_signature_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_signature_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_signature_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0504
     * @tc.name testFlagMatrix0005_module_only
     * @tc.desc Verify combination module_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_module_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_only begin');
      expect(countBits(WITH_HAP_MODULE_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0604
     * @tc.name testFlagMatrix0006_module_only
     * @tc.desc Verify combination module_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_module_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_HAP_MODULE_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_HAP_MODULE_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0505
     * @tc.name testFlagMatrix0005_module_plus_ability
     * @tc.desc Verify combination module_plus_ability keeps exactly 2 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_module_plus_ability', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_plus_ability begin');
      expect(countBits(WITH_HAP_MODULE_SPEC.bit | WITH_ABILITY_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_plus_ability end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0605
     * @tc.name testFlagMatrix0006_module_plus_ability
     * @tc.desc Verify combination module_plus_ability is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_module_plus_ability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_plus_ability begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_HAP_MODULE_SPEC.bit | WITH_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_HAP_MODULE_SPEC.bit | WITH_ABILITY_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_plus_ability end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0506
     * @tc.name testFlagMatrix0005_module_plus_extension
     * @tc.desc Verify combination module_plus_extension keeps exactly 2 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_module_plus_extension', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_plus_extension begin');
      expect(countBits(WITH_HAP_MODULE_SPEC.bit | WITH_EXTENSION_ABILITY_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_module_plus_extension end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0606
     * @tc.name testFlagMatrix0006_module_plus_extension
     * @tc.desc Verify combination module_plus_extension is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_module_plus_extension', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_plus_extension begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_HAP_MODULE_SPEC.bit | WITH_EXTENSION_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_HAP_MODULE_SPEC.bit | WITH_EXTENSION_ABILITY_SPEC.bit)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_module_plus_extension end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0507
     * @tc.name testFlagMatrix0005_ability_alone_without_module
     * @tc.desc Verify combination ability_alone_without_module keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_ability_alone_without_module', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_ability_alone_without_module begin');
      expect(countBits(WITH_ABILITY_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_ability_alone_without_module end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0607
     * @tc.name testFlagMatrix0006_ability_alone_without_module
     * @tc.desc Verify combination ability_alone_without_module is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_ability_alone_without_module', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_ability_alone_without_module begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_ABILITY_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_ability_alone_without_module end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0508
     * @tc.name testFlagMatrix0005_extension_alone_without_module
     * @tc.desc Verify combination extension_alone_without_module keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_extension_alone_without_module', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_extension_alone_without_module begin');
      expect(countBits(WITH_EXTENSION_ABILITY_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_extension_alone_without_module end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0608
     * @tc.name testFlagMatrix0006_extension_alone_without_module
     * @tc.desc Verify combination extension_alone_without_module is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_extension_alone_without_module', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_extension_alone_without_module begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_EXTENSION_ABILITY_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_EXTENSION_ABILITY_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_extension_alone_without_module end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0509
     * @tc.name testFlagMatrix0005_permission_only
     * @tc.desc Verify combination permission_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_permission_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_permission_only begin');
      expect(countBits(WITH_REQUESTED_PERMISSION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_permission_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0609
     * @tc.name testFlagMatrix0006_permission_only
     * @tc.desc Verify combination permission_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_permission_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_permission_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_REQUESTED_PERMISSION_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_REQUESTED_PERMISSION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_permission_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0510
     * @tc.name testFlagMatrix0005_metadata_only
     * @tc.desc Verify combination metadata_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_metadata_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_metadata_only begin');
      expect(countBits(WITH_METADATA_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_metadata_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0610
     * @tc.name testFlagMatrix0006_metadata_only
     * @tc.desc Verify combination metadata_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_metadata_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_metadata_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_METADATA_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_METADATA_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_metadata_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0511
     * @tc.name testFlagMatrix0005_disable_only
     * @tc.desc Verify combination disable_only keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_disable_only', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_disable_only begin');
      expect(countBits(WITH_DISABLE_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_disable_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0611
     * @tc.name testFlagMatrix0006_disable_only
     * @tc.desc Verify combination disable_only is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_disable_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_disable_only begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_DISABLE_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_DISABLE_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_disable_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0512
     * @tc.name testFlagMatrix0005_full_stack
     * @tc.desc Verify combination full_stack keeps exactly 3 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_full_stack', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_full_stack begin');
      expect(countBits(SIGNATURE_FLAGS | WITH_HAP_MODULE_SPEC.bit)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_full_stack end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0612
     * @tc.name testFlagMatrix0006_full_stack
     * @tc.desc Verify combination full_stack is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_full_stack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_full_stack begin');
      const info: bundleManager.BundleInfo = await querySelf(SIGNATURE_FLAGS | WITH_HAP_MODULE_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(SIGNATURE_FLAGS | WITH_HAP_MODULE_SPEC.bit)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_full_stack end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0513
     * @tc.name testFlagMatrix0005_everything_but_signature
     * @tc.desc Verify combination everything_but_signature keeps exactly 7 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_everything_but_signature', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_everything_but_signature begin');
      expect(countBits(0x0000007F)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_everything_but_signature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0613
     * @tc.name testFlagMatrix0006_everything_but_signature
     * @tc.desc Verify combination everything_but_signature is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_everything_but_signature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_everything_but_signature begin');
      const info: bundleManager.BundleInfo = await querySelf(0x0000007F);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(0x0000007F)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_everything_but_signature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0514
     * @tc.name testFlagMatrix0005_all_documented
     * @tc.desc Verify combination all_documented keeps exactly 8 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_all_documented', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_all_documented begin');
      expect(countBits(0x000000FF)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_all_documented end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0614
     * @tc.name testFlagMatrix0006_all_documented
     * @tc.desc Verify combination all_documented is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_all_documented', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_all_documented begin');
      const info: bundleManager.BundleInfo = await querySelf(0x000000FF);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(0x000000FF)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_all_documented end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0515
     * @tc.name testFlagMatrix0005_duplicated_application_bit
     * @tc.desc Verify combination duplicated_application_bit keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_duplicated_application_bit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_duplicated_application_bit begin');
      expect(countBits(WITH_APPLICATION_SPEC.bit | WITH_APPLICATION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_duplicated_application_bit end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0615
     * @tc.name testFlagMatrix0006_duplicated_application_bit
     * @tc.desc Verify combination duplicated_application_bit is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_duplicated_application_bit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_duplicated_application_bit begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_APPLICATION_SPEC.bit | WITH_APPLICATION_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_APPLICATION_SPEC.bit | WITH_APPLICATION_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_duplicated_application_bit end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0516
     * @tc.name testFlagMatrix0005_duplicated_signature_bit
     * @tc.desc Verify combination duplicated_signature_bit keeps exactly 1 set bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlagMatrix0005_duplicated_signature_bit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_duplicated_signature_bit begin');
      expect(countBits(WITH_SIGNATURE_INFO_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0005_duplicated_signature_bit end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_MATRIX_0616
     * @tc.name testFlagMatrix0006_duplicated_signature_bit
     * @tc.desc Verify combination duplicated_signature_bit is accepted and preserves bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagMatrix0006_duplicated_signature_bit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_duplicated_signature_bit begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.name.length > 0).assertTrue();
      expect(countBits(WITH_SIGNATURE_INFO_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0006_duplicated_signature_bit end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0007 begin');
      const info: bundleManager.BundleInfo = await querySelf(DEFAULT_SPEC.bit);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(DEFAULT_SPEC.bit).assertEqual(0);
      expect(countBits(DEFAULT_SPEC.bit)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0008 begin');
      const info: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit);
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(info.signatureInfo.fingerprint.length).assertEqual(64);
      expect(hasBit(WITH_SIGNATURE_INFO_SPEC.bit, WITH_SIGNATURE_INFO_SPEC.bit)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0009 begin');
      const lone: bundleManager.BundleInfo = await querySelf(WITH_SIGNATURE_INFO_SPEC.bit);
      const combined: bundleManager.BundleInfo = await querySelf(SIGNATURE_FLAGS);
      expect(lone.signatureInfo.appId).assertEqual(combined.signatureInfo.appId);
      expect(lone.signatureInfo.fingerprint).assertEqual(combined.signatureInfo.fingerprint);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0010 begin');
      const all: number = 0x000000FF;
      const asyncInfo: bundleManager.BundleInfo = await querySelf(all);
      const syncInfo: bundleManager.BundleInfo = querySelfSync(all);
      expect(asyncInfo.name).assertEqual(syncInfo.name);
      expect(asyncInfo.signatureInfo.appId).assertEqual(syncInfo.signatureInfo.appId);
      expect(countBits(all)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0011 begin');
      const flagsSet: number[] = [0, WITH_APPLICATION_SPEC.bit, WITH_SIGNATURE_INFO_SPEC.bit, SIGNATURE_FLAGS];
      for (let i: number = 0; i < flagsSet.length; i++) {
        const asyncInfo: bundleManager.BundleInfo = await querySelf(flagsSet[i]);
        const syncInfo: bundleManager.BundleInfo = querySelfSync(flagsSet[i]);
        expect(asyncInfo.name).assertEqual(syncInfo.name);
        expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0012 begin');
      const a: number = WITH_APPLICATION_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit | WITH_HAP_MODULE_SPEC.bit;
      const b: number = WITH_HAP_MODULE_SPEC.bit | WITH_SIGNATURE_INFO_SPEC.bit | WITH_APPLICATION_SPEC.bit;
      expect(a).assertEqual(b);
      const infoA: bundleManager.BundleInfo = await querySelf(a);
      const infoB: bundleManager.BundleInfo = await querySelf(b);
      expect(infoA.name).assertEqual(infoB.name);
      expect(infoA.signatureInfo.fingerprint).assertEqual(infoB.signatureInfo.fingerprint);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagMatrix0012 end');
    });
  });
}
