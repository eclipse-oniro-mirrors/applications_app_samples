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

/** Logic checks for normalizeParams (50 cases). */
export default function normalizeParamsMatrixTest(): void {
  describe('NormalizeParamsMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}NormalizeParamsMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}NormalizeParamsMatrixTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0001
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0001
     * @tc.desc      [EmptyString] Verify normalizeParams((empty)) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString; expected: (empty)
      const actual: string = ChildProcessModel.normalizeParams('');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0002
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0002
     * @tc.desc      [ShortString] Verify normalizeParams(   ) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = ChildProcessModel.normalizeParams('   ');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0003
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0003
     * @tc.desc      [ShortString] Verify normalizeParams(\\n) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = ChildProcessModel.normalizeParams('\n');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0004
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0004
     * @tc.desc      [ShortString] Verify normalizeParams(\\t\\t) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = ChildProcessModel.normalizeParams('\t\t');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0005
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0005
     * @tc.desc      [ShortString] Verify normalizeParams(\\r\\n) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = ChildProcessModel.normalizeParams('\r\n');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0006
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0006
     * @tc.desc      [WhitespaceString] Verify normalizeParams( a\\tb ) returns a\\tb.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: a\\tb
      const actual: string = ChildProcessModel.normalizeParams(' a\tb ');
      expect(actual).assertEqual('a\tb');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0007
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0007
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v0  ) returns v0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: v0
      const actual: string = ChildProcessModel.normalizeParams('  v0  ');
      expect(actual).assertEqual('v0');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0008
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0008
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v1  ) returns v1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: v1
      const actual: string = ChildProcessModel.normalizeParams('  v1  ');
      expect(actual).assertEqual('v1');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0009
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0009
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v2  ) returns v2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: v2
      const actual: string = ChildProcessModel.normalizeParams('  v2  ');
      expect(actual).assertEqual('v2');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0010
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0010
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v3  ) returns v3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: v3
      const actual: string = ChildProcessModel.normalizeParams('  v3  ');
      expect(actual).assertEqual('v3');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0011
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0011
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v4  ) returns v4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v4
      const actual: string = ChildProcessModel.normalizeParams('  v4  ');
      expect(actual).assertEqual('v4');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0012
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0012
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v5  ) returns v5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v5
      const actual: string = ChildProcessModel.normalizeParams('  v5  ');
      expect(actual).assertEqual('v5');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0013
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0013
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v6  ) returns v6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v6
      const actual: string = ChildProcessModel.normalizeParams('  v6  ');
      expect(actual).assertEqual('v6');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0014
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0014
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v7  ) returns v7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v7
      const actual: string = ChildProcessModel.normalizeParams('  v7  ');
      expect(actual).assertEqual('v7');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0015
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0015
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  value8  ) returns value8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: value8
      const actual: string = ChildProcessModel.normalizeParams('  value8  ');
      expect(actual).assertEqual('value8');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0016
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0016
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v9  ) returns v9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v9
      const actual: string = ChildProcessModel.normalizeParams('  v9  ');
      expect(actual).assertEqual('v9');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0017
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0017
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v10  ) returns v10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v10
      const actual: string = ChildProcessModel.normalizeParams('  v10  ');
      expect(actual).assertEqual('v10');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0018
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0018
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v11  ) returns v11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v11
      const actual: string = ChildProcessModel.normalizeParams('  v11  ');
      expect(actual).assertEqual('v11');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0019
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0019
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v12  ) returns v12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v12
      const actual: string = ChildProcessModel.normalizeParams('  v12  ');
      expect(actual).assertEqual('v12');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0020
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0020
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v13  ) returns v13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v13
      const actual: string = ChildProcessModel.normalizeParams('  v13  ');
      expect(actual).assertEqual('v13');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0021
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0021
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v14  ) returns v14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v14
      const actual: string = ChildProcessModel.normalizeParams('  v14  ');
      expect(actual).assertEqual('v14');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0022
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0022
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v15  ) returns v15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v15
      const actual: string = ChildProcessModel.normalizeParams('  v15  ');
      expect(actual).assertEqual('v15');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0023
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0023
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v16  ) returns v16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v16
      const actual: string = ChildProcessModel.normalizeParams('  v16  ');
      expect(actual).assertEqual('v16');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0024
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0024
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v17  ) returns v17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v17
      const actual: string = ChildProcessModel.normalizeParams('  v17  ');
      expect(actual).assertEqual('v17');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0025
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0025
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v18  ) returns v18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v18
      const actual: string = ChildProcessModel.normalizeParams('  v18  ');
      expect(actual).assertEqual('v18');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0026
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0026
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v19  ) returns v19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v19
      const actual: string = ChildProcessModel.normalizeParams('  v19  ');
      expect(actual).assertEqual('v19');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0027
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0027
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v20  ) returns v20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v20
      const actual: string = ChildProcessModel.normalizeParams('  v20  ');
      expect(actual).assertEqual('v20');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0028
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0028
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v21  ) returns v21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v21
      const actual: string = ChildProcessModel.normalizeParams('  v21  ');
      expect(actual).assertEqual('v21');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0029
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0029
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v22  ) returns v22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v22
      const actual: string = ChildProcessModel.normalizeParams('  v22  ');
      expect(actual).assertEqual('v22');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0030
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0030
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v23  ) returns v23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: v23
      const actual: string = ChildProcessModel.normalizeParams('  v23  ');
      expect(actual).assertEqual('v23');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0031
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0031
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v24  ) returns v24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v24
      const actual: string = ChildProcessModel.normalizeParams('  v24  ');
      expect(actual).assertEqual('v24');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0032
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0032
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v25  ) returns v25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v25
      const actual: string = ChildProcessModel.normalizeParams('  v25  ');
      expect(actual).assertEqual('v25');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0033
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0033
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v26  ) returns v26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v26
      const actual: string = ChildProcessModel.normalizeParams('  v26  ');
      expect(actual).assertEqual('v26');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0034
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0034
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v27  ) returns v27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v27
      const actual: string = ChildProcessModel.normalizeParams('  v27  ');
      expect(actual).assertEqual('v27');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0035
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0035
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v28  ) returns v28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v28
      const actual: string = ChildProcessModel.normalizeParams('  v28  ');
      expect(actual).assertEqual('v28');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0036
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0036
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v29  ) returns v29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v29
      const actual: string = ChildProcessModel.normalizeParams('  v29  ');
      expect(actual).assertEqual('v29');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0037
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0037
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v30  ) returns v30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v30
      const actual: string = ChildProcessModel.normalizeParams('  v30  ');
      expect(actual).assertEqual('v30');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0038
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0038
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v31  ) returns v31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v31
      const actual: string = ChildProcessModel.normalizeParams('  v31  ');
      expect(actual).assertEqual('v31');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0039
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0039
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v32  ) returns v32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v32
      const actual: string = ChildProcessModel.normalizeParams('  v32  ');
      expect(actual).assertEqual('v32');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0040
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0040
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v33  ) returns v33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v33
      const actual: string = ChildProcessModel.normalizeParams('  v33  ');
      expect(actual).assertEqual('v33');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0041
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0041
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v34  ) returns v34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v34
      const actual: string = ChildProcessModel.normalizeParams('  v34  ');
      expect(actual).assertEqual('v34');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0042
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0042
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v35  ) returns v35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v35
      const actual: string = ChildProcessModel.normalizeParams('  v35  ');
      expect(actual).assertEqual('v35');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0043
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0043
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v36  ) returns v36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v36
      const actual: string = ChildProcessModel.normalizeParams('  v36  ');
      expect(actual).assertEqual('v36');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0044
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0044
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v37  ) returns v37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v37
      const actual: string = ChildProcessModel.normalizeParams('  v37  ');
      expect(actual).assertEqual('v37');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0045
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0045
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v38  ) returns v38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v38
      const actual: string = ChildProcessModel.normalizeParams('  v38  ');
      expect(actual).assertEqual('v38');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0046
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0046
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v39  ) returns v39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v39
      const actual: string = ChildProcessModel.normalizeParams('  v39  ');
      expect(actual).assertEqual('v39');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0047
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0047
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v40  ) returns v40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v40
      const actual: string = ChildProcessModel.normalizeParams('  v40  ');
      expect(actual).assertEqual('v40');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0048
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0048
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v41  ) returns v41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v41
      const actual: string = ChildProcessModel.normalizeParams('  v41  ');
      expect(actual).assertEqual('v41');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0049
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0049
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v42  ) returns v42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v42
      const actual: string = ChildProcessModel.normalizeParams('  v42  ');
      expect(actual).assertEqual('v42');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_NORMALIZE_PARAMS_MATRIX_0050
     * @tc.name      ArkTsChildProcess_normalizeParams_Matrix_0050
     * @tc.desc      [WhitespaceString] Verify normalizeParams(  v43  ) returns v43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_normalizeParams_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: v43
      const actual: string = ChildProcessModel.normalizeParams('  v43  ');
      expect(actual).assertEqual('v43');
      expect(actual.length).assertEqual(3);
    });

  });
}
