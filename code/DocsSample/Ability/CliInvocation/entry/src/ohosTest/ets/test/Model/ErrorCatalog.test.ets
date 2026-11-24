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

export default function cliInvocationErrorCatalogTest(): void {
  describe('CliInvocationModelTestErrorCatalog', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationErrorCatalogTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationErrorCatalogTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_ERRORCATALOG_0001
    // @tc.name      cliInvocationErrorCatalogCase001
    // @tc.desc      Verify exitMessageKey for exit code 0. (parameterised matrix part 1).
    it('cliInvocationErrorCatalogCase001', 0, (): void => {
      {
        const code: number = 0;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_success');
      }
      {
        const code: number = -1;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed_fork');
      }
      {
        const code: number = 127;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed_exec');
      }
      {
        const code: number = 1;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = 2;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = 255;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = 256;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = -2;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = 128;
        const result: string = CliModel.exitMessageKey(code);
        expect(result).assertEqual('message_start_failed');
      }
      {
        const code: number = 0;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_ERRORCATALOG_0002
    // @tc.name      cliInvocationErrorCatalogCase002
    // @tc.desc      Verify isSuccessCode for exit code -1. (parameterised matrix part 2).
    it('cliInvocationErrorCatalogCase002', 0, (): void => {
      {
        const code: number = -1;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 127;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 1;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 2;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 255;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 256;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -2;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 128;
        const result: boolean = CliModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 0;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -1;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_ERRORCATALOG_0003
    // @tc.name      cliInvocationErrorCatalogCase003
    // @tc.desc      Verify isForkFailure for exit code 127. (parameterised matrix part 3).
    it('cliInvocationErrorCatalogCase003', 0, (): void => {
      {
        const code: number = 127;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 1;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 2;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 255;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 256;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -2;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 128;
        const result: boolean = CliModel.isForkFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 0;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -1;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 127;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_ERRORCATALOG_0004
    // @tc.name      cliInvocationErrorCatalogCase004
    // @tc.desc      Verify isExecFailure for exit code 1. (parameterised matrix part 4).
    it('cliInvocationErrorCatalogCase004', 0, (): void => {
      {
        const code: number = 1;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 2;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 255;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 256;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -2;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 128;
        const result: boolean = CliModel.isExecFailure(code);
        expect(result).assertFalse();
      }
    });

  });
}
