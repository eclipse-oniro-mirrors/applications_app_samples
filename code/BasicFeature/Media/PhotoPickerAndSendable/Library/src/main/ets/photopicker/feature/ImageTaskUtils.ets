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

import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { drawing } from '@kit.ArkGraphics2D';
import { dataSharePredicates } from '@kit.ArkData';
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

/** Module tag used by every log line emitted from this file. */
const TAG: string = 'ImageTaskUtils';

// Helper functions live in a separate module on purpose: a @Concurrent function may only use its own
// locals, parameters and imported symbols, never other functions of the file that declares it.

/** Fetch column holding the uri of a photo asset. */
export const COLUMN_URI: string = 'uri';
/** Smallest longest edge accepted by the editor. */
export const MIN_MAX_EDGE: number = 320;
/** Lowest accepted JPEG quality. */
export const MIN_QUALITY: number = 1;
/** Highest accepted JPEG quality. */
export const MAX_QUALITY: number = 100;
/** Smallest watermark font size in pixels. */
export const MIN_WATERMARK_FONT: number = 24;
/** Divisor turning the image height into the watermark font size. */
export const WATERMARK_FONT_RATIO: number = 24;
/** Divisor turning the image height into the watermark margin. */
export const WATERMARK_MARGIN_RATIO: number = 32;
/** Watermark brush colour, the alpha byte is part of the value. */
export const WATERMARK_COLOR: number = 0xA6FFFFFF;
/** Mime type used for every encoded output. */
export const JPEG_FORMAT: string = 'image/jpeg';

/**
 * Clamps a number into the inclusive range given by the caller.
 * @param value Value to clamp.
 * @param min Lower bound of the accepted range.
 * @param max Upper bound of the accepted range.
 * @returns Value limited to the given range.
 */
export function clamp(value: number, min: number, max: number): number {
  // Return the lower bound when the value falls below the range.
  if (value < min) {
    // Hand the lower bound back to the caller.
    return min;
  }
  // Return the upper bound when the value exceeds the range.
  if (value > max) {
    // Hand the upper bound back to the caller.
    return max;
  }
  // Return the value untouched when it already lies inside the range.
  return value;
}

/**
 * Reads the raw bytes of a picker-granted uri inside the worker thread.
 * @param uri Picker granted uri of the source file.
 * @returns Buffer holding the whole file content.
 */
export function readUriBytes(uri: string): ArrayBuffer {
  return Trace.withSync('ImageTaskUtils.readUriBytes', () => {
    // Open the uri read only, the picker grant allows nothing else.
    const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    try {
      // Read the file metadata so the exact buffer size is known up front.
      const stat: fs.Stat = fs.statSync(file.fd);
      // Report the file size only; the uri and the path stay out of the log.
      Logger.debug(TAG, 'readUriBytes size: ' + String(stat.size));
      // Allocate a buffer large enough for the whole file.
      const buffer: ArrayBuffer = new ArrayBuffer(stat.size);
      // Fill the buffer with the file content starting at offset zero.
      fs.readSync(file.fd, buffer, { offset: 0, length: stat.size });
      // Hand the filled buffer back to the caller.
      return buffer;
    } finally {
      // Close the descriptor on both the success and the failure path.
      fs.closeSync(file);
    }
  });
}

/**
 * Compares the current media file revision with the captured one, a cheap first stage guard.
 * @param pixelMap Decoded pixel map whose revision is checked.
 * @param expectedRevision Revision captured when the uri was resolved, zero skips the check.
 */
export function checkPixelRevision(pixelMap: image.PixelMap, expectedRevision: number): void {
  // Read the current revision of the pixel map, the getter never touches the pixel buffer.
  const currentRevision: number = pixelMap.getUniqueId();
  // Report both revisions, they are opaque identifiers and carry no user content.
  Logger.debug(TAG, 'checkPixelRevision current: ' + String(currentRevision) + ', expected: ' +
    String(expectedRevision));
  // Skip the comparison for the sentinel value used when no revision was captured.
  if (expectedRevision === 0) {
    // Hand control back to the caller without any check.
    return;
  }
  // Reject the pixel map when the revisions do not match any more.
  if (currentRevision !== expectedRevision) {
    // Log the mismatch before raising the error.
    Logger.error(TAG, 'checkPixelRevision mismatch, the pixel map changed while it was processed');
    // Abort the caller with a stable error text.
    throw new Error('the pixel map changed while it was processed');
  }
}

/**
 * Prints one decoded pixel map into the hilog stream for debugging purposes only.
 * The dump helper lives in this module because a @Concurrent function may only reference
 * imported symbols, and this module is a plain ArkTS module.
 * @param pixelMap Pixel map that has to be dumped.
 * @param label Short label prefixed to every dumped line.
 * @returns Empty string, the worker only needs to await the dump call.
 */
export function dumpFilteredPixelMap(pixelMap: image.PixelMap, label: string): string {
  return Trace.withSync('ImageTaskUtils.dumpFilteredPixelMap', () => {
    // Log the start of the dump so the block boundaries are visible in the log stream.
    Logger.debug(TAG, 'dumpFilteredPixelMap begin, label: ' + label);
    try {
      // Read the image descriptor, the getter never touches the pixel buffer.
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      // Report the descriptor only; it carries no pixel content and no user data.
      Logger.debug(TAG, 'dumpFilteredPixelMap info, width: ' + String(info.size.width) +
        ', height: ' + String(info.size.height) + ', pixelFormat: ' + String(info.pixelFormat));
    } catch (error) {
      // Report the dump failure with its raw text, no pixel content is included.
      Logger.error(TAG, 'dumpFilteredPixelMap failed: ' + String(error));
    }
    // Log the end of the dump block.
    Logger.debug(TAG, 'dumpFilteredPixelMap end, label: ' + label);
    // Hand an empty string back, the dump output already went to hilog.
    return '';
  });
}

/**
 * Uses the sendable PhotoAccessHelper to prove the uri is still granted by the picker.
 * @param helper Sendable helper of the current ability context.
 * @param uri Picker granted uri that has to stay readable.
 */
export async function ensureUriReadable(helper: sendablePhotoAccessHelper.PhotoAccessHelper,
  uri: string): Promise<void> {
  return Trace.withAsync('ImageTaskUtils.ensureUriReadable', async () => {
    // Create the predicates used to look up the asset by uri.
    const predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    // Restrict the query to the single asset identified by the uri.
    predicates.equalTo(COLUMN_URI, uri);
    // Build the fetch options; no extra column is needed for the existence check.
    const options: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    // Ask the helper for the assets matching the predicates.
    const result: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await helper.getAssets(options);
    try {
      // Report how many assets matched, a count of zero means the grant is gone.
      Logger.debug(TAG, 'ensureUriReadable count: ' + String(result.getCount()));
      // Reject the uri when the picker grant no longer resolves to an asset.
      if (result.getCount() === 0) {
        // Log the rejected grant without printing the uri.
        Logger.error(TAG, 'ensureUriReadable the uri is not granted by the picker');
        // Abort the caller with the same error text as before.
        throw new Error('the uri is not granted by the picker');
      }
    } finally {
      // Close the fetch result on both the success and the failure path.
      result.close();
    }
  });
}

/**
 * Draws the watermark text into the bottom margin of the given pixel map.
 * @param pixelMap Pixel map that receives the watermark.
 * @param text Watermark text, empty disables the call at the caller side.
 * @param height Height of the pixel map in pixels.
 */
export function drawWatermark(pixelMap: image.PixelMap, text: string, height: number): void {
  return Trace.withSync('ImageTaskUtils.drawWatermark', () => {
    // Wrap the pixel map into a canvas so drawing calls can be issued on it.
    const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
    // Create the brush that paints the watermark glyphs.
    const brush: drawing.Brush = new drawing.Brush();
    // Enable anti aliasing so the text edges stay smooth.
    brush.setAntiAlias(true);
    // Apply the semi transparent white watermark colour.
    brush.setColor(WATERMARK_COLOR);
    // Attach the brush to the canvas, required before any draw call.
    canvas.attachBrush(brush);
    // Create the font used to shape the watermark text.
    const font: drawing.Font = new drawing.Font();
    // Scale the font with the image height but never below the readable minimum.
    font.setSize(Math.max(MIN_WATERMARK_FONT, Math.round(height / WATERMARK_FONT_RATIO)));
    // Build the text blob of the watermark in UTF-8 encoding.
    const blob: drawing.TextBlob = drawing.TextBlob.makeFromString(text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    // Scale the margin with the image height so the watermark keeps its distance.
    const margin: number = Math.round(height / WATERMARK_MARGIN_RATIO);
    // Report the derived geometry only, the watermark text stays out of the log.
    Logger.debug(TAG, 'drawWatermark textLength: ' + String(text.length) + ', margin: ' + String(margin));
    // Draw the blob into the bottom left corner of the image.
    canvas.drawTextBlob(blob, margin, height - margin);
    // Detach the brush so the canvas can be released safely.
    canvas.detachBrush();
  });
}
