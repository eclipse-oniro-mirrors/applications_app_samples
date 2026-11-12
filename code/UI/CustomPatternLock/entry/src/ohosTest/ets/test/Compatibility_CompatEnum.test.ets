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
const TAG: string = '[Sample_PatternLock_Compatibility]';

export default function CompatibilityCompatEnumTest() {
  describe('Compatibility_compatEnum', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testCompatEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0001 begin');
      const index: number = 0;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0001 end');
    });

    it('testCompatEnum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0002 begin');
      const index: number = 1;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0002 end');
    });

    it('testCompatEnum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0003 begin');
      const index: number = 2;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0003 end');
    });

    it('testCompatEnum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0004 begin');
      const index: number = 3;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0004 end');
    });

    it('testCompatEnum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0005 begin');
      const index: number = 4;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0005 end');
    });

    it('testCompatEnum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0006 begin');
      const index: number = 5;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0006 end');
    });

    it('testCompatEnum0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0007 begin');
      const index: number = 6;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0007 end');
    });

    it('testCompatEnum0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0008 begin');
      const index: number = 7;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0008 end');
    });

    it('testCompatEnum0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0009 begin');
      const index: number = 8;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0009 end');
    });

    it('testCompatEnum0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0010 begin');
      const index: number = 9;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0010 end');
    });

    it('testCompatEnum0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0011 begin');
      const index: number = 10;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0011 end');
    });

    it('testCompatEnum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0012 begin');
      const index: number = 11;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0012 end');
    });

    it('testCompatEnum0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0013 begin');
      const index: number = 12;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0013 end');
    });

    it('testCompatEnum0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0014 begin');
      const index: number = 13;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0014 end');
    });

    it('testCompatEnum0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0015 begin');
      const index: number = 14;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0015 end');
    });

    it('testCompatEnum0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0016 begin');
      const index: number = 15;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0016 end');
    });

    it('testCompatEnum0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0017 begin');
      const index: number = 16;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0017 end');
    });

    it('testCompatEnum0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0018 begin');
      const index: number = 17;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0018 end');
    });

    it('testCompatEnum0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0019 begin');
      const index: number = 18;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0019 end');
    });

    it('testCompatEnum0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0020 begin');
      const index: number = 19;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0020 end');
    });

    it('testCompatEnum0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0021 begin');
      const index: number = 20;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0021 end');
    });

    it('testCompatEnum0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0022 begin');
      const index: number = 21;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0022 end');
    });

    it('testCompatEnum0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0023 begin');
      const index: number = 22;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0023 end');
    });

    it('testCompatEnum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0024 begin');
      const index: number = 23;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0024 end');
    });

    it('testCompatEnum0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0025 begin');
      const index: number = 24;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0025 end');
    });

    it('testCompatEnum0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0026 begin');
      const index: number = 25;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0026 end');
    });

    it('testCompatEnum0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0027 begin');
      const index: number = 26;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0027 end');
    });

    it('testCompatEnum0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0028 begin');
      const index: number = 27;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0028 end');
    });

    it('testCompatEnum0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0029 begin');
      const index: number = 28;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0029 end');
    });

    it('testCompatEnum0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0030 begin');
      const index: number = 29;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0030 end');
    });

    it('testCompatEnum0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0031 begin');
      const index: number = 30;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0031 end');
    });

    it('testCompatEnum0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0032 begin');
      const index: number = 31;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0032 end');
    });

    it('testCompatEnum0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0033 begin');
      const index: number = 32;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0033 end');
    });

    it('testCompatEnum0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0034 begin');
      const index: number = 33;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0034 end');
    });

    it('testCompatEnum0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0035 begin');
      const index: number = 34;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0035 end');
    });

    it('testCompatEnum0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0036 begin');
      const index: number = 35;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0036 end');
    });

    it('testCompatEnum0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0037 begin');
      const index: number = 36;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0037 end');
    });

    it('testCompatEnum0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0038 begin');
      const index: number = 37;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0038 end');
    });

    it('testCompatEnum0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0039 begin');
      const index: number = 38;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0039 end');
    });

    it('testCompatEnum0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0040 begin');
      const index: number = 39;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0040 end');
    });

    it('testCompatEnum0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0041 begin');
      const index: number = 40;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0041 end');
    });

    it('testCompatEnum0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0042 begin');
      const index: number = 41;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0042 end');
    });

    it('testCompatEnum0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0043 begin');
      const index: number = 42;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0043 end');
    });

    it('testCompatEnum0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0044 begin');
      const index: number = 43;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0044 end');
    });

    it('testCompatEnum0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0045 begin');
      const index: number = 44;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0045 end');
    });

    it('testCompatEnum0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0046 begin');
      const index: number = 45;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0046 end');
    });

    it('testCompatEnum0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0047 begin');
      const index: number = 46;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0047 end');
    });

    it('testCompatEnum0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0048 begin');
      const index: number = 47;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0048 end');
    });

    it('testCompatEnum0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0049 begin');
      const index: number = 48;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0049 end');
    });

    it('testCompatEnum0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0050 begin');
      const index: number = 49;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0050 end');
    });

    it('testCompatEnum0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0051 begin');
      const index: number = 50;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0051 end');
    });

    it('testCompatEnum0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0052 begin');
      const index: number = 51;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0052 end');
    });

    it('testCompatEnum0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0053 begin');
      const index: number = 52;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0053 end');
    });

    it('testCompatEnum0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0054 begin');
      const index: number = 53;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0054 end');
    });

    it('testCompatEnum0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0055 begin');
      const index: number = 54;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0055 end');
    });

    it('testCompatEnum0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0056 begin');
      const index: number = 55;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0056 end');
    });

    it('testCompatEnum0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0057 begin');
      const index: number = 56;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0057 end');
    });

    it('testCompatEnum0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0058 begin');
      const index: number = 57;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0058 end');
    });

    it('testCompatEnum0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0059 begin');
      const index: number = 58;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0059 end');
    });

    it('testCompatEnum0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0060 begin');
      const index: number = 59;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0060 end');
    });

    it('testCompatEnum0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0061 begin');
      const index: number = 60;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0061 end');
    });

    it('testCompatEnum0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0062 begin');
      const index: number = 61;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0062 end');
    });

    it('testCompatEnum0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0063 begin');
      const index: number = 62;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0063 end');
    });

    it('testCompatEnum0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0064 begin');
      const index: number = 63;
      const correct: number = CustomPatternLockChallengeResult.CORRECT;
      const wrong: number = CustomPatternLockChallengeResult.WRONG;
      expect(correct).assertEqual(1);
      expect(wrong).assertEqual(2);
      expect(correct < wrong).assertTrue();
      expect(wrong > correct).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatEnum0064 end');
    });

  });
}