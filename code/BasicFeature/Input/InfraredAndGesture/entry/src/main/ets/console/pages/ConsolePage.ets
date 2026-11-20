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
import { AppLogger } from 'common';
import {
  ConsoleViewModel,
  DeviceCard,
  DeviceView,
  ReadOnlyBanner,
  RunProgressPanel,
  SceneBar,
  SendResultToast
} from 'consoleui';
import { IrCapabilityProbe } from 'ircore';
import {
  PowerState,
  Scene,
  SceneDao
} from 'room';

const SCOPE: string = 'ConsolePage';
/** Vertical gap between major sections of the console page. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Tight spacing for the correction dialog content. */
const DIALOG_GAP_VP: string = '16vp';
/** Gap between the correction dialog confirm buttons. */
const DIALOG_BTN_GAP_VP: string = '12vp';
/** Top margin above the bottom navigation row. */
const NAV_MARGIN_TOP_VP: string = '4vp';
/** Standard height of navigation/confirm buttons. */
const BUTTON_HEIGHT_VP: string = '40vp';
/** Height of the smaller cancel button. */
const CANCEL_HEIGHT_VP: string = '36vp';
/** Inner padding of the correction dialog card. */
const CARD_PADDING_VP: string = '20vp';

/**
 * Phone-side console page.
 * Shows devices, scenes and run progress; read-only when no IR emitter exists.
 */
@Entry
@ComponentV2
struct ConsolePage {
  @Local vm: ConsoleViewModel = new ConsoleViewModel();
  @Local showCorrectPanel: boolean = false;
  @Local correctDeviceId: string = '';

  /** Prepare the read-only flag from the cached IR capability, then load data. */
  aboutToAppear(): void {
    this.vm.setReadOnly(!IrCapabilityProbe.getCached().hasEmitter);
    this.init();
  }

  /** Initialize the console view model; failures never block page rendering. */
  private async init(): Promise<void> {
    try {
      await this.vm.loadDefaultRoom();
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `Console initialization failed: ${detail}`);
    }
  }

  /** Record the device to correct and open the correction dialog. */
  private openCorrectPanel(deviceId: string): void {
    this.correctDeviceId = deviceId;
    this.showCorrectPanel = true;
  }

  /** Apply the expected power state chosen by the user, then close the dialog. */
  private async applyCorrection(power: PowerState): Promise<void> {
    try {
      await this.vm.correctExpected(this.correctDeviceId, power);
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `Failed to correct expected state: ${detail}`);
    }
    this.showCorrectPanel = false;
  }

  /** Resolve a device display name by id; falls back to the raw id. */
  private deviceNameById(deviceId: string): string {
    for (let i = 0; i < this.vm.devices.length; i++) {
      if (this.vm.devices[i].device.id === deviceId) {
        return this.vm.devices[i].device.name;
      }
    }
    return deviceId;
  }

  /** Navigate to a sub page by route url. */
  private openPage(url: string): void {
    router.pushUrl({ url: url });
  }

  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_console_title'))
              .id('id_console_title')
              .fontSize($r('app.float.title_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Text(this.vm.roomName.length > 0 ? this.vm.roomName : $r('app.string.phone_no_room'))
              .id('id_console_room')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .id('id_console_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.vm.readOnly) {
            ReadOnlyBanner()
          }

          if (this.vm.scenes.length > 0) {
            SceneBar({
              scenes: this.vm.scenes,
              running: this.vm.running,
              onRun: (sceneId: string): void => {
                this.vm.runSceneWithFeedback(sceneId);
              }
            })
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_devices_title'))
              .id('id_console_devices_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            if (this.vm.devices.length === 0) {
              Text($r('app.string.phone_no_devices'))
                .id('id_console_no_devices')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            }

            Repeat<DeviceView>(this.vm.devices)
              .each((item: RepeatItem<DeviceView>) => {
                DeviceCard({
                  device: item.item,
                  readOnly: this.vm.readOnly,
                  onResend: (deviceId: string): void => {
                    this.vm.resendDevice(deviceId);
                  },
                  onCorrect: (deviceId: string): void => {
                    this.openCorrectPanel(deviceId);
                  }
                })
              })
              .key((item: DeviceView): string => item.device.id)
          }
          .id('id_console_device_list')
          .width('100%')

          if (this.vm.steps.length > 0) {
            RunProgressPanel({
              steps: this.vm.steps,
              running: this.vm.running,
              failedIndexes: this.vm.failedIndexes,
              onRetryFailed: (): void => {
                this.vm.retryFailed(this.vm.lastRunId);
              }
            })
          }

          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.phone_room_config'))
              .id('id_nav_room_config')
              .layoutWeight(1)
              .height(BUTTON_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.openPage('console/pages/RoomConfigPage');
              })
            Button($r('app.string.phone_scene_editor'))
              .id('id_nav_scene_editor')
              .layoutWeight(1)
              .height(BUTTON_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.openPage('console/pages/SceneEditorPage');
              })
            Button($r('app.string.phone_settings'))
              .id('id_nav_settings')
              .layoutWeight(1)
              .height(BUTTON_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.openPage('console/pages/SettingsPage');
              })
          }
          .id('id_console_nav')
          .width('100%')
          .margin({ top: NAV_MARGIN_TOP_VP })
        }
        .id('id_console_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_console_scroll')
      .width('100%')
      .height('100%')

      if (this.showCorrectPanel) {
        Column() {
          Column({ space: DIALOG_GAP_VP }) {
            Text($r('app.string.phone_correct_title', this.deviceNameById(this.correctDeviceId)))
              .id('id_correct_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)

            Row({ space: DIALOG_BTN_GAP_VP }) {
              Button($r('app.string.phone_expect_on'))
                .id('id_correct_power_on')
                .layoutWeight(1)
                .height(BUTTON_HEIGHT_VP)
                .fontSize($r('app.float.body_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.success'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.applyCorrection(PowerState.ON);
                })
              Button($r('app.string.phone_expect_off'))
                .id('id_correct_power_off')
                .layoutWeight(1)
                .height(BUTTON_HEIGHT_VP)
                .fontSize($r('app.float.body_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.danger'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.applyCorrection(PowerState.OFF);
                })
            }
            .id('id_correct_actions')
            .width('100%')

            Button($r('app.string.phone_cancel'))
              .id('id_correct_cancel')
              .height(CANCEL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
              .backgroundColor(Color.Transparent)
              .onClick(() => {
                this.showCorrectPanel = false;
              })
          }
          .id('id_correct_card')
          .width('100%')
          .padding(CARD_PADDING_VP)
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_correct_panel')
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .padding($r('app.float.page_padding'))
        .backgroundColor($r('app.color.overlay'))
      }

      SendResultToast({
        visible: this.vm.toastVisible,
        text: this.vm.toastText
      })
    }
    .id('id_console_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
