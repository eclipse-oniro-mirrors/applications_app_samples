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
export default function isValidBundleNameEdgeTest(): void {
  describe('IsValidBundleNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0001
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(0.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('0.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0002
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(1.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('1.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0003
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(2.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('2.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0004
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(3.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('3.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0005
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(4.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('4.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0006
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(5.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('5.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0007
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(6.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('6.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0008
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(7.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('7.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0009
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(8.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('8.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0010
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(9.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('9.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0011
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(10.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('10.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0012
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(11.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('11.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0013
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(12.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('12.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0014
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(13.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('13.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0015
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(14.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('14.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0016
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(15.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('15.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0017
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(16.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('16.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0018
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(17.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('17.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0019
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(18.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('18.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0020
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(19.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('19.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0021
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(20.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('20.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0022
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(21.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('21.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0023
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(22.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('22.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0024
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(23.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('23.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0025
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(24.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('24.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0026
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(25.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('25.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0027
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(26.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('26.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0028
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(27.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('27.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0029
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(28.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('28.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0030
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(29.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('29.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0031
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(30.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('30.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0032
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(31.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('31.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0033
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(32.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('32.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0034
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(33.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('33.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0035
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(34.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('34.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0036
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(35.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('35.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0037
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(36.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('36.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0038
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(37.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('37.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0039
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(38.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('38.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0040
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(39.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('39.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0041
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(40.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('40.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0042
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(41.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('41.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0043
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(42.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('42.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0044
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(43.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('43.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0045
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(44.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('44.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0046
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(45.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('45.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0047
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(46.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('46.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0048
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(47.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('47.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0049
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(48.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('48.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_IS_VALID_BUNDLE_NAME_EDGE_0050
     * @tc.name      DynamicIsolationProcess_isValidBundleName_Edge_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(49.bundle.name) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_isValidBundleName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = IsolationModel.isValidBundleName('49.bundle.name');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
