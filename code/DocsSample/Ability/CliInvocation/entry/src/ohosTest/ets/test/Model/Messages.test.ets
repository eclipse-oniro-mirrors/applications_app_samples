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

export default function cliInvocationMessagesTest(): void {
  describe('CliInvocationModelTestMessages', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationMessagesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationMessagesTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_MESSAGES_0001
    // @tc.name      cliInvocationMessagesCase001
    // @tc.desc      Verify exit message key slot 0. (parameterised matrix part 1).
    it('cliInvocationMessagesCase001', 0, (): void => {
      {
        expect(CliModel.exitMessageKey(0)).assertEqual('message_start_success');
        expect(CliModel.exitMessageKey(0).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(-1)).assertEqual('message_start_failed_fork');
        expect(CliModel.exitMessageKey(-1).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(127)).assertEqual('message_start_failed_exec');
        expect(CliModel.exitMessageKey(127).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(1)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(1).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(42)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(42).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(255)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(255).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(256)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(256).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(-5)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(-5).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(3)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(3).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(4)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(4).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_MESSAGES_0002
    // @tc.name      cliInvocationMessagesCase002
    // @tc.desc      Verify exit message key slot 10. (parameterised matrix part 2).
    it('cliInvocationMessagesCase002', 0, (): void => {
      {
        expect(CliModel.exitMessageKey(5)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(5).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(6)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(6).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(7)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(7).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(8)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(8).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(9)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(9).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(10)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(10).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(11)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(11).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(12)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(12).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(13)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(13).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(14)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(14).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_MESSAGES_0003
    // @tc.name      cliInvocationMessagesCase003
    // @tc.desc      Verify exit message key slot 20. (parameterised matrix part 3).
    it('cliInvocationMessagesCase003', 0, (): void => {
      {
        expect(CliModel.exitMessageKey(15)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(15).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(16)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(16).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(17)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(17).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(18)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(18).length > 0).assertTrue();
      }
      {
        expect(CliModel.exitMessageKey(19)).assertEqual('message_start_failed');
        expect(CliModel.exitMessageKey(19).length > 0).assertTrue();
      }
    });

  });
}
