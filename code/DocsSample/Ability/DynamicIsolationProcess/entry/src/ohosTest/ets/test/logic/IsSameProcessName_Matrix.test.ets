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

/** Logic checks for isSameProcessName (50 cases). */
export default function isSameProcessNameMatrixTest(): void {
  describe('IsSameProcessNameMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSameProcessNameMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSameProcessNameMatrixTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0001
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0001
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0002
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0002
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0003
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0003
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0004
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0004
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0005
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0005
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0006
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0006
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0007
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0007
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0008
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0008
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0009
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0009
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0010
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0010
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0011
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0011
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0012
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0012
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0013
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0013
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0014
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0014
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0015
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0015
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0016
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0016
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0017
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0017
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0018
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0018
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0019
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0019
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0020
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0020
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0021
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0021
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0022
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0022
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0023
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0023
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0024
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0024
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0025
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0025
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0026
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0026
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0027
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0027
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0028
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0028
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0029
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0029
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0030
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0030
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0031
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0031
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0032
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0032
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0033
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0033
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0034
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0034
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0035
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0035
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0036
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0036
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0037
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0037
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0038
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0038
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0039
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0039
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0040
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0040
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0041
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0041
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0042
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0042
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0043
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0043
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0044
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0044
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0045
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0045
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0046
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0046
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0047
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0047
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0048
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0048
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0049
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0049
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_SAME_PROCESS_NAME_MATRIX_0050
     * @tc.name      DynamicIsolationProcess_isSameProcessName_Matrix_0050
     * @tc.desc      [DelimitedString+DelimitedString|expected=false] Verify isSameProcessName(com.sample:key, com.sample:other) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isSameProcessName_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+DelimitedString|expected=false; expected: False
      const actual: boolean = IsolationModel.isSameProcessName('com.sample:key', 'com.sample:other');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
