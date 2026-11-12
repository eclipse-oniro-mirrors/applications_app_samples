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

import { photoAccessHelper, PhotoSource } from '@kit.MediaLibraryKit';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { fileIo as fs } from '@kit.CoreFileKit';
import { MediaMeta } from './MediaModels';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

// Module tag attached to every log line emitted by this feature so the stream stays grouped.
const TAG: string = 'PhotoAccessFeature';
// Columns fetched for the full library page query; covers size, dimensions, type and name.
const FETCH_COLUMNS: string[] = ['title', 'size', 'width', 'height', 'mime_type', 'media_type', 'display_name'];
// Upper bound of assets inspected by the newest-asset scan, keeps the query small and cheap.
const RECENT_SCAN_LIMIT: number = 50;
// Values above this bound are treated as milliseconds instead of seconds by date_added.
const MS_THRESHOLD: number = 100000000000;
// Column name of the asset size in bytes.
const COLUMN_SIZE: string = 'size';
// Column name of the asset width in pixels.
const COLUMN_WIDTH: string = 'width';
// Column name of the asset height in pixels.
const COLUMN_HEIGHT: string = 'height';
// Column name of the mime type text of the asset.
const COLUMN_MIME_TYPE: string = 'mime_type';
// Column name of the media type enum value.
const COLUMN_MEDIA_TYPE: string = 'media_type';
// Column name of the creation timestamp, used for ordering and window filtering.
const COLUMN_DATE_ADDED: string = 'date_added';
// Column name of the album that owns the asset.
const COLUMN_OWNER_ALBUM_ID: string = 'owner_album_id';
// Column name of the asset uri, used as the equality filter for picker granted uris.
const COLUMN_URI: string = 'uri';
// Milliseconds in one second, used to normalise the date_added unit.
const ONE_SECOND_MS: number = 1000;
// Album logical path of the camera roll on the local device.
const CAMERA_LPATH: string = '/DCIM/Camera';
// Album logical path of the screenshot folder on the local device.
const SCREENSHOT_LPATH: string = '/Pictures/Screenshots';
// Columns of the newest-asset query, the date column is required by the time window filter.
const FETCH_COLUMNS_WITH_DATE: string[] = FETCH_COLUMNS.concat([COLUMN_DATE_ADDED]);

/**
 * Wraps the main-thread photoAccessHelper APIs used by the scenes.
 * Every query is traced and every failure is logged with the module tag; no uri, path or pixel
 * data is ever written to the log stream.
 */
export class PhotoAccessFeature {
  /**
   * Creates the access helper bound to the given context.
   * @param context Ability or application context used to reach the media library.
   * @returns Helper instance used by the other methods of this class.
   */
  static createHelper(context: common.Context): photoAccessHelper.PhotoAccessHelper {
    // Delegate to the kit factory, which resolves the permission state of the caller.
    return photoAccessHelper.getPhotoAccessHelper(context);
  }

  /**
   * Queries one page of the full media library. Requires ohos.permission.READ_IMAGEVIDEO.
   * @param context Context used to reach the media library.
   * @param offset Zero based position of the first asset of the page.
   * @param pageSize Number of assets requested for this page.
   * @returns Metadata of the assets of the requested page.
   */
  static async queryPage(context: common.Context, offset: number, pageSize: number): Promise<MediaMeta[]> {
    // Open the trace slice before the first kit call so the whole page query is measured.
    Trace.start('PhotoAccessFeature.queryPage');
    try {
      // Resolve the helper once and reuse it for the single fetch of this page.
      const helper: photoAccessHelper.PhotoAccessHelper = PhotoAccessFeature.createHelper(context);
      // Build an empty predicate set that is filled in the next two steps.
      const predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      // Sort from the newest asset to the oldest one so page zero holds the latest media.
      predicates.orderByDesc(COLUMN_DATE_ADDED);
      // Apply the page window on top of the ordering.
      predicates.limit(pageSize, offset);
      // Describe the columns to fetch and the filters to apply.
      const options: photoAccessHelper.FetchOptions = {
        fetchColumns: FETCH_COLUMNS,
        predicates: predicates
      };
      // Run the query and keep the fetch result, which owns a native cursor.
      const result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(options);
      try {
        // Materialise the whole page in one call, cheaper than fetching asset by asset.
        const assets: photoAccessHelper.PhotoAsset[] = await result.getAllObjects();
        // Collect the converted metadata in a typed buffer.
        const metas: MediaMeta[] = [];
        // Walk the assets with an index based loop, ArkTS forbids for..in over arrays.
        for (let index = 0; index < assets.length; index++) {
          // Convert one asset into the shared metadata contract.
          metas.push(PhotoAccessFeature.toMeta(assets[index]));
        }
        // Log the page geometry only, the assets themselves stay untouched.
        Logger.debug(TAG, 'queryPage offset ' + offset + ', size ' + pageSize + ', got ' + metas.length);
        // Hand the converted page back to the caller.
        return metas;
      } finally {
        // Always release the native cursor, on success as well as on failure.
        result.close();
      }
    } finally {
      // Always close the trace slice so the captured trace file stays balanced.
      Trace.finish('PhotoAccessFeature.queryPage');
    }
  }

  /**
   * Queries metadata of picker-granted uris. No media permission is required here.
   * @param context Context used to reach the media library.
   * @param uris Uris returned by the system picker.
   * @returns One metadata entry per readable uri, unreadable uris are skipped.
   */
  static async queryByUris(context: common.Context, uris: string[]): Promise<MediaMeta[]> {
    // Open the trace slice for the whole batch of uri lookups.
    Trace.start('PhotoAccessFeature.queryByUris');
    try {
      // Resolve the helper once, every uri of the batch shares it.
      const helper: photoAccessHelper.PhotoAccessHelper = PhotoAccessFeature.createHelper(context);
      // Collect the readable metadata entries in a typed buffer.
      const metas: MediaMeta[] = [];
      // Walk the uris one by one, a single failing uri must not abort the batch.
      for (let index = 0; index < uris.length; index++) {
        // Read the current uri, it is used for the equality filter and for the size lookup.
        const uri: string = uris[index];
        // Build a fresh predicate set because each uri needs its own equality filter.
        const predicates: dataSharePredicates.DataSharePredicates =
          new dataSharePredicates.DataSharePredicates();
        // Filter the asset whose uri column equals the current picker uri.
        predicates.equalTo(COLUMN_URI, uri);
        // Fetch no column so only the cheap default columns are returned.
        const options: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        try {
          // Run the single-asset query for the current uri.
          const result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper.getAssets(options);
          try {
            // Read the first matching asset, undefined means the grant is gone.
            const asset: photoAccessHelper.PhotoAsset = await result.getFirstObject();
            // Only a present asset contributes one entry to the result list.
            if (asset !== undefined) {
              // Read the byte size through file IO because size is not in the default columns.
              const size: number = await PhotoAccessFeature.getFileSize(uri);
              // Only the default columns (uri, media_type, subtype, display_name) are fetched here,
              // so width and height stay unknown and the editor derives the ratio from the image itself.
              const meta: MediaMeta = new MediaMeta(uri, asset.displayName,
                PhotoAccessFeature.readNumber(asset, COLUMN_MEDIA_TYPE), size, 0, 0, '');
              // Keep the converted entry.
              metas.push(meta);
            }
          } finally {
            // Always release the native cursor opened for this uri.
            result.close();
          }
        } catch (error) {
          // Log the failing position instead of the uri so no user path reaches the log stream.
          Logger.error(TAG, 'queryByUris index ' + index + ' failed: ' + String(error));
        }
      }
      // Log the batch outcome with counts only.
      Logger.debug(TAG, 'queryByUris requested ' + uris.length + ', readable ' + metas.length);
      // Hand the readable entries back, the order follows the input list.
      return metas;
    } finally {
      // Always close the trace slice so the captured trace file stays balanced.
      Trace.finish('PhotoAccessFeature.queryByUris');
    }
  }

  /**
   * Returns the newest image or video inside the time window, optionally limited to the camera or
   * screenshot album. Stands in for getRecentPhotoInfo, which fails on some system images.
   * The time window is applied in code: some images ignore a date_added predicate on getAssets.
   * @param context Context used to reach the media library.
   * @param periodSeconds Length of the accepted time window in seconds.
   * @param source Album the asset must belong to, DEFAULT accepts every album.
   * @returns Metadata of the newest matching asset, undefined when nothing is inside the window.
   */
  static async queryNewest(context: common.Context, periodSeconds: number,
    source: PhotoSource): Promise<MediaMeta | undefined> {
    // Open the trace slice for the whole scan, including the album resolution below.
    Trace.start('PhotoAccessFeature.queryNewest');
    try {
      // Resolve the helper once for both the album lookup and the asset query.
      const helper: photoAccessHelper.PhotoAccessHelper = PhotoAccessFeature.createHelper(context);
      // Build the predicate set of the newest-asset scan.
      const predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      // Resolve the album id of the requested source, minus one means no album filter.
      const albumId: number = await PhotoAccessFeature.resolveAlbumId(helper, source);
      // Only a resolved album narrows the scan down to one folder.
      if (albumId >= 0) {
        // Restrict the scan to the camera or screenshot album.
        predicates.equalTo(COLUMN_OWNER_ALBUM_ID, albumId);
      }
      // Sort from the newest asset to the oldest one so the first hit is the answer.
      predicates.orderByDesc(COLUMN_DATE_ADDED);
      // Cap the scan so a huge library does not slow the caller down.
      predicates.limit(RECENT_SCAN_LIMIT, 0);
      // Request the default columns plus date_added, which the window filter needs.
      const options: photoAccessHelper.FetchOptions = {
        fetchColumns: FETCH_COLUMNS_WITH_DATE,
        predicates: predicates
      };
      // Run the scan and keep the fetch result that owns the native cursor.
      const result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(options);
      try {
        // Materialise the capped scan in one call.
        const assets: photoAccessHelper.PhotoAsset[] = await result.getAllObjects();
        // Take the reference time once so every candidate is compared against the same instant.
        const now: number = Date.now();
        // Convert the requested period into milliseconds to match the normalised timestamps.
        const windowMs: number = periodSeconds * ONE_SECOND_MS;
        // Read the timestamp of the first candidate, zero when the scan came back empty.
        const firstAdded: number = assets.length > 0 ?
          PhotoAccessFeature.readNumber(assets[0], COLUMN_DATE_ADDED) : 0;
        // Log counts and timings only, no uri or album path is written.
        Logger.info(TAG, 'queryNewest scanned ' + assets.length + ', first date_added ' + firstAdded +
          ', now ' + now + ', window ' + windowMs);
        // Walk the candidates from the newest one downwards.
        for (let index = 0; index < assets.length; index++) {
          // Read the creation timestamp of the current candidate.
          const added: number = PhotoAccessFeature.readNumber(assets[index], COLUMN_DATE_ADDED);
          // date_added is documented in seconds but some builds report milliseconds.
          const addedMs: number = added > MS_THRESHOLD ? added : added * ONE_SECOND_MS;
          // The first candidate inside the window wins because the list is newest first.
          if (now - addedMs <= windowMs) {
            // Convert the winning asset and stop the scan right away.
            return PhotoAccessFeature.toMeta(assets[index]);
          }
        }
        // Nothing inside the window, so the caller has to fall back to the picker.
        return undefined;
      } finally {
        // Always release the native cursor opened by the scan.
        result.close();
      }
    } finally {
      // Always close the trace slice so the captured trace file stays balanced.
      Trace.finish('PhotoAccessFeature.queryNewest');
    }
  }

  /**
   * Resolves the album id that belongs to a picker source.
   * @param helper Helper used to look the logical path up.
   * @param source Picker source selected by the UI switch.
   * @returns Album id of the source, minus one when no album filter must be applied.
   */
  private static async resolveAlbumId(helper: photoAccessHelper.PhotoAccessHelper,
    source: PhotoSource): Promise<number> {
    // The camera source always maps to the camera roll album.
    if (source === PhotoSource.CAMERA) {
      // Ask the media library for the album id of the camera logical path.
      return await helper.getAlbumIdByLpath(CAMERA_LPATH);
    }
    // The screenshot source maps to the screenshot folder album.
    if (source === PhotoSource.SCREENSHOT) {
      // Ask the media library for the album id of the screenshot logical path.
      return await helper.getAlbumIdByLpath(SCREENSHOT_LPATH);
    }
    // Any other source keeps the scan unrestricted.
    return -1;
  }

  /**
   * Opens the full-screen system picker. The returned uris are permanently authorized for this
   * app, so they can be read with getAssets or file IO afterwards.
   * @param maxSelectNumber Maximum number of assets the user may select.
   * @returns Uris granted to the caller by the picker.
   */
  static async pickFullScreen(maxSelectNumber: number): Promise<string[]> {
    // Open the trace slice, the system picker is the slowest user facing step of the flow.
    Trace.start('PhotoAccessFeature.pickFullScreen');
    try {
      // Create the option object with the kit defaults so nothing has to be reset manually.
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      // Restrict the picker to images and videos, the sample does not handle other media.
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      // Apply the caller limit on the number of selectable assets.
      options.maxSelectNumber = maxSelectNumber;
      // Show the full-screen picker and wait until the user confirms or cancels.
      const result: photoAccessHelper.PhotoSelectResult =
        await new photoAccessHelper.PhotoViewPicker().select(options);
      // Log the selection size only, the uris themselves stay out of the log stream.
      Logger.info(TAG, 'pickFullScreen picked ' + result.photoUris.length);
      // Hand the persistently granted uris back to the caller.
      return result.photoUris;
    } finally {
      // Always close the trace slice, also when the user cancels the picker.
      Trace.finish('PhotoAccessFeature.pickFullScreen');
    }
  }

  /**
   * Reads the byte size of a picker granted uri through file IO.
   * @param uri Uri granted by the system picker.
   * @returns Size of the referenced file in bytes.
   */
  static async getFileSize(uri: string): Promise<number> {
    // Open the file read only, the grant allows exactly that access.
    const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    try {
      // Stat the open descriptor so the path is not needed a second time.
      const stat: fs.Stat = fs.statSync(file.fd);
      // Hand the size of the referenced file back.
      return stat.size;
    } finally {
      // Always close the descriptor to release the native handle.
      fs.closeSync(file);
    }
  }

  /**
   * Passes the recent photo query straight through to the kit.
   * Kept for callers that need the raw kit info object instead of the metadata contract.
   * @param context Context used to reach the media library.
   * @param options Optional recent photo options built by the option factory.
   * @returns Recent photo info produced by the system.
   */
  static async getRecentInfo(context: common.Context,
    options?: photoAccessHelper.RecentPhotoOptions): Promise<photoAccessHelper.RecentPhotoInfo> {
    // Resolve the helper for this single kit call.
    const helper: photoAccessHelper.PhotoAccessHelper = PhotoAccessFeature.createHelper(context);
    // Forward the optional options object unchanged, the kit applies its own defaults.
    return await helper.getRecentPhotoInfo(options);
  }

  /**
   * Converts one kit asset into the shared metadata contract.
   * @param asset Asset read from a fetch result.
   * @returns Metadata filled from the asset columns.
   */
  private static toMeta(asset: photoAccessHelper.PhotoAsset): MediaMeta {
    // Read every field through the safe helpers so a missing column degrades instead of throwing.
    return new MediaMeta(asset.uri, asset.displayName,
      PhotoAccessFeature.readNumber(asset, COLUMN_MEDIA_TYPE),
      PhotoAccessFeature.readNumber(asset, COLUMN_SIZE),
      PhotoAccessFeature.readNumber(asset, COLUMN_WIDTH),
      PhotoAccessFeature.readNumber(asset, COLUMN_HEIGHT),
      PhotoAccessFeature.readString(asset, COLUMN_MIME_TYPE));
  }

  /**
   * Reads a numeric column of an asset with a zero fallback.
   * @param asset Asset read from a fetch result.
   * @param key Column name to read.
   * @returns Numeric value of the column, zero when missing or of another type.
   */
  private static readNumberOrZero(asset: photoAccessHelper.PhotoAsset, key: string): number {
    // Read the raw member value, it may hold any type supported by the kit.
    const value: photoAccessHelper.MemberType = asset.get(key);
    // Only a real number is accepted, other types fall through to the fallback.
    if (typeof value === 'number') {
      // Hand the numeric column value back.
      return value;
    }
    // Missing or mistyped columns degrade to zero.
    return 0;
  }

  /**
   * Reads a numeric column of an asset and logs when the column cannot be read.
   * @param asset Asset read from a fetch result.
   * @param key Column name to read.
   * @returns Numeric value of the column, zero on failure.
   */
  private static readNumber(asset: photoAccessHelper.PhotoAsset, key: string): number {
    try {
      // Delegate to the plain reader so the try block stays a single statement.
      return PhotoAccessFeature.readNumberOrZero(asset, key);
    } catch (error) {
      // Log the column name only, it is a fixed identifier and carries no user data.
      Logger.error(TAG, 'read number ' + key + ' failed: ' + String(error));
    }
    // An unreadable column degrades to zero.
    return 0;
  }

  /**
   * Reads a textual column of an asset with an empty string fallback.
   * @param asset Asset read from a fetch result.
   * @param key Column name to read.
   * @returns Text value of the column, an empty string on failure.
   */
  private static readString(asset: photoAccessHelper.PhotoAsset, key: string): string {
    try {
      // Read the raw member value, it may hold any type supported by the kit.
      const value: photoAccessHelper.MemberType = asset.get(key);
      // Only a real string is accepted, other types fall through to the fallback.
      if (typeof value === 'string') {
        // Hand the textual column value back.
        return value;
      }
      // A mistyped column degrades to an empty string and is reported once.
      Logger.warn(TAG, 'read string ' + key + ' returned a non string value');
    } catch (error) {
      // Log the column name only, it is a fixed identifier and carries no user data.
      Logger.error(TAG, 'read string ' + key + ' failed: ' + String(error));
    }
    // Missing or unreadable columns degrade to an empty string.
    return '';
  }
}
