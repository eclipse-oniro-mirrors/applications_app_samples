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

/** Logic checks for isValidPid (50 cases). */
export default function isValidPidExtendedTest(): void {
  describe('IsValidPidExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidPidExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidPidExtendedTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0001
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0001
     * @tc.desc      [SmallPositive|expected=true] Verify isValidPid(1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidPid_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0002
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0002
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-14);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0003
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0003
     * @tc.desc      [Medium|expected=true] Verify isValidPid(27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(27);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0004
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0004
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-40) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-40);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0005
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0005
     * @tc.desc      [Medium|expected=true] Verify isValidPid(53) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(53);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0006
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0006
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-66) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-66);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0007
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0007
     * @tc.desc      [Medium|expected=true] Verify isValidPid(79) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(79);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0008
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0008
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-92) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-92);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0009
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0009
     * @tc.desc      [Large|expected=true] Verify isValidPid(105) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(105);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0010
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0010
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-118) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPid_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-118);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0011
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0011
     * @tc.desc      [Large|expected=true] Verify isValidPid(131) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(131);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0012
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0012
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-144) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-144);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0013
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0013
     * @tc.desc      [Large|expected=true] Verify isValidPid(157) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(157);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0014
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0014
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-170) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-170);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0015
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0015
     * @tc.desc      [Large|expected=true] Verify isValidPid(183) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(183);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0016
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0016
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-196) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-196);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0017
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0017
     * @tc.desc      [Large|expected=true] Verify isValidPid(209) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(209);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0018
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0018
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-222) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-222);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0019
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0019
     * @tc.desc      [Large|expected=true] Verify isValidPid(235) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(235);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0020
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0020
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-248) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-248);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0021
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0021
     * @tc.desc      [Large|expected=true] Verify isValidPid(261) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(261);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0022
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0022
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-274) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-274);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0023
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0023
     * @tc.desc      [Large|expected=true] Verify isValidPid(287) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(287);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0024
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0024
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-300) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-300);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0025
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0025
     * @tc.desc      [Large|expected=true] Verify isValidPid(313) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(313);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0026
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0026
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-326) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-326);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0027
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0027
     * @tc.desc      [Large|expected=true] Verify isValidPid(339) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(339);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0028
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0028
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-352) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-352);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0029
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0029
     * @tc.desc      [Large|expected=true] Verify isValidPid(365) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(365);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0030
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0030
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-378) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPid_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-378);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0031
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0031
     * @tc.desc      [Large|expected=true] Verify isValidPid(391) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(391);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0032
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0032
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-404) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-404);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0033
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0033
     * @tc.desc      [Large|expected=true] Verify isValidPid(417) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(417);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0034
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0034
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-430) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-430);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0035
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0035
     * @tc.desc      [Large|expected=true] Verify isValidPid(443) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(443);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0036
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0036
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-456) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-456);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0037
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0037
     * @tc.desc      [Large|expected=true] Verify isValidPid(469) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(469);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0038
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0038
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-482) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-482);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0039
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0039
     * @tc.desc      [Large|expected=true] Verify isValidPid(495) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(495);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0040
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0040
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-508) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-508);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0041
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0041
     * @tc.desc      [Large|expected=true] Verify isValidPid(521) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(521);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0042
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0042
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-534) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-534);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0043
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0043
     * @tc.desc      [Large|expected=true] Verify isValidPid(547) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(547);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0044
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0044
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-560) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-560);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0045
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0045
     * @tc.desc      [Large|expected=true] Verify isValidPid(573) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(573);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0046
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0046
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-586) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-586);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0047
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0047
     * @tc.desc      [Large|expected=true] Verify isValidPid(599) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(599);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0048
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0048
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-612) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-612);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0049
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0049
     * @tc.desc      [Large|expected=true] Verify isValidPid(625) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidPid(625);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PID_EXTENDED_0050
     * @tc.name      ArkTsChildProcess_isValidPid_Extended_0050
     * @tc.desc      [Negative|expected=false] Verify isValidPid(-638) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPid_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPid(-638);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
