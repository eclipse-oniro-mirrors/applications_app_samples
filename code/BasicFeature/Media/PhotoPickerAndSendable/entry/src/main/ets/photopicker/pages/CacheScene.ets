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
import { CacheFile, ExportResult, ImageEditEngine, Logger, PhotoPickerFeature, Trace } from 'photopickersendable';
import { promptAction } from '@kit.ArkUI';
import { selectionStore, SelectionStore } from '../data/SelectionStore';
import { FormatUtil } from '../data/FormatUtil';

// Module tag prefixed to every log line emitted by this page.
const TAG: string = 'CacheScene';
// Edge length of the thumbnail rendered for every cached output, expressed in vp.
const THUMB_SIZE: string = '56vp';
// Sentinel meaning "no export has run yet", rendered as no status text at all.
const NO_EXPORT: number = -1;
// Duration of the summary card entrance and zoom animation, in milliseconds.
const ANIMATION_DURATION: number = 600;
// Scale factor the summary card grows from when its entrance animation starts.
const CARD_SCALE_START: number = 0.98;
// Zoom factor applied when the finished export is highlighted.
const CARD_ZOOM: number = 1.02;

/**
 * Cache scene: lists the export outputs kept inside the application sandbox,
 * shows their accumulated size and lets the user export, delete or clear them.
 * Every disk touching operation is wrapped in a trace slice and logs a short,
 * non sensitive summary so that the flow stays observable without printing paths.
 */
@ComponentV2
export struct CacheScene {
  /** UI ability context required by the sandbox helpers. */
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  /** Shared cross page selection store holding the picked uris. */
  private store: SelectionStore = selectionStore;
  /** Cached output files currently present in the sandbox directory. */
  @Local files: CacheFile[] = [];
  /** Accumulated size of all cached output files, in bytes. */
  @Local totalSize: number = 0;
  /** Whether an export is running; disables the export button while true. */
  @Local busy: boolean = false;
  /** Number of successfully exported files of the last run, NO_EXPORT before any run. */
  @Local exportedCount: number = NO_EXPORT;
  /** Scale applied by the card entering animation; animated to one on appear. */
  @Local cardScale: number = CARD_SCALE_START;

  /**
   * Lifecycle callback fired when the page component is about to appear.
   * Loads the current cache listing once so the list is visible immediately.
   */
  aboutToAppear(): void {
    Trace.withSync('CacheScene.aboutToAppear', () => {
      // Record the page entry with the module tag.
      Logger.info(TAG, 'aboutToAppear enter');
      // Load the sandbox output listing and its accumulated size.
      this.refresh();
      // Play the entrance animation of the summary card.
      this.runEnterAnimation();
      // Record that the appear stage finished.
      Logger.info(TAG, 'aboutToAppear exit');
    });
  }

  /**
   * Animates the summary card: the scale grows from its start factor to the full size.
   */
  private runEnterAnimation(): void {
    Trace.withSync('CacheScene.runEnterAnimation', () => {
      // Drive the card scale inside one shared animation.
      animateTo({
        duration: ANIMATION_DURATION,
        curve: Curve.EaseOut
      }, () => {
        // Grow the card from its initial scale factor to the full size.
        this.cardScale = 1;
      });
      // Record that the entrance animation was scheduled.
      Logger.debug(TAG, 'runEnterAnimation scheduled duration=' + String(ANIMATION_DURATION));
    });
  }

  /**
   * Zooms the summary card slightly so a finished export is visible to the user.
   */
  private runFinishedAnimation(): void {
    Trace.withSync('CacheScene.runFinishedAnimation', () => {
      // Drive the card zoom inside a short animation.
      animateTo({
        duration: ANIMATION_DURATION,
        curve: Curve.EaseInOut
      }, () => {
        // Zoom the summary card by the fixed scale factor.
        this.cardScale = CARD_ZOOM;
      });
      // Record the applied zoom factor.
      Logger.debug(TAG, 'runFinishedAnimation scale=' + String(CARD_ZOOM));
    });
  }

  /**
   * Deterministic tap handler of the export button.
   * Awaits the unchanged export pipeline and plays the zoom animation afterwards, so the
   * busy flag, the toast and the status row keep exactly the behaviour they had before.
   * @returns Promise resolved once the tap handling finished.
   */
  private async onExportTap(): Promise<void> {
    Trace.withSync('CacheScene.onExportTap', () => {
      // Record that the user tapped the export button.
      Logger.info(TAG, 'onExportTap count=' + String(this.store.count()));
    });
    // Run the unchanged export pipeline; it owns the busy flag and every error branch.
    await this.exportOriginals();
    // Zoom the summary card slightly so the finished export is visible to the user.
    this.runFinishedAnimation();
    // Record that the tap handling completed.
    Logger.info(TAG, 'onExportTap done exported=' + String(this.exportedCount));
  }

  /**
   * Reloads the cached output listing and recomputes the accumulated size.
   * Logs only the file count and the byte total, never a path.
   */
  private refresh(): void {
    Trace.withSync('CacheScene.refresh', () => {
      // Read every exported output file from the sandbox directory.
      this.files = PhotoPickerFeature.listOutputs(this.context);
      // Sum the size of the freshly loaded listing.
      this.totalSize = PhotoPickerFeature.totalOutputSize(this.files);
      // Log the listing shape with counts only.
      Logger.info(TAG, 'refresh files=' + String(this.files.length) +
        ' totalBytes=' + String(this.totalSize));
    });
  }

  /**
   * Exports the originals of the current selection into the sandbox output directory.
   * Ends early with a toast when the selection is empty, otherwise reports the
   * number of successfully written files and reloads the listing.
   */
  private async exportOriginals(): Promise<void> {
    // Refuse the action when nothing is selected, the engine has no input to work on.
    if (this.store.count() === 0) {
      // Tell the user that there is nothing to export.
      promptAction.showToast({
        message: $r('app.string.pp_cache_export_none'),
        duration: 2000
      });
      // Stop before touching the engine or the disk.
      return;
    }
    // Mark the page busy so the button switches to its processing label.
    this.busy = true;
    // Create the editing engine that owns the export pipeline.
    const engine: ImageEditEngine = PhotoPickerFeature.createEngine(this.context);
    // Brackets the export with a trace slice that closes on every path.
    const traceName: string = 'CacheScene.exportOriginals';
    Trace.start(traceName);
    try {
      // Log the export start with the input count only.
      Logger.info(TAG, 'exportOriginals start count=' + String(this.store.count()));
      // Copy the picked uris so the store cannot mutate the running export.
      const sourceUris: string[] = this.store.pickedUris.slice();
      // Export every original into the sandbox output directory.
      const results: ExportResult[] = await engine.exportOriginals(sourceUris,
        PhotoPickerFeature.outputDir(this.context));
      // Counter of the files that were written successfully.
      let success: number = 0;
      // Walk the per file results to count the successful writes.
      for (let index = 0; index < results.length; index++) {
        // Only successful writes contribute to the reported number.
        if (results[index].success) {
          // Count this successful file.
          success++;
        }
      }
      // Keep the success count so the status row can show it.
      this.exportedCount = success;
      // Log the export outcome with counts only, no file paths.
      Logger.info(TAG, 'exportOriginals done success=' + String(success) +
        ' total=' + String(results.length));
      // Reload the listing so the freshly exported files show up.
      this.refresh();
    } catch (error) {
      // Build the failure text by concatenation, templates and casts are not allowed here.
      Logger.error(TAG, 'exportOriginals failed: ' + String(error));
      // Reset the exported counter so the stale status text disappears.
      this.exportedCount = 0;
    } finally {
      // Release the engine on both the success and the failure path.
      engine.release();
      // Drop the busy flag so the button becomes clickable again.
      this.busy = false;
      // Close the export trace slice on every path.
      Trace.finish(traceName);
    }
  }

  /**
   * Deletes one cached output file and reloads the listing.
   * @param file Cached output file chosen by the user.
   */
  private removeFile(file: CacheFile): void {
    Trace.withSync('CacheScene.removeFile', () => {
      // Log the intent with the file name length only, the path stays private.
      Logger.info(TAG, 'removeFile nameLen=' + String(file.name.length));
      try {
        // Delete the sandbox file the cached entry points at.
        PhotoPickerFeature.removeOutput(file.path);
        // Reload the listing so the removed row disappears.
        this.refresh();
        // Record the successful removal.
        Logger.info(TAG, 'removeFile done files=' + String(this.files.length));
      } catch (error) {
        // Build the failure text by concatenation to stay ArkTS compliant.
        Logger.error(TAG, 'removeFile failed: ' + String(error));
      }
    });
  }

  /**
   * Clears every cached output file and resets the export status row.
   */
  private clearAll(): void {
    Trace.withSync('CacheScene.clearAll', () => {
      // Log the intent with the current file count only.
      Logger.info(TAG, 'clearAll start files=' + String(this.files.length));
      try {
        // Remove every output file owned by the sample sandbox directory.
        PhotoPickerFeature.clearOutputs(this.context);
        // Reset the export counter so the status row disappears.
        this.exportedCount = NO_EXPORT;
        // Reload the now empty listing.
        this.refresh();
        // Record the successful clear.
        Logger.info(TAG, 'clearAll done');
      } catch (error) {
        // Build the failure text by concatenation to stay ArkTS compliant.
        Logger.error(TAG, 'clearAll failed: ' + String(error));
      }
    });
  }

  /**
   * Builds the cache page: a summary card, the export and clear actions and the file list.
   */
  build() {
    // Navigation destination wrapper so the page can live inside the NavPathStack.
    NavDestination() {
      // Root vertical container of the page, spaced by 12vp.
      Column({ space: '12vp' }) {
        // Summary card holding the total size, the file count and the action buttons.
        Column({ space: '12vp' }) {
          // Accumulated cache size text, localized through the resource template.
          Text($r('app.string.pp_cache_total', FormatUtil.bytes(this.totalSize)))
            .id('id_cache_total')
            // Section sized medium weight text in the primary colour, full width.
            .fontSize($r('app.float.pp_font_section'))
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.pp_text_primary'))
            .width('100%')
          // Number of cached files text.
          Text($r('app.string.pp_cache_count', this.files.length))
            .id('id_cache_count')
            // Caption sized secondary text, full width.
            .fontSize($r('app.float.pp_font_caption'))
            .fontColor($r('app.color.pp_text_secondary'))
            .width('100%')
          // Action row holding the export button and the clear button.
          Row({ space: '12vp' }) {
            // Export button, labelled "processing" while an export is running.
            Button(this.busy ? $r('app.string.pp_edit_processing') : $r('app.string.pp_cache_export'))
              .id('id_cache_export')
              // Weight one inside the action row, at the shared button height.
              .layoutWeight(1)
              .height($r('app.float.pp_button_height'))
              // Capsule shape with the brand background and card coloured label.
              .type(ButtonType.Capsule)
              .backgroundColor($r('app.color.pp_brand'))
              .fontColor($r('app.color.pp_card'))
              // Disabled while an export runs so double taps cannot queue work.
              .enabled(!this.busy)
              // Starts the export of the selected originals through the animated tap handler.
              .onClick(() => this.onExportTap())
            // Button that removes every cached output file.
            Button($r('app.string.pp_cache_clear'))
              .id('id_cache_clear')
              // Weight one inside the action row, at the shared button height.
              .layoutWeight(1)
              .height($r('app.float.pp_button_height'))
              // Capsule shape with a card background and the danger coloured label.
              .type(ButtonType.Capsule)
              .backgroundColor($r('app.color.pp_card'))
              .fontColor($r('app.color.pp_danger'))
              // Clears all cached outputs.
              .onClick(() => this.clearAll())
          }
          // Stretch the action row to the full card width.
          .width('100%')
          // Status row rendered only after at least one export run finished.
          if (this.exportedCount >= 0) {
            // Success text carrying the number of exported files of the last run.
            Text($r('app.string.pp_cache_export_done', this.exportedCount))
              .id('id_cache_export_status')
              // Caption sized success coloured text, full width.
              .fontSize($r('app.float.pp_font_caption'))
              .fontColor($r('app.color.pp_success'))
              .width('100%')
          }
        }
        // Card: full width, inner padding, card background, rounded corners, top aligned items.
        .width('100%')
        .padding('16vp')
        .backgroundColor($r('app.color.pp_card'))
        .borderRadius($r('app.float.pp_radius_m'))
        .alignItems(HorizontalAlign.Start)
        // Scale the whole card with the entrance animation factor.
        .scale({ x: this.cardScale, y: this.cardScale })

        // Empty state branch shown when no cached output exists yet.
        if (this.files.length === 0) {
          // Empty hint text telling the user that the cache is empty.
          Text($r('app.string.pp_cache_empty'))
            .id('id_cache_empty')
            // Body sized secondary text, full width.
            .fontSize($r('app.float.pp_font_body'))
            .fontColor($r('app.color.pp_text_secondary'))
            .width('100%')
        } else {
          // Virtual scrolling list of the cached output files.
          List({ space: '8vp' }) {
            // Render one row per cached output file.
            Repeat<CacheFile>(this.files)
              .each((repeatItem: RepeatItem<CacheFile>) => {
                // One list row per cached file.
                ListItem() {
                  // Row holding the thumbnail, the metadata column and the delete button.
                  Row({ space: '12vp' }) {
                    // Thumbnail of the cached file, loaded through a file scheme uri.
                    Image('file://' + repeatItem.item.path)
                      .id('id_cache_thumb_' + repeatItem.index)
                      // Square thumbnail with cover fit, rounded corners and divider placeholder.
                      .width(THUMB_SIZE)
                      .height(THUMB_SIZE)
                      .objectFit(ImageFit.Cover)
                      .borderRadius($r('app.float.pp_radius_s'))
                      .backgroundColor($r('app.color.pp_divider'))
                    // Column holding the file name and the metadata line.
                    Column({ space: '4vp' }) {
                      // File name of the cached output.
                      Text(repeatItem.item.name)
                        .id('id_cache_name_' + repeatItem.index)
                        // Body sized primary text, single line with an ellipsis overflow.
                        .fontSize($r('app.float.pp_font_body'))
                        .fontColor($r('app.color.pp_text_primary'))
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .width('100%')
                      // Metadata line combining the readable size and the formatted time.
                      Text(FormatUtil.bytes(repeatItem.item.size) + ' · ' +
                        FormatUtil.time(repeatItem.item.modifiedTime))
                        .id('id_cache_meta_' + repeatItem.index)
                        // Caption sized secondary text, full width.
                        .fontSize($r('app.float.pp_font_caption'))
                        .fontColor($r('app.color.pp_text_secondary'))
                        .width('100%')
                    }
                    // Let the metadata column absorb the free horizontal space.
                    .layoutWeight(1)
                    .alignItems(HorizontalAlign.Start)
                    // Button deleting the cached file of this row.
                    Button($r('app.string.pp_cache_delete'))
                      .id('id_cache_delete_' + repeatItem.index)
                      // Compact caption sized button with a page background and danger label.
                      .height('30vp')
                      .type(ButtonType.Capsule)
                      .fontSize($r('app.float.pp_font_caption'))
                      .backgroundColor($r('app.color.pp_bg_page'))
                      .fontColor($r('app.color.pp_danger'))
                      // Removes the cached file of this row.
                      .onClick(() => this.removeFile(repeatItem.item))
                  }
                  // Stretch the row, add inner padding, card background and rounded corners.
                  .width('100%')
                  .padding('12vp')
                  .backgroundColor($r('app.color.pp_card'))
                  .borderRadius($r('app.float.pp_radius_m'))
                }
              })
              // Identity of each repeated row, derived from the cached file path.
              .key((item: CacheFile): string => item.path)
          }
          .id('id_cache_list')
          // Full width list that takes the remaining height without a scrollbar.
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
        }
      }
      // Page container: full size, page padding and page background colour.
      .width('100%')
      .height('100%')
      .padding('16vp')
      // Content starts at the top left corner of the page.
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.pp_bg_page'))
    }
    // Localized title shown in the navigation header.
    .title($r('app.string.pp_home_scene_cache_title'))
    // Page level background colour behind the navigation destination.
    .backgroundColor($r('app.color.pp_bg_page'))
  }
}
