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
const TAG: string = '[Sample_PatternLock_ControllerResultMatrix]';


export default function controllerResultMatrixTest() {
  describe('controllerResultMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_controllerResultMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerResultMatrix_' + c.name + ' begin');
        const controller: CustomPatternLockController = new CustomPatternLockController();
        const expected: number = c.index % 2 === 0 ?
          CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG;
        let captured: number = 0;
        let resultCalls: number = 0;
        const registered: boolean = (c.index % 4) !== 0;
        if (registered) {
          controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
            captured = result;
            resultCalls++;
          });
        }
        const repeat: number = (c.index % 3) + 1;
        for (let n: number = 0; n < repeat; n++) {
          controller.setChallengeResult(expected === 1 ?
            CustomPatternLockChallengeResult.CORRECT : CustomPatternLockChallengeResult.WRONG);
        }
        expect(resultCalls).assertEqual(registered ? repeat : 0);
        if (registered) {
          expect(captured).assertEqual(expected);
        } else {
          expect(captured).assertEqual(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerResultMatrix_' + c.name + ' end');
      });
    });
  });
}
