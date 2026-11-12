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
import { InfoRow, ResourceEntry, SectionCard, LogPanel } from 'library';
// Import the observable view model that drives this page.
import { ResourceViewModel } from '../viewmodel/ResourceViewModel';

// The resource demo page that shows conversions, round trips and rendering.
@ComponentV2
export struct ResourcePage {
  // The observable view model instance bound to this page.
  @Local vm: ResourceViewModel = new ResourceViewModel();

  // Maps a category bucket onto its localized label.
  private categoryLabel(category: string): ResourceStr {
    // Return the color label for color entries.
    if (category === 'color') {
      // Return the localized color type label.
      return $r('app.string.fr_type_color');
    }
    // Return the float label for float entries.
    if (category === 'float') {
      // Return the localized float type label.
      return $r('app.string.fr_type_float');
    }
    // Return the media label for media entries.
    if (category === 'media') {
      // Return the localized media type label.
      return $r('app.string.fr_type_media');
    }
    // Fall back to the string label for every other category.
    // Return the localized string type label.
    return $r('app.string.fr_type_string');
  }

  // Maps a status bucket onto its localized label.
  private statusLabel(status: string): ResourceStr {
    // Return the done label for converted entries.
    if (status === 'converted') {
      // Return the localized done status label.
      return $r('app.string.fr_status_done');
    }
    // Return the failed label for failed entries.
    if (status === 'failed') {
      // Return the localized failed status label.
      return $r('app.string.fr_status_failed');
    }
    // Fall back to the idle label for untouched entries.
    // Return the localized idle status label.
    return $r('app.string.fr_status_idle');
  }

  // Maps a status bucket onto the matching color resource.
  private statusColor(status: string): ResourceColor {
    // Converted entries use the success color.
    if (status === 'converted') {
      // Return the success color resource.
      return $r('app.color.success');
    }
    // Failed entries use the danger color.
    if (status === 'failed') {
      // Return the danger color resource.
      return $r('app.color.danger');
    }
    // Idle entries use the neutral tertiary color.
    // Return the tertiary color resource.
    return $r('app.color.text_tertiary');
  }

  // Counts the format parameters of the entry resource as display text.
  private paramsCount(entry: ResourceEntry): string {
    // Treat the missing parameter list as zero.
    const count: number = entry.resource.params === undefined ? 0 : entry.resource.params.length;
    // Convert the count into its decimal text form.
    return count.toString();
  }

  // Builds one resource entry row with metadata, preview and detail.
  @Builder
  entryItem(entry: ResourceEntry, index: number) {
    // Stack the header, preview and info rows of one entry vertically.
    Column({ space: 8 }) {
      // Lay the name, category tag and status out on one line.
      Row({ space: 8 }) {
        // Render the localized entry name.
        Text(entry.name)
          .id(`id_entry_name_${entry.key}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        // Render the category chip with the brand tint.
        Text(this.categoryLabel(entry.category))
          .id(`id_entry_category_${entry.key}`)
          .fontSize(12)
          .fontColor($r('app.color.brand_primary'))
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(4)
        // Push the status text to the trailing edge.
        Blank()
        // Render the status label with outcome coloring.
        Text(this.statusLabel(entry.status))
          .id(`id_entry_status_${entry.key}`)
          .fontSize(12)
          .fontColor(this.statusColor(entry.status))
      }
      // Attach the entry header test id.
      .id(`id_entry_header_${entry.key}`)
      // Stretch the header across the row width.
      .width('100%')

      // Render the media preview only for media entries.
      if (entry.category === 'media') {
        // Show the media resource as a small cover image.
        Image(entry.resource)
          .id(`id_entry_media_${entry.key}`)
          .width(96)
          .height(64)
          .objectFit(ImageFit.Cover)
          .borderRadius(8)
      }

      // Show the owning bundle name row.
      InfoRow({
        idPrefix: `id_entry_bundle_${entry.key}`,
        label: $r('app.string.fr_label_bundle'),
        value: entry.resource.bundleName
      })
      // Show the owning module name row.
      InfoRow({
        idPrefix: `id_entry_module_${entry.key}`,
        label: $r('app.string.fr_label_module'),
        value: entry.resource.moduleName
      })
      // Show the numeric resource id row.
      InfoRow({
        idPrefix: `id_entry_id_${entry.key}`,
        label: $r('app.string.fr_label_resource_id'),
        value: entry.resource.id.toString()
      })
      // Show the numeric resource type row.
      InfoRow({
        idPrefix: `id_entry_type_${entry.key}`,
        label: $r('app.string.fr_label_resource_type'),
        value: (entry.resource.type === undefined ? 0 : entry.resource.type).toString()
      })
      // Show the parameter count row.
      InfoRow({
        idPrefix: `id_entry_params_${entry.key}`,
        label: $r('app.string.fr_label_params'),
        value: this.paramsCount(entry)
      })

      // Render the result detail only after a conversion attempt.
      if (entry.detail.length > 0) {
        // Show the detail text with outcome based coloring.
        Text(entry.detail)
          .id(`id_entry_detail_${entry.key}`)
          .fontSize(12)
          .fontColor(entry.status === 'failed' ? $r('app.color.danger') : $r('app.color.text_secondary'))
          .width('100%')
      }

      // Draw a divider after every row except the last one.
      if (index < this.vm.entries.length - 1) {
        // Render the hairline divider between entries.
        Divider()
          .id(`id_entry_divider_${entry.key}`)
          .strokeWidth(0.5)
          .color($r('app.color.divider'))
          .margin({ top: 4 })
      }
    }
    // Attach the entry row test id.
    .id(`id_entry_${entry.key}`)
    // Stretch the row across the card width.
    .width('100%')
    // Add breathing room above and below the row.
    .padding({ top: 8, bottom: 8 })
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the list card content with action buttons and the entry list.
  @Builder
  listContent() {
    // Stack the action row and the entry list vertically.
    Column({ space: 4 }) {
      // Lay the two conversion buttons out on one line.
      Row({ space: 12 }) {
        // Render the primary batch conversion button.
        Button($r('app.string.fr_button_convert_all'))
          .id('id_btn_convert_all')
          .layoutWeight(1)
          .height(40)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          // Disable the button while a conversion is running.
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Trigger the batch conversion through the view model.
            this.vm.convertAll();
          })
        // Render the secondary media conversion button.
        Button($r('app.string.fr_button_convert_media'))
          .id('id_btn_convert_media')
          .layoutWeight(1)
          .height(40)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          // Disable the button while a conversion is running.
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Trigger the media conversion through the view model.
            this.vm.convertMedia();
          })
      }
      // Stretch the action row across the card width.
      .width('100%')
      // Add small vertical margins around the action row.
      .margin({ top: 4, bottom: 4 })

      // Repeat over the resource entries lazily.
      Repeat<ResourceEntry>(this.vm.entries)
        .each((repeatItem: RepeatItem<ResourceEntry>) => {
          // Render one entry row per resource.
          this.entryItem(repeatItem.item, repeatItem.index)
        })
        // Use the stable entry key as the reuse key.
        .key((entry: ResourceEntry) => entry.key)
    }
    // Stretch the content across the card width.
    .width('100%')
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the round trip card content with route buttons and the result rows.
  @Builder
  roundTripContent() {
    // Stack the route buttons and the result rows vertically.
    Column({ space: 12 }) {
      // Lay the two route buttons out on one line.
      Row({ space: 12 }) {
        // Render the taskpool route button with active state styling.
        Button($r('app.string.fr_button_taskpool'))
          .id('id_btn_taskpool')
          .layoutWeight(1)
          .height(40)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.vm.activePath === 'taskpool' ? $r('app.color.card_bg') : $r('app.color.brand_primary'))
          .backgroundColor(this.vm.activePath === 'taskpool'
            ? $r('app.color.brand_primary')
            : $r('app.color.brand_light'))
          .borderRadius(20)
          // Disable the button while a conversion is running.
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Trigger the taskpool round trip through the view model.
            this.vm.runRoundTrip('taskpool');
          })
        // Render the worker route button with active state styling.
        Button($r('app.string.fr_button_worker'))
          .id('id_btn_worker')
          .layoutWeight(1)
          .height(40)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.vm.activePath === 'worker' ? $r('app.color.card_bg') : $r('app.color.brand_primary'))
          .backgroundColor(this.vm.activePath === 'worker'
            ? $r('app.color.brand_primary')
            : $r('app.color.brand_light'))
          .borderRadius(20)
          // Disable the button while a conversion is running.
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Trigger the worker round trip through the view model.
            this.vm.runRoundTrip('worker');
          })
      }
      // Stretch the route row across the card width.
      .width('100%')

      // Show either the empty hint or the result info rows.
      if (this.vm.roundTrip === null) {
        // Render the localized empty hint before the first run.
        Text($r('app.string.fr_empty_none'))
          .id('id_roundtrip_empty')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      } else {
        // Show the route that produced the latest outcome.
        InfoRow({
          idPrefix: 'id_roundtrip_path',
          label: $r('app.string.fr_label_path'),
          value: this.vm.roundTrip.path === 'worker' ? 'Worker' : 'TaskPool'
        })
        // Show the owning bundle name from the summary.
        InfoRow({
          idPrefix: 'id_roundtrip_bundle',
          label: $r('app.string.fr_label_bundle'),
          value: this.vm.roundTrip.summary.bundleName
        })
        // Show the owning module name from the summary.
        InfoRow({
          idPrefix: 'id_roundtrip_module',
          label: $r('app.string.fr_label_module'),
          value: this.vm.roundTrip.summary.moduleName
        })
        // Show the numeric resource id from the summary.
        InfoRow({
          idPrefix: 'id_roundtrip_id',
          label: $r('app.string.fr_label_resource_id'),
          value: this.vm.roundTrip.summary.resourceId.toString()
        })
        // Show the numeric resource type from the summary.
        InfoRow({
          idPrefix: 'id_roundtrip_type',
          label: $r('app.string.fr_label_resource_type'),
          value: this.vm.roundTrip.summary.type.toString()
        })
        // Show the measured cost with outcome based coloring.
        InfoRow({
          idPrefix: 'id_roundtrip_cost',
          label: $r('app.string.fr_label_cost'),
          value: `${this.vm.roundTrip.summary.costMs} ms`,
          valueColor: this.vm.roundTrip.success ? $r('app.color.success') : $r('app.color.danger')
        })
        // Show the error row only when the round trip failed.
        if (!this.vm.roundTrip.success) {
          // Show the failure message in the danger color.
          InfoRow({
            idPrefix: 'id_roundtrip_error',
            label: $r('app.string.fr_status_failed'),
            value: this.vm.roundTrip.summary.errorMessage,
            valueColor: $r('app.color.danger')
          })
        }
      }
    }
    // Stretch the content across the card width.
    .width('100%')
    // Align the children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }

  // Builds the render card content showing restored resources visually.
  @Builder
  renderContent() {
    // Stack the restored text, color and media previews vertically.
    Column({ space: 12 }) {
      // Show either the empty hint or the restored string resource.
      if (this.vm.renderedResource === null) {
        // Render the localized empty hint before the first run.
        Text($r('app.string.fr_empty_none'))
          .id('id_render_empty')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      } else {
        // Render the restored string resource as styled text.
        Text(this.vm.renderedResource)
          .id('id_render_text')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
      }

      // Lay the color swatch and its caption out on one line.
      Row({ space: 12 }) {
        // Render the brand color swatch rectangle.
        Rect()
          .id('id_render_color_swatch')
          .width(48)
          .height(24)
          .radius(4)
          .fill($r('app.color.brand_primary'))
        // Render the color caption next to the swatch.
        Text($r('app.string.fr_demo_color'))
          .id('id_render_color_label')
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
      }
      // Stretch the color row across the card width.
      .width('100%')
      // Keep the row at a comfortable minimum height.
      .constraintSize({ minHeight: 24 })

      // Lay the float demo chip out on one line.
      Row({ space: 12 }) {
        // Render the text chip that uses the float radius resource.
        Text($r('app.string.fr_demo_float'))
          .id('id_render_float_label')
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius($r('app.float.card_radius'))
      }
      // Stretch the float row across the card width.
      .width('100%')

      // Render the restored media image only after a media conversion.
      if (this.vm.mediaResource !== null) {
        // Show the restored media resource as a wide cover image.
        Image(this.vm.mediaResource)
          .id('id_render_media')
          .width('100%')
          .height(160)
          .objectFit(ImageFit.Cover)
          .borderRadius($r('app.float.card_radius'))
      }
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
        // Host the resource list card on a full width column.
        GridCol({ span: { sm: 4, md: 8, lg: 12 } }) {
          // Render the list card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_resource_list_card',
            title: $r('app.string.fr_section_resource_list_title'),
            subtitle: $r('app.string.fr_section_resource_list_desc')
          }) {
            // Render the conversion actions and the entry list.
            this.listContent()
          }
        }

        // Host the round trip card on a half width column.
        GridCol({ span: { sm: 4, md: 8, lg: 6 } }) {
          // Render the round trip card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_resource_roundtrip_card',
            title: $r('app.string.fr_section_roundtrip_title'),
            subtitle: $r('app.string.fr_section_roundtrip_desc')
          }) {
            // Render the route buttons and the result rows.
            this.roundTripContent()
          }
        }

        // Host the render card on a half width column.
        GridCol({ span: { sm: 4, md: 8, lg: 6 } }) {
          // Render the render card with its localized title and subtitle.
          SectionCard({
            idPrefix: 'id_resource_render_card',
            title: $r('app.string.fr_section_render_title'),
            subtitle: $r('app.string.fr_section_render_desc')
          }) {
            // Render the restored resource previews.
            this.renderContent()
          }
        }

        // Host the log panel on a full width column.
        GridCol({ span: { sm: 4, md: 8, lg: 12 } }) {
          // Render the on-screen log panel bound to the view model.
          LogPanel({
            idPrefix: 'id_resource_log',
            logs: this.vm.logs,
            onClear: () => {
              // Clear the log list through the view model.
              this.vm.clearLogs();
            }
          })
        }
      }
      // Attach the page grid test id.
      .id('id_resource_view')
      // Stretch the grid across the page width.
      .width('100%')
      // Pad the grid inside the scroll viewport.
      .padding({ left: 24, right: 24, top: 12, bottom: 24 })
    }
    // Attach the scroll test id.
    .id('id_resource_scroll')
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
