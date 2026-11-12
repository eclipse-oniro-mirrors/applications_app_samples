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
const TAG: string = '[Sample_PatternLock_ControllerResetMatrix]';


export default function controllerResetMatrixTest() {
  describe('controllerResetMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_controllerResetMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerResetMatrix_' + c.name + ' begin');
        const controller: CustomPatternLockController = new CustomPatternLockController();
        let resetCount: number = 0;
        const resetCalls: number = c.index % 5;
        const registered: boolean = (c.index % 3) !== 0;
        if (registered) {
          controller.registerResetCallback(() => {
            resetCount++;
          });
        }
        for (let n: number = 0; n < resetCalls; n++) {
          controller.reset();
        }
        expect(resetCount).assertEqual(registered ? resetCalls : 0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_controllerResetMatrix_' + c.name + ' end');
      });
    });
  });
}
