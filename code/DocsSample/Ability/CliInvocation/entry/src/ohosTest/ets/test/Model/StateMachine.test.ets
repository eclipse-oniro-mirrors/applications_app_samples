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

export default function cliInvocationStateMachineTest(): void {
  describe('CliInvocationModelTestStateMachine', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationStateMachineTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationStateMachineTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_STATEMACHINE_0001
    // @tc.name      cliInvocationStateMachineCase001
    // @tc.desc      Verify exitMessage for exit code 0. (parameterised matrix part 1).
    it('cliInvocationStateMachineCase001', 0, (): void => {
      {
        const code: number = 0;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start success');
      }
      {
        const code: number = -1;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = -1');
      }
      {
        const code: number = 127;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 127');
      }
      {
        const code: number = 1;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 1');
      }
      {
        const code: number = 2;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 2');
      }
      {
        const code: number = 255;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 255');
      }
      {
        const code: number = 256;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 256');
      }
      {
        const code: number = -2;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = -2');
      }
      {
        const code: number = 128;
        const result: string = CliModel.exitMessage(code, code);
        expect(result).assertEqual('start failed, ret = 128');
      }
      {
        const code: number = 0;
        expect(CliModel.isSuccessCode(code)).assertEqual(true);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_STATEMACHINE_0002
    // @tc.name      cliInvocationStateMachineCase002
    // @tc.desc      Verify exit classification tuple for slot 1. (parameterised matrix part 2).
    it('cliInvocationStateMachineCase002', 0, (): void => {
      {
        const code: number = 1;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 2;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 3;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 4;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 5;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 6;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 7;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 8;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 9;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
      {
        const code: number = 10;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_STATEMACHINE_0003
    // @tc.name      cliInvocationStateMachineCase003
    // @tc.desc      Verify exit classification tuple for slot 11. (parameterised matrix part 3).
    it('cliInvocationStateMachineCase003', 0, (): void => {
      {
        const code: number = 11;
        expect(CliModel.isSuccessCode(code)).assertEqual(false);
        expect(CliModel.isExecFailure(code)).assertEqual(false);
      }
    });

  });
}
