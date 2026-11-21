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

export default function dynamicIsolationProcessValidationTest(): void {
  describe('DynamicIsolationProcessModelTestValidation', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessValidationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessValidationTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_VALIDATION_0001
    // @tc.name      dynamicIsolationProcessValidationCase001
    // @tc.desc      Verify isValidBundleName for bundle slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessValidationCase001', 0, (): void => {
      {
        const name: string = 'com.sample.dynamicisolationprocess';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'com.sample.x';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'abc';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = '.abc';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'abc.';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a b';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'com..x';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_VALIDATION_0002
    // @tc.name      dynamicIsolationProcessValidationCase002
    // @tc.desc      Verify isValidBundleName for bundle slot 10. (parameterised matrix part 2).
    it('dynamicIsolationProcessValidationCase002', 0, (): void => {
      {
        const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'entry';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'module1';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertTrue();
      }
      {
        const name: string = '';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has space';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has/slash';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'entry2';
        const result: boolean = IsolationModel.isValidModule(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'EntryAbility';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'EntryAbility1';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_VALIDATION_0003
    // @tc.name      dynamicIsolationProcessValidationCase003
    // @tc.desc      Verify isValidAbilityName for ability slot 2. (parameterised matrix part 3).
    it('dynamicIsolationProcessValidationCase003', 0, (): void => {
      {
        const name: string = 'A';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = '';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has space';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'has/slash';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'Page';
        const result: boolean = IsolationModel.isValidAbilityName(name);
        expect(result).assertTrue();
      }
      {
        const key: string = 'testKey';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'key1';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = '_private';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'A1_b2';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'a';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_VALIDATION_0004
    // @tc.name      dynamicIsolationProcessValidationCase004
    // @tc.desc      Verify isValidIsolationKey for key slot 5. (parameterised matrix part 4).
    it('dynamicIsolationProcessValidationCase004', 0, (): void => {
      {
        const key: string = '';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'bad-key';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'bad key';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'bad.key';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'bad/slash';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
    });

  });
}
