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
export default function retryDelayStressTest(): void {
  describe('RetryDelayStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}RetryDelayStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}RetryDelayStressTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0001
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0001
     * @tc.desc      [Extreme] Verify retryDelay(65535) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_retryDelay_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(65535);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0002
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0002
     * @tc.desc      [SmallPositive] Verify retryDelay(3) returns 3000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 3000
      const actual: number = ChildProcessModel.retryDelay(3);
      expect(actual).assertEqual(3000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0003
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0003
     * @tc.desc      [Large] Verify retryDelay(1000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0004
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0004
     * @tc.desc      [Negative] Verify retryDelay(-8) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-8);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0005
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0005
     * @tc.desc      [Medium] Verify retryDelay(4) returns 4000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 4000
      const actual: number = ChildProcessModel.retryDelay(4);
      expect(actual).assertEqual(4000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0006
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0006
     * @tc.desc      [Negative] Verify retryDelay(-2147483648) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-2147483648);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0007
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0007
     * @tc.desc      [Medium] Verify retryDelay(5) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(5);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0008
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0008
     * @tc.desc      [Large] Verify retryDelay(1024) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1024);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0009
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0009
     * @tc.desc      [Negative] Verify retryDelay(-7) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-7);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0010
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0010
     * @tc.desc      [Medium] Verify retryDelay(6) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(6);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0011
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0011
     * @tc.desc      [Large] Verify retryDelay(256) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(256);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0012
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0012
     * @tc.desc      [Medium] Verify retryDelay(7) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(7);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0013
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0013
     * @tc.desc      [Large] Verify retryDelay(128) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(128);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0014
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0014
     * @tc.desc      [Negative] Verify retryDelay(-6) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-6);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0015
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0015
     * @tc.desc      [Medium] Verify retryDelay(8) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(8);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0016
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0016
     * @tc.desc      [Large] Verify retryDelay(4096) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4096);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0017
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0017
     * @tc.desc      [Medium] Verify retryDelay(9) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(9);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0018
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0018
     * @tc.desc      [Medium] Verify retryDelay(50) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(50);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0019
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0019
     * @tc.desc      [Negative] Verify retryDelay(-5) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-5);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0020
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0020
     * @tc.desc      [Medium] Verify retryDelay(10) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(10);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0021
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0021
     * @tc.desc      [Extreme] Verify retryDelay(65535) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(65535);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0022
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0022
     * @tc.desc      [Medium] Verify retryDelay(11) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(11);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0023
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0023
     * @tc.desc      [Large] Verify retryDelay(10000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(10000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0024
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0024
     * @tc.desc      [Negative] Verify retryDelay(-4) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-4);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0025
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0025
     * @tc.desc      [Medium] Verify retryDelay(12) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(12);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0026
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0026
     * @tc.desc      [Medium] Verify retryDelay(31) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(31);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0027
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0027
     * @tc.desc      [Medium] Verify retryDelay(13) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(13);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0028
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0028
     * @tc.desc      [Medium] Verify retryDelay(63) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(63);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0029
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0029
     * @tc.desc      [Negative] Verify retryDelay(-3) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-3);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0030
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0030
     * @tc.desc      [Medium] Verify retryDelay(14) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(14);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0031
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0031
     * @tc.desc      [Medium] Verify retryDelay(32) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(32);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0032
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0032
     * @tc.desc      [Medium] Verify retryDelay(15) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(15);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0033
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0033
     * @tc.desc      [Medium] Verify retryDelay(64) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(64);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0034
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0034
     * @tc.desc      [Negative] Verify retryDelay(-2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-2);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0035
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0035
     * @tc.desc      [Medium] Verify retryDelay(16) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(16);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0036
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0036
     * @tc.desc      [Large] Verify retryDelay(127) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(127);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0037
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0037
     * @tc.desc      [Medium] Verify retryDelay(17) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(17);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0038
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0038
     * @tc.desc      [Medium] Verify retryDelay(25) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(25);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0039
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0039
     * @tc.desc      [Negative] Verify retryDelay(-1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-1);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0040
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0040
     * @tc.desc      [Medium] Verify retryDelay(18) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(18);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0041
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0041
     * @tc.desc      [Large] Verify retryDelay(255) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(255);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0042
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0042
     * @tc.desc      [Medium] Verify retryDelay(19) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(19);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0043
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0043
     * @tc.desc      [Extreme] Verify retryDelay(100000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(100000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0044
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0044
     * @tc.desc      [Negative] Verify retryDelay(-10) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-10);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0045
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0045
     * @tc.desc      [Zero] Verify retryDelay(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero; expected: 0
      const actual: number = ChildProcessModel.retryDelay(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0046
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0046
     * @tc.desc      [Extreme] Verify retryDelay(2147483647) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2147483647);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0047
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0047
     * @tc.desc      [SmallPositive] Verify retryDelay(1) returns 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: 1000
      const actual: number = ChildProcessModel.retryDelay(1);
      expect(actual).assertEqual(1000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0048
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0048
     * @tc.desc      [Medium] Verify retryDelay(100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0049
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0049
     * @tc.desc      [Negative] Verify retryDelay(-9) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: 0
      const actual: number = ChildProcessModel.retryDelay(-9);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_STRESS_0050
     * @tc.name      ArkTsChildProcess_retryDelay_Stress_0050
     * @tc.desc      [SmallPositive] Verify retryDelay(2) returns 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: 2000
      const actual: number = ChildProcessModel.retryDelay(2);
      expect(actual).assertEqual(2000);
      expect(typeof actual).assertEqual('number');
    });

  });
}
