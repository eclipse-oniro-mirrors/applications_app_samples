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


import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  START_MODE_SELF_FORK, START_MODE_ATTACH, PID_MIN, PID_MAX, RETRY_STEP, RETRY_MAX, PARAM_MAX_LENGTH, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_START_FAILED, ERROR_ALREADY_RUNNING, ERROR_NOT_SUPPORTED, SELF_FORK_ENTRY, ARG_ENTRY, DEFAULT_ENTRY_PARAM, FD_KEY, STATE_IDLE, STATE_RUNNING, STATE_EXITED, ChildProcessModel, ChildProcessRequest
} from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';

export default function arkTsChildProcessBoundaryTest(): void {
  describe('ArkTsChildProcessModelTestBoundary', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessBoundaryTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessBoundaryTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BOUNDARY_0001
    // @tc.name      arkTsChildProcessBoundaryCase001
    // @tc.desc      Verify retryDelay for attempt -10. (parameterised matrix part 1).
    it('arkTsChildProcessBoundaryCase001', 0, (): void => {
      {
        const attempt: number = -10;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(0);
      }
      {
        const attempt: number = -1;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(0);
      }
      {
        const attempt: number = 0;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(0);
      }
      {
        const attempt: number = 1;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(1000);
      }
      {
        const attempt: number = 2;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(2000);
      }
      {
        const attempt: number = 3;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(3000);
      }
      {
        const attempt: number = 4;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(4000);
      }
      {
        const attempt: number = 5;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 6;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 7;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BOUNDARY_0002
    // @tc.name      arkTsChildProcessBoundaryCase002
    // @tc.desc      Verify retryDelay for attempt 8. (parameterised matrix part 2).
    it('arkTsChildProcessBoundaryCase002', 0, (): void => {
      {
        const attempt: number = 8;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 10;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 20;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 50;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const attempt: number = 100;
        const result: number = ChildProcessModel.retryDelay(attempt);
        expect(result).assertEqual(5000);
      }
      {
        const pids: Array<number> = [];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(0);
      }
      {
        const pids: Array<number> = [100];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(1);
      }
      {
        const pids: Array<number> = [100, 101];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(2);
      }
      {
        const pids: Array<number> = [100, 101, 102];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(3);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(4);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BOUNDARY_0003
    // @tc.name      arkTsChildProcessBoundaryCase003
    // @tc.desc      Verify countValidPids for a batch of 5. (parameterised matrix part 3).
    it('arkTsChildProcessBoundaryCase003', 0, (): void => {
      {
        const pids: Array<number> = [100, 101, 102, 103, 104];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(5);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(6);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(7);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(8);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(9);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(10);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(11);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(12);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(13);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(14);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BOUNDARY_0004
    // @tc.name      arkTsChildProcessBoundaryCase004
    // @tc.desc      Verify countValidPids for a batch of 15. (parameterised matrix part 4).
    it('arkTsChildProcessBoundaryCase004', 0, (): void => {
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(15);
      }
      {
        const pids: Array<number> = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115];
        const result: number = ChildProcessModel.countValidPids(pids);
        expect(result).assertEqual(16);
      }
      {
        const pid: number = 1;
        const result: number = ChildProcessModel.describeResult(pid, ERROR_SUCCESS).length;
        expect(result).assertEqual(5);
      }
      {
        const pid: number = 2;
        const result: number = ChildProcessModel.describeResult(pid, ERROR_SUCCESS).length;
        expect(result).assertEqual(5);
      }
      {
        const pid: number = 100;
        const result: number = ChildProcessModel.describeResult(pid, ERROR_SUCCESS).length;
        expect(result).assertEqual(7);
      }
      {
        const pid: number = 65535;
        const result: number = ChildProcessModel.describeResult(pid, ERROR_SUCCESS).length;
        expect(result).assertEqual(9);
      }
      {
        const pid: number = 2147483647;
        const result: number = ChildProcessModel.describeResult(pid, ERROR_SUCCESS).length;
        expect(result).assertEqual(14);
      }
    });

  });
}
