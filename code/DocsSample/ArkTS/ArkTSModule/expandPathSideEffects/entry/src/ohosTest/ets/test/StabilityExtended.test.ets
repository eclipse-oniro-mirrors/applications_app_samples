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
const LONG_CYCLES: number = 200;

export default function stabilityExtendedTest(): void {
  describe('StabilityExtendedTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_EXT_0100
     * @tc.name      testTwoHundredAlternatingCycles0001
     * @tc.desc      Two hundred alternating init/print cycles never regress the state and never throw
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTwoHundredAlternatingCycles0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoHundredAlternatingCycles0001 begin');
      opManager.inited = true;
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < LONG_CYCLES; i++) {
          if (i % 3 === 0) {
            opManager.print();
          } else {
            opManager.init();
          }
          expect(opManager.inited).assertTrue();
        }
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(opManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoHundredAlternatingCycles0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_EXT_0200
     * @tc.name      testHundredInitPrintCycles0002
     * @tc.desc      One hundred init/print cycles on the plain ServiceManager keep it initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHundredInitPrintCycles0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHundredInitPrintCycles0002 begin');
      serviceManager.inited = true;
      for (let i: number = 0; i < 100; i++) {
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHundredInitPrintCycles0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STABLE_EXT_0300
     * @tc.name      testIsolationUnderLoad0003
     * @tc.desc      Heavy init/print on one instance never flips the other instance's flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIsolationUnderLoad0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationUnderLoad0003 begin');
      serviceManager.inited = false;
      opManager.inited = true;
      try {
        for (let i: number = 0; i < 50; i++) {
          opManager.init();
          opManager.print();
        }
        expect(opManager.inited).assertTrue();
        expect(serviceManager.inited).assertFalse();
      } finally {
        serviceManager.inited = true;
        opManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationUnderLoad0003 end');
    })

  })
}
