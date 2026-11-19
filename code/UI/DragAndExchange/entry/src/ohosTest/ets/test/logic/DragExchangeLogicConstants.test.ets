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
import { GRID_COLUMNS, GRID_ROWS, ICON_NUM_IN_GRID, ICON_NUM_IN_LIST, LIST_SPACE } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DragExchangeLogic (5 cases). */
export default function dragExchangeLogicConstantsTest(): void {
  describe('DragExchangeLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_EXCHANGE_LOGIC_CONSTANTS_0001
     * @tc.name      DragAndExchange_DragExchangeLogicConstants_0001
     * @tc.desc      ICON_NUM_IN_GRID keeps value 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DragExchangeLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0001 begin`);
      const actual: number = ICON_NUM_IN_GRID;
      logInfo(`ICON_NUM_IN_GRID: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_EXCHANGE_LOGIC_CONSTANTS_0002
     * @tc.name      DragAndExchange_DragExchangeLogicConstants_0002
     * @tc.desc      GRID_COLUMNS keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DragExchangeLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0002 begin`);
      const actual: number = GRID_COLUMNS;
      logInfo(`GRID_COLUMNS: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_EXCHANGE_LOGIC_CONSTANTS_0003
     * @tc.name      DragAndExchange_DragExchangeLogicConstants_0003
     * @tc.desc      GRID_ROWS keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragExchangeLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0003 begin`);
      const actual: number = GRID_ROWS;
      logInfo(`GRID_ROWS: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_EXCHANGE_LOGIC_CONSTANTS_0004
     * @tc.name      DragAndExchange_DragExchangeLogicConstants_0004
     * @tc.desc      ICON_NUM_IN_LIST keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragExchangeLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0004 begin`);
      const actual: number = ICON_NUM_IN_LIST;
      logInfo(`ICON_NUM_IN_LIST: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_EXCHANGE_LOGIC_CONSTANTS_0005
     * @tc.name      DragAndExchange_DragExchangeLogicConstants_0005
     * @tc.desc      LIST_SPACE keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragExchangeLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0005 begin`);
      const actual: number = LIST_SPACE;
      logInfo(`LIST_SPACE: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}DragExchangeLogicConstants_0005 end`);
    });
  });
}
