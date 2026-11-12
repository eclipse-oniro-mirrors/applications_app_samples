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
const TAG: string = '[Sample_PatternLock_ControllerLifecycleMatrix]';


export default function controllerLifecycleMatrixTest() {
  describe('controllerLifecycleMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_controllerLifecycleMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerLifecycleMatrix_' + c.name + ' begin');
        const controller: CustomPatternLockController = new CustomPatternLockController();
        let resetCount: number = 0;
        let resultCount: number = 0;
        let lastResult: number = 0;
        controller.registerResetCallback(() => {
          resetCount++;
        });
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          lastResult = result;
          resultCount++;
        });
        const bits: number = c.index;
        if ((bits & 1) !== 0) {
          controller.reset();
        }
        if ((bits & 2) !== 0) {
          controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        }
        if ((bits & 4) !== 0) {
          controller.reset();
        }
        if ((bits & 8) !== 0) {
          controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        }
        if ((bits & 16) !== 0) {
          controller.reset();
        }
        const expectedReset: number = ((bits & 1) !== 0 ? 1 : 0) + ((bits & 4) !== 0 ? 1 : 0) +
          ((bits & 16) !== 0 ? 1 : 0);
        const expectedResultCount: number = ((bits & 2) !== 0 ? 1 : 0) + ((bits & 8) !== 0 ? 1 : 0);
        let expectedLast: number = 0;
        if ((bits & 8) !== 0) {
          expectedLast = CustomPatternLockChallengeResult.WRONG;
        } else if ((bits & 2) !== 0) {
          expectedLast = CustomPatternLockChallengeResult.CORRECT;
        }
        expect(resetCount).assertEqual(expectedReset);
        expect(resultCount).assertEqual(expectedResultCount);
        expect(lastResult).assertEqual(expectedLast);
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerLifecycleMatrix_' + c.name + ' end');
      });
    });
  });
}
