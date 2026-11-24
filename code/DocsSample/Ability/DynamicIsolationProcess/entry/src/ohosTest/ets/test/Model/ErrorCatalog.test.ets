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
  SAMPLE_BUNDLE, SAMPLE_MODULE, MAIN_ABILITY, ISOLATED_ABILITY, ISOLATION_KEY, KEY_MAX_LENGTH, NAME_MAX_LENGTH, STATE_CREATED, STATE_FOREGROUND, STATE_BACKGROUND, STATE_DESTROYED, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_WANT_INVALID, ERROR_CONTEXT_MISSING, IsolationModel, IsolationWant
} from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DynamicIsolationProcess]';

export default function dynamicIsolationProcessErrorCatalogTest(): void {
  describe('DynamicIsolationProcessModelTestErrorCatalog', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessErrorCatalogTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessErrorCatalogTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_ERRORCATALOG_0001
    // @tc.name      dynamicIsolationProcessErrorCatalogCase001
    // @tc.desc      Verify errorMessage for error code 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessErrorCatalogCase001', 0, (): void => {
      {
        const code: number = 0;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('success');
      }
      {
        const code: number = 401;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('invalid parameter');
      }
      {
        const code: number = 16000021;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('want is invalid');
      }
      {
        const code: number = 16000022;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('ui ability context missing');
      }
      {
        const code: number = -1;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 1;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 500;
        const result: string = IsolationModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 0;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 401;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000021;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_ERRORCATALOG_0002
    // @tc.name      dynamicIsolationProcessErrorCatalogCase002
    // @tc.desc      Verify isSuccessCode for error code 16000022. (parameterised matrix part 2).
    it('dynamicIsolationProcessErrorCatalogCase002', 0, (): void => {
      {
        const code: number = 16000022;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -1;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 1;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 500;
        const result: boolean = IsolationModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
    });

  });
}
