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
import { Logger, MediaMeta, MediaThumb, PhotoPickerFeature, Trace } from 'photopickersendable';
import { promptAction } from '@kit.ArkUI';
import { selectionStore, SelectionStore } from '../data/SelectionStore';
import { FormatUtil } from '../data/FormatUtil';

// Module tag prefixed to every log line emitted by this page.
const TAG: string = 'PickerScene';
// Edge length of the thumbnail rendered for every picked item, expressed in vp.
const THUMB_SIZE: string = '72vp';
// Height of the horizontal selection strip, expressed in vp.
const STRIP_HEIGHT: string = '72vp';
// Height of the metadata summary line, expressed in vp.
const SUMMARY_HEIGHT: string = '20vp';
// Duration of the toast shown by this page, in milliseconds.
const TOAST_DURATION: number = 2000;
// Scale factor the guide card grows from when its entrance animation starts.
const CARD_SCALE_START: number = 0.98;
// Duration of the guide card entrance animation, in milliseconds.
const CARD_ANIMATION_DURATION: number = 600;

/**
 * Picker scene: opens the system full screen picker, keeps the picked uris in the shared
 * selection store and queries the metadata of the confirmed selection.
 * Every picker and media library call is bracketed by a trace slice and logs a short,
 * non sensitive summary so the flow stays observable without printing uris.
 */
@ComponentV2
export struct PickerScene {
  /** UI ability context used by every media library call. */
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  /** Shared cross page selection store holding the picked uris. */
  private store: SelectionStore = selectionStore;
  /** Metadata of the confirmed selection, shown as one summary line. */
  @Local metas: MediaMeta[] = [];
  /** Whether the metadata query is running; disables the confirm button while true. */
  @Local busy: boolean = false;
  /** Scale applied by the guide card entrance animation; animated to one on appear. */
  @Local cardScale: number = CARD_SCALE_START;

  /**
   * Lifecycle callback fired when the page component is about to appear.
   * Plays the guide card entrance animation once.
   */
  aboutToAppear(): void {
    Trace.withSync('PickerScene.aboutToAppear', () => {
      // Record the page entry with the module tag.
      Logger.info(TAG, 'aboutToAppear enter');
      // Play the entrance animation of the guide card.
      this.runEnterAnimation();
      // Record that the appear stage finished.
      Logger.info(TAG, 'aboutToAppear exit');
    });
  }

  /**
   * Animates the guide card from its start scale factor to the full size.
   */
  private runEnterAnimation(): void {
    Trace.withSync('PickerScene.runEnterAnimation', () => {
      // Drive the card scale inside a single shared animation.
      animateTo({
        duration: CARD_ANIMATION_DURATION,
        curve: Curve.EaseOut
      }, () => {
        // Grow the card from its initial scale factor to the full size.
        this.cardScale = 1;
      });
      // Record that the entrance animation was scheduled.
      Logger.debug(TAG, 'runEnterAnimation duration=' + String(CARD_ANIMATION_DURATION));
    });
  }

  /**
   * Opens the system full screen picker and copies the returned uris into the selection store.
   * The picker is limited to the remaining selection capacity of the shared store.
   * @returns Promise resolved once the picker result has been merged into the store.
   */
  private async openPicker(): Promise<void> {
    // Bracket the picker round trip with a trace slice that closes on every path.
    return Trace.withAsync('PickerScene.openPicker', async () => {
      try {
        // Record the picker start together with the current selection size.
        Logger.info(TAG, 'openPicker start selected=' + String(this.store.count()));
        // Ask the system picker for at most the remaining selection capacity.
        const uris: string[] = await PhotoPickerFeature.pickFullScreen(this.store.maxSelection());
        // Merge every returned uri into the shared selection store one by one.
        for (let index = 0; index < uris.length; index++) {
          // Add the uri at the current index to the store.
          this.store.add(uris[index]);
        }
        // Record the returned item count and the resulting total, both are plain numbers.
        Logger.info(TAG, 'openPicker returned=' + String(uris.length) +
          ' total=' + String(this.store.count()));
      } catch (error) {
        // Build the failure text by concatenation, templates and casts are not allowed here.
        Logger.error(TAG, 'openPicker failed: ' + String(error));
        // Tell the user that the picker could not be opened.
        promptAction.showToast({
          message: $r('app.string.pp_picker_open_failed'),
          duration: TOAST_DURATION
        });
      }
    });
  }

  /**
   * Queries the metadata of the confirmed selection and stores the edit source uri.
   * @returns Promise resolved once the metadata has been loaded or the failure was handled.
   */
  private async confirmSelection(): Promise<void> {
    // Reject the confirm action when the selection store is still empty.
    if (this.store.count() === 0) {
      // Tell the user that nothing has been selected yet.
      promptAction.showToast({
        message: $r('app.string.pp_picker_empty_selection'),
        duration: TOAST_DURATION
      });
      // Record the rejected confirm attempt with a single flag.
      Logger.warn(TAG, 'confirmSelection skipped, empty selection');
      // Stop before starting the metadata query.
      return;
    }
    // Mark the page busy so the confirm button is disabled during the query.
    this.busy = true;
    // Bracket the metadata query with a trace slice that closes on every path.
    return Trace.withAsync('PickerScene.confirmSelection', async () => {
      try {
        // Record the query start with the selected item count.
        Logger.info(TAG, 'confirmSelection start count=' + String(this.store.count()));
        // Query the metadata of a snapshot copy of the selected uris.
        this.metas = await PhotoPickerFeature.queryByUris(this.context, this.store.pickedUris.slice());
        // Remember the first picked uri as the edit source of the editor scene.
        this.store.setEditSource(this.store.firstUri());
        // Record the loaded metadata count.
        Logger.info(TAG, 'confirmSelection metas=' + String(this.metas.length));
        // Tell the user that the selection has been confirmed.
        promptAction.showToast({
          message: $r('app.string.pp_picker_confirmed', this.store.count()),
          duration: TOAST_DURATION
        });
      } catch (error) {
        // Build the failure text by concatenation, templates and casts are not allowed here.
        Logger.error(TAG, 'confirmSelection failed: ' + String(error));
        // Tell the user that the confirmation could not be completed.
        promptAction.showToast({
          message: $r('app.string.pp_picker_confirm_failed'),
          duration: TOAST_DURATION
        });
      } finally {
        // Drop the busy flag on both the success and the failure path.
        this.busy = false;
      }
    });
  }

  /**
   * Clears the shared selection store and the local metadata of the previous confirmation.
   */
  private clearSelection(): void {
    Trace.withSync('PickerScene.clearSelection', () => {
      Logger.info(TAG, 'clearSelection count=' + String(this.store.count()));
      // Drop every picked uri from the shared store.
      this.store.clear();
      // Drop the metadata that belonged to the cleared selection.
      this.metas = [];
    });
  }

  /**
   * Builds the picker page: a hint row, the guide card, the selection strip and the actions.
   */
  build() {
    // Navigation destination wrapper so the page can live inside the NavPathStack.
    NavDestination() {
      // Root vertical container of the page, spaced by 12vp.
      Column({ space: '12vp' }) {
        // Hint row holding the capacity hint and the selected counter.
        Row({ space: '8vp' }) {
          // Hint text carrying the maximum selection capacity of the store.
          Text($r('app.string.pp_picker_hint', this.store.maxSelection()))
            .id('id_picker_hint')
            // Caption sized secondary text that absorbs the free horizontal space.
            .fontSize($r('app.float.pp_font_caption'))
            .fontColor($r('app.color.pp_text_secondary'))
            .layoutWeight(1)
          // Counter text carrying the current number of selected items.
          Text($r('app.string.pp_picker_selected', this.store.count()))
            .id('id_picker_selected_count')
            // Caption sized brand coloured text.
            .fontSize($r('app.float.pp_font_caption'))
            .fontColor($r('app.color.pp_brand'))
        }
        // Stretch the hint row to the full page width.
        .width('100%')

        // Guide card holding the explanation text and the picker button.
        Column({ space: '12vp' }) {
          // Explanation text telling the user how the system picker behaves.
          Text($r('app.string.pp_picker_guide'))
            .id('id_picker_guide')
            // Body sized secondary text, centred across the card width.
            .fontSize($r('app.float.pp_font_body'))
            .fontColor($r('app.color.pp_text_secondary'))
            .textAlign(TextAlign.Center)
            .width('100%')
          // Button that opens the system full screen picker.
          Button($r('app.string.pp_picker_open'))
            .id('id_picker_open')
            // Standard button height with a capsule shape, brand background and card label.
            .height($r('app.float.pp_button_height'))
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.pp_brand'))
            .fontColor($r('app.color.pp_card'))
            // Opens the picker and merges the result into the store.
            .onClick(() => this.openPicker())
        }
        .id('id_picker_prompt')
        // Guide card: full width, weight one, padding, centred content, card background.
        .width('100%')
        .layoutWeight(1)
        .padding('24vp')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor($r('app.color.pp_card'))
        .borderRadius($r('app.float.pp_radius_m'))
        // Scale the guide card with the entrance animation factor.
        .scale({ x: this.cardScale, y: this.cardScale })

        // Column holding the horizontal selection strip and the metadata summary line.
        Column({ space: '4vp' }) {
          // Horizontal strip of the picked thumbnails.
          List({ space: '8vp' }) {
            // Render one thumbnail per picked uri.
            Repeat<string>(this.store.pickedUris)
              .each((repeatItem: RepeatItem<string>) => {
                // One list row per picked uri.
                ListItem() {
                  // Thumbnail of the picked item, always rendered in the selected state.
                  MediaThumb({
                    uri: repeatItem.item,
                    selected: true,
                    itemSize: THUMB_SIZE,
                    index: repeatItem.index,
                    // Ordinal mark shown on the thumbnail, one based so it matches the selection order.
                    markText: String(repeatItem.index + 1),
                    markColor: $r('app.color.pp_brand'),
                    markTextColor: $r('app.color.pp_card'),
                    placeholderColor: $r('app.color.pp_divider')
                  })
                }
              })
              // Identity of each repeated row, derived from the picked uri itself.
              .key((uri: string): string => uri)
          }
          .id('id_picker_selected_list')
          // Strip: full width, fixed height, horizontal direction without a scrollbar.
          .width('100%')
          .height(STRIP_HEIGHT)
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)

          // Metadata summary branch shown as soon as at least one item was confirmed.
          if (this.metas.length > 0) {
            // Summary line carrying the display name and the readable size of the first item.
            Text($r('app.string.pp_picker_meta_summary', this.metas[0].displayName,
              FormatUtil.bytes(this.metas[0].size)))
              .id('id_picker_meta_summary')
              // Caption sized secondary text, single line with an ellipsis overflow.
              .fontSize($r('app.float.pp_font_caption'))
              .fontColor($r('app.color.pp_text_secondary'))
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
              .height(SUMMARY_HEIGHT)
          } else {
            // Empty hint branch shown while no selection has been confirmed.
            Text($r('app.string.pp_picker_empty_selection'))
              .id('id_picker_empty_tip')
              // Caption sized secondary text with a fixed single line height.
              .fontSize($r('app.float.pp_font_caption'))
              .fontColor($r('app.color.pp_text_secondary'))
              .width('100%')
              .height(SUMMARY_HEIGHT)
          }
        }
        // Stretch the selection column to the full page width.
        .width('100%')

        // Action row holding the clear button and the confirm button.
        Row({ space: '12vp' }) {
          // Button that clears the whole selection.
          Button($r('app.string.pp_picker_clear'))
            .id('id_picker_clear')
            .layoutWeight(1)
            .height($r('app.float.pp_button_height'))
            // Capsule shape with a card background and the primary coloured label.
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.pp_card'))
            .fontColor($r('app.color.pp_text_primary'))
            // Clears the shared store and the local metadata.
            .onClick(() => this.clearSelection())
          // Button that confirms the selection, labelled "processing" while the query runs.
          Button(this.busy ? $r('app.string.pp_picker_loading') : $r('app.string.pp_picker_confirm'))
            .id('id_picker_confirm')
            .layoutWeight(1)
            .height($r('app.float.pp_button_height'))
            // Capsule shape with the brand background and card coloured label.
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.pp_brand'))
            .fontColor($r('app.color.pp_card'))
            // Disabled while the metadata query runs.
            .enabled(!this.busy)
            // Confirms the selection and loads the metadata of the picked items.
            .onClick(() => this.confirmSelection())
        }
        // Stretch the action row to the full page width.
        .width('100%')
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
    .title($r('app.string.pp_home_scene_picker_title'))
    // Page level background colour behind the navigation destination.
    .backgroundColor($r('app.color.pp_bg_page'))
  }
}
