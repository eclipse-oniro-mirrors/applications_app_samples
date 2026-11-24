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

export default function arkTsChildProcessMessagesTest(): void {
  describe('ArkTsChildProcessModelTestMessages', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessMessagesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessMessagesTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_MESSAGES_0001
    // @tc.name      arkTsChildProcessMessagesCase001
    // @tc.desc      Verify errorMessage text for code slot 0. (parameterised matrix part 1).
    it('arkTsChildProcessMessagesCase001', 0, (): void => {
      {
        expect(ChildProcessModel.errorMessage(0)).assertEqual('success');
        expect(ChildProcessModel.errorMessage(0).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(401)).assertEqual('invalid parameter');
        expect(ChildProcessModel.errorMessage(401).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(16000001)).assertEqual('start child process failed');
        expect(ChildProcessModel.errorMessage(16000001).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(16000002)).assertEqual('child process already running');
        expect(ChildProcessModel.errorMessage(16000002).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(16000003)).assertEqual('operation not supported');
        expect(ChildProcessModel.errorMessage(16000003).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(42)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(42).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(-7)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(-7).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(999999)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(999999).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(1)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(1).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(2)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(2).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_MESSAGES_0002
    // @tc.name      arkTsChildProcessMessagesCase002
    // @tc.desc      Verify errorMessage text for code slot 10. (parameterised matrix part 2).
    it('arkTsChildProcessMessagesCase002', 0, (): void => {
      {
        expect(ChildProcessModel.errorMessage(3)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(3).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(4)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(4).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(5)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(5).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(6)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(6).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(7)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(7).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(8)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(8).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(9)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(9).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(10)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(10).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(11)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(11).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(12)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(12).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_MESSAGES_0003
    // @tc.name      arkTsChildProcessMessagesCase003
    // @tc.desc      Verify errorMessage text for code slot 20. (parameterised matrix part 3).
    it('arkTsChildProcessMessagesCase003', 0, (): void => {
      {
        expect(ChildProcessModel.errorMessage(13)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(13).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(14)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(14).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(15)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(15).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(16)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(16).length > 0).assertTrue();
      }
      {
        expect(ChildProcessModel.errorMessage(17)).assertEqual('unknown error');
        expect(ChildProcessModel.errorMessage(17).length > 0).assertTrue();
      }
    });

  });
}
