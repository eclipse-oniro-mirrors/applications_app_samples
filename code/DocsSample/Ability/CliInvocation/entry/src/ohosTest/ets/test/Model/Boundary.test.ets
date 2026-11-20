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
  CLI_PATH, SUBCOMMAND_START, SUBCOMMAND_STOP, OPTION_BUNDLE, OPTION_ABILITY, EXIT_SUCCESS, EXIT_FORK_FAIL, EXIT_EXEC_FAIL, NAME_MAX_LENGTH, NAME_MIN_LENGTH, CliModel, CliCommand
} from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CliInvocation]';

export default function cliInvocationBoundaryTest(): void {
  describe('CliInvocationModelTestBoundary', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationBoundaryTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationBoundaryTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_BOUNDARY_0001
    // @tc.name      cliInvocationBoundaryCase001
    // @tc.desc      Verify name length boundary at 0. (parameterised matrix part 1).
    it('cliInvocationBoundaryCase001', 0, (): void => {
      {
        const name: string = '';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'a';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'aa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'aaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BOUNDARY_0002
    // @tc.name      cliInvocationBoundaryCase002
    // @tc.desc      Verify name length boundary at 16. (parameterised matrix part 2).
    it('cliInvocationBoundaryCase002', 0, (): void => {
      {
        const name: string = 'aaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const status: number = -2;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(-1);
      }
      {
        const status: number = -1;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(-1);
      }
      {
        const status: number = 0;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(0);
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BOUNDARY_0003
    // @tc.name      cliInvocationBoundaryCase003
    // @tc.desc      Verify decodeWaitStatus for raw status 1. (parameterised matrix part 3).
    it('cliInvocationBoundaryCase003', 0, (): void => {
      {
        const status: number = 1;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(0);
      }
      {
        const status: number = 255;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(0);
      }
      {
        const status: number = 256;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(1);
      }
      {
        const status: number = 512;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(2);
      }
      {
        const status: number = 32512;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(127);
      }
      {
        const status: number = 65280;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(255);
      }
      {
        const status: number = 65535;
        const result: number = CliModel.decodeWaitStatus(status);
        expect(result).assertEqual(255);
      }
      {
        const args: Array<string> = ['cmd'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(1);
      }
      {
        const args: Array<string> = ['cmd', 'arg0'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(2);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(3);
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BOUNDARY_0004
    // @tc.name      cliInvocationBoundaryCase004
    // @tc.desc      Verify argCount for arg vector of size 3. (parameterised matrix part 4).
    it('cliInvocationBoundaryCase004', 0, (): void => {
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(4);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(5);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(6);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(7);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(8);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(9);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(10);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(11);
      }
      {
        const args: Array<string> = ['cmd', 'arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9', 'arg10'];
        const result: number = CliModel.argCount(args);
        expect(result).assertEqual(12);
      }
    });

  });
}
