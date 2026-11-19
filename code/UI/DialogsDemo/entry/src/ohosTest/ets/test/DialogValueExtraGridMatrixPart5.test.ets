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
import { formatDateValue, formatTimeValue, formatTextValue } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogValueExtraGridMatrixPart5Test(): void {
  describe('DialogValueExtraGridMatrixPart5', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVXP5_16100
     * @tc.name      testTextExtra0161
     * @tc.desc      Verify formatTextValue 'line1\nline2' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0161 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', 7)).assertEqual('index=7 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0161 end');
    })

  })
}
