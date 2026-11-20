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

import { expect } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Decode } from '../../../../../main/ets/common/Decode';
import { encodeToStreamByPixelMap, encodeToStreamByImageSource,
  encodeToFileByPixelMap, encodeToFileByImageSource } from '../../../../../main/ets/common/Encode';
import { readAndEditEXIF } from '../../../../../main/ets/common/EditingEXIF';
import { CleanupGuard, isEncoderQuarantined, quarantineEncoder } from './PixelMapCleanup';

export interface FixtureSpec {
  id: string;
  format: string;
  width: number;
  height: number;
  pattern: string;
  rgba?: number[];
  alphaValues?: number[];
  quality?: number;
}

interface EncodeStepOwner {
  source: image.ImageSource;
  referenceSource: image.ImageSource;
  pixel: image.PixelMap | undefined;
  referencePixel: image.PixelMap | undefined;
  expectedSource: image.ImageSource | undefined;
  expected: image.PixelMap | undefined;
  packer: image.ImagePacker;
  bytes: ArrayBuffer;
}

let actualTestModuleContext: Context | undefined;
export function testModuleContext(): Context {
  if (!actualTestModuleContext) {
    const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    actualTestModuleContext = appContext.createModuleContext('entry_test');
  }
  return actualTestModuleContext;
}
function context(): Context {
  return testModuleContext();
}
function options(format: boolean): image.DecodingOptions {
  if (format) {
    return { editable: true, desiredPixelFormat: image.PixelMapFormat.RGBA_8888 };
  }
  return { desiredDynamicRange: image.DecodingDynamicRange.AUTO };
}

// Only SDK primitives prepare input; no production algorithm is reimplemented here.
export async function makeBytes(s: FixtureSpec): Promise<ArrayBuffer> {
  const pixels = new Uint8Array(s.width * s.height * 4);
  for (let y = 0; y < s.height; y++) {
    for (let x = 0; x < s.width; x++) {
      const i = (y * s.width + x) * 4;
      let r = 32;
      let g = 96;
      let b = 160;
      let a = 255;
      if (s.pattern === 'solid' && s.rgba) {
        r = s.rgba[0];
        g = s.rgba[1];
        b = s.rgba[2];
        a = s.rgba[3];
      } else if (s.pattern === 'row-ramp-opaque') {
        r = y * 11 % 256;
        g = y * 7 % 256;
        b = y * 3 % 256;
      } else if (s.pattern === 'column-ramp-opaque') {
        r = x * 11 % 256;
        g = x * 7 % 256;
        b = x * 3 % 256;
      } else if (s.pattern === 'opaque-color-quadrants') {
        r = x < s.width / 2 ? 220 : 30;
        g = y < s.height / 2 ? 180 : 40;
        b = (x + y) % 2 === 0 ? 70 : 90;
      } else if (s.pattern === 'opaque-color-bars') {
        r = Math.floor(x / 32) % 2 * 200;
        g = Math.floor(x / 64) % 2 * 200;
        b = 100;
      } else if (s.pattern === 'opaque-gray-ramp') {
        r = Math.floor((x + y) * 255 / (s.width + s.height - 2));
        g = r;
        b = r;
      } else if (s.pattern === 'alpha-checker') {
        const alphas: number[] = [0, 64, 128, 255];
        a = alphas[(x + y) % 4];
      } else if (s.pattern === 'rgba-gradient') {
        r = x * 7 % 256;
        g = y * 13 % 256;
        b = (x + y) * 5 % 256;
        a = (x * 17 + y * 9) % 256;
      }
      pixels[i] = r;
      pixels[i + 1] = g;
      pixels[i + 2] = b;
      pixels[i + 3] = a;
    }
  }
  const pixel = await image.createPixelMap(pixels.buffer, {
    size: { width: s.width, height: s.height }, pixelFormat: image.PixelMapFormat.RGBA_8888,
    editable: true, alphaType: image.AlphaType.UNPREMUL
  });
  const packer = image.createImagePacker();
  const cleanupGuard1 = new CleanupGuard();
  let cleanupGuard1Completed = false;
  try {
    const cleanupGuard1Result = await packer.packToData(pixel, { format: s.format, quality: s.quality === undefined ? 100 : s.quality });
    cleanupGuard1Completed = true;
    return cleanupGuard1Result;
  }  finally {
    if (!cleanupGuard1Completed) {
      cleanupGuard1.markFailed();
    }
    await cleanupGuard1.runAsync(async (): Promise<void> => {
      await packer.release();
      await pixel.release();
    });
  }
}

export class Sandbox {
  public readonly relative: string;
  public readonly root: string;
  constructor(id: string) {
    this.relative = '/exp_' + id + '_' + Date.now() + '_' + Math.floor(Math.random() * 1000000);
    this.root = context().cacheDir + this.relative;
    fs.mkdirSync(this.root);
  }
  write(name: string, data: ArrayBuffer): string {
    const parts = name.split('/');
    let dir = this.root;
    for (let i = 0; i < parts.length - 1; i++) {
      dir += '/' + parts[i];
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
    }
    const file = fs.openSync(this.root + '/' + name, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    const cleanupGuard2 = new CleanupGuard();
    let cleanupGuard2Completed = false;
    try {
      expect(fs.writeSync(file.fd, data)).assertEqual(data.byteLength);
      cleanupGuard2Completed = true;
    }  finally {
      if (!cleanupGuard2Completed) {
        cleanupGuard2.markFailed();
      }
      cleanupGuard2.runSync((): void => {
        fs.closeSync(file);
      });
    }
    return this.relative + '/' + name;
  }
  clean(): void {
    fs.rmdirSync(this.root);
  }
}

async function pixelBytes(p: image.PixelMap): Promise<Uint8Array> {
  const b = new ArrayBuffer(p.getPixelBytesNumber());
  await p.readPixelsToBuffer(b);
  return new Uint8Array(b);
}
export async function equalPixels(actual: image.PixelMap, reference: image.PixelMap): Promise<void> {
  const a = actual.getImageInfoSync();
  const r = reference.getImageInfoSync();
  expect(a.size.width).assertEqual(r.size.width);
  expect(a.size.height).assertEqual(r.size.height);
  expect(a.pixelFormat).assertEqual(r.pixelFormat);
  const ab = await pixelBytes(actual);
  const rb = await pixelBytes(reference);
  expect(ab.length).assertEqual(rb.length);
  let mismatch = 0;
  for (let i = 0; i < ab.length; i++) {
    if (ab[i] !== rb[i]) {
      mismatch++;
    }
  }
  expect(mismatch).assertEqual(0);
}

async function editable(p: image.PixelMap): Promise<void> {
  expect(p.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
  expect(p.isEditable).assertTrue();
  const bytes = new Uint8Array([40, 80, 120, 255]);
  await p.writePixels({ pixels: bytes.buffer,
    offset: 0,
    stride: 4,
    region: { x: 0,
      y: 0,
      size: { width: 1,
        height: 1 } } });
  const read = new Uint8Array(4);
  await p.readPixels({ pixels: read.buffer,
    offset: 0,
    stride: 4,
    region: { x: 0,
      y: 0,
      size: { width: 1,
        height: 1 } } });
  expect(read[0]).assertEqual(40);
  expect(read[1]).assertEqual(80);
  expect(read[2]).assertEqual(120);
  expect(read[3]).assertEqual(255);
}

export async function sourceCase(id: string, s: FixtureSpec, method: string, name: string): Promise<void> {
  const bytes = await makeBytes(s);
  const box = new Sandbox(id);
  let source: image.ImageSource | undefined;
  let refSource: image.ImageSource | undefined;
  let actual: image.PixelMap | undefined;
  let reference: image.PixelMap | undefined;
  const cleanupGuard3 = new CleanupGuard();
  let cleanupGuard3Completed = false;
  try {
    refSource = image.createImageSource(bytes);
    const suffix = box.write(name, bytes);
    const sut = new Decode(context());
    source = method === 'getImageSourceByFd' ? sut.getImageSourceByFd(suffix) : sut.getImageSourceByFilePath(suffix);
    actual = await source.createPixelMap(options(true));
    reference = await refSource.createPixelMap(options(true));
    expect(actual.getImageInfoSync().size.width).assertEqual(s.width);
    expect(actual.getImageInfoSync().size.height).assertEqual(s.height);
    await equalPixels(actual, reference);
    cleanupGuard3Completed = true;
  }  finally {
    if (!cleanupGuard3Completed) {
      cleanupGuard3.markFailed();
    }
    await cleanupGuard3.runAsync(async (): Promise<void> => {
      if (actual) {
        await actual.release();
      }
      if (reference) {
        await reference.release();
      }
      if (source) {
        await source.release();
      }
      if (refSource) {
        await refSource.release();
      }
      box.clean();
    });
  }
}

export async function decodeCase(s: FixtureSpec, format: boolean): Promise<void> {
  const bytes = await makeBytes(s);
  await decodeBytes(bytes, format, s.width, s.height, false);
}
async function decodeBytes(bytes: ArrayBuffer,
format: boolean,
width: number,
height: number,
hdr: boolean): Promise<void> {
  const source = image.createImageSource(bytes);
  const refSource = image.createImageSource(bytes);
  let actual: image.PixelMap | undefined;
  let reference: image.PixelMap | undefined;
  const cleanupGuard4 = new CleanupGuard();
  let cleanupGuard4Completed = false;
  try {
    actual = format ? await new Decode(context()).decodeByFormatWithParameter(source) : await new Decode(context()).decodeByAutoWithParameter(source);
    reference = await refSource.createPixelMap(options(format));
    expect(actual.getImageInfoSync().size.width).assertEqual(width);
    expect(actual.getImageInfoSync().size.height).assertEqual(height);
    await equalPixels(actual, reference);
    if (format) {
      await editable(actual);
    } else {
      expect(actual.getImageInfoSync().isHdr).assertEqual(reference.getImageInfoSync().isHdr);
      expect(reference.getImageInfoSync().isHdr).assertEqual(hdr);
    }
    cleanupGuard4Completed = true;
  }  finally {
    if (!cleanupGuard4Completed) {
      cleanupGuard4.markFailed();
    }
    await cleanupGuard4.runAsync(async (): Promise<void> => {
      if (actual) {
        await actual.release();
      }
      if (reference) {
        await reference.release();
      }
      await source.release();
      await refSource.release();
    });
  }
}

export async function hdrDecode(format: boolean): Promise<void> {
  const bytes = await context().resourceManager.getMediaContent($r('app.media.CUVAHdr'));
  await decodeBytes(bytes.buffer.slice(0), format, 270, 180, true);
}
export async function rawCase(method: string): Promise<void> {
  const manager = context().resourceManager;
  const bytes = await manager.getRawFileContent('test.jpg');
  const ref = image.createImageSource(bytes.buffer.slice(0));
  let source: image.ImageSource | undefined;
  let actual: image.PixelMap | undefined;
  let expected: image.PixelMap | undefined;
  const cleanupGuard5 = new CleanupGuard();
  let cleanupGuard5Completed = false;
  try {
    source = method === 'getImageSourceByArrayBuffer' ? await new Decode(context()).getImageSourceByArrayBuffer('test.jpg') : await new Decode(context()).getImageSourceByRawFileDescriptor('test.jpg');
    actual = await source.createPixelMap(options(true));
    expected = await ref.createPixelMap(options(true));
    expect(actual.getImageInfoSync().size.width).assertEqual(700);
    expect(actual.getImageInfoSync().size.height).assertEqual(700);
    await equalPixels(actual, expected);
    cleanupGuard5Completed = true;
  }  finally {
    if (!cleanupGuard5Completed) {
      cleanupGuard5.markFailed();
    }
    await cleanupGuard5.runAsync(async (): Promise<void> => {
      if (actual) {
        await actual.release();
      }
      if (expected) {
        await expected.release();
      }
      if (source) {
        await source.release();
      }
      await ref.release();
      if (method === 'getImageSourceByRawFileDescriptor' && source) {
        await manager.closeRawFd('test.jpg');
      }
    });
  }
}

function delay(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, 25);
  });
}
export async function rawMissing(method: string, name: string): Promise<void> {
  const manager = context().resourceManager;
  let expected = 0;
  let actual = 0;
  let settled = false;
  let resolved = false;
  try {
    if (method === 'getImageSourceByArrayBuffer') {
      await manager.getRawFileContent(name);
    } else {
      await manager.getRawFd(name);
    }
  } catch (error) {
    expected = (error as BusinessError).code;
  }
  expect(expected !== 0).assertTrue();
  const promise = method === 'getImageSourceByArrayBuffer' ? new Decode(context()).getImageSourceByArrayBuffer(name) : new Decode(context()).getImageSourceByRawFileDescriptor(name);
  promise.then(async (source: image.ImageSource): Promise<void> => {
    resolved = true;
    settled = true;
    await source.release();
  })
  .catch((error: BusinessError) => {
    actual = error.code;
    settled = true;
  });
  for (let i = 0; i < 200 && !settled; i++) {
    await delay();
  }
  expect(settled).assertTrue();
  expect(resolved).assertFalse();
  expect(actual).assertEqual(expected);
}
export async function fdMissing(id: string, name: string): Promise<void> {
  const box = new Sandbox(id);
  let expected = 0;
  let actual = 0;
  const suffix = box.relative + '/' + name;
  const cleanupGuard6 = new CleanupGuard();
  let cleanupGuard6Completed = false;
  try {
    try {
      const file = fs.openSync(context().cacheDir + suffix, fs.OpenMode.READ_WRITE);
      fs.closeSync(file);
    } catch (error) {
      expected = (error as BusinessError).code;
    }
    try {
      const source = new Decode(context()).getImageSourceByFd(suffix);
      await source.release();
    } catch (error) {
      actual = (error as BusinessError).code;
    }
    expect(expected !== 0).assertTrue();
    expect(actual).assertEqual(expected);
    cleanupGuard6Completed = true;
  }  finally {
    if (!cleanupGuard6Completed) {
      cleanupGuard6.markFailed();
    }
    cleanupGuard6.runSync((): void => {
      box.clean();
    });
  }
}

export async function fixedCase(method: string): Promise<void> {
  const manager = context().resourceManager;
  let bytes: Uint8Array;
  if (method === 'decodeByFormat') {
    bytes = await manager.getMediaContent($r('app.media.image'));
  } else if (method === 'decodeByAuto') {
    bytes = await manager.getMediaContent($r('app.media.CUVAHdr'));
  } else {
    bytes = await manager.getRawFileContent('test.jpg');
  }
  const source = image.createImageSource(bytes.buffer.slice(0));
  let actual: image.PixelMap | undefined;
  let expected: image.PixelMap | undefined;
  const sut = new Decode(context());
  const cleanupGuard7 = new CleanupGuard();
  let cleanupGuard7Completed = false;
  try {
    if (method === 'decodeByFormat') {
      actual = await sut.decodeByFormat();
    } else if (method === 'decodeByAuto') {
      actual = await sut.decodeByAuto();
    } else if (method === 'decodeSample_1') {
      actual = await sut.decodeSample_1();
    } else {
      actual = await sut.decodeSample_2();
    }
    const opt: image.DecodingOptions = method === 'decodeByFormat' ? options(true) : method === 'decodeByAuto' ? options(false) : {};
    expected = await source.createPixelMap(opt);
    await equalPixels(actual, expected);
    expect(actual.getImageInfoSync().size.width).assertEqual(method === 'decodeByAuto' ? 270 : 700);
    expect(actual.getImageInfoSync().size.height).assertEqual(method === 'decodeByAuto' ? 180 : 700);
    if (method === 'decodeByFormat') {
      await editable(actual);
    }
    if (method === 'decodeByAuto') {
      expect(actual.getImageInfoSync().isHdr).assertEqual(expected.getImageInfoSync().isHdr);
      expect(expected.getImageInfoSync().isHdr).assertTrue();
    }
    cleanupGuard7Completed = true;
  }  finally {
    if (!cleanupGuard7Completed) {
      cleanupGuard7.markFailed();
    }
    await cleanupGuard7.runAsync(async (): Promise<void> => {
      if (actual) {
        await actual.release();
      }
      if (expected) {
        await expected.release();
      }
      await source.release();
      if (method === 'decodeSample_2') {
        await manager.closeRawFd('test.jpg');
      }
    });
  }
}

export async function sourceSequence(id: string, s: FixtureSpec, sequence: number): Promise<void> {
  const bytes = await makeBytes(s);
  const box = new Sandbox(id);
  let a: image.ImageSource | undefined;
  let b: image.ImageSource | undefined;
  let p: image.PixelMap | undefined;
  let q: image.PixelMap | undefined;
  let ref: image.ImageSource | undefined;
  let expected: image.PixelMap | undefined;
  const sut = new Decode(context());
  const cleanupGuard8 = new CleanupGuard();
  let cleanupGuard8Completed = false;
  try {
    const suffix = box.write('input', bytes);
    ref = image.createImageSource(bytes);
    if (sequence === 1 || sequence === 3) {
      a = sut.getImageSourceByFilePath(suffix);
    } else {
      a = sut.getImageSourceByFd(suffix);
    }
    if (sequence === 1 || sequence === 2) {
      p = sequence === 1 ? await sut.decodeByFormatWithParameter(a) : await sut.decodeByAutoWithParameter(a);
      q = sequence === 1 ? await sut.decodeByAutoWithParameter(a) : await sut.decodeByFormatWithParameter(a);
      expected = await ref.createPixelMap(options(sequence === 1));
      await equalPixels(p, expected);
      await expected.release();
      expected = undefined;
      expected = await ref.createPixelMap(options(sequence === 2));
      await equalPixels(q, expected);
    } else {
      if (sequence === 3) {
        b = sut.getImageSourceByFd(suffix);
        await a.release();
        a = undefined;
      } else {
        await a.release();
        a = undefined;
        b = sut.getImageSourceByFd(suffix);
      }
      q = await sut.decodeByFormatWithParameter(b);
      expected = await ref.createPixelMap(options(true));
      await equalPixels(q,
      expected);
    }
    expect(q.getImageInfoSync().size.width).assertEqual(s.width);
    expect(q.getImageInfoSync().size.height).assertEqual(s.height);
    cleanupGuard8Completed = true;
  }  finally {
    if (!cleanupGuard8Completed) {
      cleanupGuard8.markFailed();
    }
    await cleanupGuard8.runAsync(async (): Promise<void> => {
      if (p) {
        await p.release();
      }
      if (q) {
        await q.release();
      }
      if (expected) {
        await expected.release();
      }
      if (a) {
        await a.release();
      }
      if (b) {
        await b.release();
      }
      if (ref) {
        await ref.release();
      }
      box.clean();
    });
  }
}

// Shared module-level production packer and output paths require a global queue.
let queue: Promise<void> = Promise.resolve();
let encoderPoisoned = false;
export async function serialized(action: () => Promise<void>): Promise<void> {
  const previous = queue;
  let unlock: () => void = () => {};
  queue = new Promise<void>((resolve) => {
    unlock = resolve;
  });
  await previous;
  const cleanupGuard9 = new CleanupGuard();
  let cleanupGuard9Completed = false;
  try {
    if (encoderPoisoned || isEncoderQuarantined()) {
      throw new Error('A previous encoder timed out; restart device test process before reusing the shared production packer');
    }
    await action();
    cleanupGuard9Completed = true;
  }  finally {
    if (!cleanupGuard9Completed) {
      cleanupGuard9.markFailed();
    }
    cleanupGuard9.runSync((): void => {
      unlock();
    });
  }
}
export class OutputLease {
  public readonly paths: string[] = [context().cacheDir + '/pixel_map.jpg', context().cacheDir + '/image_source.jpg'];
  constructor(id: string) {
    // Device prerequisite: dedicated test sandbox, no UI encoder running.
    // Never rename, truncate or remove pre-existing application output.
    for (let i = 0; i < this.paths.length; i++) {
      if (fs.accessSync(this.paths[i])) {
        throw new Error('ENV_PRECONDITION ' + id + ': reserved output already exists; isolate EXP tests in a clean test sandbox before starting EntryAbility: ' + this.paths[i]);
      }
    }
  }
  clean(): void {
    if (isEncoderQuarantined()) {
      return;
    }
    for (let i = 0; i < this.paths.length; i++) {
      if (fs.accessSync(this.paths[i])) {
        fs.unlinkSync(this.paths[i]);
      }
    }
  }
}
function outputPath(method: string): string {
  return context().cacheDir + (method === 'encodeToFileByImageSource' ? '/image_source.jpg' : '/pixel_map.jpg');
}
async function invokeEncode(method: string,
source: image.ImageSource,
pixel: image.PixelMap,
hdr: boolean): Promise<void> {
  if (method === 'encodeToStreamByPixelMap') {
    await encodeToStreamByPixelMap(pixel, hdr, context());
  } else if (method === 'encodeToStreamByImageSource') {
    await encodeToStreamByImageSource(source, hdr, context());
  } else if (method === 'encodeToFileByPixelMap') {
    await encodeToFileByPixelMap(pixel, hdr, context());
  } else {
    await encodeToFileByImageSource(source, hdr, context());
  }
}
function readFile(path: string): ArrayBuffer {
  const f = fs.openSync(path, fs.OpenMode.READ_ONLY);
  const cleanupGuard10 = new CleanupGuard();
  let cleanupGuard10Completed = false;
  try {
    const b = new ArrayBuffer(fs.statSync(f.fd).size);
    expect(fs.readSync(f.fd, b)).assertEqual(b.byteLength);
    cleanupGuard10Completed = true;
    return b;
  }  finally {
    if (!cleanupGuard10Completed) {
      cleanupGuard10.markFailed();
    }
    cleanupGuard10.runSync((): void => {
      fs.closeSync(f);
    });
  }
}
async function waitJpeg(path: string, expected: image.PixelMap): Promise<void> {
  let lastSize = -1;
  let stable = 0;
  let lastError = 'no complete JPEG';
  for (let attempt = 0; attempt < 240; attempt++) {
    let source: image.ImageSource | undefined;
    let pixel: image.PixelMap | undefined;
    try {
      if (fs.accessSync(path)) {
        const bytes = readFile(path);
        const u = new Uint8Array(bytes);
        if (u.length > 4 && u[0] === 255 && u[1] === 216) {
          // A trailing EOI can be followed by old bytes because production does not TRUNC.
          let eoi = false;
          for (let i = 2; i < u.length - 1; i++) {
            if (u[i] === 255 && u[i + 1] === 217) {
              eoi = true;
            }
          }
          if (eoi) {
            source = image.createImageSource(bytes);
            pixel = await source.createPixelMap(options(false));
            await equalPixels(pixel, expected);
            expect(pixel.getImageInfoSync().isHdr).assertEqual(expected.getImageInfoSync().isHdr);
            stable = lastSize === u.length ? stable + 1 : 0;
            lastSize = u.length;
            if (stable >= 2) {
              return;
            }
          }
        }
      }
    } catch (error) {
      lastError = (error as Error).message;
      stable = 0;
    } finally {
      if (pixel) {
        await pixel.release();
      }
      if (source) {
        await source.release();
      }
    }
    await delay();
  }
  encoderPoisoned = true;
  throw new Error('Encode deadline: complete new JPEG dimensions/content not observed: ' + path + ': ' + lastError);
}
export async function encodeStep(bytes: ArrayBuffer, method: string, hdr: boolean, requireHdr: boolean): Promise<void> {
  const source = image.createImageSource(bytes);
  const referenceSource = image.createImageSource(bytes);
  let pixel: image.PixelMap | undefined;
  let referencePixel: image.PixelMap | undefined;
  let expectedSource: image.ImageSource | undefined;
  let expected: image.PixelMap | undefined;
  const packer = image.createImagePacker();
  let nativeStarted = false;
  const cleanupGuard11 = new CleanupGuard();
  let cleanupGuard11Completed = false;
  try {
    pixel = await source.createPixelMap(options(false));
    referencePixel = await referenceSource.createPixelMap(options(false));
    expect(pixel.getImageInfoSync().isHdr).assertEqual(requireHdr);
    const packOptions: image.PackingOption = { format: 'image/jpeg', quality: 98 };
    if (hdr) {
      packOptions.desiredDynamicRange = image.PackingDynamicRange.AUTO;
    }
    const referenceBytes = method === 'encodeToStreamByPixelMap' || method === 'encodeToFileByPixelMap' ?
    await packer.packToData(referencePixel, packOptions) : await packer.packToData(referenceSource, packOptions);
    expectedSource = image.createImageSource(referenceBytes);
    expected = await expectedSource.createPixelMap(options(false));
    expect(expected.getImageInfoSync().isHdr).assertEqual(requireHdr && hdr);
    nativeStarted = true;
    await invokeEncode(method, source, pixel, hdr);
    await waitJpeg(outputPath(method), expected);
    cleanupGuard11Completed = true;
  }  finally {
    if (!cleanupGuard11Completed) {
      cleanupGuard11.markFailed();
      if (nativeStarted) {
        const quarantinedOwner: EncodeStepOwner = {
          source,
          referenceSource,
          pixel,
          referencePixel,
          expectedSource,
          expected,
          packer,
          bytes
        };
        quarantineEncoder(quarantinedOwner);
      }
    }
    await cleanupGuard11.runAsync(async (): Promise<void> => {
      if (!nativeStarted || !isEncoderQuarantined()) {
        if (expected) {
          await expected.release();
        }
        if (expectedSource) {
          await expectedSource.release();
        }
        if (pixel) {
          await pixel.release();
        }
        if (referencePixel) {
          await referencePixel.release();
        }
        await source.release();
        await referenceSource.release();
        await packer.release();
      }
    });
  }
}
export async function encodeCase(id: string, s: FixtureSpec, method: string, hdr: boolean): Promise<void> {
  const bytes = await makeBytes(s);
  await serialized(async (): Promise<void> => {
    const lease = new OutputLease(id);
    const cleanupGuard12 = new CleanupGuard();
    let cleanupGuard12Completed = false;
    try {
      await encodeStep(bytes, method, hdr, false);
      cleanupGuard12Completed = true;
    }  finally {
      if (!cleanupGuard12Completed) {
        cleanupGuard12.markFailed();
      }
      cleanupGuard12.runSync((): void => {
        lease.clean();
      });
    }
  });
}
export async function hdrEncode(id: string, method: string, hdr: boolean): Promise<void> {
  const bytes = await context().resourceManager.getMediaContent($r('app.media.CUVAHdr'));
  await serialized(async (): Promise<void> => {
    const lease = new OutputLease(id);
    const cleanupGuard13 = new CleanupGuard();
    let cleanupGuard13Completed = false;
    try {
      await encodeStep(bytes.buffer.slice(0), method, hdr, true);
      cleanupGuard13Completed = true;
    }  finally {
      if (!cleanupGuard13Completed) {
        cleanupGuard13.markFailed();
      }
      cleanupGuard13.runSync((): void => {
        lease.clean();
      });
    }
  });
}
export async function encodeSequence(id: string,
a: FixtureSpec,
am: string,
ah: boolean,
b: FixtureSpec,
bm: string,
bh: boolean): Promise<void> {
  const ab = await makeBytes(a);
  const bb = await makeBytes(b);
  await serialized(async (): Promise<void> => {
    const lease = new OutputLease(id);
    const cleanupGuard14 = new CleanupGuard();
    let cleanupGuard14Completed = false;
    try {
      await encodeStep(ab, am, ah, false);
      await encodeStep(bb, bm, bh, false);
      if (outputPath(am) !== outputPath(bm)) {
        const source = image.createImageSource(readFile(outputPath(am)));
        let p: image.PixelMap | undefined;
        const cleanupGuard15 = new CleanupGuard();
        let cleanupGuard15Completed = false;
        try {
          p = await source.createPixelMap();
          expect(p.getImageInfoSync().size.width).assertEqual(a.width);
          expect(p.getImageInfoSync().size.height).assertEqual(a.height);
          cleanupGuard15Completed = true;
        }  finally {
          if (!cleanupGuard15Completed) {
            cleanupGuard15.markFailed();
          }
          await cleanupGuard15.runAsync(async (): Promise<void> => {
            if (p) {
              await p.release();
            }
            await source.release();
          });
        }
      }
      cleanupGuard14Completed = true;
    }  finally {
      if (!cleanupGuard14Completed) {
        cleanupGuard14.markFailed();
      }
      cleanupGuard14.runSync((): void => {
        lease.clean();
      });
    }
  });
}
export async function exifCase(id: string, s: FixtureSpec, initial: string): Promise<void> {
  const bytes = await makeBytes(s);
  const box = new Sandbox(id);
  const path = box.root + '/input.jpg';
  let file: fs.File | undefined;
  let seed: image.ImageSource | undefined;
  let reopened: image.ImageSource | undefined;
  let p: image.PixelMap | undefined;
  let reference: image.ImageSource | undefined;
  let before: image.PixelMap | undefined;
  const cleanupGuard16 = new CleanupGuard();
  let cleanupGuard16Completed = false;
  try {
    box.write('input.jpg', bytes);
    file = fs.openSync(path, fs.OpenMode.READ_WRITE);
    reference = image.createImageSource(bytes);
    seed = image.createImageSource(file.fd);
    if (initial.length > 0) {
      await seed.modifyImageProperty(image.PropertyKey.IMAGE_WIDTH, initial);
      expect(await seed.getImageProperty(image.PropertyKey.IMAGE_WIDTH)).assertEqual(initial);
    } else {
      expect(await seed.getImageProperty(image.PropertyKey.IMAGE_WIDTH,
      { index: 0,
        defaultValue: 'EXP_ABSENT' })).assertEqual('EXP_ABSENT');
    }
    await seed.release();
    seed = undefined;
    await readAndEditEXIF(file.fd);
    reopened = image.createImageSource(path);
    expect(await reopened.getImageProperty(image.PropertyKey.IMAGE_WIDTH)).assertEqual('120');
    p = await reopened.createPixelMap(options(true));
    before = await reference.createPixelMap(options(true));
    expect(p.getImageInfoSync().size.width).assertEqual(32);
    expect(p.getImageInfoSync().size.height).assertEqual(24);
    await equalPixels(p,
    before);
    cleanupGuard16Completed = true;
  }  finally {
    if (!cleanupGuard16Completed) {
      cleanupGuard16.markFailed();
    }
    await cleanupGuard16.runAsync(async (): Promise<void> => {
      if (seed) {
        await seed.release();
      }
      if (p) {
        await p.release();
      }
      if (before) {
        await before.release();
      }
      if (reopened) {
        await reopened.release();
      }
      if (reference) {
        await reference.release();
      }
      if (file) {
        fs.closeSync(file);
      }
      box.clean();
    });
  }
}
