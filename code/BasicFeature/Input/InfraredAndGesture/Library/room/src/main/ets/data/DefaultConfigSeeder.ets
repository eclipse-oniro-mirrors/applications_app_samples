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

import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger, StringResources } from 'common';
import { IrCode, IrProtocol } from 'ircore';
import {
  Device,
  DeviceExpectedState,
  DeviceType,
  getKeySemanticLabel,
  KeySemantic,
  PowerState,
  RemoteTemplate,
  Room,
  RoomKey,
  Scene,
  SceneStep,
  StateSource
} from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';
import { RoomDao } from './RoomDao';
import { DeviceDao } from './DeviceDao';
import { KeyDao } from './KeyDao';
import { IrCodeDao } from './IrCodeDao';
import { RemoteTemplateDao } from './RemoteTemplateDao';
import { SceneDao } from './SceneDao';
import { SceneStepDao } from './SceneStepDao';
import { ExpectedStateDao } from './ExpectedStateDao';

const SCOPE: string = 'DefaultConfigSeeder';
const CONFIG_FILE: string = 'default-config.json';
/** hiTraceMeter span name for the one-time default configuration seed. */
const CONFIG_SEED_TRACE_NAME: string = 'MeetingScene.ConfigSeed';
/** Independent hiTraceMeter task id so the seed span is easy to filter. */
const CONFIG_SEED_TRACE_TASK_ID: number = 4606;
/** Repeat count assigned to IR codes that ship without an explicit value. */
const DEFAULT_REPEAT_COUNT: number = 1;

/**
 * Seeds the database with the bundled default-config.json on first launch
 * and refreshes localized demo names when the app language changes.
 */
export class DefaultConfigSeeder {
  /**
   * Imports the demo configuration once, when the database has no rooms yet.
   * Every insert runs inside one transaction that is rolled back completely
   * on the first failure.
   *
   * @returns true when the seed ran, false when the database was not empty
   */
  static async seedIfEmpty(): Promise<boolean> {
    const roomCount: number = await RoomDao.count();
    if (roomCount > 0) {
      AppLogger.info(SCOPE, `seed skipped: database already has ${roomCount} rooms`);
      return false;
    }

    AppLogger.info(SCOPE, `seed enter: importing ${CONFIG_FILE}`);
    hiTraceMeter.startTrace(CONFIG_SEED_TRACE_NAME, CONFIG_SEED_TRACE_TASK_ID); // Open the MeetingScene.ConfigSeed span for the whole import.
    try {
      const context: common.Context = AppDatabase.getContext();
      const bytes: Uint8Array = await context.resourceManager.getRawFileContent(CONFIG_FILE);
      const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      const root: Record<string, Object> = JSON.parse(text) as Record<string, Object>;

      const rooms: Room[] = DefaultConfigSeeder.buildRooms(root);
      const templates: RemoteTemplate[] = DefaultConfigSeeder.buildTemplates(root);
      const codes: IrCode[] = DefaultConfigSeeder.buildCodes(root);
      const devices: Device[] = DefaultConfigSeeder.buildDevices(root);
      const keys: RoomKey[] = DefaultConfigSeeder.buildKeys(root);
      const scenes: Scene[] = DefaultConfigSeeder.buildScenes(root);
      const steps: SceneStep[] = DefaultConfigSeeder.buildSceneSteps(root);
      const states: DeviceExpectedState[] = DefaultConfigSeeder.buildExpectedStates(root);

      AppDatabase.beginTransaction();
      try {
        for (let i = 0; i < rooms.length; i++) {
          await RoomDao.insert(rooms[i]);
        }
        for (let i = 0; i < templates.length; i++) {
          await RemoteTemplateDao.insert(templates[i]);
        }
        await IrCodeDao.insertMany(codes);
        for (let i = 0; i < devices.length; i++) {
          await DeviceDao.insert(devices[i]);
        }
        for (let i = 0; i < keys.length; i++) {
          await KeyDao.insert(keys[i]);
        }
        for (let i = 0; i < scenes.length; i++) {
          await SceneDao.insert(scenes[i]);
        }
        for (let i = 0; i < steps.length; i++) {
          await SceneStepDao.insert(steps[i]);
        }
        for (let i = 0; i < states.length; i++) {
          await ExpectedStateDao.upsert(states[i]);
        }
        AppDatabase.commit();
      } catch (error) {
        AppDatabase.rollBack();
        const detail: string = error instanceof Error ? error.message : 'Failed to import default configuration';
        AppLogger.error(SCOPE, `seed rolled back: ${detail}`);
        throw new Error(detail);
      }
      AppLogger.info(SCOPE,
        `seed success: rooms=${rooms.length}, devices=${devices.length}, keys=${keys.length}, scenes=${scenes.length}`);
      AppLogger.info(SCOPE,
        `seed success: steps=${steps.length}, codes=${codes.length}, expectedStates=${states.length}`);
      return true;
    } finally {
      hiTraceMeter.finishTrace(CONFIG_SEED_TRACE_NAME, CONFIG_SEED_TRACE_TASK_ID);
    }
  }

  /**
   * Demo rows are inserted only once, so an earlier English seed would keep
   * English names after the locale changes. Rename those rows to the current
   * locale; rows already renamed by the user keep their custom text.
   */
  static async refreshDemoNames(): Promise<void> {
    AppLogger.info(SCOPE, 'refreshDemoNames enter');
    const context: common.Context = AppDatabase.getContext();
    const bytes: Uint8Array = await context.resourceManager.getRawFileContent(CONFIG_FILE);
    const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
    const root: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    let updated: number = 0;

    const roomItems: Object[] = DefaultConfigSeeder.toObjectList(root['rooms']);
    for (let i = 0; i < roomItems.length; i++) {
      const item: Record<string, Object> = roomItems[i] as Record<string, Object>;
      const id: string = DefaultConfigSeeder.readString(item, 'id', '');
      const room: Room | undefined = await RoomDao.get(id);
      if (room === undefined) {
        continue;
      }
      const rawName: string = DefaultConfigSeeder.readString(item, 'name', '');
      if (room.name !== rawName) {
        continue;
      }
      const name: string = DefaultConfigSeeder.pick(
        DefaultConfigSeeder.demoNameResource(id), rawName);
      const rawNote: string = DefaultConfigSeeder.readString(item, 'note', '');
      const note: string = DefaultConfigSeeder.pick(
        DefaultConfigSeeder.demoNoteResource(id), rawNote);
      if (name === room.name && note === room.note) {
        continue;
      }
      room.name = name;
      room.note = note;
      await RoomDao.update(room);
      updated++;
    }

    const deviceItems: Object[] = DefaultConfigSeeder.toObjectList(root['devices']);
    for (let i = 0; i < deviceItems.length; i++) {
      const item: Record<string, Object> = deviceItems[i] as Record<string, Object>;
      const id: string = DefaultConfigSeeder.readString(item, 'id', '');
      const device: Device | undefined = await DeviceDao.get(id);
      if (device === undefined) {
        continue;
      }
      const rawName: string = DefaultConfigSeeder.readString(item, 'name', '');
      if (device.name !== rawName) {
        continue;
      }
      const name: string = DefaultConfigSeeder.pick(
        DefaultConfigSeeder.demoNameResource(id), rawName);
      if (name === device.name) {
        continue;
      }
      device.name = name;
      await DeviceDao.update(device);
      updated++;
    }

    const sceneItems: Object[] = DefaultConfigSeeder.toObjectList(root['scenes']);
    for (let i = 0; i < sceneItems.length; i++) {
      const item: Record<string, Object> = sceneItems[i] as Record<string, Object>;
      const id: string = DefaultConfigSeeder.readString(item, 'id', '');
      const scene: Scene | undefined = await SceneDao.get(id);
      if (scene === undefined) {
        continue;
      }
      const rawName: string = DefaultConfigSeeder.readString(item, 'name', '');
      if (scene.name !== rawName) {
        continue;
      }
      const name: string = DefaultConfigSeeder.pick(
        DefaultConfigSeeder.demoNameResource(id), rawName);
      if (name === scene.name) {
        continue;
      }
      scene.name = name;
      await SceneDao.update(scene);
      updated++;
    }

    const keyItems: Object[] = DefaultConfigSeeder.toObjectList(root['keys']);
    for (let i = 0; i < keyItems.length; i++) {
      const item: Record<string, Object> = keyItems[i] as Record<string, Object>;
      const id: string = DefaultConfigSeeder.readString(item, 'id', '');
      const key: RoomKey | undefined = await KeyDao.get(id);
      if (key === undefined) {
        continue;
      }
      const rawLabel: string = DefaultConfigSeeder.readString(item, 'label', '');
      if (key.label !== rawLabel) {
        continue;
      }
      const label: string = getKeySemanticLabel(key.semantic);
      if (label === key.label) {
        continue;
      }
      key.label = label;
      await KeyDao.update(key);
      updated++;
    }

    if (updated > 0) {
      AppLogger.info(SCOPE, `refreshDemoNames done: rows updated=${updated}`);
    } else {
      AppLogger.info(SCOPE, 'refreshDemoNames done: nothing to update');
    }
  }

  /** Builds Room instances from the rooms array of the seed file. */
  private static buildRooms(root: Record<string, Object>): Room[] {
    const rooms: Room[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['rooms']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const room: Room = new Room();
      room.id = DefaultConfigSeeder.readString(item, 'id', '');
      room.name = DefaultConfigSeeder.readString(item, 'name', '');
      room.name = DefaultConfigSeeder.pick(DefaultConfigSeeder.demoNameResource(room.id), room.name);
      room.note = DefaultConfigSeeder.readString(item, 'note', '');
      room.note = DefaultConfigSeeder.pick(DefaultConfigSeeder.demoNoteResource(room.id), room.note);
      room.sortOrder = DefaultConfigSeeder.readNumber(item, 'sortOrder', 0);
      room.createdAt = DefaultConfigSeeder.readNumber(item, 'createdAt', 0);
      room.updatedAt = DefaultConfigSeeder.readNumber(item, 'updatedAt', 0);
      rooms.push(room);
    }
    return rooms;
  }

  /** Builds RemoteTemplate instances from the remoteTemplates array. */
  private static buildTemplates(root: Record<string, Object>): RemoteTemplate[] {
    const templates: RemoteTemplate[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['remoteTemplates']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const template: RemoteTemplate = new RemoteTemplate();
      template.id = DefaultConfigSeeder.readString(item, 'id', '');
      template.deviceType =
        DefaultConfigSeeder.readString(item, 'deviceType', '') as DeviceType;
      template.name = DefaultConfigSeeder.readString(item, 'name', '');
      template.layout = DefaultConfigSeeder.readString(item, 'layout', '');
      template.builtin = DefaultConfigSeeder.readBoolean(item, 'builtin', false);
      templates.push(template);
    }
    return templates;
  }

  /** Builds IrCode instances from the codes array of the seed file. */
  private static buildCodes(root: Record<string, Object>): IrCode[] {
    const codes: IrCode[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['codes']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const code: IrCode = new IrCode();
      code.id = DefaultConfigSeeder.readString(item, 'id', '');
      code.protocol = DefaultConfigSeeder.readString(item, 'protocol', '') as IrProtocol;
      code.frequencyHz = DefaultConfigSeeder.readNumber(item, 'frequencyHz',
        AppConstants.DEFAULT_FREQUENCY_HZ);
      code.payload = DefaultConfigSeeder.readString(item, 'payload', '');
      code.repeatCount = DefaultConfigSeeder.readNumber(item, 'repeatCount', DEFAULT_REPEAT_COUNT);
      code.source = DefaultConfigSeeder.readString(item, 'source', '');
      code.license = DefaultConfigSeeder.readString(item, 'license', '');
      code.brand = DefaultConfigSeeder.readString(item, 'brand', '');
      code.model = DefaultConfigSeeder.readString(item, 'model', '');
      code.keySemantic = DefaultConfigSeeder.readString(item, 'keySemantic', '');
      code.checksum = DefaultConfigSeeder.readString(item, 'checksum', '');
      codes.push(code);
    }
    return codes;
  }

  /** Builds Device instances from the devices array of the seed file. */
  private static buildDevices(root: Record<string, Object>): Device[] {
    const devices: Device[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['devices']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const device: Device = new Device();
      device.id = DefaultConfigSeeder.readString(item, 'id', '');
      device.roomId = DefaultConfigSeeder.readString(item, 'roomId', '');
      device.name = DefaultConfigSeeder.readString(item, 'name', '');
      device.name = DefaultConfigSeeder.pick(DefaultConfigSeeder.demoNameResource(device.id), device.name);
      device.type = DefaultConfigSeeder.readString(item, 'type', '') as DeviceType;
      device.templateId = DefaultConfigSeeder.readString(item, 'templateId', '');
      device.brand = DefaultConfigSeeder.readString(item, 'brand', '');
      device.model = DefaultConfigSeeder.readString(item, 'model', '');
      device.sortOrder = DefaultConfigSeeder.readNumber(item, 'sortOrder', 0);
      device.createdAt = DefaultConfigSeeder.readNumber(item, 'createdAt', 0);
      device.updatedAt = DefaultConfigSeeder.readNumber(item, 'updatedAt', 0);
      devices.push(device);
    }
    return devices;
  }

  /** Builds RoomKey instances from the keys array of the seed file. */
  private static buildKeys(root: Record<string, Object>): RoomKey[] {
    const keys: RoomKey[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['keys']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const key: RoomKey = new RoomKey();
      key.id = DefaultConfigSeeder.readString(item, 'id', '');
      key.deviceId = DefaultConfigSeeder.readString(item, 'deviceId', '');
      key.semantic = DefaultConfigSeeder.readString(item, 'semantic', '') as KeySemantic;
      key.label = getKeySemanticLabel(key.semantic);
      key.irCodeId = DefaultConfigSeeder.readString(item, 'irCodeId', '');
      key.sortOrder = DefaultConfigSeeder.readNumber(item, 'sortOrder', 0);
      keys.push(key);
    }
    return keys;
  }

  /** Builds Scene instances from the scenes array of the seed file. */
  private static buildScenes(root: Record<string, Object>): Scene[] {
    const scenes: Scene[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['scenes']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const scene: Scene = new Scene();
      scene.id = DefaultConfigSeeder.readString(item, 'id', '');
      scene.roomId = DefaultConfigSeeder.readString(item, 'roomId', '');
      scene.name = DefaultConfigSeeder.readString(item, 'name', '');
      scene.name = DefaultConfigSeeder.pick(DefaultConfigSeeder.demoNameResource(scene.id), scene.name);
      scene.icon = DefaultConfigSeeder.readString(item, 'icon', '');
      scene.sortOrder = DefaultConfigSeeder.readNumber(item, 'sortOrder', 0);
      scenes.push(scene);
    }
    return scenes;
  }

  /** Builds SceneStep instances from the sceneSteps array of the seed file. */
  private static buildSceneSteps(root: Record<string, Object>): SceneStep[] {
    const steps: SceneStep[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['sceneSteps']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const step: SceneStep = new SceneStep();
      step.id = DefaultConfigSeeder.readString(item, 'id', '');
      step.sceneId = DefaultConfigSeeder.readString(item, 'sceneId', '');
      step.deviceId = DefaultConfigSeeder.readString(item, 'deviceId', '');
      step.keyId = DefaultConfigSeeder.readString(item, 'keyId', '');
      step.delayMs = DefaultConfigSeeder.readNumber(item, 'delayMs',
        AppConstants.STEP_INTERVAL_MS);
      step.order = DefaultConfigSeeder.readNumber(item, 'order', 0);
      step.enabled = DefaultConfigSeeder.readBoolean(item, 'enabled', true);
      steps.push(step);
    }
    return steps;
  }

  /** Builds DeviceExpectedState instances from the expectedStates array. */
  private static buildExpectedStates(root: Record<string, Object>): DeviceExpectedState[] {
    const states: DeviceExpectedState[] = [];
    const items: Object[] = DefaultConfigSeeder.toObjectList(root['expectedStates']);
    for (let i = 0; i < items.length; i++) {
      const item: Record<string, Object> = items[i] as Record<string, Object>;
      const state: DeviceExpectedState = new DeviceExpectedState();
      state.deviceId = DefaultConfigSeeder.readString(item, 'deviceId', '');
      state.power = DefaultConfigSeeder.readString(item, 'power', 'UNKNOWN') as PowerState;
      state.level = DefaultConfigSeeder.readNumber(item, 'level', -1);
      state.source = DefaultConfigSeeder.readString(item, 'source', 'SCENE') as StateSource;
      state.updatedAt = DefaultConfigSeeder.readNumber(item, 'updatedAt', 0);
      states.push(state);
    }
    return states;
  }

  /** Resolves a localized demo string with a non-empty English fallback. */
  private static pick(resource: Resource | undefined, fallback: string): string {
    if (resource === undefined) {
      return fallback;
    }
    const text: string = StringResources.get(resource);
    return text.length > 0 ? text : fallback;
  }

  /** Resolves a demo name resource; undefined means the row has no demo name. */
  private static demoNameResource(id: string): Resource | undefined {
    switch (id) {
      case 'room-default':
        return $r('app.string.demo_room_name');
      case 'dev-projector':
        return $r('app.string.demo_device_projector');
      case 'dev-screen':
        return $r('app.string.demo_device_screen');
      case 'dev-light':
        return $r('app.string.demo_device_light');
      case 'dev-ac':
        return $r('app.string.demo_device_ac');
      case 'scene-meeting':
        return $r('app.string.demo_scene_meeting');
      default:
        return undefined;
    }
  }

  /** Resolves a demo note resource; only the default room has one. */
  private static demoNoteResource(id: string): Resource | undefined {
    return id === 'room-default' ? $r('app.string.demo_room_note') : undefined;
  }

  /** Converts a JSON value to an object array; non-arrays become empty. */
  private static toObjectList(value: Object): Object[] {
    if (value instanceof Array) {
      return value as Object[];
    }
    return [];
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
