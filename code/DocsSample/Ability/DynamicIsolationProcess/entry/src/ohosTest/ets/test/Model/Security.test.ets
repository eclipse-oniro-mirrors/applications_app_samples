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

export default function dynamicIsolationProcessSecurityTest(): void {
  describe('DynamicIsolationProcessModelTestSecurity', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessSecurityTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessSecurityTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0001
    // @tc.name      dynamicIsolationProcessSecurityCase001
    // @tc.desc      Verify unsafe isolation key rejected at slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessSecurityCase001', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('-')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_0')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('.')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_1')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('/')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_2')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('@')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_3')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('#')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_4')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a-b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_5')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_6')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a.b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_7')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a/b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_8')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a@b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_9')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0002
    // @tc.name      dynamicIsolationProcessSecurityCase002
    // @tc.desc      Verify unsafe isolation key rejected at slot 10. (parameterised matrix part 2).
    it('dynamicIsolationProcessSecurityCase002', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('a#b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_10')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a$b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_11')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a%b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_12')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a+b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_13')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a=b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_14')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a,b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_15')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a;b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_16')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a:b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_17')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a|b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_18')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a\b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_19')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0003
    // @tc.name      dynamicIsolationProcessSecurityCase003
    // @tc.desc      Verify unsafe isolation key rejected at slot 20. (parameterised matrix part 3).
    it('dynamicIsolationProcessSecurityCase003', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('-')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_20')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('.')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_21')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('/')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_22')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('@')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_23')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('#')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_24')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a-b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_25')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_26')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a.b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_27')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a/b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_28')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a@b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_29')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0004
    // @tc.name      dynamicIsolationProcessSecurityCase004
    // @tc.desc      Verify unsafe isolation key rejected at slot 30. (parameterised matrix part 4).
    it('dynamicIsolationProcessSecurityCase004', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('a#b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_30')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a$b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_31')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a%b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_32')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a+b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_33')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a=b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_34')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a,b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_35')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a;b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_36')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a:b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_37')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a|b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_38')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a\b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_39')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0005
    // @tc.name      dynamicIsolationProcessSecurityCase005
    // @tc.desc      Verify unsafe isolation key rejected at slot 40. (parameterised matrix part 5).
    it('dynamicIsolationProcessSecurityCase005', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('-')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_40')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('.')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_41')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('/')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_42')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('@')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_43')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('#')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_44')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a-b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_45')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_46')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a.b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_47')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a/b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_48')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a@b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_49')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0006
    // @tc.name      dynamicIsolationProcessSecurityCase006
    // @tc.desc      Verify unsafe isolation key rejected at slot 50. (parameterised matrix part 6).
    it('dynamicIsolationProcessSecurityCase006', 0, (): void => {
      {
        expect(IsolationModel.isValidIsolationKey('a#b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_50')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a$b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_51')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a%b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_52')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a+b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_53')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a=b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_54')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a,b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_55')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a;b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_56')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a:b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_57')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a|b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_58')).assertTrue();
      }
      {
        expect(IsolationModel.isValidIsolationKey('a\b')).assertFalse();
        expect(IsolationModel.isValidIsolationKey('safe_key_59')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0007
    // @tc.name      dynamicIsolationProcessSecurityCase007
    // @tc.desc      Verify unsafe module name rejected at slot 0. (parameterised matrix part 7).
    it('dynamicIsolationProcessSecurityCase007', 0, (): void => {
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module0')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module1')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module2')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module3')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module4')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module5')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module6')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module7')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module8')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module9')).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_SECURITY_0008
    // @tc.name      dynamicIsolationProcessSecurityCase008
    // @tc.desc      Verify unsafe module name rejected at slot 10. (parameterised matrix part 8).
    it('dynamicIsolationProcessSecurityCase008', 0, (): void => {
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module10')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module11')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module12')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module13')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module14')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module15')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module16')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module17')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module18')).assertTrue();
      }
      {
        expect(IsolationModel.isValidModule('bad/module')).assertFalse();
        expect(IsolationModel.isValidModule('bad module')).assertFalse();
        expect(IsolationModel.isValidModule('module19')).assertTrue();
      }
    });

  });
}
