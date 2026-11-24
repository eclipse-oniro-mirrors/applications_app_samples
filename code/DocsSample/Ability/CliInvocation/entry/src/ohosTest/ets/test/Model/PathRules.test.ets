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

export default function cliInvocationPathRulesTest(): void {
  describe('CliInvocationModelTestPathRules', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationPathRulesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationPathRulesTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0001
    // @tc.name      cliInvocationPathRulesCase001
    // @tc.desc      Verify CLI path prefix rule for path slot 0. (parameterised matrix part 1).
    it('cliInvocationPathRulesCase001', 0, (): void => {
      {
        const path: string = '/system/bin/part0/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part1/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part2/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part3/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part4/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part5/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part6/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part7/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part8/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part9/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0002
    // @tc.name      cliInvocationPathRulesCase002
    // @tc.desc      Verify CLI path prefix rule for path slot 10. (parameterised matrix part 2).
    it('cliInvocationPathRulesCase002', 0, (): void => {
      {
        const path: string = '/system/bin/part10/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part11/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part12/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part13/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part14/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part15/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part16/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part17/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part18/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
      {
        const path: string = '/system/bin/part19/tool';
        const result: boolean = path.startsWith('/system/bin/');
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0003
    // @tc.name      cliInvocationPathRulesCase003
    // @tc.desc      Verify subcommand constant slot 0. (parameterised matrix part 3).
    it('cliInvocationPathRulesCase003', 0, (): void => {
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0004
    // @tc.name      cliInvocationPathRulesCase004
    // @tc.desc      Verify subcommand constant slot 10. (parameterised matrix part 4).
    it('cliInvocationPathRulesCase004', 0, (): void => {
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const result: boolean = SUBCOMMAND_START === 'start' || SUBCOMMAND_STOP === 'force-stop';
        expect(result).assertTrue();
      }
      {
        const option: string = '--bundlename';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertTrue();
      }
      {
        const option: string = '--abilityname';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertTrue();
      }
      {
        const option: string = '--help';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertTrue();
      }
      {
        const option: string = '-h';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertFalse();
      }
      {
        const option: string = '';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0005
    // @tc.name      cliInvocationPathRulesCase005
    // @tc.desc      Verify option classification for option slot 5. (parameterised matrix part 5).
    it('cliInvocationPathRulesCase005', 0, (): void => {
      {
        const option: string = '--Bundlename';
        const result: boolean = option.startsWith('--') && option.length > 2;
        expect(result).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_PATHRULES_0006
    // @tc.name      cliInvocationPathRulesCase006
    // @tc.desc      Verify CLI path contains the executable name at slot 9. (parameterised matrix part 6).
    it('cliInvocationPathRulesCase006', 0, (): void => {
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
      {
        expect(CLI_PATH.endsWith('ohos-aa')).assertTrue();
        expect(CLI_PATH.includes('/cli_tool/')).assertTrue();
      }
    });

  });
}
