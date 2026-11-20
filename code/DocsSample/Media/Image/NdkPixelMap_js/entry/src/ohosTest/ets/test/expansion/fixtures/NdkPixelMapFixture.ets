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
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

let sequence: number = 0;
let outputTail: Promise<void> = Promise.resolve();

export class PixelSpec {
  public width: number;
  public height: number;
  public pattern: string;
  public pixelFormat: image.PixelMapFormat;
  public alphaType: image.AlphaType;

  constructor(width: number, height: number, pattern: string,
    pixelFormat: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888,
    alphaType: image.AlphaType = image.AlphaType.OPAQUE) {
    this.width = width;
    this.height = height;
    this.pattern = pattern;
    this.pixelFormat = pixelFormat;
    this.alphaType = alphaType;
  }
}

// Input generation only. This is not a model of any native operation.
export function patternBytes(spec: PixelSpec): ArrayBuffer {
  if (!Number.isInteger(spec.width) || !Number.isInteger(spec.height) ||
    spec.width < 1 || spec.height < 1 || spec.width > 2048 || spec.height > 2048) {
    throw new Error('Fixture dimensions must be integral in [1, 2048]');
  }
  if (spec.pixelFormat !== image.PixelMapFormat.RGBA_8888 &&
    spec.pixelFormat !== image.PixelMapFormat.BGRA_8888) {
    throw new Error('Fixture supports RGBA_8888/BGRA_8888 only');
  }
  const bytes = new Uint8Array(spec.width * spec.height * 4);
  const alphas: number[] = [0, 64, 128, 255];
  const colors: number[][] = [[224, 32, 48], [32, 208, 64], [48, 64, 224], [208, 176, 32]];
  for (let y = 0; y < spec.height; y++) {
    for (let x = 0; x < spec.width; x++) {
      let r: number = 32;
      let g: number = 96;
      let b: number = 160;
      let a: number = 255;
      if (spec.pattern === 'quadrants' || spec.pattern === 'opaque-color-quadrants') {
        const quadrant = (y * 2 >= spec.height ? 2 : 0) + (x * 2 >= spec.width ? 1 : 0);
        r = colors[quadrant][0]; g = colors[quadrant][1]; b = colors[quadrant][2];
      } else if (spec.pattern === 'color-bars' || spec.pattern === 'opaque-color-bars') {
        const bar = Math.min(3, Math.floor(x * 4 / spec.width));
        r = colors[bar][0]; g = colors[bar][1]; b = colors[bar][2];
      } else if (spec.pattern === 'row-ramp' || spec.pattern === 'row-ramp-opaque') {
        r = Math.round(y * 255 / Math.max(1, spec.height - 1)); g = 96; b = 255 - r;
      } else if (spec.pattern === 'gradient' || spec.pattern === 'rgba-gradient') {
        r = Math.round(x * 255 / Math.max(1, spec.width - 1));
        g = Math.round(y * 255 / Math.max(1, spec.height - 1));
        b = (x * 17 + y * 29) % 256;
      } else if (spec.pattern === 'alpha-checker') {
        a = alphas[(x + y) % 4];
      } else if (spec.pattern !== 'solid') {
        throw new Error('Unsupported fixture pattern: ' + spec.pattern);
      }
      if (spec.alphaType === image.AlphaType.OPAQUE) {
        a = 255;
      } else if (spec.alphaType === image.AlphaType.PREMUL) {
        r = Math.round(r * a / 255); g = Math.round(g * a / 255); b = Math.round(b * a / 255);
      } else {
        throw new Error('Fixture alpha must be OPAQUE or PREMUL');
      }
      const offset = (y * spec.width + x) * 4;
      bytes[offset] = spec.pixelFormat === image.PixelMapFormat.BGRA_8888 ? b : r;
      bytes[offset + 1] = g;
      bytes[offset + 2] = spec.pixelFormat === image.PixelMapFormat.BGRA_8888 ? r : b;
      bytes[offset + 3] = a;
    }
  }
  return bytes.buffer;
}

export async function createPatternPixelMap(spec: PixelSpec): Promise<image.PixelMap> {
  return image.createPixelMap(patternBytes(spec), {
    size: { width: spec.width, height: spec.height }, pixelFormat: spec.pixelFormat,
    alphaType: spec.alphaType, editable: true
  });
}

// Raw snapshot: compares same format/alpha only, not a color-space conversion.
export async function pixelBytes(pixelMap: image.PixelMap): Promise<Uint8Array> {
  const bytes = new ArrayBuffer(pixelMap.getPixelBytesNumber());
  await pixelMap.readPixelsToBuffer(bytes);
  return new Uint8Array(bytes);
}

export function readWholeFile(path: string): ArrayBuffer {
  const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  let primaryFailed1: boolean = true;
  try {
    const size = fs.statSync(file.fd).size;
    if (size <= 0 || size > 32 * 1024 * 1024) {
      throw new Error('Invalid fixture file size');
    }
    const result: ArrayBuffer = new ArrayBuffer(size);
    const resultBytes: Uint8Array = new Uint8Array(result);
    let offset: number = 0;
    while (offset < size) {
      const chunk = new ArrayBuffer(size - offset);
      const count = fs.readSync(file.fd, chunk, { offset: offset, length: size - offset });
      if (count <= 0) {
        throw new Error('Unexpected EOF while reading fixture');
      }
      resultBytes.set(new Uint8Array(chunk, 0, count), offset);
      offset += count;
    }
    const returnValue: ArrayBuffer = result;
    primaryFailed1 = false;
    return returnValue;
  } finally {
    finishCleanup(primaryFailed1, (): void => {
      fs.closeSync(file);
    });
  }
}

function writeWholeFile(path: string, bytes: ArrayBuffer): void {
  const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  let primaryFailed2: boolean = true;
  try {
    let written: number = 0;
    while (written < bytes.byteLength) {
      const count = fs.writeSync(file.fd, bytes.slice(written));
      if (count <= 0) {
        throw new Error('Short fixture write');
      }
      written += count;
    }
    primaryFailed2 = false;
  } finally {
    finishCleanup(primaryFailed2, (): void => {
      fs.closeSync(file);
    });
  }
}

export async function packSdk(pixelMap: image.PixelMap, format: string = 'image/jpeg'): Promise<ArrayBuffer> {
  if (format !== 'image/png' && format !== 'image/jpeg') {
    throw new Error('Only PNG/JPEG fixtures');
  }
  const packer = image.createImagePacker();
  let primaryFailed3: boolean = true;
  try {
    // SDK clone can lazily materialize SRGB on its borrowed source. Do not call clone here.
    // The SDK reads into independent bytes; the encoder receives a new owned SDK PixelMap.
    const sourceInfo: PixelInfo = await pixelInfo(pixelMap);
    if (sourceInfo.isHdr || (sourceInfo.pixelFormat !== image.PixelMapFormat.RGBA_8888 &&
      sourceInfo.pixelFormat !== image.PixelMapFormat.BGRA_8888)) {
      throw new Error('Fixture packing copy requires SDR RGBA_8888 or BGRA_8888');
    }
    const sourceBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
    await pixelMap.readPixelsToBuffer(sourceBuffer);
    const denseLength: number = sourceInfo.size.width * sourceInfo.size.height * 4;
    if (sourceBuffer.byteLength < denseLength) {
      throw new Error('Fixture packing copy pixel buffer is incomplete');
    }
    // ReadPixels writes contiguous pixel rows without source padding. Slice owns its bytes.
    const packingBuffer: ArrayBuffer = sourceBuffer.slice(0, denseLength);
    const packingInput: image.PixelMap = await image.createPixelMap(packingBuffer, {
      size: sourceInfo.size,
      srcPixelFormat: sourceInfo.pixelFormat,
      pixelFormat: sourceInfo.pixelFormat,
      alphaType: sourceInfo.alphaType,
      editable: true
    });
    let packingFailed: boolean = true;
    let returnValue: ArrayBuffer;
    try {
      // Rewrite the independent target from raw bytes, avoiding initialization alpha conversion.
      await packingInput.writeBufferToPixels(packingBuffer);
      if (sourceInfo.colorSpace !== undefined) {
        // Transfer the actual profile to the owned copy; CUSTOM and UNKNOWN cannot be rebuilt from names.
        packingInput.setColorSpace(pixelMap.getColorSpace());
      }
      const copiedBytes: Uint8Array = await pixelBytes(packingInput);
      if (copiedBytes.byteLength < packingBuffer.byteLength) {
        throw new Error('Fixture packing copy pixel readback is incomplete');
      }
      // Both snapshots are owned, aligned RGBA/BGRA buffers. Comparing one word per pixel
      // still rejects every unequal byte, including alpha, and ignores only trailing padding as before.
      const sourceWords = new Uint32Array(packingBuffer);
      const copiedWords = new Uint32Array(copiedBytes.buffer, copiedBytes.byteOffset, sourceWords.length);
      for (let i = 0; i < sourceWords.length; i++) {
        if (copiedWords[i] !== sourceWords[i]) {
          throw new Error('Fixture packing copy changed a source pixel byte');
        }
      }
      const callerAfterCopy: PixelInfo = await pixelInfo(pixelMap);
      returnValue = await packer.packing(packingInput, { format: format, quality: 100 });
      const callerAfterPacking: PixelInfo = await pixelInfo(pixelMap);
      reportPackingMetadata(sourceInfo, callerAfterCopy, callerAfterPacking);
      packingFailed = false;
    } finally {
      await finishCleanupAsync(packingFailed, async (): Promise<void> => {
        await packingInput.release();
      });
    }
    primaryFailed3 = false;
    return returnValue;
  } finally {
    await finishCleanupAsync(primaryFailed3, async (): Promise<void> => {
      await packer.release();
    });
  }
}

function reportPackingMetadata(before: PixelInfo, afterCopy: PixelInfo, afterPacking: PixelInfo): void {
  try {
    hilog.info(0xF811, '[Sample_NdkPixelMap_js]',
      'caller profile before=%{public}s afterCopy=%{public}s afterPacking=%{public}s',
      before.colorSpace === undefined ? 'absent' : before.colorSpace.toString(),
      afterCopy.colorSpace === undefined ? 'absent' : afterCopy.colorSpace.toString(),
      afterPacking.colorSpace === undefined ? 'absent' : afterPacking.colorSpace.toString());
  } catch (_) {
    // This diagnostic sink is best-effort only; the original caller assertions remain mandatory.
  }
}

// The returned PixelMap is caller-owned. Source stays alive until decode settles.
export async function decodeSdk(bytes: ArrayBuffer): Promise<image.PixelMap> {
  const source = image.createImageSource(bytes);
  let primaryFailed4: boolean = true;
  try {
    const returnValue: image.PixelMap = await source.createPixelMap({ editable: true,
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888 });
    primaryFailed4 = false;
    return returnValue;
  } finally {
    await finishCleanupAsync(primaryFailed4, async (): Promise<void> => {
      await source.release();
    });
  }
}

export async function decodeRawReference(context: common.Context,
  name: string = 'example.jpg'): Promise<image.PixelMap> {
  const content = await context.resourceManager.getRawFileContent(name);
  const copy: ArrayBuffer = new ArrayBuffer(content.byteLength);
  new Uint8Array(copy).set(content);
  return decodeSdk(copy);
}

// Complete bytes, JPEG SOI/EOI and actual SDK decode are all mandatory.
export async function readCompleteJpeg(path: string): Promise<image.PixelMap> {
  const bytes = readWholeFile(path);
  const view = new Uint8Array(bytes);
  if (view.length < 4 || view[0] !== 255 || view[1] !== 216 ||
    view[view.length - 2] !== 255 || view[view.length - 1] !== 217) {
    throw new Error('Native output is not a complete JPEG');
  }
  return decodeSdk(bytes);
}

export class FixtureScope {
  public readonly directory: string;
  private files: string[] = [];
  private maps: image.PixelMap[] = [];

  constructor(context: common.Context, caseId: string) {
    if (!/^[A-Za-z0-9_]+$/.test(caseId)) {
      throw new Error('Unsafe fixture case ID');
    }
    sequence++;
    this.directory = context.cacheDir + '/pixelmap_case_' + caseId + '_' + Date.now() + '_' + sequence;
    fs.mkdirSync(this.directory);
  }

  own(pixelMap: image.PixelMap): image.PixelMap {
    if (this.maps.indexOf(pixelMap) >= 0) {
      throw new Error('PixelMap already owned');
    }
    this.maps.push(pixelMap);
    return pixelMap;
  }

  async pattern(spec: PixelSpec): Promise<image.PixelMap> {
    return this.own(await createPatternPixelMap(spec));
  }

  async input(spec: PixelSpec, format: string): Promise<string> {
    const pixelMap = await this.pattern(spec);
    const encoded = await packSdk(pixelMap, format);
    const path = this.directory + '/input_' + this.files.length + (format === 'image/png' ? '.png' : '.jpg');
    this.files.push(path);
    writeWholeFile(path, encoded);
    return path;
  }

  async decode(path: string): Promise<image.PixelMap> {
    // SDK FD input: source is released before closing its still-live descriptor.
    const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
    let primaryFailed5: boolean = true;
    try {
      const source: image.ImageSource = image.createImageSource(file.fd);
      let primaryFailed6: boolean = true;
      let decoded: image.PixelMap;
      try {
        decoded = this.own(await source.createPixelMap({ editable: true,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888 }));
        primaryFailed6 = false;
      } finally {
        await finishCleanupAsync(primaryFailed6, async (): Promise<void> => {
          await source.release();
        });
      }
      primaryFailed5 = false;
      return decoded;
    } finally {
      finishCleanup(primaryFailed5, (): void => {
        fs.closeSync(file);
      });
    }
  }

  private async releaseMaps(index: number): Promise<void> {
    if (index < 0) {
      return;
    }
    let primaryFailed7: boolean = true;
    try {
      await this.maps[index].release();
      primaryFailed7 = false;
    } finally {
      await finishCleanupAsync(primaryFailed7, async (): Promise<void> => {
        await this.releaseMaps(index - 1);
      });
    }
  }

  private removeFiles(index: number): void {
    if (index >= this.files.length) {
      return;
    }
    let primaryFailed8: boolean = true;
    try {
      if (fs.accessSync(this.files[index])) {
        fs.unlinkSync(this.files[index]);
      }
      primaryFailed8 = false;
    } finally {
      finishCleanup(primaryFailed8, (): void => {
        this.removeFiles(index + 1);
      });
    }
  }

  async dispose(): Promise<void> {
    // Attempt every cleanup; preserve the first failure and report secondary failures.
    let primaryFailed9: boolean = true;
    try {
      await this.releaseMaps(this.maps.length - 1);
      primaryFailed9 = false;
    } finally {
      finishCleanup(primaryFailed9, (): void => {
        let primaryFailed10: boolean = true;
        try {
          this.removeFiles(0);
          primaryFailed10 = false;
        } finally {
          finishCleanup(primaryFailed10, (): void => {
            fs.rmdirSync(this.directory);
          });
        }
      });
    }
  }
}

// Lock covers absence check, production call, output reads and cleanup.
// Never delete/rename a pre-existing file: this fixed native target needs a clean,
// exclusively reserved test sandbox. No production calls are hidden in this helper.
export async function withNativeJpeg(context: common.Context,
  action: (path: string) => Promise<void>): Promise<void> {
  // Match the production C API's application-level cache, not an assumed module layout.
  const outputPath: string = context.getApplicationContext().cacheDir + '/test.jpg';
  let unlock: () => void = () => {};
  const previous: Promise<void> = outputTail;
  outputTail = new Promise<void>((resolve) => { unlock = resolve; });
  await previous;
  let ownsOutput: boolean = false;
  let primaryFailed11: boolean = true;
  try {
    if (fs.accessSync(outputPath)) {
      throw new Error('Precondition: native test.jpg must be absent; existing data is not touched');
    }
    ownsOutput = true;
    await action(outputPath);
    primaryFailed11 = false;
  } finally {
    finishCleanup(primaryFailed11, (): void => {
      try {
        if (ownsOutput && fs.accessSync(outputPath)) {
          fs.unlinkSync(outputPath);
        }
      } finally {
        unlock();
      }
    });
  }
}

// Cleanup never replaces an already-thrown value (including undefined).
// Only a secondary cleanup failure is suppressed, with best-effort diagnostics.
function reportSecondaryCleanup(): void {
  try {
    hilog.error(0xF811, '[Sample_NdkPixelMap_js]', 'Secondary cleanup failure; original failure retained');
  } catch (_) {
    // The diagnostic sink must not replace the primary failure either.
  }
}

export function finishCleanup(primaryFailed: boolean, cleanup: () => void): void {
  if (!primaryFailed) {
    cleanup();
  } else {
    try {
      cleanup();
    } catch (_) {
      reportSecondaryCleanup();
    }
  }
}

export async function finishCleanupAsync(primaryFailed: boolean,
  cleanup: () => Promise<void>): Promise<void> {
  if (!primaryFailed) {
    await cleanup();
  } else {
    try {
      await cleanup();
    } catch (_) {
      reportSecondaryCleanup();
    }
  }
}

// SDK26 ImageInfo has no colorSpace member. Capture the real PixelMap color-space name
// beside the original SDK metadata; callers retain their complete before/after assertions.
export class PixelInfo {
  public readonly size: image.Size;
  public readonly density: number;
  public readonly stride: number;
  public readonly pixelFormat: image.PixelMapFormat;
  public readonly alphaType: image.AlphaType;
  public readonly mimeType: string;
  public readonly isHdr: boolean;
  public readonly colorSpace: colorSpaceManager.ColorSpace | undefined;

  constructor(info: image.ImageInfo, colorSpace: colorSpaceManager.ColorSpace | undefined) {
    this.size = info.size;
    this.density = info.density;
    this.stride = info.stride;
    this.pixelFormat = info.pixelFormat;
    this.alphaType = info.alphaType;
    this.mimeType = info.mimeType;
    this.isHdr = info.isHdr;
    this.colorSpace = colorSpace;
  }
}

// SDK NAPI legacy errors can expose string codes; business-error variants use numbers.
interface PixelMapColorError extends Error {
  code: number | string;
}

const PIXEL_MAP_DATA_UNSUPPORTED: number = 62980103;

export async function pixelInfo(pixelMap: image.PixelMap): Promise<PixelInfo> {
  const info: image.ImageInfo = await pixelMap.getImageInfo();
  let colorSpace: colorSpaceManager.ColorSpaceManager;
  try {
    colorSpace = pixelMap.getColorSpace();
  } catch (error) {
    if (error instanceof Error) {
      const sdkError: PixelMapColorError = error as PixelMapColorError;
      if ((sdkError.code === PIXEL_MAP_DATA_UNSUPPORTED || sdkError.code === '62980103') &&
        sdkError.message === 'No colorspace in pixelmap') {
        // A missing color-space pointer is metadata absence, not a default color space.
        return new PixelInfo(info, undefined);
      }
    }
    // Preserve every other SDK failure, including its original value and identity.
    return Promise.reject<PixelInfo>(error);
  }
  // Do not classify errors from getColorSpaceName as missing PixelMap metadata.
  return new PixelInfo(info, colorSpace.getColorSpaceName());
}
