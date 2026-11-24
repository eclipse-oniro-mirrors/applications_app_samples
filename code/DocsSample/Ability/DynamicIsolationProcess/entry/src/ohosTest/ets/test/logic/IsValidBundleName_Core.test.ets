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
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0001
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0002
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0003
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0004
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0005
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0006
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0007
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0008
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0009
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0010
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0011
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0012
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0013
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0014
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0015
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0016
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0017
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0018
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0019
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0020
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0021
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0022
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0023
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0024
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0025
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0026
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0027
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0028
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0029
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0030
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0031
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0032
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0033
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0034
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0035
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0036
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0037
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0038
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0039
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0040
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0041
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0042
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0043
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0044
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0045
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0046
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0047
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0048
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0049
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_CORE_0050
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Core_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.iso49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('com.sample.iso49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
