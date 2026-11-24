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

export default function arkTsChildProcessStateMachineTest(): void {
  describe('ArkTsChildProcessModelTestStateMachine', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessStateMachineTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessStateMachineTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_STATEMACHINE_0001
    // @tc.name      arkTsChildProcessStateMachineCase001
    // @tc.desc      Verify stateName labels state -2. (parameterised matrix part 1).
    it('arkTsChildProcessStateMachineCase001', 0, (): void => {
      {
        const state: number = -2;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = -1;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = 0;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('IDLE');
      }
      {
        const state: number = 1;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('RUNNING');
      }
      {
        const state: number = 2;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('EXITED');
      }
      {
        const state: number = 3;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = 4;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = 10;
        const result: string = ChildProcessModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = -2;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -1;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_STATEMACHINE_0002
    // @tc.name      arkTsChildProcessStateMachineCase002
    // @tc.desc      Verify canStart for state 0. (parameterised matrix part 2).
    it('arkTsChildProcessStateMachineCase002', 0, (): void => {
      {
        const state: number = 0;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 1;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 2;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 3;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = ChildProcessModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -2;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -1;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 1;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_STATEMACHINE_0003
    // @tc.name      arkTsChildProcessStateMachineCase003
    // @tc.desc      Verify canStop for state 2. (parameterised matrix part 3).
    it('arkTsChildProcessStateMachineCase003', 0, (): void => {
      {
        const state: number = 2;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 3;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = ChildProcessModel.canStop(state);
        expect(result).assertFalse();
      }
    });

  });
}
