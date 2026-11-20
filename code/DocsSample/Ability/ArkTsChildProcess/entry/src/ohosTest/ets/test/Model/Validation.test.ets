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

export default function arkTsChildProcessValidationTest(): void {
  describe('ArkTsChildProcessModelTestValidation', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessValidationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessValidationTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0001
    // @tc.name      arkTsChildProcessValidationCase001
    // @tc.desc      Verify isValidPid for pid -2147483648. (parameterised matrix part 1).
    it('arkTsChildProcessValidationCase001', 0, (): void => {
      {
        const pid: number = -2147483648;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const pid: number = -1000;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const pid: number = -1;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const pid: number = 0;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const pid: number = 1;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 2;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 100;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 1024;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 65535;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 1000000;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0002
    // @tc.name      arkTsChildProcessValidationCase002
    // @tc.desc      Verify isValidPid for pid 2147483646. (parameterised matrix part 2).
    it('arkTsChildProcessValidationCase002', 0, (): void => {
      {
        const pid: number = 2147483646;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 2147483647;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertTrue();
      }
      {
        const pid: number = 2147483648;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const pid: number = 3000000000;
        const result: boolean = ChildProcessModel.isValidPid(pid);
        expect(result).assertFalse();
      }
      {
        const mode: number = -3;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const mode: number = -2;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const mode: number = -1;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const mode: number = 0;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertTrue();
      }
      {
        const mode: number = 1;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertTrue();
      }
      {
        const mode: number = 2;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0003
    // @tc.name      arkTsChildProcessValidationCase003
    // @tc.desc      Verify isValidStartMode for mode 3. (parameterised matrix part 3).
    it('arkTsChildProcessValidationCase003', 0, (): void => {
      {
        const mode: number = 3;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const mode: number = 4;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const mode: number = 5;
        const result: boolean = ChildProcessModel.isValidStartMode(mode);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/A.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/a/b.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/../DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/other/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0004
    // @tc.name      arkTsChildProcessValidationCase004
    // @tc.desc      Verify isValidPath for path sample 7. (parameterised matrix part 4).
    it('arkTsChildProcessValidationCase004', 0, (): void => {
      {
        const path: string = 'module1/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/other/Child.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'entry/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child.ts';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.Ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '.';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '..';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0005
    // @tc.name      arkTsChildProcessValidationCase005
    // @tc.desc      Verify isValidPath for path sample 17. (parameterised matrix part 5).
    it('arkTsChildProcessValidationCase005', 0, (): void => {
      {
        const path: string = './ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child Process.ets';
        const result: boolean = ChildProcessModel.isValidPath(path);
        expect(result).assertTrue();
      }
      {
        const value: string = 'testParam';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'a';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'ab';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = ' ';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = '  spaced  ';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = '\t';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = '\n';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0006
    // @tc.name      arkTsChildProcessValidationCase006
    // @tc.desc      Verify isValidEntryParams for parameter sample 7. (parameterised matrix part 6).
    it('arkTsChildProcessValidationCase006', 0, (): void => {
      {
        const value: string = '0';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = '1234567890';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'entry=xxxxxxxx';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'path=/data/storage';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'k=v;k2=v2';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const value: string = 'unicode_value';
        const result: boolean = ChildProcessModel.isValidEntryParams(value);
        expect(result).assertTrue();
      }
      {
        const fd: number = -100;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertFalse();
      }
      {
        const fd: number = -1;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertFalse();
      }
      {
        const fd: number = 0;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 1;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_VALIDATION_0007
    // @tc.name      arkTsChildProcessValidationCase007
    // @tc.desc      Verify isValidFdValue for fd 2. (parameterised matrix part 7).
    it('arkTsChildProcessValidationCase007', 0, (): void => {
      {
        const fd: number = 2;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 10;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 100;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 1024;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 2147483647;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
      {
        const fd: number = 2147483648;
        const result: boolean = ChildProcessModel.isValidFdValue(fd);
        expect(result).assertTrue();
      }
    });

  });
}
