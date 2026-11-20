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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for retryDelay (50 cases). */
export default function retryDelayCoreTest(): void {
  describe('RetryDelayCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}RetryDelayCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}RetryDelayCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0001
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0001
     * @tc.desc      [Negative] Verify retryDelay(-5) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_retryDelay_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-5);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0002
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0002
     * @tc.desc      [Negative] Verify retryDelay(-1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-1);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0003
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0003
     * @tc.desc      [Zero] Verify retryDelay(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero; expected: 0
      const actual: number = ChildProcessModel.retryDelay(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0004
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0004
     * @tc.desc      [SmallPositive] Verify retryDelay(1) returns 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 1000
      const actual: number = ChildProcessModel.retryDelay(1);
      expect(actual).assertEqual(1000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0005
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0005
     * @tc.desc      [SmallPositive] Verify retryDelay(2) returns 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 2000
      const actual: number = ChildProcessModel.retryDelay(2);
      expect(actual).assertEqual(2000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0006
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0006
     * @tc.desc      [SmallPositive] Verify retryDelay(3) returns 3000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 3000
      const actual: number = ChildProcessModel.retryDelay(3);
      expect(actual).assertEqual(3000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0007
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0007
     * @tc.desc      [Medium] Verify retryDelay(4) returns 4000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 4000
      const actual: number = ChildProcessModel.retryDelay(4);
      expect(actual).assertEqual(4000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0008
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0008
     * @tc.desc      [Medium] Verify retryDelay(5) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(5);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0009
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0009
     * @tc.desc      [Medium] Verify retryDelay(6) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(6);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0010
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0010
     * @tc.desc      [Medium] Verify retryDelay(7) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(7);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0011
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0011
     * @tc.desc      [Medium] Verify retryDelay(8) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(8);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0012
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0012
     * @tc.desc      [Medium] Verify retryDelay(9) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(9);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0013
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0013
     * @tc.desc      [Medium] Verify retryDelay(10) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(10);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0014
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0014
     * @tc.desc      [Medium] Verify retryDelay(11) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(11);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0015
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0015
     * @tc.desc      [Medium] Verify retryDelay(12) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(12);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0016
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0016
     * @tc.desc      [Medium] Verify retryDelay(13) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(13);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0017
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0017
     * @tc.desc      [Medium] Verify retryDelay(14) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(14);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0018
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0018
     * @tc.desc      [Medium] Verify retryDelay(15) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(15);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0019
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0019
     * @tc.desc      [Medium] Verify retryDelay(16) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(16);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0020
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0020
     * @tc.desc      [Medium] Verify retryDelay(17) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(17);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0021
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0021
     * @tc.desc      [Medium] Verify retryDelay(18) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(18);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0022
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0022
     * @tc.desc      [Medium] Verify retryDelay(19) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(19);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0023
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0023
     * @tc.desc      [Medium] Verify retryDelay(20) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(20);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0024
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0024
     * @tc.desc      [Medium] Verify retryDelay(21) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(21);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0025
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0025
     * @tc.desc      [Medium] Verify retryDelay(22) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(22);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0026
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0026
     * @tc.desc      [Medium] Verify retryDelay(23) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(23);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0027
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0027
     * @tc.desc      [Medium] Verify retryDelay(24) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(24);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0028
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0028
     * @tc.desc      [Medium] Verify retryDelay(25) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(25);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0029
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0029
     * @tc.desc      [Medium] Verify retryDelay(26) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(26);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0030
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0030
     * @tc.desc      [Medium] Verify retryDelay(27) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(27);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0031
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0031
     * @tc.desc      [Medium] Verify retryDelay(28) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(28);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0032
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0032
     * @tc.desc      [Medium] Verify retryDelay(29) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(29);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0033
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0033
     * @tc.desc      [Medium] Verify retryDelay(30) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(30);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0034
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0034
     * @tc.desc      [Medium] Verify retryDelay(31) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(31);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0035
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0035
     * @tc.desc      [Medium] Verify retryDelay(32) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(32);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0036
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0036
     * @tc.desc      [Medium] Verify retryDelay(33) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(33);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0037
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0037
     * @tc.desc      [Medium] Verify retryDelay(34) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(34);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0038
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0038
     * @tc.desc      [Medium] Verify retryDelay(35) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(35);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0039
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0039
     * @tc.desc      [Medium] Verify retryDelay(36) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(36);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0040
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0040
     * @tc.desc      [Medium] Verify retryDelay(37) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(37);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0041
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0041
     * @tc.desc      [Medium] Verify retryDelay(38) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(38);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0042
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0042
     * @tc.desc      [Medium] Verify retryDelay(39) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(39);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0043
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0043
     * @tc.desc      [Medium] Verify retryDelay(40) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(40);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0044
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0044
     * @tc.desc      [Medium] Verify retryDelay(41) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(41);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0045
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0045
     * @tc.desc      [Medium] Verify retryDelay(42) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(42);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0046
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0046
     * @tc.desc      [Medium] Verify retryDelay(43) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(43);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0047
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0047
     * @tc.desc      [Medium] Verify retryDelay(44) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(44);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0048
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0048
     * @tc.desc      [Medium] Verify retryDelay(45) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(45);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0049
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0049
     * @tc.desc      [Medium] Verify retryDelay(46) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(46);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_CORE_0050
     * @tc.name      ArkTsChildProcess_retryDelay_Core_0050
     * @tc.desc      [Medium] Verify retryDelay(47) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(47);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

  });
}
