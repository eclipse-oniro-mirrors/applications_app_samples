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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resultLabelOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resultLabelOf (2 cases). */
export default function resultLabelOfTest(): void {
  describe('ResultLabelOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_RESULT_LABEL_OF_0001
     * @tc.name      NdkNotification_ResultLabelOf_0001
     * @tc.desc      resultLabelOf(enabled=true) returns "true"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_ResultLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultLabelOf_0001 begin`);
      const actual: string = resultLabelOf(true);
      logInfo(`resultLabelOf(enabled=true): actual=${actual}`);
      expect(actual).assertEqual('true');
      logInfo(`${BUNDLE}ResultLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_RESULT_LABEL_OF_0002
     * @tc.name      NdkNotification_ResultLabelOf_0002
     * @tc.desc      resultLabelOf(enabled=false) returns "false"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_ResultLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultLabelOf_0002 begin`);
      const actual: string = resultLabelOf(false);
      logInfo(`resultLabelOf(enabled=false): actual=${actual}`);
      expect(actual).assertEqual('false');
      logInfo(`${BUNDLE}ResultLabelOf_0002 end`);
    });
  });
}
