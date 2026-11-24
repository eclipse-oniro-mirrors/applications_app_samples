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

export default function cliInvocationValidationTest(): void {
  describe('CliInvocationModelTestValidation', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationValidationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationValidationTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_VALIDATION_0001
    // @tc.name      cliInvocationValidationCase001
    // @tc.desc      Verify isValidBundleName for bundle slot 0. (parameterised matrix part 1).
    it('cliInvocationValidationCase001', 0, (): void => {
      {
        const name: string = 'com.example.agentExtension';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.sample.x';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b.c';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.example';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'abc';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '.abc';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'abc.';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'a b';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_VALIDATION_0002
    // @tc.name      cliInvocationValidationCase002
    // @tc.desc      Verify isValidBundleName for bundle slot 10. (parameterised matrix part 2).
    it('cliInvocationValidationCase002', 0, (): void => {
      {
        const name: string = 'com..x';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.example.app';
        const result: boolean = CliModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'EntryAbility';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'AgentExtAbility';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'Ability3';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'A';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has space';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has.dot';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'Entry';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_VALIDATION_0003
    // @tc.name      cliInvocationValidationCase003
    // @tc.desc      Verify isValidAbilityName for ability slot 8. (parameterised matrix part 3).
    it('cliInvocationValidationCase003', 0, (): void => {
      {
        const name: string = 'TestAbility';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'entryability';
        const result: boolean = CliModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.example.agentExtension';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.sample.x';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b.c';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.example';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'abc';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = '';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '.abc';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_VALIDATION_0004
    // @tc.name      cliInvocationValidationCase004
    // @tc.desc      Verify isValidName for name slot 8. (parameterised matrix part 4).
    it('cliInvocationValidationCase004', 0, (): void => {
      {
        const name: string = 'abc.';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a b';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'com..x';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.example.app';
        const result: boolean = CliModel.isValidName(name);
        expect(result).assertTrue();
      }
      {
        const code: number = 0;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = -1;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 127;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 1;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 2;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 255;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_VALIDATION_0005
    // @tc.name      cliInvocationValidationCase005
    // @tc.desc      Verify isValidExitCode for code 256. (parameterised matrix part 5).
    it('cliInvocationValidationCase005', 0, (): void => {
      {
        const code: number = 256;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -2;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 128;
        const result: boolean = CliModel.isValidExitCode(code);
        expect(result).assertTrue();
      }
    });

  });
}
