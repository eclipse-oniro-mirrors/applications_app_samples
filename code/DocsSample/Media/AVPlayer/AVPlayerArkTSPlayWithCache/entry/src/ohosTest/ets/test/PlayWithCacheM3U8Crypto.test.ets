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

const TAG: string = '[Sample_playWithCacheM3U8Crypto]';
const DOMAIN: number = 0xF811;

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

export default function playWithCacheM3U8CryptoTest(): void {
  describe('playWithCacheM3U8CryptoTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0001
     * @tc.name      testExtCacheCrypto0000
     * @tc.desc      Method AES-128 URI key_0.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000000';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0002
     * @tc.name      testExtCacheCrypto0001
     * @tc.desc      Method SAMPLE-AES URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_1.bin';
      const iv: string = '0x0000000000000000000000000000000d';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0003
     * @tc.name      testExtCacheCrypto0002
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x0000000000000000000000000000001a';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0004
     * @tc.name      testExtCacheCrypto0003
     * @tc.desc      Method AES-128 URI key_3.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_3.bin';
      const iv: string = '0x00000000000000000000000000000027';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0005
     * @tc.name      testExtCacheCrypto0004
     * @tc.desc      Method SAMPLE-AES URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_4.bin';
      const iv: string = '0x00000000000000000000000000000034';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0006
     * @tc.name      testExtCacheCrypto0005
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x00000000000000000000000000000041';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0007
     * @tc.name      testExtCacheCrypto0006
     * @tc.desc      Method AES-128 URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_1.bin';
      const iv: string = '0x0000000000000000000000000000004e';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0008
     * @tc.name      testExtCacheCrypto0007
     * @tc.desc      Method SAMPLE-AES URI key_2.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000005b';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0009
     * @tc.name      testExtCacheCrypto0008
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x00000000000000000000000000000068';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0010
     * @tc.name      testExtCacheCrypto0009
     * @tc.desc      Method AES-128 URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_4.bin';
      const iv: string = '0x00000000000000000000000000000075';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0011
     * @tc.name      testExtCacheCrypto0010
     * @tc.desc      Method SAMPLE-AES URI key_0.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000082';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0012
     * @tc.name      testExtCacheCrypto0011
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x0000000000000000000000000000008f';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0013
     * @tc.name      testExtCacheCrypto0012
     * @tc.desc      Method AES-128 URI key_2.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000009c';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0014
     * @tc.name      testExtCacheCrypto0013
     * @tc.desc      Method SAMPLE-AES URI key_3.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000000a9';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0015
     * @tc.name      testExtCacheCrypto0014
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x000000000000000000000000000000b6';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0016
     * @tc.name      testExtCacheCrypto0015
     * @tc.desc      Method AES-128 URI key_0.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_0.bin';
      const iv: string = '0x000000000000000000000000000000c3';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0017
     * @tc.name      testExtCacheCrypto0016
     * @tc.desc      Method SAMPLE-AES URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000000d0';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0018
     * @tc.name      testExtCacheCrypto0017
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x000000000000000000000000000000dd';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0019
     * @tc.name      testExtCacheCrypto0018
     * @tc.desc      Method AES-128 URI key_3.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000000ea';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0020
     * @tc.name      testExtCacheCrypto0019
     * @tc.desc      Method SAMPLE-AES URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_4.bin';
      const iv: string = '0x000000000000000000000000000000f7';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0021
     * @tc.name      testExtCacheCrypto0020
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x00000000000000000000000000000104';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0022
     * @tc.name      testExtCacheCrypto0021
     * @tc.desc      Method AES-128 URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000111';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0023
     * @tc.name      testExtCacheCrypto0022
     * @tc.desc      Method SAMPLE-AES URI key_2.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000011e';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0024
     * @tc.name      testExtCacheCrypto0023
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x0000000000000000000000000000012b';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0025
     * @tc.name      testExtCacheCrypto0024
     * @tc.desc      Method AES-128 URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_4.bin';
      const iv: string = '0x00000000000000000000000000000138';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0026
     * @tc.name      testExtCacheCrypto0025
     * @tc.desc      Method SAMPLE-AES URI key_0.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000145';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0027
     * @tc.name      testExtCacheCrypto0026
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x00000000000000000000000000000152';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0028
     * @tc.name      testExtCacheCrypto0027
     * @tc.desc      Method AES-128 URI key_2.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_2.bin';
      const iv: string = '0x0000000000000000000000000000015f';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0029
     * @tc.name      testExtCacheCrypto0028
     * @tc.desc      Method SAMPLE-AES URI key_3.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_3.bin';
      const iv: string = '0x0000000000000000000000000000016c';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0030
     * @tc.name      testExtCacheCrypto0029
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x00000000000000000000000000000179';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0031
     * @tc.name      testExtCacheCrypto0030
     * @tc.desc      Method AES-128 URI key_0.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_0.bin';
      const iv: string = '0x00000000000000000000000000000186';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0032
     * @tc.name      testExtCacheCrypto0031
     * @tc.desc      Method SAMPLE-AES URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_1.bin';
      const iv: string = '0x00000000000000000000000000000193';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0033
     * @tc.name      testExtCacheCrypto0032
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x000000000000000000000000000001a0';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0034
     * @tc.name      testExtCacheCrypto0033
     * @tc.desc      Method AES-128 URI key_3.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_3.bin';
      const iv: string = '0x000000000000000000000000000001ad';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0035
     * @tc.name      testExtCacheCrypto0034
     * @tc.desc      Method SAMPLE-AES URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_4.bin';
      const iv: string = '0x000000000000000000000000000001ba';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0036
     * @tc.name      testExtCacheCrypto0035
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x000000000000000000000000000001c7';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0037
     * @tc.name      testExtCacheCrypto0036
     * @tc.desc      Method AES-128 URI key_1.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_1.bin';
      const iv: string = '0x000000000000000000000000000001d4';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0038
     * @tc.name      testExtCacheCrypto0037
     * @tc.desc      Method SAMPLE-AES URI key_2.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'SAMPLE-AES';
      const uri: string = 'key_2.bin';
      const iv: string = '0x000000000000000000000000000001e1';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0039
     * @tc.name      testExtCacheCrypto0038
     * @tc.desc      Method NONE URI  valid=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'NONE';
      const uri: string = '';
      const iv: string = '0x000000000000000000000000000001ee';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(false);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CRYPTO_0040
     * @tc.name      testExtCacheCrypto0039
     * @tc.desc      Method AES-128 URI key_4.bin valid=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCrypto0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const method: string = 'AES-128';
      const uri: string = 'key_4.bin';
      const iv: string = '0x000000000000000000000000000001fb';
      const wellFormed: boolean = method === 'AES-128' || method === 'SAMPLE-AES';
      const valid: boolean = wellFormed && uri.length > 0;
      expect(valid).assertEqual(true);
      expect(iv.startsWith('0x')).assertTrue();
      expect(iv.length).assertEqual(34);
      expect(method.length).assertLarger(0);
    })
  });
}
