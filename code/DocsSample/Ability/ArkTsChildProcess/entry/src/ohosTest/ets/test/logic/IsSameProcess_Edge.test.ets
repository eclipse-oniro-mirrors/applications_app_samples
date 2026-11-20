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

/** Logic checks for isSameProcess (50 cases). */
export default function isSameProcessEdgeTest(): void {
  describe('IsSameProcessEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSameProcessEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSameProcessEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0001
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0001
     * @tc.desc      [Zero+SmallPositive|expected=false] Verify isSameProcess(0, 1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero+SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(0, 1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0002
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0002
     * @tc.desc      [SmallPositive+SmallPositive|expected=false] Verify isSameProcess(1, 2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(1, 2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0003
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0003
     * @tc.desc      [SmallPositive+SmallPositive|expected=false] Verify isSameProcess(2, 3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(2, 3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0004
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0004
     * @tc.desc      [SmallPositive+Medium|expected=false] Verify isSameProcess(3, 4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(3, 4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0005
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0005
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(4, 5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(4, 5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0006
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0006
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(5, 6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(5, 6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0007
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0007
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(6, 7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(6, 7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0008
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0008
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(7, 8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(7, 8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0009
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0009
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(8, 9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(8, 9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0010
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0010
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(9, 10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(9, 10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0011
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0011
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(10, 11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(10, 11);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0012
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0012
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(11, 12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(11, 12);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0013
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0013
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(12, 13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(12, 13);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0014
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0014
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(13, 14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(13, 14);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0015
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0015
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(14, 15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(14, 15);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0016
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0016
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(15, 16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(15, 16);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0017
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0017
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(16, 17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(16, 17);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0018
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0018
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(17, 18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(17, 18);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0019
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0019
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(18, 19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(18, 19);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0020
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0020
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(19, 20) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(19, 20);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0021
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0021
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(20, 21) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(20, 21);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0022
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0022
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(21, 22) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(21, 22);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0023
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0023
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(22, 23) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(22, 23);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0024
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0024
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(23, 24) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(23, 24);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0025
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0025
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(24, 25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(24, 25);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0026
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0026
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(25, 26) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(25, 26);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0027
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0027
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(26, 27) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(26, 27);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0028
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0028
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(27, 28) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(27, 28);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0029
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0029
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(28, 29) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(28, 29);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0030
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0030
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(29, 30) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(29, 30);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0031
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0031
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(30, 31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(30, 31);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0032
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0032
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(31, 32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(31, 32);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0033
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0033
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(32, 33) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(32, 33);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0034
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0034
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(33, 34) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(33, 34);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0035
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0035
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(34, 35) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(34, 35);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0036
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0036
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(35, 36) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(35, 36);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0037
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0037
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(36, 37) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(36, 37);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0038
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0038
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(37, 38) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(37, 38);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0039
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0039
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(38, 39) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(38, 39);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0040
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0040
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(39, 40) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(39, 40);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0041
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0041
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(40, 41) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(40, 41);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0042
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0042
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(41, 42) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(41, 42);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0043
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0043
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(42, 43) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(42, 43);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0044
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0044
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(43, 44) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(43, 44);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0045
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0045
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(44, 45) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(44, 45);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0046
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0046
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(45, 46) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(45, 46);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0047
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0047
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(46, 47) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(46, 47);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0048
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0048
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(47, 48) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(47, 48);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0049
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0049
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(48, 49) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(48, 49);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_EDGE_0050
     * @tc.name      ArkTsChildProcess_isSameProcess_Edge_0050
     * @tc.desc      [Medium+Medium|expected=false] Verify isSameProcess(49, 50) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(49, 50);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
