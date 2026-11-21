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

export default function dynamicIsolationProcessPathRulesTest(): void {
  describe('DynamicIsolationProcessModelTestPathRules', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessPathRulesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessPathRulesTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_PATHRULES_0001
    // @tc.name      dynamicIsolationProcessPathRulesCase001
    // @tc.desc      Verify module path rule for slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessPathRulesCase001', 0, (): void => {
      {
        const moduleName: string = 'entry';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module1';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'a';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = '';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertFalse();
      }
      {
        const moduleName: string = 'has space';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertFalse();
      }
      {
        const moduleName: string = 'has/slash';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertFalse();
      }
      {
        const moduleName: string = 'entry2';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const abilityName: string = 'EntryAbility';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertTrue();
      }
      {
        const abilityName: string = 'EntryAbility1';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertTrue();
      }
      {
        const abilityName: string = 'A';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_PATHRULES_0002
    // @tc.name      dynamicIsolationProcessPathRulesCase002
    // @tc.desc      Verify ability path rule for slot 3. (parameterised matrix part 2).
    it('dynamicIsolationProcessPathRulesCase002', 0, (): void => {
      {
        const abilityName: string = '';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertFalse();
      }
      {
        const abilityName: string = 'has space';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertFalse();
      }
      {
        const abilityName: string = 'has/slash';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertFalse();
      }
      {
        const abilityName: string = 'Page';
        const result: boolean = IsolationModel.isValidAbilityName(abilityName);
        expect(result).assertTrue();
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'testKey')).assertEqual(SAMPLE_BUNDLE + ':testKey');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'key1')).assertEqual(SAMPLE_BUNDLE + ':key1');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, '_private')).assertEqual(SAMPLE_BUNDLE + ':_private');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'A1_b2')).assertEqual(SAMPLE_BUNDLE + ':A1_b2');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'a')).assertEqual(SAMPLE_BUNDLE + ':a');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, '')).assertEqual(SAMPLE_BUNDLE + ':');
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_PATHRULES_0003
    // @tc.name      dynamicIsolationProcessPathRulesCase003
    // @tc.desc      Verify composed process name for key slot 6. (parameterised matrix part 3).
    it('dynamicIsolationProcessPathRulesCase003', 0, (): void => {
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'bad-key')).assertEqual(SAMPLE_BUNDLE + ':bad-key');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'bad key')).assertEqual(SAMPLE_BUNDLE + ':bad key');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'bad.key')).assertEqual(SAMPLE_BUNDLE + ':bad.key');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'bad/slash')).assertEqual(SAMPLE_BUNDLE + ':bad/slash');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(SAMPLE_BUNDLE + ':xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(SAMPLE_BUNDLE + ':xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      }
      {
        expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(SAMPLE_BUNDLE + ':xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      }
      {
        const moduleName: string = 'module0';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module1';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module2';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_PATHRULES_0004
    // @tc.name      dynamicIsolationProcessPathRulesCase004
    // @tc.desc      Verify generated module name slot 3. (parameterised matrix part 4).
    it('dynamicIsolationProcessPathRulesCase004', 0, (): void => {
      {
        const moduleName: string = 'module3';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module4';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module5';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module6';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module7';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module8';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module9';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module10';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module11';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module12';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_PATHRULES_0005
    // @tc.name      dynamicIsolationProcessPathRulesCase005
    // @tc.desc      Verify generated module name slot 13. (parameterised matrix part 5).
    it('dynamicIsolationProcessPathRulesCase005', 0, (): void => {
      {
        const moduleName: string = 'module13';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
      {
        const moduleName: string = 'module14';
        const result: boolean = IsolationModel.isValidModule(moduleName);
        expect(result).assertTrue();
      }
    });

  });
}
