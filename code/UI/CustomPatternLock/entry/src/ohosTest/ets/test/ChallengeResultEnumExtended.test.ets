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
const TAG: string = '[Sample_PatternLock_ChallengeResultEnumExtended]';


export default function challengeResultEnumExtendedTest() {
  describe('challengeResultEnumExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0065
     * @tc.name      testChallengeResultEnum0065
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0065 begin');
      const index: number = 64;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0065 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0066
     * @tc.name      testChallengeResultEnum0066
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0066 begin');
      const index: number = 65;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0066 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0067
     * @tc.name      testChallengeResultEnum0067
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0067 begin');
      const index: number = 66;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0067 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0068
     * @tc.name      testChallengeResultEnum0068
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0068 begin');
      const index: number = 67;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0068 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0069
     * @tc.name      testChallengeResultEnum0069
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0069 begin');
      const index: number = 68;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0069 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0070
     * @tc.name      testChallengeResultEnum0070
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0070 begin');
      const index: number = 69;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0070 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0071
     * @tc.name      testChallengeResultEnum0071
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0071 begin');
      const index: number = 70;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0071 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0072
     * @tc.name      testChallengeResultEnum0072
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0072 begin');
      const index: number = 71;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0072 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0073
     * @tc.name      testChallengeResultEnum0073
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0073 begin');
      const index: number = 72;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0073 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0074
     * @tc.name      testChallengeResultEnum0074
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0074 begin');
      const index: number = 73;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0074 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0075
     * @tc.name      testChallengeResultEnum0075
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0075 begin');
      const index: number = 74;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0075 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0076
     * @tc.name      testChallengeResultEnum0076
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0076 begin');
      const index: number = 75;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0076 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0077
     * @tc.name      testChallengeResultEnum0077
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0077 begin');
      const index: number = 76;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0077 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0078
     * @tc.name      testChallengeResultEnum0078
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0078 begin');
      const index: number = 77;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0078 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0079
     * @tc.name      testChallengeResultEnum0079
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0079 begin');
      const index: number = 78;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0079 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0080
     * @tc.name      testChallengeResultEnum0080
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0080 begin');
      const index: number = 79;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0080 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0081
     * @tc.name      testChallengeResultEnum0081
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0081 begin');
      const index: number = 80;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0081 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0082
     * @tc.name      testChallengeResultEnum0082
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0082 begin');
      const index: number = 81;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0082 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0083
     * @tc.name      testChallengeResultEnum0083
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0083 begin');
      const index: number = 82;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0083 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0084
     * @tc.name      testChallengeResultEnum0084
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0084 begin');
      const index: number = 83;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0084 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0085
     * @tc.name      testChallengeResultEnum0085
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0085 begin');
      const index: number = 84;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0085 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0086
     * @tc.name      testChallengeResultEnum0086
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0086 begin');
      const index: number = 85;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0086 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0087
     * @tc.name      testChallengeResultEnum0087
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0087 begin');
      const index: number = 86;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0087 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0088
     * @tc.name      testChallengeResultEnum0088
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0088 begin');
      const index: number = 87;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0088 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0089
     * @tc.name      testChallengeResultEnum0089
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0089 begin');
      const index: number = 88;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0089 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0090
     * @tc.name      testChallengeResultEnum0090
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0090 begin');
      const index: number = 89;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0090 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0091
     * @tc.name      testChallengeResultEnum0091
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0091 begin');
      const index: number = 90;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0091 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0092
     * @tc.name      testChallengeResultEnum0092
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0092 begin');
      const index: number = 91;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0092 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0093
     * @tc.name      testChallengeResultEnum0093
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0093 begin');
      const index: number = 92;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0093 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0094
     * @tc.name      testChallengeResultEnum0094
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0094 begin');
      const index: number = 93;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0094 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0095
     * @tc.name      testChallengeResultEnum0095
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0095 begin');
      const index: number = 94;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0095 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0096
     * @tc.name      testChallengeResultEnum0096
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0096 begin');
      const index: number = 95;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0096 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0097
     * @tc.name      testChallengeResultEnum0097
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0097 begin');
      const index: number = 96;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0097 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0098
     * @tc.name      testChallengeResultEnum0098
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0098 begin');
      const index: number = 97;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0098 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0099
     * @tc.name      testChallengeResultEnum0099
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0099 begin');
      const index: number = 98;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0099 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0100
     * @tc.name      testChallengeResultEnum0100
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0100 begin');
      const index: number = 99;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0100 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0101
     * @tc.name      testChallengeResultEnum0101
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0101 begin');
      const index: number = 100;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0101 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0102
     * @tc.name      testChallengeResultEnum0102
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0102 begin');
      const index: number = 101;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0102 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0103
     * @tc.name      testChallengeResultEnum0103
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0103 begin');
      const index: number = 102;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0103 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0104
     * @tc.name      testChallengeResultEnum0104
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0104 begin');
      const index: number = 103;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0104 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0105
     * @tc.name      testChallengeResultEnum0105
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0105 begin');
      const index: number = 104;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0105 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0106
     * @tc.name      testChallengeResultEnum0106
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0106 begin');
      const index: number = 105;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0106 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0107
     * @tc.name      testChallengeResultEnum0107
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0107 begin');
      const index: number = 106;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0107 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0108
     * @tc.name      testChallengeResultEnum0108
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0108 begin');
      const index: number = 107;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0108 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0109
     * @tc.name      testChallengeResultEnum0109
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0109 begin');
      const index: number = 108;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0109 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0110
     * @tc.name      testChallengeResultEnum0110
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0110 begin');
      const index: number = 109;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0110 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0111
     * @tc.name      testChallengeResultEnum0111
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0111 begin');
      const index: number = 110;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0111 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0112
     * @tc.name      testChallengeResultEnum0112
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0112 begin');
      const index: number = 111;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0112 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0113
     * @tc.name      testChallengeResultEnum0113
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0113 begin');
      const index: number = 112;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0113 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0114
     * @tc.name      testChallengeResultEnum0114
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0114 begin');
      const index: number = 113;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0114 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0115
     * @tc.name      testChallengeResultEnum0115
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0115 begin');
      const index: number = 114;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0115 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0116
     * @tc.name      testChallengeResultEnum0116
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0116 begin');
      const index: number = 115;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0116 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0117
     * @tc.name      testChallengeResultEnum0117
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0117 begin');
      const index: number = 116;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0117 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0118
     * @tc.name      testChallengeResultEnum0118
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0118 begin');
      const index: number = 117;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0118 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0119
     * @tc.name      testChallengeResultEnum0119
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0119 begin');
      const index: number = 118;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0119 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0120
     * @tc.name      testChallengeResultEnum0120
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0120 begin');
      const index: number = 119;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0120 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0121
     * @tc.name      testChallengeResultEnum0121
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0121 begin');
      const index: number = 120;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0121 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0122
     * @tc.name      testChallengeResultEnum0122
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0122 begin');
      const index: number = 121;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0122 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0123
     * @tc.name      testChallengeResultEnum0123
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0123 begin');
      const index: number = 122;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0123 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0124
     * @tc.name      testChallengeResultEnum0124
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0124 begin');
      const index: number = 123;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0124 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0125
     * @tc.name      testChallengeResultEnum0125
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0125 begin');
      const index: number = 124;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0125 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0126
     * @tc.name      testChallengeResultEnum0126
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0126 begin');
      const index: number = 125;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0126 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0127
     * @tc.name      testChallengeResultEnum0127
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0127 begin');
      const index: number = 126;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0127 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0128
     * @tc.name      testChallengeResultEnum0128
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0128 begin');
      const index: number = 127;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0128 end');
    })

  })
}
