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
import { IsolationModel } from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_dynamicisolationprocess]';
const BUNDLE: string = 'DynamicIsolationProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for describeError (50 cases). */
export default function describeErrorMatrixTest(): void {
  describe('DescribeErrorMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DescribeErrorMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DescribeErrorMatrixTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0001
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0001
     * @tc.desc      [PlainString] Verify describeError(err0) returns start EntryAbility1: err0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_describeError_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString; expected: start EntryAbility1: err0
      const actual: string = IsolationModel.describeError('err0');
      expect(actual).assertEqual('start EntryAbility1: err0');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0002
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0002
     * @tc.desc      [PlainString] Verify describeError(err1) returns start EntryAbility1: err1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err1
      const actual: string = IsolationModel.describeError('err1');
      expect(actual).assertEqual('start EntryAbility1: err1');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0003
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0003
     * @tc.desc      [PlainString] Verify describeError(err2) returns start EntryAbility1: err2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err2
      const actual: string = IsolationModel.describeError('err2');
      expect(actual).assertEqual('start EntryAbility1: err2');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0004
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0004
     * @tc.desc      [PlainString] Verify describeError(err3) returns start EntryAbility1: err3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err3
      const actual: string = IsolationModel.describeError('err3');
      expect(actual).assertEqual('start EntryAbility1: err3');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0005
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0005
     * @tc.desc      [PlainString] Verify describeError(err4) returns start EntryAbility1: err4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err4
      const actual: string = IsolationModel.describeError('err4');
      expect(actual).assertEqual('start EntryAbility1: err4');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0006
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0006
     * @tc.desc      [PlainString] Verify describeError(err5) returns start EntryAbility1: err5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err5
      const actual: string = IsolationModel.describeError('err5');
      expect(actual).assertEqual('start EntryAbility1: err5');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0007
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0007
     * @tc.desc      [PlainString] Verify describeError(err6) returns start EntryAbility1: err6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err6
      const actual: string = IsolationModel.describeError('err6');
      expect(actual).assertEqual('start EntryAbility1: err6');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0008
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0008
     * @tc.desc      [PlainString] Verify describeError(err7) returns start EntryAbility1: err7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err7
      const actual: string = IsolationModel.describeError('err7');
      expect(actual).assertEqual('start EntryAbility1: err7');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0009
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0009
     * @tc.desc      [PlainString] Verify describeError(err8) returns start EntryAbility1: err8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err8
      const actual: string = IsolationModel.describeError('err8');
      expect(actual).assertEqual('start EntryAbility1: err8');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0010
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0010
     * @tc.desc      [PlainString] Verify describeError(err9) returns start EntryAbility1: err9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeError_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: start EntryAbility1: err9
      const actual: string = IsolationModel.describeError('err9');
      expect(actual).assertEqual('start EntryAbility1: err9');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0011
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0011
     * @tc.desc      [PlainString] Verify describeError(err10) returns start EntryAbility1: err10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err10
      const actual: string = IsolationModel.describeError('err10');
      expect(actual).assertEqual('start EntryAbility1: err10');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0012
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0012
     * @tc.desc      [PlainString] Verify describeError(err11) returns start EntryAbility1: err11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err11
      const actual: string = IsolationModel.describeError('err11');
      expect(actual).assertEqual('start EntryAbility1: err11');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0013
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0013
     * @tc.desc      [PlainString] Verify describeError(err12) returns start EntryAbility1: err12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err12
      const actual: string = IsolationModel.describeError('err12');
      expect(actual).assertEqual('start EntryAbility1: err12');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0014
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0014
     * @tc.desc      [PlainString] Verify describeError(err13) returns start EntryAbility1: err13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err13
      const actual: string = IsolationModel.describeError('err13');
      expect(actual).assertEqual('start EntryAbility1: err13');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0015
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0015
     * @tc.desc      [PlainString] Verify describeError(err14) returns start EntryAbility1: err14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err14
      const actual: string = IsolationModel.describeError('err14');
      expect(actual).assertEqual('start EntryAbility1: err14');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0016
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0016
     * @tc.desc      [PlainString] Verify describeError(err15) returns start EntryAbility1: err15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err15
      const actual: string = IsolationModel.describeError('err15');
      expect(actual).assertEqual('start EntryAbility1: err15');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0017
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0017
     * @tc.desc      [PlainString] Verify describeError(err16) returns start EntryAbility1: err16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err16
      const actual: string = IsolationModel.describeError('err16');
      expect(actual).assertEqual('start EntryAbility1: err16');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0018
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0018
     * @tc.desc      [PlainString] Verify describeError(err17) returns start EntryAbility1: err17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err17
      const actual: string = IsolationModel.describeError('err17');
      expect(actual).assertEqual('start EntryAbility1: err17');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0019
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0019
     * @tc.desc      [PlainString] Verify describeError(err18) returns start EntryAbility1: err18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err18
      const actual: string = IsolationModel.describeError('err18');
      expect(actual).assertEqual('start EntryAbility1: err18');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0020
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0020
     * @tc.desc      [PlainString] Verify describeError(err19) returns start EntryAbility1: err19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err19
      const actual: string = IsolationModel.describeError('err19');
      expect(actual).assertEqual('start EntryAbility1: err19');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0021
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0021
     * @tc.desc      [PlainString] Verify describeError(err20) returns start EntryAbility1: err20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err20
      const actual: string = IsolationModel.describeError('err20');
      expect(actual).assertEqual('start EntryAbility1: err20');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0022
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0022
     * @tc.desc      [PlainString] Verify describeError(err21) returns start EntryAbility1: err21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err21
      const actual: string = IsolationModel.describeError('err21');
      expect(actual).assertEqual('start EntryAbility1: err21');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0023
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0023
     * @tc.desc      [PlainString] Verify describeError(err22) returns start EntryAbility1: err22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err22
      const actual: string = IsolationModel.describeError('err22');
      expect(actual).assertEqual('start EntryAbility1: err22');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0024
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0024
     * @tc.desc      [PlainString] Verify describeError(err23) returns start EntryAbility1: err23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err23
      const actual: string = IsolationModel.describeError('err23');
      expect(actual).assertEqual('start EntryAbility1: err23');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0025
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0025
     * @tc.desc      [PlainString] Verify describeError(err24) returns start EntryAbility1: err24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err24
      const actual: string = IsolationModel.describeError('err24');
      expect(actual).assertEqual('start EntryAbility1: err24');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0026
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0026
     * @tc.desc      [PlainString] Verify describeError(err25) returns start EntryAbility1: err25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err25
      const actual: string = IsolationModel.describeError('err25');
      expect(actual).assertEqual('start EntryAbility1: err25');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0027
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0027
     * @tc.desc      [PlainString] Verify describeError(err26) returns start EntryAbility1: err26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err26
      const actual: string = IsolationModel.describeError('err26');
      expect(actual).assertEqual('start EntryAbility1: err26');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0028
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0028
     * @tc.desc      [PlainString] Verify describeError(err27) returns start EntryAbility1: err27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err27
      const actual: string = IsolationModel.describeError('err27');
      expect(actual).assertEqual('start EntryAbility1: err27');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0029
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0029
     * @tc.desc      [PlainString] Verify describeError(err28) returns start EntryAbility1: err28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err28
      const actual: string = IsolationModel.describeError('err28');
      expect(actual).assertEqual('start EntryAbility1: err28');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0030
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0030
     * @tc.desc      [PlainString] Verify describeError(err29) returns start EntryAbility1: err29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeError_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: start EntryAbility1: err29
      const actual: string = IsolationModel.describeError('err29');
      expect(actual).assertEqual('start EntryAbility1: err29');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0031
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0031
     * @tc.desc      [PlainString] Verify describeError(err30) returns start EntryAbility1: err30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err30
      const actual: string = IsolationModel.describeError('err30');
      expect(actual).assertEqual('start EntryAbility1: err30');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0032
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0032
     * @tc.desc      [PlainString] Verify describeError(err31) returns start EntryAbility1: err31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err31
      const actual: string = IsolationModel.describeError('err31');
      expect(actual).assertEqual('start EntryAbility1: err31');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0033
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0033
     * @tc.desc      [PlainString] Verify describeError(err32) returns start EntryAbility1: err32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err32
      const actual: string = IsolationModel.describeError('err32');
      expect(actual).assertEqual('start EntryAbility1: err32');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0034
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0034
     * @tc.desc      [PlainString] Verify describeError(err33) returns start EntryAbility1: err33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err33
      const actual: string = IsolationModel.describeError('err33');
      expect(actual).assertEqual('start EntryAbility1: err33');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0035
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0035
     * @tc.desc      [PlainString] Verify describeError(err34) returns start EntryAbility1: err34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err34
      const actual: string = IsolationModel.describeError('err34');
      expect(actual).assertEqual('start EntryAbility1: err34');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0036
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0036
     * @tc.desc      [PlainString] Verify describeError(err35) returns start EntryAbility1: err35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err35
      const actual: string = IsolationModel.describeError('err35');
      expect(actual).assertEqual('start EntryAbility1: err35');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0037
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0037
     * @tc.desc      [PlainString] Verify describeError(err36) returns start EntryAbility1: err36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err36
      const actual: string = IsolationModel.describeError('err36');
      expect(actual).assertEqual('start EntryAbility1: err36');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0038
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0038
     * @tc.desc      [PlainString] Verify describeError(err37) returns start EntryAbility1: err37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err37
      const actual: string = IsolationModel.describeError('err37');
      expect(actual).assertEqual('start EntryAbility1: err37');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0039
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0039
     * @tc.desc      [PlainString] Verify describeError(err38) returns start EntryAbility1: err38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err38
      const actual: string = IsolationModel.describeError('err38');
      expect(actual).assertEqual('start EntryAbility1: err38');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0040
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0040
     * @tc.desc      [PlainString] Verify describeError(err39) returns start EntryAbility1: err39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err39
      const actual: string = IsolationModel.describeError('err39');
      expect(actual).assertEqual('start EntryAbility1: err39');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0041
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0041
     * @tc.desc      [PlainString] Verify describeError(err40) returns start EntryAbility1: err40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err40
      const actual: string = IsolationModel.describeError('err40');
      expect(actual).assertEqual('start EntryAbility1: err40');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0042
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0042
     * @tc.desc      [PlainString] Verify describeError(err41) returns start EntryAbility1: err41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err41
      const actual: string = IsolationModel.describeError('err41');
      expect(actual).assertEqual('start EntryAbility1: err41');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0043
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0043
     * @tc.desc      [PlainString] Verify describeError(err42) returns start EntryAbility1: err42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err42
      const actual: string = IsolationModel.describeError('err42');
      expect(actual).assertEqual('start EntryAbility1: err42');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0044
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0044
     * @tc.desc      [PlainString] Verify describeError(err43) returns start EntryAbility1: err43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err43
      const actual: string = IsolationModel.describeError('err43');
      expect(actual).assertEqual('start EntryAbility1: err43');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0045
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0045
     * @tc.desc      [PlainString] Verify describeError(err44) returns start EntryAbility1: err44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err44
      const actual: string = IsolationModel.describeError('err44');
      expect(actual).assertEqual('start EntryAbility1: err44');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0046
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0046
     * @tc.desc      [PlainString] Verify describeError(err45) returns start EntryAbility1: err45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err45
      const actual: string = IsolationModel.describeError('err45');
      expect(actual).assertEqual('start EntryAbility1: err45');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0047
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0047
     * @tc.desc      [PlainString] Verify describeError(err46) returns start EntryAbility1: err46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err46
      const actual: string = IsolationModel.describeError('err46');
      expect(actual).assertEqual('start EntryAbility1: err46');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0048
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0048
     * @tc.desc      [PlainString] Verify describeError(err47) returns start EntryAbility1: err47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err47
      const actual: string = IsolationModel.describeError('err47');
      expect(actual).assertEqual('start EntryAbility1: err47');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0049
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0049
     * @tc.desc      [PlainString] Verify describeError(err48) returns start EntryAbility1: err48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err48
      const actual: string = IsolationModel.describeError('err48');
      expect(actual).assertEqual('start EntryAbility1: err48');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ERROR_MATRIX_0050
     * @tc.name      DynamicIsolationProcess_describeError_Matrix_0050
     * @tc.desc      [PlainString] Verify describeError(err49) returns start EntryAbility1: err49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeError_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: start EntryAbility1: err49
      const actual: string = IsolationModel.describeError('err49');
      expect(actual).assertEqual('start EntryAbility1: err49');
      expect(actual.length).assertEqual(26);
    });

  });
}
