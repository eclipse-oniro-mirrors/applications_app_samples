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
const TAG: string = '[Sample_PatternLock_ChallengeResultEnumAdvanced]';


export default function challengeResultEnumAdvancedTest() {
  describe('challengeResultEnumAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0129
     * @tc.name      testChallengeResultEnum0129
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0129 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0130
     * @tc.name      testChallengeResultEnum0130
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0130 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0131
     * @tc.name      testChallengeResultEnum0131
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0131 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0132
     * @tc.name      testChallengeResultEnum0132
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0132 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0133
     * @tc.name      testChallengeResultEnum0133
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0133 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0134
     * @tc.name      testChallengeResultEnum0134
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0134 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0135
     * @tc.name      testChallengeResultEnum0135
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0135 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0136
     * @tc.name      testChallengeResultEnum0136
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0136 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0137
     * @tc.name      testChallengeResultEnum0137
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0137 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0138
     * @tc.name      testChallengeResultEnum0138
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0138 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0139
     * @tc.name      testChallengeResultEnum0139
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0139 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0140
     * @tc.name      testChallengeResultEnum0140
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0140 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0141
     * @tc.name      testChallengeResultEnum0141
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0141 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0142
     * @tc.name      testChallengeResultEnum0142
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0142 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0143
     * @tc.name      testChallengeResultEnum0143
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0143 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0144
     * @tc.name      testChallengeResultEnum0144
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0144 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0145
     * @tc.name      testChallengeResultEnum0145
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0145 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0146
     * @tc.name      testChallengeResultEnum0146
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0146 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0147
     * @tc.name      testChallengeResultEnum0147
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0147 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0148
     * @tc.name      testChallengeResultEnum0148
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0148 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0149
     * @tc.name      testChallengeResultEnum0149
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0149 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0150
     * @tc.name      testChallengeResultEnum0150
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0150 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0151
     * @tc.name      testChallengeResultEnum0151
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0151 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0152
     * @tc.name      testChallengeResultEnum0152
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0152 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0153
     * @tc.name      testChallengeResultEnum0153
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0153 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0154
     * @tc.name      testChallengeResultEnum0154
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0154 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0155
     * @tc.name      testChallengeResultEnum0155
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0155 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0156
     * @tc.name      testChallengeResultEnum0156
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0156 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0157
     * @tc.name      testChallengeResultEnum0157
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0157 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0158
     * @tc.name      testChallengeResultEnum0158
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0158 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0159
     * @tc.name      testChallengeResultEnum0159
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0159 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0160
     * @tc.name      testChallengeResultEnum0160
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0160 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0161
     * @tc.name      testChallengeResultEnum0161
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0161 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0162
     * @tc.name      testChallengeResultEnum0162
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0162 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0163
     * @tc.name      testChallengeResultEnum0163
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0163 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0164
     * @tc.name      testChallengeResultEnum0164
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0164 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0165
     * @tc.name      testChallengeResultEnum0165
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0165 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0166
     * @tc.name      testChallengeResultEnum0166
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0166 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0167
     * @tc.name      testChallengeResultEnum0167
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0167 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0168
     * @tc.name      testChallengeResultEnum0168
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0168 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0169
     * @tc.name      testChallengeResultEnum0169
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0169 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0170
     * @tc.name      testChallengeResultEnum0170
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0170 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0171
     * @tc.name      testChallengeResultEnum0171
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0171 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0172
     * @tc.name      testChallengeResultEnum0172
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0172 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0173
     * @tc.name      testChallengeResultEnum0173
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0173 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0174
     * @tc.name      testChallengeResultEnum0174
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0174 begin');
      const index: number = 173;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0174 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0175
     * @tc.name      testChallengeResultEnum0175
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0175 begin');
      const index: number = 174;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0175 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0176
     * @tc.name      testChallengeResultEnum0176
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0176 begin');
      const index: number = 175;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0176 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0177
     * @tc.name      testChallengeResultEnum0177
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0177 begin');
      const index: number = 176;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0177 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0178
     * @tc.name      testChallengeResultEnum0178
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0178 begin');
      const index: number = 177;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0178 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0179
     * @tc.name      testChallengeResultEnum0179
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0179 begin');
      const index: number = 178;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0179 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0180
     * @tc.name      testChallengeResultEnum0180
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0180 begin');
      const index: number = 179;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0180 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0181
     * @tc.name      testChallengeResultEnum0181
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0181 begin');
      const index: number = 180;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0181 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0182
     * @tc.name      testChallengeResultEnum0182
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0182 begin');
      const index: number = 181;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0182 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0183
     * @tc.name      testChallengeResultEnum0183
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0183 begin');
      const index: number = 182;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0183 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0184
     * @tc.name      testChallengeResultEnum0184
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0184 begin');
      const index: number = 183;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0184 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0185
     * @tc.name      testChallengeResultEnum0185
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0185 begin');
      const index: number = 184;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0185 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0186
     * @tc.name      testChallengeResultEnum0186
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0186 begin');
      const index: number = 185;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0186 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0187
     * @tc.name      testChallengeResultEnum0187
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0187 begin');
      const index: number = 186;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0187 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0188
     * @tc.name      testChallengeResultEnum0188
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0188 begin');
      const index: number = 187;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0188 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0189
     * @tc.name      testChallengeResultEnum0189
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0189 begin');
      const index: number = 188;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0189 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0190
     * @tc.name      testChallengeResultEnum0190
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0190 begin');
      const index: number = 189;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0190 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0191
     * @tc.name      testChallengeResultEnum0191
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0191 begin');
      const index: number = 190;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0191 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0192
     * @tc.name      testChallengeResultEnum0192
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0192 begin');
      const index: number = 191;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0192 end');
    })

  })
}
