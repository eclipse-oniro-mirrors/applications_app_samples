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
} from '../model/RoomTypes';

/** FNV-1a 32-bit offset basis used by the checksum. */
const FNV_OFFSET_BASIS: number = 0x811C9DC5;
/** FNV-1a 32-bit prime multiplier used by the checksum. */
const FNV_PRIME: number = 0x01000193;
/** Array field names that must exist inside a config package. */
const ARRAY_FIELDS: string[] = [
  'rooms', 'devices', 'keys', 'irCodes', 'remoteTemplates',
  'scenes', 'sceneSteps', 'expectedStates'
];

/** Container of all rows exported or imported by one configuration package. */
export class ConfigPackageData {
  formatVersion: number = 0;
  exportedAt: number = 0;
  sourceMode: string = '';
  rooms: Room[] = [];
  devices: Device[] = [];
  keys: RoomKey[] = [];
  irCodes: IrCode[] = [];
  remoteTemplates: RemoteTemplate[] = [];
  scenes: Scene[] = [];
  sceneSteps: SceneStep[] = [];
  expectedStates: DeviceExpectedState[] = [];
  checksum: string = '';
}

/**
 * Schema helpers for configuration packages: building, validating (version,
 * required arrays, referential integrity, checksum) and parsing typed rows.
 */
export class ConfigPackageSchema {
  /** Builds a package from typed lists and stamps version and checksum. */
  static build(rooms: Room[], devices: Device[], keys: RoomKey[], irCodes: IrCode[],
    remoteTemplates: RemoteTemplate[], scenes: Scene[], sceneSteps: SceneStep[],
    expectedStates: DeviceExpectedState[],
    sourceMode: string, exportedAt: number): ConfigPackageData {
    const data: ConfigPackageData = new ConfigPackageData();
    data.formatVersion = AppConstants.CONFIG_PACKAGE_VERSION;
    data.exportedAt = exportedAt;
    data.sourceMode = sourceMode;
    data.rooms = rooms;
    data.devices = devices;
    data.keys = keys;
    data.irCodes = irCodes;
    data.remoteTemplates = remoteTemplates;
    data.scenes = scenes;
    data.sceneSteps = sceneSteps;
    data.expectedStates = expectedStates;
    data.checksum = ConfigPackageSchema.checksum(data);
    return data;
  }

  /** Returns validation errors; an empty array means the package is usable. */
  static validateRecord(raw: Record<string, Object>): string[] {
    const errors: string[] = [];
    const version: Object = raw['formatVersion'];
    if (typeof version !== 'number') {
      errors.push('Missing formatVersion field');
    } else if (version !== AppConstants.CONFIG_PACKAGE_VERSION) {
      errors.push(`Incompatible config package version: ${version} (expected ${AppConstants.CONFIG_PACKAGE_VERSION})`);
    }

    let arraysOk: boolean = true;
    for (let i = 0; i < ARRAY_FIELDS.length; i++) {
      if (!(raw[ARRAY_FIELDS[i]] instanceof Array)) {
        errors.push(`Missing array: ${ARRAY_FIELDS[i]}`);
        arraysOk = false;
      }
    }
    if (!arraysOk) {
      return errors;
    }

    const data: ConfigPackageData = ConfigPackageSchema.read(raw);
    const roomIds: string[] = [];
    for (let i = 0; i < data.rooms.length; i++) {
      roomIds.push(data.rooms[i].id);
    }
    const deviceIds: string[] = [];
    for (let i = 0; i < data.devices.length; i++) {
      const device: Device = data.devices[i];
      deviceIds.push(device.id);
      if (roomIds.indexOf(device.roomId) < 0) {
        errors.push(`Device ${device.id} references missing room ${device.roomId}`);
      }
    }
    const codeIds: string[] = [];
    for (let i = 0; i < data.irCodes.length; i++) {
      codeIds.push(data.irCodes[i].id);
    }
    for (let i = 0; i < data.keys.length; i++) {
      const key: RoomKey = data.keys[i];
      if (deviceIds.indexOf(key.deviceId) < 0) {
        errors.push(`Key ${key.id} references missing device ${key.deviceId}`);
      }
      // An empty irCodeId means the key has no IR code yet and is allowed.
      if (key.irCodeId.length > 0 && codeIds.indexOf(key.irCodeId) < 0) {
        errors.push(`Key ${key.id} references missing IR code ${key.irCodeId}`);
      }
    }
    const sceneIds: string[] = [];
    for (let i = 0; i < data.scenes.length; i++) {
      sceneIds.push(data.scenes[i].id);
    }
    for (let i = 0; i < data.sceneSteps.length; i++) {
      const step: SceneStep = data.sceneSteps[i];
      if (sceneIds.indexOf(step.sceneId) < 0) {
        errors.push(`Scene step ${step.id} references missing scene ${step.sceneId}`);
      }
      if (deviceIds.indexOf(step.deviceId) < 0) {
        errors.push(`Scene step ${step.id} references missing device ${step.deviceId}`);
      }
      if (!ConfigPackageSchema.containsKey(data.keys, step.keyId)) {
        errors.push(`Scene step ${step.id} references missing key ${step.keyId}`);
      }
    }

    const expected: string = ConfigPackageSchema.checksum(data);
    const actual: string =
      ConfigPackageSchema.readString(raw, 'checksum', '');
    if (expected !== actual) {
      errors.push('Config package checksum mismatch');
    }
    return errors;
  }

  /** Parses a raw package into typed rows; assumes validateRecord passed. */
  static parse(raw: Record<string, Object>): ConfigPackageData {
    const data: ConfigPackageData = ConfigPackageSchema.read(raw);
    data.checksum = ConfigPackageSchema.readString(raw, 'checksum', '');
    return data;
  }

  /** FNV-1a 32-bit checksum over every field except checksum. */
  static checksum(data: ConfigPackageData): string {
    const text: string = ConfigPackageSchema.canonicalText(data);
    let hash: number = FNV_OFFSET_BASIS;
    for (let i = 0; i < text.length; i++) {
      hash = hash ^ text.charCodeAt(i);
      hash = Math.imul(hash, FNV_PRIME);
    }
    let hex: string = (hash >>> 0).toString(16);
    while (hex.length < 8) {
      hex = `0${hex}`;
    }
    return hex;
  }

  /** Serializes a package to a JSON string for file export. */
  static toJson(data: ConfigPackageData): string {
    return JSON.stringify(data);
  }

  /** Parses a JSON string into a validated package; throws on any problem. */
  static fromJson(text: string): ConfigPackageData {
    let raw: Record<string, Object> | undefined = undefined;
    try {
      raw = JSON.parse(text) as Record<string, Object>;
    } catch (error) {
      throw new Error('Failed to parse config package JSON');
    }
    if (raw === undefined) {
      throw new Error('Failed to parse config package JSON');
    }
    const errors: string[] = ConfigPackageSchema.validateRecord(raw);
    if (errors.length > 0) {
      throw new Error(errors[0]);
    }
    return ConfigPackageSchema.parse(raw);
  }

  /**
   * Canonical text fed into the checksum. Field order and separators are
   * part of the contract; changing them invalidates old packages.
   */
  private static canonicalText(data: ConfigPackageData): string {
    const parts: string[] = [
      `${data.formatVersion}`,
      `${data.exportedAt}`,
      `${data.sourceMode}`,
      JSON.stringify(data.rooms),
      JSON.stringify(data.devices),
      JSON.stringify(data.keys),
      JSON.stringify(data.irCodes),
      JSON.stringify(data.remoteTemplates),
      JSON.stringify(data.scenes),
      JSON.stringify(data.sceneSteps),
      JSON.stringify(data.expectedStates)
    ];
    return parts.join('|');
  }

  /** Linear key-id lookup used by validation. */
  private static containsKey(keys: RoomKey[], keyId: string): boolean {
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].id === keyId) {
        return true;
      }
    }
    return false;
  }

  /** Copies every typed list of the raw package into a typed instance. */
  private static read(raw: Record<string, Object>): ConfigPackageData {
    const data: ConfigPackageData = new ConfigPackageData();
    data.formatVersion = ConfigPackageSchema.readNumber(raw, 'formatVersion',
      AppConstants.CONFIG_PACKAGE_VERSION);
    data.exportedAt = ConfigPackageSchema.readNumber(raw, 'exportedAt', 0);
    data.sourceMode = ConfigPackageSchema.readString(raw, 'sourceMode', '');
    data.rooms = ConfigPackageSchema.readRooms(raw['rooms']);
    data.devices = ConfigPackageSchema.readDevices(raw['devices']);
    data.keys = ConfigPackageSchema.readKeys(raw['keys']);
    data.irCodes = ConfigPackageSchema.readCodes(raw['irCodes']);
    data.remoteTemplates = ConfigPackageSchema.readTemplates(raw['remoteTemplates']);
    data.scenes = ConfigPackageSchema.readScenes(raw['scenes']);
    data.sceneSteps = ConfigPackageSchema.readSceneSteps(raw['sceneSteps']);
    data.expectedStates = ConfigPackageSchema.readExpectedStates(raw['expectedStates']);
    return data;
  }

  /** Parses the rooms array into Room instances. */
  private static readRooms(value: Object): Room[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const rooms: Room[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const room: Room = new Room();
      room.id = ConfigPackageSchema.readString(item, 'id', '');
      room.name = ConfigPackageSchema.readString(item, 'name', '');
      room.note = ConfigPackageSchema.readString(item, 'note', '');
      room.sortOrder = ConfigPackageSchema.readNumber(item, 'sortOrder', 0);
      room.createdAt = ConfigPackageSchema.readNumber(item, 'createdAt', 0);
      room.updatedAt = ConfigPackageSchema.readNumber(item, 'updatedAt', 0);
      rooms.push(room);
    }
    return rooms;
  }

  /** Parses the devices array into Device instances. */
  private static readDevices(value: Object): Device[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const devices: Device[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const device: Device = new Device();
      device.id = ConfigPackageSchema.readString(item, 'id', '');
      device.roomId = ConfigPackageSchema.readString(item, 'roomId', '');
      device.name = ConfigPackageSchema.readString(item, 'name', '');
      device.type = ConfigPackageSchema.readString(item, 'type',
        'PROJECTOR') as DeviceType;
      device.templateId = ConfigPackageSchema.readString(item, 'templateId', '');
      device.brand = ConfigPackageSchema.readString(item, 'brand', '');
      device.model = ConfigPackageSchema.readString(item, 'model', '');
      device.sortOrder = ConfigPackageSchema.readNumber(item, 'sortOrder', 0);
      device.createdAt = ConfigPackageSchema.readNumber(item, 'createdAt', 0);
      device.updatedAt = ConfigPackageSchema.readNumber(item, 'updatedAt', 0);
      devices.push(device);
    }
    return devices;
  }

  /** Parses the keys array into RoomKey instances. */
  private static readKeys(value: Object): RoomKey[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const keys: RoomKey[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const key: RoomKey = new RoomKey();
      key.id = ConfigPackageSchema.readString(item, 'id', '');
      key.deviceId = ConfigPackageSchema.readString(item, 'deviceId', '');
      key.semantic = ConfigPackageSchema.readString(item, 'semantic',
        'POWER_ON') as KeySemantic;
      key.label = ConfigPackageSchema.readString(item, 'label', '');
      key.irCodeId = ConfigPackageSchema.readString(item, 'irCodeId', '');
      key.sortOrder = ConfigPackageSchema.readNumber(item, 'sortOrder', 0);
      keys.push(key);
    }
    return keys;
  }

  /** Parses the irCodes array into IrCode instances. */
  private static readCodes(value: Object): IrCode[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const codes: IrCode[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const code: IrCode = new IrCode();
      code.id = ConfigPackageSchema.readString(item, 'id', '');
      code.protocol = ConfigPackageSchema.readString(item, 'protocol',
        'RAW') as IrProtocol;
      code.frequencyHz = ConfigPackageSchema.readNumber(item, 'frequencyHz',
        AppConstants.DEFAULT_FREQUENCY_HZ);
      code.payload = ConfigPackageSchema.readString(item, 'payload', '');
      code.repeatCount = ConfigPackageSchema.readNumber(item, 'repeatCount', 1);
      code.source = ConfigPackageSchema.readString(item, 'source', '');
      code.license = ConfigPackageSchema.readString(item, 'license', '');
      code.brand = ConfigPackageSchema.readString(item, 'brand', '');
      code.model = ConfigPackageSchema.readString(item, 'model', '');
      code.keySemantic = ConfigPackageSchema.readString(item, 'keySemantic', '');
      code.checksum = ConfigPackageSchema.readString(item, 'checksum', '');
      codes.push(code);
    }
    return codes;
  }

  /** Parses the remoteTemplates array into RemoteTemplate instances. */
  private static readTemplates(value: Object): RemoteTemplate[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const templates: RemoteTemplate[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const template: RemoteTemplate = new RemoteTemplate();
      template.id = ConfigPackageSchema.readString(item, 'id', '');
      template.deviceType = ConfigPackageSchema.readString(item, 'deviceType',
        'PROJECTOR') as DeviceType;
      template.name = ConfigPackageSchema.readString(item, 'name', '');
      template.layout = ConfigPackageSchema.readString(item, 'layout', '');
      template.builtin = ConfigPackageSchema.readBoolean(item, 'builtin', false);
      templates.push(template);
    }
    return templates;
  }

  /** Parses the scenes array into Scene instances. */
  private static readScenes(value: Object): Scene[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const scenes: Scene[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const scene: Scene = new Scene();
      scene.id = ConfigPackageSchema.readString(item, 'id', '');
      scene.roomId = ConfigPackageSchema.readString(item, 'roomId', '');
      scene.name = ConfigPackageSchema.readString(item, 'name', '');
      scene.icon = ConfigPackageSchema.readString(item, 'icon', '');
      scene.sortOrder = ConfigPackageSchema.readNumber(item, 'sortOrder', 0);
      scenes.push(scene);
    }
    return scenes;
  }

  /** Parses the sceneSteps array into SceneStep instances. */
  private static readSceneSteps(value: Object): SceneStep[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const steps: SceneStep[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const step: SceneStep = new SceneStep();
      step.id = ConfigPackageSchema.readString(item, 'id', '');
      step.sceneId = ConfigPackageSchema.readString(item, 'sceneId', '');
      step.deviceId = ConfigPackageSchema.readString(item, 'deviceId', '');
      step.keyId = ConfigPackageSchema.readString(item, 'keyId', '');
      step.delayMs = ConfigPackageSchema.readNumber(item, 'delayMs', 250);
      step.order = ConfigPackageSchema.readNumber(item, 'order', 0);
      step.enabled = ConfigPackageSchema.readBoolean(item, 'enabled', true);
      steps.push(step);
    }
    return steps;
  }

  /** Parses the expectedStates array into DeviceExpectedState instances. */
  private static readExpectedStates(value: Object): DeviceExpectedState[] {
    const items: Object[] = ConfigPackageSchema.toObjectList(value);
    const states: DeviceExpectedState[] = [];
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = ConfigPackageSchema.recordOf(items[i]);
      const state: DeviceExpectedState = new DeviceExpectedState();
      state.deviceId = ConfigPackageSchema.readString(item, 'deviceId', '');
      state.power = ConfigPackageSchema.readString(item, 'power',
        'UNKNOWN') as PowerState;
      state.level = ConfigPackageSchema.readNumber(item, 'level', -1);
      state.source = ConfigPackageSchema.readString(item, 'source',
        'SCENE') as StateSource;
      state.updatedAt = ConfigPackageSchema.readNumber(item, 'updatedAt', 0);
      states.push(state);
    }
    return states;
  }

  /** Converts a JSON value to an object array; non-arrays become empty. */
  private static toObjectList(value: Object): Object[] {
    if (value instanceof Array) {
      return value as Object[];
    }
    return [];
  }

  /** Narrows an untyped item into a record; non-objects become empty. */
  private static recordOf(item: Object): Record<string, Object> {
    if (item !== null && typeof item === 'object') {
      return item as Record<string, Object>;
    }
    return {};
  }

  /** Reads a string field with fallback when the value is not a string. */
  private static readString(record: Record<string, Object>, key: string,
    fallback: string): string {
    const value: Object = record[key];
    if (typeof value === 'string') {
      return value;
    }
    return fallback;
  }

  /** Reads a number field with fallback for missing or non-finite values. */
  private static readNumber(record: Record<string, Object>, key: string,
    fallback: number): number {
    const value: Object = record[key];
    if (typeof value === 'number' && Number.isFinite(value)) {
      return value;
    }
    return fallback;
  }

  /** Reads a boolean field with fallback when the value is not a boolean. */
  private static readBoolean(record: Record<string, Object>, key: string,
    fallback: boolean): boolean {
    const value: Object = record[key];
    if (typeof value === 'boolean') {
      return value;
    }
    return fallback;
  }
}
