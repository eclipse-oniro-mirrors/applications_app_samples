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

export default function arkTsChildProcessBuilderTest(): void {
  describe('ArkTsChildProcessModelTestBuilder', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessBuilderTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessBuilderTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BUILDER_0001
    // @tc.name      arkTsChildProcessBuilderCase001
    // @tc.desc      Verify isValidRequest for mode 0 and isolation True. (parameterised matrix part 1).
    it('arkTsChildProcessBuilderCase001', 0, (): void => {
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, DEFAULT_ENTRY_PARAM, 1, true);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 1, DEFAULT_ENTRY_PARAM, 1, true);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 1, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 2, DEFAULT_ENTRY_PARAM, 1, true);
        expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 2, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, -1, DEFAULT_ENTRY_PARAM, 1, true);
        expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, -1, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      }
      {
        const result: number = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 0, false).fdCount;
        expect(result).assertEqual(0);
      }
      {
        const result: number = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false).fdCount;
        expect(result).assertEqual(1);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BUILDER_0002
    // @tc.name      arkTsChildProcessBuilderCase002
    // @tc.desc      Verify buildRequest keeps fdCount 2. (parameterised matrix part 2).
    it('arkTsChildProcessBuilderCase002', 0, (): void => {
      {
        const result: number = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 2, false).fdCount;
        expect(result).assertEqual(2);
      }
      {
        const result: number = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 3, false).fdCount;
        expect(result).assertEqual(3);
      }
      {
        const result: number = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 8, false).fdCount;
        expect(result).assertEqual(8);
      }
      {
        const result: number = ChildProcessModel.buildRequest(ARG_ENTRY, 0, DEFAULT_ENTRY_PARAM, 0, true).mode;
        expect(result).assertEqual(0);
      }
      {
        const result: number = ChildProcessModel.buildRequest(ARG_ENTRY, 1, DEFAULT_ENTRY_PARAM, 0, true).mode;
        expect(result).assertEqual(1);
      }
      {
        const result: number = ChildProcessModel.buildRequest(ARG_ENTRY, 2, DEFAULT_ENTRY_PARAM, 0, true).mode;
        expect(result).assertEqual(2);
      }
      {
        const result: string = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, 'testParam', 0, false).entryParams;
        expect(result).assertEqual('testParam');
      }
      {
        const result: string = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, 'testParam', 1, false).entryParams;
        expect(result).assertEqual('testParam');
      }
      {
        const result: string = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, 'testParam', 2, false).entryParams;
        expect(result).assertEqual('testParam');
      }
      {
        const result: string = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, 'testParam', 3, false).entryParams;
        expect(result).assertEqual('testParam');
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_BUILDER_0003
    // @tc.name      arkTsChildProcessBuilderCase003
    // @tc.desc      Verify buildRequest keeps entry params for fd count 4. (parameterised matrix part 3).
    it('arkTsChildProcessBuilderCase003', 0, (): void => {
      {
        const result: string = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 0, 'testParam', 4, false).entryParams;
        expect(result).assertEqual('testParam');
      }
    });

  });
}
