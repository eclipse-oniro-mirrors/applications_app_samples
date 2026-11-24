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
  START_MODE_SELF_FORK, START_MODE_ATTACH, PID_MIN, PID_MAX, RETRY_STEP, RETRY_MAX, PARAM_MAX_LENGTH, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_START_FAILED, ERROR_ALREADY_RUNNING, ERROR_NOT_SUPPORTED, SELF_FORK_ENTRY, ARG_ENTRY, DEFAULT_ENTRY_PARAM, FD_KEY, STATE_IDLE, STATE_RUNNING, STATE_EXITED, ChildProcessModel, ChildProcessRequest
} from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';

export default function arkTsChildProcessPathRulesTest(): void {
  describe('ArkTsChildProcessModelTestPathRules', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessPathRulesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'arkTsChildProcessPathRulesTest finished');
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0001
    // @tc.name      arkTsChildProcessPathRulesCase001
    // @tc.desc      Verify isArkTsProcessPath for path sample 0. (parameterised matrix part 1).
    it('arkTsChildProcessPathRulesCase001', 0, (): void => {
      {
        const path: string = './ets/process/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/A.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/a/b.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/../DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/other/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/other/Child.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'entry/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0002
    // @tc.name      arkTsChildProcessPathRulesCase002
    // @tc.desc      Verify isArkTsProcessPath for path sample 10. (parameterised matrix part 2).
    it('arkTsChildProcessPathRulesCase002', 0, (): void => {
      {
        const path: string = 'ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ts';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.Ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '.';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '..';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child Process.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0003
    // @tc.name      arkTsChildProcessPathRulesCase003
    // @tc.desc      Verify isModuleProcessPath for path sample 0. (parameterised matrix part 3).
    it('arkTsChildProcessPathRulesCase003', 0, (): void => {
      {
        const path: string = './ets/process/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/A.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/a/b.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/../DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/other/DemoProcessNoArg.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/DemoProcessArg.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/other/Child.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'entry/ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0004
    // @tc.name      arkTsChildProcessPathRulesCase004
    // @tc.desc      Verify isModuleProcessPath for path sample 10. (parameterised matrix part 4).
    it('arkTsChildProcessPathRulesCase004', 0, (): void => {
      {
        const path: string = 'ets/process/Child.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ts';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.Ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '.';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = '..';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = 'module1/ets/process/Child.ets.bak';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
      {
        const path: string = './ets/process/Child Process.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0005
    // @tc.name      arkTsChildProcessPathRulesCase005
    // @tc.desc      Verify generated child entry path 0. (parameterised matrix part 5).
    it('arkTsChildProcessPathRulesCase005', 0, (): void => {
      {
        const path: string = './ets/process/Child0.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child1.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child2.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child3.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child4.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child5.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child6.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child7.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child8.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child9.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0006
    // @tc.name      arkTsChildProcessPathRulesCase006
    // @tc.desc      Verify generated child entry path 10. (parameterised matrix part 6).
    it('arkTsChildProcessPathRulesCase006', 0, (): void => {
      {
        const path: string = './ets/process/Child10.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child11.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child12.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = './ets/process/Child13.ets';
        const result: boolean = ChildProcessModel.isArkTsProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child0.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child1.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child2.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child3.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child4.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child5.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_ARKTS_CHILD_PROCESS_PATHRULES_0007
    // @tc.name      arkTsChildProcessPathRulesCase007
    // @tc.desc      Verify generated module entry path 6. (parameterised matrix part 7).
    it('arkTsChildProcessPathRulesCase007', 0, (): void => {
      {
        const path: string = 'module1/ets/process/Child6.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child7.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child8.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child9.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child10.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child11.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child12.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
      {
        const path: string = 'module1/ets/process/Child13.ets';
        const result: boolean = ChildProcessModel.isModuleProcessPath(path);
        expect(result).assertTrue();
      }
    });

  });
}
