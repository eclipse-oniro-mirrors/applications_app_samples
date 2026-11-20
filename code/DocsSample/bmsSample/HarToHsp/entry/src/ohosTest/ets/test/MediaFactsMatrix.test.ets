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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryResources, libraryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, LIBRARY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

function chunkCount(bytes: Uint8Array): number {
  let off: number = 8;
  let count: number = 0;
  while (off + 12 <= bytes.length) {
    const size: number = PngOracle.readUint32(bytes, off);
    count += 1;
    off += 12 + size;
  }
  return count;
}

function chunkLayout(bytes: Uint8Array): string {
  const parts: string[] = [];
  let off: number = 8;
  while (off + 12 <= bytes.length) {
    const size: number = PngOracle.readUint32(bytes, off);
    parts.push(String.fromCharCode(bytes[off + 4], bytes[off + 5], bytes[off + 6], bytes[off + 7]));
    off += 12 + size;
  }
  return parts.join(',');
}

function idatTotal(bytes: Uint8Array): number {
  let total: number = 0;
  let off: number = 8;
  while (off + 12 <= bytes.length) {
    const size: number = PngOracle.readUint32(bytes, off);
    if (bytes[off + 4] === 0x49 && bytes[off + 5] === 0x44) {
      total += size;
    }
    off += 12 + size;
  }
  return total;
}

function foldSum(bytes: Uint8Array): number {
  let total: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    total = (total + bytes[i]) % 65537;
  }
  return total;
}

function countValue(bytes: Uint8Array, value: number): number {
  let found: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    if (bytes[i] === value) {
      found += 1;
    }
  }
  return found;
}

function crc32Of(bytes: Uint8Array): number {
  let crc: number = 0xFFFFFFFF;
  for (let i: number = 0; i < bytes.length; i++) {
