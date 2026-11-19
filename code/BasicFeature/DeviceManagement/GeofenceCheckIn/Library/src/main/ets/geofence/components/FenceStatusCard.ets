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

import { DaySummary } from '../model/GeofenceTypes';
import { formatDuration } from '../utils/TimeUtil';

/**
 * Dashboard card showing the fence switch state and today's check-in summary.
 * The card is purely presentational and receives every value from the parent page.
 */
@ComponentV2
export struct FenceStatusCard {
  // Whether the geofence is currently enabled.
  @Param fenceEnabled: boolean = false;
  // Check-in count and total duration of the current day.
  @Param summary: DaySummary = { count: 0, durationMs: 0 };

  /**
   * Build the card with the status header row and the two summary columns.
   * @returns the card component tree
   */
  build() {
    // Root column that stacks the header row above the summary row.
    Column({ space: 16 }) {
      // Header row with the section label on the left and the state chip on the right.
      Row() {
        // Section label of the status card.
        Text($r('app.string.gc_label_status'))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.gc_text_primary'))
        // Flexible spacer pushing the state chip to the row end.
        Blank()
        // State chip that switches text and colors with the fence state.
        Text(this.fenceEnabled ? $r('app.string.gc_status_on') : $r('app.string.gc_status_off'))
          .fontSize(12)
          .fontColor(this.fenceEnabled ? $r('app.color.gc_brand_primary') : $r('app.color.gc_text_secondary'))
          .backgroundColor(this.fenceEnabled ? $r('app.color.gc_brand_light') : $r('app.color.gc_chip_bg'))
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .borderRadius(4)
      }
      .width('100%')

      // Summary row with the check-in count column and the duration column.
      Row() {
        // Left column showing how many check-ins were made today.
        Column({ space: 4 }) {
          // Today's check-in count as the big value.
          Text(this.summary.count.toString())
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.gc_text_primary'))
          // Label under the count value.
          Text($r('app.string.gc_label_today_check_in'))
            .fontSize(12)
            .fontColor($r('app.color.gc_text_secondary'))
        }
        .alignItems(HorizontalAlign.Start)
        // Let both summary columns share the row width equally.
        .layoutWeight(1)

        // Right column showing the total time inside fences today.
        Column({ space: 4 }) {
          // Total duration formatted as hours, minutes and seconds.
          Text(formatDuration(this.summary.durationMs))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.gc_text_primary'))
          // Label under the duration value.
          Text($r('app.string.gc_label_today_duration'))
            .fontSize(12)
            .fontColor($r('app.color.gc_text_secondary'))
        }
        .alignItems(HorizontalAlign.Start)
        // Let both summary columns share the row width equally.
        .layoutWeight(1)
      }
      .width('100%')
    }
    .width('100%')
    // Card padding and background matching the page style.
    .padding(16)
    .backgroundColor($r('app.color.gc_card_bg'))
    .borderRadius(12)
  }
}
