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
import {
  ChipTone,
  EmptyState,
  Formatter,
  HistoryAction,
  HistoryEntry,
  SectionCard,
  StatusChip
} from 'library';
import {
  HISTORY_FILTER_ALL,
  HISTORY_FILTER_EXPORT,
  HISTORY_FILTER_IMPORT,
  HistoryViewModel
} from '../viewmodel/HistoryViewModel';

@ComponentV2
export struct HistoryPage {
  @Param refreshToken: number = 0;
  @Local vm: HistoryViewModel = new HistoryViewModel();

  aboutToAppear(): void {
    const context: common.Context = this.getUIContext().getHostContext() as common.Context;
    this.vm.init(context);
  }

  @Monitor('refreshToken')
  onRefreshTokenChanged(monitor: IMonitor): void {
    this.vm.load();
  }

  build() {
    Column({ space: 12 }) {
      this.header()
      this.statsCard()
      this.filterRow()
      this.listArea()
    }
    .id('id_history_root')
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 12 })
    .backgroundColor($r('app.color.page_bg'))
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  header(): void {
    Row({ space: 8 }) {
      Column({ space: 4 }) {
        Text($r('app.string.vc_history_title'))
          .id('id_history_page_title')
          .fontSize('22fp')
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        Text($r('app.string.vc_history_subtitle'))
          .id('id_history_page_subtitle')
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .lineHeight('18fp')
          .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Button($r('app.string.vc_action_clear'))
        .id('id_history_clear')
        .height(32)
        .fontSize('12fp')
        .fontColor($r('app.color.danger'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(16)
        .padding({ left: 14, right: 14 })
        .onClick(() => {
          this.confirmClear();
        })
    }
    .id('id_history_header')
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  statsCard(): void {
    SectionCard({
      idPrefix: 'id_history_stats',
      title: $r('app.string.vc_history_section_stats')
    }) {
      Row({ space: 4 }) {
        this.statItem('id_history_stat_total', this.vm.stats.total, $r('app.string.vc_history_stat_total'))
        this.statItem('id_history_stat_import', this.vm.stats.importCount,
          $r('app.string.vc_history_stat_import'))
        this.statItem('id_history_stat_export', this.vm.stats.exportCount,
          $r('app.string.vc_history_stat_export'))
        this.statItem('id_history_stat_contact', this.vm.stats.contactCount,
          $r('app.string.vc_history_filter_contact'))
        this.statItem('id_history_stat_success', this.vm.stats.successCount,
          $r('app.string.vc_history_stat_success'))
      }
      .id('id_history_stats_row')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }

  @Builder
  statItem(idValue: string, value: number, label: ResourceStr): void {
    Column({ space: 2 }) {
      Text(value.toString())
        .id(idValue)
        .fontSize('18fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
      Text(label)
        .id(idValue + '_label')
        .fontSize('11fp')
        .fontColor($r('app.color.text_secondary'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .id(idValue + '_item')
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  filterRow(): void {
    Row({ space: 8 }) {
      this.filterChip('id_history_filter_all', $r('app.string.vc_history_filter_all'), HISTORY_FILTER_ALL)
      this.filterChip('id_history_filter_import', $r('app.string.vc_history_filter_import'),
        HISTORY_FILTER_IMPORT)
      this.filterChip('id_history_filter_export', $r('app.string.vc_history_filter_export'),
        HISTORY_FILTER_EXPORT)
    }
    .id('id_history_filter_row')
    .width('100%')
  }

  @Builder
  filterChip(idValue: string, label: ResourceStr, value: number): void {
    Text(label)
      .id(idValue)
      .fontSize('14fp')
      .fontColor(this.vm.filter === value ? $r('app.color.brand_primary') : $r('app.color.text_secondary'))
      .backgroundColor(this.vm.filter === value ? $r('app.color.brand_light') : $r('app.color.card_bg'))
      .borderRadius(16)
      .padding({ left: 16, right: 16, top: 7, bottom: 7 })
      .onClick(() => {
        this.vm.setFilter(value);
      })
  }

  @Builder
  listArea(): void {
    List({ space: 8 }) {
      if (this.vm.loaded && this.vm.visibleEntries.length === 0) {
        ListItem() {
          Column() {
            EmptyState({
              idPrefix: 'id_history_empty_state',
              title: $r('app.string.vc_history_empty'),
              description: $r('app.string.vc_history_empty_desc')
            })
          }
          .id('id_history_empty')
          .width('100%')
        }
      } else {
        Repeat<HistoryEntry>(this.vm.visibleEntries)
          .each((repeatItem: RepeatItem<HistoryEntry>) => {
            ListItem() {
              this.recordItem(repeatItem.item, repeatItem.index)
            }
          })
          .key((item: HistoryEntry, index: number) => item.id.length > 0 ? item.id :
            item.timestamp.toString() + '_' + item.action.toString() + '_' + index.toString())
      }
    }
    .id('id_history_list')
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Auto)
    .padding({ bottom: 16 })
  }

  @Builder
  recordItem(item: HistoryEntry, index: number): void {
    Row({ space: 12 }) {
      Column({ space: 4 }) {
        Row({ space: 6 }) {
          Text(this.actionText(item.action))
            .id('id_history_action_' + index)
            .fontSize('15fp')
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary'))
          StatusChip({
            idValue: 'id_history_state_' + index,
            text: item.success ? $r('app.string.vc_status_success') : $r('app.string.vc_status_failed'),
            tone: item.success ? ChipTone.SUCCESS : ChipTone.DANGER
          })
        }
        .id('id_history_title_row_' + index)
        .alignItems(VerticalAlign.Center)

        if (item.target.length > 0) {
          Text($r('app.string.vc_history_record_target', item.target))
            .id('id_history_target_' + index)
            .fontSize('12fp')
            .fontColor($r('app.color.text_secondary'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
        }
        Text($r('app.string.vc_history_record_cards', item.cardCount))
          .id('id_history_cards_' + index)
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        if (!item.success) {
          Text($r('app.string.vc_history_record_code', item.code))
            .id('id_history_code_' + index)
            .fontSize('12fp')
            .fontColor($r('app.color.danger'))
            .width('100%')
        }
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Text(Formatter.time(item.timestamp))
        .id('id_history_time_' + index)
        .fontSize('11fp')
        .fontColor($r('app.color.text_tertiary'))
        .maxLines(1)
        .textAlign(TextAlign.End)
    }
    .id('id_history_item_' + index)
    .width('100%')
    .padding(12)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(12)
    .alignItems(VerticalAlign.Top)
  }

  private actionText(action: number): ResourceStr {
    if (action === HistoryAction.EXPORT) {
      return $r('app.string.vc_history_action_export');
    }
    if (action === HistoryAction.CREATE) {
      return $r('app.string.vc_history_action_create');
    }
    if (action === HistoryAction.UPDATE) {
      return $r('app.string.vc_history_action_update');
    }
    if (action === HistoryAction.DELETE) {
      return $r('app.string.vc_history_action_delete');
    }
    return $r('app.string.vc_history_action_import');
  }

  private toast(message: ResourceStr): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: $r('app.string.vc_history_clear_title'),
      message: $r('app.string.vc_history_clear_message'),
      autoCancel: true,
      primaryButton: {
        value: $r('app.string.vc_action_cancel'),
        action: () => {
        }
      },
      secondaryButton: {
        value: $r('app.string.vc_action_clear'),
        fontColor: $r('app.color.danger'),
        action: () => {
          this.clearHistory();
        }
      }
    });
  }

  private async clearHistory(): Promise<void> {
    const cleared: boolean = await this.vm.clear();
    if (cleared) {
      this.toast($r('app.string.vc_history_cleared'));
    }
  }
}
