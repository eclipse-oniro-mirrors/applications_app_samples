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

import { router } from '@kit.ArkUI';
import { AppLogger, StringResources } from 'common';
import {
  Device,
  getDeviceTypeLabel,
  getKeySemanticLabel,
  RemoteTemplate,
  Room,
  RoomDao,
  RoomKey
} from 'room';
import { DEVICE_TYPES, KEY_SEMANTICS, OrchestrationViewModel } from '../viewmodel/OrchestrationViewModel';

const SCOPE: string = 'TabletRoomConfig';

/** Route parameter passed from the orchestration home page. */
interface RoomParam {
  roomId: string;
}

/** Vertical gap between the major section cards. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Height of the back/entry buttons in the page header. */
const HEADER_BTN_HEIGHT_VP: string = '34vp';
/** Standard height for inputs and main action buttons. */
const CONTROL_HEIGHT_VP: string = '40vp';
/** Height of the per-device edit button in device rows. */
const ROW_BTN_HEIGHT_VP: string = '30vp';
/** Height of the per-key unbind button in key rows. */
const UNBIND_BTN_HEIGHT_VP: string = '28vp';
/** Fixed width of the key label column. */
const KEY_LABEL_WIDTH_VP: string = '96vp';
/** Fixed width of the new-device type selector. */
const TYPE_SELECT_WIDTH_VP: string = '120vp';
/** Corner radius of the unbind chip. */
const KEY_RADIUS_VP: string = '14vp';
/** Tighter vertical padding of device/key list rows. */
const ROW_PAD_TIGHT_VP: string = '4vp';
/** Hairline border width for outlined buttons. */
const BORDER_WIDTH_VP: string = '1vp';
/** Total columns of the adaptive grid row used by the device list. */
const GRID_COLUMNS: number = 12;
/** Span of one device row: half of the grid row, two rows share a row. */
const DEVICE_ROW_SPAN: number = 6;

/**
 * Tablet-side room configuration page.
 * Edits room info, devices, remote templates and key bindings via the shared view model.
 */
@Entry
@ComponentV2
struct RoomConfigPage {
  @Local vm: OrchestrationViewModel = new OrchestrationViewModel();
  @Local room: Room = new Room();
  @Local roomName: string = '';
  @Local roomNote: string = '';
  @Local newDeviceName: string = '';
  @Local newDeviceTypeIndex: number = 0;
  @Local device: Device = new Device();
  @Local hasDevice: boolean = false;
  @Local deviceName: string = '';
  @Local deviceBrand: string = '';
  @Local deviceModel: string = '';
  @Local deviceTypeIndex: number = 0;
  @Local templateIndex: number = 0;
  @Local semanticIndex: number = 0;
  @Local brandIndex: number = 0;
  @Local codeIndex: number = 0;

  /** Kick off initial data loading when the page appears. */
  aboutToAppear(): void {
    this.init();
  }

  /** Load rooms, resolve the target room id and preload the IR library. */
  private async init(): Promise<void> {
    try {
      await this.vm.loadRooms();
      let roomId: string = this.readRoomId();
      if (roomId.length === 0 && this.vm.rooms.length > 0) {
        roomId = this.vm.rooms[0].room.id;
      }
      await this.loadRoom(roomId);
      await this.vm.loadLibrary();
    } catch (error) {
      const detail: string = error instanceof Error ? error.message :
        StringResources.get($r('app.string.msg_load_room_config_failed'));
      this.vm.statusText = detail;
      AppLogger.error(SCOPE, detail);
    }
  }

  /** Extract the roomId string from the router parameters. */
  private readRoomId(): string {
    const raw: Object | undefined = router.getParams();
    if (raw === undefined || raw === null) {
      return '';
    }
    const params: Record<string, Object> = raw as Record<string, Object>;
    const value: Object = params['roomId'];
    if (typeof value === 'string') {
      return value;
    }
    return '';
  }

  /** Load the selected room and reset the device edit form. */
  private async loadRoom(roomId: string): Promise<void> {
    if (roomId.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_no_room_hint'));
      return;
    }
    await this.vm.loadRoom(roomId);
    const room: Room | undefined = await RoomDao.get(roomId);
    if (room === undefined) {
      this.vm.statusText = StringResources.get($r('app.string.msg_room_not_exist'));
      return;
    }
    this.room = room;
    this.roomName = room.name;
    this.roomNote = room.note;
    this.hasDevice = false;
    this.device = new Device();
    this.templateIndex = 0;
  }

  /** Save the edited room name and note after validating the name. */
  private async saveRoom(): Promise<void> {
    const name: string = this.roomName.trim();
    if (name.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_room_name_required'));
      return;
    }
    await this.vm.saveRoom(this.room, name, this.roomNote.trim());
  }

  /** Remove the current room and navigate back on success. */
  private async removeRoom(): Promise<void> {
    const ok: boolean = await this.vm.removeRoom(this.room.id);
    if (ok) {
      router.back();
    }
  }

  /** Add a new device with the entered name and selected type. */
  private async addDevice(): Promise<void> {
    const name: string = this.newDeviceName.trim();
    if (name.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_enter_device_name'));
      return;
    }
    const ok: boolean = await this.vm.addDevice(name, DEVICE_TYPES[this.newDeviceTypeIndex]);
    if (ok) {
      this.newDeviceName = '';
    }
  }

  /** Fill the device detail form from the tapped device. */
  private selectDevice(device: Device): void {
    this.device = device;
    this.hasDevice = true;
    this.deviceName = device.name;
    this.deviceBrand = device.brand;
    this.deviceModel = device.model;
    const typeIndex: number = DEVICE_TYPES.indexOf(device.type);
    this.deviceTypeIndex = typeIndex >= 0 ? typeIndex : 0;
    this.templateIndex = 0;
    this.vm.selectDevice(device.id);
  }

  /** Save the edited device fields after validating the name. */
  private async saveDevice(): Promise<void> {
    const name: string = this.deviceName.trim();
    if (name.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_enter_device_name'));
      return;
    }
    await this.vm.updateDevice(this.device, name, DEVICE_TYPES[this.deviceTypeIndex],
      this.deviceBrand.trim(), this.deviceModel.trim());
  }

  /** Delete the selected device and clear the detail form. */
  private async removeDevice(): Promise<void> {
    const ok: boolean = await this.vm.removeDevice(this.device.id);
    if (ok) {
      this.hasDevice = false;
      this.device = new Device();
    }
  }

  /** Templates applicable to the type chosen in the device form. */
  private templates(): RemoteTemplate[] {
    return this.vm.templatesFor(DEVICE_TYPES[this.deviceTypeIndex]);
  }

  /** Apply the selected remote template to the selected device. */
  private async applyTemplate(): Promise<void> {
    if (!this.hasDevice) {
      this.vm.statusText = StringResources.get($r('app.string.msg_select_device_first'));
      return;
    }
    const templates: RemoteTemplate[] = this.templates();
    if (this.templateIndex < 0 || this.templateIndex >= templates.length) {
      this.vm.statusText = StringResources.get($r('app.string.msg_no_template_for_type'));
      return;
    }
    await this.vm.applyTemplate(templates[this.templateIndex].id);
  }

  /** Bind the selected library code to the selected key semantic. */
  private async bindKey(): Promise<void> {
    if (this.vm.codes.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_no_library_code'));
      return;
    }
    if (this.codeIndex < 0 || this.codeIndex >= this.vm.codes.length) {
      this.vm.statusText = StringResources.get($r('app.string.msg_select_library_code'));
      return;
    }
    await this.vm.bindKey(KEY_SEMANTICS[this.semanticIndex], this.vm.codes[this.codeIndex]);
  }

  /** Build device type select options from the shared constant list. */
  private deviceTypeOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < DEVICE_TYPES.length; i++) {
      options.push({ value: getDeviceTypeLabel(DEVICE_TYPES[i]) });
    }
    return options;
  }

  /** Build template select options for the current device type. */
  private templateOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    const templates: RemoteTemplate[] = this.templates();
    for (let i = 0; i < templates.length; i++) {
      options.push({ value: templates[i].name });
    }
    return options;
  }

  /** Build key semantic select options from the shared constant list. */
  private semanticOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < KEY_SEMANTICS.length; i++) {
      options.push({ value: getKeySemanticLabel(KEY_SEMANTICS[i]) });
    }
    return options;
  }

  /** Build brand select options from the IR library index. */
  private brandOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < this.vm.brands.length; i++) {
      options.push({ value: this.vm.brands[i].brandName });
    }
    return options;
  }

  /** Build code select options from the codes of the selected brand. */
  private codeOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < this.vm.codes.length; i++) {
      options.push({ value: `${this.vm.codes[i].model} · ${this.vm.codes[i].keySemantic}` });
    }
    return options;
  }

  /** Display value of the template selector. */
  private templateValue(): ResourceStr {
    const templates: RemoteTemplate[] = this.templates();
    if (templates.length === 0 || this.templateIndex >= templates.length) {
      return $r('app.string.tablet_template_none');
    }
    return templates[this.templateIndex].name;
  }

  /** Display text of a key's bound code column. */
  private codeText(key: RoomKey): ResourceStr {
    if (key.irCodeId.length > 0) {
      return key.irCodeId;
    }
    return $r('app.string.tablet_key_unbound');
  }

  /** Display value of the brand selector. */
  private brandValue(): ResourceStr {
    if (this.vm.brands.length === 0 || this.brandIndex >= this.vm.brands.length) {
      return $r('app.string.tablet_key_brand');
    }
    return this.vm.brands[this.brandIndex].brandName;
  }

  /** Display value of the code selector. */
  private codeValue(): ResourceStr {
    if (this.vm.codes.length === 0 || this.codeIndex >= this.vm.codes.length) {
      return $r('app.string.tablet_key_code');
    }
    return `${this.vm.codes[this.codeIndex].model} · ${this.vm.codes[this.codeIndex].keySemantic}`;
  }

  /** Switch brand selection and reset the code selector. */
  private async selectBrand(index: number): Promise<void> {
    this.brandIndex = index;
    this.codeIndex = 0;
    await this.vm.selectBrand(index);
  }

  /** Build the page: header, room info, devices, device detail and keys sections. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.tablet_back'))
              .id('id_rc_back')
              .height(HEADER_BTN_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.tablet_room_config'))
              .id('id_rc_title')
              .layoutWeight(1)
              .fontSize($r('app.float.title_font'))
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
            Button($r('app.string.tablet_scene_editor'))
              .id('id_rc_scene_entry')
              .height(HEADER_BTN_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor(Color.Transparent)
              .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                const param: RoomParam = { roomId: this.room.id };
                router.pushUrl({ url: 'orchestration/pages/SceneEditorPage', params: param });
              })
          }
          .id('id_rc_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.vm.statusText.length > 0) {
            Text(this.vm.statusText)
              .id('id_rc_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          // The room info card is an edit form (two inputs plus actions), so
          // it keeps a single column: forms are not suitable for two columns.
          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_room_info'))
              .id('id_rc_room_info_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))
            TextInput({ placeholder: $r('app.string.tablet_room_name_hint'), text: this.roomName })
              .id('id_rc_room_name_input')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .onChange((value: string) => {
                this.roomName = value;
              })
            TextInput({ placeholder: $r('app.string.tablet_room_note_hint'), text: this.roomNote })
              .id('id_rc_room_note_input')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .onChange((value: string) => {
                this.roomNote = value;
              })
            Row({ space: INNER_GAP_VP }) {
              Button($r('app.string.tablet_save'))
                .id('id_rc_room_save')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.saveRoom();
                })
              Button($r('app.string.tablet_delete_room'))
                .id('id_rc_room_delete')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.danger'))
                .backgroundColor(Color.Transparent)
                .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.removeRoom();
                })
            }
            .id('id_rc_room_actions')
            .width('100%')
          }
          .id('id_rc_room_info')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          // Device management card: the device list below uses a two-column
          // adaptive grid, while the "add device" form row stays single-column.
          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_devices_title'))
              .id('id_rc_devices_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))

            if (this.vm.devices.length === 0) {
              Text($r('app.string.tablet_no_devices'))
                .id('id_rc_devices_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            // Two-column adaptive grid: each device row spans half of a
            // 12-column grid row, so the wide tablet screen shows two devices
            // per row while the row content and all component ids stay
            // unchanged. Spacing reuses the shared inner-gap constant.
            GridRow({ columns: GRID_COLUMNS, gutter: INNER_GAP_VP }) {
              Repeat<Device>(this.vm.devices)
                .each((item: RepeatItem<Device>) => {
                  GridCol({ span: DEVICE_ROW_SPAN }) {
                    Row({ space: INNER_GAP_VP }) {
                      Text(item.item.name)
                        .id(`id_rc_device_name_${item.item.id}`)
                        .layoutWeight(1)
                        .fontSize($r('app.float.body_font'))
                        .fontColor(this.vm.selectedDeviceId === item.item.id ?
                          $r('app.color.accent') : $r('app.color.text_primary'))
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                      Text(getDeviceTypeLabel(item.item.type))
                        .id(`id_rc_device_type_${item.item.id}`)
                        .fontSize($r('app.float.caption_font'))
                        .fontColor($r('app.color.text_secondary'))
                      Button($r('app.string.tablet_edit_device'))
                        .id(`id_rc_device_edit_${item.item.id}`)
                        .height(ROW_BTN_HEIGHT_VP)
                        .fontSize($r('app.float.caption_font'))
                        .fontColor($r('app.color.accent'))
                        .backgroundColor(Color.Transparent)
                        .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                        .borderRadius($r('app.float.card_radius'))
                        .onClick(() => {
                          this.selectDevice(item.item);
                        })
                    }
                    .id(`id_rc_device_row_${item.item.id}`)
                    .width('100%')
                    .padding({ top: ROW_PAD_TIGHT_VP, bottom: ROW_PAD_TIGHT_VP })
                    .alignItems(VerticalAlign.Center)
                  }
                })
                .key((item: Device): string => item.id)
            }
            .id('id_rc_device_grid')
            .width('100%')

            Row({ space: INNER_GAP_VP }) {
              TextInput({ placeholder: $r('app.string.tablet_new_device_hint'), text: this.newDeviceName })
                .id('id_rc_new_device_input')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.newDeviceName = value;
                })
              Select(this.deviceTypeOptions())
                .id('id_rc_new_device_type')
                .selected(this.newDeviceTypeIndex)
                .value(getDeviceTypeLabel(DEVICE_TYPES[this.newDeviceTypeIndex]))
                .width(TYPE_SELECT_WIDTH_VP)
                .onSelect((index: number) => {
                  this.newDeviceTypeIndex = index;
                })
              Button($r('app.string.tablet_add_device'))
                .id('id_rc_add_device')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.addDevice();
                })
            }
            .id('id_rc_new_device_row')
            .width('100%')
          }
          .id('id_rc_devices_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          if (this.hasDevice) {
            // The device detail card is an edit form (inputs and selects), so
            // it keeps a single column: forms are not suitable for two columns.
            Column({ space: INNER_GAP_VP }) {
              Text($r('app.string.tablet_device_detail'))
                .id('id_rc_device_detail_title')
                .width('100%')
                .fontSize($r('app.float.body_font'))
                .fontWeight(FontWeight.Medium)
                .fontColor($r('app.color.text_primary'))
              TextInput({ placeholder: $r('app.string.tablet_new_device_hint'), text: this.deviceName })
                .id('id_rc_device_name_input')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.deviceName = value;
                })
              Select(this.deviceTypeOptions())
                .id('id_rc_device_type_select')
                .selected(this.deviceTypeIndex)
                .value(getDeviceTypeLabel(DEVICE_TYPES[this.deviceTypeIndex]))
                .width('100%')
                .onSelect((index: number) => {
                  this.deviceTypeIndex = index;
                  this.templateIndex = 0;
                })
              TextInput({ placeholder: $r('app.string.tablet_device_brand_hint'), text: this.deviceBrand })
                .id('id_rc_device_brand_input')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.deviceBrand = value;
                })
              TextInput({ placeholder: $r('app.string.tablet_device_model_hint'), text: this.deviceModel })
                .id('id_rc_device_model_input')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.deviceModel = value;
                })
              Select(this.templateOptions())
                .id('id_rc_template_select')
                .selected(this.templateIndex)
                .value(this.templateValue())
                .width('100%')
                .onSelect((index: number) => {
                  this.templateIndex = index;
                })
              Row({ space: INNER_GAP_VP }) {
                Button($r('app.string.tablet_save_device'))
                  .id('id_rc_device_save')
                  .layoutWeight(1)
                  .height(CONTROL_HEIGHT_VP)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(Color.White)
                  .backgroundColor($r('app.color.accent'))
                  .borderRadius($r('app.float.card_radius'))
                  .onClick(() => {
                    this.saveDevice();
                  })
                Button($r('app.string.tablet_apply_template'))
                  .id('id_rc_device_template')
                  .layoutWeight(1)
                  .height(CONTROL_HEIGHT_VP)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.accent'))
                  .backgroundColor(Color.Transparent)
                  .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                  .borderRadius($r('app.float.card_radius'))
                  .onClick(() => {
                    this.applyTemplate();
                  })
                Button($r('app.string.tablet_delete_device'))
                  .id('id_rc_device_delete')
                  .layoutWeight(1)
                  .height(CONTROL_HEIGHT_VP)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.danger'))
                  .backgroundColor(Color.Transparent)
                  .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                  .borderRadius($r('app.float.card_radius'))
                  .onClick(() => {
                    this.removeDevice();
                  })
              }
              .id('id_rc_device_actions')
              .width('100%')
            }
            .id('id_rc_device_detail')
            .width('100%')
            .padding($r('app.float.page_padding'))
            .backgroundColor($r('app.color.bg_card'))
            .borderRadius($r('app.float.card_radius'))
          }

          // The keys card keeps a single column on purpose: it mixes a
          // table-like key list (fixed label column) with a chained
          // select-and-bind form, and both are easier to scan in one column.
          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_keys_title'))
              .id('id_rc_keys_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))

            if (!this.hasDevice) {
              Text($r('app.string.tablet_select_device_first'))
                .id('id_rc_keys_hint')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            } else if (this.vm.keys.length === 0) {
              Text($r('app.string.tablet_no_keys'))
                .id('id_rc_keys_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            Repeat<RoomKey>(this.vm.keys)
              .each((item: RepeatItem<RoomKey>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.label)
                    .id(`id_rc_key_label_${item.item.id}`)
                    .width(KEY_LABEL_WIDTH_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.text_primary'))
                  Text(this.codeText(item.item))
                    .id(`id_rc_key_code_${item.item.id}`)
                    .layoutWeight(1)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.text_secondary'))
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Button($r('app.string.tablet_unbind_key'))
                    .id(`id_rc_key_unbind_${item.item.id}`)
                    .height(UNBIND_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.danger'))
                    .backgroundColor(Color.Transparent)
                    .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                    .borderRadius(KEY_RADIUS_VP)
                    .onClick(() => {
                      this.vm.unbindKey(item.item.id);
                    })
                }
                .id(`id_rc_key_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_TIGHT_VP, bottom: ROW_PAD_TIGHT_VP })
                .alignItems(VerticalAlign.Center)
              })
              .key((item: RoomKey): string => item.id)

            Select(this.semanticOptions())
              .id('id_rc_semantic_select')
              .selected(this.semanticIndex)
              .value(getKeySemanticLabel(KEY_SEMANTICS[this.semanticIndex]))
              .width('100%')
              .onSelect((index: number) => {
                this.semanticIndex = index;
              })

            if (this.vm.brands.length === 0) {
              Text($r('app.string.tablet_library_empty'))
                .id('id_rc_library_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            Select(this.brandOptions())
              .id('id_rc_brand_select')
              .selected(this.brandIndex)
              .value(this.brandValue())
              .width('100%')
              .onSelect((index: number) => {
                this.selectBrand(index);
              })

            Select(this.codeOptions())
              .id('id_rc_code_select')
              .selected(this.codeIndex)
              .value(this.codeValue())
              .width('100%')
              .onSelect((index: number) => {
                this.codeIndex = index;
              })

            Button($r('app.string.tablet_bind_key'))
              .id('id_rc_bind_key')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.bindKey();
              })
          }
          .id('id_rc_keys_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_rc_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_rc_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_rc_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
