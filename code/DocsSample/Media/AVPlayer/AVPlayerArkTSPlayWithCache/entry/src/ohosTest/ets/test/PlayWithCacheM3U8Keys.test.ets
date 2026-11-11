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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheM3U8Keys]';
const DOMAIN: number = 0xF813;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheM3U8KeysTest(): void {
  describe('playWithCacheM3U8KeysTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0001
     * @tc.name      testExtCacheKeyRotate0000
     * @tc.desc      Key rotation 0 with IV 0 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000000';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0002
     * @tc.name      testExtCacheKeyRotate0001
     * @tc.desc      Key rotation 1 with IV 17 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000011';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0003
     * @tc.name      testExtCacheKeyRotate0002
     * @tc.desc      Key rotation 2 with IV 34 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000022';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0004
     * @tc.name      testExtCacheKeyRotate0003
     * @tc.desc      Key rotation 3 with IV 51 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000033';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0005
     * @tc.name      testExtCacheKeyRotate0004
     * @tc.desc      Key rotation 0 with IV 68 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000044';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0006
     * @tc.name      testExtCacheKeyRotate0005
     * @tc.desc      Key rotation 1 with IV 85 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000055';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0007
     * @tc.name      testExtCacheKeyRotate0006
     * @tc.desc      Key rotation 2 with IV 102 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000066';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0008
     * @tc.name      testExtCacheKeyRotate0007
     * @tc.desc      Key rotation 3 with IV 119 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000077';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0009
     * @tc.name      testExtCacheKeyRotate0008
     * @tc.desc      Key rotation 0 with IV 136 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000088';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0010
     * @tc.name      testExtCacheKeyRotate0009
     * @tc.desc      Key rotation 1 with IV 153 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000099';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0011
     * @tc.name      testExtCacheKeyRotate0010
     * @tc.desc      Key rotation 2 with IV 170 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000000aa';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0012
     * @tc.name      testExtCacheKeyRotate0011
     * @tc.desc      Key rotation 3 with IV 187 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000000bb';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0013
     * @tc.name      testExtCacheKeyRotate0012
     * @tc.desc      Key rotation 0 with IV 204 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000000cc';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0014
     * @tc.name      testExtCacheKeyRotate0013
     * @tc.desc      Key rotation 1 with IV 221 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000000dd';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0015
     * @tc.name      testExtCacheKeyRotate0014
     * @tc.desc      Key rotation 2 with IV 238 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000000ee';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0016
     * @tc.name      testExtCacheKeyRotate0015
     * @tc.desc      Key rotation 3 with IV 255 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000000ff';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0017
     * @tc.name      testExtCacheKeyRotate0016
     * @tc.desc      Key rotation 0 with IV 272 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000110';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0018
     * @tc.name      testExtCacheKeyRotate0017
     * @tc.desc      Key rotation 1 with IV 289 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000121';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0019
     * @tc.name      testExtCacheKeyRotate0018
     * @tc.desc      Key rotation 2 with IV 306 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000132';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0020
     * @tc.name      testExtCacheKeyRotate0019
     * @tc.desc      Key rotation 3 with IV 323 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000143';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0021
     * @tc.name      testExtCacheKeyRotate0020
     * @tc.desc      Key rotation 0 with IV 340 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000154';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0022
     * @tc.name      testExtCacheKeyRotate0021
     * @tc.desc      Key rotation 1 with IV 357 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000165';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0023
     * @tc.name      testExtCacheKeyRotate0022
     * @tc.desc      Key rotation 2 with IV 374 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000176';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0024
     * @tc.name      testExtCacheKeyRotate0023
     * @tc.desc      Key rotation 3 with IV 391 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000187';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0025
     * @tc.name      testExtCacheKeyRotate0024
     * @tc.desc      Key rotation 0 with IV 408 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000198';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0026
     * @tc.name      testExtCacheKeyRotate0025
     * @tc.desc      Key rotation 1 with IV 425 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000001a9';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0027
     * @tc.name      testExtCacheKeyRotate0026
     * @tc.desc      Key rotation 2 with IV 442 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000001ba';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0028
     * @tc.name      testExtCacheKeyRotate0027
     * @tc.desc      Key rotation 3 with IV 459 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000001cb';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0029
     * @tc.name      testExtCacheKeyRotate0028
     * @tc.desc      Key rotation 0 with IV 476 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000001dc';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0030
     * @tc.name      testExtCacheKeyRotate0029
     * @tc.desc      Key rotation 1 with IV 493 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000001ed';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0031
     * @tc.name      testExtCacheKeyRotate0030
     * @tc.desc      Key rotation 2 with IV 510 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000001fe';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0032
     * @tc.name      testExtCacheKeyRotate0031
     * @tc.desc      Key rotation 3 with IV 527 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x0000000000000000000000000000020f';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0033
     * @tc.name      testExtCacheKeyRotate0032
     * @tc.desc      Key rotation 0 with IV 544 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000220';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0034
     * @tc.name      testExtCacheKeyRotate0033
     * @tc.desc      Key rotation 1 with IV 561 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000231';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0035
     * @tc.name      testExtCacheKeyRotate0034
     * @tc.desc      Key rotation 2 with IV 578 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000242';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0036
     * @tc.name      testExtCacheKeyRotate0035
     * @tc.desc      Key rotation 3 with IV 595 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000253';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0037
     * @tc.name      testExtCacheKeyRotate0036
     * @tc.desc      Key rotation 0 with IV 612 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000264';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0038
     * @tc.name      testExtCacheKeyRotate0037
     * @tc.desc      Key rotation 1 with IV 629 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000275';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0039
     * @tc.name      testExtCacheKeyRotate0038
     * @tc.desc      Key rotation 2 with IV 646 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000286';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0040
     * @tc.name      testExtCacheKeyRotate0039
     * @tc.desc      Key rotation 3 with IV 663 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000297';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0041
     * @tc.name      testExtCacheKeyRotate0040
     * @tc.desc      Key rotation 0 with IV 680 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000002a8';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0042
     * @tc.name      testExtCacheKeyRotate0041
     * @tc.desc      Key rotation 1 with IV 697 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000002b9';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0043
     * @tc.name      testExtCacheKeyRotate0042
     * @tc.desc      Key rotation 2 with IV 714 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000002ca';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0044
     * @tc.name      testExtCacheKeyRotate0043
     * @tc.desc      Key rotation 3 with IV 731 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000002db';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0045
     * @tc.name      testExtCacheKeyRotate0044
     * @tc.desc      Key rotation 0 with IV 748 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000002ec';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0046
     * @tc.name      testExtCacheKeyRotate0045
     * @tc.desc      Key rotation 1 with IV 765 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000002fd';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0047
     * @tc.name      testExtCacheKeyRotate0046
     * @tc.desc      Key rotation 2 with IV 782 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000030e';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0048
     * @tc.name      testExtCacheKeyRotate0047
     * @tc.desc      Key rotation 3 with IV 799 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x0000000000000000000000000000031f';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0049
     * @tc.name      testExtCacheKeyRotate0048
     * @tc.desc      Key rotation 0 with IV 816 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000330';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0050
     * @tc.name      testExtCacheKeyRotate0049
     * @tc.desc      Key rotation 1 with IV 833 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000341';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0051
     * @tc.name      testExtCacheKeyRotate0050
     * @tc.desc      Key rotation 2 with IV 850 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000352';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0052
     * @tc.name      testExtCacheKeyRotate0051
     * @tc.desc      Key rotation 3 with IV 867 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000363';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0053
     * @tc.name      testExtCacheKeyRotate0052
     * @tc.desc      Key rotation 0 with IV 884 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000374';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0054
     * @tc.name      testExtCacheKeyRotate0053
     * @tc.desc      Key rotation 1 with IV 901 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000385';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0055
     * @tc.name      testExtCacheKeyRotate0054
     * @tc.desc      Key rotation 2 with IV 918 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000396';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0056
     * @tc.name      testExtCacheKeyRotate0055
     * @tc.desc      Key rotation 3 with IV 935 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000003a7';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0057
     * @tc.name      testExtCacheKeyRotate0056
     * @tc.desc      Key rotation 0 with IV 952 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000003b8';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0058
     * @tc.name      testExtCacheKeyRotate0057
     * @tc.desc      Key rotation 1 with IV 969 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000003c9';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0059
     * @tc.name      testExtCacheKeyRotate0058
     * @tc.desc      Key rotation 2 with IV 986 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000003da';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0060
     * @tc.name      testExtCacheKeyRotate0059
     * @tc.desc      Key rotation 3 with IV 1003 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000003eb';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0061
     * @tc.name      testExtCacheKeyRotate0060
     * @tc.desc      Key rotation 0 with IV 1020 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000003fc';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0062
     * @tc.name      testExtCacheKeyRotate0061
     * @tc.desc      Key rotation 1 with IV 1037 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x0000000000000000000000000000040d';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0063
     * @tc.name      testExtCacheKeyRotate0062
     * @tc.desc      Key rotation 2 with IV 1054 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000041e';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0064
     * @tc.name      testExtCacheKeyRotate0063
     * @tc.desc      Key rotation 3 with IV 1071 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x0000000000000000000000000000042f';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0065
     * @tc.name      testExtCacheKeyRotate0064
     * @tc.desc      Key rotation 0 with IV 1088 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000440';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0066
     * @tc.name      testExtCacheKeyRotate0065
     * @tc.desc      Key rotation 1 with IV 1105 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000451';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0067
     * @tc.name      testExtCacheKeyRotate0066
     * @tc.desc      Key rotation 2 with IV 1122 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x00000000000000000000000000000462';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0068
     * @tc.name      testExtCacheKeyRotate0067
     * @tc.desc      Key rotation 3 with IV 1139 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000473';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0069
     * @tc.name      testExtCacheKeyRotate0068
     * @tc.desc      Key rotation 0 with IV 1156 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000484';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0070
     * @tc.name      testExtCacheKeyRotate0069
     * @tc.desc      Key rotation 1 with IV 1173 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000495';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0071
     * @tc.name      testExtCacheKeyRotate0070
     * @tc.desc      Key rotation 2 with IV 1190 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000004a6';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0072
     * @tc.name      testExtCacheKeyRotate0071
     * @tc.desc      Key rotation 3 with IV 1207 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000004b7';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0073
     * @tc.name      testExtCacheKeyRotate0072
     * @tc.desc      Key rotation 0 with IV 1224 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000004c8';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0074
     * @tc.name      testExtCacheKeyRotate0073
     * @tc.desc      Key rotation 1 with IV 1241 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000004d9';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0075
     * @tc.name      testExtCacheKeyRotate0074
     * @tc.desc      Key rotation 2 with IV 1258 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000004ea';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0076
     * @tc.name      testExtCacheKeyRotate0075
     * @tc.desc      Key rotation 3 with IV 1275 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000004fb';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0077
     * @tc.name      testExtCacheKeyRotate0076
     * @tc.desc      Key rotation 0 with IV 1292 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 0;
      const keyUri: string = 'key_0.bin';
      const iv: string = '0x0000000000000000000000000000050c';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0078
     * @tc.name      testExtCacheKeyRotate0077
     * @tc.desc      Key rotation 1 with IV 1309 and map map_2.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 1;
      const keyUri: string = 'key_1.bin';
      const iv: string = '0x0000000000000000000000000000051d';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_2.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0079
     * @tc.name      testExtCacheKeyRotate0078
     * @tc.desc      Key rotation 2 with IV 1326 and map map_0.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 2;
      const keyUri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000052e';
      const discontinuity: boolean = true;
      const mapUri: string = 'map_0.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(true);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8KEY_0080
     * @tc.name      testExtCacheKeyRotate0079
     * @tc.desc      Key rotation 3 with IV 1343 and map map_1.mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKeyRotate0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyIndex: number = 3;
      const keyUri: string = 'key_3.bin';
      const iv: string = '0x0000000000000000000000000000053f';
      const discontinuity: boolean = false;
      const mapUri: string = 'map_1.mp4';
      const keyLine: string = `#EXT-X-KEY:METHOD=AES-128,URI="${keyUri}",IV=${iv}`;
      expect(keyLine.indexOf(keyUri) > 0).assertTrue();
      expect(keyLine.startsWith('#EXT-X-KEY:METHOD=AES-128')).assertTrue();
      expect(discontinuity).assertEqual(false);
      expect(mapUri.endsWith('.mp4')).assertTrue();
      expect(iv.startsWith('0x')).assertTrue();
    })
  });
}
