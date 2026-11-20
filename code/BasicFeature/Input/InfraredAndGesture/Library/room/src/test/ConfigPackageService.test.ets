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
import { AppConstants } from 'common';
import { IrCode, IrProtocol } from 'ircore';
import {
  Device,
  DeviceExpectedState,
  DeviceType,
  KeySemantic,
  PowerState,
  RemoteTemplate,
  Room,
  RoomKey,
  Scene,
  SceneStep,
  StateSource
} from '../main/ets/model/RoomTypes';
import {
  ConfigPackageData,
  ConfigPackageSchema
} from '../main/ets/service/ConfigPackageSchema';

/** Builds a small but fully linked configuration package for round-trip tests. */
function buildSample(): ConfigPackageData {
  const room: Room = new Room();
  room.id = 'room-1';
  room.name = 'Meeting Room';
  room.createdAt = 1;
  room.updatedAt = 1;

  const device: Device = new Device();
  device.id = 'dev-1';
  device.roomId = 'room-1';
  device.name = 'Projector';
  device.type = DeviceType.PROJECTOR;
  device.templateId = 'tpl-PROJECTOR';
  device.brand = 'Demo';
  device.model = 'X1';

  const code: IrCode = new IrCode();
  code.id = 'ir-1';
  code.protocol = IrProtocol.RAW;
  code.frequencyHz = 38000;
  code.payload = '9000,4500,560,560';
  code.source = 'demo';
  code.license = 'demo';
  code.brand = 'Demo';
  code.model = 'X1';
  code.keySemantic = 'POWER_ON';

  const key: RoomKey = new RoomKey();
  key.id = 'key-1';
  key.deviceId = 'dev-1';
  key.semantic = KeySemantic.POWER_ON;
  key.label = 'Power On';
  key.irCodeId = 'ir-1';

  const template: RemoteTemplate = new RemoteTemplate();
  template.id = 'tpl-PROJECTOR';
  template.deviceType = DeviceType.PROJECTOR;
  template.name = 'Projector Default Template';
  template.layout = 'POWER_ON,POWER_OFF';
  template.builtin = true;

  const scene: Scene = new Scene();
  scene.id = 'scene-1';
  scene.roomId = 'room-1';
  scene.name = 'Meeting';

  const step: SceneStep = new SceneStep();
  step.id = 'step-1';
  step.sceneId = 'scene-1';
  step.deviceId = 'dev-1';
  step.keyId = 'key-1';
  step.delayMs = 250;
  step.order = 0;
  step.enabled = true;

  const state: DeviceExpectedState = new DeviceExpectedState();
  state.deviceId = 'dev-1';
  state.power = PowerState.ON;
  state.level = 50;
  state.source = StateSource.SCENE;
  state.updatedAt = 1;

  return ConfigPackageSchema.build(
    [room], [device], [key], [code], [template], [scene], [step],
    [state], 'TEST', 1700000000000);
}

/** Registers the unit test suite for config package export/import. */
export default function configPackageServiceTest() {
  describe('ConfigPackageSchema', () => {
    it('valid_package_passes', 0, () => {
      const data: ConfigPackageData = buildSample();
      const raw: Record<string, Object> =
        JSON.parse(ConfigPackageSchema.toJson(data)) as Record<string, Object>;
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length).assertEqual(0);

      const parsed: ConfigPackageData =
        ConfigPackageSchema.fromJson(ConfigPackageSchema.toJson(data));
      expect(parsed.rooms.length).assertEqual(1);
      expect(parsed.devices.length).assertEqual(1);
      expect(parsed.keys.length).assertEqual(1);
      expect(parsed.sceneSteps.length).assertEqual(1);
    });

    it('missing_field_rejected', 0, () => {
      const raw: Record<string, Object> =
        JSON.parse('{"formatVersion":1}') as Record<string, Object>;
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length > 0).assertTrue();
    });

    it('version_incompatible', 0, () => {
      const text: string = ConfigPackageSchema.toJson(buildSample());
      const current: string = '"formatVersion":' +
        AppConstants.CONFIG_PACKAGE_VERSION.toString();
      const raw: Record<string, Object> = JSON.parse(
        text.replace(current, '"formatVersion":99')) as Record<string, Object>;
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.indexOf('Incompatible config package version') >= 0).assertTrue();
    });

    it('checksum_mismatch', 0, () => {
      const raw: Record<string, Object> = JSON.parse(
        ConfigPackageSchema.toJson(buildSample())) as Record<string, Object>;
      raw['checksum'] = 'deadbeef';
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.indexOf('Config package checksum mismatch') >= 0).assertTrue();
    });
  });
}
