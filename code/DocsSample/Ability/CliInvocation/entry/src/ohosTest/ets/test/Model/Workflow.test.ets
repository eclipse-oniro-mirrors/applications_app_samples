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

export default function cliInvocationWorkflowTest(): void {
  describe('CliInvocationModelTestWorkflow', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationWorkflowTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationWorkflowTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0001
    // @tc.name      cliInvocationWorkflowCase001
    // @tc.desc      Verify the start command contains the executable, subcommand and both options.
    it('cliInvocationWorkflowCase001', 0, (): void => {
      const args: Array<string> = CliModel.buildStartArgs('com.example.app', 'EntryAbility');
      expect(args.length).assertEqual(6);
      expect(args[0]).assertEqual(CLI_PATH);
      expect(args[1]).assertEqual(SUBCOMMAND_START);
      expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.example.app');
      expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('EntryAbility');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0002
    // @tc.name      cliInvocationWorkflowCase002
    // @tc.desc      Verify the force-stop command contains only the bundle option.
    it('cliInvocationWorkflowCase002', 0, (): void => {
      const args: Array<string> = CliModel.buildStopArgs('com.example.app');
      expect(args.length).assertEqual(4);
      expect(args[1]).assertEqual(SUBCOMMAND_STOP);
      expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.example.app');
      expect(CliModel.hasOption(args, OPTION_ABILITY)).assertFalse();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0003
    // @tc.name      cliInvocationWorkflowCase003
    // @tc.desc      Verify exit code zero produces the success message key.
    it('cliInvocationWorkflowCase003', 0, (): void => {
      expect(CliModel.isSuccessCode(EXIT_SUCCESS)).assertTrue();
      expect(CliModel.exitMessageKey(EXIT_SUCCESS)).assertEqual('message_start_success');
      expect(CliModel.exitMessage(EXIT_SUCCESS, EXIT_SUCCESS)).assertEqual('start success');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0004
    // @tc.name      cliInvocationWorkflowCase004
    // @tc.desc      Verify a fork failure is reported with the dedicated message key.
    it('cliInvocationWorkflowCase004', 0, (): void => {
      expect(CliModel.isForkFailure(EXIT_FORK_FAIL)).assertTrue();
      expect(CliModel.exitMessageKey(EXIT_FORK_FAIL)).assertEqual('message_start_failed_fork');
      expect(CliModel.exitMessage(EXIT_FORK_FAIL, EXIT_FORK_FAIL)).assertEqual('start failed, ret = -1');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0005
    // @tc.name      cliInvocationWorkflowCase005
    // @tc.desc      Verify an exec failure is reported with the dedicated message key.
    it('cliInvocationWorkflowCase005', 0, (): void => {
      expect(CliModel.isExecFailure(EXIT_EXEC_FAIL)).assertTrue();
      expect(CliModel.exitMessageKey(EXIT_EXEC_FAIL)).assertEqual('message_start_failed_exec');
      expect(CliModel.exitMessage(EXIT_EXEC_FAIL, EXIT_EXEC_FAIL)).assertEqual('start failed, ret = 127');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0006
    // @tc.name      cliInvocationWorkflowCase006
    // @tc.desc      Verify wait status decoding extracts the exit code from the high byte.
    it('cliInvocationWorkflowCase006', 0, (): void => {
      expect(CliModel.decodeWaitStatus(0)).assertEqual(0);
      expect(CliModel.decodeWaitStatus(256)).assertEqual(1);
      expect(CliModel.decodeWaitStatus(32512)).assertEqual(127);
      expect(CliModel.decodeWaitStatus(-1)).assertEqual(EXIT_FORK_FAIL);
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0007
    // @tc.name      cliInvocationWorkflowCase007
    // @tc.desc      Verify an invalid bundle name is rejected by the command contract.
    it('cliInvocationWorkflowCase007', 0, (): void => {
      expect(CliModel.isValidBundleName('com.example.app')).assertTrue();
      expect(CliModel.isValidBundleName('invalid')).assertFalse();
      expect(CliModel.isValidBundleName('.bad')).assertFalse();
      expect(CliModel.isValidBundleName('bad.')).assertFalse();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0008
    // @tc.name      cliInvocationWorkflowCase008
    // @tc.desc      Verify an invalid ability name is rejected by the command contract.
    it('cliInvocationWorkflowCase008', 0, (): void => {
      expect(CliModel.isValidAbilityName('EntryAbility')).assertTrue();
      expect(CliModel.isValidAbilityName('has.dot')).assertFalse();
      expect(CliModel.isValidAbilityName('has space')).assertFalse();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0009
    // @tc.name      cliInvocationWorkflowCase009
    // @tc.desc      Verify shell metacharacters are rejected as unsafe arguments.
    it('cliInvocationWorkflowCase009', 0, (): void => {
      expect(CliModel.isSafeArg('plain')).assertTrue();
      expect(CliModel.isSafeArg('a;b')).assertFalse();
      expect(CliModel.isSafeArg('a&&b')).assertFalse();
      expect(CliModel.isSafeArg('a|b')).assertFalse();
      expect(CliModel.isSafeArg('a`b`')).assertFalse();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0010
    // @tc.name      cliInvocationWorkflowCase010
    // @tc.desc      Verify appending an option grows the argument vector by two.
    it('cliInvocationWorkflowCase010', 0, (): void => {
      const base: Array<string> = CliModel.buildStartArgs('com.example.app', 'EntryAbility');
      const extended: Array<string> = CliModel.appendOption(base, '--flag', 'value');
      expect(extended.length).assertEqual(8);
      expect(CliModel.optionValue(extended, '--flag')).assertEqual('value');
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0011
    // @tc.name      cliInvocationWorkflowCase011
    // @tc.desc      Verify the command summary reports the executable and argument count.
    it('cliInvocationWorkflowCase011', 0, (): void => {
      const args: Array<string> = CliModel.buildStartArgs('com.example.app', 'EntryAbility');
      expect(CliModel.commandSummary(args)).assertEqual('argc=6 cmd=' + CLI_PATH);
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0012
    // @tc.name      cliInvocationWorkflowCase012
    // @tc.desc      Verify start and stop commands never format to the same vector.
    it('cliInvocationWorkflowCase012', 0, (): void => {
      const start: string = CliModel.formatCommand(CliModel.buildStartArgs('com.example.app', 'EntryAbility'));
      const stop: string = CliModel.formatCommand(CliModel.buildStopArgs('com.example.app'));
      expect(start === stop).assertFalse();
      expect(start.includes('start')).assertTrue();
      expect(stop.includes('force-stop')).assertTrue();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0013
    // @tc.name      cliInvocationWorkflowCase013
    // @tc.desc      Verify a well formed command object is accepted.
    it('cliInvocationWorkflowCase013', 0, (): void => {
      const command: CliCommand = CliModel.buildCommand('com.example.app', 'EntryAbility');
      expect(CliModel.isValidCommand(command)).assertTrue();
      expect(command.args.length).assertEqual(6);
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0014
    // @tc.name      cliInvocationWorkflowCase014
    // @tc.desc      Verify a malformed command object is rejected.
    it('cliInvocationWorkflowCase014', 0, (): void => {
      const command: CliCommand = CliModel.buildCommand('invalid', 'has.dot');
      expect(CliModel.isValidCommand(command)).assertFalse();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0015
    // @tc.name      cliInvocationWorkflowCase015
    // @tc.desc      Verify bundle names are trimmed before use.
    it('cliInvocationWorkflowCase015', 0, (): void => {
      expect(CliModel.normalizeBundle('  com.example.app  ')).assertEqual('com.example.app');
      expect(CliModel.isValidBundleName(CliModel.normalizeBundle(' com.example.app '))).assertTrue();
    });

    // @tc.number    SUB_CLI_INVOCATION_WORKFLOW_0016
    // @tc.name      cliInvocationWorkflowCase016
    // @tc.desc      Verify the CLI path points to the ohos-aa executable.
    it('cliInvocationWorkflowCase016', 0, (): void => {
      expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
      expect(CLI_PATH.startsWith('/system/bin/')).assertTrue();
      expect(CliModel.argCount(CliModel.buildStartArgs('com.example.app', 'EntryAbility'))).assertEqual(6);
    });

  });
}
