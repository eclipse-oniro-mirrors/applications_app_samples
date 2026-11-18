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

const SCOPE: string = 'TabletSceneEditor';
/** Delay increment/decrement (ms) applied by the per-step delay buttons. */
const DELAY_STEP_MS: number = 100;

/** Vertical gap between the major section cards. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Gap between the step line and its action chips row. */
const STEP_GAP_VP: string = '4vp';
/** Height of the scene row select/delete buttons. */
const ROW_BTN_HEIGHT_VP: string = '30vp';
/** Height of step inline action chips. */
const STEP_BTN_HEIGHT_VP: string = '28vp';
/** Standard height for inputs and main action buttons. */
const CONTROL_HEIGHT_VP: string = '40vp';
/** Height of the back button in the page header. */
const HEADER_BTN_HEIGHT_VP: string = '34vp';
/** Corner radius of step action chips. */
const STEP_RADIUS_VP: string = '14vp';
/** Vertical padding of scene list rows. */
const ROW_PAD_TIGHT_VP: string = '4vp';
/** Vertical padding of step list rows. */
const ROW_PAD_VP: string = '6vp';
/** Gap between step action chips in one row. */
const CHIP_GAP_VP: string = '6vp';
/** Hairline border width for outlined chips. */
const BORDER_WIDTH_VP: string = '1vp';
/** Total columns of the adaptive grid row used by the scene list. */
const GRID_COLUMNS: number = 12;
/** Span of one scene row: half of the grid row, two rows share a row. */
const SCENE_ROW_SPAN: number = 6;

/**
 * Tablet-side scene editor page.
 * Creates scenes, edits ordered device-key steps and runs validation.
 */
@Entry
@ComponentV2
struct SceneEditorPage {
  @Local roomId: string = '';
  @Local roomName: string = '';
  @Local scenes: Scene[] = [];
  @Local selectedSceneId: string = '';
  @Local steps: SceneStep[] = [];
  @Local devices: Device[] = [];
  @Local roomKeys: RoomKey[] = [];
  @Local addDeviceIndex: number = 0;
  @Local addKeyIndex: number = 0;
  @Local sceneNameInput: string = '';
  @Local validationText: string = '';
  @Local statusText: string = '';

  /** Kick off initial data loading when the page appears. */
  aboutToAppear(): void {
    this.init();
  }

  /** Resolve the target room from router params and preload its data. */
  private async init(): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      let roomId: string = this.readRoomId();
      if (roomId.length === 0) {
        const rooms: Room[] = await RoomDao.list();
        if (rooms.length > 0) {
          roomId = rooms[0].id;
        }
      }
      if (roomId.length === 0) {
        this.statusText = StringResources.get($r('app.string.msg_no_room_hint'));
        return;
      }
      await this.selectRoom(roomId);
    });
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

  /** Select a room, preload devices/keys and select its first scene. */
  private async selectRoom(roomId: string): Promise<void> {
    this.roomId = roomId;
    const room: Room | undefined = await RoomDao.get(roomId);
    this.roomName = room !== undefined ? room.name : '';
    this.scenes = await SceneDao.listByRoom(roomId);
    this.devices = await DeviceDao.listByRoom(roomId);
    this.roomKeys = [];
    for (let i = 0; i < this.devices.length; i++) {
      const keys: RoomKey[] = await KeyDao.listByDevice(this.devices[i].id);
      for (let j = 0; j < keys.length; j++) {
        this.roomKeys.push(keys[j]);
      }
    }
    this.selectedSceneId = '';
    this.steps = [];
    this.validationText = '';
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
    this.sceneNameInput = this.sceneName(sceneId);
    this.steps = await SceneStepDao.listByScene(sceneId);
  }

  /** Create a new scene with a localized default name. */
  private async createScene(): Promise<void> {
    if (this.roomId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_room_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const scene: Scene = new Scene();
      scene.id = util.generateRandomUUID(true);
      scene.roomId = this.roomId;
      scene.name = StringResources.get($r('app.string.msg_new_scene_name'));
      scene.icon = '';
      scene.sortOrder = this.scenes.length;
      await SceneDao.insert(scene);
      this.scenes = await SceneDao.listByRoom(this.roomId);
      await this.selectScene(scene.id);
      this.statusText = StringResources.get($r('app.string.msg_scene_created'));
    });
  }

  /** Rename the selected scene after validating the input. */
  private async renameScene(): Promise<void> {
    const name: string = this.sceneNameInput.trim();
    if (this.selectedSceneId.length === 0 || name.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_scene_and_name'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const scene: Scene | undefined = await SceneDao.get(this.selectedSceneId);
      if (scene === undefined) {
        this.statusText = StringResources.get($r('app.string.msg_scene_not_exist'));
        return;
      }
      scene.name = name;
      await SceneDao.update(scene);
      this.scenes = await SceneDao.listByRoom(this.roomId);
      this.statusText = StringResources.get($r('app.string.msg_scene_name_saved'));
    });
  }

  /** Delete a scene; falls back to its first remaining scene. */
  private async deleteScene(sceneId: string): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      await SceneDao.remove(sceneId);
      this.scenes = await SceneDao.listByRoom(this.roomId);
      this.selectedSceneId = '';
      this.steps = [];
      this.validationText = '';
      if (this.scenes.length > 0) {
        await this.selectScene(this.scenes[0].id);
      }
      this.statusText = StringResources.get($r('app.string.msg_scene_deleted'));
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
      this.validationText = '';
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

  /** Change a step delay, clamped to the configured min/max bounds. */
  private async changeDelay(index: number, delta: number): Promise<void> {
    if (index < 0 || index >= this.steps.length) {
      return;
    }
    let next: number = this.steps[index].delayMs + delta;
    if (next < AppConstants.MIN_STEP_INTERVAL_MS) {
      next = AppConstants.MIN_STEP_INTERVAL_MS;
    }
    if (next > AppConstants.MAX_STEP_INTERVAL_MS) {
      next = AppConstants.MAX_STEP_INTERVAL_MS;
    }
    await this.runAction(async (): Promise<void> => {
      const updated: SceneStep[] = this.steps.slice();
      updated[index].delayMs = next;
      await SceneStepDao.replaceForScene(this.selectedSceneId, updated);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
    });
  }

  /** Saves the steps and validates them; missing devices and keys are listed on the page. */
  private async saveAndValidate(): Promise<void> {
    if (this.selectedSceneId.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_scene_first'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      for (let i = 0; i < this.steps.length; i++) {
        this.steps[i].order = i;
      }
      await SceneStepDao.replaceForScene(this.selectedSceneId, this.steps);
      this.steps = await SceneStepDao.listByScene(this.selectedSceneId);
      const validation: SceneValidation = await SceneValidator.validate(this.selectedSceneId);
      if (validation.valid) {
        this.validationText = StringResources.get($r('app.string.msg_validation_passed'));
        this.statusText = StringResources.get($r('app.string.msg_scene_saved'));
        return;
      }
      this.validationText = validation.messages.length > 0 ?
        validation.messages.join('; ') : StringResources.get($r('app.string.msg_scene_invalid'));
      this.statusText = StringResources.get($r('app.string.msg_scene_saved_with_issues'));
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

  /** Resolve a scene name by id; falls back to an empty string. */
  private sceneName(sceneId: string): string {
    for (let i = 0; i < this.scenes.length; i++) {
      if (this.scenes[i].id === sceneId) {
        return this.scenes[i].name;
      }
    }
    return '';
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
      return $r('app.string.tablet_select_device_first');
    }
    return this.devices[this.addDeviceIndex].name;
  }

  /** Display value of the key selector. */
  private keyValue(): ResourceStr {
    const keys: RoomKey[] = this.addKeys();
    if (keys.length === 0 || this.addKeyIndex >= keys.length) {
      return $r('app.string.tablet_select_key');
    }
    return keys[this.addKeyIndex].label;
  }

  /** Build the page: header, scenes and step editor sections. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.tablet_back'))
              .id('id_oen_back')
              .height(HEADER_BTN_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.tablet_scene_editor'))
              .id('id_oen_title')
              .layoutWeight(1)
              .fontSize($r('app.float.title_font'))
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
            Text(this.roomName)
              .id('id_oen_room_name')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }
          .id('id_oen_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.statusText.length > 0) {
            Text(this.statusText)
              .id('id_oen_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_scenes_title'))
              .id('id_oen_scenes_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))

            if (this.scenes.length === 0) {
              Text($r('app.string.tablet_no_scenes'))
                .id('id_oen_scenes_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            // Two-column adaptive grid: each scene row spans half of a
            // 12-column grid row, so the wide tablet screen shows two scenes
            // per row while the row content and all component ids stay
            // unchanged. Spacing reuses the shared inner-gap constant.
            GridRow({ columns: GRID_COLUMNS, gutter: INNER_GAP_VP }) {
              Repeat<Scene>(this.scenes)
                .each((item: RepeatItem<Scene>) => {
                  GridCol({ span: SCENE_ROW_SPAN }) {
                    Row({ space: INNER_GAP_VP }) {
                      Text(item.item.name)
                        .id(`id_oen_name_${item.item.id}`)
                        .layoutWeight(1)
                        .fontSize($r('app.float.body_font'))
                        .fontColor(this.selectedSceneId === item.item.id ?
                          $r('app.color.accent') : $r('app.color.text_primary'))
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                      Button($r('app.string.tablet_select'))
                        .id(`id_oen_select_${item.item.id}`)
                        .height(ROW_BTN_HEIGHT_VP)
                        .fontSize($r('app.float.caption_font'))
                        .fontColor($r('app.color.accent'))
                        .backgroundColor(Color.Transparent)
                        .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                        .borderRadius($r('app.float.card_radius'))
                        .onClick(() => {
                          this.runAction(async (): Promise<void> => {
                            await this.selectScene(item.item.id);
                          });
                        })
                      Button($r('app.string.tablet_delete'))
                        .id(`id_oen_delete_${item.item.id}`)
                        .height(ROW_BTN_HEIGHT_VP)
                        .fontSize($r('app.float.caption_font'))
                        .fontColor($r('app.color.danger'))
                        .backgroundColor(Color.Transparent)
                        .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                        .borderRadius($r('app.float.card_radius'))
                        .onClick(() => {
                          this.deleteScene(item.item.id);
                        })
                    }
                    .id(`id_oen_row_${item.item.id}`)
                    .width('100%')
                    .padding({ top: ROW_PAD_TIGHT_VP, bottom: ROW_PAD_TIGHT_VP })
                    .alignItems(VerticalAlign.Center)
                  }
                })
                .key((item: Scene): string => item.id)
            }
            .id('id_oen_scene_grid')
            .width('100%')

            // The rename/new-scene form row stays single-column: a text input
            // with two buttons does not benefit from a two-column split.
            Row({ space: INNER_GAP_VP }) {
              TextInput({ placeholder: $r('app.string.tablet_scene_name_hint'), text: this.sceneNameInput })
                .id('id_oen_name_input')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.sceneNameInput = value;
                })
              Button($r('app.string.tablet_rename'))
                .id('id_oen_rename')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.accent'))
                .backgroundColor(Color.Transparent)
                .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.renameScene();
                })
              Button($r('app.string.tablet_new_scene'))
                .id('id_oen_new')
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.createScene();
                })
            }
            .id('id_oen_name_row')
            .width('100%')
          }
          .id('id_oen_scenes_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_steps_title'))
              .id('id_oen_steps_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))

            if (this.steps.length === 0) {
              Text($r('app.string.tablet_no_steps'))
                .id('id_oen_steps_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            // The step list stays single-column on purpose: steps form an
            // ordered execution flow (numbering, move up/down) and their wide
            // action-chip row would overflow a half-width grid cell.
            Repeat<SceneStep>(this.steps)
              .each((item: RepeatItem<SceneStep>) => {
                Column({ space: STEP_GAP_VP }) {
                  Row({ space: INNER_GAP_VP }) {
                    Text($r('app.string.tablet_step_no', item.index + 1))
                      .id(`id_oen_step_no_${item.item.id}`)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_secondary'))
                    Text(this.deviceName(item.item.deviceId))
                      .id(`id_oen_step_device_${item.item.id}`)
                      .layoutWeight(1)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_primary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(this.keyLabel(item.item.keyId))
                      .id(`id_oen_step_key_${item.item.id}`)
                      .layoutWeight(1)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_primary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text($r('app.string.tablet_step_delay', item.item.delayMs))
                      .id(`id_oen_step_delay_${item.item.id}`)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.text_secondary'))
                  }
                  .id(`id_oen_step_line_${item.item.id}`)
                  .width('100%')
                  .alignItems(VerticalAlign.Center)

                  Row({ space: CHIP_GAP_VP }) {
                    Button(item.item.enabled ? $r('app.string.tablet_step_enabled') :
                      $r('app.string.tablet_step_disabled'))
                      .id(`id_oen_step_toggle_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor(item.item.enabled ? $r('app.color.success') : $r('app.color.text_secondary'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.toggleStep(item.index);
                      })
                    Button($r('app.string.tablet_delay_minus'))
                      .id(`id_oen_step_minus_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.changeDelay(item.index, -DELAY_STEP_MS);
                      })
                    Button($r('app.string.tablet_delay_plus'))
                      .id(`id_oen_step_plus_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.changeDelay(item.index, DELAY_STEP_MS);
                      })
                    Button($r('app.string.tablet_move_up'))
                      .id(`id_oen_step_up_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.moveStep(item.index, -1);
                      })
                    Button($r('app.string.tablet_move_down'))
                      .id(`id_oen_step_down_${item.item.id}`)
                      .height(STEP_BTN_HEIGHT_VP)
                      .fontSize($r('app.float.caption_font'))
                      .fontColor($r('app.color.accent'))
                      .backgroundColor(Color.Transparent)
                      .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                      .borderRadius(STEP_RADIUS_VP)
                      .onClick(() => {
                        this.moveStep(item.index, 1);
                      })
                    Button($r('app.string.tablet_delete'))
                      .id(`id_oen_step_remove_${item.item.id}`)
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
                  .id(`id_oen_step_actions_${item.item.id}`)
                  .width('100%')
                }
                .id(`id_oen_step_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_VP, bottom: ROW_PAD_VP })
              })
              .key((item: SceneStep): string => item.id)

            // The add-step area is a form (two selects plus action buttons),
            // so it keeps a single column: forms are not suitable for two
            // columns and the selects must stay in selection order.
            Select(this.deviceOptions())
              .id('id_oen_device_select')
              .selected(this.addDeviceIndex)
              .value(this.deviceValue())
              .width('100%')
              .onSelect((index: number) => {
                this.addDeviceIndex = index;
                this.addKeyIndex = 0;
              })

            Select(this.keyOptions())
              .id('id_oen_key_select')
              .selected(this.addKeyIndex)
              .value(this.keyValue())
              .width('100%')
              .onSelect((index: number) => {
                this.addKeyIndex = index;
              })

            Row({ space: INNER_GAP_VP }) {
              Button($r('app.string.tablet_add_step'))
                .id('id_oen_add_step')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.addStep();
                })
              Button($r('app.string.tablet_save_and_validate'))
                .id('id_oen_save_validate')
                .layoutWeight(1)
                .height(CONTROL_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.accent'))
                .backgroundColor(Color.Transparent)
                .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.saveAndValidate();
                })
            }
            .id('id_oen_step_action_row')
            .width('100%')

            if (this.validationText.length > 0) {
              Text(this.validationText)
                .id('id_oen_validation')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }
          }
          .id('id_oen_steps_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_oen_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_oen_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_oen_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
