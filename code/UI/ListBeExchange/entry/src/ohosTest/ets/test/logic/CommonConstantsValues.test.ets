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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonConstants } from '../../../../main/ets/bridge/ListExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommonConstants (3 cases). */
export default function commonConstantsValuesTest(): void {
  describe('CommonConstantsValuesTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_COMMON_CONSTANTS_VALUES_0001
     * @tc.name      ListBeExchange_CommonConstantsValues_0001
     * @tc.desc      CommonConstants.LIST_ITEM_HEIGHT keeps value 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CommonConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CommonConstantsValues_0001 begin`);
      const actual: number = CommonConstants.LIST_ITEM_HEIGHT;
      logInfo(`CommonConstants.LIST_ITEM_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}CommonConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_COMMON_CONSTANTS_VALUES_0002
     * @tc.name      ListBeExchange_CommonConstantsValues_0002
     * @tc.desc      CommonConstants.ANIMATE_DURATION keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CommonConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CommonConstantsValues_0002 begin`);
      const actual: number = CommonConstants.ANIMATE_DURATION;
      logInfo(`CommonConstants.ANIMATE_DURATION: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}CommonConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_COMMON_CONSTANTS_VALUES_0003
     * @tc.name      ListBeExchange_CommonConstantsValues_0003
     * @tc.desc      CommonConstants.LIST_NAME keeps value "??1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CommonConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommonConstantsValues_0003 begin`);
      const actual: string = CommonConstants.LIST_NAME;
      logInfo(`CommonConstants.LIST_NAME: actual=${actual}`);
      expect(actual).assertEqual('\u6807\u98981');
      logInfo(`${BUNDLE}CommonConstantsValues_0003 end`);
    });
  });
}
