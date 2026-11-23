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
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext, PngOracle } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

function byteSum(bytes: Uint8Array): number {
  let total: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    total += bytes[i];
  }
  return total;
}

function xorFold(bytes: Uint8Array): number {
  let acc: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    acc = (acc ^ bytes[i]) >>> 0;
  }
  return acc;
}

function crc32Of(bytes: Uint8Array): number {
  let crc: number = 0xFFFFFFFF;
  for (let i: number = 0; i < bytes.length; i++) {
    crc = (crc ^ bytes[i]) >>> 0;
    for (let k: number = 0; k < 8; k++) {
      if ((crc & 1) === 1) {
        crc = ((crc >>> 1) ^ 0xEDB88320) >>> 0;
      } else {
        crc = (crc >>> 1) >>> 0;
      }
    }
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

function countByte(bytes: Uint8Array, value: number): number {
  let found: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    if (bytes[i] === value) {
      found += 1;
    }
  }
  return found;
}

function sumRange(bytes: Uint8Array, from: number, to: number): number {
  let total: number = 0;
  for (let i: number = from; i < to; i++) {
    total += bytes[i];
  }
  return total;
}

function countAtLeast(bytes: Uint8Array, limit: number): number {
  let found: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    if (bytes[i] >= limit) {
      found += 1;
    }
  }
  return found;
}

function indexOfMin(bytes: Uint8Array): number {
  let pos: number = 0;
  for (let i: number = 1; i < bytes.length; i++) {
    if (bytes[i] < bytes[pos]) {
      pos = i;
    }
  }
  return pos;
}

function indexOfMax(bytes: Uint8Array): number {
  let pos: number = 0;
  for (let i: number = 1; i < bytes.length; i++) {
    if (bytes[i] > bytes[pos]) {
      pos = i;
    }
  }
  return pos;
}

function weightedSum(bytes: Uint8Array): number {
  let total: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    total = (total + i * bytes[i]) % 1000003;
  }
  return total;
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

function firstIdatDataOffset(bytes: Uint8Array): number {
  let off: number = 8;
  while (off + 12 <= bytes.length) {
    const size: number = PngOracle.readUint32(bytes, off);
    if (bytes[off + 4] === 0x49 && bytes[off + 5] === 0x44 && bytes[off + 6] === 0x41) {
      return off + 8;
    }
    off += 12 + size;
  }
  return -1;
}

function distinctValues(bytes: Uint8Array): number {
  const seen: Uint8Array = new Uint8Array(256);
  let count: number = 0;
  for (let i: number = 0; i < bytes.length; i++) {
    if (seen[bytes[i]] === 0) {
      seen[bytes[i]] = 1;
      count += 1;
    }
  }
  return count;
}


export default function mediaChecksumMatrixTest() {
  describe('mediaChecksumMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0001
   * @tc.name      testMediaChecksum0001
   * @tc.desc      background keeps byte size
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0001', 'background byte size');
    expect(bytes.length).assertEqual(91942);
    expect(bytes.length > 4000).assertTrue();
    expect(bytes.byteLength).assertEqual(91942);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0002
   * @tc.name      testMediaChecksum0002
   * @tc.desc      background keeps byte sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0002', 'background byte sum');
    expect(byteSum(bytes) % 1000003).assertEqual(74980);
    expect(byteSum(bytes) > bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0003
   * @tc.name      testMediaChecksum0003
   * @tc.desc      background keeps xor fold
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0003', 'background xor fold');
    expect(xorFold(bytes)).assertEqual(172);
    expect(xorFold(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0004
   * @tc.name      testMediaChecksum0004
   * @tc.desc      background keeps crc32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0004', 'background crc32');
    expect(crc32Of(bytes)).assertEqual(1960803650);
    expect(crc32Of(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0005
   * @tc.name      testMediaChecksum0005
   * @tc.desc      background keeps zero byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0005', 'background zero byte count');
    expect(countByte(bytes, 0)).assertEqual(1086);
    expect(countByte(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0006
   * @tc.name      testMediaChecksum0006
   * @tc.desc      background keeps 0xFF byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0006', 'background 0xFF byte count');
    expect(countByte(bytes, 255)).assertEqual(566);
    expect(countByte(bytes, 255) + countByte(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0007
   * @tc.name      testMediaChecksum0007
   * @tc.desc      background keeps minimum byte value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0007', 'background minimum byte value');
    expect(indexOfMin(bytes)).assertEqual(8);
    expect(bytes[indexOfMin(bytes)]).assertEqual(0);
    expect(bytes[8]).assertEqual(bytes[indexOfMin(bytes)]);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0008
   * @tc.name      testMediaChecksum0008
   * @tc.desc      background keeps maximum byte value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0008', 'background maximum byte value');
    expect(bytes[106]).assertEqual(255);
    expect(indexOfMax(bytes)).assertEqual(106);
    expect(bytes[indexOfMax(bytes)] >= bytes[0]).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0009
   * @tc.name      testMediaChecksum0009
   * @tc.desc      background keeps signature bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0009', 'background signature bytes');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(bytes[0] === 0x89 && bytes[1] === 0x50).assertTrue();
    expect(bytes[2] === 0x4E && bytes[3] === 0x47).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0010
   * @tc.name      testMediaChecksum0010
   * @tc.desc      background keeps IHDR width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0010', 'background IHDR width');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.width(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0011
   * @tc.name      testMediaChecksum0011
   * @tc.desc      background keeps IHDR height
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0011', 'background IHDR height');
    expect(PngOracle.height(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0012
   * @tc.name      testMediaChecksum0012
   * @tc.desc      background keeps bit depth
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0012', 'background bit depth');
    expect(bytes[24]).assertEqual(8);
    expect(bytes[24] === 8).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0013
   * @tc.name      testMediaChecksum0013
   * @tc.desc      background keeps color type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0013', 'background color type');
    expect(bytes[25]).assertEqual(6);
    expect(bytes[25] >= 0 && bytes[25] <= 6).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0014
   * @tc.name      testMediaChecksum0014
   * @tc.desc      background keeps chunk layout
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0014', 'background chunk layout');
    expect(chunkLayout(bytes)).assertEqual('IHDR,sBIT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IDAT,IEND');
    expect(chunkLayout(bytes).startsWith('IHDR')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0015
   * @tc.name      testMediaChecksum0015
   * @tc.desc      background keeps chunk count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0015', 'background chunk count');
    expect(chunkLayout(bytes).split(',').length).assertEqual(15);
    expect(chunkLayout(bytes).endsWith('IEND')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0016
   * @tc.name      testMediaChecksum0016
   * @tc.desc      background keeps IDAT payload total
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0016', 'background IDAT payload total');
    expect(idatTotal(bytes)).assertEqual(91737);
    expect(idatTotal(bytes) > (bytes.length * 9) / 10).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0017
   * @tc.name      testMediaChecksum0017
   * @tc.desc      background keeps distinct byte values
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0017', 'background distinct byte values');
    expect(distinctValues(bytes)).assertEqual(256);
    expect(distinctValues(bytes) >= 200).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0018
   * @tc.name      testMediaChecksum0018
   * @tc.desc      background keeps first window sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0018', 'background first window sum');
    expect(sumRange(bytes, 0, 1024) % 65521).assertEqual(64978);
    expect(sumRange(bytes, 0, 1024) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0019
   * @tc.name      testMediaChecksum0019
   * @tc.desc      background keeps last window sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0019', 'background last window sum');
    expect(sumRange(bytes, bytes.length - 1024, bytes.length) % 65521).assertEqual(63414);
    expect(sumRange(bytes, bytes.length - 1024, bytes.length) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0020
   * @tc.name      testMediaChecksum0020
   * @tc.desc      background keeps header octets
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0020', 'background header octets');
    expect(PngOracle.readUint32(bytes, 8)).assertEqual(13);
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0021
   * @tc.name      testMediaChecksum0021
   * @tc.desc      background keeps high half byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0021', 'background high half byte count');
    expect(countAtLeast(bytes, 128)).assertEqual(47243);
    expect(countAtLeast(bytes, 128) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0022
   * @tc.name      testMediaChecksum0022
   * @tc.desc      background keeps leading zero offset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0022', 'background leading zero offset');
    expect(bytes.indexOf(0)).assertEqual(8);
    expect(bytes.indexOf(0) < bytes.indexOf(255)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0023
   * @tc.name      testMediaChecksum0023
   * @tc.desc      background keeps IEND crc field
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0023', 'background IEND crc field');
    expect(PngOracle.readUint32(bytes, bytes.length - 8)).assertEqual(1229278788);
    expect(bytes[bytes.length - 1]).assertEqual(130);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0024
   * @tc.name      testMediaChecksum0024
   * @tc.desc      background keeps zlib header
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0024', 'background zlib header');
    const dataOff: number = firstIdatDataOffset(bytes);
    expect(dataOff > 0).assertTrue();
    expect(bytes[dataOff]).assertEqual(120);
    expect(bytes[dataOff + 1]).assertEqual(156);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0025
   * @tc.name      testMediaChecksum0025
   * @tc.desc      background keeps scaled mean
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0025', 'background scaled mean');
    expect(Math.round(byteSum(bytes) * 1000 / bytes.length)).assertEqual(131333);
    expect(byteSum(bytes) / bytes.length < 256).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0026
   * @tc.name      testMediaChecksum0026
   * @tc.desc      background keeps sum modulo 251
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0026', 'background sum modulo 251');
    expect(byteSum(bytes) % 251).assertEqual(159);
    expect(byteSum(bytes) % 1009).assertEqual(313);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0027
   * @tc.name      testMediaChecksum0027
   * @tc.desc      background keeps position weighted sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0027', 'background position weighted sum');
    expect(weightedSum(bytes)).assertEqual(723880);
    expect(weightedSum(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0028
   * @tc.name      testMediaChecksum0028
   * @tc.desc      background keeps pixel density
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0028', 'background pixel density');
    expect((PngOracle.width(bytes) * PngOracle.height(bytes)) % 1009).assertEqual(225);
    expect(PngOracle.width(bytes) * PngOracle.height(bytes) > 10000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0029
   * @tc.name      testMediaChecksum0029
   * @tc.desc      background keeps minimum position stability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0029', 'background minimum position stability');
    const p1: number = indexOfMin(bytes);
    const p2: number = indexOfMin(bytes);
    expect(p1).assertEqual(p2);
    expect(p1 >= 8).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0030
   * @tc.name      testMediaChecksum0030
   * @tc.desc      background keeps maximum position stability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    logCase('testMediaChecksum0030', 'background maximum position stability');
    const q1: number = indexOfMax(bytes);
    const q2: number = indexOfMax(bytes);
    expect(q1).assertEqual(q2);
    expect(bytes[q1]).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0058
   * @tc.name      testMediaChecksum0058
   * @tc.desc      foreground keeps pixel density
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    logCase('testMediaChecksum0058', 'foreground pixel density');
    expect((PngOracle.width(bytes) * PngOracle.height(bytes)) % 1009).assertEqual(225);
    expect(PngOracle.width(bytes) * PngOracle.height(bytes) > 10000).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0059
   * @tc.name      testMediaChecksum0059
   * @tc.desc      foreground keeps minimum position stability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    logCase('testMediaChecksum0059', 'foreground minimum position stability');
    const p1: number = indexOfMin(bytes);
    const p2: number = indexOfMin(bytes);
    expect(p1).assertEqual(p2);
    expect(p1 >= 8).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0060
   * @tc.name      testMediaChecksum0060
   * @tc.desc      foreground keeps maximum position stability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    logCase('testMediaChecksum0060', 'foreground maximum position stability');
    const q1: number = indexOfMax(bytes);
    const q2: number = indexOfMax(bytes);
    expect(q1).assertEqual(q2);
    expect(bytes[q1]).assertEqual(255);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0061
   * @tc.name      testMediaChecksum0061
   * @tc.desc      startIcon keeps byte size
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0061', 'startIcon byte size');
    expect(bytes.length).assertEqual(20093);
    expect(bytes.length > 4000).assertTrue();
    expect(bytes.byteLength).assertEqual(20093);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0062
   * @tc.name      testMediaChecksum0062
   * @tc.desc      startIcon keeps byte sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0062', 'startIcon byte sum');
    expect(byteSum(bytes) % 1000003).assertEqual(726148);
    expect(byteSum(bytes) > bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0063
   * @tc.name      testMediaChecksum0063
   * @tc.desc      startIcon keeps xor fold
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0063', 'startIcon xor fold');
    expect(xorFold(bytes)).assertEqual(110);
    expect(xorFold(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0064
   * @tc.name      testMediaChecksum0064
   * @tc.desc      startIcon keeps crc32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0064', 'startIcon crc32');
    expect(crc32Of(bytes)).assertEqual(3975085642);
    expect(crc32Of(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0065
   * @tc.name      testMediaChecksum0065
   * @tc.desc      startIcon keeps zero byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0065', 'startIcon zero byte count');
    expect(countByte(bytes, 0)).assertEqual(126);
    expect(countByte(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0066
   * @tc.name      testMediaChecksum0066
   * @tc.desc      startIcon keeps 0xFF byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0066', 'startIcon 0xFF byte count');
    expect(countByte(bytes, 255)).assertEqual(93);
    expect(countByte(bytes, 255) + countByte(bytes, 0) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0067
   * @tc.name      testMediaChecksum0067
   * @tc.desc      startIcon keeps minimum byte value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0067', 'startIcon minimum byte value');
    expect(indexOfMin(bytes)).assertEqual(8);
    expect(bytes[indexOfMin(bytes)]).assertEqual(0);
    expect(bytes[8]).assertEqual(bytes[indexOfMin(bytes)]);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0068
   * @tc.name      testMediaChecksum0068
   * @tc.desc      startIcon keeps maximum byte value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0068', 'startIcon maximum byte value');
    expect(bytes[226]).assertEqual(255);
    expect(indexOfMax(bytes)).assertEqual(226);
    expect(bytes[indexOfMax(bytes)] >= bytes[0]).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0069
   * @tc.name      testMediaChecksum0069
   * @tc.desc      startIcon keeps signature bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0069', 'startIcon signature bytes');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(bytes[0] === 0x89 && bytes[1] === 0x50).assertTrue();
    expect(bytes[2] === 0x4E && bytes[3] === 0x47).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0070
   * @tc.name      testMediaChecksum0070
   * @tc.desc      startIcon keeps IHDR width
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0070', 'startIcon IHDR width');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.width(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0071
   * @tc.name      testMediaChecksum0071
   * @tc.desc      startIcon keeps IHDR height
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0071', 'startIcon IHDR height');
    expect(PngOracle.height(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0072
   * @tc.name      testMediaChecksum0072
   * @tc.desc      startIcon keeps bit depth
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0072', 'startIcon bit depth');
    expect(bytes[24]).assertEqual(8);
    expect(bytes[24] === 8).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0073
   * @tc.name      testMediaChecksum0073
   * @tc.desc      startIcon keeps color type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0073', 'startIcon color type');
    expect(bytes[25]).assertEqual(6);
    expect(bytes[25] >= 0 && bytes[25] <= 6).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0074
   * @tc.name      testMediaChecksum0074
   * @tc.desc      startIcon keeps chunk layout
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0074', 'startIcon chunk layout');
    expect(chunkLayout(bytes)).assertEqual('IHDR,gAMA,eXIf,IDAT,IDAT,IEND');
    expect(chunkLayout(bytes).startsWith('IHDR')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0075
   * @tc.name      testMediaChecksum0075
   * @tc.desc      startIcon keeps chunk count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0075', 'startIcon chunk count');
    expect(chunkLayout(bytes).split(',').length).assertEqual(6);
    expect(chunkLayout(bytes).endsWith('IEND')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0076
   * @tc.name      testMediaChecksum0076
   * @tc.desc      startIcon keeps IDAT payload total
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0076', 'startIcon IDAT payload total');
    expect(idatTotal(bytes)).assertEqual(19940);
    expect(idatTotal(bytes) > (bytes.length * 9) / 10).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0077
   * @tc.name      testMediaChecksum0077
   * @tc.desc      startIcon keeps distinct byte values
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0077', 'startIcon distinct byte values');
    expect(distinctValues(bytes)).assertEqual(256);
    expect(distinctValues(bytes) >= 200).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0078
   * @tc.name      testMediaChecksum0078
   * @tc.desc      startIcon keeps first window sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0078', 'startIcon first window sum');
    expect(sumRange(bytes, 0, 1024) % 65521).assertEqual(2500);
    expect(sumRange(bytes, 0, 1024) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0079
   * @tc.name      testMediaChecksum0079
   * @tc.desc      startIcon keeps last window sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0079', 'startIcon last window sum');
    expect(sumRange(bytes, bytes.length - 1024, bytes.length) % 65521).assertEqual(14261);
    expect(sumRange(bytes, bytes.length - 1024, bytes.length) > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0080
   * @tc.name      testMediaChecksum0080
   * @tc.desc      startIcon keeps header octets
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0080', 'startIcon header octets');
    expect(PngOracle.readUint32(bytes, 8)).assertEqual(13);
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0081
   * @tc.name      testMediaChecksum0081
   * @tc.desc      startIcon keeps high half byte count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0081', 'startIcon high half byte count');
    expect(countAtLeast(bytes, 128)).assertEqual(10744);
    expect(countAtLeast(bytes, 128) < bytes.length).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0082
   * @tc.name      testMediaChecksum0082
   * @tc.desc      startIcon keeps leading zero offset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0082', 'startIcon leading zero offset');
    expect(bytes.indexOf(0)).assertEqual(8);
    expect(bytes.indexOf(0) < bytes.indexOf(255)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0083
   * @tc.name      testMediaChecksum0083
   * @tc.desc      startIcon keeps IEND crc field
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMediaChecksum0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0083', 'startIcon IEND crc field');
    expect(PngOracle.readUint32(bytes, bytes.length - 8)).assertEqual(1229278788);
    expect(bytes[bytes.length - 1]).assertEqual(130);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0084
   * @tc.name      testMediaChecksum0084
   * @tc.desc      startIcon keeps zlib header
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMediaChecksum0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0084', 'startIcon zlib header');
    const dataOff: number = firstIdatDataOffset(bytes);
    expect(dataOff > 0).assertTrue();
    expect(bytes[dataOff]).assertEqual(120);
    expect(bytes[dataOff + 1]).assertEqual(1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_MEDIA_0085
   * @tc.name      testMediaChecksum0085
   * @tc.desc      startIcon keeps scaled mean
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMediaChecksum0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    logCase('testMediaChecksum0085', 'startIcon scaled mean');
    expect(Math.round(byteSum(bytes) * 1000 / bytes.length)).assertEqual(135677);
    expect(byteSum(bytes) / bytes.length < 256).assertTrue();
  });
  });
}
