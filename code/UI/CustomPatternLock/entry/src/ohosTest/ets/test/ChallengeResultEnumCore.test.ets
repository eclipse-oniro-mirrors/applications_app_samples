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
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_ChallengeResultEnumCore]';


export default function challengeResultEnumCoreTest() {
  describe('challengeResultEnumCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0001
     * @tc.name      testChallengeResultEnum0001
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0001 begin');
      const index: number = 0;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0001 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0002
     * @tc.name      testChallengeResultEnum0002
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0002 begin');
      const index: number = 1;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0002 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0003
     * @tc.name      testChallengeResultEnum0003
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0003 begin');
      const index: number = 2;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0003 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0004
     * @tc.name      testChallengeResultEnum0004
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0004 begin');
      const index: number = 3;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0004 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0005
     * @tc.name      testChallengeResultEnum0005
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0005 begin');
      const index: number = 4;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0005 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0006
     * @tc.name      testChallengeResultEnum0006
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0006 begin');
      const index: number = 5;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0006 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0007
     * @tc.name      testChallengeResultEnum0007
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0007 begin');
      const index: number = 6;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0007 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0008
     * @tc.name      testChallengeResultEnum0008
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0008 begin');
      const index: number = 7;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0008 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0009
     * @tc.name      testChallengeResultEnum0009
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0009 begin');
      const index: number = 8;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0009 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0010
     * @tc.name      testChallengeResultEnum0010
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0010 begin');
      const index: number = 9;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0010 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0011
     * @tc.name      testChallengeResultEnum0011
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0011 begin');
      const index: number = 10;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0011 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0012
     * @tc.name      testChallengeResultEnum0012
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0012 begin');
      const index: number = 11;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0012 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0013
     * @tc.name      testChallengeResultEnum0013
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0013 begin');
      const index: number = 12;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0013 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0014
     * @tc.name      testChallengeResultEnum0014
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0014 begin');
      const index: number = 13;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0014 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0015
     * @tc.name      testChallengeResultEnum0015
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0015 begin');
      const index: number = 14;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0015 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0016
     * @tc.name      testChallengeResultEnum0016
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0016 begin');
      const index: number = 15;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0016 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0017
     * @tc.name      testChallengeResultEnum0017
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0017 begin');
      const index: number = 16;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0017 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0018
     * @tc.name      testChallengeResultEnum0018
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0018 begin');
      const index: number = 17;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0018 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0019
     * @tc.name      testChallengeResultEnum0019
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0019 begin');
      const index: number = 18;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0019 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0020
     * @tc.name      testChallengeResultEnum0020
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0020 begin');
      const index: number = 19;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0020 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0021
     * @tc.name      testChallengeResultEnum0021
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0021 begin');
      const index: number = 20;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0021 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0022
     * @tc.name      testChallengeResultEnum0022
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0022 begin');
      const index: number = 21;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0022 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0023
     * @tc.name      testChallengeResultEnum0023
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0023 begin');
      const index: number = 22;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0023 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0024
     * @tc.name      testChallengeResultEnum0024
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0024 begin');
      const index: number = 23;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0024 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0025
     * @tc.name      testChallengeResultEnum0025
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0025 begin');
      const index: number = 24;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0025 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0026
     * @tc.name      testChallengeResultEnum0026
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0026 begin');
      const index: number = 25;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0026 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0027
     * @tc.name      testChallengeResultEnum0027
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0027 begin');
      const index: number = 26;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0027 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0028
     * @tc.name      testChallengeResultEnum0028
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0028 begin');
      const index: number = 27;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0028 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0029
     * @tc.name      testChallengeResultEnum0029
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0029 begin');
      const index: number = 28;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0029 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0030
     * @tc.name      testChallengeResultEnum0030
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0030 begin');
      const index: number = 29;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0030 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0031
     * @tc.name      testChallengeResultEnum0031
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0031 begin');
      const index: number = 30;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0031 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0032
     * @tc.name      testChallengeResultEnum0032
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0032 begin');
      const index: number = 31;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0032 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0033
     * @tc.name      testChallengeResultEnum0033
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0033 begin');
      const index: number = 32;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0033 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0034
     * @tc.name      testChallengeResultEnum0034
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0034 begin');
      const index: number = 33;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0034 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0035
     * @tc.name      testChallengeResultEnum0035
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0035 begin');
      const index: number = 34;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0035 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0036
     * @tc.name      testChallengeResultEnum0036
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0036 begin');
      const index: number = 35;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0036 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0037
     * @tc.name      testChallengeResultEnum0037
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0037 begin');
      const index: number = 36;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0037 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0038
     * @tc.name      testChallengeResultEnum0038
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0038 begin');
      const index: number = 37;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0038 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0039
     * @tc.name      testChallengeResultEnum0039
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0039 begin');
      const index: number = 38;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0039 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0040
     * @tc.name      testChallengeResultEnum0040
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0040 begin');
      const index: number = 39;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0040 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0041
     * @tc.name      testChallengeResultEnum0041
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0041 begin');
      const index: number = 40;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0041 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0042
     * @tc.name      testChallengeResultEnum0042
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0042 begin');
      const index: number = 41;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0042 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0043
     * @tc.name      testChallengeResultEnum0043
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0043 begin');
      const index: number = 42;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0043 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0044
     * @tc.name      testChallengeResultEnum0044
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0044 begin');
      const index: number = 43;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0044 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0045
     * @tc.name      testChallengeResultEnum0045
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0045 begin');
      const index: number = 44;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0045 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0046
     * @tc.name      testChallengeResultEnum0046
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0046 begin');
      const index: number = 45;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0046 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0047
     * @tc.name      testChallengeResultEnum0047
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0047 begin');
      const index: number = 46;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0047 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0048
     * @tc.name      testChallengeResultEnum0048
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0048 begin');
      const index: number = 47;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0048 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0049
     * @tc.name      testChallengeResultEnum0049
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0049 begin');
      const index: number = 48;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0049 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0050
     * @tc.name      testChallengeResultEnum0050
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0050 begin');
      const index: number = 49;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0050 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0051
     * @tc.name      testChallengeResultEnum0051
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0051 begin');
      const index: number = 50;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0051 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0052
     * @tc.name      testChallengeResultEnum0052
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0052 begin');
      const index: number = 51;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0052 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0053
     * @tc.name      testChallengeResultEnum0053
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0053 begin');
      const index: number = 52;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0053 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0054
     * @tc.name      testChallengeResultEnum0054
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0054 begin');
      const index: number = 53;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0054 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0055
     * @tc.name      testChallengeResultEnum0055
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0055 begin');
      const index: number = 54;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0055 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0056
     * @tc.name      testChallengeResultEnum0056
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0056 begin');
      const index: number = 55;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0056 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0057
     * @tc.name      testChallengeResultEnum0057
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0057 begin');
      const index: number = 56;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0057 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0058
     * @tc.name      testChallengeResultEnum0058
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0058 begin');
      const index: number = 57;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0058 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0059
     * @tc.name      testChallengeResultEnum0059
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0059 begin');
      const index: number = 58;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0059 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0060
     * @tc.name      testChallengeResultEnum0060
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0060 begin');
      const index: number = 59;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0060 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0061
     * @tc.name      testChallengeResultEnum0061
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0061 begin');
      const index: number = 60;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0061 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0062
     * @tc.name      testChallengeResultEnum0062
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0062 begin');
      const index: number = 61;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0062 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0063
     * @tc.name      testChallengeResultEnum0063
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0063 begin');
      const index: number = 62;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0063 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0064
     * @tc.name      testChallengeResultEnum0064
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0064 begin');
      const index: number = 63;
      const isCorrect: boolean = index % 2 === 0;
      const value: CustomPatternLockChallengeResult = isCorrect ?
        CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(isCorrect ? 1 : 2);
      const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
      const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
      expect(correctValue).assertEqual(1);
      expect(wrongValue).assertEqual(2);
      expect(correctValue === wrongValue).assertFalse();
      expect(correctValue < wrongValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0064 end');
    })

  })
}
