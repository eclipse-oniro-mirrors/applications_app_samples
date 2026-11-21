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

export default function dynamicIsolationProcessBuilderTest(): void {
  describe('DynamicIsolationProcessModelTestBuilder', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessBuilderTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessBuilderTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BUILDER_0001
    // @tc.name      dynamicIsolationProcessBuilderCase001
    // @tc.desc      Verify buildWant fields for slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessBuilderCase001', 0, (): void => {
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.dynamicisolationprocess', 'entry', 'EntryAbility');
        expect(want.bundleName).assertEqual('com.sample.dynamicisolationprocess');
        expect(want.moduleName).assertEqual('entry');
        expect(want.abilityName).assertEqual('EntryAbility');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.x', 'module1', 'EntryAbility1');
        expect(want.bundleName).assertEqual('com.sample.x');
        expect(want.moduleName).assertEqual('module1');
        expect(want.abilityName).assertEqual('EntryAbility1');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a.b', 'a', 'A');
        expect(want.bundleName).assertEqual('a.b');
        expect(want.moduleName).assertEqual('a');
        expect(want.abilityName).assertEqual('A');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc', '', '');
        expect(want.bundleName).assertEqual('abc');
        expect(want.moduleName).assertEqual('');
        expect(want.abilityName).assertEqual('');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('', 'has space', 'has space');
        expect(want.bundleName).assertEqual('');
        expect(want.moduleName).assertEqual('has space');
        expect(want.abilityName).assertEqual('has space');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('.abc', 'has/slash', 'has/slash');
        expect(want.bundleName).assertEqual('.abc');
        expect(want.moduleName).assertEqual('has/slash');
        expect(want.abilityName).assertEqual('has/slash');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc.', 'entry2', 'Page');
        expect(want.bundleName).assertEqual('abc.');
        expect(want.moduleName).assertEqual('entry2');
        expect(want.abilityName).assertEqual('Page');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a b', 'entry', 'EntryAbility');
        expect(want.bundleName).assertEqual('a b');
        expect(want.moduleName).assertEqual('entry');
        expect(want.abilityName).assertEqual('EntryAbility');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com..x', 'module1', 'EntryAbility1');
        expect(want.bundleName).assertEqual('com..x');
        expect(want.moduleName).assertEqual('module1');
        expect(want.abilityName).assertEqual('EntryAbility1');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'a', 'A');
        expect(want.bundleName).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
        expect(want.moduleName).assertEqual('a');
        expect(want.abilityName).assertEqual('A');
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BUILDER_0002
    // @tc.name      dynamicIsolationProcessBuilderCase002
    // @tc.desc      Verify buildWant fields for slot 10. (parameterised matrix part 2).
    it('dynamicIsolationProcessBuilderCase002', 0, (): void => {
      {
        const want: IsolationWant = IsolationModel.buildWant('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '', '');
        expect(want.bundleName).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
        expect(want.moduleName).assertEqual('');
        expect(want.abilityName).assertEqual('');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.dynamicisolationprocess', 'has space', 'has space');
        expect(want.bundleName).assertEqual('com.sample.dynamicisolationprocess');
        expect(want.moduleName).assertEqual('has space');
        expect(want.abilityName).assertEqual('has space');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.x', 'has/slash', 'has/slash');
        expect(want.bundleName).assertEqual('com.sample.x');
        expect(want.moduleName).assertEqual('has/slash');
        expect(want.abilityName).assertEqual('has/slash');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a.b', 'entry2', 'Page');
        expect(want.bundleName).assertEqual('a.b');
        expect(want.moduleName).assertEqual('entry2');
        expect(want.abilityName).assertEqual('Page');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc', 'entry', 'EntryAbility');
        expect(want.bundleName).assertEqual('abc');
        expect(want.moduleName).assertEqual('entry');
        expect(want.abilityName).assertEqual('EntryAbility');
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.dynamicisolationprocess', 'entry', 'EntryAbility');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.x', 'module1', 'EntryAbility1');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a.b', 'a', 'A');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc', '', '');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('', 'has space', 'has space');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BUILDER_0003
    // @tc.name      dynamicIsolationProcessBuilderCase003
    // @tc.desc      Verify isValidWant for slot 5. (parameterised matrix part 3).
    it('dynamicIsolationProcessBuilderCase003', 0, (): void => {
      {
        const want: IsolationWant = IsolationModel.buildWant('.abc', 'has/slash', 'has/slash');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc.', 'entry2', 'Page');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a b', 'entry', 'EntryAbility');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com..x', 'module1', 'EntryAbility1');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'a', 'A');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '', '');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.dynamicisolationprocess', 'has space', 'has space');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('com.sample.x', 'has/slash', 'has/slash');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('a.b', 'entry2', 'Page');
        expect(IsolationModel.isValidWant(want)).assertTrue();
      }
      {
        const want: IsolationWant = IsolationModel.buildWant('abc', 'entry', 'EntryAbility');
        expect(IsolationModel.isValidWant(want)).assertFalse();
      }
    });

  });
}
