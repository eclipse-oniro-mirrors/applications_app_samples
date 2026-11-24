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

export default function cliInvocationIntegrationTest(): void {
  describe('CliInvocationModelTestIntegration', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationIntegrationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationIntegrationTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_INTEGRATION_0001
    // @tc.name      cliInvocationIntegrationCase001
    // @tc.desc      Verify end to end command construction slot 0. (parameterised matrix part 1).
    it('cliInvocationIntegrationCase001', 0, (): void => {
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app0', 'Ability0');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app0');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability0');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app1', 'Ability1');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app1');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability1');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app2', 'Ability2');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app2');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability2');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app3', 'Ability3');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app3');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability3');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app4', 'Ability4');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app4');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability4');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app5', 'Ability5');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app5');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability5');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app6', 'Ability6');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app6');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability6');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app7', 'Ability7');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app7');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability7');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app8', 'Ability8');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app8');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability8');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app9', 'Ability9');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app9');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability9');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_INTEGRATION_0002
    // @tc.name      cliInvocationIntegrationCase002
    // @tc.desc      Verify end to end command construction slot 10. (parameterised matrix part 2).
    it('cliInvocationIntegrationCase002', 0, (): void => {
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app10', 'Ability10');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app10');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability10');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app11', 'Ability11');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app11');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability11');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app12', 'Ability12');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app12');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability12');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app13', 'Ability13');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app13');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability13');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app14', 'Ability14');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app14');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability14');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app15', 'Ability15');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app15');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability15');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app16', 'Ability16');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app16');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability16');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app17', 'Ability17');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app17');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability17');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app18', 'Ability18');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app18');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability18');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app19', 'Ability19');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app19');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability19');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_INTEGRATION_0003
    // @tc.name      cliInvocationIntegrationCase003
    // @tc.desc      Verify end to end command construction slot 20. (parameterised matrix part 3).
    it('cliInvocationIntegrationCase003', 0, (): void => {
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app20', 'Ability20');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app20');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability20');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app21', 'Ability21');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app21');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability21');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app22', 'Ability22');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app22');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability22');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app23', 'Ability23');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app23');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability23');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app24', 'Ability24');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app24');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability24');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app25', 'Ability25');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app25');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability25');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app26', 'Ability26');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app26');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability26');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app27', 'Ability27');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app27');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability27');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app28', 'Ability28');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app28');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability28');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app29', 'Ability29');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app29');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability29');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_INTEGRATION_0004
    // @tc.name      cliInvocationIntegrationCase004
    // @tc.desc      Verify end to end command construction slot 30. (parameterised matrix part 4).
    it('cliInvocationIntegrationCase004', 0, (): void => {
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app30', 'Ability30');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app30');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability30');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app31', 'Ability31');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app31');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability31');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app32', 'Ability32');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app32');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability32');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app33', 'Ability33');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app33');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability33');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app34', 'Ability34');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app34');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability34');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app35', 'Ability35');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app35');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability35');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app36', 'Ability36');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app36');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability36');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app37', 'Ability37');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app37');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability37');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app38', 'Ability38');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app38');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability38');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app39', 'Ability39');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app39');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability39');
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_INTEGRATION_0005
    // @tc.name      cliInvocationIntegrationCase005
    // @tc.desc      Verify end to end command construction slot 40. (parameterised matrix part 5).
    it('cliInvocationIntegrationCase005', 0, (): void => {
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app40', 'Ability40');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app40');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability40');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app41', 'Ability41');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app41');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability41');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app42', 'Ability42');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app42');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability42');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app43', 'Ability43');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app43');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability43');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app44', 'Ability44');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app44');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability44');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app45', 'Ability45');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app45');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability45');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app46', 'Ability46');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app46');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability46');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app47', 'Ability47');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app47');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability47');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app48', 'Ability48');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app48');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability48');
      }
      {
        const args: Array<string> = CliModel.buildStartArgs('com.integration.app49', 'Ability49');
        expect(args[1]).assertEqual(SUBCOMMAND_START);
        expect(CliModel.optionValue(args, OPTION_BUNDLE)).assertEqual('com.integration.app49');
        expect(CliModel.optionValue(args, OPTION_ABILITY)).assertEqual('Ability49');
      }
    });

  });
}
