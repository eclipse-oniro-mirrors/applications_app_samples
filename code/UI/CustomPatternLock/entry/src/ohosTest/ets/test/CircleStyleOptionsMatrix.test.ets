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
const TAG: string = '[Sample_PatternLock_CircleStyleOptionsMatrix]';


export default function circleStyleOptionsMatrixTest() {
  describe('circleStyleOptionsMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    MATRIX_CASES.forEach((c: MatrixCase) => {
      it('test_circleStyleOptionsMatrix_' + c.name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_circleStyleOptionsMatrix_' + c.name + ' begin');
        const variant: number = c.index % 4;
        let expectedColor: number | string | undefined = '#AABBCC';
        if (variant === 1) {
          expectedColor = 0x112233;
        } else if (variant === 2) {
          expectedColor = undefined;
        }
        const expectedRadius: number | undefined = (c.index % 11 === 10) ? undefined : (c.index % 10) + 1;
        const expectedWave: boolean = c.index % 2 === 0;
        const expectedForeground: boolean = (c.index % 4) < 2;
        const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
          expectedColor, expectedRadius, expectedWave, expectedForeground);
        if (expectedColor === undefined) {
          expect(options.color === undefined).assertTrue();
        } else {
          expect(options.color).assertEqual(expectedColor);
        }
        if (expectedRadius === undefined) {
          expect(options.radius === undefined).assertTrue();
        } else {
          expect(options.radius).assertEqual(expectedRadius);
        }
        expect(options.enableWaveEffect).assertEqual(expectedWave);
        expect(options.enableForeground).assertEqual(expectedForeground);
        const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
        expect(second.color).assertEqual('#FFFFFF');
        expect(second.radius).assertEqual(5);
        expect(options === second).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'test_circleStyleOptionsMatrix_' + c.name + ' end');
      });
    });
  });
}
