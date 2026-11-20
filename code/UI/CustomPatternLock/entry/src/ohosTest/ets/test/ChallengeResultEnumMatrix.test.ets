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
import { MATRIX_CASES, MatrixCase } from './shared/MatrixCases';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_ChallengeResultEnumMatrix]';


export default function challengeResultEnumMatrixTest() {
  describe('challengeResultEnumMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_challengeResultEnumMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_challengeResultEnumMatrix_' + c.name + ' begin');
        const isCorrect: boolean = c.index % 2 === 0;
        const value: CustomPatternLockChallengeResult = isCorrect ?
          CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
        const correctValue: number = CustomPatternLockChallengeResult.CORRECT;
        const wrongValue: number = CustomPatternLockChallengeResult.WRONG;
        expect(typeof value).assertEqual('number');
        expect(value).assertEqual(isCorrect ? 1 : 2);
        expect(correctValue).assertEqual(1);
        expect(wrongValue).assertEqual(2);
        expect(correctValue === wrongValue).assertFalse();
        expect(correctValue < wrongValue).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_challengeResultEnumMatrix_' + c.name + ' end');
      });
    });
  });
}
