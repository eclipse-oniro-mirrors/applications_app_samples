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
import { ANIMATE_DURATION, DELETE_OFFSET_X, ITEM_HEIGHT, PRESS_SCALE } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeLogic (4 cases). */
export default function listExchangeLogicConstantsTest(): void {
  describe('ListExchangeLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_LOGIC_CONSTANTS_0001
     * @tc.name      ListBeExchange_ListExchangeLogicConstants_0001
     * @tc.desc      ITEM_HEIGHT keeps value 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0001 begin`);
      const actual: number = ITEM_HEIGHT;
      logInfo(`ITEM_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_LOGIC_CONSTANTS_0002
     * @tc.name      ListBeExchange_ListExchangeLogicConstants_0002
     * @tc.desc      PRESS_SCALE keeps value 1.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0002 begin`);
      const actual: number = PRESS_SCALE;
      logInfo(`PRESS_SCALE: actual=${actual}`);
      expect(actual).assertClose(1.04, PRECISION);
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_LOGIC_CONSTANTS_0003
     * @tc.name      ListBeExchange_ListExchangeLogicConstants_0003
     * @tc.desc      DELETE_OFFSET_X keeps value 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0003 begin`);
      const actual: number = DELETE_OFFSET_X;
      logInfo(`DELETE_OFFSET_X: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_LOGIC_CONSTANTS_0004
     * @tc.name      ListBeExchange_ListExchangeLogicConstants_0004
     * @tc.desc      ANIMATE_DURATION keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0004 begin`);
      const actual: number = ANIMATE_DURATION;
      logInfo(`ANIMATE_DURATION: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}ListExchangeLogicConstants_0004 end`);
    });
  });
}
