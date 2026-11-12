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

import { abilityAccessCtrl, bundleManager, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger, MediaMeta, PhotoPickerFeature, Trace } from 'photopickersendable';
import { promptAction } from '@kit.ArkUI';
import { selectionStore, SelectionStore } from '../data/SelectionStore';

// Module tag used by every log line emitted from this page.
const TAG: string = 'GalleryScene';
// Permission required to read images and videos from the media library.
const READ_IMAGEVIDEO: Permissions = 'ohos.permission.READ_IMAGEVIDEO';
// Number of media items requested per page.
const PAGE_SIZE: number = 30;
// Permission state value meaning the check has not run yet.
const PERMISSION_UNKNOWN: number = 0;
// Permission state value meaning the permission is granted.
const PERMISSION_GRANTED: number = 1;
// Permission state value meaning the permission is denied.
const PERMISSION_DENIED: number = 2;
// Column template of the media grid, three equal columns.
const GRID_COLUMNS: string = '1fr 1fr 1fr';
// Border width of a selected grid item, expressed in vp.
const BORDER_WIDTH: number = 3;

/**
 * Gallery scene: paged media grid with an inline permission request card.
 */
@ComponentV2
export struct GalleryScene {
  /** UI ability context used by every permission and media library call. */
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  /** Shared cross page selection store holding the picked uris. */
  private store: SelectionStore = selectionStore;
  /** Current permission state, one of the PERMISSION_* constants. */
  @Local permissionState: number = PERMISSION_UNKNOWN;
  /** Media items already loaded from the media library. */
  @Local items: MediaMeta[] = [];
  /** Whether a page request is currently running. */
  @Local loading: boolean = false;
  /** Whether the media library reported that no further page is available. */
  @Local endReached: boolean = false;
  /** Last error message shown inside the permission card. */
  @Local errorMessage: string = '';

  /**
   * Lifecycle callback fired when the page component is about to appear.
   */
  aboutToAppear(): void {
    // Open the trace slice for the appear lifecycle.
    Trace.withSync('GalleryScene.aboutToAppear', () => {
      // Record the page entry with the module tag.
      Logger.info(TAG, 'aboutToAppear enter');
      // Check the permission without prompting the user, the card does that explicitly.
      this.checkPermission(false);
    });
  }

  /**
   * Reads the access token id of the current application.
   * @returns Access token id used by the permission check.
   */
  private accessTokenId(): number {
    // Stop the trace slice right after the synchronous bundle query.
    return Trace.withSync('GalleryScene.accessTokenId', () => {
      // Query the bundle info of this application synchronously.
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      // Log only that the token was resolved, never the token value itself.
      Logger.debug(TAG, 'accessTokenId resolved');
      // Hand the access token id of the application back to the caller.
      return bundleInfo.appInfo.accessTokenId;
    });
  }

  /**
   * Checks the read permission and optionally prompts the user for it.
   * @param requestIfMissing When true, the system permission dialog is shown if needed.
   */
  private async checkPermission(requestIfMissing: boolean): Promise<void> {
    // Start the asynchronous trace span for the permission check.
    const traceTaskId: number = Trace.begin('GalleryScene.checkPermission');
    // Announce the permission check stage with the request flag.
    Logger.info(TAG, 'checkPermission request=' + String(requestIfMissing));
    try {
      // Create the access control manager used for the checks.
      const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // Read the current grant status synchronously for the read permission.
      const status: abilityAccessCtrl.GrantStatus =
        manager.checkAccessTokenSync(this.accessTokenId(), READ_IMAGEVIDEO);
      // Branch on the already granted case.
      if (status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        // Mirror the granted state into the local state.
        this.permissionState = PERMISSION_GRANTED;
        // Log the granted state from the synchronous check.
        Logger.info(TAG, 'checkPermission already granted');
        // Load the first page right away because no dialog is required.
        await this.loadMore();
        // Leave the method, nothing else has to be done.
        return;
      }
      // Branch on the passive check that must not show any dialog.
      if (!requestIfMissing) {
        // Mirror the denied state into the local state.
        this.permissionState = PERMISSION_DENIED;
        // Log the passive denial so the UI state is traceable.
        Logger.info(TAG, 'checkPermission denied without request');
        // Leave the method without prompting the user.
        return;
      }
      try {
        // Await the system permission dialog for the read permission.
        const result: PermissionRequestResult =
          await manager.requestPermissionsFromUser(this.context, [READ_IMAGEVIDEO]);
        // Treat the request as granted when the first result code is zero.
        const granted: boolean = result.authResults.length > 0 && result.authResults[0] === 0;
        // Mirror the dialog result into the local state.
        this.permissionState = granted ? PERMISSION_GRANTED : PERMISSION_DENIED;
        // Log the dialog result with the flag only.
        Logger.info(TAG, 'request READ_IMAGEVIDEO granted=' + String(granted));
        // Load the first page only when the user granted the permission.
        if (granted) {
          // Await the first page load after a successful grant.
          await this.loadMore();
        }
      } catch (error) {
        // Keep the error for the log call, the cast stays local to the ApiError object.
        const businessError = error as BusinessError;
        // Mirror the denied state because the dialog failed.
        this.permissionState = PERMISSION_DENIED;
        this.errorMessage = businessError.message;
        // Log the failure together with the business code.
        Logger.errorWithCode(TAG, 'request READ_IMAGEVIDEO', businessError);
      }
    } finally {
      // Close the asynchronous trace span on both the success and the failure path.
      Trace.end('GalleryScene.checkPermission', traceTaskId);
    }
  }

  /**
   * Loads the next page of media items from the media library.
   */
  private async loadMore(): Promise<void> {
    // Skip the request when a page is already loading, the end was reached or the permission is missing.
    if (this.loading || this.endReached || this.permissionState !== PERMISSION_GRANTED) {
      // Log the skipped request with the short reason.
      Logger.debug(TAG, 'loadMore skipped loading=' + String(this.loading) +
        ' endReached=' + String(this.endReached));
      // Leave the method without touching the media library.
      return;
    }
    // Start the asynchronous trace span for the page query.
    const traceTaskId: number = Trace.begin('GalleryScene.loadMore');
    // Mark the page as loading so re-entrant calls are skipped.
    this.loading = true;
    // Announce the page query with the current offset.
    Logger.debug(TAG, 'loadMore enter offset=' + String(this.items.length));
    try {
      // Await the next page of media items at the current offset.
      const page: MediaMeta[] = await PhotoPickerFeature.queryPage(this.context, this.items.length, PAGE_SIZE);
      // Append the new page to the already loaded items.
      this.items = this.items.concat(page);
      // Detect the end of the media library by a short page.
      if (page.length < PAGE_SIZE) {
        // Remember that no further page is available.
        this.endReached = true;
      }
      // Clear any previous error message after a successful page.
      this.errorMessage = '';
      // Log the loaded page size and the new total amount only.
      Logger.info(TAG, 'gallery loaded page=' + String(page.length) + ' total=' + String(this.items.length));
    } catch (error) {
      // Keep the error for the log call, the cast stays local to the ApiError object.
      const businessError = error as BusinessError;
      this.errorMessage = businessError.message;
      // Log the failure together with the business code.
      Logger.errorWithCode(TAG, 'query media library', businessError);
      // Tell the user that the media library query failed.
      promptAction.showToast({
        message: $r('app.string.pp_gallery_load_failed'),
        duration: 2000
      });
    } finally {
      // Clear the loading flag on both the success and the failure path.
      this.loading = false;
      // Close the asynchronous trace span.
      Trace.end('GalleryScene.loadMore', traceTaskId);
    }
  }

  /**
   * Toggles the selection state of one media item.
   * @param meta Media item that was tapped by the user.
   */
  private toggle(meta: MediaMeta): void {
    // Open the trace slice around the selection toggle.
    Trace.withSync('GalleryScene.toggle', () => {
      // Branch on the already selected case.
      if (this.store.hasUri(meta.uri)) {
        // Remove the item from the shared selection store.
        this.store.remove(meta.uri);
        // Log the removal with the new selection size only.
        Logger.debug(TAG, 'toggle remove selected=' + String(this.store.count()));
      } else if (this.store.count() >= this.store.maxSelection()) {
        // Warn that the selection limit is already reached.
        Logger.warn(TAG, 'toggle rejected, limit=' + String(this.store.maxSelection()));
        // Reject the selection with a toast telling the user about the limit.
        promptAction.showToast({
          message: $r('app.string.pp_picker_exceed'),
          duration: 2000
        });
      } else {
        // Add the item to the shared selection store.
        this.store.add(meta.uri);
        // Log the addition with the new selection size only.
        Logger.debug(TAG, 'toggle add selected=' + String(this.store.count()));
      }
    });
  }

  /**
   * Builds the footer text of the grid from the current loading state.
   * @returns Localized loading/end text, or an empty string when neither applies.
   */
  private footerText(): ResourceStr {
    // Loading takes precedence over the end text.
    if (this.loading) {
      // Show the loading caption while a page request is running.
      return $r('app.string.pp_gallery_loading');
    }
    // Show the end caption when the media library is exhausted.
    if (this.endReached) {
      // Return the localized end caption.
      return $r('app.string.pp_gallery_end');
    }
    // Return an empty string so the footer row stays invisible.
    return '';
  }

  /**
   * Builds the permission card shown while the read permission is missing.
   */
  @Builder
  permissionCard() {
    // Vertical stack holding the permission explanation and the request button.
    Column({ space: '12vp' }) {
      // Title of the permission card.
      Text($r('app.string.pp_gallery_permission_title'))
        // Stable id used by the UI test scripts.
        .id('id_gallery_permission_title')
        // Section font size taken from the shared resource set.
        .fontSize($r('app.float.pp_font_section'))
        // Medium weight so the title stands out from the description.
        .fontWeight(FontWeight.Medium)
        // Primary text color from the shared resource set.
        .fontColor($r('app.color.pp_text_primary'))
        // Stretch the title to the full card width.
        .width('100%')
      // Description explaining why the permission is required.
      Text($r('app.string.pp_gallery_permission_desc'))
        // Stable id used by the UI test scripts.
        .id('id_gallery_permission_desc')
        // Caption font size taken from the shared resource set.
        .fontSize($r('app.float.pp_font_caption'))
        // Secondary text color from the shared resource set.
        .fontColor($r('app.color.pp_text_secondary'))
        // Stretch the description to the full card width.
        .width('100%')
      // Error text shown only when a permission or query call failed.
      if (this.errorMessage.length > 0) {
        // Text carrying the last system error message.
        Text(this.errorMessage)
          // Stable id used by the UI test scripts.
          .id('id_gallery_error')
          // Caption font size taken from the shared resource set.
          .fontSize($r('app.float.pp_font_caption'))
          // Danger color from the shared resource set.
          .fontColor($r('app.color.pp_danger'))
          // Stretch the error text to the full card width.
          .width('100%')
      }
      // Button triggering the system permission dialog.
      Button($r('app.string.pp_gallery_request'))
        // Stable id used by the UI test scripts.
        .id('id_gallery_request')
        // Stretch the button to the full card width.
        .width('100%')
        // Shared button height from the resource set.
        .height($r('app.float.pp_button_height'))
        // Capsule shape for the request button.
        .type(ButtonType.Capsule)
        // Brand background color from the shared resource set.
        .backgroundColor($r('app.color.pp_brand'))
        // Inverted text color from the shared resource set.
        .fontColor($r('app.color.pp_card'))
        // Requesting the permission with the dialog flag enabled.
        .onClick(() => this.checkPermission(true))
      // Tip explaining the account level permission that the sample relies on.
      Text($r('app.string.pp_gallery_acl_tip'))
        // Stable id used by the UI test scripts.
        .id('id_gallery_acl_tip')
        // Caption font size taken from the shared resource set.
        .fontSize($r('app.float.pp_font_caption'))
        // Secondary text color from the shared resource set.
        .fontColor($r('app.color.pp_text_secondary'))
        // Stretch the tip to the full card width.
        .width('100%')
    }
    // Stretch the permission card to the full page width.
    .width('100%')
    // Inner padding of the permission card.
    .padding('16vp')
    // Card background color from the shared resource set.
    .backgroundColor($r('app.color.pp_card'))
    // Medium corner radius from the shared resource set.
    .borderRadius($r('app.float.pp_radius_m'))
    // Left align every line inside the card.
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Builds the gallery scene page.
   */
  build() {
    // Navigation destination hosting the whole gallery scene.
    NavDestination() {
      // Vertical stack holding the counter row and the media grid.
      Column({ space: '12vp' }) {
        // Row holding the total amount and the selected amount.
        Row({ space: '12vp' }) {
          // Text showing how many items are loaded so far.
          Text($r('app.string.pp_gallery_count', this.items.length))
            // Stable id used by the UI test scripts.
            .id('id_gallery_count')
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Secondary text color from the shared resource set.
            .fontColor($r('app.color.pp_text_secondary'))
            // Let the counter take the remaining width next to the selected text.
            .layoutWeight(1)
          // Text showing how many items are selected now.
          Text($r('app.string.pp_gallery_selected', this.store.count()))
            // Stable id used by the UI test scripts.
            .id('id_gallery_selected')
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Brand text color from the shared resource set.
            .fontColor($r('app.color.pp_brand'))
        }
        // Stretch the counter row to the full page width.
        .width('100%')

        // Branch on the granted permission state.
        if (this.permissionState === PERMISSION_GRANTED) {
          // Three column grid holding the loaded media items.
          Grid() {
            // Render one grid item per loaded media item.
            Repeat<MediaMeta>(this.items)
              // Build the grid item for the current media item.
              .each((repeatItem: RepeatItem<MediaMeta>) => {
                // Single grid cell of the media grid.
                GridItem() {
                  // Stack placing the selection badge over the thumbnail.
                  Stack({ alignContent: Alignment.TopEnd }) {
                    // Thumbnail image of the media item.
                    Image(repeatItem.item.uri)
                      // Stable id used by the UI test scripts.
                      .id(`id_gallery_item_${repeatItem.index}`)
                      // Stretch the thumbnail to the full cell width.
                      .width('100%')
                      // Keep the thumbnail square.
                      .aspectRatio(1)
                      // Crop the thumbnail to fill the square cell.
                      .objectFit(ImageFit.Cover)
                      // Small corner radius from the shared resource set.
                      .borderRadius($r('app.float.pp_radius_s'))
                      // Selection border drawn only for the selected items.
                      .border({
                        width: this.store.hasUri(repeatItem.item.uri) ? BORDER_WIDTH : 0,
                        color: $r('app.color.pp_brand'),
                        radius: $r('app.float.pp_radius_s')
                      })
                    // Selection badge shown only for the selected items.
                    if (this.store.hasUri(repeatItem.item.uri)) {
                      // Text carrying the one based selection order number.
                      Text(`${this.store.pickedUris.indexOf(repeatItem.item.uri) + 1}`)
                        // Caption font size taken from the shared resource set.
                        .fontSize($r('app.float.pp_font_caption'))
                        // Inverted text color from the shared resource set.
                        .fontColor($r('app.color.pp_card'))
                        // Brand background color from the shared resource set.
                        .backgroundColor($r('app.color.pp_brand'))
                        // Rounded corners of the badge.
                        .borderRadius('10vp')
                        // Symmetric padding around the order number.
                        .padding({
                          left: '6vp',
                          right: '6vp',
                          top: '1vp',
                          bottom: '1vp'
                        })
                        // Outer margin of the badge inside the stack.
                        .margin('4vp')
                    }
                  }
                  // Tapping the cell toggles the selection state of the item.
                  .onClick(() => this.toggle(repeatItem.item))
                }
              })
              // Identity of each repeated item, derived from the item uri.
              .key((item: MediaMeta): string => item.uri)
          }
          // Stable id used by the UI test scripts.
          .id('id_gallery_grid')
          // Three equal columns defined by the shared template constant.
          .columnsTemplate(GRID_COLUMNS)
          // Horizontal gap between grid cells.
          .columnsGap('6vp')
          // Vertical gap between grid rows.
          .rowsGap('6vp')
          // Let the grid take the remaining page height.
          .layoutWeight(1)
          // Request the next page once the grid bottom is reached.
          .onReachEnd(() => this.loadMore())

          // Footer text describing the loading or end state.
          Text(this.footerText())
            // Stable id used by the UI test scripts.
            .id('id_gallery_footer')
            // Caption font size taken from the shared resource set.
            .fontSize($r('app.float.pp_font_caption'))
            // Secondary text color from the shared resource set.
            .fontColor($r('app.color.pp_text_secondary'))
            // Stretch the footer to the full page width.
            .width('100%')
            // Center the footer text horizontally.
            .textAlign(TextAlign.Center)
        } else {
          // Permission card shown while the permission is missing.
          this.permissionCard()
          // Filler pushing the permission card to the top of the page.
          Blank()
        }
      }
      // Stretch the page column to the full width.
      .width('100%')
      // Stretch the page column to the full height.
      .height('100%')
      // Page level padding of the column.
      .padding('16vp')
      // Stack the children from the top of the page.
      .justifyContent(FlexAlign.Start)
      // Left align the children inside the column.
      .alignItems(HorizontalAlign.Start)
      // Page background color from the shared resource set.
      .backgroundColor($r('app.color.pp_bg_page'))
    }
    // Page title shown in the navigation bar.
    .title($r('app.string.pp_home_scene_gallery_title'))
    // Page background color from the shared resource set.
    .backgroundColor($r('app.color.pp_bg_page'))
  }
}
