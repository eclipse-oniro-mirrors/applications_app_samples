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

import { CheckInRecord, OPEN_END } from '../model/GeofenceTypes';
import { formatDateTime, formatDuration, formatTime } from '../utils/TimeUtil';

/**
 * History list item showing one check-in record with enter time, exit time and duration.
 * The item is purely presentational and receives the record from the parent page.
 */
@ComponentV2
export struct CheckInRecordItem {
  // Record displayed by this item, defaulting to an empty open record.
  @Param record: CheckInRecord = { id: 0, enterTime: 0, exitTime: OPEN_END, durationMs: 0 };

  /**
   * Check whether the record is still open and waiting for an exit event.
   * @returns true when the record has no exit time yet
   */
  private isOpen(): boolean {
    // A record carrying the open marker as exit time is treated as open.
    return this.record.exitTime === OPEN_END;
  }

  /**
   * Build the exit time text shown in the middle column.
   * @returns the formatted exit time, or a placeholder for open records
   */
  private exitText(): string {
    // Open records show a placeholder instead of an exit time.
    return this.isOpen() ? '--' : formatTime(this.record.exitTime);
  }

  /**
   * Build the item with the header row and the three value columns.
   * @returns the item component tree
   */
  build() {
    // Root column that stacks the header row above the value row.
    Column({ space: 12 }) {
      // Header row with the enter date on the left and the ongoing chip on the right.
      Row() {
        // Enter date and time as the item title.
        Text(formatDateTime(this.record.enterTime))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.gc_text_primary'))
        // Flexible spacer pushing the ongoing chip to the row end.
        Blank()
        // Show the ongoing chip only while the record has no exit time.
        if (this.isOpen()) {
          Text($r('app.string.gc_label_ongoing'))
            .fontSize(12)
            .fontColor($r('app.color.gc_brand_primary'))
            .backgroundColor($r('app.color.gc_brand_light'))
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(4)
        }
      }
      .width('100%')

      // Value row with the enter time, exit time and duration columns.
      Row({ space: 16 }) {
        // Left column with the enter time label and value.
        Column({ space: 4 }) {
          // Label of the enter time column.
          Text($r('app.string.gc_label_enter_time'))
            .fontSize(12)
            .fontColor($r('app.color.gc_text_tertiary'))
          // Formatted enter time value.
          Text(formatTime(this.record.enterTime))
            .fontSize(14)
            .fontColor($r('app.color.gc_text_primary'))
        }
        .alignItems(HorizontalAlign.Start)

        // Middle column with the exit time label and value.
        Column({ space: 4 }) {
          // Label of the exit time column.
          Text($r('app.string.gc_label_exit_time'))
            .fontSize(12)
            .fontColor($r('app.color.gc_text_tertiary'))
          // Formatted exit time or the open placeholder.
          Text(this.exitText())
            .fontSize(14)
            .fontColor($r('app.color.gc_text_primary'))
        }
        .alignItems(HorizontalAlign.Start)

        // Flexible spacer pushing the duration column to the row end.
        Blank()

        // Right column with the duration label and value.
        Column({ space: 4 }) {
          // Label of the duration column.
          Text($r('app.string.gc_label_duration'))
            .fontSize(12)
            .fontColor($r('app.color.gc_text_tertiary'))
          // Total stay duration formatted as hours, minutes and seconds.
          Text(formatDuration(this.record.durationMs))
            .fontSize(14)
            .fontColor($r('app.color.gc_text_primary'))
        }
        .alignItems(HorizontalAlign.End)
      }
      .width('100%')
    }
    .width('100%')
    // Card padding and background matching the list style.
    .padding(16)
    .backgroundColor($r('app.color.gc_card_bg'))
    .borderRadius(12)
  }
}
