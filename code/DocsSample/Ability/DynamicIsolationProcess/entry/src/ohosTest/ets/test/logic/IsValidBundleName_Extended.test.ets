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
export default function isValidBundleNameExtendedTest(): void {
  describe('IsValidBundleNameExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameExtendedTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0001
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0001
     * @tc.desc      [ShortString|expected=true] Verify isValidBundleName(a.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('a.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0002
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0003
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0004
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0005
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0006
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0007
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0008
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0009
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0010
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0011
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0012
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0013
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0014
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0015
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0016
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0017
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0018
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0019
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0020
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0021
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0022
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0023
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0024
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0025
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0026
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0027
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0028
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0029
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0030
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0031
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0032
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0033
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0034
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0035
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0036
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0037
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0038
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0039
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0040
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0041
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0042
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0043
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0044
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0045
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0046
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0047
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0048
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0049
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EXTENDED_0050
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Extended_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
