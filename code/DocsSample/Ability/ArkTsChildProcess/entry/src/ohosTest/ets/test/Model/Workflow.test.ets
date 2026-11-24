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

export default function arkTsChildProcessWorkflowTest(): void {
  describe('ArkTsChildProcessModelTestWorkflow', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessWorkflowTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessWorkflowTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0001
    // @tc.name      arkTsChildProcessWorkflowCase001
    // @tc.desc      Verify a self-fork request moves from IDLE to RUNNING and back to EXITED.
    it('arkTsChildProcessWorkflowCase001', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 0, false);
      expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      expect(ChildProcessModel.canStart(STATE_IDLE)).assertTrue();
      expect(ChildProcessModel.isValidPid(4321)).assertTrue();
      expect(ChildProcessModel.canStop(STATE_RUNNING)).assertTrue();
      expect(ChildProcessModel.canStart(STATE_EXITED)).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0002
    // @tc.name      arkTsChildProcessWorkflowCase002
    // @tc.desc      Verify the callback flow shares the same request contract as the promise flow.
    it('arkTsChildProcessWorkflowCase002', 0, (): void => {
      const promiseRequest: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 0, false);
      const callbackRequest: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 0, false);
      expect(ChildProcessModel.requestEquals(promiseRequest, callbackRequest)).assertTrue();
      expect(ChildProcessModel.isValidRequest(callbackRequest)).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0003
    // @tc.name      arkTsChildProcessWorkflowCase003
    // @tc.desc      Verify the argument flow carries entryParams and one fd handle.
    it('arkTsChildProcessWorkflowCase003', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest(ARG_ENTRY, START_MODE_ATTACH, 'entryPayload', 1, true);
      expect(ChildProcessModel.isValidRequest(request)).assertTrue();
      expect(request.entryParams).assertEqual('entryPayload');
      expect(request.fdCount).assertEqual(1);
      expect(ChildProcessModel.requestSummary(request).includes('|entryPayload|1|true')).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0004
    // @tc.name      arkTsChildProcessWorkflowCase004
    // @tc.desc      Verify an ATTACH request must not request isolation.
    it('arkTsChildProcessWorkflowCase004', 0, (): void => {
      expect(ChildProcessModel.isolationAllowed(START_MODE_ATTACH)).assertFalse();
      expect(ChildProcessModel.isolationAllowed(START_MODE_SELF_FORK)).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0005
    // @tc.name      arkTsChildProcessWorkflowCase005
    // @tc.desc      Verify a traversal entry is rejected before launch.
    it('arkTsChildProcessWorkflowCase005', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest('../Child.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 0, false);
      expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      expect(ChildProcessModel.isValidPath(request.entry)).assertFalse();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0006
    // @tc.name      arkTsChildProcessWorkflowCase006
    // @tc.desc      Verify an unsupported start mode is rejected before launch.
    it('arkTsChildProcessWorkflowCase006', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, 9, DEFAULT_ENTRY_PARAM, 0, false);
      expect(ChildProcessModel.isValidRequest(request)).assertFalse();
      expect(ChildProcessModel.isValidStartMode(request.mode)).assertFalse();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0007
    // @tc.name      arkTsChildProcessWorkflowCase007
    // @tc.desc      Verify an exited process can be started again.
    it('arkTsChildProcessWorkflowCase007', 0, (): void => {
      expect(ChildProcessModel.canStart(STATE_EXITED)).assertTrue();
      expect(ChildProcessModel.canStop(STATE_EXITED)).assertFalse();
      expect(ChildProcessModel.stateName(STATE_EXITED)).assertEqual('EXITED');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0008
    // @tc.name      arkTsChildProcessWorkflowCase008
    // @tc.desc      Verify a running process is not started twice.
    it('arkTsChildProcessWorkflowCase008', 0, (): void => {
      expect(ChildProcessModel.canStart(STATE_RUNNING)).assertFalse();
      expect(ChildProcessModel.canStop(STATE_RUNNING)).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0009
    // @tc.name      arkTsChildProcessWorkflowCase009
    // @tc.desc      Verify each failure code maps to a distinct diagnostic.
    it('arkTsChildProcessWorkflowCase009', 0, (): void => {
      expect(ChildProcessModel.errorMessage(ERROR_INVALID_PARAM)).assertEqual('invalid parameter');
      expect(ChildProcessModel.errorMessage(ERROR_START_FAILED)).assertEqual('start child process failed');
      expect(ChildProcessModel.errorMessage(ERROR_ALREADY_RUNNING)).assertEqual('child process already running');
      expect(ChildProcessModel.errorMessage(ERROR_NOT_SUPPORTED)).assertEqual('operation not supported');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0010
    // @tc.name      arkTsChildProcessWorkflowCase010
    // @tc.desc      Verify several fd handles are counted and addressable.
    it('arkTsChildProcessWorkflowCase010', 0, (): void => {
      const keys: Array<string> = ['key1', 'key2', 'key3'];
      expect(ChildProcessModel.countFds(keys)).assertEqual(3);
      expect(ChildProcessModel.hasFdKey(keys, 'key2')).assertTrue();
      expect(ChildProcessModel.hasFdKey(keys, 'key4')).assertFalse();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0011
    // @tc.name      arkTsChildProcessWorkflowCase011
    // @tc.desc      Verify entryParams are trimmed before a request is built.
    it('arkTsChildProcessWorkflowCase011', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest(SELF_FORK_ENTRY, START_MODE_SELF_FORK, ChildProcessModel.normalizeParams('  payload  '), 0, false);
      expect(request.entryParams).assertEqual('payload');
      expect(ChildProcessModel.isValidEntryParams(request.entryParams)).assertTrue();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0012
    // @tc.name      arkTsChildProcessWorkflowCase012
    // @tc.desc      Verify the lifecycle names replay in order.
    it('arkTsChildProcessWorkflowCase012', 0, (): void => {
      const states: Array<number> = [STATE_IDLE, STATE_RUNNING, STATE_EXITED];
      expect(ChildProcessModel.stateName(states[0])).assertEqual('IDLE');
      expect(ChildProcessModel.stateName(states[1])).assertEqual('RUNNING');
      expect(ChildProcessModel.stateName(states[2])).assertEqual('EXITED');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0013
    // @tc.name      arkTsChildProcessWorkflowCase013
    // @tc.desc      Verify request summary and log agree on every field.
    it('arkTsChildProcessWorkflowCase013', 0, (): void => {
      const request: ChildProcessRequest = ChildProcessModel.buildRequest(ARG_ENTRY, START_MODE_ATTACH, DEFAULT_ENTRY_PARAM, 2, true);
      expect(ChildProcessModel.requestSummary(request)).assertEqual(ARG_ENTRY + '|1|testParam|2|true');
      expect(ChildProcessModel.formatLog(request)).assertEqual('start entry=' + ARG_ENTRY + ' mode=1 params=testParam fds=2');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0014
    // @tc.name      arkTsChildProcessWorkflowCase014
    // @tc.desc      Verify the valid pid range covers min and max boundaries.
    it('arkTsChildProcessWorkflowCase014', 0, (): void => {
      expect(ChildProcessModel.isValidPid(PID_MIN)).assertTrue();
      expect(ChildProcessModel.isValidPid(PID_MAX)).assertTrue();
      expect(ChildProcessModel.isValidPid(PID_MIN - 1)).assertFalse();
      expect(ChildProcessModel.isValidPid(PID_MAX + 1)).assertFalse();
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_WORKFLOW_0015
    // @tc.name      arkTsChildProcessWorkflowCase015
    // @tc.desc      Verify retry delays grow and then clamp at the maximum.
    it('arkTsChildProcessWorkflowCase015', 0, (): void => {
      expect(ChildProcessModel.retryDelay(1)).assertEqual(RETRY_STEP);
      expect(ChildProcessModel.retryDelay(3)).assertEqual(RETRY_STEP * 3);
      expect(ChildProcessModel.retryDelay(100)).assertEqual(RETRY_MAX);
    });

  });
}
