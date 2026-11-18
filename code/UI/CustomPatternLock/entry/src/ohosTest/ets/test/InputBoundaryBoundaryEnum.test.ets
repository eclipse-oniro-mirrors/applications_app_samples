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
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_InputBoundary]';

export default function InputBoundaryBoundaryEnumTest() {
  describe('InputBoundaryBoundaryEnum', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testBoundaryEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0001 begin');
      const index: number = 0;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0001 end');
    });

    it('testBoundaryEnum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0002 begin');
      const index: number = 1;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0002 end');
    });

    it('testBoundaryEnum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0003 begin');
      const index: number = 2;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0003 end');
    });

    it('testBoundaryEnum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0004 begin');
      const index: number = 3;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0004 end');
    });

    it('testBoundaryEnum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0005 begin');
      const index: number = 4;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0005 end');
    });

    it('testBoundaryEnum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0006 begin');
      const index: number = 5;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0006 end');
    });

    it('testBoundaryEnum0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0007 begin');
      const index: number = 6;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0007 end');
    });

    it('testBoundaryEnum0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0008 begin');
      const index: number = 7;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0008 end');
    });

    it('testBoundaryEnum0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0009 begin');
      const index: number = 8;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0009 end');
    });

    it('testBoundaryEnum0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0010 begin');
      const index: number = 9;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0010 end');
    });

    it('testBoundaryEnum0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0011 begin');
      const index: number = 10;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0011 end');
    });

    it('testBoundaryEnum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0012 begin');
      const index: number = 11;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0012 end');
    });

    it('testBoundaryEnum0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0013 begin');
      const index: number = 12;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0013 end');
    });

    it('testBoundaryEnum0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0014 begin');
      const index: number = 13;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0014 end');
    });

    it('testBoundaryEnum0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0015 begin');
      const index: number = 14;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0015 end');
    });

    it('testBoundaryEnum0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0016 begin');
      const index: number = 15;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0016 end');
    });

    it('testBoundaryEnum0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0017 begin');
      const index: number = 16;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0017 end');
    });

    it('testBoundaryEnum0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0018 begin');
      const index: number = 17;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0018 end');
    });

    it('testBoundaryEnum0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0019 begin');
      const index: number = 18;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0019 end');
    });

    it('testBoundaryEnum0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0020 begin');
      const index: number = 19;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0020 end');
    });

    it('testBoundaryEnum0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0021 begin');
      const index: number = 20;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0021 end');
    });

    it('testBoundaryEnum0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0022 begin');
      const index: number = 21;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0022 end');
    });

    it('testBoundaryEnum0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0023 begin');
      const index: number = 22;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0023 end');
    });

    it('testBoundaryEnum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0024 begin');
      const index: number = 23;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0024 end');
    });

    it('testBoundaryEnum0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0025 begin');
      const index: number = 24;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0025 end');
    });

    it('testBoundaryEnum0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0026 begin');
      const index: number = 25;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0026 end');
    });

    it('testBoundaryEnum0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0027 begin');
      const index: number = 26;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0027 end');
    });

    it('testBoundaryEnum0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0028 begin');
      const index: number = 27;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0028 end');
    });

    it('testBoundaryEnum0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0029 begin');
      const index: number = 28;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0029 end');
    });

    it('testBoundaryEnum0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0030 begin');
      const index: number = 29;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0030 end');
    });

    it('testBoundaryEnum0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0031 begin');
      const index: number = 30;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0031 end');
    });

    it('testBoundaryEnum0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0032 begin');
      const index: number = 31;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0032 end');
    });

    it('testBoundaryEnum0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0033 begin');
      const index: number = 32;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0033 end');
    });

    it('testBoundaryEnum0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0034 begin');
      const index: number = 33;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0034 end');
    });

    it('testBoundaryEnum0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0035 begin');
      const index: number = 34;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0035 end');
    });

    it('testBoundaryEnum0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0036 begin');
      const index: number = 35;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0036 end');
    });

    it('testBoundaryEnum0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0037 begin');
      const index: number = 36;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0037 end');
    });

    it('testBoundaryEnum0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0038 begin');
      const index: number = 37;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0038 end');
    });

    it('testBoundaryEnum0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0039 begin');
      const index: number = 38;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0039 end');
    });

    it('testBoundaryEnum0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0040 begin');
      const index: number = 39;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0040 end');
    });

    it('testBoundaryEnum0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0041 begin');
      const index: number = 40;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0041 end');
    });

    it('testBoundaryEnum0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0042 begin');
      const index: number = 41;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0042 end');
    });

    it('testBoundaryEnum0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0043 begin');
      const index: number = 42;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0043 end');
    });

    it('testBoundaryEnum0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0044 begin');
      const index: number = 43;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0044 end');
    });

    it('testBoundaryEnum0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0045 begin');
      const index: number = 44;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0045 end');
    });

    it('testBoundaryEnum0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0046 begin');
      const index: number = 45;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0046 end');
    });

    it('testBoundaryEnum0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0047 begin');
      const index: number = 46;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0047 end');
    });

    it('testBoundaryEnum0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0048 begin');
      const index: number = 47;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0048 end');
    });

    it('testBoundaryEnum0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0049 begin');
      const index: number = 48;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0049 end');
    });

    it('testBoundaryEnum0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0050 begin');
      const index: number = 49;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0050 end');
    });

    it('testBoundaryEnum0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0051 begin');
      const index: number = 50;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0051 end');
    });

    it('testBoundaryEnum0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0052 begin');
      const index: number = 51;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0052 end');
    });

    it('testBoundaryEnum0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0053 begin');
      const index: number = 52;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0053 end');
    });

    it('testBoundaryEnum0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0054 begin');
      const index: number = 53;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0054 end');
    });

    it('testBoundaryEnum0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0055 begin');
      const index: number = 54;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0055 end');
    });

    it('testBoundaryEnum0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0056 begin');
      const index: number = 55;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0056 end');
    });

    it('testBoundaryEnum0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0057 begin');
      const index: number = 56;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0057 end');
    });

    it('testBoundaryEnum0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0058 begin');
      const index: number = 57;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0058 end');
    });

    it('testBoundaryEnum0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0059 begin');
      const index: number = 58;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0059 end');
    });

    it('testBoundaryEnum0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0060 begin');
      const index: number = 59;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0060 end');
    });

    it('testBoundaryEnum0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0061 begin');
      const index: number = 60;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0061 end');
    });

    it('testBoundaryEnum0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0062 begin');
      const index: number = 61;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0062 end');
    });

    it('testBoundaryEnum0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0063 begin');
      const index: number = 62;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0063 end');
    });

    it('testBoundaryEnum0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0064 begin');
      const index: number = 63;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct === wrong).assertFalse();
      expect(typeof correct).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryEnum0064 end');
    });

  });
}