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

export default function dynamicIsolationProcessIntegrationTest(): void {
  describe('DynamicIsolationProcessModelTestIntegration', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessIntegrationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessIntegrationTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_INTEGRATION_0001
    // @tc.name      dynamicIsolationProcessIntegrationCase001
    // @tc.desc      Verify lifecycle sequence slot 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessIntegrationCase001', 0, (): void => {
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_INTEGRATION_0002
    // @tc.name      dynamicIsolationProcessIntegrationCase002
    // @tc.desc      Verify lifecycle sequence slot 10. (parameterised matrix part 2).
    it('dynamicIsolationProcessIntegrationCase002', 0, (): void => {
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_INTEGRATION_0003
    // @tc.name      dynamicIsolationProcessIntegrationCase003
    // @tc.desc      Verify lifecycle sequence slot 20. (parameterised matrix part 3).
    it('dynamicIsolationProcessIntegrationCase003', 0, (): void => {
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_INTEGRATION_0004
    // @tc.name      dynamicIsolationProcessIntegrationCase004
    // @tc.desc      Verify lifecycle sequence slot 30. (parameterised matrix part 4).
    it('dynamicIsolationProcessIntegrationCase004', 0, (): void => {
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(2);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'background', 'foreground'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(1);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
      {
        const events: Array<string> = ['foreground', 'destroy'];
        let state: number = STATE_CREATED;
        for (let cursor: number = 0; cursor < events.length; cursor++) {
          state = IsolationModel.nextState(state, events[cursor]);
        }
        expect(state).assertEqual(3);
        expect(IsolationModel.stateName(state).length > 0).assertTrue();
      }
    });

  });
}
