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

/** Logic checks for countValidPids (50 cases). */
export default function countValidPidsEdgeTest(): void {
  describe('CountValidPidsEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}CountValidPidsEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}CountValidPidsEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0001
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0001
     * @tc.desc      [LargeArray] Verify countValidPids([2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1]) returns 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_countValidPids_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: LargeArray; expected: 20
      const actual: number = ChildProcessModel.countValidPids([2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1]);
      expect(actual).assertEqual(20);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0002
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0002
     * @tc.desc      [LargeArray] Verify countValidPids([0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000, 35000, 36000, 37000, 38000, 39000, 40000, 41000, 42000, 43000, 44000, 45000, 46000, 47000, 48000, 49000]) returns 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 49
      const actual: number = ChildProcessModel.countValidPids([0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000, 35000, 36000, 37000, 38000, 39000, 40000, 41000, 42000, 43000, 44000, 45000, 46000, 47000, 48000, 49000]);
      expect(actual).assertEqual(49);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0003
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0003
     * @tc.desc      [LargeArray] Verify countValidPids([-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]) returns 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 24
      const actual: number = ChildProcessModel.countValidPids([-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]);
      expect(actual).assertEqual(24);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0004
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0004
     * @tc.desc      [LargeArray] Verify countValidPids([2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1]) returns 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 20
      const actual: number = ChildProcessModel.countValidPids([2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1, 2147483647, 2147483648, -1, 0, 1]);
      expect(actual).assertEqual(20);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0005
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0005
     * @tc.desc      [LargeArray] Verify countValidPids([0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000, 35000, 36000, 37000, 38000, 39000, 40000, 41000, 42000, 43000, 44000, 45000, 46000, 47000, 48000, 49000]) returns 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 49
      const actual: number = ChildProcessModel.countValidPids([0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000, 35000, 36000, 37000, 38000, 39000, 40000, 41000, 42000, 43000, 44000, 45000, 46000, 47000, 48000, 49000]);
      expect(actual).assertEqual(49);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_EDGE_0006
     * @tc.name      ArkTsChildProcess_countValidPids_Edge_0006
     * @tc.desc      [LargeArray] Verify countValidPids([-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]) returns 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 24
      const actual: number = ChildProcessModel.countValidPids([-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]);
      expect(actual).assertEqual(24);
      expect(typeof actual).assertEqual('number');
    });

  });
}
