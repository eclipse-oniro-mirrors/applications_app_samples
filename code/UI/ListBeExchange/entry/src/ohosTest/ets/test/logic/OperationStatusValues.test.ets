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
import { OperationStatus } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for OperationStatus (5 cases). */
export default function operationStatusValuesTest(): void {
  describe('OperationStatusValuesTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OPERATION_STATUS_VALUES_0001
     * @tc.name      ListBeExchange_OperationStatusValues_0001
     * @tc.desc      OperationStatus.IDLE keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_OperationStatusValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OperationStatusValues_0001 begin`);
      const actual: number = OperationStatus.IDLE;
      logInfo(`OperationStatus.IDLE: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}OperationStatusValues_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OPERATION_STATUS_VALUES_0002
     * @tc.name      ListBeExchange_OperationStatusValues_0002
     * @tc.desc      OperationStatus.PRESSING keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_OperationStatusValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OperationStatusValues_0002 begin`);
      const actual: number = OperationStatus.PRESSING;
      logInfo(`OperationStatus.PRESSING: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}OperationStatusValues_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OPERATION_STATUS_VALUES_0003
     * @tc.name      ListBeExchange_OperationStatusValues_0003
     * @tc.desc      OperationStatus.MOVING keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OperationStatusValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OperationStatusValues_0003 begin`);
      const actual: number = OperationStatus.MOVING;
      logInfo(`OperationStatus.MOVING: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}OperationStatusValues_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OPERATION_STATUS_VALUES_0004
     * @tc.name      ListBeExchange_OperationStatusValues_0004
     * @tc.desc      OperationStatus.DROPPING keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OperationStatusValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OperationStatusValues_0004 begin`);
      const actual: number = OperationStatus.DROPPING;
      logInfo(`OperationStatus.DROPPING: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}OperationStatusValues_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OPERATION_STATUS_VALUES_0005
     * @tc.name      ListBeExchange_OperationStatusValues_0005
     * @tc.desc      OperationStatus.DELETE keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OperationStatusValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OperationStatusValues_0005 begin`);
      const actual: number = OperationStatus.DELETE;
      logInfo(`OperationStatus.DELETE: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}OperationStatusValues_0005 end`);
    });
  });
}
