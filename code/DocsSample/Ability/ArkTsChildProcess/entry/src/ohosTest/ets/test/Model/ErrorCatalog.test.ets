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

export default function arkTsChildProcessErrorCatalogTest(): void {
  describe('ArkTsChildProcessModelTestErrorCatalog', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessErrorCatalogTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessErrorCatalogTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_ERRORCATALOG_0001
    // @tc.name      arkTsChildProcessErrorCatalogCase001
    // @tc.desc      Verify errorMessage for error code 0. (parameterised matrix part 1).
    it('arkTsChildProcessErrorCatalogCase001', 0, (): void => {
      {
        const code: number = 0;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('success');
      }
      {
        const code: number = 401;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('invalid parameter');
      }
      {
        const code: number = 16000001;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('start child process failed');
      }
      {
        const code: number = 16000002;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('child process already running');
      }
      {
        const code: number = 16000003;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('operation not supported');
      }
      {
        const code: number = -1;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 1;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 500;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 999999;
        const result: string = ChildProcessModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 0;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_ERRORCATALOG_0002
    // @tc.name      arkTsChildProcessErrorCatalogCase002
    // @tc.desc      Verify isSuccessCode for code 1. (parameterised matrix part 2).
    it('arkTsChildProcessErrorCatalogCase002', 0, (): void => {
      {
        const code: number = 1;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -1;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 401;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000001;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000002;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000003;
        const result: boolean = ChildProcessModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
    });

  });
}
