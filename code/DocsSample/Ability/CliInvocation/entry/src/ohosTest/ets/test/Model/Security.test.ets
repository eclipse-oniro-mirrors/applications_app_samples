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

export default function cliInvocationSecurityTest(): void {
  describe('CliInvocationModelTestSecurity', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationSecurityTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cliInvocationSecurityTest finished');
    });

    // @tc.number    SUB_CLI_INVOCATION_SECURITY_0001
    // @tc.name      cliInvocationSecurityCase001
    // @tc.desc      Verify isSafeArg for unsafe sample slot 0. (parameterised matrix part 1).
    it('cliInvocationSecurityCase001', 0, (): void => {
      {
        expect(CliModel.isSafeArg('a;b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg0')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a&b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg1')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a|b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg2')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a`b`')).assertFalse();
        expect(CliModel.isSafeArg('safeArg3')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a$(b)')).assertTrue();
        expect(CliModel.isSafeArg('safeArg4')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a>b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg5')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a<b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg6')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\nb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg7')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg8')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\tb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg9')).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_SECURITY_0002
    // @tc.name      cliInvocationSecurityCase002
    // @tc.desc      Verify isSafeArg for unsafe sample slot 10. (parameterised matrix part 2).
    it('cliInvocationSecurityCase002', 0, (): void => {
      {
        expect(CliModel.isSafeArg(';')).assertFalse();
        expect(CliModel.isSafeArg('safeArg10')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('&&')).assertFalse();
        expect(CliModel.isSafeArg('safeArg11')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('||')).assertFalse();
        expect(CliModel.isSafeArg('safeArg12')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('--bundlename;rm')).assertFalse();
        expect(CliModel.isSafeArg('safeArg13')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertTrue();
        expect(CliModel.isSafeArg('safeArg14')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a;b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg15')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a&b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg16')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a|b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg17')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a`b`')).assertFalse();
        expect(CliModel.isSafeArg('safeArg18')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a$(b)')).assertTrue();
        expect(CliModel.isSafeArg('safeArg19')).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_SECURITY_0003
    // @tc.name      cliInvocationSecurityCase003
    // @tc.desc      Verify isSafeArg for unsafe sample slot 20. (parameterised matrix part 3).
    it('cliInvocationSecurityCase003', 0, (): void => {
      {
        expect(CliModel.isSafeArg('a>b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg20')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a<b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg21')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\nb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg22')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg23')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\tb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg24')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg(';')).assertFalse();
        expect(CliModel.isSafeArg('safeArg25')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('&&')).assertFalse();
        expect(CliModel.isSafeArg('safeArg26')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('||')).assertFalse();
        expect(CliModel.isSafeArg('safeArg27')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('--bundlename;rm')).assertFalse();
        expect(CliModel.isSafeArg('safeArg28')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertTrue();
        expect(CliModel.isSafeArg('safeArg29')).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_SECURITY_0004
    // @tc.name      cliInvocationSecurityCase004
    // @tc.desc      Verify isSafeArg for unsafe sample slot 30. (parameterised matrix part 4).
    it('cliInvocationSecurityCase004', 0, (): void => {
      {
        expect(CliModel.isSafeArg('a;b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg30')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a&b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg31')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a|b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg32')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a`b`')).assertFalse();
        expect(CliModel.isSafeArg('safeArg33')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a$(b)')).assertTrue();
        expect(CliModel.isSafeArg('safeArg34')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a>b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg35')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a<b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg36')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\nb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg37')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a b')).assertTrue();
        expect(CliModel.isSafeArg('safeArg38')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a\tb')).assertTrue();
        expect(CliModel.isSafeArg('safeArg39')).assertTrue();
      }
    });

    // @tc.number    SUB_CLI_INVOCATION_SECURITY_0005
    // @tc.name      cliInvocationSecurityCase005
    // @tc.desc      Verify isSafeArg for unsafe sample slot 40. (parameterised matrix part 5).
    it('cliInvocationSecurityCase005', 0, (): void => {
      {
        expect(CliModel.isSafeArg(';')).assertFalse();
        expect(CliModel.isSafeArg('safeArg40')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('&&')).assertFalse();
        expect(CliModel.isSafeArg('safeArg41')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('||')).assertFalse();
        expect(CliModel.isSafeArg('safeArg42')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('--bundlename;rm')).assertFalse();
        expect(CliModel.isSafeArg('safeArg43')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertTrue();
        expect(CliModel.isSafeArg('safeArg44')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a;b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg45')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a&b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg46')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a|b')).assertFalse();
        expect(CliModel.isSafeArg('safeArg47')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a`b`')).assertFalse();
        expect(CliModel.isSafeArg('safeArg48')).assertTrue();
      }
      {
        expect(CliModel.isSafeArg('a$(b)')).assertTrue();
        expect(CliModel.isSafeArg('safeArg49')).assertTrue();
      }
    });

  });
}
