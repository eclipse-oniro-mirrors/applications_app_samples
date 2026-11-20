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

export default function arkTsChildProcessSecurityTest(): void {
  describe('ArkTsChildProcessModelTestSecurity', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessSecurityTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessSecurityTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_SECURITY_0001
    // @tc.name      arkTsChildProcessSecurityCase001
    // @tc.desc      Verify rejected path sample 0 cannot be a valid entry. (parameterised matrix part 1).
    it('arkTsChildProcessSecurityCase001', 0, (): void => {
      {
        const path: string = './ets/process/../../etc/passwd';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = '../ets/process/Child.ets';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets;rm';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child|cat.ets';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/`id`.ets';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets\n';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets\t';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = ' /ets/process/Child.ets';
        expect(ChildProcessModel.isValidPath(path)).assertTrue();
      }
      {
        const path: string = './ets/process/Child.ets ';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = 'module1/../process/Child.ets';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_SECURITY_0002
    // @tc.name      arkTsChildProcessSecurityCase002
    // @tc.desc      Verify rejected path sample 10 cannot be a valid entry. (parameterised matrix part 2).
    it('arkTsChildProcessSecurityCase002', 0, (): void => {
      {
        const path: string = '..';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = '';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.exe';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets.bak';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets.old';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets.tmp';
        expect(ChildProcessModel.isValidPath(path)).assertFalse();
      }
      {
        const value: string = 'value0';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value1';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value2';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value3';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_SECURITY_0003
    // @tc.name      arkTsChildProcessSecurityCase003
    // @tc.desc      Verify entry parameter 4 is preserved verbatim. (parameterised matrix part 3).
    it('arkTsChildProcessSecurityCase003', 0, (): void => {
      {
        const value: string = 'value4';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value5';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value6';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value7';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value8';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value9';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value10';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value11';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value12';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
      {
        const value: string = 'value13';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_SECURITY_0004
    // @tc.name      arkTsChildProcessSecurityCase004
    // @tc.desc      Verify entry parameter 14 is preserved verbatim. (parameterised matrix part 4).
    it('arkTsChildProcessSecurityCase004', 0, (): void => {
      {
        const value: string = 'value14';
        expect(ChildProcessModel.normalizeParams(value)).assertEqual(value);
      }
    });

  });
}
