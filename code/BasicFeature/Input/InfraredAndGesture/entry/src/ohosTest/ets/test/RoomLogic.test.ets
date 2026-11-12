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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppConstants } from 'common';
import { IrCode, IrProtocol } from 'ircore';
import {
  ConfigPackageData, ConfigPackageSchema, Device, DeviceExpectedState,
  DeviceType, ExpectedStateService, IrLibraryImporter, KeySemantic,
  PowerState, RemoteTemplate, RemoteTemplateSeeder, Room, RoomKey, Scene,
  SceneStep, SceneValidation, SceneValidator, SchemaMigration,
  StateSource, getDeviceTypeLabel, getKeySemanticLabel
} from 'room';

/**
 * Room 数据模块逻辑套件：覆盖 room HAR 中纯逻辑函数的真实分支与边界。
 * 范围：RoomTypes 枚举与默认值与标签函数、SceneValidator.validateSteps、
 *       ExpectedStateService.nextState、ConfigPackageSchema（build/validateRecord/
 *       checksum/toJson/fromJson/parse 默认值）、RemoteTemplateSeeder.getLayout、
 *       SchemaMigration.compareVersion、IrLibraryImporter.parseProntoHex。
 * 明确不覆盖：AppDatabase 与全部 DAO（依赖 RdbStore 与 context）、
 *       DefaultConfigSeeder.seedIfEmpty/refreshDemoNames（依赖数据库上下文）、
 *       ConfigPackageService.export/import（依赖 DAO 与文件 IO 与事务）、
 *       SceneValidator.validate（异步版依赖 DAO）、
 *       ExpectedStateService.applyKey/correct（异步版依赖 DAO）、
 *       RemoteTemplateSeeder.seedDefaults/applyTemplate（异步版依赖 DAO）、
 *       SchemaMigration.migrate（依赖真实 RdbStore）、
 *       IrLibraryImporter.importFromFile（依赖沙箱文件与 IrCodeDao）。
 */

/** Hilog domain reserved for the room logic tests. */
const DOMAIN: number = 0xF814;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_RoomLogic_';
/** Export timestamp injected into every built config package of this suite. */
const FIXED_EXPORTED_AT: number = 1712345678901;
/** Source mode recorded by every built config package of this suite. */
const FIXED_SOURCE_MODE: string = 'manual';
/** Fallback message used when a caught failure carries no Error payload. */
const UNKNOWN_ERROR_TEXT: string = 'unknown error';
/** Separator used when joining validation messages for substring checks. */
const MESSAGE_SEPARATOR: string = ' | ';

/** Creates a Room row with the given id and a stable display name. */
function makeRoom(roomId: string): Room {
  const room: Room = new Room();
  room.id = roomId;
  room.name = 'Room ' + roomId;
  room.sortOrder = 0;
  return room;
}

/** Creates a Device row of the given type bound to its room. */
function makeDevice(deviceId: string, roomId: string): Device {
  const device: Device = new Device();
  device.id = deviceId;
  device.roomId = roomId;
  device.name = 'Device ' + deviceId;
  device.type = DeviceType.PROJECTOR;
  device.templateId = '';
  return device;
}

/** Creates a RoomKey row bound to its device without any IR code yet. */
function makeKey(keyId: string, deviceId: string, semantic: KeySemantic): RoomKey {
  const key: RoomKey = new RoomKey();
  key.id = keyId;
  key.deviceId = deviceId;
  key.semantic = semantic;
  key.label = getKeySemanticLabel(semantic);
  key.irCodeId = '';
  return key;
}

/** Creates an IrCode row with RAW protocol and a fixed 38 kHz carrier. */
function makeIrCode(codeId: string): IrCode {
  const code: IrCode = new IrCode();
  code.id = codeId;
  code.protocol = IrProtocol.RAW;
  code.frequencyHz = AppConstants.DEFAULT_FREQUENCY_HZ;
  code.payload = '9000,4500';
  code.repeatCount = 1;
  code.source = 'Test library';
  code.license = 'Sample license';
  return code;
}

/** Creates a builtin RemoteTemplate row for one device type. */
function makeTemplate(templateId: string): RemoteTemplate {
  const template: RemoteTemplate = new RemoteTemplate();
  template.id = templateId;
  template.deviceType = DeviceType.PROJECTOR;
  template.name = 'Template ' + templateId;
  template.layout = 'POWER_ON,POWER_OFF,HDMI_1,HDMI_2,VOL_UP,VOL_DOWN';
  template.builtin = true;
  return template;
}

/** Creates a Scene row owned by one room. */
function makeScene(sceneId: string, roomId: string): Scene {
  const scene: Scene = new Scene();
  scene.id = sceneId;
  scene.roomId = roomId;
  scene.name = 'Scene ' + sceneId;
  scene.icon = 'icon_meeting';
  return scene;
}

/** Creates a SceneStep row with explicit device, key, order and enabled flags. */
function makeStep(stepId: string, sceneId: string, deviceId: string, keyId: string,
  order: number, enabled: boolean): SceneStep {
  const step: SceneStep = new SceneStep();
  step.id = stepId;
  step.sceneId = sceneId;
  step.deviceId = deviceId;
  step.keyId = keyId;
  step.order = order;
  step.enabled = enabled;
  return step;
}

/** Creates a DeviceExpectedState row with explicit power, level and source. */
function makeState(power: PowerState, level: number, source: StateSource): DeviceExpectedState {
  const state: DeviceExpectedState = new DeviceExpectedState();
  state.deviceId = 'dev-state';
  state.power = power;
  state.level = level;
  state.source = source;
  state.updatedAt = 0;
  return state;
}

/** Lists every device type in the fixed declaration order. */
function allDeviceTypes(): DeviceType[] {
  const types: DeviceType[] = [
    DeviceType.PROJECTOR, DeviceType.SCREEN, DeviceType.LIGHT,
    DeviceType.AC, DeviceType.TV, DeviceType.AUDIO
  ];
  return types;
}

/** Lists every key semantic in the fixed declaration order. */
function allKeySemantics(): KeySemantic[] {
  const semantics: KeySemantic[] = [
    KeySemantic.POWER_ON, KeySemantic.POWER_OFF, KeySemantic.POWER_TOGGLE,
    KeySemantic.HDMI_1, KeySemantic.HDMI_2, KeySemantic.VOL_UP,
    KeySemantic.VOL_DOWN, KeySemantic.TEMP_UP, KeySemantic.TEMP_DOWN,
    KeySemantic.FAN_SPEED, KeySemantic.SCREEN_UP, KeySemantic.SCREEN_DOWN
  ];
  return semantics;
}

/** Joins validation messages into one text so substring checks stay safe on empty lists. */
function joinedMessages(messages: string[]): string {
  return messages.join(MESSAGE_SEPARATOR);
}

/** Runs an action and returns the thrown Error message, or an empty string when none. */
function captureMessage(action: () => void): string {
  let message: string = '';
  try {
    action();
  } catch (error) {
    message = error instanceof Error ? error.message : UNKNOWN_ERROR_TEXT;
  }
  return message;
}

/** Reports whether the text is exactly eight lowercase hexadecimal characters. */
function isLowerHex8(text: string): boolean {
  if (text.length !== 8) {
    return false;
  }
  const digits: string = '0123456789abcdef';
  for (let i = 0; i < text.length; i++) {
    if (digits.indexOf(text.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

/** Flips the first hexadecimal character so the result surely differs from the input. */
function flipFirstHexChar(text: string): string {
  const first: string = text.charAt(0);
  const rest: string = text.substring(1);
  if (first === '0') {
    return '1' + rest;
  }
  return '0' + rest;
}

/** Builds the complete valid package used by checksum and round-trip cases. */
function buildValidPackage(): ConfigPackageData {
  const rooms: Room[] = [makeRoom('room-1')];
  const devices: Device[] = [makeDevice('dev-1', 'room-1')];
  const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
  keys[0].irCodeId = 'code-1';
  const codes: IrCode[] = [makeIrCode('code-1')];
  const templates: RemoteTemplate[] = [makeTemplate('tpl-PROJECTOR')];
  const scenes: Scene[] = [makeScene('scene-1', 'room-1')];
  const steps: SceneStep[] = [makeStep('step-1', 'scene-1', 'dev-1', 'key-1', 0, true)];
  const states: DeviceExpectedState[] = [makeState(PowerState.ON, 40, StateSource.SCENE)];
  return ConfigPackageSchema.build(rooms, devices, keys, codes, templates, scenes, steps,
    states, FIXED_SOURCE_MODE, FIXED_EXPORTED_AT);
}

/** Wraps typed lists plus one checksum into a raw package record for validateRecord. */
function makePackageRecord(rooms: Room[], devices: Device[], keys: RoomKey[],
  irCodes: IrCode[], remoteTemplates: RemoteTemplate[], scenes: Scene[],
  sceneSteps: SceneStep[], expectedStates: DeviceExpectedState[],
  checksum: string, exportedAt: number, sourceMode: string): Record<string, Object> {
  const raw: Record<string, Object> = {
    'formatVersion': AppConstants.CONFIG_PACKAGE_VERSION,
    'exportedAt': exportedAt,
    'sourceMode': sourceMode,
    'rooms': rooms,
    'devices': devices,
    'keys': keys,
    'irCodes': irCodes,
    'remoteTemplates': remoteTemplates,
    'scenes': scenes,
    'sceneSteps': sceneSteps,
    'expectedStates': expectedStates,
    'checksum': checksum
  };
  return raw;
}

export default function roomLogicTest() {
  describe('RoomLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0100
     * @tc.name      testRoomLogic0001
     * @tc.desc      设备类型六个枚举值的字符串值与声明一致，且两两互不相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DeviceType.PROJECTOR.toString()).assertEqual('PROJECTOR');
      expect(DeviceType.SCREEN.toString()).assertEqual('SCREEN');
      expect(DeviceType.LIGHT.toString()).assertEqual('LIGHT');
      expect(DeviceType.AC.toString()).assertEqual('AC');
      expect(DeviceType.TV.toString()).assertEqual('TV');
      expect(DeviceType.AUDIO.toString()).assertEqual('AUDIO');
      const values: DeviceType[] = allDeviceTypes();
      expect(values.length).assertEqual(6);
      for (let i = 0; i < values.length; i++) {
        for (let j = i + 1; j < values.length; j++) {
          expect(values[i] !== values[j]).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0101
     * @tc.name      testRoomLogic0002
     * @tc.desc      按键语义十二个枚举值的字符串值与声明完全一致，缺一不可。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(KeySemantic.POWER_ON.toString()).assertEqual('POWER_ON');
      expect(KeySemantic.POWER_OFF.toString()).assertEqual('POWER_OFF');
      expect(KeySemantic.POWER_TOGGLE.toString()).assertEqual('POWER_TOGGLE');
      expect(KeySemantic.HDMI_1.toString()).assertEqual('HDMI_1');
      expect(KeySemantic.HDMI_2.toString()).assertEqual('HDMI_2');
      expect(KeySemantic.VOL_UP.toString()).assertEqual('VOL_UP');
      expect(KeySemantic.VOL_DOWN.toString()).assertEqual('VOL_DOWN');
      expect(KeySemantic.TEMP_UP.toString()).assertEqual('TEMP_UP');
      expect(KeySemantic.TEMP_DOWN.toString()).assertEqual('TEMP_DOWN');
      expect(KeySemantic.FAN_SPEED.toString()).assertEqual('FAN_SPEED');
      expect(KeySemantic.SCREEN_UP.toString()).assertEqual('SCREEN_UP');
      expect(KeySemantic.SCREEN_DOWN.toString()).assertEqual('SCREEN_DOWN');
      expect(allKeySemantics().length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0102
     * @tc.name      testRoomLogic0003
     * @tc.desc      电源状态三值与状态来源三值的字符串值与声明一致，来源集合互不相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(PowerState.UNKNOWN.toString()).assertEqual('UNKNOWN');
      expect(PowerState.ON.toString()).assertEqual('ON');
      expect(PowerState.OFF.toString()).assertEqual('OFF');
      expect(StateSource.SCENE.toString()).assertEqual('SCENE');
      expect(StateSource.MANUAL.toString()).assertEqual('MANUAL');
      expect(StateSource.SYSTEM.toString()).assertEqual('SYSTEM');
      expect(StateSource.SCENE.toString() !== StateSource.MANUAL.toString()).assertTrue();
      expect(StateSource.MANUAL.toString() !== StateSource.SYSTEM.toString()).assertTrue();
      expect(StateSource.SYSTEM.toString() !== StateSource.SCENE.toString()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0103
     * @tc.name      testRoomLogic0004
     * @tc.desc      场景步骤默认延迟 250 毫秒且默认启用，期望状态默认未知电源、无等级、场景来源。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const step: SceneStep = new SceneStep();
      expect(step.id).assertEqual('');
      expect(step.delayMs).assertEqual(250);
      expect(step.delayMs).assertEqual(AppConstants.STEP_INTERVAL_MS);
      expect(step.enabled).assertTrue();
      expect(step.order).assertEqual(0);
      const state: DeviceExpectedState = new DeviceExpectedState();
      expect(state.power).assertEqual(PowerState.UNKNOWN);
      expect(state.level).assertEqual(-1);
      expect(state.source).assertEqual(StateSource.SCENE);
      expect(state.updatedAt).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0104
     * @tc.name      testRoomLogic0005
     * @tc.desc      房间、设备、按键、场景新实例的主键与名称均为空串，遥控模板默认非内置。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const room: Room = new Room();
      expect(room.id).assertEqual('');
      expect(room.name).assertEqual('');
      const device: Device = new Device();
      expect(device.id).assertEqual('');
      expect(device.roomId).assertEqual('');
      expect(device.name).assertEqual('');
      const key: RoomKey = new RoomKey();
      expect(key.id).assertEqual('');
      expect(key.deviceId).assertEqual('');
      expect(key.irCodeId).assertEqual('');
      const scene: Scene = new Scene();
      expect(scene.id).assertEqual('');
      expect(scene.name).assertEqual('');
      const template: RemoteTemplate = new RemoteTemplate();
      expect(template.builtin).assertFalse();
      expect(template.layout).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0105
     * @tc.name      testRoomLogic0006
     * @tc.desc      六种设备类型都能取得非空展示名称，且六个名称两两互不相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const types: DeviceType[] = allDeviceTypes();
      const labels: string[] = [];
      for (let i = 0; i < types.length; i++) {
        const label: string = getDeviceTypeLabel(types[i]);
        expect(label.length > 0).assertTrue();
        labels.push(label);
      }
      for (let i = 0; i < labels.length; i++) {
        for (let j = i + 1; j < labels.length; j++) {
          expect(labels[i] !== labels[j]).assertTrue();
        }
      }
      expect(labels.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0106
     * @tc.name      testRoomLogic0007
     * @tc.desc      十二种按键语义都能取得非空展示名称，且十二个名称两两互不相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const semantics: KeySemantic[] = allKeySemantics();
      const labels: string[] = [];
      for (let i = 0; i < semantics.length; i++) {
        const label: string = getKeySemanticLabel(semantics[i]);
        expect(label.length > 0).assertTrue();
        labels.push(label);
      }
      for (let i = 0; i < labels.length; i++) {
        for (let j = i + 1; j < labels.length; j++) {
          expect(labels[i] !== labels[j]).assertTrue();
        }
      }
      expect(labels.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0107
     * @tc.name      testRoomLogic0008
     * @tc.desc      单个步骤引用的设备与按键全部存在且归属匹配时，场景校验通过且无任何问题提示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [makeStep('step-1', 'scene-1', 'dev-1', 'key-1', 0, true)];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertTrue();
      expect(result.messages.length).assertEqual(0);
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      expect(result.tooManySteps).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0108
     * @tc.name      testRoomLogic0009
     * @tc.desc      场景步骤列表为空时校验失败，提示没有任何可执行步骤。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: SceneValidation = SceneValidator.validateSteps([], [], []);
      expect(result.valid).assertFalse();
      expect(result.tooManySteps).assertFalse();
      expect(joinedMessages(result.messages).indexOf('no executable steps') >= 0).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0109
     * @tc.name      testRoomLogic0010
     * @tc.desc      全部步骤都被停用时同样无可执行步骤，校验失败且不产生引用缺失记录。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [
        makeStep('step-1', 'scene-1', 'dev-1', 'key-1', 0, false),
        makeStep('step-2', 'scene-1', 'dev-1', 'key-1', 1, false)
      ];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(joinedMessages(result.messages).indexOf('no executable steps') >= 0).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      expect(result.tooManySteps).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0110
     * @tc.name      testRoomLogic0011
     * @tc.desc      步骤引用了设备表中不存在的设备时校验失败，缺失设备编号被记录且不误报按键问题。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [makeStep('step-1', 'scene-1', 'dev-ghost', 'key-1', 0, true)];
      const result: SceneValidation =
        SceneValidator.validateSteps(steps, [makeDevice('dev-1', 'room-1')], keys);
      expect(result.valid).assertFalse();
      expect(result.missingDeviceIds.length).assertEqual(1);
      expect(result.missingDeviceIds[0]).assertEqual('dev-ghost');
      expect(joinedMessages(result.messages).indexOf('missing device') >= 0).assertTrue();
      expect(result.missingKeyIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0111
     * @tc.name      testRoomLogic0012
     * @tc.desc      设备存在但步骤引用的按键编号不存在时校验失败，缺失按键编号被记录。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const steps: SceneStep[] = [makeStep('step-1', 'scene-1', 'dev-1', 'key-ghost', 0, true)];
      const result: SceneValidation =
        SceneValidator.validateSteps(steps, [makeDevice('dev-1', 'room-1')], []);
      expect(result.valid).assertFalse();
      expect(result.missingKeyIds.length).assertEqual(1);
      expect(result.missingKeyIds[0]).assertEqual('key-ghost');
      expect(joinedMessages(result.messages).indexOf('Scene key is invalid') >= 0).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0112
     * @tc.name      testRoomLogic0013
     * @tc.desc      按键存在但归属设备与步骤目标设备不一致时校验失败，按键编号进入缺失清单。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1'), makeDevice('dev-2', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [makeStep('step-1', 'scene-1', 'dev-2', 'key-1', 0, true)];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.missingKeyIds.length).assertEqual(1);
      expect(result.missingKeyIds[0]).assertEqual('key-1');
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(joinedMessages(result.messages).indexOf('Scene key is invalid') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0113
     * @tc.name      testRoomLogic0014
     * @tc.desc      恰好十二个全部合法的启用步骤是场景允许的步骤上限，校验通过且无超步提示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1'), makeDevice('dev-2', 'room-1')];
      const keys: RoomKey[] = [
        makeKey('key-1', 'dev-1', KeySemantic.POWER_ON),
        makeKey('key-2', 'dev-2', KeySemantic.POWER_OFF)
      ];
      const steps: SceneStep[] = [];
      for (let i = 0; i < AppConstants.MAX_SCENE_STEPS; i++) {
        const deviceId: string = i % 2 === 0 ? 'dev-1' : 'dev-2';
        const keyId: string = i % 2 === 0 ? 'key-1' : 'key-2';
        steps.push(makeStep('step-' + i.toString(), 'scene-1', deviceId, keyId, i, true));
      }
      expect(steps.length).assertEqual(12);
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertTrue();
      expect(result.tooManySteps).assertFalse();
      expect(result.messages.length).assertEqual(0);
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0114
     * @tc.name      testRoomLogic0015
     * @tc.desc      十三个步骤超出场景步骤上限时校验失败并给出超步提示，引用本身仍然合法。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1'), makeDevice('dev-2', 'room-1')];
      const keys: RoomKey[] = [
        makeKey('key-1', 'dev-1', KeySemantic.POWER_ON),
        makeKey('key-2', 'dev-2', KeySemantic.POWER_OFF)
      ];
      const steps: SceneStep[] = [];
      for (let i = 0; i <= AppConstants.MAX_SCENE_STEPS; i++) {
        const deviceId: string = i % 2 === 0 ? 'dev-1' : 'dev-2';
        const keyId: string = i % 2 === 0 ? 'key-1' : 'key-2';
        steps.push(makeStep('step-' + i.toString(), 'scene-1', deviceId, keyId, i, true));
      }
      expect(steps.length).assertEqual(13);
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.tooManySteps).assertTrue();
      expect(joinedMessages(result.messages).indexOf('more than 12 steps') >= 0).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0115
     * @tc.name      testRoomLogic0016
     * @tc.desc      两个步骤引用同一个缺失设备时，缺失设备清单只保留一份，提示也只汇总一条。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [
        makeStep('step-1', 'scene-1', 'dev-ghost', 'key-1', 0, true),
        makeStep('step-2', 'scene-1', 'dev-ghost', 'key-1', 1, true)
      ];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.missingDeviceIds.length).assertEqual(1);
      expect(result.missingDeviceIds[0]).assertEqual('dev-ghost');
      expect(result.messages.length).assertEqual(1);
      expect(result.missingKeyIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0116
     * @tc.name      testRoomLogic0017
     * @tc.desc      停用步骤引用缺失设备或缺失按键时不参与校验，启用步骤合法则整体校验通过。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [
        makeStep('step-1', 'scene-1', 'dev-1', 'key-1', 0, true),
        makeStep('step-2', 'scene-1', 'dev-ghost', 'key-1', 1, false),
        makeStep('step-3', 'scene-1', 'dev-1', 'key-ghost', 2, false)
      ];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      expect(result.messages.length).assertEqual(0);
      expect(result.tooManySteps).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0117
     * @tc.name      testRoomLogic0018
     * @tc.desc      缺设备、缺按键与超步数三类问题同时出现时，三类记录全部产生且提示汇总不少于三条。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const steps: SceneStep[] = [];
      steps.push(makeStep('step-0', 'scene-1', 'dev-missing', 'key-1', 0, true));
      steps.push(makeStep('step-1', 'scene-1', 'dev-1', 'key-missing', 1, true));
      for (let i = 2; i < 13; i++) {
        steps.push(makeStep('step-' + i.toString(), 'scene-1', 'dev-1', 'key-1', i, true));
      }
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertFalse();
      expect(result.tooManySteps).assertTrue();
      expect(result.missingDeviceIds.length).assertEqual(1);
      expect(result.missingDeviceIds[0]).assertEqual('dev-missing');
      expect(result.missingKeyIds.length).assertEqual(1);
      expect(result.missingKeyIds[0]).assertEqual('key-missing');
      expect(result.messages.length >= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0118
     * @tc.name      testRoomLogic0019
     * @tc.desc      多设备多按键交叉引用且归属全部匹配的多步场景校验通过，无任何缺失记录。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const devices: Device[] = [
        makeDevice('dev-1', 'room-1'), makeDevice('dev-2', 'room-1'),
        makeDevice('dev-3', 'room-1')
      ];
      const keys: RoomKey[] = [
        makeKey('key-1', 'dev-1', KeySemantic.POWER_ON),
        makeKey('key-2', 'dev-2', KeySemantic.VOL_UP),
        makeKey('key-3', 'dev-3', KeySemantic.VOL_DOWN)
      ];
      const steps: SceneStep[] = [
        makeStep('step-1', 'scene-1', 'dev-3', 'key-3', 0, true),
        makeStep('step-2', 'scene-1', 'dev-1', 'key-1', 1, true),
        makeStep('step-3', 'scene-1', 'dev-2', 'key-2', 2, true)
      ];
      const result: SceneValidation = SceneValidator.validateSteps(steps, devices, keys);
      expect(result.valid).assertTrue();
      expect(result.messages.length).assertEqual(0);
      expect(result.missingDeviceIds.length).assertEqual(0);
      expect(result.missingKeyIds.length).assertEqual(0);
      expect(result.tooManySteps).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0119
     * @tc.name      testRoomLogic0020
     * @tc.desc      手动校正过的设备状态不被 POWER_ON 语义改写，电源、等级、来源与更新时间均保持原值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const current: DeviceExpectedState = makeState(PowerState.ON, 30, StateSource.MANUAL);
      const next: DeviceExpectedState =
        ExpectedStateService.nextState(current, KeySemantic.POWER_ON, FIXED_EXPORTED_AT);
      expect(next.power).assertEqual(PowerState.ON);
      expect(next.level).assertEqual(30);
      expect(next.source).assertEqual(StateSource.MANUAL);
      expect(next.updatedAt).assertEqual(0);
      expect(next.deviceId).assertEqual('dev-state');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0120
     * @tc.name      testRoomLogic0021
     * @tc.desc      开机与关机语义在未知、开机、关机三种起点下都得到正确的目标电源状态。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const onFromUnknown: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.POWER_ON, 100);
      expect(onFromUnknown.power).assertEqual(PowerState.ON);
      const onFromOff: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.OFF, 10, StateSource.SCENE), KeySemantic.POWER_ON, 100);
      expect(onFromOff.power).assertEqual(PowerState.ON);
      const offFromUnknown: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.POWER_OFF, 100);
      expect(offFromUnknown.power).assertEqual(PowerState.OFF);
      const offFromOn: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.ON, 10, StateSource.SCENE), KeySemantic.POWER_OFF, 100);
      expect(offFromOn.power).assertEqual(PowerState.OFF);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0121
     * @tc.name      testRoomLogic0022
     * @tc.desc      电源未知时执行切换语义得到开机状态，等级与来源保持不变并写入注入时间。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const next: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.POWER_TOGGLE, 200);
      expect(next.power).assertEqual(PowerState.ON);
      expect(next.level).assertEqual(-1);
      expect(next.source).assertEqual(StateSource.SCENE);
      expect(next.updatedAt).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0122
     * @tc.name      testRoomLogic0023
     * @tc.desc      开机执行切换得到关机、关机执行切换得到开机，等级均不被切换语义改动。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const toggledOff: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.ON, 5, StateSource.SCENE), KeySemantic.POWER_TOGGLE, 300);
      expect(toggledOff.power).assertEqual(PowerState.OFF);
      expect(toggledOff.level).assertEqual(5);
      const toggledOn: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.OFF, 5, StateSource.SCENE), KeySemantic.POWER_TOGGLE, 300);
      expect(toggledOn.power).assertEqual(PowerState.ON);
      expect(toggledOn.level).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0123
     * @tc.name      testRoomLogic0024
     * @tc.desc      无等级概念的状态执行音量加时从默认 50 起步得到 55，等级 50 执行音量加同样得到 55。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fromNone: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.VOL_UP, 400);
      expect(fromNone.level).assertEqual(55);
      const from50: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 50, StateSource.SCENE), KeySemantic.VOL_UP, 400);
      expect(from50.level).assertEqual(55);
      expect(from50.power).assertEqual(PowerState.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0124
     * @tc.name      testRoomLogic0025
     * @tc.desc      等级 97 与等级 100 执行音量加都被夹紧到上限 100，时间戳来自注入的当前时间。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const from97: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 97, StateSource.SCENE), KeySemantic.VOL_UP, 500);
      expect(from97.level).assertEqual(100);
      const from100: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 100, StateSource.SCENE), KeySemantic.VOL_UP, 500);
      expect(from100.level).assertEqual(100);
      expect(from100.updatedAt).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0125
     * @tc.name      testRoomLogic0026
     * @tc.desc      无等级概念执行音量减得到 45，等级 0 与等级 3 执行音量减都被夹紧到下限 0。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fromNone: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.VOL_DOWN, 600);
      expect(fromNone.level).assertEqual(45);
      const from0: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 0, StateSource.SCENE), KeySemantic.VOL_DOWN, 600);
      expect(from0.level).assertEqual(0);
      const from3: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 3, StateSource.SCENE), KeySemantic.VOL_DOWN, 600);
      expect(from3.level).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0126
     * @tc.name      testRoomLogic0027
     * @tc.desc      温度加减与音量加减走同一套等级调整：无等级加一步得 55，等级 60 减一步得 55。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const warmedUp: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.TEMP_UP, 700);
      expect(warmedUp.level).assertEqual(55);
      const cooledDown: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 60, StateSource.SCENE), KeySemantic.TEMP_DOWN, 700);
      expect(cooledDown.level).assertEqual(55);
      expect(warmedUp.power).assertEqual(PowerState.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0127
     * @tc.name      testRoomLogic0028
     * @tc.desc      HDMI 切换等无副作用语义不改变电源与等级，来源保持为场景来源并写入注入时间。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const next: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.ON, 42, StateSource.SCENE), KeySemantic.HDMI_1, 800);
      expect(next.power).assertEqual(PowerState.ON);
      expect(next.level).assertEqual(42);
      expect(next.source).assertEqual(StateSource.SCENE);
      expect(next.updatedAt).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0128
     * @tc.name      testRoomLogic0029
     * @tc.desc      风速切换语义同样不改变电源与等级，状态更新时间等于调用方注入的时间参数。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const next: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.OFF, 15, StateSource.SCENE), KeySemantic.FAN_SPEED, 900);
      expect(next.power).assertEqual(PowerState.OFF);
      expect(next.level).assertEqual(15);
      expect(next.source).assertEqual(StateSource.SCENE);
      expect(next.updatedAt).assertEqual(900);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0129
     * @tc.name      testRoomLogic0030
     * @tc.desc      开机、音量与切换三种语义推进后的状态更新时间都严格等于注入的时间参数。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const stamp: number = 1699999999999;
      const viaPower: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, -1, StateSource.SCENE), KeySemantic.POWER_ON, stamp);
      expect(viaPower.updatedAt).assertEqual(stamp);
      const viaVolume: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.UNKNOWN, 50, StateSource.SCENE), KeySemantic.VOL_UP, stamp);
      expect(viaVolume.updatedAt).assertEqual(stamp);
      const viaToggle: DeviceExpectedState = ExpectedStateService.nextState(
        makeState(PowerState.OFF, 20, StateSource.SCENE), KeySemantic.POWER_TOGGLE, stamp);
      expect(viaToggle.updatedAt).assertEqual(stamp);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0130
     * @tc.name      testRoomLogic0031
     * @tc.desc      构建配置包时记录格式版本 1、导出时间与来源模式原样写入，校验码为 8 位小写十六进制。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pkg: ConfigPackageData = buildValidPackage();
      expect(pkg.formatVersion).assertEqual(AppConstants.CONFIG_PACKAGE_VERSION);
      expect(pkg.formatVersion).assertEqual(1);
      expect(pkg.exportedAt).assertEqual(FIXED_EXPORTED_AT);
      expect(pkg.sourceMode).assertEqual(FIXED_SOURCE_MODE);
      expect(pkg.rooms.length).assertEqual(1);
      expect(isLowerHex8(pkg.checksum)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0131
     * @tc.name      testRoomLogic0032
     * @tc.desc      同一组数据两次构建得到相同校验码，数据内容不同的空包与单房间包校验码不同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: ConfigPackageData = buildValidPackage();
      const second: ConfigPackageData = buildValidPackage();
      expect(first.checksum).assertEqual(second.checksum);
      const emptyPkg: ConfigPackageData = ConfigPackageSchema.build(
        [], [], [], [], [], [], [], [], FIXED_SOURCE_MODE, FIXED_EXPORTED_AT);
      expect(emptyPkg.checksum !== first.checksum).assertTrue();
      expect(isLowerHex8(first.checksum)).assertTrue();
      expect(isLowerHex8(emptyPkg.checksum)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0132
     * @tc.name      testRoomLogic0033
     * @tc.desc      引用完整且校验码与内容一致的合法配置包通过整体校验，不产生任何错误提示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pkg: ConfigPackageData = buildValidPackage();
      const raw: Record<string, Object> = makePackageRecord(pkg.rooms, pkg.devices,
        pkg.keys, pkg.irCodes, pkg.remoteTemplates, pkg.scenes, pkg.sceneSteps,
        pkg.expectedStates, pkg.checksum, pkg.exportedAt, pkg.sourceMode);
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length).assertEqual(0);
      expect(pkg.formatVersion).assertEqual(AppConstants.CONFIG_PACKAGE_VERSION);
      expect(pkg.keys[0].irCodeId).assertEqual('code-1');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0133
     * @tc.name      testRoomLogic0034
     * @tc.desc      缺少格式版本字段与携带不兼容版本号这两种包分别被识别并给出对应提示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const rawMissing: Record<string, Object> = {
        'exportedAt': 1000,
        'sourceMode': FIXED_SOURCE_MODE,
        'rooms': [],
        'devices': [],
        'keys': [],
        'irCodes': [],
        'remoteTemplates': [],
        'scenes': [],
        'sceneSteps': [],
        'expectedStates': []
      };
      const missingErrors: string[] = ConfigPackageSchema.validateRecord(rawMissing);
      expect(missingErrors.length >= 1).assertTrue();
      expect(joinedMessages(missingErrors).indexOf('Missing formatVersion field') >= 0).assertTrue();
      const rawV2: Record<string, Object> = {
        'formatVersion': 2,
        'rooms': [],
        'devices': [],
        'keys': [],
        'irCodes': [],
        'remoteTemplates': [],
        'scenes': [],
        'sceneSteps': [],
        'expectedStates': []
      };
      const v2Errors: string[] = ConfigPackageSchema.validateRecord(rawV2);
      expect(v2Errors.length >= 1).assertTrue();
      expect(joinedMessages(v2Errors).indexOf('Incompatible config package version') >= 0).assertTrue();
      expect(joinedMessages(v2Errors).indexOf(': 2 (expected 1)') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0134
     * @tc.name      testRoomLogic0035
     * @tc.desc      八个必需列表全部缺失时恰好报出八条缺失提示，仅缺一个列表时只报该列表。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const rawEmpty: Record<string, Object> = {
        'formatVersion': AppConstants.CONFIG_PACKAGE_VERSION
      };
      const allMissing: string[] = ConfigPackageSchema.validateRecord(rawEmpty);
      expect(allMissing.length).assertEqual(8);
      expect(joinedMessages(allMissing).indexOf('Missing array: rooms') >= 0).assertTrue();
      expect(joinedMessages(allMissing).indexOf('Missing array: expectedStates') >= 0).assertTrue();
      const rawPartial: Record<string, Object> = {
        'formatVersion': AppConstants.CONFIG_PACKAGE_VERSION,
        'rooms': [],
        'devices': [],
        'keys': [],
        'remoteTemplates': [],
        'scenes': [],
        'sceneSteps': [],
        'expectedStates': []
      };
      const oneMissing: string[] = ConfigPackageSchema.validateRecord(rawPartial);
      expect(oneMissing.length).assertEqual(1);
      expect(joinedMessages(oneMissing).indexOf('Missing array: irCodes') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0135
     * @tc.name      testRoomLogic0036
     * @tc.desc      设备引用了不存在的房间、按键引用了不存在的设备时，分别得到指向缺失对象的提示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: ConfigPackageData = buildValidPackage();
      const wrongChecksum: string = flipFirstHexChar(base.checksum);
      const rawMissingRoom: Record<string, Object> = makePackageRecord(
        [], [makeDevice('dev-1', 'room-x')], [], [], [], [], [], [],
        wrongChecksum, 1000, FIXED_SOURCE_MODE);
      const roomErrors: string[] = ConfigPackageSchema.validateRecord(rawMissingRoom);
      expect(roomErrors.length >= 1).assertTrue();
      expect(joinedMessages(roomErrors).indexOf('references missing room') >= 0).assertTrue();
      expect(joinedMessages(roomErrors).indexOf('references missing device') < 0).assertTrue();
      const rawMissingDevice: Record<string, Object> = makePackageRecord(
        [makeRoom('room-1')], [makeDevice('dev-1', 'room-1')],
        [makeKey('key-1', 'dev-ghost', KeySemantic.POWER_ON)], [], [], [], [], [],
        wrongChecksum, 1000, FIXED_SOURCE_MODE);
      const deviceErrors: string[] = ConfigPackageSchema.validateRecord(rawMissingDevice);
      expect(deviceErrors.length >= 1).assertTrue();
      expect(joinedMessages(deviceErrors).indexOf('references missing device') >= 0).assertTrue();
      expect(joinedMessages(deviceErrors).indexOf('references missing room') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0136
     * @tc.name      testRoomLogic0037
     * @tc.desc      按键引用不存在的红外码被识别为缺失，空红外码编号视为尚未配码的合法按键。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: ConfigPackageData = buildValidPackage();
      const wrongChecksum: string = flipFirstHexChar(base.checksum);
      const ghostKey: RoomKey = makeKey('key-1', 'dev-1', KeySemantic.POWER_ON);
      ghostKey.irCodeId = 'code-ghost';
      const rawGhostCode: Record<string, Object> = makePackageRecord(
        [makeRoom('room-1')], [makeDevice('dev-1', 'room-1')], [ghostKey],
        [], [], [], [], [], wrongChecksum, 1000, FIXED_SOURCE_MODE);
      const ghostErrors: string[] = ConfigPackageSchema.validateRecord(rawGhostCode);
      expect(ghostErrors.length >= 1).assertTrue();
      expect(joinedMessages(ghostErrors).indexOf('references missing IR code') >= 0).assertTrue();
      const rooms: Room[] = [makeRoom('room-1')];
      const devices: Device[] = [makeDevice('dev-1', 'room-1')];
      const keys: RoomKey[] = [makeKey('key-1', 'dev-1', KeySemantic.POWER_ON)];
      const pkg: ConfigPackageData = ConfigPackageSchema.build(
        rooms, devices, keys, [], [], [], [], [], FIXED_SOURCE_MODE, 1000);
      const raw: Record<string, Object> = makePackageRecord(pkg.rooms, pkg.devices,
        pkg.keys, pkg.irCodes, pkg.remoteTemplates, pkg.scenes, pkg.sceneSteps,
        pkg.expectedStates, pkg.checksum, pkg.exportedAt, pkg.sourceMode);
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0137
     * @tc.name      testRoomLogic0038
     * @tc.desc      场景步骤引用缺失的场景、设备与按键时，三类缺失提示逐条出现且互不混淆。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: ConfigPackageData = buildValidPackage();
      const wrongChecksum: string = flipFirstHexChar(base.checksum);
      const step: SceneStep = makeStep('step-1', 'scene-x', 'dev-x', 'key-x', 0, true);
      const raw: Record<string, Object> = makePackageRecord(
        [], [], [], [], [], [], [step], [], wrongChecksum, 1000, FIXED_SOURCE_MODE);
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length >= 3).assertTrue();
      expect(joinedMessages(errors).indexOf('references missing scene') >= 0).assertTrue();
      expect(joinedMessages(errors).indexOf('references missing device') >= 0).assertTrue();
      expect(joinedMessages(errors).indexOf('references missing key') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0138
     * @tc.name      testRoomLogic0039
     * @tc.desc      合法配置包的校验码被替换为不一致的值时，整体校验只报出校验码不一致这一条问题。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pkg: ConfigPackageData = buildValidPackage();
      const tampered: string = flipFirstHexChar(pkg.checksum);
      expect(tampered !== pkg.checksum).assertTrue();
      expect(tampered.length).assertEqual(8);
      const raw: Record<string, Object> = makePackageRecord(pkg.rooms, pkg.devices,
        pkg.keys, pkg.irCodes, pkg.remoteTemplates, pkg.scenes, pkg.sceneSteps,
        pkg.expectedStates, tampered, pkg.exportedAt, pkg.sourceMode);
      const errors: string[] = ConfigPackageSchema.validateRecord(raw);
      expect(errors.length).assertEqual(1);
      expect(joinedMessages(errors).indexOf('checksum mismatch') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0139
     * @tc.name      testRoomLogic0040
     * @tc.desc      配置包序列化为文本再解析回来后，各列表长度、关键字段与校验码全部保持一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pkg: ConfigPackageData = buildValidPackage();
      const text: string = ConfigPackageSchema.toJson(pkg);
      expect(text.length > 0).assertTrue();
      const restored: ConfigPackageData = ConfigPackageSchema.fromJson(text);
      expect(restored.formatVersion).assertEqual(AppConstants.CONFIG_PACKAGE_VERSION);
      expect(restored.rooms.length).assertEqual(1);
      expect(restored.rooms[0].id).assertEqual('room-1');
      expect(restored.devices.length).assertEqual(1);
      expect(restored.devices[0].type).assertEqual(DeviceType.PROJECTOR);
      expect(restored.keys[0].semantic).assertEqual(KeySemantic.POWER_ON);
      expect(restored.irCodes.length).assertEqual(1);
      expect(restored.irCodes[0].frequencyHz).assertEqual(AppConstants.DEFAULT_FREQUENCY_HZ);
      expect(restored.remoteTemplates.length).assertEqual(1);
      expect(restored.scenes.length).assertEqual(1);
      expect(restored.sceneSteps.length).assertEqual(1);
      expect(restored.sceneSteps[0].delayMs).assertEqual(AppConstants.STEP_INTERVAL_MS);
      expect(restored.expectedStates[0].power).assertEqual(PowerState.ON);
      expect(restored.checksum).assertEqual(pkg.checksum);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0140
     * @tc.name      testRoomLogic0041
     * @tc.desc      传入无法解析的文本时配置包解析抛出明确的解析失败提示，不返回半成品数据。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const notJson: string = captureMessage(() => {
        ConfigPackageSchema.fromJson('this is not json at all');
      });
      expect(notJson).assertEqual('Failed to parse config package JSON');
      const truncated: string = captureMessage(() => {
        ConfigPackageSchema.fromJson('{"formatVersion": ');
      });
      expect(truncated).assertEqual('Failed to parse config package JSON');
      const emptyText: string = captureMessage(() => {
        ConfigPackageSchema.fromJson('');
      });
      expect(emptyText).assertEqual('Failed to parse config package JSON');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0141
     * @tc.name      testRoomLogic0042
     * @tc.desc      版本不兼容的配置包文本解析时抛出异常，异常信息包含版本不兼容提示以及实际版本 2 与期望版本 1。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const rawV2: Record<string, Object> = {
        'formatVersion': 2,
        'rooms': [],
        'devices': [],
        'keys': [],
        'irCodes': [],
        'remoteTemplates': [],
        'scenes': [],
        'sceneSteps': [],
        'expectedStates': []
      };
      const text: string = JSON.stringify(rawV2);
      const thrown: string = captureMessage(() => {
        ConfigPackageSchema.fromJson(text);
      });
      expect(thrown.length > 0).assertTrue();
      expect(thrown.indexOf('Incompatible config package version') >= 0).assertTrue();
      expect(thrown.indexOf(': 2 (expected 1)') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0142
     * @tc.name      testRoomLogic0043
     * @tc.desc      解析字段缺失的行时按默认值回退：设备类型投影仪、电源未知、步骤启用且延迟 250、频率 38 千赫兹。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const blankDevice: Record<string, Object> = {};
      const blankCode: Record<string, Object> = {};
      const blankStep: Record<string, Object> = {};
      const blankState: Record<string, Object> = {};
      const raw: Record<string, Object> = {
        'devices': [blankDevice],
        'irCodes': [blankCode],
        'sceneSteps': [blankStep],
        'expectedStates': [blankState]
      };
      const data: ConfigPackageData = ConfigPackageSchema.parse(raw);
      expect(data.formatVersion).assertEqual(AppConstants.CONFIG_PACKAGE_VERSION);
      expect(data.checksum).assertEqual('');
      expect(data.devices.length).assertEqual(1);
      expect(data.devices[0].type).assertEqual(DeviceType.PROJECTOR);
      expect(data.irCodes.length).assertEqual(1);
      expect(data.irCodes[0].frequencyHz).assertEqual(AppConstants.DEFAULT_FREQUENCY_HZ);
      expect(data.irCodes[0].frequencyHz).assertEqual(38000);
      expect(data.sceneSteps.length).assertEqual(1);
      expect(data.sceneSteps[0].enabled).assertTrue();
      expect(data.sceneSteps[0].delayMs).assertEqual(250);
      expect(data.expectedStates.length).assertEqual(1);
      expect(data.expectedStates[0].power).assertEqual(PowerState.UNKNOWN);
      expect(data.expectedStates[0].level).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0143
     * @tc.name      testRoomLogic0044
     * @tc.desc      投影仪模板布局固定为六个按键且顺序为开关机、双 HDMI、音量加减。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const layout: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.PROJECTOR);
      expect(layout.length).assertEqual(6);
      expect(layout[0]).assertEqual(KeySemantic.POWER_ON);
      expect(layout[1]).assertEqual(KeySemantic.POWER_OFF);
      expect(layout[2]).assertEqual(KeySemantic.HDMI_1);
      expect(layout[3]).assertEqual(KeySemantic.HDMI_2);
      expect(layout[4]).assertEqual(KeySemantic.VOL_UP);
      expect(layout[5]).assertEqual(KeySemantic.VOL_DOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0144
     * @tc.name      testRoomLogic0045
     * @tc.desc      电视布局与投影仪完全一致，六种设备类型的布局首键均为开机键。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const projector: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.PROJECTOR);
      const tv: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.TV);
      expect(tv.length).assertEqual(projector.length);
      for (let i = 0; i < projector.length; i++) {
        expect(tv[i]).assertEqual(projector[i]);
      }
      const types: DeviceType[] = allDeviceTypes();
      for (let i = 0; i < types.length; i++) {
        const layout: KeySemantic[] = RemoteTemplateSeeder.getLayout(types[i]);
        expect(layout.length > 0).assertTrue();
        expect(layout[0]).assertEqual(KeySemantic.POWER_ON);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0145
     * @tc.name      testRoomLogic0046
     * @tc.desc      幕布布局四键包含升幕与降幕，灯光布局只有开灯与关灯两个按键。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const screen: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.SCREEN);
      expect(screen.length).assertEqual(4);
      expect(screen.indexOf(KeySemantic.SCREEN_UP) >= 0).assertTrue();
      expect(screen.indexOf(KeySemantic.SCREEN_DOWN) >= 0).assertTrue();
      expect(screen[0]).assertEqual(KeySemantic.POWER_ON);
      const light: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.LIGHT);
      expect(light.length).assertEqual(2);
      expect(light[0]).assertEqual(KeySemantic.POWER_ON);
      expect(light[1]).assertEqual(KeySemantic.POWER_OFF);
      expect(light.indexOf(KeySemantic.HDMI_1) < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0146
     * @tc.name      testRoomLogic0047
     * @tc.desc      空调布局五键包含温度与风速按键，音响布局四键不含任何 HDMI 切换键。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const ac: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.AC);
      expect(ac.length).assertEqual(5);
      expect(ac.indexOf(KeySemantic.TEMP_UP) >= 0).assertTrue();
      expect(ac.indexOf(KeySemantic.TEMP_DOWN) >= 0).assertTrue();
      expect(ac.indexOf(KeySemantic.FAN_SPEED) >= 0).assertTrue();
      const audio: KeySemantic[] = RemoteTemplateSeeder.getLayout(DeviceType.AUDIO);
      expect(audio.length).assertEqual(4);
      expect(audio.indexOf(KeySemantic.HDMI_1) < 0).assertTrue();
      expect(audio.indexOf(KeySemantic.HDMI_2) < 0).assertTrue();
      expect(audio[0]).assertEqual(KeySemantic.POWER_ON);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0147
     * @tc.name      testRoomLogic0048
     * @tc.desc      目标版本高于当前版本时判定为升级方向，全新零版本的库同样判定为升级。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SchemaMigration.compareVersion(1, 2)).assertEqual('UPGRADE');
      expect(SchemaMigration.compareVersion(0, 1)).assertEqual('UPGRADE');
      expect(SchemaMigration.compareVersion(1, 2) === 'DOWNGRADE').assertFalse();
      expect(SchemaMigration.compareVersion(0, 1) === 'SAME').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0148
     * @tc.name      testRoomLogic0049
     * @tc.desc      目标版本低于当前版本时判定为降级方向，降级判定不会与升级或同版本混淆。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SchemaMigration.compareVersion(2, 1)).assertEqual('DOWNGRADE');
      expect(SchemaMigration.compareVersion(9, 3)).assertEqual('DOWNGRADE');
      expect(SchemaMigration.compareVersion(2, 1) === 'UPGRADE').assertFalse();
      expect(SchemaMigration.compareVersion(2, 1) === 'SAME').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0149
     * @tc.name      testRoomLogic0050
     * @tc.desc      当前版本与目标版本相同时判定为同版本，不触发升级也不触发降级。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SchemaMigration.compareVersion(1, 1)).assertEqual('SAME');
      expect(SchemaMigration.compareVersion(7, 7)).assertEqual('SAME');
      expect(SchemaMigration.compareVersion(3, 3) !== 'UPGRADE').assertTrue();
      expect(SchemaMigration.compareVersion(3, 3) !== 'DOWNGRADE').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0150
     * @tc.name      testRoomLogic0051
     * @tc.desc      空串与纯空白的 Pronto 码文本都会被拒绝并提示输入为空，合法 Pronto 码解析出带 pronto 前缀的编号。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const emptyThrown: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('');
      });
      expect(emptyThrown).assertEqual('Pronto HEX is empty');
      const blankThrown: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('   \t  ');
      });
      expect(blankThrown).assertEqual('Pronto HEX is empty');
      const valid: IrCode = IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 015C 00AA');
      expect(valid.id.startsWith('pronto-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0151
     * @tc.name      testRoomLogic0052
     * @tc.desc      少于四个十六进制词的输入被拒绝，提示至少需要四个词。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const threeWords: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B 0001');
      });
      expect(threeWords.indexOf('requires at least 4 words') >= 0).assertTrue();
      const twoWords: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B');
      });
      expect(twoWords.indexOf('requires at least 4 words') >= 0).assertTrue();
      const fourWords: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0002');
      });
      expect(fourWords.indexOf('requires at least 4 words') < 0).assertTrue();
      expect(fourWords.indexOf('no waveform data') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0152
     * @tc.name      testRoomLogic0053
     * @tc.desc      频率字段为零的 Pronto 码无法换算载波频率，被拒绝并给出零频率提示；频率字段为 006B 时换算为 38740 赫兹。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroFrequency: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 0000 0001 0002 015C 00AA');
      });
      expect(zeroFrequency.indexOf('frequency field is 0') >= 0).assertTrue();
      const validFrequency: IrCode =
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 015C 00AA');
      expect(validFrequency.frequencyHz).assertEqual(38740);
      expect(validFrequency.payload.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0153
     * @tc.name      testRoomLogic0054
     * @tc.desc      只有四个头部词而没有波形数据的输入被拒绝，提示缺少波形数据；含一对波形词的输入解析为重复一次的载荷。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const noData: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0002');
      });
      expect(noData.indexOf('no waveform data') >= 0).assertTrue();
      const withData: IrCode =
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0003 015C 00AA');
      expect(withData.payload).assertEqual('8983,4388');
      expect(withData.repeatCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0154
     * @tc.name      testRoomLogic0055
     * @tc.desc      波形数据词个数为奇数时无法配对，被拒绝并提示数据必须成对出现；两对波形词按顺序解析为四个载荷值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const oddPairs: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0003 015C');
      });
      expect(oddPairs.indexOf('must come in pairs') >= 0).assertTrue();
      const evenPairs: IrCode = IrLibraryImporter.parseProntoHex(
        '0000 006B 0001 0002 015C 00AA 015C 00AA');
      expect(evenPairs.payload).assertEqual('8983,4388,8983,4388');
      expect(evenPairs.frequencyHz).assertEqual(38740);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0155
     * @tc.name      testRoomLogic0056
     * @tc.desc      非四位十六进制词（含字母、过短、过长）分别按其在序列中的位置被识别为非法词。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const letters: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('ZZZZ 006B 0001 0002 015C 00AA');
      });
      expect(letters.indexOf('word 1 is invalid') >= 0).assertTrue();
      const tooShort: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 123 0001 0002 015C 00AA');
      });
      expect(tooShort.indexOf('word 2 is invalid') >= 0).assertTrue();
      const tooLong: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 123456 00AA');
      });
      expect(tooLong.indexOf('word 5 is invalid') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0156
     * @tc.name      testRoomLogic0057
     * @tc.desc      典型六词 Pronto 码解析为 RAW 协议码：频率为 38740 赫兹、重复一次、编号带 pronto 前缀。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 015C 00AA');
      expect(code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.frequencyHz).assertEqual(38740);
      expect(code.repeatCount).assertEqual(1);
      expect(code.id.startsWith('pronto-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0157
     * @tc.name      testRoomLogic0058
     * @tc.desc      波形词按四舍五入换算成微秒序列 8983,4388，来源与授权信息固定为用户导入。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomLogic0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoomLogic0058';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 015C 00AA');
      expect(code.payload).assertEqual('8983,4388');
      expect(code.source).assertEqual('Pronto HEX');
      expect(code.license).assertEqual('User import');
      expect(code.frequencyHz).assertEqual(38740);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ROOM_0158
     * @tc.name      testRoomLogic0059
     * @tc.desc      JSON 字符串数组形式的 Pronto 码与空格分隔文本解析结果一致，数组含非字符串元素时按位置报错。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomLogic0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoomLogic0059';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const spaced: IrCode = IrLibraryImporter.parseProntoHex('0000 006B 0001 0002 015C 00AA');
      const arrayText: string = '["0000","006B","0001","0002","015C","00AA"]';
      const fromArray: IrCode = IrLibraryImporter.parseProntoHex(arrayText);
      expect(fromArray.frequencyHz).assertEqual(spaced.frequencyHz);
      expect(fromArray.payload).assertEqual(spaced.payload);
      expect(fromArray.payload).assertEqual('8983,4388');
      const notString: string = captureMessage(() => {
        IrLibraryImporter.parseProntoHex('["0000",6107,"0001","0002","015C","00AA"]');
      });
      expect(notString.indexOf('item 2 is not a string') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

  });
}
