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
export default function countValidPidsCoreTest(): void {
  describe('CountValidPidsCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}CountValidPidsCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}CountValidPidsCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0001
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0001
     * @tc.desc      [LargeArray] Verify countValidPids([-10, 0, 2147483647, 1, 100, -9, 2, 65535, 3, 1000, -8, 4, -2147483648, 5, 1024, -7, 6, 256, 7, 128, -6, 8, 4096, 9, 50, -5, 10, 65535, 11, 10000, -4, 12, 31, 13, 63, -3, 14, 32, 15, 64, -2, 16, 127, 17, 25, -1, 18, 255, 19, 100000]) returns 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_countValidPids_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: LargeArray; expected: 38
      const actual: number = ChildProcessModel.countValidPids([-10, 0, 2147483647, 1, 100, -9, 2, 65535, 3, 1000, -8, 4, -2147483648, 5, 1024, -7, 6, 256, 7, 128, -6, 8, 4096, 9, 50, -5, 10, 65535, 11, 10000, -4, 12, 31, 13, 63, -3, 14, 32, 15, 64, -2, 16, 127, 17, 25, -1, 18, 255, 19, 100000]);
      expect(actual).assertEqual(38);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0002
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0002
     * @tc.desc      [LargeArray] Verify countValidPids([0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4]) returns 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 40
      const actual: number = ChildProcessModel.countValidPids([0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4]);
      expect(actual).assertEqual(40);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0003
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0003
     * @tc.desc      [LargeArray] Verify countValidPids([-1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 0
      const actual: number = ChildProcessModel.countValidPids([-1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4]);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0004
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0004
     * @tc.desc      [LargeArray] Verify countValidPids([-10, 0, 2147483647, 1, 100, -9, 2, 65535, 3, 1000, -8, 4, -2147483648, 5, 1024, -7, 6, 256, 7, 128, -6, 8, 4096, 9, 50, -5, 10, 65535, 11, 10000, -4, 12, 31, 13, 63, -3, 14, 32, 15, 64, -2, 16, 127, 17, 25, -1, 18, 255, 19, 100000]) returns 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 38
      const actual: number = ChildProcessModel.countValidPids([-10, 0, 2147483647, 1, 100, -9, 2, 65535, 3, 1000, -8, 4, -2147483648, 5, 1024, -7, 6, 256, 7, 128, -6, 8, 4096, 9, 50, -5, 10, 65535, 11, 10000, -4, 12, 31, 13, 63, -3, 14, 32, 15, 64, -2, 16, 127, 17, 25, -1, 18, 255, 19, 100000]);
      expect(actual).assertEqual(38);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0005
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0005
     * @tc.desc      [LargeArray] Verify countValidPids([0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4]) returns 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 40
      const actual: number = ChildProcessModel.countValidPids([0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4]);
      expect(actual).assertEqual(40);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_COUNT_VALID_PIDS_CORE_0006
     * @tc.name      ArkTsChildProcess_countValidPids_Core_0006
     * @tc.desc      [LargeArray] Verify countValidPids([-1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_countValidPids_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LargeArray; expected: 0
      const actual: number = ChildProcessModel.countValidPids([-1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4, -1, -2, 0, -3, -4]);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

  });
}
