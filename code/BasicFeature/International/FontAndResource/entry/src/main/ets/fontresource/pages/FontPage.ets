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

// Import the library components and models rendered by this page.
import { CapabilityCheck, ErrorCodeMap, ErrorExplain, InfoRow, SectionCard, LogPanel } from 'library';
// Import the observable view model that drives this page.
import { FontViewModel } from '../viewmodel/FontViewModel';

// The system font family used as the baseline for the preview comparison.
const SYSTEM_FONT_FAMILY: string = 'HarmonyOS Sans';

// The font demo page that shows capability checks, file management and previews.
@ComponentV2
export struct FontPage {
  // The observable view model instance bound to this page.
  @Local vm: FontViewModel = new FontViewModel();
  // The error codes rendered in the error dictionary card.
  private dictionaryCodes: number[] = [201, 202, 31100101, 31100104, 31100106, 31100107];

  // Binds the view model to the ability context when the page appears.
  aboutToAppear(): void {
    // Resolve the host ability context from the UI context.
    const context = this.getUIContext().getHostContext();
    // Bind only when the context resolution succeeded.
    if (context !== undefined) {
      // Hand both contexts over to the view model.
      this.vm.bind(context, this.getUIContext());
    }
  }

  // Maps a capability outcome onto the success or warning color.
  private capabilityColor(supported: boolean): ResourceColor {
    // Return the success color for supported capabilities.
    return supported ? $r('app.color.success') : $r('app.color.warning');
  }

  // Maps a severity bucket onto the matching color resource.
  private severityColor(severity: string): ResourceColor {
    // Error severity uses the danger color.
    if (severity === 'error') {
      // Return the danger color resource.
      return $r('app.color.danger');
    }
    // Warning severity uses the warning color.
    if (severity === 'warning') {
      // Return the warning color resource.
      return $r('app.color.warning');
    }
    // Informational severity uses the neutral secondary color.
    // Return the secondary color resource.
    return $r('app.color.text_secondary');
  }

  // Builds one capability check row with its name, state and detail.
  @Builder
  checkRow(check: CapabilityCheck, index: number) {
    // Stack the header and detail of one check vertically.
    Column({ space: 4 }) {
      // Lay the name and state out on one line.
      Row({ space: 8 }) {
        // Render the localized check name.
        Text(check.name)
          .id(`id_check_name_${index}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        // Push the state text to the trailing edge.
        Blank()
        // Render the supported or unsupported state label.
        Text(check.supported ? $r('app.string.fr_supported') : $r('app.string.fr_not_supported'))
          .id(`id_check_state_${index}`)
          .fontSize(12)
          .fontColor(this.capabilityColor(check.supported))
      }
      // Stretch the header across the row width.
      .width('100%')

      // Render the localized detail text under the header.
      Text(check.detail)
        .id(`id_check_detail_${index}`)
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .lineHeight(18)
        .width('100%')
    }
    // Attach the check row test id.
    .id(`id_check_row_${index}`)
    // Stretch the row across the card width.
    .width('100%')
    // Add breathing room above and below the row.
    .padding({ top: 8, bottom: 8 })
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds one error dictionary row with code, title, suggestion and reason.
  @Builder
  errorRow(explain: ErrorExplain) {
    // Stack the header and reason of one error vertically.
    Column({ space: 4 }) {
      // Lay the code, title and suggestion out on one line.
      Row({ space: 8 }) {
        // Render the numeric error code in the severity color.
        Text(explain.code.toString())
          .id(`id_error_code_${explain.code}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.severityColor(explain.severity))
        // Render the localized error title.
        Text(explain.title)
          .id(`id_error_title_${explain.code}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.severityColor(explain.severity))
        // Push the suggestion text to the trailing edge.
        Blank()
        // Render the one-line truncated suggestion.
        Text(explain.suggestion)
          .id(`id_error_suggestion_${explain.code}`)
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .layoutWeight(1)
          .textAlign(TextAlign.End)
      }
      // Stretch the header across the row width.
      .width('100%')

      // Render the localized reason text under the header.
      Text(explain.reason)
        .id(`id_error_reason_${explain.code}`)
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .lineHeight(18)
        .width('100%')
    }
    // Attach the error row test id.
    .id(`id_error_row_${explain.code}`)
    // Stretch the row across the card width.
    .width('100%')
    // Add breathing room above and below the row.
    .padding({ top: 8, bottom: 8 })
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the font file card content with asset info and the prepare button.
  @Builder
  fontFileContent() {
    // Stack the info rows and the action button vertically.
    Column({ space: 12 }) {
      // Show the font family name row.
      InfoRow({
        idPrefix: 'id_asset_family',
        label: $r('app.string.fr_label_family'),
        value: this.vm.asset.familyName
      })
      // Show the sandbox path row with an empty state placeholder.
      InfoRow({
        idPrefix: 'id_asset_path',
        label: $r('app.string.fr_label_sandbox_path'),
        value: this.vm.asset.sandboxPath.length > 0 ? this.vm.asset.sandboxPath : $r('app.string.fr_empty_dash'),
        valueColor: this.vm.asset.sandboxPath.length > 0 ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
      })
      // Show the readiness state row with status based coloring.
      InfoRow({
        idPrefix: 'id_asset_state',
        label: $r('app.string.fr_label_state'),
        value: this.vm.asset.ready ? $r('app.string.fr_state_ready') : $r('app.string.fr_state_not_ready'),
        valueColor: this.vm.asset.ready ? $r('app.color.success') : $r('app.color.warning')
      })
      // Render the primary prepare action button.
      Button($r('app.string.fr_btn_prepare'))
        .id('id_btn_prepare')
        .width('100%')
        .height(40)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.card_bg'))
        .backgroundColor($r('app.color.brand_primary'))
        .borderRadius(20)
        // Disable the button while an operation is running.
        .enabled(!this.vm.busy)
        .onClick(() => {
          // Trigger the sandbox copy through the view model.
          this.vm.prepareAsset();
        })
    }
    // Stretch the content across the card width.
    .width('100%')
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the preview card content with the toggle and both sample texts.
  @Builder
  previewContent() {
    // Stack the toggle row and the two sample blocks vertically.
    Column({ space: 12 }) {
      // Lay the toggle label and switch out on one line.
      Row({ space: 12 }) {
        // Render the toggle label that takes the remaining width.
        Text($r('app.string.fr_toggle_preview'))
          .id('id_preview_label')
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        // Render the preview switch bound to the view model state.
        Toggle({ type: ToggleType.Switch, isOn: this.vm.previewEnabled })
          .id('id_preview_toggle')
          .onChange((isOn: boolean) => {
            // Trigger the toggle only when the state actually differs.
            if (isOn !== this.vm.previewEnabled) {
              // Forward the switch action into the view model.
              this.vm.togglePreview();
            }
          })
      }
      // Stretch the toggle row across the card width.
      .width('100%')
      // Keep the row at a comfortable minimum height.
      .constraintSize({ minHeight: 40 })

      // Group the system font sample into one muted block.
      Column({ space: 4 }) {
        // Render the block caption in the tertiary color.
        Text($r('app.string.fr_preview_system'))
          .id('id_preview_system_label')
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
        // Render the sample text in the system font.
        Text($r('app.string.fr_sample_text'))
          .id('id_preview_system_text')
          .fontSize(20)
          .fontFamily(SYSTEM_FONT_FAMILY)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
      }
      // Stretch the sample block across the card width.
      .width('100%')
      // Pad the sample block content.
      .padding(12)
      // Paint the subtle background behind the block.
      .backgroundColor($r('app.color.fill_subtle'))
      // Round the block corners.
      .borderRadius(8)
      // Align the block children to the leading edge.
      .alignItems(HorizontalAlign.Start)

      // Group the custom font sample into one brand tinted block.
      Column({ space: 4 }) {
        // Render the block caption in the tertiary color.
        Text($r('app.string.fr_preview_custom'))
          .id('id_preview_custom_label')
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
        // Render the sample text in the custom font when enabled.
        Text($r('app.string.fr_sample_text'))
          .id('id_preview_custom_text')
          .fontSize(20)
          .fontFamily(this.vm.previewEnabled ? this.vm.asset.familyName : SYSTEM_FONT_FAMILY)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
      }
      // Stretch the sample block across the card width.
      .width('100%')
      // Pad the sample block content.
      .padding(12)
      // Paint the brand tinted background behind the block.
      .backgroundColor($r('app.color.brand_light'))
      // Round the block corners.
      .borderRadius(8)
      // Align the block children to the leading edge.
      .alignItems(HorizontalAlign.Start)
    }
    // Stretch the content across the card width.
    .width('100%')
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the full page scroll with every section card and the log panel.
  build() {
    // Wrap the whole page inside a vertical scroll.
    Scroll() {
      // Lay the section cards out on a responsive grid.
      GridRow({ columns: { sm: 4, md: 8, lg: 12 }, gutter: 12 }) {
        // Host the capability check card on a half width column.
        GridCol({ span: { sm: 4, md: 8, lg: 6 } }) {
          // Render the check card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_check_card',
            title: $r('app.string.fr_section_check_title'),
            subtitle: $r('app.string.fr_section_check_desc')
          }) {
            // Group the check rows inside one column.
            Column() {
              // Repeat over the check rows lazily.
              Repeat<CapabilityCheck>(this.vm.checks)
                .each((repeatItem: RepeatItem<CapabilityCheck>) => {
                  // Render one check row per entry.
                  this.checkRow(repeatItem.item, repeatItem.index)
                })
                // Use the stable index as the reuse key.
                .key((check: CapabilityCheck, index: number) => index.toString())
            }
            // Stretch the group across the card width.
            .width('100%')
          }
        }

        // Host the font file card on a half width column.
        GridCol({ span: { sm: 4, md: 8, lg: 6 } }) {
          // Render the file card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_font_file_card',
            title: $r('app.string.fr_section_font_file_title'),
            subtitle: $r('app.string.fr_section_font_file_desc')
          }) {
            // Render the file management content.
            this.fontFileContent()
          }
        }

        // Host the error dictionary card on a half width column.
        GridCol({ span: { sm: 4, md: 8, lg: 6 } }) {
          // Render the error card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_error_card',
            title: $r('app.string.fr_section_error_title'),
            subtitle: $r('app.string.fr_section_error_desc')
          }) {
            // Group the error rows inside one column.
            Column() {
              // Repeat over the selected error codes lazily.
              Repeat<number>(this.dictionaryCodes)
                .each((repeatItem: RepeatItem<number>) => {
                  // Render one explained error row per code.
                  this.errorRow(ErrorCodeMap.explain(repeatItem.item))
                })
                // Use the error code as the reuse key.
                .key((code: number) => code.toString())
            }
            // Stretch the group across the card width.
            .width('100%')
          }
        }

        // Host the preview card on a full width column.
        GridCol({ span: { sm: 4, md: 8, lg: 12 } }) {
          // Render the preview card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_preview_card',
            title: $r('app.string.fr_section_preview_title'),
            subtitle: $r('app.string.fr_section_preview_desc')
          }) {
            // Render the toggle and sample text content.
            this.previewContent()
          }
        }

        // Host the log panel on a full width column.
        GridCol({ span: { sm: 4, md: 8, lg: 12 } }) {
          // Render the on-screen log panel bound to the view model.
          LogPanel({
            idPrefix: 'id_font_log',
            logs: this.vm.logs,
            onClear: () => {
              // Clear the log list through the view model.
              this.vm.clearLogs();
            }
          })
        }
      }
      // Attach the page grid test id.
      .id('id_font_view')
      // Stretch the grid across the page width.
      .width('100%')
      // Pad the grid inside the scroll viewport.
      .padding({ left: 24, right: 24, top: 12, bottom: 24 })
    }
    // Attach the scroll test id.
    .id('id_font_scroll')
    // Stretch the scroll across the page width.
    .width('100%')
    // Stretch the scroll across the page height.
    .height('100%')
    // Hide the scrollbar for a clean look.
    .scrollBar(BarState.Off)
    // Paint the page background behind the scroll.
    .backgroundColor($r('app.color.page_bg'))
  }
}
