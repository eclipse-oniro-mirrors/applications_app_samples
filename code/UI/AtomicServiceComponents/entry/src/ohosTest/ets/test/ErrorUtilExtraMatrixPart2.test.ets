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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { ErrorInfo, errorInfo, formatError, pickerErrorHint } from '../../../main/ets/utils/ErrorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function ErrorUtilExtraMatrixPart2Test(): void {
  describe('ErrorUtilExtraMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_EUEP2_4100
     * @tc.name      testFormatError0041
     * @tc.desc      Verify formatError('', 1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0041 begin');
      await delayTick();
      expect(formatError('', 1, 'x')).assertEqual(' failed (1): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP2_4200
     * @tc.name      testFormatError0042
     * @tc.desc      Verify formatError('', 13900001, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0042 begin');
      await delayTick();
      expect(formatError('', 13900001, '')).assertEqual(' failed (13900001): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP2_4300
     * @tc.name      testFormatError0043
     * @tc.desc      Verify formatError('', 13900001, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0043 begin');
      await delayTick();
      expect(formatError('', 13900001, 'x')).assertEqual(' failed (13900001): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0043 end');
    })

  })
}
