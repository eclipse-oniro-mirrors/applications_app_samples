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

/** Logic checks for isValidName (50 cases). */
export default function isValidNameExtendedTest(): void {
  describe('IsValidNameExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidNameExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidNameExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0001
     * @tc.name      CliInvocation_isValidName_Extended_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-0-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidName_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-0-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0002
     * @tc.name      CliInvocation_isValidName_Extended_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-1-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-1-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0003
     * @tc.name      CliInvocation_isValidName_Extended_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-2-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-2-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0004
     * @tc.name      CliInvocation_isValidName_Extended_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-3-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-3-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0005
     * @tc.name      CliInvocation_isValidName_Extended_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-4-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-4-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0006
     * @tc.name      CliInvocation_isValidName_Extended_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-5-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-5-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0007
     * @tc.name      CliInvocation_isValidName_Extended_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-6-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-6-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0008
     * @tc.name      CliInvocation_isValidName_Extended_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-7-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-7-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0009
     * @tc.name      CliInvocation_isValidName_Extended_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-8-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-8-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0010
     * @tc.name      CliInvocation_isValidName_Extended_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-9-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-9-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0011
     * @tc.name      CliInvocation_isValidName_Extended_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-10-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-10-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0012
     * @tc.name      CliInvocation_isValidName_Extended_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-11-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-11-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0013
     * @tc.name      CliInvocation_isValidName_Extended_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-12-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-12-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0014
     * @tc.name      CliInvocation_isValidName_Extended_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-13-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-13-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0015
     * @tc.name      CliInvocation_isValidName_Extended_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-14-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-14-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0016
     * @tc.name      CliInvocation_isValidName_Extended_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-15-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-15-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0017
     * @tc.name      CliInvocation_isValidName_Extended_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-16-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-16-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0018
     * @tc.name      CliInvocation_isValidName_Extended_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-17-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-17-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0019
     * @tc.name      CliInvocation_isValidName_Extended_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-18-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-18-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0020
     * @tc.name      CliInvocation_isValidName_Extended_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-19-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-19-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0021
     * @tc.name      CliInvocation_isValidName_Extended_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-20-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-20-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0022
     * @tc.name      CliInvocation_isValidName_Extended_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-21-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-21-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0023
     * @tc.name      CliInvocation_isValidName_Extended_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-22-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-22-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0024
     * @tc.name      CliInvocation_isValidName_Extended_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-23-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-23-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0025
     * @tc.name      CliInvocation_isValidName_Extended_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-24-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-24-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0026
     * @tc.name      CliInvocation_isValidName_Extended_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-25-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-25-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0027
     * @tc.name      CliInvocation_isValidName_Extended_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-26-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-26-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0028
     * @tc.name      CliInvocation_isValidName_Extended_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-27-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-27-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0029
     * @tc.name      CliInvocation_isValidName_Extended_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-28-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-28-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0030
     * @tc.name      CliInvocation_isValidName_Extended_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-29-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-29-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0031
     * @tc.name      CliInvocation_isValidName_Extended_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-30-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-30-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0032
     * @tc.name      CliInvocation_isValidName_Extended_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-31-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-31-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0033
     * @tc.name      CliInvocation_isValidName_Extended_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-32-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-32-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0034
     * @tc.name      CliInvocation_isValidName_Extended_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-33-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-33-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0035
     * @tc.name      CliInvocation_isValidName_Extended_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-34-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-34-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0036
     * @tc.name      CliInvocation_isValidName_Extended_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-35-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-35-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0037
     * @tc.name      CliInvocation_isValidName_Extended_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-36-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-36-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0038
     * @tc.name      CliInvocation_isValidName_Extended_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-37-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-37-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0039
     * @tc.name      CliInvocation_isValidName_Extended_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-38-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-38-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0040
     * @tc.name      CliInvocation_isValidName_Extended_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-39-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-39-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0041
     * @tc.name      CliInvocation_isValidName_Extended_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-40-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-40-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0042
     * @tc.name      CliInvocation_isValidName_Extended_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-41-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-41-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0043
     * @tc.name      CliInvocation_isValidName_Extended_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-42-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-42-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0044
     * @tc.name      CliInvocation_isValidName_Extended_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-43-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-43-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0045
     * @tc.name      CliInvocation_isValidName_Extended_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-44-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-44-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0046
     * @tc.name      CliInvocation_isValidName_Extended_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-45-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-45-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0047
     * @tc.name      CliInvocation_isValidName_Extended_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-46-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-46-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0048
     * @tc.name      CliInvocation_isValidName_Extended_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-47-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-47-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0049
     * @tc.name      CliInvocation_isValidName_Extended_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-48-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-48-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_EXTENDED_0050
     * @tc.name      CliInvocation_isValidName_Extended_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidName(name-49-ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('name-49-ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
