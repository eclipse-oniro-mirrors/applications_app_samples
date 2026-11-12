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
import { paceTurn } from './shared/TestPace';
import { FLAG_BITS, flagsForIndex, hasFlag } from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_FlagCompat]';

export default function bundleFlagCompatMatrixTest() {
  describe('bundleFlagCompatMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0100
     * @tc.name testFlagCompatApplication
     * @tc.desc Verify APPLICATION bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatApplication', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatApplication begin');
      const flags: number = flagsForIndex(1 << 0);
      expect(flags).assertEqual(FLAG_BITS[0]);
      expect(hasFlag(flags, FLAG_BITS[0])).assertTrue();
      for (let j: number = 1; j < FLAG_BITS.length; j++) {
        expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatApplication end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0200
     * @tc.name testFlagCompatHapModule
     * @tc.desc Verify HAP_MODULE bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatHapModule', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatHapModule begin');
      const flags: number = flagsForIndex(1 << 1);
      expect(flags).assertEqual(FLAG_BITS[1]);
      expect(hasFlag(flags, FLAG_BITS[1])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 1) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatHapModule end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0300
     * @tc.name testFlagCompatAbility
     * @tc.desc Verify ABILITY bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatAbility', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatAbility begin');
      const flags: number = flagsForIndex(1 << 2);
      expect(flags).assertEqual(FLAG_BITS[2]);
      expect(hasFlag(flags, FLAG_BITS[2])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 2) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatAbility end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0400
     * @tc.name testFlagCompatExtension
     * @tc.desc Verify EXTENSION bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatExtension', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatExtension begin');
      const flags: number = flagsForIndex(1 << 3);
      expect(flags).assertEqual(FLAG_BITS[3]);
      expect(hasFlag(flags, FLAG_BITS[3])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 3) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatExtension end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0500
     * @tc.name testFlagCompatPermission
     * @tc.desc Verify PERMISSION bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatPermission', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatPermission begin');
      const flags: number = flagsForIndex(1 << 4);
      expect(flags).assertEqual(FLAG_BITS[4]);
      expect(hasFlag(flags, FLAG_BITS[4])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 4) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatPermission end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0600
     * @tc.name testFlagCompatMetadata
     * @tc.desc Verify METADATA bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatMetadata', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatMetadata begin');
      const flags: number = flagsForIndex(1 << 5);
      expect(flags).assertEqual(FLAG_BITS[5]);
      expect(hasFlag(flags, FLAG_BITS[5])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 5) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatMetadata end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0700
     * @tc.name testFlagCompatDisable
     * @tc.desc Verify DISABLE bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatDisable', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatDisable begin');
      const flags: number = flagsForIndex(1 << 6);
      expect(flags).assertEqual(FLAG_BITS[6]);
      expect(hasFlag(flags, FLAG_BITS[6])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 6) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatDisable end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0800
     * @tc.name testFlagCompatSignature
     * @tc.desc Verify SIGNATURE bit maps to its documented value and no other bit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatSignature', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatSignature begin');
      const flags: number = flagsForIndex(1 << 7);
      expect(flags).assertEqual(FLAG_BITS[7]);
      expect(hasFlag(flags, FLAG_BITS[7])).assertTrue();
      for (let j: number = 0; j < FLAG_BITS.length; j++) {
        if (j !== 7) {
          expect(hasFlag(flags, FLAG_BITS[j])).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatSignature end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_FLAG_COMPAT_0900
     * @tc.name testFlagCompatAllAndNone
     * @tc.desc Verify flagsForIndex maps 0 to none and 255 to all documented bits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFlagCompatAllAndNone', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatAllAndNone begin');
      expect(flagsForIndex(0)).assertEqual(0);
      const all: number = flagsForIndex(255);
      for (let i: number = 0; i < FLAG_BITS.length; i++) {
        expect(hasFlag(all, FLAG_BITS[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagCompatAllAndNone end');
    });
  })
}
