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

/** Logic checks for isValidEntryParams (50 cases). */
export default function isValidEntryParamsMatrixTest(): void {
  describe('IsValidEntryParamsMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidEntryParamsMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidEntryParamsMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0001
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0002
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0003
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0004
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0005
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0006
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0007
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0008
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0009
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0010
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0011
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0012
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0013
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0014
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0015
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0016
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0017
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0018
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0019
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0020
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0021
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0022
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0023
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0024
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0025
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0026
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0027
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0028
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0029
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0030
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0031
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0032
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0033
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0034
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0035
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0036
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0037
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0038
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0039
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0040
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0041
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0042
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0043
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0044
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0045
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0046
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0047
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0048
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0049
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_MATRIX_0050
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Matrix_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(param49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('param49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
