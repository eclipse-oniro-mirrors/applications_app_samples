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

/** Logic checks for isValidPath (50 cases). */
export default function isValidPathMatrixTest(): void {
  describe('IsValidPathMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidPathMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidPathMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0001
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0001
     * @tc.desc      [EmptyString|expected=false] Verify isValidPath((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0002
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidPath(a.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPath('a.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0003
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0003
     * @tc.desc      [ShortString|expected=false] Verify isValidPath(abc) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('abc');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0004
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0004
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(a..b.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('a..b.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0005
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidPath(.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPath('.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0006
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidPath(x.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPath('x.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0007
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidPath(dir/x.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPath('dir/x.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0008
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0008
     * @tc.desc      [ShortString|expected=false] Verify isValidPath(..) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('..');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0009
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0009
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(a.et) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('a.et');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0010
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0010
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(a.etsx) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('a.etsx');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0011
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0011
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item0) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item0');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0012
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0012
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item1');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0013
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0013
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item2');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0014
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0014
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item3');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0015
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0015
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item4');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0016
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0016
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item5');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0017
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0017
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item6');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0018
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0018
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item7');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0019
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0019
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item8');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0020
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0020
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item9');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0021
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0021
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item10');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0022
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0022
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item11');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0023
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0023
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item12');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0024
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0024
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item13');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0025
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0025
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item14');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0026
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0026
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item15');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0027
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0027
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item16');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0028
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0028
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item17');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0029
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0029
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item18');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0030
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0030
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item19');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0031
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0031
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item20) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item20');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0032
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0032
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item21) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item21');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0033
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0033
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item22) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item22');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0034
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0034
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item23) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item23');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0035
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0035
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item24) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item24');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0036
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0036
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item25');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0037
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0037
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item26) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item26');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0038
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0038
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item27) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item27');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0039
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0039
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item28) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item28');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0040
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0040
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item29) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item29');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0041
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0041
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item30) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item30');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0042
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0042
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item31');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0043
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0043
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item32');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0044
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0044
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item33) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item33');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0045
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0045
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item34) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item34');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0046
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0046
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item35) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item35');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0047
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0047
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item36) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item36');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0048
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0048
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item37) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item37');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0049
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0049
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item38) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item38');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_MATRIX_0050
     * @tc.name      ArkTsChildProcess_isValidPath_Matrix_0050
     * @tc.desc      [PlainString|expected=false] Verify isValidPath(item39) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('item39');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
