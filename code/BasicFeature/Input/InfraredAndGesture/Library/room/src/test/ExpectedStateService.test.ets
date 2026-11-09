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

import { describe, expect, it } from '@ohos/hypium';
import {
  DeviceExpectedState,
  KeySemantic,
  PowerState,
  StateSource
} from '../main/ets/model/RoomTypes';
import { ExpectedStateService } from '../main/ets/service/ExpectedStateService';

/** Builds an expected state with the given power, level and source. */
function makeState(power: PowerState, level: number,
  source: StateSource): DeviceExpectedState {
  const state: DeviceExpectedState = new DeviceExpectedState();
  state.deviceId = 'dev-1';
  state.power = power;
  state.level = level;
  state.source = source;
  state.updatedAt = 1;
  return state;
}

/** Registers the unit test suite for expected state transitions. */
export default function expectedStateServiceTest() {
  describe('ExpectedStateService', () => {
    it('power_on', 0, () => {
      const current: DeviceExpectedState =
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE);
      const next: DeviceExpectedState =
        ExpectedStateService.nextState(current, KeySemantic.POWER_ON, 1000);
      expect(next.power).assertEqual(PowerState.ON);
      expect(next.deviceId).assertEqual('dev-1');
      expect(next.source).assertEqual(StateSource.SCENE);
      expect(next.updatedAt).assertEqual(1000);
    });

    it('power_toggle', 0, () => {
      const off: DeviceExpectedState =
        ExpectedStateService.nextState(
          makeState(PowerState.OFF, 50, StateSource.SCENE),
          KeySemantic.POWER_TOGGLE, 2000);
      const fromUnknown: DeviceExpectedState =
        ExpectedStateService.nextState(
          makeState(PowerState.UNKNOWN, -1, StateSource.SCENE),
          KeySemantic.POWER_TOGGLE, 2000);
      expect(off.power).assertEqual(PowerState.ON);
      expect(fromUnknown.power).assertEqual(PowerState.ON);
    });

    it('volume_up_boundary', 0, () => {
      const maxed: DeviceExpectedState =
        ExpectedStateService.nextState(
          makeState(PowerState.ON, 100, StateSource.SCENE),
          KeySemantic.VOL_UP, 3000);
      const initial: DeviceExpectedState =
        ExpectedStateService.nextState(
          makeState(PowerState.ON, -1, StateSource.SCENE),
          KeySemantic.VOL_UP, 3000);
      expect(maxed.level).assertEqual(100);
      expect(initial.level).assertEqual(55);
    });

    it('manual_not_overwritten', 0, () => {
      const current: DeviceExpectedState =
        makeState(PowerState.OFF, 30, StateSource.MANUAL);
      const next: DeviceExpectedState =
        ExpectedStateService.nextState(current, KeySemantic.POWER_ON, 4000);
      expect(next.power).assertEqual(PowerState.OFF);
      expect(next.level).assertEqual(30);
      expect(next.source).assertEqual(StateSource.MANUAL);
      expect(next.updatedAt).assertEqual(1);
    });
  });
}
