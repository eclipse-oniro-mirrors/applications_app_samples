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

// Import the log entry model rendered by this panel.
import { LogEntry } from '../model/LogTypes';

// An on-screen log panel that renders the newest entries with level based colors.
@ComponentV2
export struct LogPanel {
  // The unique id prefix used to build test ids for this panel instance.
  @Param idPrefix: string = 'id_log';
  // The log entries to render, newest first as provided by the view model.
  @Param logs: LogEntry[] = [];
  // The callback fired when the user presses the clear button.
  @Event onClear: () => void = () => {
  };

  // Maps a log level name onto the matching color resource.
  private levelColor(level: string): ResourceColor {
    // Error lines use the danger color.
    if (level === 'error') {
      // Return the danger color resource.
      return $r('app.color.danger');
    }
    // Warning lines use the warning color.
    if (level === 'warn') {
      // Return the warning color resource.
      return $r('app.color.warning');
    }
    // Every other level uses the secondary text color.
    // Return the neutral secondary color resource.
    return $r('app.color.text_secondary');
  }

  // Builds the panel header, empty state and the log list.
  build() {
    // Stack the header and the list vertically with a small gap.
    Column({ space: 8 }) {
      // Lay the title and the clear button out on one line.
      Row() {
        // Render the localized panel title.
        Text($r('app.string.fr_section_log_title'))
          .id(`${this.idPrefix}_title`)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        // Push the clear button to the trailing edge.
        Blank()
        // Render the clear button that empties the log list.
        Button($r('app.string.fr_btn_clear'))
          .id(`${this.idPrefix}_clear`)
          .height(40)
          .fontSize(14)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .padding({ left: 16, right: 16 })
          .onClick(() => {
            // Forward the tap into the parent supplied callback.
            this.onClear();
          })
      }
      // Attach the header test id.
      .id(`${this.idPrefix}_header`)
      // Stretch the header across the panel width.
      .width('100%')
      // Keep the header at a fixed height.
      .height(40)

      // Show either the empty hint or the scrollable log list.
      if (this.logs.length === 0) {
        // Render the localized empty hint when there is nothing to show.
        Text($r('app.string.fr_empty_log'))
          .id(`${this.idPrefix}_empty`)
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      } else {
        // Render the lazy log list when entries exist.
        List({ space: 8 }) {
          // Repeat over the log entries with lazy item creation.
          Repeat<LogEntry>(this.logs)
            .each((repeatItem: RepeatItem<LogEntry>) => {
              // Wrap each entry into one list item.
              ListItem() {
                // Lay the time, tag and message out on one line.
                Row({ space: 8 }) {
                  // Render the capture time in the tertiary color.
                  Text(repeatItem.item.time)
                    .id(`${this.idPrefix}_time_${repeatItem.item.id}`)
                    .fontSize(12)
                    .fontColor($r('app.color.text_tertiary'))
                  // Render the module tag in the brand color.
                  Text(repeatItem.item.tag)
                    .id(`${this.idPrefix}_tag_${repeatItem.item.id}`)
                    .fontSize(12)
                    .fontColor($r('app.color.brand_primary'))
                  // Render the message body with level based coloring.
                  Text(repeatItem.item.text)
                    .id(`${this.idPrefix}_text_${repeatItem.item.id}`)
                    .fontSize(14)
                    .fontColor(this.levelColor(repeatItem.item.level))
                    .layoutWeight(1)
                    .maxLines(3)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                // Attach the per-entry row test id.
                .id(`${this.idPrefix}_item_row_${repeatItem.item.id}`)
                // Stretch the row across the list width.
                .width('100%')
                // Add breathing room above and below the row.
                .padding({ top: 4, bottom: 4 })
                // Align the children to the top for multi-line messages.
                .alignItems(VerticalAlign.Top)
              }
            })
            // Use the stable entry id as the reuse key.
            .key((log: LogEntry) => log.id.toString())
        }
        // Attach the list test id.
        .id(`${this.idPrefix}_list`)
        // Stretch the list across the panel width.
        .width('100%')
        // Cap the list height so long logs stay inside the card.
        .constraintSize({ maxHeight: 220 })
        // Draw hairline dividers between the entries.
        .divider({ strokeWidth: 0.5, color: $r('app.color.divider') })
        // Hide the scrollbar for a clean look.
        .scrollBar(BarState.Off)
      }
    }
    // Attach the panel level test id.
    .id(`${this.idPrefix}_panel`)
    // Stretch the panel across the parent width.
    .width('100%')
    // Pad the panel content on every side.
    .padding(16)
    // Paint the card background behind the panel.
    .backgroundColor($r('app.color.card_bg'))
    // Round the panel corners to match the card style.
    .borderRadius(12)
    // Align the stacked children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }
}
