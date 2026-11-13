/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager as opManager } from 'servicemanagerhar/src/main/ets/OpServiceManager';
import { serviceManager as pathManager } from 'servicemanagerhar/src/main/ets/ServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const CYCLE_TIMES: number = 20;
const BULK_TIMES: number = 50;

export default function stabilityLoopTest(): void {
  describe('StabilityLoopTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_0100
     * @tc.name      testInitPrintCycles0001
     * @tc.desc      Twenty init/print cycles keep the singleton initialized on every iteration
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInitPrintCycles0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitPrintCycles0001 begin');
      for (let i: number = 0; i < CYCLE_TIMES; i++) {
        opManager.init();
        opManager.print();
        expect(opManager.inited).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitPrintCycles0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_0200
     * @tc.name      testFiftyInitCycles0002
     * @tc.desc      Fifty consecutive init calls complete without exceptions and keep the state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFiftyInitCycles0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyInitCycles0002 begin');
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < BULK_TIMES; i++) {
          opManager.init();
        }
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyInitCycles0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_0300
     * @tc.name      testAlternatingCalls0003
     * @tc.desc      Alternating init and print calls never regress the initialized state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAlternatingCalls0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternatingCalls0003 begin');
      for (let i: number = 0; i < BULK_TIMES; i++) {
        if (i % 2 === 0) {
          opManager.print();
        } else {
          opManager.init();
        }
        expect(opManager.inited).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternatingCalls0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_0400
     * @tc.name      testServiceBulkInitStable0004
     * @tc.desc      Bulk init on the plain ServiceManager stays initialized without side effects
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testServiceBulkInitStable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceBulkInitStable0004 begin');
      for (let i: number = 0; i < BULK_TIMES; i++) {
        pathManager.init();
      }
      expect(pathManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceBulkInitStable0004 end');
    })

  })
}
