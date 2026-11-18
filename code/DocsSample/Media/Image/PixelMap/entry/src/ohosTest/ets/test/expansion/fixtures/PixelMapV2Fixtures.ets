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
import { equalPixels, serialized, Sandbox, OutputLease, testModuleContext } from './PixelMapFixtures';
import { CleanupGuard } from './PixelMapCleanup';

export interface V2EncoderOwner {
  handles: V2Handles;
  box: Sandbox;
  lease: OutputLease | undefined;
  encoded: ArrayBuffer;
  nextEncoded: ArrayBuffer;
  bytesSnapshot: ArrayBuffer;
  nextBytesSnapshot: ArrayBuffer;
}

// Tracks only handles owned by these tests, never the production singleton packer.
export class V2Handles {
  private sources: image.ImageSource[] = [];
  private pixels: image.PixelMap[] = [];
  private packers: image.ImagePacker[] = [];
  source(s: image.ImageSource): image.ImageSource {
    this.sources.push(s);
    return s;
  }
  pixel(p: image.PixelMap): image.PixelMap {
    this.pixels.push(p);
    return p;
  }
  packer(p: image.ImagePacker): image.ImagePacker {
    this.packers.push(p);
    return p;
  }
  get liveHandles(): number { return this.sources.length + this.pixels.length + this.packers.length; }
  async release(): Promise<void> {
    let failure = '';
    for (let i = this.pixels.length - 1; i >= 0; i--) {
      try {
        await this.pixels[i].release();
      } catch (error) {
        failure += 'PixelMap: ' + (error as Error).message + ';';
      }
    }
    for (let i = this.sources.length - 1; i >= 0; i--) {
      try {
        await this.sources[i].release();
      } catch (error) {
        failure += 'ImageSource: ' + (error as Error).message + ';';
      }
    }
    for (let i = this.packers.length - 1; i >= 0; i--) {
      try {
        await this.packers[i].release();
      } catch (error) {
        failure += 'ImagePacker: ' + (error as Error).message + ';';
      }
    }
    this.pixels = [];
    this.sources = [];
    this.packers = [];
    if (failure.length > 0) {
      throw new Error('V2 owned handle cleanup failed: ' + failure);
    }
  }
}
export function v2Context(): Context {
  return testModuleContext();
}
export function v2Cache(): string {
  return v2Context().cacheDir;
}
export function v2Read(path: string): ArrayBuffer {
  const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  const cleanupGuard1 = new CleanupGuard();
  let cleanupGuard1Completed = false;
  try {
    const bytes = new ArrayBuffer(fs.statSync(file.fd).size);
    expect(fs.readSync(file.fd, bytes)).assertEqual(bytes.byteLength);
    cleanupGuard1Completed = true;
    return bytes;
  }  finally {
    if (!cleanupGuard1Completed) {
      cleanupGuard1.markFailed();
    }
    cleanupGuard1.runSync((): void => {
      fs.closeSync(file);
    });
  }
}
export function equalBuffers(a: ArrayBuffer, b: ArrayBuffer): void {
  const x = new Uint8Array(a);
  const y = new Uint8Array(b);
  expect(x.length).assertEqual(y.length);
  let changed = 0;
  for (let i = 0; i < x.length; i++) {
    if (x[i] !== y[i]) {
      changed++;
    }
  }
  expect(changed).assertEqual(0);
}
export async function v2PixelBytes(p: image.PixelMap): Promise<ArrayBuffer> {
  const bytes = new ArrayBuffer(p.getPixelBytesNumber());
  await p.readPixelsToBuffer(bytes);
  return bytes;
}
function tick(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, 25);
  });
}
let timedOut = false;
export async function v2Serial(action: () => Promise<void>): Promise<void> {
  await serialized(async (): Promise<void> => {
    if (timedOut) {
      throw new Error('ENV_PRECONDITION: previous V2 native encoding timed out; abort run and restart fresh test process');
    }
    await action();
  });
}
// Completeness and new content are determined by an independent decoded SDK reference,
// not by the return of the production async wrapper or a file-existence check.
export async function v2WaitJpeg(path: string, expected: image.PixelMap): Promise<void> {
  let matchingSize = -1;
  let stableMatches = 0;
  let lastError = 'no JPEG output';
  for (let attempt = 0; attempt < 240; attempt++) {
    let source: image.ImageSource | undefined;
    let pixel: image.PixelMap | undefined;
    try {
      if (fs.accessSync(path)) {
        const bytes = v2Read(path);
        const data = new Uint8Array(bytes);
        let eoi = false;
        for (let i = 2; i < data.length - 1; i++) {
          if (data[i] === 255 && data[i + 1] === 217) {
            eoi = true;
          }
        }
        if (data.length > 4 && data[0] === 255 && data[1] === 216 && eoi) {
          source = image.createImageSource(bytes);
          pixel = await source.createPixelMap({ desiredDynamicRange: image.DecodingDynamicRange.AUTO });
          await equalPixels(pixel, expected);
          expect(pixel.getImageInfoSync().isHdr).assertEqual(expected.getImageInfoSync().isHdr);
          stableMatches = matchingSize === bytes.byteLength ? stableMatches + 1 : 0;
          matchingSize = bytes.byteLength;
          if (stableMatches >= 2) {
            return;
          }
        } else {
          stableMatches = 0;
        }
      } else {
        stableMatches = 0;
      }
    } catch (error) {
      lastError = (error as Error).message;
      stableMatches = 0;
    } finally {
      const cleanupTail = new CleanupGuard();
      await cleanupTail.finishAsync(async (): Promise<void> => {
        if (pixel) {
          await pixel.release();
        }
      }, async (): Promise<void> => {
        if (source) {
          await source.release();
        }
      });
    }
    await tick();
  }
  timedOut = true;
  throw new Error('V2 complete new JPEG deadline exceeded; stop all encoder tests: ' + path + ': ' + lastError);
}
