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
import { serviceManager as serviceManager } from 'servicemanagerhar/src/main/ets/ServiceManager';
import { serviceManager as opManager } from 'servicemanagerhar/src/main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';

export default function opStateParityTest(): void {
  describe('OpStateParityTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_PARITY_0100
     * @tc.name      testOpFromFalseInitBecomesTrue0001
     * @tc.desc      OpServiceManager also moves from false to true on init()
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpFromFalseInitBecomesTrue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpFromFalseInitBecomesTrue0001 begin');
      opManager.inited = false;
      try {
        expect(opManager.inited).assertFalse();
        opManager.init();
        expect(opManager.inited).assertTrue();
      } finally {
        opManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpFromFalseInitBecomesTrue0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PARITY_0200
     * @tc.name      testOpFromFalsePrintStaysFalse0002
     * @tc.desc      OpServiceManager print() from false does not initialize
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpFromFalsePrintStaysFalse0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpFromFalsePrintStaysFalse0002 begin');
      opManager.inited = false;
      try {
        opManager.print();
        expect(opManager.inited).assertFalse();
      } finally {
        opManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpFromFalsePrintStaysFalse0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PARITY_0300
     * @tc.name      testTwoClassCopiesBehaveIdentically0003
     * @tc.desc      The duplicated ServiceManager definitions transition identically for the same operations
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testTwoClassCopiesBehaveIdentically0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoClassCopiesBehaveIdentically0003 begin');
      serviceManager.inited = false;
      opManager.inited = false;
      try {
        serviceManager.init();
        opManager.init();
        expect(serviceManager.inited).assertEqual(opManager.inited);
        expect(opManager.inited).assertTrue();

        serviceManager.inited = false;
        opManager.inited = false;
        serviceManager.print();
        opManager.print();
        expect(serviceManager.inited).assertEqual(opManager.inited);
        expect(opManager.inited).assertFalse();
      } finally {
        serviceManager.inited = true;
        opManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoClassCopiesBehaveIdentically0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_PARITY_0400
     * @tc.name      testStateChangesAreIndependent0004
     * @tc.desc      Initializing one instance must not change the other instance's flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStateChangesAreIndependent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateChangesAreIndependent0004 begin');
      serviceManager.inited = false;
      opManager.inited = true;
      try {
        opManager.init();
        expect(opManager.inited).assertTrue();
        expect(serviceManager.inited).assertFalse();
      } finally {
        serviceManager.inited = true;
        opManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateChangesAreIndependent0004 end');
    })

  })
}
