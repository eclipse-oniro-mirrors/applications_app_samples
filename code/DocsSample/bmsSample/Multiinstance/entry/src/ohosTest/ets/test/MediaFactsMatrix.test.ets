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
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { fileIo as fs } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryContext, entryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
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
    crc = (crc ^ bytes[i]) >>> 0;
    for (let k: number = 0; k < 8; k++) {
      crc = (crc & 1) === 1 ? ((crc >>> 1) ^ 0xEDB88320) >>> 0 : (crc >>> 1) >>> 0;
    }
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

export default function mediaFactsMatrixTest() {
  describe('mediaFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0001
   * @tc.name      testMediaFacts0001
   * @tc.desc      Media background keeps byte size
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0001', 'background byte size');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes.length > 8000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0002
   * @tc.name      testMediaFacts0002
   * @tc.desc      Media background keeps signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0002', 'background signature');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(bytes[0]).assertEqual(137);
    expect(bytes[1]).assertEqual(80);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0003
   * @tc.name      testMediaFacts0003
   * @tc.desc      Media background keeps width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0003', 'background width');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.width(bytes) % 8).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0004
   * @tc.name      testMediaFacts0004
   * @tc.desc      Media background keeps height
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0004', 'background height');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(PngOracle.height(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes) >= 144).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0005
   * @tc.name      testMediaFacts0005
   * @tc.desc      Media background keeps chunk count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0005', 'background chunk count');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(chunkCount(bytes)).assertEqual(15);
    expect(chunkCount(bytes) >= 5).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0006
   * @tc.name      testMediaFacts0006
   * @tc.desc      Media background keeps chunk order
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0006', 'background chunk order');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(chunkLayout(bytes).startsWith('IHDR')).assertTrue();
    expect(chunkLayout(bytes).endsWith('IEND')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0007
   * @tc.name      testMediaFacts0007
   * @tc.desc      Media background keeps idat payload
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0007', 'background idat payload');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(idatTotal(bytes)).assertEqual(91737);
    expect(idatTotal(bytes) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0008
   * @tc.name      testMediaFacts0008
   * @tc.desc      Media background keeps checksum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0008', 'background checksum');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(foldSum(bytes)).assertEqual(16208);
    expect(foldSum(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0009
   * @tc.name      testMediaFacts0009
   * @tc.desc      Media background keeps crc32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0009', 'background crc32');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(crc32Of(bytes)).assertEqual(1960803650);
    expect(crc32Of(bytes) > 1000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0010
   * @tc.name      testMediaFacts0010
   * @tc.desc      Media background keeps zero bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0010', 'background zero bytes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(countValue(bytes, 0)).assertEqual(1086);
    expect(countValue(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0011
   * @tc.name      testMediaFacts0011
   * @tc.desc      Media background keeps max bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0011', 'background max bytes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(countValue(bytes, 255)).assertEqual(566);
    expect(countValue(bytes, 0) + countValue(bytes, 255) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0012
   * @tc.name      testMediaFacts0012
   * @tc.desc      Media background keeps edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0012', 'background edges');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes[bytes.length - 1]).assertEqual(130);
    expect(bytes[bytes.length - 12]).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0013
   * @tc.name      testMediaFacts0013
   * @tc.desc      Media foreground keeps byte size
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0013', 'foreground byte size');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(bytes.length).assertEqual(8805);
    expect(bytes.length > 8000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0014
   * @tc.name      testMediaFacts0014
   * @tc.desc      Media foreground keeps signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0014', 'foreground signature');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(bytes[0]).assertEqual(137);
    expect(bytes[1]).assertEqual(80);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0015
   * @tc.name      testMediaFacts0015
   * @tc.desc      Media foreground keeps width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0015', 'foreground width');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.width(bytes) % 8).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0016
   * @tc.name      testMediaFacts0016
   * @tc.desc      Media foreground keeps height
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0016', 'foreground height');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.height(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes) >= 144).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0017
   * @tc.name      testMediaFacts0017
   * @tc.desc      Media foreground keeps chunk count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0017', 'foreground chunk count');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(chunkCount(bytes)).assertEqual(5);
    expect(chunkCount(bytes) >= 5).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0018
   * @tc.name      testMediaFacts0018
   * @tc.desc      Media foreground keeps chunk order
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0018', 'foreground chunk order');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(chunkLayout(bytes).startsWith('IHDR')).assertTrue();
    expect(chunkLayout(bytes).endsWith('IEND')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0019
   * @tc.name      testMediaFacts0019
   * @tc.desc      Media foreground keeps idat payload
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0019', 'foreground idat payload');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(idatTotal(bytes)).assertEqual(8720);
    expect(idatTotal(bytes) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0020
   * @tc.name      testMediaFacts0020
   * @tc.desc      Media foreground keeps checksum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0020', 'foreground checksum');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(foldSum(bytes)).assertEqual(12880);
    expect(foldSum(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0021
   * @tc.name      testMediaFacts0021
   * @tc.desc      Media foreground keeps crc32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0021', 'foreground crc32');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(crc32Of(bytes)).assertEqual(341252579);
    expect(crc32Of(bytes) > 1000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0022
   * @tc.name      testMediaFacts0022
   * @tc.desc      Media foreground keeps zero bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0022', 'foreground zero bytes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(countValue(bytes, 0)).assertEqual(3822);
    expect(countValue(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0023
   * @tc.name      testMediaFacts0023
   * @tc.desc      Media foreground keeps max bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0023', 'foreground max bytes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(countValue(bytes, 255)).assertEqual(34);
    expect(countValue(bytes, 0) + countValue(bytes, 255) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0024
   * @tc.name      testMediaFacts0024
   * @tc.desc      Media foreground keeps edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0024', 'foreground edges');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(bytes[bytes.length - 1]).assertEqual(130);
    expect(bytes[bytes.length - 12]).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0025
   * @tc.name      testMediaFacts0025
   * @tc.desc      Media startIcon keeps byte size
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0025', 'startIcon byte size');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes.length > 8000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0026
   * @tc.name      testMediaFacts0026
   * @tc.desc      Media startIcon keeps signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0026', 'startIcon signature');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(bytes[0]).assertEqual(137);
    expect(bytes[1]).assertEqual(80);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0027
   * @tc.name      testMediaFacts0027
   * @tc.desc      Media startIcon keeps width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0027', 'startIcon width');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.width(bytes) % 8).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0028
   * @tc.name      testMediaFacts0028
   * @tc.desc      Media startIcon keeps height
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0028', 'startIcon height');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(PngOracle.height(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes) >= 144).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0029
   * @tc.name      testMediaFacts0029
   * @tc.desc      Media startIcon keeps chunk count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0029', 'startIcon chunk count');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(chunkCount(bytes)).assertEqual(6);
    expect(chunkCount(bytes) >= 5).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0030
   * @tc.name      testMediaFacts0030
   * @tc.desc      Media startIcon keeps chunk order
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0030', 'startIcon chunk order');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(chunkLayout(bytes).startsWith('IHDR')).assertTrue();
    expect(chunkLayout(bytes).endsWith('IEND')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0031
   * @tc.name      testMediaFacts0031
   * @tc.desc      Media startIcon keeps idat payload
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0031', 'startIcon idat payload');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(idatTotal(bytes)).assertEqual(19940);
    expect(idatTotal(bytes) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0032
   * @tc.name      testMediaFacts0032
   * @tc.desc      Media startIcon keeps checksum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMediaFacts0032', 'startIcon checksum');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(foldSum(bytes)).assertEqual(39137);
    expect(foldSum(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0033
   * @tc.name      testMediaFacts0033
   * @tc.desc      Media startIcon keeps crc32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMediaFacts0033', 'startIcon crc32');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(crc32Of(bytes)).assertEqual(3975085642);
    expect(crc32Of(bytes) > 1000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MED_0034
   * @tc.name      testMediaFacts0034
   * @tc.desc      Media startIcon keeps zero bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMediaFacts0034', 'startIcon zero bytes');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(countValue(bytes, 0)).assertEqual(126);
    expect(countValue(bytes, 0) < bytes.length).assertTrue();
  });
  });
}
