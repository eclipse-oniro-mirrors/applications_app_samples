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

/**
 * Preset filters that can be applied on the worker thread.
 */
export enum MediaFilterType {
  /** No filter, the original colours are kept. */
  ORIGINAL = 'original',
  /** Full grayscale conversion of every channel. */
  GRAY = 'gray',
  /** Negation of every colour channel. */
  INVERT = 'invert',
  /** Warm tint that pushes the red channel up and the blue channel down. */
  WARM = 'warm',
  /** Cool tint that pushes the blue channel up and the red channel down. */
  COOL = 'cool',
  /** Contrast boost around the middle grey point. */
  HIGH_CONTRAST = 'highContrast'
}

/**
 * Media metadata used by the gallery, the picker result and the edit page.
 */
export class MediaMeta {
  /** Uri of the asset, either a media library uri or a picker granted uri. */
  uri: string = '';
  /** User visible file name of the asset, without any directory part. */
  displayName: string = '';
  /** Media type enum value reported by the media library, image or video. */
  mediaType: number = 0;
  /** Size of the asset in bytes. */
  size: number = 0;
  /** Width of the asset in pixels, zero when the column was not fetched. */
  width: number = 0;
  /** Height of the asset in pixels, zero when the column was not fetched. */
  height: number = 0;
  /** Mime type text of the asset, empty when the column was not fetched. */
  mimeType: string = '';

  /**
   * Builds a metadata entry from the fields read out of the media library.
   * @param uri Uri of the asset.
   * @param displayName User visible file name of the asset.
   * @param mediaType Media type enum value reported by the library.
   * @param size Size of the asset in bytes.
   * @param width Width of the asset in pixels.
   * @param height Height of the asset in pixels.
   * @param mimeType Mime type text of the asset.
   */
  constructor(uri: string, displayName: string, mediaType: number, size: number, width: number, height: number,
    mimeType: string) {
    // Store the uri that identifies the asset.
    this.uri = uri;
    // Store the user visible file name.
    this.displayName = displayName;
    // Store the media type enum value.
    this.mediaType = mediaType;
    // Store the byte size.
    this.size = size;
    // Store the pixel width.
    this.width = width;
    // Store the pixel height.
    this.height = height;
    // Store the mime type text.
    this.mimeType = mimeType;
  }
}

/**
 * Parameters transferred to the worker thread. Plain data only.
 */
export class EditParams {
  /** Rotation angle in degrees applied after the crop. */
  rotation: number = 0;
  /** Left crop handle, normalised to the 0..1 range. */
  cropLeft: number = 0;
  /** Top crop handle, normalised to the 0..1 range. */
  cropTop: number = 0;
  /** Right crop handle, normalised to the 0..1 range. */
  cropRight: number = 1;
  /** Bottom crop handle, normalised to the 0..1 range. */
  cropBottom: number = 1;
  /** Preset filter selected in the editor. */
  filter: MediaFilterType = MediaFilterType.ORIGINAL;
  /** Brightness lift in the 0..1 range. */
  brightness: number = 0;
  /** Contrast multiplier, one means the identity transform. */
  contrast: number = 1;
  /** Saturation multiplier, one means the identity transform. */
  saturation: number = 1;
  /** Watermark text drawn into the bottom margin, empty disables it. */
  watermark: string = '';
  /** JPEG compression quality in the 1..100 range. */
  quality: number = 80;
  /** Longest edge of the output image in pixels. */
  maxEdge: number = 1600;
}

/**
 * Raw output produced by the worker thread.
 */
export class ProcessOutput {
  /** Encoded JPEG bytes of the processed image. */
  buffer: ArrayBuffer = new ArrayBuffer(0);
  /** Width of the processed image in pixels. */
  width: number = 0;
  /** Height of the processed image in pixels. */
  height: number = 0;
  /** Byte length of the encoded buffer. */
  byteLength: number = 0;
  /** Byte length of the original input, used for the compression ratio. */
  sourceByteLength: number = 0;
}

/**
 * Result returned to the UI thread after decoding.
 */
export class EditOutcome {
  /** Decoded pixel map shown by the editor, null before the first decode. */
  pixelMap: image.PixelMap | null = null;
  /** Raw worker output that produced the pixel map. */
  output: ProcessOutput = new ProcessOutput();
  /** Wall clock time spent inside the task pool, in milliseconds. */
  workerCost: number = 0;
  /** Wall clock time spent decoding the worker output, in milliseconds. */
  decodeCost: number = 0;
}

/**
 * One entry of the application sandbox output directory.
 */
export class CacheFile {
  /** File name inside the output directory, without any directory part. */
  name: string = '';
  /** Absolute path of the cached file. */
  path: string = '';
  /** Size of the cached file in bytes. */
  size: number = 0;
  /** Last modification time in milliseconds since the epoch. */
  modifiedTime: number = 0;

  /**
   * Builds one cache entry from a directory listing.
   * @param name File name inside the output directory.
   * @param path Absolute path of the cached file.
   * @param size Size of the cached file in bytes.
   * @param modifiedTime Last modification time in milliseconds since the epoch.
   */
  constructor(name: string, path: string, size: number, modifiedTime: number) {
    // Store the file name shown in the cache list.
    this.name = name;
    // Store the absolute path used for opening and removing the file.
    this.path = path;
    // Store the byte size used by the total size calculation.
    this.size = size;
    // Store the modification time used for the newest first ordering.
    this.modifiedTime = modifiedTime;
  }
}

/**
 * Result of exporting one picked uri into the sandbox.
 */
export class ExportResult {
  /** Picker granted uri that was exported. */
  sourceUri: string = '';
  /** Absolute sandbox path of the exported file. */
  targetPath: string = '';
  /** Number of bytes written into the sandbox, zero on failure. */
  size: number = 0;
  /** True when the whole file was copied without an error. */
  success: boolean = false;
  /** Error text of a failed export, empty on success. */
  message: string = '';
}
