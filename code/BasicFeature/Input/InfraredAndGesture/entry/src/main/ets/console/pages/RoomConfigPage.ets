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
import { router } from '@kit.ArkUI';
import { AppLogger, StringResources } from 'common';
import {
  IrBrandEntry,
  IrCapabilityProbe,
  IrCode,
  IrLibraryIndex,
  IrLibraryRepository,
  KeyTester,
  TransmitErrorMapper,
  TransmitResult
} from 'ircore';
import {
  ConfigExportResult,
  ConfigImportReport,
  ConfigPackageService,
  Device,
  DeviceDao,
  DeviceType,
  getDeviceTypeLabel,
  getKeySemanticLabel,
  IrCodeDao,
  KeyDao,
  KeySemantic,
  Room,
  RoomDao,
  RoomKey
} from 'room';

const SCOPE: string = 'RoomConfigPage';

/** Device types selectable when adding a device on this page. */
const DEVICE_TYPES: DeviceType[] = [
  DeviceType.PROJECTOR,
  DeviceType.SCREEN,
  DeviceType.LIGHT,
  DeviceType.AC,
  DeviceType.TV,
  DeviceType.AUDIO
];

/** Key semantics selectable when binding an infrared code to a key. */
const SEMANTICS: KeySemantic[] = [
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

/** Vertical gap between the major section cards. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Height of the back button in the page header. */
const BACK_HEIGHT_VP: string = '32vp';
/** Height of small action buttons inside list rows. */
const SMALL_BTN_HEIGHT_VP: string = '30vp';
/** Standard height for text inputs and medium buttons. */
const INPUT_HEIGHT_VP: string = '36vp';
/** Vertical padding of room list rows. */
const ROW_PAD_NORMAL_VP: string = '6vp';
/** Tighter vertical padding of device/key list rows. */
const ROW_PAD_TIGHT_VP: string = '4vp';
/** Fixed width of the key label column. */
const KEY_LABEL_WIDTH_VP: string = '80vp';
/** Hairline border width for outlined buttons. */
const BORDER_WIDTH_VP: string = '1vp';

/**
 * Phone-side room configuration page.
 * Manages rooms, devices and key bindings, and supports config package import/export.
 */
@Entry
@ComponentV2
struct RoomConfigPage {
  @Local rooms: Room[] = [];
  @Local currentRoomId: string = '';
  @Local currentRoomName: string = '';
  @Local devices: Device[] = [];
  @Local selectedDeviceId: string = '';
  @Local keys: RoomKey[] = [];
  @Local selectedKeyId: string = '';
  @Local newRoomName: string = '';
  @Local newDeviceName: string = '';
  @Local deviceTypeIndex: number = 0;
  @Local brands: IrBrandEntry[] = [];
  @Local brandIndex: number = 0;
  @Local codes: IrCode[] = [];
  @Local codeIndex: number = 0;
  @Local semanticIndex: number = 0;
  @Local readOnly: boolean = true;
  @Local statusText: string = '';
  @Local exportPath: string = '';
  @Local importPath: string = '';
  @Local importSummary: string = '';

  /** Detect the IR emitter to decide read-only mode, then load initial data. */
  aboutToAppear(): void {
    this.readOnly = !IrCapabilityProbe.getCached().hasEmitter;
    this.init();
  }

  /** Load the IR brand index and the room list in one guarded action. */
  private async init(): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      const index: IrLibraryIndex = await IrLibraryRepository.getIndex();
      this.brands = index.brands;
      if (this.brands.length > 0) {
        await this.selectBrand(0);
      }
      await this.loadRooms();
    });
  }

  /** Run an action, converting failures into a localized status text. */
  private async runAction(action: () => Promise<void>): Promise<void> {
    try {
      await action();
    } catch (error) {
      const detail: string = error instanceof Error ? error.message :
        StringResources.get($r('app.string.msg_operation_failed'));
      this.statusText = detail;
      AppLogger.error(SCOPE, detail);
    }
  }

  /**
   * Refresh the room list. When the previously selected room no longer exists,
   * fall back to the first listed room (seeded demo data defines that entry).
   */
  private async loadRooms(): Promise<void> {
    this.rooms = await RoomDao.list();
    if (this.rooms.length === 0) {
      this.currentRoomId = '';
      this.currentRoomName = '';
      this.devices = [];
      this.keys = [];
      this.selectedDeviceId = '';
      this.selectedKeyId = '';
      return;
    }
    let exists: boolean = false;
    for (let i = 0; i < this.rooms.length; i++) {
      if (this.rooms[i].id === this.currentRoomId) {
        exists = true;
        break;
      }
    }
    if (!exists) {
      await this.selectRoom(this.rooms[0].id);
    }
  }

  /**
   * Select the room to edit. The roomId may originate from the seeded demo data:
   * loadRooms falls back to the first listed room when the current selection is gone.
   * If the id cannot be resolved (e.g. the seed row was deleted), the room name
   * falls back to an empty string while devices/keys are still queried.
   */
  private async selectRoom(roomId: string): Promise<void> {
    const room: Room | undefined = await RoomDao.get(roomId);
    if (room === undefined) {
      // Seed-room id may disappear after demo data is removed; behavior is kept unchanged.
      AppLogger.warn(SCOPE, `room not found for id: ${roomId}`);
    }
    this.currentRoomId = roomId;
    this.currentRoomName = room !== undefined ? room.name : '';
    this.devices = await DeviceDao.listByRoom(roomId);
    this.selectedDeviceId = '';
    this.keys = [];
    this.selectedKeyId = '';
  }

  /** Create a room from the name input and reload the list. */
  private async addRoom(): Promise<void> {
    const name: string = this.newRoomName.trim();
    if (name.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_room_name_required'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const room: Room = new Room();
      room.id = util.generateRandomUUID(true);
      room.name = name;
      room.note = '';
      room.sortOrder = this.rooms.length;
      room.createdAt = Date.now();
      room.updatedAt = Date.now();
      await RoomDao.insert(room);
      this.newRoomName = '';
      this.statusText = StringResources.get($r('app.string.msg_room_created'));
      await this.loadRooms();
    });
  }

  /** Delete a room; clears the selection when the current room is removed. */
  private async removeRoom(roomId: string): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      await RoomDao.remove(roomId);
      if (this.currentRoomId === roomId) {
        this.currentRoomId = '';
        this.currentRoomName = '';
        this.devices = [];
        this.keys = [];
        this.selectedDeviceId = '';
        this.selectedKeyId = '';
      }
      this.statusText = StringResources.get($r('app.string.msg_room_deleted'));
      await this.loadRooms();
    });
  }

  /** Delete a device; clears key selection when the selected device is removed. */
  private async removeDevice(deviceId: string): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      await DeviceDao.remove(deviceId);
      if (this.selectedDeviceId === deviceId) {
        this.selectedDeviceId = '';
        this.keys = [];
        this.selectedKeyId = '';
      }
      this.devices = await DeviceDao.listByRoom(this.currentRoomId);
      this.statusText = StringResources.get($r('app.string.msg_device_deleted'));
    });
  }

  /** Cycle to the next device type for the add-device form. */
  private cycleDeviceType(): void {
    this.deviceTypeIndex = (this.deviceTypeIndex + 1) % DEVICE_TYPES.length;
  }

  /** Add a device of the cycled type to the current room. */
  private async addDevice(): Promise<void> {
    if (this.currentRoomId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_room_first'));
      return;
    }
    const name: string = this.newDeviceName.trim();
    if (name.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_enter_device_name'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const device: Device = new Device();
      device.id = util.generateRandomUUID(true);
      device.roomId = this.currentRoomId;
      device.name = name;
      device.type = DEVICE_TYPES[this.deviceTypeIndex];
      device.templateId = '';
      device.brand = '';
      device.model = '';
      device.sortOrder = this.devices.length;
      device.createdAt = Date.now();
      device.updatedAt = Date.now();
      await DeviceDao.insert(device);
      this.newDeviceName = '';
      this.devices = await DeviceDao.listByRoom(this.currentRoomId);
      this.statusText = StringResources.get($r('app.string.msg_device_added'));
    });
  }

  /** Select a device and load its bound keys. */
  private async selectDevice(deviceId: string): Promise<void> {
    this.selectedDeviceId = deviceId;
    this.selectedKeyId = '';
    await this.runAction(async (): Promise<void> => {
      this.keys = await KeyDao.listByDevice(deviceId);
    });
  }

  /** Switch the IR brand selection and load its code list. */
  private async selectBrand(index: number): Promise<void> {
    this.brandIndex = index;
    this.codes = [];
    this.codeIndex = 0;
    if (index < 0 || index >= this.brands.length) {
      return;
    }
    this.codes = await IrLibraryRepository.loadBrand(this.brands[index].brandId);
  }

  /** Bind the selected library code to the selected key semantic. */
  private async bindKey(): Promise<void> {
    if (this.selectedDeviceId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_device_first'));
      return;
    }
    if (this.codeIndex < 0 || this.codeIndex >= this.codes.length) {
      this.statusText = StringResources.get($r('app.string.msg_select_library_code'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const code: IrCode = this.codes[this.codeIndex];
      await IrCodeDao.upsert(code);
      const semantic: KeySemantic = SEMANTICS[this.semanticIndex];
      const key: RoomKey = new RoomKey();
      key.id = util.generateRandomUUID(true);
      key.deviceId = this.selectedDeviceId;
      key.semantic = semantic;
      key.label = getKeySemanticLabel(semantic);
      key.irCodeId = code.id;
      key.sortOrder = this.keys.length;
      await KeyDao.insert(key);
      this.keys = await KeyDao.listByDevice(this.selectedDeviceId);
      this.selectedKeyId = key.id;
      this.statusText = StringResources.get($r('app.string.msg_key_bound'));
    });
  }

  /** Send the selected key's IR code once and show the transmit result. */
  private async testKey(): Promise<void> {
    if (this.selectedKeyId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_key_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const key: RoomKey | undefined = await KeyDao.get(this.selectedKeyId);
      if (key === undefined) {
        this.statusText = StringResources.get($r('app.string.msg_key_not_exist'));
        return;
      }
      const code: IrCode | undefined = await IrCodeDao.get(key.irCodeId);
      if (code === undefined) {
        this.statusText = StringResources.get($r('app.string.msg_key_no_ir_code'));
        return;
      }
      const result: TransmitResult = await KeyTester.testCode(code);
      this.statusText = `${TransmitErrorMapper.toUserText(result.code)} · ${result.durationMs.toString()} ms`;
    });
  }

  /** Export the current room's configuration into a package file. */
  private async exportRoom(): Promise<void> {
    if (this.currentRoomId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_room_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const result: ConfigExportResult =
        await ConfigPackageService.export([this.currentRoomId]);
      this.exportPath = result.ok ? result.filePath : result.message;
      this.statusText = result.message;
    });
  }

  /** Import a configuration package from the given file path. */
  private async importPackage(): Promise<void> {
    const path: string = this.importPath.trim();
    if (path.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_enter_config_path'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const report: ConfigImportReport = await ConfigPackageService.import(path);
      this.importSummary = report.ok ?
        StringResources.format($r('app.string.msg_import_summary'),
          report.importedRooms, report.importedDevices, report.importedKeys,
          report.importedScenes) :
        StringResources.format($r('app.string.msg_import_failed_items'),
          report.message, report.failedItems.length);
      this.statusText = report.message;
      if (report.ok) {
        this.currentRoomId = '';
        await this.loadRooms();
      }
    });
  }

  /** Build select options from the loaded IR brands. */
  private brandOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < this.brands.length; i++) {
      options.push({ value: this.brands[i].brandName });
    }
    return options;
  }

  /** Build select options from the supported key semantics. */
  private semanticOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < SEMANTICS.length; i++) {
      options.push({ value: getKeySemanticLabel(SEMANTICS[i]) });
    }
    return options;
  }

  /** Build select options from the codes of the selected brand. */
  private codeOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < this.codes.length; i++) {
      options.push({ value: `${this.codes[i].keySemantic} · ${this.codes[i].id}` });
    }
    return options;
  }

  /** Display value of the brand selector. */
  private brandValue(): ResourceStr {
    if (this.brands.length === 0 || this.brandIndex >= this.brands.length) {
      return $r('app.string.phone_brand_label');
    }
    return this.brands[this.brandIndex].brandName;
  }

  /** Display value of the semantic selector. */
  private semanticValue(): ResourceStr {
    if (this.semanticIndex < 0 || this.semanticIndex >= SEMANTICS.length) {
      return $r('app.string.phone_semantic_label');
    }
    return getKeySemanticLabel(SEMANTICS[this.semanticIndex]);
  }

  /** Display value of the code selector. */
  private codeValue(): ResourceStr {
    if (this.codes.length === 0 || this.codeIndex >= this.codes.length) {
      return $r('app.string.phone_code_label');
    }
    return `${this.codes[this.codeIndex].keySemantic} · ${this.codes[this.codeIndex].id}`;
  }

  /** Build the page: header, status, and room/device/key/package sections. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.phone_back'))
              .id('id_room_back')
              .height(BACK_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.phone_room_config'))
              .id('id_room_title')
              .fontSize($r('app.float.title_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
          }
          .id('id_room_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.statusText.length > 0) {
            Text(this.statusText)
              .id('id_room_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_rooms_title'))
              .id('id_rooms_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            Repeat<Room>(this.rooms)
              .each((item: RepeatItem<Room>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.name)
                    .id(`id_room_name_${item.item.id}`)
                    .fontSize($r('app.float.body_font'))
                    .fontColor(this.currentRoomId === item.item.id ?
                      $r('app.color.accent') : $r('app.color.text_primary'))
                    .layoutWeight(1)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .onClick(() => {
                      this.selectRoom(item.item.id);
                    })
                  Button($r('app.string.phone_enter_room'))
                    .id(`id_room_enter_${item.item.id}`)
                    .height(SMALL_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor(Color.White)
                    .backgroundColor($r('app.color.accent'))
                    .borderRadius($r('app.float.card_radius'))
                    .onClick(() => {
                      this.selectRoom(item.item.id);
                    })
                  Button($r('app.string.phone_delete_room'))
                    .id(`id_room_delete_${item.item.id}`)
                    .height(SMALL_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.danger'))
                    .backgroundColor(Color.Transparent)
                    .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                    .borderRadius($r('app.float.card_radius'))
                    .onClick(() => {
                      this.removeRoom(item.item.id);
                    })
                }
                .id(`id_room_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_NORMAL_VP, bottom: ROW_PAD_NORMAL_VP })
                .alignItems(VerticalAlign.Center)
              })
              .key((item: Room): string => item.id)

            Row({ space: INNER_GAP_VP }) {
              TextInput({ placeholder: $r('app.string.phone_new_room_hint'), text: this.newRoomName })
                .id('id_new_room_input')
                .layoutWeight(1)
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.newRoomName = value;
                })
              Button($r('app.string.phone_create_room'))
                .id('id_new_room_button')
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.addRoom();
                })
            }
            .id('id_new_room_row')
            .width('100%')
          }
          .id('id_rooms_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_current_room', this.currentRoomName))
              .id('id_current_room')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            Repeat<Device>(this.devices)
              .each((item: RepeatItem<Device>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.name)
                    .id(`id_device_name_${item.item.id}`)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor(this.selectedDeviceId === item.item.id ?
                      $r('app.color.accent') : $r('app.color.text_primary'))
                    .layoutWeight(1)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Text(getDeviceTypeLabel(item.item.type))
                    .id(`id_device_type_${item.item.id}`)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.text_secondary'))
                  Button($r('app.string.phone_select_device'))
                    .id(`id_device_select_${item.item.id}`)
                    .height(SMALL_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.accent'))
                    .backgroundColor(Color.Transparent)
                    .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                    .borderRadius($r('app.float.card_radius'))
                    .onClick(() => {
                      this.selectDevice(item.item.id);
                    })
                  Button($r('app.string.phone_delete_device'))
                    .id(`id_device_delete_${item.item.id}`)
                    .height(SMALL_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.danger'))
                    .backgroundColor(Color.Transparent)
                    .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                    .borderRadius($r('app.float.card_radius'))
                    .onClick(() => {
                      this.removeDevice(item.item.id);
                    })
                }
                .id(`id_device_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_TIGHT_VP, bottom: ROW_PAD_TIGHT_VP })
                .alignItems(VerticalAlign.Center)
              })
              .key((item: Device): string => item.id)

            Row({ space: INNER_GAP_VP }) {
              TextInput({ placeholder: $r('app.string.phone_new_device_hint'), text: this.newDeviceName })
                .id('id_new_device_input')
                .layoutWeight(1)
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.newDeviceName = value;
                })
              Button(getDeviceTypeLabel(DEVICE_TYPES[this.deviceTypeIndex]))
                .id('id_device_type_cycle')
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.accent'))
                .backgroundColor(Color.Transparent)
                .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.cycleDeviceType();
                })
              Button($r('app.string.phone_add_device'))
                .id('id_add_device_button')
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.addDevice();
                })
            }
            .id('id_new_device_row')
            .width('100%')
          }
          .id('id_devices_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_keys_title'))
              .id('id_keys_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            if (this.selectedDeviceId.length === 0) {
              Text($r('app.string.phone_select_device_first'))
                .id('id_keys_hint')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            } else if (this.keys.length === 0) {
              Text($r('app.string.phone_no_keys'))
                .id('id_keys_empty')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }

            Repeat<RoomKey>(this.keys)
              .each((item: RepeatItem<RoomKey>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.label)
                    .id(`id_key_label_${item.item.id}`)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor(this.selectedKeyId === item.item.id ?
                      $r('app.color.accent') : $r('app.color.text_primary'))
                    .width(KEY_LABEL_WIDTH_VP)
                  Text(item.item.irCodeId)
                    .id(`id_key_code_${item.item.id}`)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.text_secondary'))
                    .layoutWeight(1)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .id(`id_key_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_TIGHT_VP, bottom: ROW_PAD_TIGHT_VP })
                .alignItems(VerticalAlign.Center)
                .onClick(() => {
                  this.selectedKeyId = item.item.id;
                })
              })
              .key((item: RoomKey): string => item.id)

            if (this.brands.length === 0) {
              Text($r('app.string.phone_library_empty'))
                .id('id_library_empty')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }

            Select(this.semanticOptions())
              .id('id_semantic_select')
              .selected(this.semanticIndex)
              .value(this.semanticValue())
              .width('100%')
              .onSelect((index: number) => {
                this.semanticIndex = index;
              })

            Select(this.brandOptions())
              .id('id_brand_select')
              .selected(this.brandIndex)
              .value(this.brandValue())
              .width('100%')
              .onSelect((index: number) => {
                this.runAction(async (): Promise<void> => {
                  await this.selectBrand(index);
                });
              })

            Select(this.codeOptions())
              .id('id_code_select')
              .selected(this.codeIndex)
              .value(this.codeValue())
              .width('100%')
              .onSelect((index: number) => {
                this.codeIndex = index;
              })

            Button($r('app.string.phone_bind_key'))
              .id('id_bind_key_button')
              .height(INPUT_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.bindKey();
              })

            if (!this.readOnly) {
              Button($r('app.string.phone_test_send'))
                .id('id_test_send_button')
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.success'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.testKey();
                })
            } else {
              Text($r('app.string.phone_read_only_hint'))
                .id('id_test_send_read_only')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }
          }
          .id('id_keys_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_config_package'))
              .id('id_config_package_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            Button($r('app.string.phone_export_room'))
              .id('id_export_room_button')
              .height(INPUT_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor(Color.Transparent)
              .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.exportRoom();
              })

            if (this.exportPath.length > 0) {
              Text(this.exportPath)
                .id('id_export_path')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }

            TextInput({ placeholder: $r('app.string.phone_import_hint'), text: this.importPath })
              .id('id_import_path_input')
              .height(INPUT_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .onChange((value: string) => {
                this.importPath = value;
              })

            Button($r('app.string.phone_import'))
              .id('id_import_button')
              .height(INPUT_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.importPackage();
              })

            if (this.importSummary.length > 0) {
              Text(this.importSummary)
                .id('id_import_summary')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }
          }
          .id('id_config_package_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_room_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_room_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_room_config_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
