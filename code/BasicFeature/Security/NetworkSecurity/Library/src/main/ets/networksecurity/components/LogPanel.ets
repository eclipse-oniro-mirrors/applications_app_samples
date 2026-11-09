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

import { LogEntry } from '../model/LogTypes';

/**
 * Reusable log panel that renders the latest entries and a clear action.
 */
@ComponentV2
export struct LogPanel {
  // Prefix used to build the accessibility ids of the inner components.
  @Param idPrefix: string = 'id_log';
  // Log entries to render, newest first.
  @Param logs: LogEntry[] = [];
  // Event raised when the user presses the clear button.
  @Event onClear: () => void = () => {
  };

  /**
   * Pick the text color for one log entry by its level.
   * @param level log level of the entry.
   * @returns the color resource matching the level.
   */
  private levelColor(level: string): ResourceColor {
    // Error entries use the danger color.
    if (level === 'error') {
      return $r('app.color.danger');
    }
    // Warning entries use the warning color.
    if (level === 'warn') {
      return $r('app.color.warning');
    }
    // Every other level uses the secondary text color.
    return $r('app.color.text_secondary');
  }

  /**
   * Build the panel with the header row and the log list or empty hint.
   */
  build() {
    Column({ space: 8 }) {
      Row() {
        Text($r('app.string.ns_section_log_title'))
          .id(this.idPrefix + '_title')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        Blank()
        Button($r('app.string.ns_log_clear'))
          .id(this.idPrefix + '_clear')
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .padding({ left: 16, right: 16 })
          .onClick(() => {
            // Ask the caller to clear the log list.
            this.onClear();
          })
      }
      .id(this.idPrefix + '_header')
      .width('100%')
      .height($r('app.float.control_height'))

      // Show the empty hint when there is no entry yet.
      if (this.logs.length === 0) {
        Text($r('app.string.ns_log_empty'))
          .id(this.idPrefix + '_empty')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      } else {
        List({ space: 8 }) {
          Repeat<LogEntry>(this.logs)
            .each((repeatItem: RepeatItem<LogEntry>) => {
              ListItem() {
                Row({ space: 8 }) {
                  // Show the record time in a compact font.
                  Text(repeatItem.item.time)
                    .id(this.idPrefix + '_time_' + repeatItem.item.id.toString())
                    .fontSize(12)
                    .fontColor($r('app.color.text_tertiary'))
                  Text(repeatItem.item.tag)
                    .id(this.idPrefix + '_tag_' + repeatItem.item.id.toString())
                    .fontSize(12)
                    .fontColor($r('app.color.brand_primary'))
                  Text(repeatItem.item.text)
                    .id(this.idPrefix + '_text_' + repeatItem.item.id.toString())
                    .fontSize(14)
                    .fontColor(this.levelColor(repeatItem.item.level))
                    .layoutWeight(1)
                    .maxLines(3)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .id(this.idPrefix + '_item_row_' + repeatItem.item.id.toString())
                .width('100%')
                .padding({ top: 4, bottom: 4 })
                .alignItems(VerticalAlign.Top)
              }
            })
            .key((item: LogEntry) => item.id.toString())
        }
        .id(this.idPrefix + '_list')
        .width('100%')
        .constraintSize({ maxHeight: 220 })
        .divider({ strokeWidth: 0.5, color: $r('app.color.divider') })
        .scrollBar(BarState.Off)
      }
    }
    .id(this.idPrefix + '_panel')
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }
}
