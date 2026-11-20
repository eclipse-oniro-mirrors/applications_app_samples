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

/** Logic checks for isSuccessCode (50 cases). */
export default function isSuccessCodeMatrixTest(): void {
  describe('IsSuccessCodeMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSuccessCodeMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSuccessCodeMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0001
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0001
     * @tc.desc      [Extreme|expected=false] Verify isSuccessCode(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0002
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0002
     * @tc.desc      [SmallPositive|expected=false] Verify isSuccessCode(3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0003
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0003
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0004
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0004
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0005
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0005
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0006
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0006
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0007
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0007
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0008
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0008
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0009
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0009
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0010
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0010
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0011
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0011
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(256) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(256);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0012
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0012
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0013
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0013
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(128) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(128);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0014
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0014
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0015
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0015
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0016
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0016
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0017
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0017
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0018
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0018
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(50) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(50);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0019
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0019
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0020
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0020
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0021
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0021
     * @tc.desc      [Extreme|expected=false] Verify isSuccessCode(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0022
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0022
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(11);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0023
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0023
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(10000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(10000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0024
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0024
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0025
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0025
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(12);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0026
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0026
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(31);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0027
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0027
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(13);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0028
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0028
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(63) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(63);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0029
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0029
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0030
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0030
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(14);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0031
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0031
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(32);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0032
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0032
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(15);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0033
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0033
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(64) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(64);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0034
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0034
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0035
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0035
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(16);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0036
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0036
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(127) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(127);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0037
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0037
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(17);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0038
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0038
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(25);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0039
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0039
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0040
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0040
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(18);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0041
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0041
     * @tc.desc      [Large|expected=false] Verify isSuccessCode(255) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(255);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0042
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0042
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(19);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0043
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0043
     * @tc.desc      [Extreme|expected=false] Verify isSuccessCode(100000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(100000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0044
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0044
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0045
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0045
     * @tc.desc      [Zero|expected=true] Verify isSuccessCode(0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSuccessCode(0);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0046
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0046
     * @tc.desc      [Extreme|expected=false] Verify isSuccessCode(2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0047
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0047
     * @tc.desc      [SmallPositive|expected=false] Verify isSuccessCode(1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0048
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0048
     * @tc.desc      [Medium|expected=false] Verify isSuccessCode(100) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(100);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0049
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0049
     * @tc.desc      [Negative|expected=false] Verify isSuccessCode(-9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(-9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SUCCESS_CODE_MATRIX_0050
     * @tc.name      ArkTsChildProcess_isSuccessCode_Matrix_0050
     * @tc.desc      [SmallPositive|expected=false] Verify isSuccessCode(2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSuccessCode_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSuccessCode(2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
