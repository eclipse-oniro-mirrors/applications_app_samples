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
import { effectKit } from '@kit.ArkGraphics2D';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { EditParams, MediaFilterType, ProcessOutput, ExportResult } from './MediaModels';
import { ColorMatrixUtil } from './ColorMatrixUtil';
import {
  clamp,
  drawWatermark,
  ensureUriReadable,
  readUriBytes,
  JPEG_FORMAT,
  MIN_MAX_EDGE,
  MIN_QUALITY,
  MAX_QUALITY
} from './ImageTaskUtils';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

/**
 * Reads the picked uri with sendablePhotoAccessHelper, then crops, rotates, filters, watermarks and compresses
 * the image on a TaskPool worker thread.
 * @param helper Sendable access helper that proves the picker grant is still valid.
 * @param uri Uri granted by the system picker.
 * @param params Edit parameters produced by the editor page.
 * @returns Encoded image bytes plus the dimensions of the processed image.
 */
@Concurrent
export async function processImage(helper: sendablePhotoAccessHelper.PhotoAccessHelper, uri: string,
  params: EditParams): Promise<ProcessOutput> {
  // Log and trace tag, local because a @Concurrent function may only capture import or local variables.
  const TAG: string = 'MediaProcessTask';
  // Smallest rotation in degrees that is worth a pixel map rotate call.
  const ROTATION_EPSILON: number = 0.001;
  // Neutral contrast value of the identity colour transform.
  const NEUTRAL_CONTRAST: number = 1;
  // Neutral saturation value of the identity colour transform.
  const NEUTRAL_SATURATION: number = 1;
  // Open the trace slice of the decode step on the worker thread.
  Trace.start('MediaProcessTask.processImage.decode');
  // Declare the decoded pixel map and its metadata outside so both survive the try block.
  let pixelMap: image.PixelMap;
  // Declare the decoded image info, it carries the size used by crop, watermark and the result.
  let filteredInfo: image.ImageInfo;
  // Declare the encoded byte count, read from the packer output below.
  let sourceByteLength: number = 0;
  try {
    // Fail fast when the picker grant is gone, the helper query is cheap compared to a decode.
    await ensureUriReadable(helper, uri);
    // Read the raw bytes of the uri inside the worker, no main thread IO is involved.
    const sourceBuffer: ArrayBuffer = readUriBytes(uri);
    // Remember the original byte count so the caller can compute the compression ratio.
    sourceByteLength = sourceBuffer.byteLength;
    // Wrap the bytes into an image source for decoding.
    const source: image.ImageSource = image.createImageSource(sourceBuffer);
    // Read the original dimensions before any scaling is applied.
    const info: image.ImageInfo = await source.getImageInfo();
    // Use the longer edge as the scaling reference so the aspect ratio is kept.
    const longestEdge: number = Math.max(info.size.width, info.size.height);
    // Never scale below the configured minimum edge, that keeps tiny images readable.
    const maxEdge: number = Math.max(MIN_MAX_EDGE, params.maxEdge);
    // Compute the downscale factor, one means the image already fits the bound.
    const ratio: number = longestEdge > maxEdge ? maxEdge / longestEdge : 1;
    // Describe the decode size so huge photos are never fully allocated.
    const decodeOptions: image.DecodingOptions = {
      desiredSize: {
        width: Math.max(1, Math.round(info.size.width * ratio)),
        height: Math.max(1, Math.round(info.size.height * ratio))
      }
    };
    // Decode the scaled pixel map.
    pixelMap = await source.createPixelMap(decodeOptions);
    // Release the source as soon as the decode finished, the bytes are no longer needed.
    source.release();
    // Read the real size of the decoded pixel map, rounding may differ from desiredSize.
    const decodedInfo: image.ImageInfo = await pixelMap.getImageInfo();
    // Convert the normalised left crop handle into a pixel column.
    const left: number = Math.floor(decodedInfo.size.width * clamp(params.cropLeft, 0, 1));
    // Convert the normalised top crop handle into a pixel row.
    const top: number = Math.floor(decodedInfo.size.height * clamp(params.cropTop, 0, 1));
    // Convert the normalised right crop handle into a pixel column.
    const right: number = Math.floor(decodedInfo.size.width * clamp(params.cropRight, 0, 1));
    // Convert the normalised bottom crop handle into a pixel row.
    const bottom: number = Math.floor(decodedInfo.size.height * clamp(params.cropBottom, 0, 1));
    // Width of the cropped rectangle in pixels.
    const cropWidth: number = right - left;
    // Height of the cropped rectangle in pixels.
    const cropHeight: number = bottom - top;
    // Only crop when the rectangle is valid and actually smaller than the decoded image.
    if (cropWidth > 0 && cropHeight > 0 && (cropWidth < decodedInfo.size.width ||
      cropHeight < decodedInfo.size.height)) {
      // Describe the crop region in pixel coordinates.
      const region: image.Region = {
        x: left,
        y: top,
        size: {
          width: cropWidth,
          height: cropHeight
        }
      };
      // Apply the crop in place, pixelMap now holds the cropped image.
      await pixelMap.crop(region);
    }

    // Rotation runs after cropping so the drag rectangle on the preview maps one to one.
    if (Math.abs(params.rotation) > ROTATION_EPSILON) {
      // Rotate the cropped image by the requested angle in degrees.
      await pixelMap.rotate(params.rotation);
    }

    // A colour effect is only needed when the filter or one of the colour values changed.
    const needColorEffect: boolean = params.filter !== MediaFilterType.ORIGINAL ||
      Math.abs(params.brightness) > ROTATION_EPSILON ||
      Math.abs(params.contrast - NEUTRAL_CONTRAST) > ROTATION_EPSILON ||
      Math.abs(params.saturation - NEUTRAL_SATURATION) > ROTATION_EPSILON;
    // Skip the whole effect step for an untouched image, it costs a full pixel copy.
    if (needColorEffect) {
      // Bind an effect filter to the current pixel map.
      const effectFilter: effectKit.Filter = effectKit.createEffect(pixelMap);
      // Apply the brightness lift only when the user moved the slider.
      if (Math.abs(params.brightness) > ROTATION_EPSILON) {
        // Brightness is normalised to the 0..1 range expected by the kit.
        effectFilter.brightness(clamp(params.brightness, 0, 1));
      }
      // The grey filter is an exact grayscale conversion.
      if (params.filter === MediaFilterType.GRAY) {
        // Convert every channel to luminance.
        effectFilter.grayscale();
      }
      // The invert filter negates every channel.
      if (params.filter === MediaFilterType.INVERT) {
        // Invert the colours of the current pixel map.
        effectFilter.invert();
      }
      // Contrast and saturation always go through the shared colour matrix builder.
      effectFilter.setColorMatrix(ColorMatrixUtil.build(params.contrast, params.saturation, params.filter));
      // Read the processed pixel map produced by the effect chain.
      const effected: image.PixelMap = effectFilter.getPixelMap();
      // Release the input pixel map so only one full image stays in memory.
      pixelMap.release();
      // Continue with the processed pixel map.
      pixelMap = effected;
    }

    // Read the final size after crop, rotate and effects; it is reported to the caller.
    filteredInfo = await pixelMap.getImageInfo();
    // Draw the watermark only when the user typed a text.
    if (params.watermark.length > 0) {
      // Draw the text into the bottom margin, the helper keeps the font size proportional.
      drawWatermark(pixelMap, params.watermark, filteredInfo.size.height);
    }

    // Create the encoder used for the final JPEG.
    const packer: image.ImagePacker = image.createImagePacker();
    // Describe the output format and the compression quality requested by the editor.
    const packOption: image.PackingOption = {
      format: JPEG_FORMAT,
      quality: Math.round(clamp(params.quality, MIN_QUALITY, MAX_QUALITY))
    };
    // Encode the pixel map into a JPEG byte buffer.
    const outputBuffer: ArrayBuffer = await packer.packing(pixelMap, packOption);
    // Release the packer, the encode is finished.
    packer.release();
    // Release the pixel map, everything needed is in the byte buffer now.
    pixelMap.release();

    // Build the transferable result object of the worker.
    const result: ProcessOutput = new ProcessOutput();
    // Hand the encoded bytes back to the UI thread.
    result.buffer = outputBuffer;
    // Report the width of the processed image.
    result.width = filteredInfo.size.width;
    // Report the height of the processed image.
    result.height = filteredInfo.size.height;
    // Report the encoded size so the caller can show the compression ratio.
    result.byteLength = outputBuffer.byteLength;
    // Report the original size, captured before the decode.
    result.sourceByteLength = sourceByteLength;
    // Log sizes only, the pixel data never reaches the log stream.
    Logger.info(TAG, 'processImage done, in ' + result.sourceByteLength + ' bytes, out ' + result.byteLength +
      ' bytes, ' + result.width + 'x' + result.height);
    // Hand the result back to the task pool.
    return result;
  } catch (error) {
    // Log the failure without the uri or any pixel content.
    Logger.error(TAG, 'processImage failed: ' + String(error));
    // Rethrow the original value when it already is a real Error instance.
    if (error instanceof Error) {
      throw error;
    }
    // Wrap any other value because ArkTS only allows throwing Error instances.
    throw new Error('processImage failed: ' + String(error));
  } finally {
    // Always close the decode slice so the trace file stays balanced on both paths.
    Trace.finish('MediaProcessTask.processImage.decode');
  }
}

/**
 * Reads a picker-granted uri and writes the original bytes into the application sandbox on a worker thread.
 * @param helper Sendable access helper that proves the picker grant is still valid.
 * @param uri Uri granted by the system picker.
 * @param targetPath Absolute sandbox path of the exported file.
 * @returns Result object carrying the outcome plus the source and target identifiers.
 */
@Concurrent
export async function exportUriToSandbox(helper: sendablePhotoAccessHelper.PhotoAccessHelper, uri: string,
  targetPath: string): Promise<ExportResult> {
  // Log and trace tag, local because a @Concurrent function may only capture import or local variables.
  const TAG: string = 'MediaProcessTask';
  // Open the trace slice of the sandbox export, the copy is the expensive part.
  Trace.start('MediaProcessTask.exportUriToSandbox');
  // Build the result object first so every branch can fill it in and return it.
  const result: ExportResult = new ExportResult();
  // Echo the source uri back, the caller maps the entry to its own list item.
  result.sourceUri = uri;
  // Echo the target path back, the caller reports it in the cache list.
  result.targetPath = targetPath;
  try {
    // Fail fast when the picker grant is gone, before the target file is created.
    await ensureUriReadable(helper, uri);
    // Read the raw bytes of the uri inside the worker thread.
    const buffer: ArrayBuffer = readUriBytes(uri);
    // Create or truncate the target file and keep its descriptor.
    const file: fs.File = fs.openSync(targetPath,
      fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    try {
      // Copy the bytes into the sandbox file in one synchronous write.
      fs.writeSync(file.fd, buffer);
    } finally {
      // Always close the descriptor, also when the write above throws.
      fs.closeSync(file);
    }
    // Report the copied byte count.
    result.size = buffer.byteLength;
    // Mark the export as successful.
    result.success = true;
    // Log the copied size only, never the uri or the target path.
    Logger.info(TAG, 'exportUriToSandbox copied ' + result.size + ' bytes');
    // Hand the successful result back to the task pool.
    return result;
  } catch (error) {
    // Log the failure with the raw error text, no path is included.
    Logger.error(TAG, 'exportUriToSandbox failed: ' + String(error));
    // Mark the export as failed so the caller can show the error state.
    result.success = false;
    // Keep the error text so the caller can display it to the user.
    result.message = String(error);
    // Hand the failed result back, this function never throws.
    return result;
  } finally {
    // Always close the trace slice so the trace file stays balanced on both paths.
    Trace.finish('MediaProcessTask.exportUriToSandbox');
  }
}
