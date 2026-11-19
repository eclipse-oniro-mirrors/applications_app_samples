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
import { reorder } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for reorder (2 cases). */
export default function reorder4Test(): void {
  describe('Reorder4Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0249
     * @tc.name      ListBeExchange_Reorder_0249
     * @tc.desc      reorder(items=[""], index=10, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0249 begin`);
      const actual: string[] = reorder([''], 10, 5);
      logInfo(`reorder(items=[""], index=10, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=10, newIndex=5): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0250
     * @tc.name      ListBeExchange_Reorder_0250
     * @tc.desc      reorder(items=[""], index=10, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0250 begin`);
      const actual: string[] = reorder([''], 10, 10);
      logInfo(`reorder(items=[""], index=10, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=10, newIndex=10): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0250 end`);
    });
  });
}
