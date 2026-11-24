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

export default function dynamicIsolationProcessStateMachineTest(): void {
  describe('DynamicIsolationProcessModelTestStateMachine', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessStateMachineTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessStateMachineTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_STATEMACHINE_0001
    // @tc.name      dynamicIsolationProcessStateMachineCase001
    // @tc.desc      Verify stateName for state -1. (parameterised matrix part 1).
    it('dynamicIsolationProcessStateMachineCase001', 0, (): void => {
      {
        const state: number = -1;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('unknown');
      }
      {
        const state: number = 0;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('onCreate');
      }
      {
        const state: number = 1;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('onForeground');
      }
      {
        const state: number = 2;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('onBackground');
      }
      {
        const state: number = 3;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('onDestroy');
      }
      {
        const state: number = 4;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('unknown');
      }
      {
        const state: number = 10;
        const result: string = IsolationModel.stateName(state);
        expect(result).assertEqual('unknown');
      }
      {
        const state: number = -1;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 1;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_STATEMACHINE_0002
    // @tc.name      dynamicIsolationProcessStateMachineCase002
    // @tc.desc      Verify canStart for state 2. (parameterised matrix part 2).
    it('dynamicIsolationProcessStateMachineCase002', 0, (): void => {
      {
        const state: number = 2;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 3;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = IsolationModel.canStart(state);
        expect(result).assertFalse();
      }
      {
        const name: string = 'onCreate';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(0);
      }
      {
        const name: string = 'onWindowStageCreate';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(1);
      }
      {
        const name: string = 'onForeground';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(2);
      }
      {
        const name: string = 'onBackground';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(3);
      }
      {
        const name: string = 'onWindowStageDestroy';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(4);
      }
      {
        const name: string = 'onDestroy';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(5);
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_STATEMACHINE_0003
    // @tc.name      dynamicIsolationProcessStateMachineCase003
    // @tc.desc      Verify abilityLifecycleIndex for unknown slot 6. (parameterised matrix part 3).
    it('dynamicIsolationProcessStateMachineCase003', 0, (): void => {
      {
        const name: string = 'unknown';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(-1);
      }
      {
        const name: string = 'onCreate';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(0);
      }
      {
        const name: string = 'onWindowStageCreate';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(1);
      }
      {
        const name: string = 'onForeground';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(2);
      }
      {
        const name: string = 'onBackground';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(3);
      }
      {
        const name: string = 'onWindowStageDestroy';
        const result: number = IsolationModel.abilityLifecycleIndex(name);
        expect(result).assertEqual(4);
      }
    });

  });
}
