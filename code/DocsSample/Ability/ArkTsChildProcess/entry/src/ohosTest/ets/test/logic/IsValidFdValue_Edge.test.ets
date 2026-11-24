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

/** Logic checks for isValidFdValue (50 cases). */
export default function isValidFdValueEdgeTest(): void {
  describe('IsValidFdValueEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidFdValueEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidFdValueEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0001
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0001
     * @tc.desc      [Zero|expected=true] Verify isValidFdValue(0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(0);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0002
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0002
     * @tc.desc      [SmallPositive|expected=true] Verify isValidFdValue(1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0003
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0003
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0004
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0004
     * @tc.desc      [SmallPositive|expected=true] Verify isValidFdValue(2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0005
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0005
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0006
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0006
     * @tc.desc      [SmallPositive|expected=true] Verify isValidFdValue(3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(3);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0007
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0007
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0008
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0008
     * @tc.desc      [Medium|expected=true] Verify isValidFdValue(4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(4);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0009
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0009
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0010
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0010
     * @tc.desc      [Medium|expected=true] Verify isValidFdValue(5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(5);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0011
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0011
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0012
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0012
     * @tc.desc      [Medium|expected=true] Verify isValidFdValue(10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(10);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0013
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0013
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0014
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0014
     * @tc.desc      [Medium|expected=true] Verify isValidFdValue(100) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(100);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0015
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0015
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-100) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-100);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0016
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0016
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(1000) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1000);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0017
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0017
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0018
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0018
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(1024) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1024);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0019
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0019
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0020
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0020
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(4096) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(4096);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0021
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0021
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0022
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0022
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(65535) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(65535);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0023
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0023
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0024
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0024
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(2147483647) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2147483647);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0025
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0025
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0026
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0026
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(2147483646) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2147483646);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0027
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0027
     * @tc.desc      [Negative|expected=false] Verify isValidFdValue(-2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidFdValue(-2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0028
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0028
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(127) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(127);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0029
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0029
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(128) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(128);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0030
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0030
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(129) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(129);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0031
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0031
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(255) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(255);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0032
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0032
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(256) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(256);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0033
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0033
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(257) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(257);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0034
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0034
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(511) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(511);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0035
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0035
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(512) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(512);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0036
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0036
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(513) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(513);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0037
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0037
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(1023) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1023);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0038
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0038
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(1024) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1024);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0039
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0039
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(1025) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(1025);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0040
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0040
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(2047) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2047);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0041
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0041
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(2048) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2048);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0042
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0042
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(2049) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(2049);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0043
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0043
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(8191) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(8191);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0044
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0044
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(8192) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(8192);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0045
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0045
     * @tc.desc      [Large|expected=true] Verify isValidFdValue(8193) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(8193);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0046
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0046
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(16383) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(16383);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0047
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0047
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(16384) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(16384);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0048
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0048
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(16385) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(16385);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0049
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0049
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(32767) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(32767);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_FD_VALUE_EDGE_0050
     * @tc.name      ArkTsChildProcess_isValidFdValue_Edge_0050
     * @tc.desc      [Extreme|expected=true] Verify isValidFdValue(32768) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidFdValue_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidFdValue(32768);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
