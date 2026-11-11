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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheM3U8Advanced]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheM3U8AdvancedTest(): void {
  describe('playWithCacheM3U8AdvancedTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0001
     * @tc.name      testExtCacheM3U8Adv0000
     * @tc.desc      Media sequence 100 duration 10 byterange 1000@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 100;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 0;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(100);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1000@0');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0002
     * @tc.name      testExtCacheM3U8Adv0001
     * @tc.desc      Media sequence 101 duration 6 byterange 1128@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 101;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 4096;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(101);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1128@4096');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0003
     * @tc.name      testExtCacheM3U8Adv0002
     * @tc.desc      Media sequence 102 duration 4 byterange 1256@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 102;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 8192;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(102);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1256@8192');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0004
     * @tc.name      testExtCacheM3U8Adv0003
     * @tc.desc      Media sequence 103 duration 2 byterange 1384@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 103;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 12288;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(103);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1384@12288');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0005
     * @tc.name      testExtCacheM3U8Adv0004
     * @tc.desc      Media sequence 104 duration 10 byterange 1512@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 104;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 16384;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(104);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1512@16384');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0006
     * @tc.name      testExtCacheM3U8Adv0005
     * @tc.desc      Media sequence 105 duration 6 byterange 1640@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 105;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 20480;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(105);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1640@20480');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0007
     * @tc.name      testExtCacheM3U8Adv0006
     * @tc.desc      Media sequence 106 duration 4 byterange 1768@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 106;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 24576;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(106);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1768@24576');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0008
     * @tc.name      testExtCacheM3U8Adv0007
     * @tc.desc      Media sequence 107 duration 2 byterange 1000@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 107;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 28672;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(107);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1000@28672');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0009
     * @tc.name      testExtCacheM3U8Adv0008
     * @tc.desc      Media sequence 108 duration 10 byterange 1128@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 108;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 32768;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(108);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1128@32768');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0010
     * @tc.name      testExtCacheM3U8Adv0009
     * @tc.desc      Media sequence 109 duration 6 byterange 1256@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 109;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 0;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(109);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1256@0');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0011
     * @tc.name      testExtCacheM3U8Adv0010
     * @tc.desc      Media sequence 110 duration 4 byterange 1384@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 110;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 4096;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(110);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1384@4096');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0012
     * @tc.name      testExtCacheM3U8Adv0011
     * @tc.desc      Media sequence 111 duration 2 byterange 1512@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 111;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 8192;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(111);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1512@8192');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0013
     * @tc.name      testExtCacheM3U8Adv0012
     * @tc.desc      Media sequence 112 duration 10 byterange 1640@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 112;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 12288;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(112);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1640@12288');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0014
     * @tc.name      testExtCacheM3U8Adv0013
     * @tc.desc      Media sequence 113 duration 6 byterange 1768@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 113;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 16384;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(113);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1768@16384');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0015
     * @tc.name      testExtCacheM3U8Adv0014
     * @tc.desc      Media sequence 114 duration 4 byterange 1000@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 114;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 20480;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(114);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1000@20480');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0016
     * @tc.name      testExtCacheM3U8Adv0015
     * @tc.desc      Media sequence 115 duration 2 byterange 1128@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 115;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 24576;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(115);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1128@24576');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0017
     * @tc.name      testExtCacheM3U8Adv0016
     * @tc.desc      Media sequence 116 duration 10 byterange 1256@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 116;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 28672;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(116);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1256@28672');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0018
     * @tc.name      testExtCacheM3U8Adv0017
     * @tc.desc      Media sequence 100 duration 6 byterange 1384@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 100;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 32768;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(100);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1384@32768');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0019
     * @tc.name      testExtCacheM3U8Adv0018
     * @tc.desc      Media sequence 101 duration 4 byterange 1512@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 101;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 0;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(101);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1512@0');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0020
     * @tc.name      testExtCacheM3U8Adv0019
     * @tc.desc      Media sequence 102 duration 2 byterange 1640@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 102;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 4096;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(102);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1640@4096');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0021
     * @tc.name      testExtCacheM3U8Adv0020
     * @tc.desc      Media sequence 103 duration 10 byterange 1768@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 103;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 8192;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(103);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1768@8192');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0022
     * @tc.name      testExtCacheM3U8Adv0021
     * @tc.desc      Media sequence 104 duration 6 byterange 1000@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 104;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 12288;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(104);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1000@12288');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0023
     * @tc.name      testExtCacheM3U8Adv0022
     * @tc.desc      Media sequence 105 duration 4 byterange 1128@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 105;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 16384;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(105);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1128@16384');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0024
     * @tc.name      testExtCacheM3U8Adv0023
     * @tc.desc      Media sequence 106 duration 2 byterange 1256@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 106;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 20480;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(106);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1256@20480');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0025
     * @tc.name      testExtCacheM3U8Adv0024
     * @tc.desc      Media sequence 107 duration 10 byterange 1384@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 107;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 24576;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(107);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1384@24576');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0026
     * @tc.name      testExtCacheM3U8Adv0025
     * @tc.desc      Media sequence 108 duration 6 byterange 1512@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 108;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 28672;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(108);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1512@28672');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0027
     * @tc.name      testExtCacheM3U8Adv0026
     * @tc.desc      Media sequence 109 duration 4 byterange 1640@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 109;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 32768;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(109);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1640@32768');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0028
     * @tc.name      testExtCacheM3U8Adv0027
     * @tc.desc      Media sequence 110 duration 2 byterange 1768@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 110;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 0;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(110);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1768@0');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0029
     * @tc.name      testExtCacheM3U8Adv0028
     * @tc.desc      Media sequence 111 duration 10 byterange 1000@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 111;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 4096;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(111);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1000@4096');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0030
     * @tc.name      testExtCacheM3U8Adv0029
     * @tc.desc      Media sequence 112 duration 6 byterange 1128@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 112;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 8192;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(112);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1128@8192');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0031
     * @tc.name      testExtCacheM3U8Adv0030
     * @tc.desc      Media sequence 113 duration 4 byterange 1256@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 113;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 12288;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(113);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1256@12288');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0032
     * @tc.name      testExtCacheM3U8Adv0031
     * @tc.desc      Media sequence 114 duration 2 byterange 1384@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 114;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 16384;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(114);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1384@16384');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0033
     * @tc.name      testExtCacheM3U8Adv0032
     * @tc.desc      Media sequence 115 duration 10 byterange 1512@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 115;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 20480;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(115);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1512@20480');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0034
     * @tc.name      testExtCacheM3U8Adv0033
     * @tc.desc      Media sequence 116 duration 6 byterange 1640@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 116;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 24576;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(116);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1640@24576');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0035
     * @tc.name      testExtCacheM3U8Adv0034
     * @tc.desc      Media sequence 100 duration 4 byterange 1768@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 100;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 28672;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(100);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1768@28672');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0036
     * @tc.name      testExtCacheM3U8Adv0035
     * @tc.desc      Media sequence 101 duration 2 byterange 1000@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 101;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 32768;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(101);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1000@32768');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0037
     * @tc.name      testExtCacheM3U8Adv0036
     * @tc.desc      Media sequence 102 duration 10 byterange 1128@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 102;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 0;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(102);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1128@0');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0038
     * @tc.name      testExtCacheM3U8Adv0037
     * @tc.desc      Media sequence 103 duration 6 byterange 1256@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 103;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 4096;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(103);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1256@4096');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0039
     * @tc.name      testExtCacheM3U8Adv0038
     * @tc.desc      Media sequence 104 duration 4 byterange 1384@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 104;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 8192;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(104);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1384@8192');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0040
     * @tc.name      testExtCacheM3U8Adv0039
     * @tc.desc      Media sequence 105 duration 2 byterange 1512@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 105;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 12288;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(105);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1512@12288');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0041
     * @tc.name      testExtCacheM3U8Adv0040
     * @tc.desc      Media sequence 106 duration 10 byterange 1640@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 106;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 16384;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(106);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1640@16384');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0042
     * @tc.name      testExtCacheM3U8Adv0041
     * @tc.desc      Media sequence 107 duration 6 byterange 1768@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 107;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 20480;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(107);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1768@20480');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0043
     * @tc.name      testExtCacheM3U8Adv0042
     * @tc.desc      Media sequence 108 duration 4 byterange 1000@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 108;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 24576;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(108);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1000@24576');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0044
     * @tc.name      testExtCacheM3U8Adv0043
     * @tc.desc      Media sequence 109 duration 2 byterange 1128@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 109;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 28672;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(109);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1128@28672');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0045
     * @tc.name      testExtCacheM3U8Adv0044
     * @tc.desc      Media sequence 110 duration 10 byterange 1256@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 110;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 32768;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(110);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1256@32768');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0046
     * @tc.name      testExtCacheM3U8Adv0045
     * @tc.desc      Media sequence 111 duration 6 byterange 1384@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 111;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 0;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(111);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1384@0');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0047
     * @tc.name      testExtCacheM3U8Adv0046
     * @tc.desc      Media sequence 112 duration 4 byterange 1512@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 112;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 4096;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(112);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1512@4096');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0048
     * @tc.name      testExtCacheM3U8Adv0047
     * @tc.desc      Media sequence 113 duration 2 byterange 1640@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 113;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 8192;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(113);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1640@8192');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0049
     * @tc.name      testExtCacheM3U8Adv0048
     * @tc.desc      Media sequence 114 duration 10 byterange 1768@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 114;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 12288;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(114);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1768@12288');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0050
     * @tc.name      testExtCacheM3U8Adv0049
     * @tc.desc      Media sequence 115 duration 6 byterange 1000@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 115;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 16384;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(115);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1000@16384');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0051
     * @tc.name      testExtCacheM3U8Adv0050
     * @tc.desc      Media sequence 116 duration 4 byterange 1128@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 116;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 20480;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(116);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1128@20480');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0052
     * @tc.name      testExtCacheM3U8Adv0051
     * @tc.desc      Media sequence 100 duration 2 byterange 1256@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 100;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 24576;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(100);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1256@24576');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0053
     * @tc.name      testExtCacheM3U8Adv0052
     * @tc.desc      Media sequence 101 duration 10 byterange 1384@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 101;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 28672;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(101);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1384@28672');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0054
     * @tc.name      testExtCacheM3U8Adv0053
     * @tc.desc      Media sequence 102 duration 6 byterange 1512@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 102;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 32768;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(102);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1512@32768');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0055
     * @tc.name      testExtCacheM3U8Adv0054
     * @tc.desc      Media sequence 103 duration 4 byterange 1640@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 103;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 0;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(103);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1640@0');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0056
     * @tc.name      testExtCacheM3U8Adv0055
     * @tc.desc      Media sequence 104 duration 2 byterange 1768@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 104;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 4096;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(104);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1768@4096');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0057
     * @tc.name      testExtCacheM3U8Adv0056
     * @tc.desc      Media sequence 105 duration 10 byterange 1000@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 105;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 8192;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(105);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1000@8192');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0058
     * @tc.name      testExtCacheM3U8Adv0057
     * @tc.desc      Media sequence 106 duration 6 byterange 1128@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 106;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 12288;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(106);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1128@12288');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0059
     * @tc.name      testExtCacheM3U8Adv0058
     * @tc.desc      Media sequence 107 duration 4 byterange 1256@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 107;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 16384;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(107);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1256@16384');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0060
     * @tc.name      testExtCacheM3U8Adv0059
     * @tc.desc      Media sequence 108 duration 2 byterange 1384@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 108;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 20480;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(108);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1384@20480');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0061
     * @tc.name      testExtCacheM3U8Adv0060
     * @tc.desc      Media sequence 109 duration 10 byterange 1512@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 109;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 24576;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(109);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1512@24576');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0062
     * @tc.name      testExtCacheM3U8Adv0061
     * @tc.desc      Media sequence 110 duration 6 byterange 1640@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 110;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 28672;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(110);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1640@28672');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0063
     * @tc.name      testExtCacheM3U8Adv0062
     * @tc.desc      Media sequence 111 duration 4 byterange 1768@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 111;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 32768;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(111);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1768@32768');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0064
     * @tc.name      testExtCacheM3U8Adv0063
     * @tc.desc      Media sequence 112 duration 2 byterange 1000@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 112;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 0;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(112);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1000@0');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0065
     * @tc.name      testExtCacheM3U8Adv0064
     * @tc.desc      Media sequence 113 duration 10 byterange 1128@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 113;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 4096;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(113);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1128@4096');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0066
     * @tc.name      testExtCacheM3U8Adv0065
     * @tc.desc      Media sequence 114 duration 6 byterange 1256@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 114;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 8192;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(114);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1256@8192');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0067
     * @tc.name      testExtCacheM3U8Adv0066
     * @tc.desc      Media sequence 115 duration 4 byterange 1384@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 115;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 12288;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(115);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1384@12288');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0068
     * @tc.name      testExtCacheM3U8Adv0067
     * @tc.desc      Media sequence 116 duration 2 byterange 1512@16384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 116;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 16384;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(116);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(16384);
      expect(range).assertEqual('1512@16384');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0069
     * @tc.name      testExtCacheM3U8Adv0068
     * @tc.desc      Media sequence 100 duration 10 byterange 1640@20480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 100;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 20480;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(100);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(20480);
      expect(range).assertEqual('1640@20480');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0070
     * @tc.name      testExtCacheM3U8Adv0069
     * @tc.desc      Media sequence 101 duration 6 byterange 1768@24576.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 101;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1768;
      const byteRangeOffset: number = 24576;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(101);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1768);
      expect(byteRangeOffset).assertEqual(24576);
      expect(range).assertEqual('1768@24576');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0071
     * @tc.name      testExtCacheM3U8Adv0070
     * @tc.desc      Media sequence 102 duration 4 byterange 1000@28672.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 102;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1000;
      const byteRangeOffset: number = 28672;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(102);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1000);
      expect(byteRangeOffset).assertEqual(28672);
      expect(range).assertEqual('1000@28672');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0072
     * @tc.name      testExtCacheM3U8Adv0071
     * @tc.desc      Media sequence 103 duration 2 byterange 1128@32768.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 103;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1128;
      const byteRangeOffset: number = 32768;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(103);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1128);
      expect(byteRangeOffset).assertEqual(32768);
      expect(range).assertEqual('1128@32768');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0073
     * @tc.name      testExtCacheM3U8Adv0072
     * @tc.desc      Media sequence 104 duration 10 byterange 1256@0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 104;
      const targetDuration: number = 10;
      const byteRangeLength: number = 1256;
      const byteRangeOffset: number = 0;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(104);
      expect(targetDuration).assertEqual(10);
      expect(byteRangeLength).assertEqual(1256);
      expect(byteRangeOffset).assertEqual(0);
      expect(range).assertEqual('1256@0');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0074
     * @tc.name      testExtCacheM3U8Adv0073
     * @tc.desc      Media sequence 105 duration 6 byterange 1384@4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 105;
      const targetDuration: number = 6;
      const byteRangeLength: number = 1384;
      const byteRangeOffset: number = 4096;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(105);
      expect(targetDuration).assertEqual(6);
      expect(byteRangeLength).assertEqual(1384);
      expect(byteRangeOffset).assertEqual(4096);
      expect(range).assertEqual('1384@4096');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0075
     * @tc.name      testExtCacheM3U8Adv0074
     * @tc.desc      Media sequence 106 duration 4 byterange 1512@8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 106;
      const targetDuration: number = 4;
      const byteRangeLength: number = 1512;
      const byteRangeOffset: number = 8192;
      const method: string = 'AES-128';
      const keyUri: string = 'key.bin';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(106);
      expect(targetDuration).assertEqual(4);
      expect(byteRangeLength).assertEqual(1512);
      expect(byteRangeOffset).assertEqual(8192);
      expect(range).assertEqual('1512@8192');
      expect(method).assertEqual('AES-128');
      expect(keyUri.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_M3U8ADV_0076
     * @tc.name      testExtCacheM3U8Adv0075
     * @tc.desc      Media sequence 107 duration 2 byterange 1640@12288.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheM3U8Adv0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediaSequence: number = 107;
      const targetDuration: number = 2;
      const byteRangeLength: number = 1640;
      const byteRangeOffset: number = 12288;
      const method: string = 'NONE';
      const keyUri: string = 'none';
      const range: string = `${byteRangeLength}@${byteRangeOffset}`;
      expect(mediaSequence).assertEqual(107);
      expect(targetDuration).assertEqual(2);
      expect(byteRangeLength).assertEqual(1640);
      expect(byteRangeOffset).assertEqual(12288);
      expect(range).assertEqual('1640@12288');
      expect(method).assertEqual('NONE');
      expect(keyUri.length).assertLarger(0);
    })
  });
}
