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

import { photoAccessHelper, PhotoSource, RecentPhotoOptions } from '@kit.MediaLibraryKit';
import { Logger } from '../../utils/Logger';

// Module tag attached to every log line emitted by this factory.
const TAG: string = 'PickerOptionFactory';
// Longest accepted period of the recent photo window, in seconds (one day).
const ONE_DAY_SECONDS: number = 86400;

/**
 * Builds the option objects used by the recent photo scene.
 * Pure factory: no IO, therefore no trace slice is opened here.
 */
export class PickerOptionFactory {
  /**
   * Builds the sendable recent photo options object.
   * @param period Requested window in seconds, clamped to one day when out of range.
   * @param source Album the recent photo query is limited to.
   * @param autoRefresh Whether the system may refresh the result on its own.
   * @returns Options object accepted by the recent photo API.
   */
  static createRecentPhotoOptions(period: number, source: PhotoSource,
    autoRefresh: boolean): RecentPhotoOptions {
    // Create the options object with the kit defaults.
    const options: RecentPhotoOptions = new RecentPhotoOptions();
    // Keep the requested period only when it is positive and inside one day.
    options.period = period > 0 && period <= ONE_DAY_SECONDS ? period : ONE_DAY_SECONDS;
    // Restrict the recent window to images and videos, the sample handles nothing else.
    options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
    // Forward the album selection chosen by the UI switch.
    options.photoSource = source;
    // Forward the auto refresh switch of the UI.
    options.isAutoRefreshSupported = autoRefresh;
    // Log the normalised window and the source so a wrong switch can be spotted in the field.
    Logger.debug(TAG, 'createRecentPhotoOptions period ' + options.period);
    // Hand the fully filled options object back.
    return options;
  }

  /**
   * Builds the non-sendable recent photo options object used by the main thread helper.
   * @param period Requested window in seconds, clamped to one day when out of range.
   * @param source Album the recent photo query is limited to.
   * @returns Options object accepted by photoAccessHelper.getRecentPhotoInfo.
   */
  static createRecentQueryOptions(period: number, source: PhotoSource): photoAccessHelper.RecentPhotoOptions {
    // Build a plain object literal instead of calling the constructor: the kit data class is not
    // constructible at runtime on every system image, "new photoAccessHelper.RecentPhotoOptions()"
    // throws "Constructor is false". Every field is optional, so the literal is a complete value.
    const options: photoAccessHelper.RecentPhotoOptions = {
      // Keep the requested period only when it is positive and inside one day.
      period: period > 0 && period <= ONE_DAY_SECONDS ? period : ONE_DAY_SECONDS,
      // Restrict the recent window to images and videos, the sample handles nothing else.
      MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE,
      // Forward the album selection chosen by the UI switch.
      photoSource: source
    };
    // Log the normalised window so a wrong switch can be spotted in the field.
    Logger.debug(TAG, 'createRecentQueryOptions period ' + options.period);
    // Hand the fully filled options object back.
    return options;
  }
}
