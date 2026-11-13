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
  Device,
  DeviceType,
  KeySemantic,
  RoomKey,
  SceneStep,
  SceneValidation
} from '../main/ets/model/RoomTypes';
import { SceneValidator } from '../main/ets/service/SceneValidator';

/** Builds a device fixture bound to no room. */
function makeDevice(id: string): Device {
  const device: Device = new Device();
  device.id = id;
  device.roomId = 'room-1';
  device.name = 'Projector';
  device.type = DeviceType.PROJECTOR;
  return device;
}

/** Builds a key fixture assigned to the given device. */
function makeKey(id: string, deviceId: string): RoomKey {
  const key: RoomKey = new RoomKey();
  key.id = id;
  key.deviceId = deviceId;
  key.semantic = KeySemantic.POWER_ON;
  return key;
}

/** Builds an enabled scene step fixture with a deterministic id. */
function makeStep(index: number, deviceId: string, keyId: string,
  enabled: boolean): SceneStep {
  const step: SceneStep = new SceneStep();
  step.id = 'step-' + index.toString();
  step.sceneId = 'scene-1';
  step.deviceId = deviceId;
  step.keyId = keyId;
  step.order = index;
  step.enabled = enabled;
  return step;
}

/** Registers the unit test suite for scene validation rules. */
export default function sceneValidatorTest() {
  describe('SceneValidator', () => {
    it('missing_device', 0, () => {
      const devices: Device[] = [makeDevice('dev-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1')];
      const steps: SceneStep[] = [makeStep(0, 'dev-x', 'key-1', true)];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.missingDeviceIds.indexOf('dev-x') >= 0).assertTrue();
      expect(result.messages.length > 0).assertTrue();
    });

    it('missing_key', 0, () => {
      const devices: Device[] = [makeDevice('dev-1'), makeDevice('dev-2')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-2')];
      const steps: SceneStep[] = [makeStep(0, 'dev-1', 'key-1', true)];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.missingKeyIds.indexOf('key-1') >= 0).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
    });

    it('too_many_steps', 0, () => {
      const devices: Device[] = [makeDevice('dev-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1')];
      const steps: SceneStep[] = [];
      for (let i = 0; i < 13; i++) {
        steps.push(makeStep(i, 'dev-1', 'key-1', true));
      }
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.tooManySteps).assertTrue();
    });

    it('empty_scene', 0, () => {
      const devices: Device[] = [makeDevice('dev-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1')];
      const disabled: SceneStep[] = [makeStep(0, 'dev-1', 'key-1', false)];
      const empty: SceneValidation = SceneValidator.validateSteps([], devices, keys);
      const allDisabled: SceneValidation =
        SceneValidator.validateSteps(disabled, devices, keys);
      expect(empty.valid).assertFalse();
      expect(empty.messages.indexOf('Scene has no executable steps') >= 0).assertTrue();
      expect(allDisabled.valid).assertFalse();
      expect(allDisabled.messages.indexOf('Scene has no executable steps') >= 0).assertTrue();
    });
  });
}
