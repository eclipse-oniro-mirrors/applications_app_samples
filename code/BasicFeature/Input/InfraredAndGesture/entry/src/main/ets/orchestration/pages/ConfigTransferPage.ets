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
  ConfigExportResult,
  ConfigImportReport,
  ConfigPackageService,
  Room,
  RoomDao
} from 'room';

const SCOPE: string = 'TabletConfigTransfer';
/** Vertical gap between the header/export/import sections. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Height of the back button in the page header. */
const BACK_HEIGHT_VP: string = '34vp';
/** Height of the per-room select toggle button. */
const ROW_BTN_HEIGHT_VP: string = '30vp';
/** Standard height for the path input and main action buttons. */
const CONTROL_HEIGHT_VP: string = '40vp';
/** Hairline border width of the unselected toggle buttons. */
const BORDER_WIDTH_VP: string = '1vp';
/** Vertical padding of room list rows. */
const ROW_PAD_VP: string = '4vp';

/**
 * Tablet-side configuration package transfer page.
 * Exports selected rooms into a package file and imports packages back into the app.
 */
@Entry
@ComponentV2
struct ConfigTransferPage {
  @Local rooms: Room[] = [];
  @Local selectedRoomIds: string[] = [];
  @Local exportPath: string = '';
  @Local exportSummary: string = '';
  @Local importPath: string = '';
  @Local importSummary: string = '';
  @Local failedItems: string[] = [];
  @Local statusText: string = '';

  /** Kick off the initial room load when the page appears. */
  aboutToAppear(): void {
    this.loadRooms();
  }

  /** Refresh the exportable room list. */
  private async loadRooms(): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      this.rooms = await RoomDao.list();
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

  /** True when the room id is part of the current export selection. */
  private isSelected(roomId: string): boolean {
    return this.selectedRoomIds.indexOf(roomId) >= 0;
  }

  /** Toggle the selection state of one room (immutable list update). */
  private toggleRoom(roomId: string): void {
    const next: string[] = this.selectedRoomIds.slice();
    const index: number = next.indexOf(roomId);
    if (index >= 0) {
      next.splice(index, 1);
    } else {
      next.push(roomId);
    }
    this.selectedRoomIds = next;
  }

  /** Export the selected rooms into a configuration package. */
  private async exportPackage(): Promise<void> {
    if (this.selectedRoomIds.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_select_at_least_one_room'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const result: ConfigExportResult = await ConfigPackageService.export(this.selectedRoomIds);
      this.exportPath = result.ok ? result.filePath : '';
      this.exportSummary = result.ok ?
        StringResources.format($r('app.string.msg_export_summary'),
          result.roomCount, result.deviceCount) :
        result.message;
      this.statusText = result.message;
    });
  }

  /** Import a configuration package from the entered file path. */
  private async importPackage(): Promise<void> {
    const path: string = this.importPath.trim();
    if (path.length === 0) {
      this.statusText = StringResources.get($r('app.string.msg_enter_config_path'));
      return;
    }
    await this.runAction(async (): Promise<void> => {
      const report: ConfigImportReport = await ConfigPackageService.import(path);
      this.failedItems = report.failedItems;
      this.importSummary = report.ok ?
        StringResources.format($r('app.string.msg_import_summary_dots'),
          report.importedRooms, report.importedDevices, report.importedKeys,
          report.importedScenes) :
        report.message;
      this.statusText = report.backupPath.length > 0 ?
        StringResources.format($r('app.string.msg_import_backup_suffix'), report.message) :
        report.message;
      if (report.ok) {
        this.selectedRoomIds = [];
        this.exportPath = '';
        this.exportSummary = '';
        await this.loadRooms();
      }
    });
  }

  /** Build the page: header, export section and import section. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.tablet_back'))
              .id('id_xfer_back')
              .height(BACK_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.tablet_config_transfer_title'))
              .id('id_xfer_title')
              .layoutWeight(1)
              .fontSize($r('app.float.title_font'))
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
          }
          .id('id_xfer_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.statusText.length > 0) {
            Text(this.statusText)
              .id('id_xfer_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_export_title'))
              .id('id_xfer_export_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))
            Text($r('app.string.tablet_export_hint'))
              .id('id_xfer_export_hint')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))

            Repeat<Room>(this.rooms)
              .each((item: RepeatItem<Room>) => {
                Row({ space: INNER_GAP_VP }) {
                  Text(item.item.name)
                    .id(`id_xfer_room_name_${item.item.id}`)
                    .layoutWeight(1)
                    .fontSize($r('app.float.body_font'))
                    .fontColor($r('app.color.text_primary'))
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Button(this.isSelected(item.item.id) ?
                    $r('app.string.tablet_selected') : $r('app.string.tablet_select'))
                    .id(`id_xfer_room_toggle_${item.item.id}`)
                    .height(ROW_BTN_HEIGHT_VP)
                    .fontSize($r('app.float.caption_font'))
                    .fontColor(this.isSelected(item.item.id) ?
                      Color.White : $r('app.color.accent'))
                    .backgroundColor(this.isSelected(item.item.id) ?
                      $r('app.color.accent') : Color.Transparent)
                    .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
                    .borderRadius($r('app.float.card_radius'))
                    .onClick(() => {
                      this.toggleRoom(item.item.id);
                    })
                }
                .id(`id_xfer_room_row_${item.item.id}`)
                .width('100%')
                .padding({ top: ROW_PAD_VP, bottom: ROW_PAD_VP })
                .alignItems(VerticalAlign.Center)
              })
              .key((item: Room): string => item.id)

            Button($r('app.string.tablet_export'))
              .id('id_xfer_export_button')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.exportPackage();
              })

            if (this.exportPath.length > 0) {
              Text(this.exportPath)
                .id('id_xfer_export_path')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
                .copyOption(CopyOptions.LocalDevice)
            }

            if (this.exportSummary.length > 0) {
              Text(this.exportSummary)
                .id('id_xfer_export_summary')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }
          }
          .id('id_xfer_export_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_import_title'))
              .id('id_xfer_import_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))
            Text($r('app.string.tablet_import_warning'))
              .id('id_xfer_import_warning')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
            TextInput({ placeholder: $r('app.string.tablet_import_hint'), text: this.importPath })
              .id('id_xfer_import_input')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .onChange((value: string) => {
                this.importPath = value;
              })
            Button($r('app.string.tablet_import'))
              .id('id_xfer_import_button')
              .height(CONTROL_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.importPackage();
              })

            if (this.importSummary.length > 0) {
              Text(this.importSummary)
                .id('id_xfer_import_summary')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            if (this.failedItems.length > 0) {
              Text($r('app.string.tablet_import_failed_title'))
                .id('id_xfer_failed_title')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.danger'))
              Repeat<string>(this.failedItems)
                .each((item: RepeatItem<string>) => {
                  Text(item.item)
                    .id(`id_xfer_failed_${item.index}`)
                    .width('100%')
                    .fontSize($r('app.float.caption_font'))
                    .fontColor($r('app.color.danger'))
                })
                .key((item: string, index: number): string => `${index.toString()}${item}`)
            }
          }
          .id('id_xfer_import_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_xfer_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_xfer_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_xfer_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
