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

export default function cliInvocationBuilderTest(): void {
  describe('CliInvocationModelTestBuilder', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationBuilderTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationBuilderTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0001
    // @tc.name      cliInvocationBuilderCase001
    // @tc.desc      Verify start arg position 0 for builder slot 0. (parameterised matrix part 1).
    it('cliInvocationBuilderCase001', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[3]).assertEqual('com.example.agentExtension');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'EntryAbility')[5]).assertEqual('EntryAbility');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[3]).assertEqual('com.sample.x');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0002
    // @tc.name      cliInvocationBuilderCase002
    // @tc.desc      Verify start arg position 4 for builder slot 1. (parameterised matrix part 2).
    it('cliInvocationBuilderCase002', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'AgentExtAbility')[5]).assertEqual('AgentExtAbility');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[3]).assertEqual('a.b');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('a.b', 'Ability3')[5]).assertEqual('Ability3');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[1]).assertEqual('start');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0003
    // @tc.name      cliInvocationBuilderCase003
    // @tc.desc      Verify start arg position 2 for builder slot 3. (parameterised matrix part 3).
    it('cliInvocationBuilderCase003', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[3]).assertEqual('a.b.c');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'A')[5]).assertEqual('A');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[3]).assertEqual('com.example');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.example', '')[5]).assertEqual('');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0004
    // @tc.name      cliInvocationBuilderCase004
    // @tc.desc      Verify start arg position 0 for builder slot 5. (parameterised matrix part 4).
    it('cliInvocationBuilderCase004', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[3]).assertEqual('abc');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'has space')[5]).assertEqual('has space');
      }
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[3]).assertEqual('');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0005
    // @tc.name      cliInvocationBuilderCase005
    // @tc.desc      Verify start arg position 4 for builder slot 6. (parameterised matrix part 5).
    it('cliInvocationBuilderCase005', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('', 'has.dot')[5]).assertEqual('has.dot');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[3]).assertEqual('.abc');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'Entry')[5]).assertEqual('Entry');
      }
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[1]).assertEqual('start');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0006
    // @tc.name      cliInvocationBuilderCase006
    // @tc.desc      Verify start arg position 2 for builder slot 8. (parameterised matrix part 6).
    it('cliInvocationBuilderCase006', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[3]).assertEqual('abc.');
      }
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('abc.', 'TestAbility')[5]).assertEqual('TestAbility');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[3]).assertEqual('a b');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('a b', 'entryability')[5]).assertEqual('entryability');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0007
    // @tc.name      cliInvocationBuilderCase007
    // @tc.desc      Verify start arg position 0 for builder slot 10. (parameterised matrix part 7).
    it('cliInvocationBuilderCase007', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[3]).assertEqual('com..x');
      }
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com..x', 'EntryAbility')[5]).assertEqual('EntryAbility');
      }
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[3]).assertEqual('com.example.app');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0008
    // @tc.name      cliInvocationBuilderCase008
    // @tc.desc      Verify start arg position 4 for builder slot 11. (parameterised matrix part 8).
    it('cliInvocationBuilderCase008', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.example.app', 'AgentExtAbility')[5]).assertEqual('AgentExtAbility');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[3]).assertEqual('com.example.agentExtension');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.example.agentExtension', 'Ability3')[5]).assertEqual('Ability3');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[1]).assertEqual('start');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0009
    // @tc.name      cliInvocationBuilderCase009
    // @tc.desc      Verify start arg position 2 for builder slot 13. (parameterised matrix part 9).
    it('cliInvocationBuilderCase009', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[3]).assertEqual('com.sample.x');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.sample.x', 'A')[5]).assertEqual('A');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[3]).assertEqual('a.b');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('a.b', '')[5]).assertEqual('');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0010
    // @tc.name      cliInvocationBuilderCase010
    // @tc.desc      Verify start arg position 0 for builder slot 15. (parameterised matrix part 10).
    it('cliInvocationBuilderCase010', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[3]).assertEqual('a.b.c');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('a.b.c', 'has space')[5]).assertEqual('has space');
      }
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[3]).assertEqual('com.example');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0011
    // @tc.name      cliInvocationBuilderCase011
    // @tc.desc      Verify start arg position 4 for builder slot 16. (parameterised matrix part 11).
    it('cliInvocationBuilderCase011', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('com.example', 'has.dot')[5]).assertEqual('has.dot');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[3]).assertEqual('abc');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('abc', 'Entry')[5]).assertEqual('Entry');
      }
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[1]).assertEqual('start');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0012
    // @tc.name      cliInvocationBuilderCase012
    // @tc.desc      Verify start arg position 2 for builder slot 18. (parameterised matrix part 12).
    it('cliInvocationBuilderCase012', 0, (): void => {
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[3]).assertEqual('');
      }
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('', 'TestAbility')[5]).assertEqual('TestAbility');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[0]).assertEqual('/system/bin/cli_tool/executable/ohos-aa');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[1]).assertEqual('start');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[2]).assertEqual('--bundlename');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[3]).assertEqual('.abc');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[4]).assertEqual('--abilityname');
      }
      {
        expect(CliModel.buildStartArgs('.abc', 'entryability')[5]).assertEqual('entryability');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0013
    // @tc.name      cliInvocationBuilderCase013
    // @tc.desc      Verify stop command arg count for slot 0. (parameterised matrix part 13).
    it('cliInvocationBuilderCase013', 0, (): void => {
      {
        expect(CliModel.buildStopArgs('com.example.agentExtension').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.example.agentExtension')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('com.sample.x').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.sample.x')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('a.b').length).assertEqual(4);
        expect(CliModel.buildStopArgs('a.b')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('a.b.c').length).assertEqual(4);
        expect(CliModel.buildStopArgs('a.b.c')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('com.example').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.example')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('abc').length).assertEqual(4);
        expect(CliModel.buildStopArgs('abc')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('').length).assertEqual(4);
        expect(CliModel.buildStopArgs('')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('.abc').length).assertEqual(4);
        expect(CliModel.buildStopArgs('.abc')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('abc.').length).assertEqual(4);
        expect(CliModel.buildStopArgs('abc.')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('a b').length).assertEqual(4);
        expect(CliModel.buildStopArgs('a b')[1]).assertEqual('force-stop');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0014
    // @tc.name      cliInvocationBuilderCase014
    // @tc.desc      Verify stop command arg count for slot 10. (parameterised matrix part 14).
    it('cliInvocationBuilderCase014', 0, (): void => {
      {
        expect(CliModel.buildStopArgs('com..x').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com..x')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('com.example.app').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.example.app')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('com.example.agentExtension').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.example.agentExtension')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('com.sample.x').length).assertEqual(4);
        expect(CliModel.buildStopArgs('com.sample.x')[1]).assertEqual('force-stop');
      }
      {
        expect(CliModel.buildStopArgs('a.b').length).assertEqual(4);
        expect(CliModel.buildStopArgs('a.b')[1]).assertEqual('force-stop');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.example.agentExtension', 'EntryAbility');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.example.agentExtension');
        expect(command.abilityName).assertEqual('EntryAbility');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.sample.x', 'AgentExtAbility');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.sample.x');
        expect(command.abilityName).assertEqual('AgentExtAbility');
      }
      {
        const command: CliCommand = CliModel.buildCommand('a.b', 'Ability3');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('a.b');
        expect(command.abilityName).assertEqual('Ability3');
      }
      {
        const command: CliCommand = CliModel.buildCommand('a.b.c', 'A');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('a.b.c');
        expect(command.abilityName).assertEqual('A');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.example', '');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.example');
        expect(command.abilityName).assertEqual('');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0015
    // @tc.name      cliInvocationBuilderCase015
    // @tc.desc      Verify buildCommand fields for command slot 5. (parameterised matrix part 15).
    it('cliInvocationBuilderCase015', 0, (): void => {
      {
        const command: CliCommand = CliModel.buildCommand('abc', 'has space');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('abc');
        expect(command.abilityName).assertEqual('has space');
      }
      {
        const command: CliCommand = CliModel.buildCommand('', 'has.dot');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('');
        expect(command.abilityName).assertEqual('has.dot');
      }
      {
        const command: CliCommand = CliModel.buildCommand('.abc', 'Entry');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('.abc');
        expect(command.abilityName).assertEqual('Entry');
      }
      {
        const command: CliCommand = CliModel.buildCommand('abc.', 'TestAbility');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('abc.');
        expect(command.abilityName).assertEqual('TestAbility');
      }
      {
        const command: CliCommand = CliModel.buildCommand('a b', 'entryability');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('a b');
        expect(command.abilityName).assertEqual('entryability');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com..x', 'EntryAbility');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com..x');
        expect(command.abilityName).assertEqual('EntryAbility');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.example.app', 'AgentExtAbility');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.example.app');
        expect(command.abilityName).assertEqual('AgentExtAbility');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.example.agentExtension', 'Ability3');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.example.agentExtension');
        expect(command.abilityName).assertEqual('Ability3');
      }
      {
        const command: CliCommand = CliModel.buildCommand('com.sample.x', 'A');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('com.sample.x');
        expect(command.abilityName).assertEqual('A');
      }
      {
        const command: CliCommand = CliModel.buildCommand('a.b', '');
        expect(command.subcommand).assertEqual('start');
        expect(command.bundleName).assertEqual('a.b');
        expect(command.abilityName).assertEqual('');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0016
    // @tc.name      cliInvocationBuilderCase016
    // @tc.desc      Verify appendOption grows the arg vector at slot 0. (parameterised matrix part 16).
    it('cliInvocationBuilderCase016', 0, (): void => {
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v0');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v0');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v1');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v1');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v2');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v2');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v3');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v3');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v4');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v4');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v5');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v5');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v6');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v6');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v7');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v7');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v8');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v8');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v9');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v9');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_BUILDER_0017
    // @tc.name      cliInvocationBuilderCase017
    // @tc.desc      Verify appendOption grows the arg vector at slot 10. (parameterised matrix part 17).
    it('cliInvocationBuilderCase017', 0, (): void => {
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v10');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v10');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v11');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v11');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v12');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v12');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v13');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v13');
      }
      {
        const extended: Array<string> = CliModel.appendOption(['/system/bin/cli_tool/executable/ohos-aa', 'start', '--bundlename', 'com.example.app', '--abilityname', 'EntryAbility'], '--flag', 'v14');
        expect(extended.length).assertEqual(8);
        expect(extended[extended.length - 1]).assertEqual('v14');
      }
    });

  });
}
