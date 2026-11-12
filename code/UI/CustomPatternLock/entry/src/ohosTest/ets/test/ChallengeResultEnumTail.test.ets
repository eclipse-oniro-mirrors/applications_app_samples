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
const TAG: string = '[Sample_PatternLock_ChallengeResultEnumTail]';


export default function challengeResultEnumTailTest() {
  describe('challengeResultEnumTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0193
     * @tc.name      testChallengeResultEnum0193
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0193 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0194
     * @tc.name      testChallengeResultEnum0194
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0194 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0195
     * @tc.name      testChallengeResultEnum0195
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0195 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0196
     * @tc.name      testChallengeResultEnum0196
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0196 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0197
     * @tc.name      testChallengeResultEnum0197
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0197 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0198
     * @tc.name      testChallengeResultEnum0198
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0198 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0199
     * @tc.name      testChallengeResultEnum0199
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0199 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0200
     * @tc.name      testChallengeResultEnum0200
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0200 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0201
     * @tc.name      testChallengeResultEnum0201
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0201 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0202
     * @tc.name      testChallengeResultEnum0202
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0202 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0203
     * @tc.name      testChallengeResultEnum0203
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0203 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0204
     * @tc.name      testChallengeResultEnum0204
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0204 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0205
     * @tc.name      testChallengeResultEnum0205
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0205 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0206
     * @tc.name      testChallengeResultEnum0206
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0206 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0207
     * @tc.name      testChallengeResultEnum0207
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0207 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0208
     * @tc.name      testChallengeResultEnum0208
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0208 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0209
     * @tc.name      testChallengeResultEnum0209
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0209 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0210
     * @tc.name      testChallengeResultEnum0210
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0210 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0211
     * @tc.name      testChallengeResultEnum0211
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0211 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0212
     * @tc.name      testChallengeResultEnum0212
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0212 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0213
     * @tc.name      testChallengeResultEnum0213
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0213 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0214
     * @tc.name      testChallengeResultEnum0214
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0214 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0215
     * @tc.name      testChallengeResultEnum0215
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0215 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0216
     * @tc.name      testChallengeResultEnum0216
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0216 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0217
     * @tc.name      testChallengeResultEnum0217
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0217 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0218
     * @tc.name      testChallengeResultEnum0218
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0218 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0219
     * @tc.name      testChallengeResultEnum0219
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0219 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0220
     * @tc.name      testChallengeResultEnum0220
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0220 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0221
     * @tc.name      testChallengeResultEnum0221
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0221 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0222
     * @tc.name      testChallengeResultEnum0222
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0222 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0223
     * @tc.name      testChallengeResultEnum0223
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0223 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0224
     * @tc.name      testChallengeResultEnum0224
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0224 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0225
     * @tc.name      testChallengeResultEnum0225
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0225 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0226
     * @tc.name      testChallengeResultEnum0226
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0226 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0227
     * @tc.name      testChallengeResultEnum0227
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0227 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0228
     * @tc.name      testChallengeResultEnum0228
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0228 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0229
     * @tc.name      testChallengeResultEnum0229
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0229 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0230
     * @tc.name      testChallengeResultEnum0230
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0230 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0231
     * @tc.name      testChallengeResultEnum0231
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0231 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0232
     * @tc.name      testChallengeResultEnum0232
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0232 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0233
     * @tc.name      testChallengeResultEnum0233
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0233 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0234
     * @tc.name      testChallengeResultEnum0234
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0234 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0235
     * @tc.name      testChallengeResultEnum0235
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0235 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0236
     * @tc.name      testChallengeResultEnum0236
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0236 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0237
     * @tc.name      testChallengeResultEnum0237
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0237 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0238
     * @tc.name      testChallengeResultEnum0238
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0238 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0239
     * @tc.name      testChallengeResultEnum0239
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0239 begin');
      const index: number = 238;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0239 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0240
     * @tc.name      testChallengeResultEnum0240
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0240 begin');
      const index: number = 239;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0240 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0241
     * @tc.name      testChallengeResultEnum0241
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0241 begin');
      const index: number = 240;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0241 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0242
     * @tc.name      testChallengeResultEnum0242
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0242 begin');
      const index: number = 241;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0242 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0243
     * @tc.name      testChallengeResultEnum0243
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0243 begin');
      const index: number = 242;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0243 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0244
     * @tc.name      testChallengeResultEnum0244
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0244 begin');
      const index: number = 243;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0244 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0245
     * @tc.name      testChallengeResultEnum0245
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0245 begin');
      const index: number = 244;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0245 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0246
     * @tc.name      testChallengeResultEnum0246
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0246 begin');
      const index: number = 245;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0246 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0247
     * @tc.name      testChallengeResultEnum0247
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0247 begin');
      const index: number = 246;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0247 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0248
     * @tc.name      testChallengeResultEnum0248
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0248 begin');
      const index: number = 247;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0248 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0249
     * @tc.name      testChallengeResultEnum0249
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0249 begin');
      const index: number = 248;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0249 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0250
     * @tc.name      testChallengeResultEnum0250
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0250 begin');
      const index: number = 249;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0250 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0251
     * @tc.name      testChallengeResultEnum0251
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0251 begin');
      const index: number = 250;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0251 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0252
     * @tc.name      testChallengeResultEnum0252
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 251.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0252 begin');
      const index: number = 251;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0252 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0253
     * @tc.name      testChallengeResultEnum0253
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 252.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0253 begin');
      const index: number = 252;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0253 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0254
     * @tc.name      testChallengeResultEnum0254
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 253.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0254 begin');
      const index: number = 253;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0254 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0255
     * @tc.name      testChallengeResultEnum0255
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 254.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0255 begin');
      const index: number = 254;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0255 end');
    })

    /**
     * @tc.number    SUB_PATTERN_RESULT_ENUM_0256
     * @tc.name      testChallengeResultEnum0256
     * @tc.desc      Verify challengeResultEnum behavior for matrix index 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testChallengeResultEnum0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0256 begin');
      const index: number = 255;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChallengeResultEnum0256 end');
    })

  })
}
