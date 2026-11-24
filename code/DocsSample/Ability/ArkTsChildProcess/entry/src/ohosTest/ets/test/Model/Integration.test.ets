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

export default function arkTsChildProcessIntegrationTest(): void {
  describe('ArkTsChildProcessModelTestIntegration', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessIntegrationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessIntegrationTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_INTEGRATION_0001
    // @tc.name      arkTsChildProcessIntegrationCase001
    // @tc.desc      Verify full request lifecycle for entry index 0. (parameterised matrix part 1).
    it('arkTsChildProcessIntegrationCase001', 0, (): void => {
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child0.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child1.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child2.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child3.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child4.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child5.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child6.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child7.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child8.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child9.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_INTEGRATION_0002
    // @tc.name      arkTsChildProcessIntegrationCase002
    // @tc.desc      Verify full request lifecycle for entry index 10. (parameterised matrix part 2).
    it('arkTsChildProcessIntegrationCase002', 0, (): void => {
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child10.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child11.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child12.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child13.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child14.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child15.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child16.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child17.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child18.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child19.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_INTEGRATION_0003
    // @tc.name      arkTsChildProcessIntegrationCase003
    // @tc.desc      Verify full request lifecycle for entry index 20. (parameterised matrix part 3).
    it('arkTsChildProcessIntegrationCase003', 0, (): void => {
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child20.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child21.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child22.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child23.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child24.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child25.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child26.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child27.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child28.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
      {
        const request: ChildProcessRequest = ChildProcessModel.buildRequest('./ets/process/Child29.ets', START_MODE_SELF_FORK, DEFAULT_ENTRY_PARAM, 1, false);
        expect(ChildProcessModel.isValidRequest(request)).assertTrue();
        expect(ChildProcessModel.isValidPath(request.entry)).assertTrue();
        expect(ChildProcessModel.formatLog(request).includes('mode=0')).assertTrue();
      }
    });

  });
}
