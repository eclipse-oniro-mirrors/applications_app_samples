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
export default function isValidBundleNameBoundaryTest(): void {
  describe('IsValidBundleNameBoundaryTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameBoundaryTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameBoundaryTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0001
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample0.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidBundleName_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample0.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0002
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample1.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample1.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0003
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample2.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample2.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0004
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample3.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample3.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0005
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample4.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample4.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0006
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample5.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample5.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0007
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample6.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample6.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0008
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample7.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample7.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0009
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample8.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample8.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0010
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample9.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidBundleName_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample9.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0011
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample10.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample10.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0012
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample11.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample11.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0013
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample12.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample12.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0014
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample13.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample13.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0015
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample14.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample14.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0016
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample15.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample15.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0017
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample16.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample16.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0018
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample17.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample17.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0019
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample18.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample18.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0020
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample19.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample19.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0021
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample20.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample20.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0022
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample21.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample21.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0023
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample22.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample22.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0024
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample23.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample23.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0025
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample24.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample24.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0026
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample25.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample25.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0027
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample26.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample26.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0028
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample27.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample27.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0029
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample28.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample28.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0030
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample29.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidBundleName_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample29.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0031
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample30.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample30.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0032
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample31.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample31.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0033
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample32.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample32.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0034
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample33.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample33.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0035
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample34.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample34.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0036
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample35.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample35.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0037
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample36.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample36.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0038
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample37.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample37.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0039
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample38.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample38.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0040
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample39.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample39.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0041
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample40.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample40.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0042
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample41.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample41.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0043
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample42.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample42.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0044
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample43.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample43.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0045
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample44.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample44.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0046
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample45.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample45.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0047
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample46.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample46.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0048
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample47.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample47.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0049
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample48.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample48.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_BUNDLE_NAME_BOUNDARY_0050
     * @tc.name      CliInvocation_isValidBundleName_Boundary_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.sample49.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidBundleName_Boundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isValidBundleName('org.sample49.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
