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
import { AppConstants, AppLogger, StringResources } from 'common';
import {
  Device,
  DeviceDao,
  KeyDao,
  Room,
  RoomDao,
  RoomKey,
  Scene,
  SceneDao,
  SceneStep,
  SceneStepDao,
  SceneValidation,
  SceneValidator
} from 'room';

const SCOPE: string = 'SceneEditorPage';

/** Delay presets (ms) cycled by the per-step delay button. */
const DELAY_PRESETS: number[] = [100, 250, 500, 1000];

/** Vertical gap between the major section cards. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows, columns and lists. */
const INNER_GAP_VP: string = '8vp';
/** Gap between the two action rows inside one step card. */
const STEP_GAP_VP: string = '4vp';
/** Height of small pill buttons (back, room chips). */
const PILL_HEIGHT_VP: string = '32vp';
/** Height of step inline action chips. */
const STEP_BTN_HEIGHT_VP: string = '28vp';
/** Standard height for controls (room list, add/validate buttons). */
const CONTROL_HEIGHT_VP: string = '36vp';
/** Vertical padding of scene/step list rows. */
const ROW_PAD_VP: string = '6vp';
/** Corner radius of room chips. */
const ROOM_RADIUS_VP: string = '16vp';
/** Corner radius of step action chips. */
const STEP_RADIUS_VP: string = '14vp';
/** Gap between the step action chips in one row. */
const CHIP_GAP_VP: string = '6vp';
/** Hairline border width for outlined chips. */
const BORDER_WIDTH_VP: string = '1vp';

/**
 * Phone-side scene editor page.
 * Creates scenes, adds ordered device-key steps and validates them.
 */
@Entry
@ComponentV2
struct SceneEditorPage {
  @Local rooms: Room[] = [];
  @Local currentRoomId: string = '';
  @Local scenes: Scene[] = [];
  @Local selectedSceneId: string = '';
  @Local steps: SceneStep[] = [];
  @Local devices: Device[] = [];
  @Local roomKeys: RoomKey[] = [];
  @Local addDeviceIndex: number = 0;
  @Local addKeyIndex: number = 0;
  @Local validationText: string = '';
  @Local statusText: string = '';

  /** Load the room list and select the first room on page entry. */
  aboutToAppear(): void {
    this.init();
  }

  /** Load rooms; failures surface as a localized status text. */
  private async init(): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      this.rooms = await RoomDao.list();
      if (this.rooms.length > 0) {
        await this.selectRoom(this.rooms[0].id);
      }
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

  /** Select a room and preload its scenes, devices and all device keys. */
  private async selectRoom(roomId: string): Promise<void> {
    this.currentRoomId = roomId;
    this.scenes = await SceneDao.listByRoom(roomId);
    this.selectedSceneId = '';
    this.steps = [];
    this.validationText = '';
    this.devices = await DeviceDao.listByRoom(roomId);
    this.roomKeys = [];
    for (let i = 0; i < this.devices.length; i++) {
      const keys: RoomKey[] = await KeyDao.listByDevice(this.devices[i].id);
      for (let j = 0; j < keys.length; j++) {
        this.roomKeys.push(keys[j]);
      }
    }
    this.addDeviceIndex = 0;
    this.addKeyIndex = 0;
    if (this.scenes.length > 0) {
      await this.selectScene(this.scenes[0].id);
    }
  }

  /** Select a scene and load its steps. */
  private async selectScene(sceneId: string): Promise<void> {
    this.selectedSceneId = sceneId;
    this.validationText = '';
    this.steps = await SceneStepDao.listByScene(sceneId);
  }

  /** Create an untitled scene in the current room and select it. */
  private async createScene(): Promise<void> {
    if (this.currentRoomId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_room_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const scene: Scene = new Scene();
      scene.id = util.generateRandomUUID(true);
      scene.roomId = this.currentRoomId;
      scene.name = StringResources.get($r('app.string.msg_new_scene_name'));
      scene.icon = '';
      scene.sortOrder = this.scenes.length;
      await SceneDao.insert(scene);
      this.scenes = await SceneDao.listByRoom(this.currentRoomId);
      await this.selectScene(scene.id);
      this.statusText = StringResources.get($r('app.string.msg_scene_created'));
    });
  }

  /** Return the keys of the device currently chosen in the add-step form. */
  private addKeys(): RoomKey[] {
    const result: RoomKey[] = [];
    if (this.addDeviceIndex < 0 || this.addDeviceIndex >= this.devices.length) {
      return result;
    }
    const deviceId: string = this.devices[this.addDeviceIndex].id;
    for (let i = 0; i < this.roomKeys.length; i++) {
      if (this.roomKeys[i].deviceId === deviceId) {
        result.push(this.roomKeys[i]);
      }
    }
    return result;
  }

  /** Next sort order value: current maximum plus one. */
  private nextOrder(): number {
    let max: number = -1;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].order > max) {
        max = this.steps[i].order;
      }
    }
    return max + 1;
  }

  /** Append a step bound to the chosen device and key. */
  private async addStep(): Promise<void> {
    if (this.selectedSceneId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_scene_first'));
      return;
    }
    const keys: RoomKey[] = this.addKeys();
    if (this.addDeviceIndex >= this.devices.length || keys.length === 0 ||
      this.addKeyIndex >= keys.length) {
      this.statusText = StringResources.get($r('app.string.msg_select_device_and_key'));
      return;
    }
    const device: Device = this.devices[this.addDeviceIndex];
    const key: RoomKey = keys[this.addKeyIndex];
    await this.runAction(async (): Promise<void> => {
      const step: SceneStep = new SceneStep();
      step.id = util.generateRandomUUID(true);
      step.sceneId = this.selectedSceneId;
      step.deviceId = device.id;
      step.keyId = key.id;
      step.delayMs = AppConstants.STEP_INTERVAL_MS;
      step.order = this.nextOrder();
      step.enabled = true;
      await SceneStepDao.insert(step);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      this.statusText = StringResources.get($r('app.string.msg_step_added'));
    });
  }

  /** Remove one step from the scene. */
  private async removeStep(stepId: string): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      await SceneStepDao.remove(stepId);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      this.validationText = '';
      this.statusText = StringResources.get($r('app.string.msg_step_deleted'));
    });
  }

  /** Move a step up or down and rewrite the order values. */
  private async moveStep(index: number, delta: number): Promise<void> {
    const target: number = index + delta;
    if (target < 0 || target >= this.steps.length) {
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const reordered: SceneStep[] = this.steps.slice();
      const moved: SceneStep = reordered[index];
      reordered[index] = reordered[target];
      reordered[target] = moved;
      for (let i = 0; i < reordered.length; i++) {
        reordered[i].order = i;
      }
      await SceneStepDao.replaceForScene(this.selectedSceneId, reordered);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      this.validationText = '';
    });
  }

  /** Cycle the step delay to the next preset value. */
  private async cycleDelay(index: number): Promise<void> {
    if (index < 0 || index >= this.steps.length) {
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const updated: SceneStep[] = this.steps.slice();
      const pos: number = DELAY_PRESETS.indexOf(updated[index].delayMs);
      updated[index].delayMs = DELAY_PRESETS[(pos + 1) % DELAY_PRESETS.length];
      await SceneStepDao.replaceForScene(this.selectedSceneId, updated);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      this.validationText = '';
      this.statusText = StringResources.get($r('app.string.msg_step_delay_updated'));
    });
  }

  /** Enable or disable a step; disabled steps are skipped when running. */
  private async toggleStep(index: number): Promise<void> {
    if (index < 0 || index >= this.steps.length) {
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const updated: SceneStep[] = this.steps.slice();
      updated[index].enabled = !updated[index].enabled;
      await SceneStepDao.replaceForScene(this.selectedSceneId, updated);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      this.validationText = '';
    });
  }

  /** Validate the selected scene and show the result messages. */
  private async validateScene(): Promise<void> {
    if (this.selectedSceneId.length === 0) {
      this.validationText = StringResources.get($r('app.string.msg_select_scene_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const validation: SceneValidation = await SceneValidator.validate(this.selectedSceneId);
      if (validation.valid) {
        this.validationText = StringResources.get($r('app.string.msg_validation_passed'));
        return;
      }
      this.validationText = validation.messages.length > 0 ?
        validation.messages.join('; ') : StringResources.get($r('app.string.msg_scene_invalid'));
    });
  }

  /** Resolve a device display name by id; falls back to the raw id. */
  private deviceName(deviceId: string): string {
    for (let i = 0; i < this.devices.length; i++) {
      if (this.devices[i].id === deviceId) {
        return this.devices[i].name;
      }
    }
    return deviceId;
  }

  /** Resolve a key label by id; falls back to the raw id. */
  private keyLabel(keyId: string): string {
    for (let i = 0; i < this.roomKeys.length; i++) {
      if (this.roomKeys[i].id === keyId) {
        return this.roomKeys[i].label;
      }
    }
    return keyId;
  }

  /** Resolve a scene name by id; falls back to the raw id. */
  private sceneName(sceneId: string): string {
    for (let i = 0; i < this.scenes.length; i++) {
      if (this.scenes[i].id === sceneId) {
        return this.scenes[i].name;
      }
    }
    return sceneId;
  }

  /** Build device select options for the add-step form. */
  private deviceOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (let i = 0; i < this.devices.length; i++) {
      options.push({ value: this.devices[i].name });
    }
    return options;
  }

  /** Build key select options for the add-step form. */
  private keyOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    const keys: RoomKey[] = this.addKeys();
    for (let i = 0; i < keys.length; i++) {
      options.push({ value: keys[i].label });
    }
    return options;
  }

  /** Display value of the device selector. */
  private deviceValue(): ResourceStr {
    if (this.devices.length === 0 || this.addDeviceIndex >= this.devices.length) {
      return $r('app.string.phone_select_device');
    }
    return this.devices[this.addDeviceIndex].name;
  }

  /** Display value of the key selector. */
  private keyValue(): ResourceStr {
    const keys: RoomKey[] = this.addKeys();
    if (keys.length === 0 || this.addKeyIndex >= keys.length) {
      return $r('app.string.phone_select_key');
    }
    return keys[this.addKeyIndex].label;
  }

  /** Build the page: header, status, rooms, scenes and step editor sections. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.phone_back'))
              .id('id_scene_back')
              .height(PILL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.phone_scene_editor'))
              .id('id_scene_title')
              .fontSize($r('app.float.title_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
          }
          .id('id_scene_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.statusText.length > 0) {
            Text(this.statusText)
              .id('id_scene_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_rooms_title'))
              .id('id_scene_rooms_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            List({ space: INNER_GAP_VP }) {
              Repeat<Room>(this.rooms)
                .each((item: RepeatItem<Room>) => {
                  ListItem() {
                    Button(item.item.name)
                      .id(`id_scene_room_${item.item.id}`)
                      .height(PILL_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor(this.currentRoomId === item.item.id ?
                        Color.White : $r('app.color.accent'))
                      .backgroundColor(this.currentRoomId === item.item.id ?
                        $r('app.color.accent') : $r('app.color.bg_page'))
                      .borderRadius(ROOM_RADIUS_VP)
                      .onClick(() => {
                        this.runAction(async (): Promise<void> => {
                          await this.selectRoom(item.item.id);
                        });
                      })
                  }
                  .id(`id_scene_room_item_${item.item.id}`)
                })
                .key((item: Room): string => item.id)
            }
            .id('id_scene_room_list')
            .width('100%')
            .height(CONTROL_HEIGHT_VP)
            .listDirection(Axis.Horizontal)
            .scrollBar(BarState.Off)
          }
          .id('id_scene_rooms_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_scenes_title'))
              .id('id_scenes_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            if (this.scenes.length === 0) {
              Text($r('app.string.phone_no_scenes'))
                .id('id_scenes_empty')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }

            Repeat<Scene>(this.scenes)
              .each((item: RepeatItem<Scene>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.name)
                    .id(`id_scene_name_${item.item.id}`)
                    .fontSize($r('app.float.body_font'))
                    .fontColor(this.selectedSceneId === item.item.id ?
                      $r('app.color.accent') : $r('app.color.text_primary'))
                    .layoutWeight(1)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .onClick(() => {
                      this.runAction(async (): Promise<void> => {
                        await this.selectScene(item.item.id);
                      });
                    })
                }
                .id(`id_scene_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_VP, bottom: ROW_PAD_VP })
                .alignItems(VerticalAlign.Center)
              })
              .key((item: Scene): string => item.id)

            Button($r('app.string.phone_new_scene'))
              .id('id_new_scene_button')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.createScene();
              })
          }
          .id('id_scenes_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_steps_title', this.sceneName(this.selectedSceneId)))
              .id('id_steps_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            Repeat<SceneStep>(this.steps)
              .each((item: RepeatItem<SceneStep>) => {
                Column({ space: STEP_GAP_VP }) {
                  Row({ space: INNER_GAP_VP }) {
                    Text($r('app.string.phone_step_no', item.index + 1))
                      .id(`id_step_no_${item.item.id}`)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_secondary'))
                    Text(this.deviceName(item.item.deviceId))
                      .id(`id_step_device_${item.item.id}`)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_primary'))
                      .layoutWeight(1)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(this.keyLabel(item.item.keyId))
                      .id(`id_step_key_${item.item.id}`)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_primary'))
                      .layoutWeight(1)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Button($r('app.string.phone_step_delay', item.item.delayMs))
                      .id(`id_step_delay_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_secondary'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.cycleDelay(item.index);
                      })
                  }
                  .id(`id_step_line_${item.item.id}`)
                  .width('100%')
                  .alignItems(VerticalAlign.Center)

                  Row({ space: CHIP_GAP_VP }) {
                    Button(item.item.enabled ? $r('app.string.phone_disable') :
                      $r('app.string.phone_enable'))
                      .id(`id_step_toggle_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.toggleStep(item.index);
                      })
                    Button($r('app.string.phone_move_up'))
                      .id(`id_step_up_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.moveStep(item.index, -1);
                      })
                    Button($r('app.string.phone_move_down'))
                      .id(`id_step_down_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.moveStep(item.index, 1);
                      })
                    Button($r('app.string.phone_remove_step'))
                      .id(`id_step_remove_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.danger'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.removeStep(item.item.id);
                      })
                  }
                  .id(`id_step_actions_${item.item.id}`)
                  .width('100%')
                }
                .id(`id_step_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_VP, bottom: ROW_PAD_VP })
              })
              .key((item: SceneStep): string => item.id)

            Select(this.deviceOptions())
              .id('id_step_device_select')
              .selected(this.addDeviceIndex)
              .value(this.deviceValue())
              .width('100%')
              .onSelect((index: number) => {
                this.addDeviceIndex = index;
                this.addKeyIndex = 0;
              })

            Select(this.keyOptions())
              .id('id_step_key_select')
              .selected(this.addKeyIndex)
              .value(this.keyValue())
              .width('100%')
              .onSelect((index: number) => {
                this.addKeyIndex = index;
              })

            Row({ space: INNER_GAP_VP }) {
              Button($r('app.string.phone_add_step'))
                .id('id_add_step_button')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.addStep();
                })
              Button($r('app.string.phone_validate'))
                .id('id_validate_button')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.accent'))
                .backgroundColor(Color.Transparent)
                .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.validateScene();
                })
            }
            .id('id_step_action_row')
            .width('100%')

            if (this.validationText.length > 0) {
              Text(this.validationText)
                .id('id_validation_text')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }
          }
          .id('id_steps_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_scene_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_scene_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_scene_editor_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
