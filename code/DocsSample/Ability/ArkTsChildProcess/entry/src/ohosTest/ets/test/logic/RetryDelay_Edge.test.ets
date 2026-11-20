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
export default function retryDelayEdgeTest(): void {
  describe('RetryDelayEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}RetryDelayEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}RetryDelayEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0001
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0001
     * @tc.desc      [Zero] Verify retryDelay(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_retryDelay_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: 0
      const actual: number = ChildProcessModel.retryDelay(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0002
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0002
     * @tc.desc      [Medium] Verify retryDelay(100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0003
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0003
     * @tc.desc      [Large] Verify retryDelay(200) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(200);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0004
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0004
     * @tc.desc      [Large] Verify retryDelay(300) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(300);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0005
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0005
     * @tc.desc      [Large] Verify retryDelay(400) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(400);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0006
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0006
     * @tc.desc      [Large] Verify retryDelay(500) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(500);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0007
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0007
     * @tc.desc      [Large] Verify retryDelay(600) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(600);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0008
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0008
     * @tc.desc      [Large] Verify retryDelay(700) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(700);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0009
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0009
     * @tc.desc      [Large] Verify retryDelay(800) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(800);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0010
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0010
     * @tc.desc      [Large] Verify retryDelay(900) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(900);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0011
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0011
     * @tc.desc      [Large] Verify retryDelay(1000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0012
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0012
     * @tc.desc      [Large] Verify retryDelay(1100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0013
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0013
     * @tc.desc      [Large] Verify retryDelay(1200) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1200);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0014
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0014
     * @tc.desc      [Large] Verify retryDelay(1300) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1300);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0015
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0015
     * @tc.desc      [Large] Verify retryDelay(1400) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1400);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0016
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0016
     * @tc.desc      [Large] Verify retryDelay(1500) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1500);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0017
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0017
     * @tc.desc      [Large] Verify retryDelay(1600) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1600);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0018
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0018
     * @tc.desc      [Large] Verify retryDelay(1700) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1700);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0019
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0019
     * @tc.desc      [Large] Verify retryDelay(1800) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1800);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0020
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0020
     * @tc.desc      [Large] Verify retryDelay(1900) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1900);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0021
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0021
     * @tc.desc      [Large] Verify retryDelay(2000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0022
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0022
     * @tc.desc      [Large] Verify retryDelay(2100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0023
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0023
     * @tc.desc      [Large] Verify retryDelay(2200) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2200);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0024
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0024
     * @tc.desc      [Large] Verify retryDelay(2300) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2300);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0025
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0025
     * @tc.desc      [Large] Verify retryDelay(2400) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2400);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0026
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0026
     * @tc.desc      [Large] Verify retryDelay(2500) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2500);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0027
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0027
     * @tc.desc      [Large] Verify retryDelay(2600) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2600);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0028
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0028
     * @tc.desc      [Large] Verify retryDelay(2700) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2700);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0029
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0029
     * @tc.desc      [Large] Verify retryDelay(2800) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2800);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0030
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0030
     * @tc.desc      [Large] Verify retryDelay(2900) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2900);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0031
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0031
     * @tc.desc      [Large] Verify retryDelay(3000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0032
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0032
     * @tc.desc      [Large] Verify retryDelay(3100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0033
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0033
     * @tc.desc      [Large] Verify retryDelay(3200) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3200);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0034
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0034
     * @tc.desc      [Large] Verify retryDelay(3300) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3300);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0035
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0035
     * @tc.desc      [Large] Verify retryDelay(3400) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3400);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0036
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0036
     * @tc.desc      [Large] Verify retryDelay(3500) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3500);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0037
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0037
     * @tc.desc      [Large] Verify retryDelay(3600) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3600);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0038
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0038
     * @tc.desc      [Large] Verify retryDelay(3700) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3700);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0039
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0039
     * @tc.desc      [Large] Verify retryDelay(3800) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3800);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0040
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0040
     * @tc.desc      [Large] Verify retryDelay(3900) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3900);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0041
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0041
     * @tc.desc      [Large] Verify retryDelay(4000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0042
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0042
     * @tc.desc      [Large] Verify retryDelay(4100) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4100);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0043
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0043
     * @tc.desc      [Large] Verify retryDelay(4200) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4200);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0044
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0044
     * @tc.desc      [Large] Verify retryDelay(4300) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4300);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0045
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0045
     * @tc.desc      [Large] Verify retryDelay(4400) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4400);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0046
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0046
     * @tc.desc      [Large] Verify retryDelay(4500) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4500);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0047
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0047
     * @tc.desc      [Large] Verify retryDelay(4600) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4600);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0048
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0048
     * @tc.desc      [Large] Verify retryDelay(4700) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4700);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0049
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0049
     * @tc.desc      [Large] Verify retryDelay(4800) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4800);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_EDGE_0050
     * @tc.name      ArkTsChildProcess_retryDelay_Edge_0050
     * @tc.desc      [Large] Verify retryDelay(4900) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4900);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

  });
}
