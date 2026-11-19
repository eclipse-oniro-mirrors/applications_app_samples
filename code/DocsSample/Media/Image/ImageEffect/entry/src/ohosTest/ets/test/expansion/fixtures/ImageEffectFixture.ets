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
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { CleanupGuard, CleanupFailures } from './ImageEffectCleanup';

// SDK fixture construction only: no production imports or filter implementation.
export class FixtureSpec {
  public width: number;
  public height: number;
  public pattern: string;
  public format: string;
  public rgba: number[];
  public alphaValues: number[];
  public quality: number;

  constructor(width: number, height: number, pattern: string,
    format: string = 'image/png', rgba: number[] = [128, 128, 128, 255],
    alphaValues: number[] = [0, 64, 128, 255], quality: number = 100) {
    this.width = width;
    this.height = height;
    this.pattern = pattern;
    this.format = format;
    this.rgba = rgba;
    this.alphaValues = alphaValues;
    this.quality = quality;
  }
}
export class FixtureFile {
  public path: string;
  public originalPath: string;
  public originalBytes: ArrayBuffer;

  constructor(path: string, originalPath: string, originalBytes: ArrayBuffer) {
    this.path = path;
    this.originalPath = originalPath;
    this.originalBytes = originalBytes;
  }
}
export class PixelSnapshot {
  public width: number;
  public height: number;
  public rgba: Uint8Array;

  constructor(width: number, height: number, rgba: Uint8Array) {
    this.width = width;
    this.height = height;
    this.rgba = rgba;
  }
}
function validateByte(value: number): void {
  if (!Number.isInteger(value) || value < 0 || value > 255) {
    throw new Error('Invalid fixture channel');
  }
}
export async function createFixturePixelMap(spec: FixtureSpec): Promise<image.PixelMap> {
  if (!Number.isInteger(spec.width) || !Number.isInteger(spec.height) || spec.width < 1 ||
    spec.height < 1 || spec.width > 4096 || spec.height > 4096 || spec.width * spec.height > 16777216) {
    throw new Error('Invalid fixture dimensions');
  }
  if (spec.rgba.length !== 4 || spec.alphaValues.length !== 4) {
    throw new Error('Invalid channel count');
  }
  for (let value of spec.rgba) {
    validateByte(value);
  }
  for (let value of spec.alphaValues) {
    validateByte(value);
  }
  if (spec.format !== 'image/png' && spec.format !== 'image/jpeg') {
    throw new Error('Invalid format');
  }
  if (spec.format === 'image/jpeg' && (spec.pattern === 'alpha-checker' || spec.rgba[3] !== 255)) {
    throw new Error('JPEG fixture must be opaque');
  }
  const patterns: string[] = ['solid', 'opaque-color-quadrants', 'alpha-checker',
    'opaque-row-bands-top-distinct-from-bottom', 'opaque-row-bands', 'large-opaque-gray-bands'];
  if (patterns.indexOf(spec.pattern) < 0) {
    throw new Error('Unsupported fixture pattern');
  }
  const data = new Uint8Array(spec.width * spec.height * 4);
  const quadrants: number[][] = [[48, 80, 112, 255], [176, 64, 96, 255],
    [80, 176, 128, 255], [192, 160, 208, 255]];
  const grays: number[] = [0, 32, 128, 224, 255];
  for (let y = 0; y < spec.height; y++) {
    for (let x = 0; x < spec.width; x++) {
      let color: number[] = spec.rgba;
      if (spec.pattern === 'opaque-color-quadrants') {
        color = quadrants[(y < spec.height / 2 ? 0 : 2) + (x < spec.width / 2 ? 0 : 1)];
      } else if (spec.pattern === 'alpha-checker') {
        color = [96, 160, 224, spec.alphaValues[(x + y) % 4]];
      } else if (spec.pattern === 'large-opaque-gray-bands') {
        const gray = grays[Math.min(4, Math.floor(y * 5 / spec.height))];
        color = [gray, gray, gray, 255];
      } else if (spec.pattern === 'opaque-row-bands-top-distinct-from-bottom' ||
        spec.pattern === 'opaque-row-bands') {
        const gray = Math.min(224, 32 + Math.floor(y * 192 / spec.height));
        color = [gray, gray, gray, 255];
      }
      const offset = (y * spec.width + x) * 4;
      for (let c = 0; c < 4; c++) {
        data[offset + c] = color[c];
      }
    }
  }
  return image.createPixelMap(data.buffer, { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
    alphaType: image.AlphaType.UNPREMUL, size: { width: spec.width, height: spec.height } });
}
async function pack(pixelMap: image.PixelMap, format: string, quality: number): Promise<ArrayBuffer> {
  const cleanupGuard1 = new CleanupGuard();
  const packer = image.createImagePacker();
  try {
    return await packer.packing(pixelMap, { format: format, quality: quality });
  } catch (primaryError1) {
    cleanupGuard1.primaryFailed = true;
    throw primaryError1 as Error;
  } finally {
    await cleanupGuard1.run(async (): Promise<void> => {
      await packer.release();
    });
  }
}
export function readFileBytes(path: string, cleanupGuard2: CleanupGuard = new CleanupGuard()): ArrayBuffer {
  const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  try {
    const size = fs.statSync(file.fd).size;
    if (size < 1) {
      throw new Error('Empty image file');
    }
    const buffer = new ArrayBuffer(size);
    let offset = 0;
    while (offset < size) {
      const chunk = new ArrayBuffer(size - offset);
      const count = fs.readSync(file.fd, chunk, { offset: offset, length: size - offset });
      if (count <= 0) {
        throw new Error('Incomplete image read');
      }
      new Uint8Array(buffer).set(new Uint8Array(chunk, 0, count), offset);
      offset += count;
    }
    return buffer;
  } catch (primaryError2) {
    cleanupGuard2.primaryFailed = true;
    throw primaryError2 as Error;
  } finally {
    cleanupGuard2.runSync((): void => {
      fs.closeSync(file.fd);
    });
  }
}
function writeBytes(path: string, bytes: ArrayBuffer): void {
  const cleanupGuard3 = new CleanupGuard();
  const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  try {
    let offset = 0;
    const data = new Uint8Array(bytes);
    while (offset < data.length) {
      const chunk = data.slice(offset);
      const count = fs.writeSync(file.fd, chunk.buffer);
      if (count < 1) {
        throw new Error('Incomplete fixture write');
      }
      offset += count;
    }
  } catch (primaryError3) {
    cleanupGuard3.primaryFailed = true;
    throw primaryError3 as Error;
  } finally {
    cleanupGuard3.runSync((): void => {
      fs.closeSync(file.fd);
    });
  }
}
let scopeSequence: number = 0;
export class FixtureScope {
  public directory: string;
  private files: string[] = [];
  private pixels: image.PixelMap[] = [];
  private sources: image.ImageSource[] = [];
  private disposed: boolean = false;
  constructor(cacheDir: string, caseId: string) {
    if (cacheDir.length === 0 || !/^(V2_)?EFFECT_[A-Z_]+_[0-9]{3,4}$/.test(caseId)) {
      throw new Error('Real cache directory and catalog case ID required');
    }
    scopeSequence++;
    this.directory = cacheDir + '/exp_' + caseId + '_' + Date.now() + '_' + scopeSequence;
    fs.mkdirSync(this.directory);
  }
  ownPixelMap(pixelMap: image.PixelMap): image.PixelMap {
    if (this.pixels.indexOf(pixelMap) >= 0) {
      throw new Error('Duplicate PixelMap ownership');
    }
    this.pixels.push(pixelMap);
    return pixelMap;
  }
  ownSource(source: image.ImageSource): image.ImageSource {
    if (this.sources.indexOf(source) >= 0) {
      throw new Error('Duplicate ImageSource ownership');
    }
    this.sources.push(source);
    return source;
  }
  async createFile(spec: FixtureSpec, name: string = 'input.png'): Promise<FixtureFile> {
    if (!/^[A-Za-z0-9_.-]+$/.test(name) || name === '.' || name === '..') {
      throw new Error('Expected safe leaf filename');
    }
    const cleanupGuard4 = new CleanupGuard();
    const pixel = await createFixturePixelMap(spec);
    let bytes: ArrayBuffer;
    try {
      bytes = await pack(pixel, spec.format, spec.quality);
    } catch (primaryError4) {
      cleanupGuard4.primaryFailed = true;
      throw primaryError4 as Error;
    } finally {
      await cleanupGuard4.run(async (): Promise<void> => {
        await pixel.release();
      });
    }
    const path = this.directory + '/' + name;
    const backup = this.directory + '/original_' + name;
    if (this.files.indexOf(path) >= 0 || this.files.indexOf(backup) >= 0) {
      throw new Error('Fixture filename already owned');
    }
    this.files.push(path);
    this.files.push(backup);
    writeBytes(path, bytes);
    writeBytes(backup, bytes);
    return new FixtureFile(path, backup, bytes);
  }
  restore(file: FixtureFile): void {
    if (this.files.indexOf(file.path) < 0) {
      throw new Error('Cannot restore unowned path');
    }
    writeBytes(file.path, file.originalBytes);
  }
  async dispose(): Promise<void> {
    if (this.disposed) {
      return;
    }
    this.disposed = true;
    const failures = new CleanupFailures();
    for (let pixel of this.pixels) {
      await failures.attempt(async (): Promise<void> => {
        await pixel.release();
      });
    }
    for (let source of this.sources) {
      await failures.attempt(async (): Promise<void> => {
        await source.release();
      });
    }
    for (let path of this.files) {
      failures.attemptSync((): void => {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      });
    }
    failures.attemptSync((): void => {
      fs.rmdirSync(this.directory);
    });
    failures.finish();
  }
}
async function decodeBytes(bytes: ArrayBuffer,
  cleanupGuard5: CleanupGuard = new CleanupGuard()): Promise<image.PixelMap> {
  const handoffGuard = new CleanupGuard();
  const source = image.createImageSource(bytes);
  let decoded: image.PixelMap | undefined = undefined;
  try {
    decoded = await source.createPixelMap({ editable: true, desiredPixelFormat: image.PixelMapFormat.RGBA_8888 });
    return decoded;
  } catch (primaryError5) {
    cleanupGuard5.primaryFailed = true;
    throw primaryError5 as Error;
  } finally {
    await cleanupGuard5.run(async (): Promise<void> => {
      try {
        await source.release();
      } catch (sourceReleaseError) {
        if (decoded !== undefined) {
          const ownedResult = decoded;
          handoffGuard.primaryFailed = true;
          await handoffGuard.run(async (): Promise<void> => {
            await ownedResult.release();
          });
        }
        throw sourceReleaseError as Error;
      }
    });
  }
}
export async function decodeFileReference(path: string,
  cleanupGuard: CleanupGuard = new CleanupGuard()): Promise<image.PixelMap> {
  return decodeBytes(readFileBytes(path, cleanupGuard), cleanupGuard);
}
export async function decodeResourceReference(manager: resourceManager.ResourceManager,
  resource: Resource): Promise<image.PixelMap> {
  const bytes = await manager.getMediaContent(resource);
  const buffer = new ArrayBuffer(bytes.length);
  const copy = new Uint8Array(buffer);
  copy.set(bytes);
  return decodeBytes(buffer);
}
export async function normalizePixels(pixelMap: image.PixelMap): Promise<PixelSnapshot> {
  const cleanupGuard6 = new CleanupGuard();
  const normalized = await decodeBytes(await pack(pixelMap, 'image/png', 100));
  try {
    const info = await normalized.getImageInfo();
    const buffer = new ArrayBuffer(info.size.width * info.size.height * 4);
    await normalized.readPixels({ pixels: buffer, offset: 0, stride: info.size.width * 4,
      region: { x: 0, y: 0, size: { width: info.size.width, height: info.size.height } } });
    return new PixelSnapshot(info.size.width, info.size.height, new Uint8Array(buffer));
  } catch (primaryError6) {
    cleanupGuard6.primaryFailed = true;
    throw primaryError6 as Error;
  } finally {
    await cleanupGuard6.run(async (): Promise<void> => {
      await normalized.release();
    });
  }
}
export async function jpegReference(pixelMap: image.PixelMap, quality: number = 100): Promise<image.PixelMap> {
  return decodeBytes(await pack(pixelMap, 'image/jpeg', quality));
}
export function isJpegFile(path: string, cleanupGuard: CleanupGuard = new CleanupGuard()): boolean {
  const data = new Uint8Array(readFileBytes(path, cleanupGuard));
  return data.length >= 4 && data[0] === 255 && data[1] === 216 &&
    data[data.length - 2] === 255 && data[data.length - 1] === 217;
}

// Bounded readiness retries only. A persistent incomplete file/decode error fails, never passes.
// Native calls themselves are synchronous; the runner must impose the external SDK-operation timeout.
export async function awaitJpegOutput(path: string): Promise<image.PixelMap> {
  let lastFailure: string = 'JPEG output missing';
  for (let attempt = 0; attempt < 20; attempt++) {
    const attemptCleanup = new CleanupGuard();
    try {
      if (isJpegFile(path, attemptCleanup)) {
        return await decodeFileReference(path, attemptCleanup);
      }
      lastFailure = 'Missing JPEG SOI or terminal EOI';
    } catch (error) {
      if (attemptCleanup.cleanupFailed) {
        throw error as Error;
      }
      lastFailure = String(error);
    }
    await new Promise<void>((resolve: () => void) => { setTimeout(resolve, 25); });
  }
  throw new Error('JPEG output not decodable after 20 bounded attempts: ' + lastFailure);
}
