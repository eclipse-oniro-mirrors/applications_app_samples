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

/** Logic checks for stateName (50 cases). */
export default function stateNameMatrixTest(): void {
  describe('StateNameMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}StateNameMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}StateNameMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0001
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0001
     * @tc.desc      [Extreme] Verify stateName(65535) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_stateName_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(65535);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0002
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0002
     * @tc.desc      [SmallPositive] Verify stateName(3) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(3);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0003
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0003
     * @tc.desc      [Large] Verify stateName(1000) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(1000);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0004
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0004
     * @tc.desc      [Negative] Verify stateName(-8) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-8);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0005
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0005
     * @tc.desc      [Medium] Verify stateName(4) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(4);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0006
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0006
     * @tc.desc      [Negative] Verify stateName(-2147483648) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-2147483648);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0007
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0007
     * @tc.desc      [Medium] Verify stateName(5) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(5);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0008
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0008
     * @tc.desc      [Large] Verify stateName(1024) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(1024);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0009
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0009
     * @tc.desc      [Negative] Verify stateName(-7) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-7);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0010
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0010
     * @tc.desc      [Medium] Verify stateName(6) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_stateName_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(6);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0011
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0011
     * @tc.desc      [Large] Verify stateName(256) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(256);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0012
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0012
     * @tc.desc      [Medium] Verify stateName(7) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(7);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0013
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0013
     * @tc.desc      [Large] Verify stateName(128) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(128);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0014
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0014
     * @tc.desc      [Negative] Verify stateName(-6) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-6);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0015
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0015
     * @tc.desc      [Medium] Verify stateName(8) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(8);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0016
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0016
     * @tc.desc      [Large] Verify stateName(4096) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(4096);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0017
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0017
     * @tc.desc      [Medium] Verify stateName(9) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(9);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0018
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0018
     * @tc.desc      [Medium] Verify stateName(50) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(50);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0019
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0019
     * @tc.desc      [Negative] Verify stateName(-5) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-5);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0020
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0020
     * @tc.desc      [Medium] Verify stateName(10) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(10);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0021
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0021
     * @tc.desc      [Extreme] Verify stateName(65535) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(65535);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0022
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0022
     * @tc.desc      [Medium] Verify stateName(11) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(11);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0023
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0023
     * @tc.desc      [Large] Verify stateName(10000) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(10000);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0024
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0024
     * @tc.desc      [Negative] Verify stateName(-4) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-4);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0025
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0025
     * @tc.desc      [Medium] Verify stateName(12) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(12);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0026
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0026
     * @tc.desc      [Medium] Verify stateName(31) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(31);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0027
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0027
     * @tc.desc      [Medium] Verify stateName(13) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(13);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0028
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0028
     * @tc.desc      [Medium] Verify stateName(63) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(63);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0029
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0029
     * @tc.desc      [Negative] Verify stateName(-3) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-3);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0030
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0030
     * @tc.desc      [Medium] Verify stateName(14) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_stateName_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(14);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0031
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0031
     * @tc.desc      [Medium] Verify stateName(32) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(32);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0032
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0032
     * @tc.desc      [Medium] Verify stateName(15) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(15);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0033
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0033
     * @tc.desc      [Medium] Verify stateName(64) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(64);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0034
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0034
     * @tc.desc      [Negative] Verify stateName(-2) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-2);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0035
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0035
     * @tc.desc      [Medium] Verify stateName(16) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(16);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0036
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0036
     * @tc.desc      [Large] Verify stateName(127) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(127);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0037
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0037
     * @tc.desc      [Medium] Verify stateName(17) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(17);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0038
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0038
     * @tc.desc      [Medium] Verify stateName(25) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(25);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0039
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0039
     * @tc.desc      [Negative] Verify stateName(-1) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-1);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0040
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0040
     * @tc.desc      [Medium] Verify stateName(18) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(18);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0041
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0041
     * @tc.desc      [Large] Verify stateName(255) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(255);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0042
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0042
     * @tc.desc      [Medium] Verify stateName(19) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(19);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0043
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0043
     * @tc.desc      [Extreme] Verify stateName(100000) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(100000);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0044
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0044
     * @tc.desc      [Negative] Verify stateName(-10) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-10);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0045
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0045
     * @tc.desc      [Zero] Verify stateName(0) returns IDLE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero; expected: IDLE
      const actual: string = ChildProcessModel.stateName(0);
      expect(actual).assertEqual('IDLE');
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0046
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0046
     * @tc.desc      [Extreme] Verify stateName(2147483647) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(2147483647);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0047
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0047
     * @tc.desc      [SmallPositive] Verify stateName(1) returns RUNNING.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: RUNNING
      const actual: string = ChildProcessModel.stateName(1);
      expect(actual).assertEqual('RUNNING');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0048
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0048
     * @tc.desc      [Medium] Verify stateName(100) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(100);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0049
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0049
     * @tc.desc      [Negative] Verify stateName(-9) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = ChildProcessModel.stateName(-9);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_STATE_NAME_MATRIX_0050
     * @tc.name      ArkTsChildProcess_stateName_Matrix_0050
     * @tc.desc      [SmallPositive] Verify stateName(2) returns EXITED.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_stateName_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: EXITED
      const actual: string = ChildProcessModel.stateName(2);
      expect(actual).assertEqual('EXITED');
      expect(actual.length).assertEqual(6);
    });

  });
}
