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

import { util } from '@kit.ArkTS';
import { AppLogger, StringResources } from 'common';
import { IrBrandEntry, IrCode, IrLibraryIndex, IrLibraryRepository } from 'ircore';
import {
  Device,
  DeviceDao,
  DeviceType,
  getKeySemanticLabel,
  IrCodeDao,
  KeyDao,
  KeySemantic,
  RemoteTemplate,
  RemoteTemplateDao,
  RemoteTemplateSeeder,
  Room,
  RoomDao,
  RoomKey,
  Scene,
  SceneDao
} from 'room';

const SCOPE: string = 'OrchestrationViewModel';

/** Device types selectable when adding a device in the orchestration editor. */
export const DEVICE_TYPES: DeviceType[] = [
  DeviceType.PROJECTOR,
  DeviceType.SCREEN,
  DeviceType.LIGHT,
  DeviceType.AC,
  DeviceType.TV,
  DeviceType.AUDIO
];

/** Key semantics available when binding an infrared code to a room key. */
export const KEY_SEMANTICS: KeySemantic[] = [
  KeySemantic.POWER_ON,
  KeySemantic.POWER_OFF,
  KeySemantic.POWER_TOGGLE,
  KeySemantic.HDMI_1,
  KeySemantic.HDMI_2,
  KeySemantic.VOL_UP,
  KeySemantic.VOL_DOWN,
  KeySemantic.TEMP_UP,
  KeySemantic.TEMP_DOWN,
  KeySemantic.FAN_SPEED,
  KeySemantic.SCREEN_UP,
  KeySemantic.SCREEN_DOWN
];

/** Display summary of one room with device/scene counts for the home list. */
@ObservedV2
export class RoomSummary {
  @Trace public room: Room = new Room();
  @Trace public deviceCount: number = 0;
  @Trace public sceneCount: number = 0;
}

/**
 * Orchestration state: manages room/device/key configuration and cannot emit infrared.
 */
@ObservedV2
export class OrchestrationViewModel {
  @Trace public rooms: RoomSummary[] = [];
  @Trace public roomId: string = '';
  @Trace public devices: Device[] = [];
  @Trace public scenes: Scene[] = [];
  @Trace public keys: RoomKey[] = [];
  @Trace public templates: RemoteTemplate[] = [];
  @Trace public brands: IrBrandEntry[] = [];
  @Trace public codes: IrCode[] = [];
  @Trace public selectedDeviceId: string = '';
  @Trace public statusText: string = '';

  /** Load all rooms with their device/scene counts and refresh the home list. */
  async loadRooms(): Promise<void> {
    AppLogger.info(SCOPE, 'loadRooms enter');
    await this.guard('Load room list', async (): Promise<void> => {
      const rooms: Room[] = await RoomDao.list();
      // Fetch all device lists and scene lists concurrently to avoid N+1 serial
      // database round trips; the resulting summaries are order-preserving.
      const deviceLists: Device[][] = await Promise.all(rooms.map((room: Room): Promise<Device[]> =>
        DeviceDao.listByRoom(room.id)));
      const sceneLists: Scene[][] = await Promise.all(rooms.map((room: Room): Promise<Scene[]> =>
        SceneDao.listByRoom(room.id)));
      const summaries: RoomSummary[] = [];
      for (let i = 0; i < rooms.length; i++) {
        const summary: RoomSummary = new RoomSummary();
        summary.room = rooms[i];
        summary.deviceCount = deviceLists[i].length;
        summary.sceneCount = sceneLists[i].length;
        summaries.push(summary);
      }
      this.rooms = summaries;
      AppLogger.info(SCOPE, `rooms loaded, count: ${summaries.length}`);
    });
  }

  /** Load one room's devices, scenes and templates, then reset the selection. */
  async loadRoom(roomId: string): Promise<void> {
    AppLogger.info(SCOPE, `loadRoom enter, roomId: ${roomId}`);
    this.roomId = roomId;
    this.selectedDeviceId = '';
    this.keys = [];
    await this.guard('Load room configuration', async (): Promise<void> => {
      this.devices = await DeviceDao.listByRoom(roomId);
      this.scenes = await SceneDao.listByRoom(roomId);
      this.templates = await RemoteTemplateDao.list();
      AppLogger.info(SCOPE, `room config loaded, devices: ${this.devices.length}, scenes: ${this.scenes.length}`);
    });
  }

  /** Load the IR brand index and preselect the first brand's code list. */
  async loadLibrary(): Promise<void> {
    AppLogger.info(SCOPE, 'loadLibrary enter');
    await this.guard('Load IR library', async (): Promise<void> => {
      const index: IrLibraryIndex = await IrLibraryRepository.getIndex();
      this.brands = index.brands;
      if (this.brands.length === 0) {
        this.codes = [];
        AppLogger.warn(SCOPE, 'IR library has no brands');
        return;
      }
      this.codes = await IrLibraryRepository.loadBrand(this.brands[0].brandId);
      AppLogger.info(SCOPE, `IR library loaded, brands: ${this.brands.length}, codes: ${this.codes.length}`);
    });
  }

  /** Switch the IR brand selector to the given index and reload its codes. */
  async selectBrand(brandIndex: number): Promise<void> {
    AppLogger.info(SCOPE, `selectBrand enter, brandIndex: ${brandIndex}`);
    if (brandIndex < 0 || brandIndex >= this.brands.length) {
      AppLogger.warn(SCOPE, `selectBrand out of range: ${brandIndex}`);
      return;
    }
    await this.guard('Load brand codes', async (): Promise<void> => {
      this.codes = await IrLibraryRepository.loadBrand(this.brands[brandIndex].brandId);
      AppLogger.info(SCOPE, `brand codes loaded, count: ${this.codes.length}`);
    });
  }

  /** Create a room with a generated UUID and refresh the home list. */
  async createRoom(name: string): Promise<boolean> {
    AppLogger.info(SCOPE, `createRoom enter, name: ${name}`);
    const ok: boolean = await this.guard('Create room', async (): Promise<void> => {
      const room: Room = new Room();
      room.id = util.generateRandomUUID(true);
      room.name = name;
      room.note = '';
      room.sortOrder = this.rooms.length;
      room.createdAt = Date.now();
      room.updatedAt = Date.now();
      await RoomDao.insert(room);
      this.statusText = StringResources.get($r('app.string.msg_room_created'));
      AppLogger.info(SCOPE, `room created, id: ${room.id}`);
    });
    await this.loadRooms();
    return ok;
  }

  /** Persist a room's editable fields and refresh the home list. */
  async saveRoom(room: Room, name: string, note: string): Promise<boolean> {
    AppLogger.info(SCOPE, `saveRoom enter, roomId: ${room.id}, name: ${name}`);
    const ok: boolean = await this.guard('Save room', async (): Promise<void> => {
      room.name = name;
      room.note = note;
      room.updatedAt = Date.now();
      await RoomDao.update(room);
      this.statusText = StringResources.get($r('app.string.msg_room_saved'));
      AppLogger.info(SCOPE, `room saved, id: ${room.id}`);
    });
    await this.loadRooms();
    return ok;
  }

  /** Remove a room and refresh the home list. */
  async removeRoom(roomId: string): Promise<boolean> {
    AppLogger.info(SCOPE, `removeRoom enter, roomId: ${roomId}`);
    const ok: boolean = await this.guard('Delete room', async (): Promise<void> => {
      await RoomDao.remove(roomId);
      this.statusText = StringResources.get($r('app.string.msg_room_deleted'));
      AppLogger.info(SCOPE, `room removed, id: ${roomId}`);
    });
    await this.loadRooms();
    return ok;
  }

  /** Add a device to the current room and reload its device list. */
  async addDevice(name: string, type: DeviceType): Promise<boolean> {
    AppLogger.info(SCOPE, `addDevice enter, name: ${name}, type: ${type}`);
    if (this.roomId.length === 0) {
      // No room is loaded yet; guide the user back to the room list.
      AppLogger.warn(SCOPE, 'addDevice ignored, no room selected');
      this.statusText = StringResources.get($r('app.string.msg_select_room_first'));
      return false;
    }
    return await this.guard('Add device', async (): Promise<void> => {
      const device: Device = new Device();
      device.id = util.generateRandomUUID(true);
      device.roomId = this.roomId;
      device.name = name;
      device.type = type;
      device.templateId = '';
      device.brand = '';
      device.model = '';
      device.sortOrder = this.devices.length;
      device.createdAt = Date.now();
      device.updatedAt = Date.now();
      await DeviceDao.insert(device);
      this.devices = await DeviceDao.listByRoom(this.roomId);
      this.statusText = StringResources.get($r('app.string.msg_device_added'));
      AppLogger.info(SCOPE, `device added, devices: ${this.devices.length}`);
    });
  }

  /** Update an existing device's editable fields and reload the device list. */
  async updateDevice(device: Device, name: string, type: DeviceType,
    brand: string, model: string): Promise<boolean> {
    AppLogger.info(SCOPE, 'updateDevice enter');
    return await this.guard('Save device', async (): Promise<void> => {
      device.name = name;
      device.type = type;
      device.brand = brand;
      device.model = model;
      device.updatedAt = Date.now();
      await DeviceDao.update(device);
      this.devices = await DeviceDao.listByRoom(this.roomId);
      this.statusText = StringResources.get($r('app.string.msg_device_saved'));
      AppLogger.info(SCOPE, 'device updated');
    });
  }

  /** Remove a device and its bound keys, then clear the selection panel. */
  async removeDevice(deviceId: string): Promise<boolean> {
    AppLogger.info(SCOPE, 'removeDevice enter');
    const ok: boolean = await this.guard('Delete device', async (): Promise<void> => {
      await DeviceDao.remove(deviceId);
      this.devices = await DeviceDao.listByRoom(this.roomId);
      this.selectedDeviceId = '';
      this.keys = [];
      this.statusText = StringResources.get($r('app.string.msg_device_deleted_with_keys'));
      AppLogger.info(SCOPE, 'device removed');
    });
    return ok;
  }

  /** Select a device and load its bound keys. */
  async selectDevice(deviceId: string): Promise<void> {
    AppLogger.info(SCOPE, 'selectDevice enter');
    this.selectedDeviceId = deviceId;
    this.keys = [];
    await this.guard('Load device keys', async (): Promise<void> => {
      this.keys = await KeyDao.listByDevice(deviceId);
      AppLogger.info(SCOPE, `device keys loaded, count: ${this.keys.length}`);
    });
  }

  /** Creates missing keys from the template and returns the number added. */
  async applyTemplate(templateId: string): Promise<number> {
    AppLogger.info(SCOPE, `applyTemplate enter, templateId: ${templateId}`);
    let created: number = 0;
    await this.guard('Apply remote template', async (): Promise<void> => {
      created = await RemoteTemplateSeeder.applyTemplate(this.selectedDeviceId, templateId);
      this.keys = await KeyDao.listByDevice(this.selectedDeviceId);
      this.statusText = StringResources.format($r('app.string.msg_template_keys_created'), created);
      AppLogger.info(SCOPE, `template applied, created: ${created}`);
    });
    return created;
  }

  /** Bind an IR code to a key semantic, updating an existing or new key row. */
  async bindKey(semantic: KeySemantic, code: IrCode): Promise<boolean> {
    AppLogger.info(SCOPE, `bindKey enter, semantic: ${semantic}, irCodeId: ${code.id}`);
    if (this.selectedDeviceId.length === 0) {
      // A key must always belong to a device; guide the user to select one first.
      AppLogger.warn(SCOPE, 'bindKey ignored, no device selected');
      this.statusText = StringResources.get($r('app.string.msg_select_device_first'));
      return false;
    }
    return await this.guard('Bind key', async (): Promise<void> => {
      await IrCodeDao.upsert(code);
      let existing: RoomKey | undefined = undefined;
      for (let i = 0; i < this.keys.length; i++) {
        if (this.keys[i].semantic === semantic) {
          existing = this.keys[i];
          break;
        }
      }
      if (existing !== undefined) {
        existing.irCodeId = code.id;
        existing.label = getKeySemanticLabel(semantic);
        await KeyDao.update(existing);
        this.statusText = StringResources.get($r('app.string.msg_key_rebound'));
      } else {
        const key: RoomKey = new RoomKey();
        key.id = util.generateRandomUUID(true);
        key.deviceId = this.selectedDeviceId;
        key.semantic = semantic;
        key.label = getKeySemanticLabel(semantic);
        key.irCodeId = code.id;
        key.sortOrder = this.keys.length;
        await KeyDao.insert(key);
        this.statusText = StringResources.get($r('app.string.msg_key_bound'));
      }
      this.keys = await KeyDao.listByDevice(this.selectedDeviceId);
    });
  }

  /** Unbinding clears only the IR code and keeps the key so scene steps stay valid. */
  async unbindKey(keyId: string): Promise<boolean> {
    AppLogger.info(SCOPE, 'unbindKey enter');
    const ok: boolean = await this.guard('Unbind key', async (): Promise<void> => {
      const key: RoomKey | undefined = await KeyDao.get(keyId);
      if (key === undefined) {
        this.statusText = StringResources.get($r('app.string.msg_key_not_exist'));
        return;
      }
      key.irCodeId = '';
      await KeyDao.update(key);
      this.keys = await KeyDao.listByDevice(this.selectedDeviceId);
      this.statusText = StringResources.get($r('app.string.msg_key_unbound'));
    });
    return ok;
  }

  /** Filter the remote templates applicable to the given device type. */
  templatesFor(type: DeviceType): RemoteTemplate[] {
    const result: RemoteTemplate[] = [];
    for (let i = 0; i < this.templates.length; i++) {
      if (this.templates[i].deviceType === type) {
        result.push(this.templates[i]);
      }
    }
    return result;
  }

  /** Run an async action, converting errors into a localized status text. */
  private async guard(name: string, action: () => Promise<void>): Promise<boolean> {
    try {
      await action();
      return true;
    } catch (error) {
      // Unknown throwables (e.g. non-Error objects) get a localized fallback text.
      const detail: string = error instanceof Error ? error.message :
        StringResources.get($r('app.string.msg_operation_failed'));
      this.statusText = detail;
      AppLogger.error(SCOPE, `${name} failed: ${detail}`);
      return false;
    }
  }
}
