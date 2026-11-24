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

/** Logic checks for isValidBundleName (50 cases). */
export default function isValidBundleNameCoreTest(): void {
  describe('IsValidBundleNameCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0001
     * @tc.name      CliInvocation_isValidBundleName_Core_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidBundleName_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0002
     * @tc.name      CliInvocation_isValidBundleName_Core_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0003
     * @tc.name      CliInvocation_isValidBundleName_Core_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0004
     * @tc.name      CliInvocation_isValidBundleName_Core_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0005
     * @tc.name      CliInvocation_isValidBundleName_Core_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0006
     * @tc.name      CliInvocation_isValidBundleName_Core_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0007
     * @tc.name      CliInvocation_isValidBundleName_Core_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0008
     * @tc.name      CliInvocation_isValidBundleName_Core_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0009
     * @tc.name      CliInvocation_isValidBundleName_Core_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0010
     * @tc.name      CliInvocation_isValidBundleName_Core_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0011
     * @tc.name      CliInvocation_isValidBundleName_Core_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0012
     * @tc.name      CliInvocation_isValidBundleName_Core_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0013
     * @tc.name      CliInvocation_isValidBundleName_Core_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0014
     * @tc.name      CliInvocation_isValidBundleName_Core_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0015
     * @tc.name      CliInvocation_isValidBundleName_Core_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0016
     * @tc.name      CliInvocation_isValidBundleName_Core_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0017
     * @tc.name      CliInvocation_isValidBundleName_Core_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0018
     * @tc.name      CliInvocation_isValidBundleName_Core_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0019
     * @tc.name      CliInvocation_isValidBundleName_Core_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0020
     * @tc.name      CliInvocation_isValidBundleName_Core_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0021
     * @tc.name      CliInvocation_isValidBundleName_Core_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0022
     * @tc.name      CliInvocation_isValidBundleName_Core_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0023
     * @tc.name      CliInvocation_isValidBundleName_Core_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0024
     * @tc.name      CliInvocation_isValidBundleName_Core_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0025
     * @tc.name      CliInvocation_isValidBundleName_Core_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0026
     * @tc.name      CliInvocation_isValidBundleName_Core_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0027
     * @tc.name      CliInvocation_isValidBundleName_Core_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0028
     * @tc.name      CliInvocation_isValidBundleName_Core_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0029
     * @tc.name      CliInvocation_isValidBundleName_Core_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0030
     * @tc.name      CliInvocation_isValidBundleName_Core_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0031
     * @tc.name      CliInvocation_isValidBundleName_Core_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0032
     * @tc.name      CliInvocation_isValidBundleName_Core_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0033
     * @tc.name      CliInvocation_isValidBundleName_Core_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0034
     * @tc.name      CliInvocation_isValidBundleName_Core_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0035
     * @tc.name      CliInvocation_isValidBundleName_Core_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0036
     * @tc.name      CliInvocation_isValidBundleName_Core_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0037
     * @tc.name      CliInvocation_isValidBundleName_Core_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0038
     * @tc.name      CliInvocation_isValidBundleName_Core_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0039
     * @tc.name      CliInvocation_isValidBundleName_Core_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0040
     * @tc.name      CliInvocation_isValidBundleName_Core_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0041
     * @tc.name      CliInvocation_isValidBundleName_Core_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0042
     * @tc.name      CliInvocation_isValidBundleName_Core_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0043
     * @tc.name      CliInvocation_isValidBundleName_Core_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0044
     * @tc.name      CliInvocation_isValidBundleName_Core_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0045
     * @tc.name      CliInvocation_isValidBundleName_Core_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0046
     * @tc.name      CliInvocation_isValidBundleName_Core_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0047
     * @tc.name      CliInvocation_isValidBundleName_Core_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0048
     * @tc.name      CliInvocation_isValidBundleName_Core_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0049
     * @tc.name      CliInvocation_isValidBundleName_Core_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_CORE_0050
     * @tc.name      CliInvocation_isValidBundleName_Core_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.app49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('com.sample.app49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
