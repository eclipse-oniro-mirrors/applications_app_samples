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
const TAG: string = '[Sample_PatternLock_ControllerIsolationMatrix]';


export default function controllerIsolationMatrixTest() {
  describe('controllerIsolationMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_controllerIsolationMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerIsolationMatrix_' + c.name + ' begin');
        const first: CustomPatternLockController = new CustomPatternLockController();
        const second: CustomPatternLockController = new CustomPatternLockController();
        let firstReset: number = 0;
        let secondReset: number = 0;
        let firstResult: number = 0;
        let secondResult: number = 0;
        first.registerResetCallback(() => {
          firstReset++;
        });
        second.registerResetCallback(() => {
          secondReset++;
        });
        first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          firstResult = result;
        });
        second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          secondResult = result;
        });
        const op: number = c.index % 6;
        let expFirstReset: number = 0;
        let expSecondReset: number = 0;
        let expFirstResult: number = 0;
        let expSecondResult: number = 0;
        if (op === 0) {
          first.reset();
          expFirstReset = 1;
        } else if (op === 1) {
          second.reset();
          expSecondReset = 1;
        } else if (op === 2) {
          first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
          expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        } else if (op === 3) {
          second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
          expSecondResult = CustomPatternLockChallengeResult.WRONG;
        } else if (op === 4) {
          first.reset();
          second.reset();
          expFirstReset = 1;
          expSecondReset = 1;
        } else {
          first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
          second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
          expFirstResult = CustomPatternLockChallengeResult.CORRECT;
          expSecondResult = CustomPatternLockChallengeResult.WRONG;
        }
        expect(firstReset).assertEqual(expFirstReset);
        expect(secondReset).assertEqual(expSecondReset);
        expect(firstResult).assertEqual(expFirstResult);
        expect(secondResult).assertEqual(expSecondResult);
        let replacementReset: number = 0;
        first.registerResetCallback(() => {
          replacementReset++;
        });
        first.reset();
        expect(replacementReset).assertEqual(1);
        expect(firstReset).assertEqual(expFirstReset);
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerIsolationMatrix_' + c.name + ' end');
      });
    });
  });
}
