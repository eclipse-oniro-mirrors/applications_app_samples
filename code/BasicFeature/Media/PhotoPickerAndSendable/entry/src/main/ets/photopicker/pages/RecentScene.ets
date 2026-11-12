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
  BaseItemInfo,
  PhotoSource,
  RecentPhotoComponent,
  RecentPhotoInfo,
  RecentPhotoOptions,
  photoAccessHelper
} from '@kit.MediaLibraryKit';
import { Logger, MediaMeta, MediaThumb, PhotoPickerFeature, Trace } from 'photopickersendable';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { selectionStore, SelectionStore } from '../data/SelectionStore';
import { FormatUtil } from '../data/FormatUtil';

// Module tag used by every log line emitted from this page.
const TAG: string = 'RecentScene';
// Period option that covers the last one hour, expressed in seconds.
const ONE_HOUR_SECONDS: number = 3600;
// Period option that covers the last six hours, expressed in seconds.
const SIX_HOURS_SECONDS: number = 21600;
// Period option that covers the last twenty four hours, expressed in seconds.
const ONE_DAY_SECONDS: number = 86400;
// Height of the system provided recent photo component, expressed in vp.
const RECENT_HEIGHT: number = 180;
// Edge length of the fallback thumbnail, expressed as a vp string literal for the component.
const FALLBACK_THUMB: string = '56vp';

/**
 * Describes one selectable time period chip of the recent scene.
 */
class PeriodOption {
  /** Period length in seconds, passed straight to the system options object. */
  public seconds: number;
  /** Localized label rendered inside the period chip. */
  public label: Resource;

  /**
   * Builds one period option.
   * @param seconds Period length in seconds.
   * @param label Localized chip label.
   */
  constructor(seconds: number, label: Resource) {
    // Store the period length used by the query options.
    this.seconds = seconds;
    // Store the localized chip label.
    this.label = label;
  }
}

/**
 * Describes one selectable media source chip of the recent scene.
 */
class SourceOption {
  /** Media source value forwarded to the system recent photo options. */
  public source: PhotoSource;
  /** Localized label rendered inside the source chip. */
  public label: Resource;

  /**
   * Builds one source option.
   * @param source Media source value.
   * @param label Localized chip label.
   */
  constructor(source: PhotoSource, label: Resource) {
    // Store the media source used by the query options.
    this.source = source;
    // Store the localized chip label.
    this.label = label;
  }
}

/**
 * Recent photo scene: shows the system recent photo component plus a fallback card
 * built from the newest item of the media library.
 */
@ComponentV2
export struct RecentScene {
  /** UI ability context used by every media library call. */
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  /** Shared cross page selection store holding the picked uris. */
  private store: SelectionStore = selectionStore;
  /** Period chips rendered above the recent component. */
  private periods: PeriodOption[] = [
    // One hour option.
    new PeriodOption(ONE_HOUR_SECONDS, $r('app.string.pp_recent_period_1h')),
    // Six hours option.
    new PeriodOption(SIX_HOURS_SECONDS, $r('app.string.pp_recent_period_6h')),
    // Twenty four hours option, selected by default.
    new PeriodOption(ONE_DAY_SECONDS, $r('app.string.pp_recent_period_24h'))
  ];
  /** Source chips rendered above the recent component. */
  private sources: SourceOption[] = [
    // All media sources option, selected by default.
    new SourceOption(PhotoSource.ALL, $r('app.string.pp_recent_source_all')),
    // Camera only option.
    new SourceOption(PhotoSource.CAMERA, $r('app.string.pp_recent_source_camera')),
    // Screenshot only option.
    new SourceOption(PhotoSource.SCREENSHOT, $r('app.string.pp_recent_source_screenshot'))
  ];
  /** Currently selected period length in seconds. */
  @Local periodSeconds: number = ONE_DAY_SECONDS;
  /** Currently selected media source. */
  @Local source: PhotoSource = PhotoSource.ALL;
  /** Whether the recent component is allowed to refresh itself automatically. */
  @Local autoRefresh: boolean = false;
  /** Options object handed to the system recent photo component, mutated in place. */
  private recentOptions: RecentPhotoOptions =
    PhotoPickerFeature.createRecentOptions(ONE_DAY_SECONDS, PhotoSource.ALL, false);
  /** Whether a recent photo was reported by the system component. */
  @Local exists: boolean = false;
  /** Whether the check result has already come back at least once. */
  @Local checked: boolean = false;
  /** Formatted taken time text of the reported recent photo. */
  @Local recentInfoText: string = '';
  /** Identifier of the reported recent photo. */
  @Local checkedIdentifier: string = '';
  /** Uri of the item the user tapped inside the system recent component. */
  @Local clickedUri: string = '';
  /** Uri of the newest media library item used by the fallback card. */
  @Local fallbackUri: string = '';
  /** Name and size label of the fallback item. */
  @Local fallbackLabel: string = '';
  /** Whether the system recent component reported that a recent photo exists. */
  @Local componentExists: boolean = false;

  /**
   * Lifecycle callback fired when the page component is about to appear.
   */
  aboutToAppear(): void {
    // Open the trace slice for the appear lifecycle.
    Trace.withSync('RecentScene.aboutToAppear', () => {
      // Record the page entry with the module tag.
      Logger.info(TAG, 'aboutToAppear enter');
      // Load the newest media library item used by the fallback card.
      this.loadFallback();
      // Record that the appear stage finished.
      Logger.info(TAG, 'aboutToAppear exit');
    });
  }

  /**
   * Pushes the current chip state into the system options object and reloads the fallback card.
   * The component keeps the options object it was created with, so the fields are updated in place.
   */
  private rebuildOptions(): void {
    // Open the trace slice around the option rebuild.
    Trace.withSync('RecentScene.rebuildOptions', () => {
      // Forward the selected period to the system component.
      this.recentOptions.period = this.periodSeconds;
      // Forward the selected media source to the system component.
      this.recentOptions.photoSource = this.source;
      // Forward the auto refresh switch to the system component.
      this.recentOptions.isAutoRefreshSupported = this.autoRefresh;
      // Clear the previous check result because the options changed.
      this.checked = false;
      // Clear the previous info text because it belongs to the old options.
      this.recentInfoText = '';
      // Reload the fallback card for the new options.
      this.loadFallback();
      // Log the new option state with short, non sensitive values only.
      Logger.debug(TAG, 'rebuildOptions period=' + String(this.periodSeconds) +
        ' source=' + String(this.source) + ' autoRefresh=' + String(this.autoRefresh));
    });
  }

  /**
   * Handles the existence result reported by the system recent photo component.
   * @param exists Whether the system reports a recent photo for the current options.
   */
  private onCheckResult(exists: boolean): void {
    // Mirror the reported state into the local flag.
    this.exists = exists;
    // Mirror the reported state into the component flag used by the fallback card.
    this.componentExists = exists;
    // Mark the state as already checked so the status text stops showing the hint.
    this.checked = true;
    // Log the existence result with the module tag.
    Logger.info(TAG, 'onCheckResult exists=' + String(exists));
  }

  /**
   * Handles the detailed info reported by the system recent photo component.
   * @param exists Whether the system reports a recent photo for the current options.
   * @param info Recent photo info object carrying identifier and taken time.
   */
  private onCheckInfo(exists: boolean, info: RecentPhotoInfo): void {
    // Mirror the reported state into the local flag.
    this.exists = exists;
    // Mirror the reported state into the component flag used by the fallback card.
    this.componentExists = exists;
    // Mark the state as already checked.
    this.checked = true;
    // Apply the reported identifier and taken time to the local state.
    this.applyInfo(info.identifier ?? '', info.dateTaken ?? 0);
    // Log the info arrival, only the flag and the identifier length are printed.
    Logger.info(TAG, 'onCheckInfo exists=' + String(exists) +
      ' identifierLen=' + String((info.identifier ?? '').length));
  }

  /**
   * Applies the reported identifier and taken time to the local state.
   * @param identifier Identifier of the recent photo, empty when unknown.
   * @param taken Taken time in milliseconds, zero when unknown.
   */
  private applyInfo(identifier: string, taken: number): void {
    // Keep the identifier so the info row can show it.
    this.checkedIdentifier = identifier;
    // Format the taken time only when it carries a positive value.
    this.recentInfoText = taken > 0 ? FormatUtil.time(taken) : '';
  }

  /**
   * Handles a user tap on an item of the system recent photo component.
   * @param item Item info reported by the system component.
   * @returns Always true, the system component expects the tap to be consumed.
   */
  private onRecentClick(item: BaseItemInfo): boolean {
    // Read the item uri defensively, the field is optional.
    const uri: string = item.uri ?? '';
    // Log the tap without printing the uri itself.
    Logger.info(TAG, 'onRecentClick uriLen=' + String(uri.length));
    // Store the picked uri only when the component reported a usable one.
    if (uri.length > 0) {
      // Add the picked uri to the shared selection store.
      this.store.add(uri);
      // Keep the last clicked uri so the footer text can be shown.
      this.clickedUri = uri;
      // Tell the user how many items are selected now.
      promptAction.showToast({
        message: $r('app.string.pp_recent_picked', this.store.count()),
        duration: 2000
      });
      // Log the new selection size instead of the uri.
      Logger.debug(TAG, 'onRecentClick selected=' + String(this.store.count()));
    }
    // Consume the tap for the system component.
    return true;
  }

  /**
   * Queries the recent photo info through the media library kit.
   * Keeps the local state consistent when the kit API fails on some system images.
   */
  private async queryInfo(): Promise<void> {
    // Start the asynchronous trace span for the query.
    const traceTaskId: number = Trace.begin('RecentScene.queryInfo');
    // Announce the query stage.
    Logger.info(TAG, 'queryInfo enter');
    try {
      // Build the query options from the current chip state.
      const options: photoAccessHelper.RecentPhotoOptions =
        PhotoPickerFeature.createRecentQuery(this.periodSeconds, this.source);
      // Await the cross process query and apply the returned info.
      this.applyQueriedInfo(await PhotoPickerFeature.queryRecentInfo(this.context, options));
      // Log the successful completion of the query.
      Logger.info(TAG, 'queryInfo success exists=' + String(this.exists));
    } catch (error) {
      // Log the failure with the business code produced by the kit API.
      Logger.errorWithCode(TAG, 'query recent info', error as BusinessError);
      // The API fails on some system images; the newest item is still shown in the fallback card.
      this.exists = this.fallbackUri.length > 0;
      // Mark the state as checked so the result row becomes visible.
      this.checked = true;
      // Clear the formatted taken time because the query failed.
      this.recentInfoText = '';
      // Clear the identifier because the query failed.
      this.checkedIdentifier = '';
      // Log the degraded state applied after the failure.
      Logger.warn(TAG, 'queryInfo fallback exists=' + String(this.exists));
    } finally {
      // Close the asynchronous trace span on both the success and the failure path.
      Trace.end('RecentScene.queryInfo', traceTaskId);
      // Announce that the query stage finished.
      Logger.debug(TAG, 'queryInfo exit');
    }
  }

  /**
   * Applies the info returned by the media library query to the local state.
   * @param info Recent photo info returned by the kit API.
   */
  private applyQueriedInfo(info: photoAccessHelper.RecentPhotoInfo): void {
    // Treat the photo as existing when either the identifier or the taken time is present.
    this.exists = (info.identifier ?? '').length > 0 || (info.dateTaken ?? 0) > 0;
    // Mark the state as checked so the status row shows the real result.
    this.checked = true;
    // Apply the returned identifier and taken time to the local state.
    this.applyInfo(info.identifier ?? '', info.dateTaken ?? 0);
    // Log the applied result without printing the identifier value.
    Logger.info(TAG, 'applyQueriedInfo exists=' + String(this.exists));
  }

  /**
   * Loads the newest media library item used by the fallback card.
   */
  private async loadFallback(): Promise<void> {
    // Start the asynchronous trace span for the fallback query.
    const traceTaskId: number = Trace.begin('RecentScene.loadFallback');
    // Announce the fallback loading stage.
    Logger.debug(TAG, 'loadFallback enter');
    try {
      // Await the newest item for the current period and source.
      const newest: MediaMeta | undefined =
        await PhotoPickerFeature.queryNewest(this.context, this.periodSeconds, this.source);
      // Keep the uri of the newest item, or clear it when nothing was found.
      this.fallbackUri = newest !== undefined ? newest.uri : '';
      // Build the label from the name and the formatted size, or clear it when nothing was found.
      this.fallbackLabel = newest !== undefined ?
        `${newest.displayName} · ${FormatUtil.bytes(newest.size)}` : '';

      // Log whether a fallback item was found.
      Logger.info(TAG, 'loadFallback ' + (newest !== undefined ? 'found' : 'empty'));
    } catch (error) {
      // Log the failure with the business code produced by the kit API.
      Logger.errorWithCode(TAG, 'recent fallback', error as BusinessError);
      // Clear the fallback uri so the fallback card stays hidden.
      this.fallbackUri = '';
      // Clear the fallback label so the fallback card stays hidden.
      this.fallbackLabel = '';
    } finally {
      // Close the asynchronous trace span on both the success and the failure path.
      Trace.end('RecentScene.loadFallback', traceTaskId);
    }
  }

  /**
   * Adds the newest fallback item to the shared selection store.
   */
  private useFallback(): void {
    // Open the trace slice around the fallback pick.
    Trace.withSync('RecentScene.useFallback', () => {
      // Add the fallback uri to the shared selection store.
      this.store.add(this.fallbackUri);
      // Tell the user how many items are selected now.
      promptAction.showToast({
        message: $r('app.string.pp_recent_picked', this.store.count()),
        duration: 2000
      });
      // Log the new selection size instead of the uri.
      Logger.info(TAG, 'useFallback selected=' + String(this.store.count()));
    });
  }

  /**
   * Builds the period chip row rendered above the recent component.
   */
  @Builder
  periodChips() {
    // Horizontal container holding the period chips.
    Row({ space: '8vp' }) {
      // Render one chip per configured period option.
      Repeat<PeriodOption>(this.periods)
        // Build the chip for the current period item.
        .each((repeatItem: RepeatItem<PeriodOption>) => {
          // Capsule button showing the localized period label.
          Button(repeatItem.item.label)
            // Stable id used by the UI test scripts.
            .id(`id_recent_period_${repeatItem.index}`)
            // Fixed chip height so all chips line up.
            .height('32vp')
            // Symmetric horizontal padding around the label.
            .padding({ left: '14vp', right: '14vp' })
            // Capsule shape for the period chip.
            .type(ButtonType.Capsule)
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Brand background for the selected period, card background otherwise.
            .backgroundColor(this.periodSeconds === repeatItem.item.seconds ?
              $r('app.color.pp_brand') : $r('app.color.pp_card'))
            // Inverted text color for the selected period, primary text color otherwise.
            .fontColor(this.periodSeconds === repeatItem.item.seconds ?
              $r('app.color.pp_card') : $r('app.color.pp_text_primary'))
            // Selecting a chip updates the period and rebuilds the options.
            .onClick(() => {
              // Store the period length of the tapped chip.
              this.periodSeconds = repeatItem.item.seconds;
              // Push the new period into the system options and reload the fallback.
              this.rebuildOptions();
              // Log the chip interaction with the new period value.
              Logger.info(TAG, 'period chip click seconds=' + String(this.periodSeconds));
            })
        })
        // Identity of each repeated item, derived from the period length.
        .key((item: PeriodOption): string => item.seconds.toString())
    }
    // Stretch the chip row to the full page width.
    .width('100%')
  }

  /**
   * Builds the media source chip row rendered above the recent component.
   */
  @Builder
  sourceChips() {
    // Horizontal container holding the source chips.
    Row({ space: '8vp' }) {
      // Render one chip per configured media source option.
      Repeat<SourceOption>(this.sources)
        // Build the chip for the current source item.
        .each((repeatItem: RepeatItem<SourceOption>) => {
          // Capsule button showing the localized source label.
          Button(repeatItem.item.label)
            // Stable id used by the UI test scripts.
            .id(`id_recent_source_${repeatItem.index}`)
            // Fixed chip height so all chips line up.
            .height('32vp')
            // Symmetric horizontal padding around the label.
            .padding({ left: '14vp', right: '14vp' })
            // Capsule shape for the source chip.
            .type(ButtonType.Capsule)
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Brand background for the selected source, card background otherwise.
            .backgroundColor(this.source === repeatItem.item.source ?
              $r('app.color.pp_brand') : $r('app.color.pp_card'))
            // Inverted text color for the selected source, primary text color otherwise.
            .fontColor(this.source === repeatItem.item.source ?
              $r('app.color.pp_card') : $r('app.color.pp_text_primary'))
            // Selecting a chip updates the source and rebuilds the options.
            .onClick(() => {
              // Store the media source of the tapped chip.
              this.source = repeatItem.item.source;
              // Push the new source into the system options and reload the fallback.
              this.rebuildOptions();
              // Log the chip interaction with the new source value.
              Logger.info(TAG, 'source chip click source=' + String(this.source));
            })
        })
        // Identity of each repeated item, derived from the media source value.
        .key((item: SourceOption): string => item.source.toString())
    }
    // Stretch the chip row to the full page width.
    .width('100%')
  }

  /**
   * Builds the recent scene page.
   */
  build() {
    // Navigation destination hosting the whole recent scene.
    NavDestination() {
      // Vertically scrollable container because the page is taller than the viewport.
      Scroll() {
        // Vertical stack holding every section of the page.
        Column({ space: '12vp' }) {
          // Section label of the period chips.
          Text($r('app.string.pp_recent_period_label'))
            // Stable id used by the UI test scripts.
            .id('id_recent_period_label')
            // Body font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_body'))
            // Primary text color from the shared resource set.
            .fontColor($r('app.color.pp_text_primary'))
            // Stretch the label to the full column width.
            .width('100%')
          // Period chip row built by the dedicated builder.
          this.periodChips()
          // Section label of the source chips.
          Text($r('app.string.pp_recent_source_label'))
            // Stable id used by the UI test scripts.
            .id('id_recent_source_label')
            // Body font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_body'))
            // Primary text color from the shared resource set.
            .fontColor($r('app.color.pp_text_primary'))
            // Stretch the label to the full column width.
            .width('100%')
          // Media source chip row built by the dedicated builder.
          this.sourceChips()
          // Row holding the auto refresh label and the switch.
          Row({ space: '12vp' }) {
            // Label of the auto refresh switch.
            Text($r('app.string.pp_recent_autorefresh'))
              // Stable id used by the UI test scripts.
              .id('id_recent_autorefresh_label')
              // Body font size taken from the shared resource set.
              .fontSize($r('app.float.pp_font_body'))
              // Primary text color from the shared resource set.
              .fontColor($r('app.color.pp_text_primary'))
              // Let the label take the remaining width next to the switch.
              .layoutWeight(1)
            // Switch controlling the auto refresh support flag.
            Toggle({ type: ToggleType.Switch, isOn: this.autoRefresh })
              // Stable id used by the UI test scripts.
              .id('id_recent_autorefresh_toggle')
              // Brand color for the selected track.
              .selectedColor($r('app.color.pp_brand'))
              // Flipping the switch updates the flag and rebuilds the options.
              .onChange((isOn: boolean) => {
                // Store the new switch state.
                this.autoRefresh = isOn;
                // Push the new flag into the system options and reload the fallback.
                this.rebuildOptions();
                // Log the switch interaction with the new state.
                Logger.info(TAG, 'autoRefresh change on=' + String(isOn));
              })
          }
          // Stretch the switch row to the full column width.
          .width('100%')
          // Inner padding of the card container.
          .padding('12vp')
          // Card background color from the shared resource set.
          .backgroundColor($r('app.color.pp_card'))
          // Medium corner radius from the shared resource set.
          .borderRadius($r('app.float.pp_radius_m'))

          // System provided recent photo component driven by the shared options object.
          RecentPhotoComponent({
            recentPhotoOptions: this.recentOptions,
            onRecentPhotoCheckResult: (exists: boolean): void => this.onCheckResult(exists),
            onRecentPhotoCheckInfo: (exists: boolean, info: RecentPhotoInfo): void =>
            this.onCheckInfo(exists, info),
            onRecentPhotoClick: (item: BaseItemInfo): boolean => this.onRecentClick(item)
          })
            // Stretch the component to the full column width.
            .width('100%')
            // Fixed component height expressed in vp.
            .height(`${RECENT_HEIGHT}vp`)

          // Status text describing whether the recent photo exists.
          Text(this.checked ? (this.exists ? $r('app.string.pp_recent_exists') :
            $r('app.string.pp_recent_missing')) : $r('app.string.pp_recent_hint'))
            // Stable id used by the UI test scripts.
            .id('id_recent_status')
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Secondary color for the missing state, primary color otherwise.
            .fontColor(this.checked && !this.exists ?
              $r('app.color.pp_text_secondary') : $r('app.color.pp_text_primary'))
            // Stretch the status text to the full column width.
            .width('100%')

          // Fallback card shown only when the newest item exists and the component reported nothing.
          if (this.fallbackUri.length > 0 && !this.componentExists) {
            // Row holding the thumbnail, the labels and the pick button.
            Row({ space: '12vp' }) {
              // Thumbnail of the newest media library item.
              MediaThumb({
                uri: this.fallbackUri,
                selected: false,
                itemSize: FALLBACK_THUMB,
                index: 0,
                markColor: $r('app.color.pp_brand'),
                markTextColor: $r('app.color.pp_card'),
                placeholderColor: $r('app.color.pp_divider')
              })
              // Vertical stack holding the fallback title and label.
              Column({ space: '4vp' }) {
                // Title of the fallback card.
                Text($r('app.string.pp_recent_fallback_title'))
                  // Stable id used by the UI test scripts.
                  .id('id_recent_fallback_title')
                  // Body font size taken from the shared resource set.
                  .fontSize($r('app.float.pp_font_body'))
                  // Primary text color from the shared resource set.
                  .fontColor($r('app.color.pp_text_primary'))
                  // Stretch the title to the full column width.
                  .width('100%')
                // Name and size label of the newest media library item.
                Text(this.fallbackLabel)
                  // Stable id used by the UI test scripts.
                  .id('id_recent_fallback_label')
                  // Caption font size taken from the shared resource set.
                  .fontSize($r('app.float.pp_font_caption'))
                  // Secondary text color from the shared resource set.
                  .fontColor($r('app.color.pp_text_secondary'))
                  // Keep the label on a single line.
                  .maxLines(1)
                  // Ellipsize the label when it does not fit.
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  // Stretch the label to the full column width.
                  .width('100%')
              }
              // Let the label column take the remaining width next to the button.
              .layoutWeight(1)
              // Left align the label column content.
              .alignItems(HorizontalAlign.Start)
              // Button adding the fallback item to the selection store.
              Button($r('app.string.pp_recent_fallback_use'))
                // Stable id used by the UI test scripts.
                .id('id_recent_fallback_use')
                // Fixed button height expressed in vp.
                .height('32vp')
                // Capsule shape for the fallback button.
                .type(ButtonType.Capsule)
                // Caption font size taken from the shared resource set.
                .fontSize($r('app.float.pp_font_caption'))
                // Brand background color from the shared resource set.
                .backgroundColor($r('app.color.pp_brand'))
                // Inverted text color from the shared resource set.
                .fontColor($r('app.color.pp_card'))
                // Picking the fallback item adds the newest uri to the store.
                .onClick(() => this.useFallback())
            }
            // Stable id of the fallback card container.
            .id('id_recent_fallback_card')
            // Stretch the fallback card to the full column width.
            .width('100%')
            // Inner padding of the fallback card.
            .padding('12vp')
            // Card background color from the shared resource set.
            .backgroundColor($r('app.color.pp_card'))
            // Medium corner radius from the shared resource set.
            .borderRadius($r('app.float.pp_radius_m'))
          }

          // Info row shown only when an identifier or a taken time was reported.
          if (this.recentInfoText.length > 0 || this.checkedIdentifier.length > 0) {
            // Text showing the formatted taken time and the identifier.
            Text($r('app.string.pp_recent_info', this.recentInfoText, this.checkedIdentifier))
              // Stable id used by the UI test scripts.
              .id('id_recent_info')
              // Caption font size taken from the shared resource set.
              .fontSize($r('app.float.pp_font_caption'))
              // Secondary text color from the shared resource set.
              .fontColor($r('app.color.pp_text_secondary'))
              // Stretch the info row to the full column width.
              .width('100%')
              // Inner padding of the info card.
              .padding('12vp')
              // Card background color from the shared resource set.
              .backgroundColor($r('app.color.pp_card'))
              // Medium corner radius from the shared resource set.
              .borderRadius($r('app.float.pp_radius_m'))
          }

          // Button querying the recent photo info through the media library kit.
          Button($r('app.string.pp_recent_query'))
            // Stable id used by the UI test scripts.
            .id('id_recent_query')
            // Stretch the button to the full column width.
            .width('100%')
            // Shared button height from the resource set.
            .height($r('app.float.pp_button_height'))
            // Capsule shape for the query button.
            .type(ButtonType.Capsule)
            // Brand background color from the shared resource set.
            .backgroundColor($r('app.color.pp_brand'))
            // Inverted text color from the shared resource set.
            .fontColor($r('app.color.pp_card'))
            // Running the query fills the info row with the kit result.
            .onClick(() => this.queryInfo())

          // Footer shown only after at least one item was tapped inside the component.
          if (this.clickedUri.length > 0) {
            // Text showing how many items are selected now.
            Text($r('app.string.pp_recent_clicked', this.store.count()))
              // Stable id used by the UI test scripts.
              .id('id_recent_clicked')
              // Caption font size taken from the shared resource set.
              .fontSize($r('app.float.pp_font_caption'))
              // Brand text color from the shared resource set.
              .fontColor($r('app.color.pp_brand'))
              // Stretch the footer to the full column width.
              .width('100%')
          }
        }
        // Stretch the inner column to the full scroll width.
        .width('100%')
        // Page level padding of the inner column.
        .padding('16vp')
        // Left align every section inside the column.
        .alignItems(HorizontalAlign.Start)
      }
      // Stable id of the scroll container.
      .id('id_recent_scroll')
      // Stretch the scroll container to the full width.
      .width('100%')
      // Stretch the scroll container to the full height.
      .height('100%')
      // Align the scroll content to the top start corner.
      .align(Alignment.TopStart)
      // Hide the scroll bar because the page is short.
      .scrollBar(BarState.Off)
    }
    // Page title shown in the navigation bar.
    .title($r('app.string.pp_home_scene_recent_title'))
    // Page background color from the shared resource set.
    .backgroundColor($r('app.color.pp_bg_page'))
  }
}
