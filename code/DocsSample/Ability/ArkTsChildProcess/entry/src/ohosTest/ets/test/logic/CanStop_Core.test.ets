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

/** Logic checks for canStop (50 cases). */
export default function canStopCoreTest(): void {
  describe('CanStopCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}CanStopCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}CanStopCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0001
     * @tc.name      ArkTsChildProcess_canStop_Core_0001
     * @tc.desc      [Negative|expected=false] Verify canStop(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_canStop_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0002
     * @tc.name      ArkTsChildProcess_canStop_Core_0002
     * @tc.desc      [Zero|expected=false] Verify canStop(0) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(0);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0003
     * @tc.name      ArkTsChildProcess_canStop_Core_0003
     * @tc.desc      [Extreme|expected=false] Verify canStop(2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0004
     * @tc.name      ArkTsChildProcess_canStop_Core_0004
     * @tc.desc      [SmallPositive|expected=true] Verify canStop(1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = ChildProcessModel.canStop(1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0005
     * @tc.name      ArkTsChildProcess_canStop_Core_0005
     * @tc.desc      [Medium|expected=false] Verify canStop(100) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(100);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0006
     * @tc.name      ArkTsChildProcess_canStop_Core_0006
     * @tc.desc      [Negative|expected=false] Verify canStop(-9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0007
     * @tc.name      ArkTsChildProcess_canStop_Core_0007
     * @tc.desc      [SmallPositive|expected=false] Verify canStop(2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0008
     * @tc.name      ArkTsChildProcess_canStop_Core_0008
     * @tc.desc      [Extreme|expected=false] Verify canStop(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0009
     * @tc.name      ArkTsChildProcess_canStop_Core_0009
     * @tc.desc      [SmallPositive|expected=false] Verify canStop(3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0010
     * @tc.name      ArkTsChildProcess_canStop_Core_0010
     * @tc.desc      [Large|expected=false] Verify canStop(1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_canStop_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0011
     * @tc.name      ArkTsChildProcess_canStop_Core_0011
     * @tc.desc      [Negative|expected=false] Verify canStop(-8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0012
     * @tc.name      ArkTsChildProcess_canStop_Core_0012
     * @tc.desc      [Medium|expected=false] Verify canStop(4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0013
     * @tc.name      ArkTsChildProcess_canStop_Core_0013
     * @tc.desc      [Negative|expected=false] Verify canStop(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0014
     * @tc.name      ArkTsChildProcess_canStop_Core_0014
     * @tc.desc      [Medium|expected=false] Verify canStop(5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0015
     * @tc.name      ArkTsChildProcess_canStop_Core_0015
     * @tc.desc      [Large|expected=false] Verify canStop(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0016
     * @tc.name      ArkTsChildProcess_canStop_Core_0016
     * @tc.desc      [Negative|expected=false] Verify canStop(-7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0017
     * @tc.name      ArkTsChildProcess_canStop_Core_0017
     * @tc.desc      [Medium|expected=false] Verify canStop(6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0018
     * @tc.name      ArkTsChildProcess_canStop_Core_0018
     * @tc.desc      [Large|expected=false] Verify canStop(256) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(256);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0019
     * @tc.name      ArkTsChildProcess_canStop_Core_0019
     * @tc.desc      [Medium|expected=false] Verify canStop(7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0020
     * @tc.name      ArkTsChildProcess_canStop_Core_0020
     * @tc.desc      [Large|expected=false] Verify canStop(128) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(128);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0021
     * @tc.name      ArkTsChildProcess_canStop_Core_0021
     * @tc.desc      [Negative|expected=false] Verify canStop(-6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0022
     * @tc.name      ArkTsChildProcess_canStop_Core_0022
     * @tc.desc      [Medium|expected=false] Verify canStop(8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0023
     * @tc.name      ArkTsChildProcess_canStop_Core_0023
     * @tc.desc      [Large|expected=false] Verify canStop(4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0024
     * @tc.name      ArkTsChildProcess_canStop_Core_0024
     * @tc.desc      [Medium|expected=false] Verify canStop(9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0025
     * @tc.name      ArkTsChildProcess_canStop_Core_0025
     * @tc.desc      [Medium|expected=false] Verify canStop(50) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(50);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0026
     * @tc.name      ArkTsChildProcess_canStop_Core_0026
     * @tc.desc      [Negative|expected=false] Verify canStop(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0027
     * @tc.name      ArkTsChildProcess_canStop_Core_0027
     * @tc.desc      [Medium|expected=false] Verify canStop(10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0028
     * @tc.name      ArkTsChildProcess_canStop_Core_0028
     * @tc.desc      [Extreme|expected=false] Verify canStop(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0029
     * @tc.name      ArkTsChildProcess_canStop_Core_0029
     * @tc.desc      [Medium|expected=false] Verify canStop(11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(11);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0030
     * @tc.name      ArkTsChildProcess_canStop_Core_0030
     * @tc.desc      [Large|expected=false] Verify canStop(10000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_canStop_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(10000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0031
     * @tc.name      ArkTsChildProcess_canStop_Core_0031
     * @tc.desc      [Negative|expected=false] Verify canStop(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0032
     * @tc.name      ArkTsChildProcess_canStop_Core_0032
     * @tc.desc      [Medium|expected=false] Verify canStop(12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(12);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0033
     * @tc.name      ArkTsChildProcess_canStop_Core_0033
     * @tc.desc      [Medium|expected=false] Verify canStop(31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(31);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0034
     * @tc.name      ArkTsChildProcess_canStop_Core_0034
     * @tc.desc      [Medium|expected=false] Verify canStop(13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(13);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0035
     * @tc.name      ArkTsChildProcess_canStop_Core_0035
     * @tc.desc      [Medium|expected=false] Verify canStop(63) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(63);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0036
     * @tc.name      ArkTsChildProcess_canStop_Core_0036
     * @tc.desc      [Negative|expected=false] Verify canStop(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0037
     * @tc.name      ArkTsChildProcess_canStop_Core_0037
     * @tc.desc      [Medium|expected=false] Verify canStop(14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(14);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0038
     * @tc.name      ArkTsChildProcess_canStop_Core_0038
     * @tc.desc      [Medium|expected=false] Verify canStop(32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(32);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0039
     * @tc.name      ArkTsChildProcess_canStop_Core_0039
     * @tc.desc      [Medium|expected=false] Verify canStop(15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(15);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0040
     * @tc.name      ArkTsChildProcess_canStop_Core_0040
     * @tc.desc      [Medium|expected=false] Verify canStop(64) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(64);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0041
     * @tc.name      ArkTsChildProcess_canStop_Core_0041
     * @tc.desc      [Negative|expected=false] Verify canStop(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0042
     * @tc.name      ArkTsChildProcess_canStop_Core_0042
     * @tc.desc      [Medium|expected=false] Verify canStop(16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(16);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0043
     * @tc.name      ArkTsChildProcess_canStop_Core_0043
     * @tc.desc      [Large|expected=false] Verify canStop(127) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(127);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0044
     * @tc.name      ArkTsChildProcess_canStop_Core_0044
     * @tc.desc      [Medium|expected=false] Verify canStop(17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(17);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0045
     * @tc.name      ArkTsChildProcess_canStop_Core_0045
     * @tc.desc      [Medium|expected=false] Verify canStop(25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(25);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0046
     * @tc.name      ArkTsChildProcess_canStop_Core_0046
     * @tc.desc      [Negative|expected=false] Verify canStop(-1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(-1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0047
     * @tc.name      ArkTsChildProcess_canStop_Core_0047
     * @tc.desc      [Medium|expected=false] Verify canStop(18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(18);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0048
     * @tc.name      ArkTsChildProcess_canStop_Core_0048
     * @tc.desc      [Large|expected=false] Verify canStop(255) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(255);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0049
     * @tc.name      ArkTsChildProcess_canStop_Core_0049
     * @tc.desc      [Medium|expected=false] Verify canStop(19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(19);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_CAN_STOP_CORE_0050
     * @tc.name      ArkTsChildProcess_canStop_Core_0050
     * @tc.desc      [Extreme|expected=false] Verify canStop(100000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_canStop_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = ChildProcessModel.canStop(100000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
