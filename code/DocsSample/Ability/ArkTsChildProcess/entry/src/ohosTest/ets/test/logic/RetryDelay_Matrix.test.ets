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
export default function retryDelayMatrixTest(): void {
  describe('RetryDelayMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}RetryDelayMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}RetryDelayMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0001
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0001
     * @tc.desc      [Zero] Verify retryDelay(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: 0
      const actual: number = ChildProcessModel.retryDelay(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0002
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0002
     * @tc.desc      [Large] Verify retryDelay(1000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(1000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0003
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0003
     * @tc.desc      [Large] Verify retryDelay(2000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(2000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0004
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0004
     * @tc.desc      [Large] Verify retryDelay(3000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(3000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0005
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0005
     * @tc.desc      [Large] Verify retryDelay(4000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(4000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0006
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0006
     * @tc.desc      [Large] Verify retryDelay(5000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(5000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0007
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0007
     * @tc.desc      [Large] Verify retryDelay(6000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(6000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0008
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0008
     * @tc.desc      [Large] Verify retryDelay(7000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(7000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0009
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0009
     * @tc.desc      [Large] Verify retryDelay(8000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(8000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0010
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0010
     * @tc.desc      [Large] Verify retryDelay(9000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(9000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0011
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0011
     * @tc.desc      [Large] Verify retryDelay(10000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(10000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0012
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0012
     * @tc.desc      [Extreme] Verify retryDelay(11000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(11000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0013
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0013
     * @tc.desc      [Extreme] Verify retryDelay(12000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(12000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0014
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0014
     * @tc.desc      [Extreme] Verify retryDelay(13000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(13000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0015
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0015
     * @tc.desc      [Extreme] Verify retryDelay(14000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(14000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0016
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0016
     * @tc.desc      [Extreme] Verify retryDelay(15000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(15000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0017
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0017
     * @tc.desc      [Extreme] Verify retryDelay(16000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(16000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0018
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0018
     * @tc.desc      [Extreme] Verify retryDelay(17000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(17000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0019
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0019
     * @tc.desc      [Extreme] Verify retryDelay(18000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(18000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0020
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0020
     * @tc.desc      [Extreme] Verify retryDelay(19000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(19000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0021
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0021
     * @tc.desc      [Extreme] Verify retryDelay(20000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(20000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0022
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0022
     * @tc.desc      [Extreme] Verify retryDelay(21000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(21000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0023
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0023
     * @tc.desc      [Extreme] Verify retryDelay(22000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(22000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0024
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0024
     * @tc.desc      [Extreme] Verify retryDelay(23000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(23000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0025
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0025
     * @tc.desc      [Extreme] Verify retryDelay(24000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(24000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0026
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0026
     * @tc.desc      [Extreme] Verify retryDelay(25000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(25000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0027
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0027
     * @tc.desc      [Extreme] Verify retryDelay(26000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(26000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0028
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0028
     * @tc.desc      [Extreme] Verify retryDelay(27000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(27000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0029
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0029
     * @tc.desc      [Extreme] Verify retryDelay(28000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(28000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0030
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0030
     * @tc.desc      [Extreme] Verify retryDelay(29000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(29000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0031
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0031
     * @tc.desc      [Extreme] Verify retryDelay(30000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(30000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0032
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0032
     * @tc.desc      [Extreme] Verify retryDelay(31000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(31000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0033
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0033
     * @tc.desc      [Extreme] Verify retryDelay(32000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(32000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0034
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0034
     * @tc.desc      [Extreme] Verify retryDelay(33000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(33000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0035
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0035
     * @tc.desc      [Extreme] Verify retryDelay(34000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(34000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0036
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0036
     * @tc.desc      [Extreme] Verify retryDelay(35000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(35000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0037
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0037
     * @tc.desc      [Extreme] Verify retryDelay(36000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(36000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0038
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0038
     * @tc.desc      [Extreme] Verify retryDelay(37000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(37000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0039
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0039
     * @tc.desc      [Extreme] Verify retryDelay(38000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(38000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0040
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0040
     * @tc.desc      [Extreme] Verify retryDelay(39000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(39000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0041
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0041
     * @tc.desc      [Extreme] Verify retryDelay(40000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(40000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0042
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0042
     * @tc.desc      [Extreme] Verify retryDelay(41000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(41000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0043
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0043
     * @tc.desc      [Extreme] Verify retryDelay(42000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(42000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0044
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0044
     * @tc.desc      [Extreme] Verify retryDelay(43000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(43000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0045
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0045
     * @tc.desc      [Extreme] Verify retryDelay(44000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(44000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0046
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0046
     * @tc.desc      [Extreme] Verify retryDelay(45000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(45000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0047
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0047
     * @tc.desc      [Extreme] Verify retryDelay(46000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(46000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0048
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0048
     * @tc.desc      [Extreme] Verify retryDelay(47000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(47000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0049
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0049
     * @tc.desc      [Extreme] Verify retryDelay(48000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(48000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_RETRY_DELAY_MATRIX_0050
     * @tc.name      ArkTsChildProcess_retryDelay_Matrix_0050
     * @tc.desc      [Extreme] Verify retryDelay(49000) returns 5000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_retryDelay_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 5000
      const actual: number = ChildProcessModel.retryDelay(49000);
      expect(actual).assertEqual(5000);
      expect(typeof actual).assertEqual('number');
    });

  });
}
