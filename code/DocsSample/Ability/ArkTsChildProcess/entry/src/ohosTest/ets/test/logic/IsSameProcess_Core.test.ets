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
export default function isSameProcessCoreTest(): void {
  describe('IsSameProcessCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSameProcessCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSameProcessCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0001
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0001
     * @tc.desc      [Zero+Zero|expected=false] Verify isSameProcess(0, 0) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isSameProcess_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero+Zero|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isSameProcess(0, 0);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0002
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0002
     * @tc.desc      [SmallPositive+SmallPositive|expected=true] Verify isSameProcess(1, 1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(1, 1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0003
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0003
     * @tc.desc      [SmallPositive+SmallPositive|expected=true] Verify isSameProcess(2, 2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(2, 2);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0004
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0004
     * @tc.desc      [SmallPositive+SmallPositive|expected=true] Verify isSameProcess(3, 3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(3, 3);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0005
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0005
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(4, 4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(4, 4);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0006
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0006
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(5, 5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(5, 5);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0007
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0007
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(6, 6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(6, 6);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0008
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0008
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(7, 7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(7, 7);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0009
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0009
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(8, 8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(8, 8);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0010
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0010
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(9, 9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isSameProcess_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(9, 9);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0011
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0011
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(10, 10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(10, 10);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0012
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0012
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(11, 11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(11, 11);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0013
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0013
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(12, 12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(12, 12);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0014
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0014
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(13, 13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(13, 13);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0015
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0015
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(14, 14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(14, 14);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0016
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0016
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(15, 15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(15, 15);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0017
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0017
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(16, 16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(16, 16);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0018
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0018
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(17, 17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(17, 17);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0019
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0019
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(18, 18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(18, 18);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0020
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0020
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(19, 19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(19, 19);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0021
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0021
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(20, 20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(20, 20);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0022
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0022
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(21, 21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(21, 21);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0023
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0023
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(22, 22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(22, 22);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0024
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0024
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(23, 23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(23, 23);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0025
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0025
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(24, 24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(24, 24);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0026
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0026
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(25, 25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(25, 25);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0027
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0027
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(26, 26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(26, 26);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0028
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0028
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(27, 27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(27, 27);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0029
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0029
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(28, 28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(28, 28);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0030
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0030
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(29, 29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isSameProcess_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(29, 29);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0031
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0031
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(30, 30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(30, 30);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0032
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0032
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(31, 31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(31, 31);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0033
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0033
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(32, 32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(32, 32);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0034
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0034
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(33, 33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(33, 33);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0035
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0035
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(34, 34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(34, 34);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0036
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0036
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(35, 35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(35, 35);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0037
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0037
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(36, 36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(36, 36);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0038
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0038
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(37, 37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(37, 37);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0039
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0039
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(38, 38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(38, 38);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0040
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0040
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(39, 39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(39, 39);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0041
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0041
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(40, 40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(40, 40);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0042
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0042
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(41, 41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(41, 41);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0043
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0043
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(42, 42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(42, 42);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0044
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0044
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(43, 43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(43, 43);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0045
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0045
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(44, 44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(44, 44);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0046
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0046
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(45, 45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(45, 45);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0047
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0047
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(46, 46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(46, 46);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0048
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0048
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(47, 47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(47, 47);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0049
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0049
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(48, 48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(48, 48);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_SAME_PROCESS_CORE_0050
     * @tc.name      ArkTsChildProcess_isSameProcess_Core_0050
     * @tc.desc      [Medium+Medium|expected=true] Verify isSameProcess(49, 49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isSameProcess_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isSameProcess(49, 49);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
