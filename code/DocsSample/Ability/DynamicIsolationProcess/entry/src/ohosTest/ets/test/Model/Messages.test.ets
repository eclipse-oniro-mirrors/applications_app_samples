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

export default function dynamicIsolationProcessMessagesTest(): void {
  describe('DynamicIsolationProcessModelTestMessages', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessMessagesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessMessagesTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_MESSAGES_0001
    // @tc.name      dynamicIsolationProcessMessagesCase001
    // @tc.desc      Verify isolation error message slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessMessagesCase001', 0, (): void => {
      {
        expect(IsolationModel.errorMessage(0)).assertEqual('success');
        expect(IsolationModel.errorMessage(0).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(401)).assertEqual('invalid parameter');
        expect(IsolationModel.errorMessage(401).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(16000021)).assertEqual('want is invalid');
        expect(IsolationModel.errorMessage(16000021).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(16000022)).assertEqual('ui ability context missing');
        expect(IsolationModel.errorMessage(16000022).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(-1)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(-1).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(1)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(1).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(500)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(500).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(9)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(9).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(10)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(10).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(11)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(11).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_MESSAGES_0002
    // @tc.name      dynamicIsolationProcessMessagesCase002
    // @tc.desc      Verify isolation error message slot 10. (parameterised matrix part 2).
    it('dynamicIsolationProcessMessagesCase002', 0, (): void => {
      {
        expect(IsolationModel.errorMessage(12)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(12).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(13)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(13).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(14)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(14).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(15)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(15).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(16)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(16).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(17)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(17).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(18)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(18).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(19)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(19).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(20)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(20).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(21)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(21).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_MESSAGES_0003
    // @tc.name      dynamicIsolationProcessMessagesCase003
    // @tc.desc      Verify isolation error message slot 20. (parameterised matrix part 3).
    it('dynamicIsolationProcessMessagesCase003', 0, (): void => {
      {
        expect(IsolationModel.errorMessage(22)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(22).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(23)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(23).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(24)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(24).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(25)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(25).length > 0).assertTrue();
      }
      {
        expect(IsolationModel.errorMessage(26)).assertEqual('unknown error');
        expect(IsolationModel.errorMessage(26).length > 0).assertTrue();
      }
    });

  });
}
