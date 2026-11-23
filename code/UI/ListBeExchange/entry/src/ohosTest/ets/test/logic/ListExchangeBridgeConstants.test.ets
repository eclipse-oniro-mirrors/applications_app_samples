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
import { ListInfo, MEMO_DATA } from '../../../../main/ets/bridge/ListExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeBridge (1 cases). */
export default function listExchangeBridgeConstantsTest(): void {
  describe('ListExchangeBridgeConstantsTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_BRIDGE_CONSTANTS_0001
     * @tc.name      ListBeExchange_ListExchangeBridgeConstants_0001
     * @tc.desc      MEMO_DATA keeps value "xx??????1236?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeBridgeConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeBridgeConstants_0001 begin`);
      const actual: ListInfo[] = MEMO_DATA;
      logInfo(`MEMO_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`MEMO_DATA: actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('\u8d26\u6237\u4f59\u989d');
      logInfo(`MEMO_DATA: actual[1].name=${actual[1].name}`);
      expect(actual[1].name).assertEqual('xx\u94f6\u884c\u50a8\u84c4\u5361\uff081234\uff09');
      logInfo(`MEMO_DATA: actual[3].name=${actual[3].name}`);
      expect(actual[3].name).assertEqual('xx\u94f6\u884c\u50a8\u84c4\u5361\uff081236\uff09');
      logInfo(`${BUNDLE}ListExchangeBridgeConstants_0001 end`);
    });
  });
}
