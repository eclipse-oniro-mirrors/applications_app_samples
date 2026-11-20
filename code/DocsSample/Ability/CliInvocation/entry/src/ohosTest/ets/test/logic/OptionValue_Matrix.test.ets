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
import { CliModel } from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_cliinvocation]';
const BUNDLE: string = 'CliInvocation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for optionValue (50 cases). */
export default function optionValueMatrixTest(): void {
  describe('OptionValueMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}OptionValueMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}OptionValueMatrixTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0001
     * @tc.name      CliInvocation_optionValue_Matrix_0001
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_optionValue_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0002
     * @tc.name      CliInvocation_optionValue_Matrix_0002
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0003
     * @tc.name      CliInvocation_optionValue_Matrix_0003
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0004
     * @tc.name      CliInvocation_optionValue_Matrix_0004
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0005
     * @tc.name      CliInvocation_optionValue_Matrix_0005
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0006
     * @tc.name      CliInvocation_optionValue_Matrix_0006
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0007
     * @tc.name      CliInvocation_optionValue_Matrix_0007
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0008
     * @tc.name      CliInvocation_optionValue_Matrix_0008
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0009
     * @tc.name      CliInvocation_optionValue_Matrix_0009
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0010
     * @tc.name      CliInvocation_optionValue_Matrix_0010
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_optionValue_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0011
     * @tc.name      CliInvocation_optionValue_Matrix_0011
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0012
     * @tc.name      CliInvocation_optionValue_Matrix_0012
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0013
     * @tc.name      CliInvocation_optionValue_Matrix_0013
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0014
     * @tc.name      CliInvocation_optionValue_Matrix_0014
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0015
     * @tc.name      CliInvocation_optionValue_Matrix_0015
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0016
     * @tc.name      CliInvocation_optionValue_Matrix_0016
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0017
     * @tc.name      CliInvocation_optionValue_Matrix_0017
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0018
     * @tc.name      CliInvocation_optionValue_Matrix_0018
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0019
     * @tc.name      CliInvocation_optionValue_Matrix_0019
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0020
     * @tc.name      CliInvocation_optionValue_Matrix_0020
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0021
     * @tc.name      CliInvocation_optionValue_Matrix_0021
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0022
     * @tc.name      CliInvocation_optionValue_Matrix_0022
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0023
     * @tc.name      CliInvocation_optionValue_Matrix_0023
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0024
     * @tc.name      CliInvocation_optionValue_Matrix_0024
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0025
     * @tc.name      CliInvocation_optionValue_Matrix_0025
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0026
     * @tc.name      CliInvocation_optionValue_Matrix_0026
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0027
     * @tc.name      CliInvocation_optionValue_Matrix_0027
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0028
     * @tc.name      CliInvocation_optionValue_Matrix_0028
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0029
     * @tc.name      CliInvocation_optionValue_Matrix_0029
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0030
     * @tc.name      CliInvocation_optionValue_Matrix_0030
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_optionValue_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0031
     * @tc.name      CliInvocation_optionValue_Matrix_0031
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0032
     * @tc.name      CliInvocation_optionValue_Matrix_0032
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0033
     * @tc.name      CliInvocation_optionValue_Matrix_0033
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0034
     * @tc.name      CliInvocation_optionValue_Matrix_0034
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0035
     * @tc.name      CliInvocation_optionValue_Matrix_0035
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0036
     * @tc.name      CliInvocation_optionValue_Matrix_0036
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0037
     * @tc.name      CliInvocation_optionValue_Matrix_0037
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0038
     * @tc.name      CliInvocation_optionValue_Matrix_0038
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0039
     * @tc.name      CliInvocation_optionValue_Matrix_0039
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0040
     * @tc.name      CliInvocation_optionValue_Matrix_0040
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0041
     * @tc.name      CliInvocation_optionValue_Matrix_0041
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0042
     * @tc.name      CliInvocation_optionValue_Matrix_0042
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0043
     * @tc.name      CliInvocation_optionValue_Matrix_0043
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0044
     * @tc.name      CliInvocation_optionValue_Matrix_0044
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0045
     * @tc.name      CliInvocation_optionValue_Matrix_0045
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0046
     * @tc.name      CliInvocation_optionValue_Matrix_0046
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0047
     * @tc.name      CliInvocation_optionValue_Matrix_0047
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0048
     * @tc.name      CliInvocation_optionValue_Matrix_0048
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0049
     * @tc.name      CliInvocation_optionValue_Matrix_0049
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_OPTION_VALUE_MATRIX_0050
     * @tc.name      CliInvocation_optionValue_Matrix_0050
     * @tc.desc      [SmallArray+DelimitedString] Verify optionValue([--bundlename, com.x], --bundlename) returns com.x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_optionValue_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray+DelimitedString; expected: com.x
      const actual: string = CliModel.optionValue(['--bundlename', 'com.x'], '--bundlename');
      expect(actual).assertEqual('com.x');
      expect(actual.length).assertEqual(5);
    });

  });
}
