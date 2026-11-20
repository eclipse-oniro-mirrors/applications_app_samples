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
import { gridRowOf } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridRowOf (4 cases). */
export default function gridRowOf2Test(): void {
  describe('GridRowOf2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0097
     * @tc.name      DragAndExchange_GridRowOf_0097
     * @tc.desc      gridRowOf(index=72) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0097 begin`);
      const actual: number = gridRowOf(72);
      logInfo(`gridRowOf(index=72): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0098
     * @tc.name      DragAndExchange_GridRowOf_0098
     * @tc.desc      gridRowOf(index=119) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0098 begin`);
      const actual: number = gridRowOf(119);
      logInfo(`gridRowOf(index=119): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0099
     * @tc.name      DragAndExchange_GridRowOf_0099
     * @tc.desc      gridRowOf(index=-85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0099 begin`);
      const actual: number = gridRowOf(-85);
      logInfo(`gridRowOf(index=-85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0100
     * @tc.name      DragAndExchange_GridRowOf_0100
     * @tc.desc      gridRowOf(index=51.23) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0100 begin`);
      const actual: number = gridRowOf(51.23);
      logInfo(`gridRowOf(index=51.23): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0100 end`);
    });
  });
}
