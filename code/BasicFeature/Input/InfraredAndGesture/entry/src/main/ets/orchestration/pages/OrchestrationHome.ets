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
import { StringResources } from 'common';
import { OrchestrationViewModel, RoomSummary } from '../viewmodel/OrchestrationViewModel';

/** Route parameter passed to the room configuration page. */
interface RoomParam {
  roomId: string;
}

/** Vertical gap between the title/notice/rooms sections. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Gap between a room row and its note line. */
const NOTE_GAP_VP: string = '4vp';
/** Vertical padding of room list rows. */
const ROW_PAD_VP: string = '6vp';
/** Height of the per-room enter button. */
const ENTER_BTN_HEIGHT_VP: string = '30vp';
/** Height of the config transfer button. */
const TRANSFER_BTN_HEIGHT_VP: string = '36vp';
/** Height of the new-room input and button. */
const INPUT_HEIGHT_VP: string = '40vp';
/** Hairline border width of the outlined transfer button. */
const BORDER_WIDTH_VP: string = '1vp';
/** Total columns of the adaptive grid row used by the room card list. */
const GRID_COLUMNS: number = 12;
/** Span of one room card: half of the grid row, two cards share a row. */
const ROOM_CARD_SPAN: number = 6;

/**
 * Tablet-side orchestration home page.
 * Lists rooms with device/scene counts and provides room creation and transfer entry.
 */
@Entry
@ComponentV2
struct OrchestrationHome {
  @Local vm: OrchestrationViewModel = new OrchestrationViewModel();
  @Local newRoomName: string = '';

  /** Refresh the room list every time the page becomes visible again. */
  onPageShow(): void {
    this.refresh();
  }

  /** Reload rooms from the view model. */
  private async refresh(): Promise<void> {
    await this.vm.loadRooms();
  }

  /** Create a room with the entered name; clears the input on success. */
  private async createRoom(): Promise<void> {
    const name: string = this.newRoomName.trim();
    if (name.length === 0) {
      this.vm.statusText = StringResources.get($r('app.string.msg_room_name_required'));
      return;
    }
    const ok: boolean = await this.vm.createRoom(name);
    if (ok) {
      this.newRoomName = '';
    }
  }

  /** Navigate to the room configuration page for the given room. */
  private openRoom(roomId: string): void {
    const param: RoomParam = { roomId: roomId };
    router.pushUrl({ url: 'orchestration/pages/RoomConfigPage', params: param });
  }

  /** Navigate to the configuration package transfer page. */
  private openTransfer(): void {
    router.pushUrl({ url: 'orchestration/pages/ConfigTransferPage' });
  }

  /** Build the page: title, read-only notice and room list sections. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Text($r('app.string.tablet_app_title'))
            .id('id_index_title')
            .width('100%')
            .fontSize($r('app.float.title_font'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))

          Row({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_read_only_notice'))
              .id('id_index_notice')
              .layoutWeight(1)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
            Button($r('app.string.tablet_config_transfer'))
              .id('id_index_transfer')
              .height(TRANSFER_BTN_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor(Color.Transparent)
              .border({ width: BORDER_WIDTH_VP, color: $r('app.color.border') })
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                this.openTransfer();
              })
          }
          .id('id_index_notice_row')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
          .alignItems(VerticalAlign.Center)

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.tablet_rooms_title'))
              .id('id_index_rooms_title')
              .width('100%')
              .fontSize($r('app.float.body_font'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))

            if (this.vm.rooms.length === 0) {
              Text($r('app.string.tablet_room_list_empty'))
                .id('id_index_rooms_empty')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }

            // Two-column adaptive grid: each room card spans half of a
            // 12-column grid row, so the wide tablet screen shows two rooms
            // per row while the card content and all component ids stay
            // unchanged. Spacing reuses the shared inner-gap constant.
            GridRow({ columns: GRID_COLUMNS, gutter: INNER_GAP_VP }) {
              Repeat<RoomSummary>(this.vm.rooms)
                .each((item: RepeatItem<RoomSummary>) => {
                  GridCol({ span: ROOM_CARD_SPAN }) {
                    Column({ space: NOTE_GAP_VP }) {
                      Row({ space: INNER_GAP_VP }) {
                        Text(item.item.room.name)
                          .id(`id_index_room_name_${item.item.room.id}`)
                          .layoutWeight(1)
                          .fontSize($r('app.float.body_font'))
                          .fontColor($r('app.color.text_primary'))
                          .maxLines(1)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                        Text($r('app.string.tablet_device_count', item.item.deviceCount))
                          .id(`id_index_room_devices_${item.item.room.id}`)
                          .fontSize($r('app.float.caption_font'))
                          .fontColor($r('app.color.text_secondary'))
                        Text($r('app.string.tablet_scene_count', item.item.sceneCount))
                          .id(`id_index_room_scenes_${item.item.room.id}`)
                          .fontSize($r('app.float.caption_font'))
                          .fontColor($r('app.color.text_secondary'))
                        Button($r('app.string.tablet_enter_room'))
                          .id(`id_index_room_enter_${item.item.room.id}`)
                          .height(ENTER_BTN_HEIGHT_VP)
                          .fontSize($r('app.float.caption_font'))
                          .fontColor(Color.White)
                          .backgroundColor($r('app.color.accent'))
                          .borderRadius($r('app.float.card_radius'))
                          .onClick(() => {
                            this.openRoom(item.item.room.id);
                          })
                      }
                      .id(`id_index_room_line_${item.item.room.id}`)
                      .width('100%')
                      .alignItems(VerticalAlign.Center)

                      if (item.item.room.note.length > 0) {
                        Text(item.item.room.note)
                          .id(`id_index_room_note_${item.item.room.id}`)
                          .width('100%')
                          .fontSize($r('app.float.caption_font'))
                          .fontColor($r('app.color.text_secondary'))
                      }
                    }
                    .id(`id_index_room_${item.item.room.id}`)
                    .width('100%')
                    .padding({ top: ROW_PAD_VP, bottom: ROW_PAD_VP })
                  }
                })
                .key((item: RoomSummary): string => item.room.id)
            }
            .id('id_index_rooms_grid')
            .width('100%')

            // The new-room form row stays single-column: a text input paired
            // with one button does not benefit from a two-column split.
            Row({ space: INNER_GAP_VP }) {
              TextInput({ placeholder: $r('app.string.tablet_new_room_hint'), text: this.newRoomName })
                .id('id_index_new_room_input')
                .layoutWeight(1)
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .onChange((value: string) => {
                  this.newRoomName = value;
                })
              Button($r('app.string.tablet_create_room'))
                .id('id_index_create_room')
                .height(INPUT_HEIGHT_VP)
                .fontSize($r('app.float.caption_font'))
                .fontColor(Color.White)
                .backgroundColor($r('app.color.accent'))
                .borderRadius($r('app.float.card_radius'))
                .onClick(() => {
                  this.createRoom();
                })
            }
            .id('id_index_new_room_row')
            .width('100%')

            if (this.vm.statusText.length > 0) {
              Text(this.vm.statusText)
                .id('id_index_status')
                .width('100%')
                .fontSize($r('app.float.caption_font'))
                .fontColor($r('app.color.text_secondary'))
            }
          }
          .id('id_index_rooms_section')
          .width('100%')
          .padding($r('app.float.page_padding'))
          .backgroundColor($r('app.color.bg_card'))
          .borderRadius($r('app.float.card_radius'))
        }
        .id('id_index_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_index_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_orch_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
