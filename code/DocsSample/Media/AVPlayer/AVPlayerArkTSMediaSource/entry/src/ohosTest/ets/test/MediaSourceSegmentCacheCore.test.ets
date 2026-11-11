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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_mediaSourceSegmentCacheCore]';
const DOMAIN: number = 0xF812;

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

export default function mediaSourceSegmentCacheCoreTest(): void {
  describe('mediaSourceSegmentCacheCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0001
     * @tc.name      testExtSegmentCache0000
     * @tc.desc      Cache key 0:0 maps to offset 0 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 0;
      const offset: number = 0;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('0:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_0_0.data');
      expect(rangeEnd).assertEqual(511);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0002
     * @tc.name      testExtSegmentCache0001
     * @tc.desc      Cache key 0:1024 maps to offset 1024 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 0;
      const offset: number = 1024;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('0:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_0_1024.data');
      expect(rangeEnd).assertEqual(2047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0003
     * @tc.name      testExtSegmentCache0002
     * @tc.desc      Cache key 0:4096 maps to offset 4096 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 0;
      const offset: number = 4096;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('0:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_0_4096.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0004
     * @tc.name      testExtSegmentCache0003
     * @tc.desc      Cache key 1:65536 maps to offset 65536 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 1;
      const offset: number = 65536;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('1:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_1_65536.data');
      expect(rangeEnd).assertEqual(73727);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0005
     * @tc.name      testExtSegmentCache0004
     * @tc.desc      Cache key 1:1048576 maps to offset 1048576 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 1;
      const offset: number = 1048576;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('1:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_1_1048576.data');
      expect(rangeEnd).assertEqual(1049087);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0006
     * @tc.name      testExtSegmentCache0005
     * @tc.desc      Cache key 1:0 maps to offset 0 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 1;
      const offset: number = 0;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('1:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_1_0.data');
      expect(rangeEnd).assertEqual(1023);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0007
     * @tc.name      testExtSegmentCache0006
     * @tc.desc      Cache key 2:1024 maps to offset 1024 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 2;
      const offset: number = 1024;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('2:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_2_1024.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0008
     * @tc.name      testExtSegmentCache0007
     * @tc.desc      Cache key 2:4096 maps to offset 4096 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 2;
      const offset: number = 4096;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('2:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_2_4096.data');
      expect(rangeEnd).assertEqual(12287);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0009
     * @tc.name      testExtSegmentCache0008
     * @tc.desc      Cache key 2:65536 maps to offset 65536 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 2;
      const offset: number = 65536;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('2:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_2_65536.data');
      expect(rangeEnd).assertEqual(66047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0010
     * @tc.name      testExtSegmentCache0009
     * @tc.desc      Cache key 3:1048576 maps to offset 1048576 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 3;
      const offset: number = 1048576;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('3:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_3_1048576.data');
      expect(rangeEnd).assertEqual(1049599);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0011
     * @tc.name      testExtSegmentCache0010
     * @tc.desc      Cache key 3:0 maps to offset 0 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 3;
      const offset: number = 0;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('3:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_3_0.data');
      expect(rangeEnd).assertEqual(4095);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0012
     * @tc.name      testExtSegmentCache0011
     * @tc.desc      Cache key 3:1024 maps to offset 1024 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 3;
      const offset: number = 1024;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('3:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_3_1024.data');
      expect(rangeEnd).assertEqual(9215);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0013
     * @tc.name      testExtSegmentCache0012
     * @tc.desc      Cache key 4:4096 maps to offset 4096 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 4;
      const offset: number = 4096;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('4:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_4_4096.data');
      expect(rangeEnd).assertEqual(4607);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0014
     * @tc.name      testExtSegmentCache0013
     * @tc.desc      Cache key 4:65536 maps to offset 65536 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 4;
      const offset: number = 65536;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('4:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_4_65536.data');
      expect(rangeEnd).assertEqual(66559);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0015
     * @tc.name      testExtSegmentCache0014
     * @tc.desc      Cache key 4:1048576 maps to offset 1048576 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 4;
      const offset: number = 1048576;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('4:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_4_1048576.data');
      expect(rangeEnd).assertEqual(1052671);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0016
     * @tc.name      testExtSegmentCache0015
     * @tc.desc      Cache key 5:0 maps to offset 0 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 5;
      const offset: number = 0;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('5:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_5_0.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0017
     * @tc.name      testExtSegmentCache0016
     * @tc.desc      Cache key 5:1024 maps to offset 1024 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 5;
      const offset: number = 1024;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('5:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_5_1024.data');
      expect(rangeEnd).assertEqual(1535);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0018
     * @tc.name      testExtSegmentCache0017
     * @tc.desc      Cache key 5:4096 maps to offset 4096 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 5;
      const offset: number = 4096;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('5:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_5_4096.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0019
     * @tc.name      testExtSegmentCache0018
     * @tc.desc      Cache key 6:65536 maps to offset 65536 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 6;
      const offset: number = 65536;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('6:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_6_65536.data');
      expect(rangeEnd).assertEqual(69631);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0020
     * @tc.name      testExtSegmentCache0019
     * @tc.desc      Cache key 6:1048576 maps to offset 1048576 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 6;
      const offset: number = 1048576;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('6:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_6_1048576.data');
      expect(rangeEnd).assertEqual(1056767);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0021
     * @tc.name      testExtSegmentCache0020
     * @tc.desc      Cache key 6:0 maps to offset 0 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 6;
      const offset: number = 0;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('6:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_6_0.data');
      expect(rangeEnd).assertEqual(511);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0022
     * @tc.name      testExtSegmentCache0021
     * @tc.desc      Cache key 7:1024 maps to offset 1024 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 7;
      const offset: number = 1024;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('7:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_7_1024.data');
      expect(rangeEnd).assertEqual(2047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0023
     * @tc.name      testExtSegmentCache0022
     * @tc.desc      Cache key 7:4096 maps to offset 4096 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 7;
      const offset: number = 4096;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('7:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_7_4096.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0024
     * @tc.name      testExtSegmentCache0023
     * @tc.desc      Cache key 7:65536 maps to offset 65536 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 7;
      const offset: number = 65536;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('7:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_7_65536.data');
      expect(rangeEnd).assertEqual(73727);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0025
     * @tc.name      testExtSegmentCache0024
     * @tc.desc      Cache key 8:1048576 maps to offset 1048576 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 8;
      const offset: number = 1048576;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('8:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_8_1048576.data');
      expect(rangeEnd).assertEqual(1049087);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0026
     * @tc.name      testExtSegmentCache0025
     * @tc.desc      Cache key 8:0 maps to offset 0 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 8;
      const offset: number = 0;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('8:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_8_0.data');
      expect(rangeEnd).assertEqual(1023);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0027
     * @tc.name      testExtSegmentCache0026
     * @tc.desc      Cache key 8:1024 maps to offset 1024 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 8;
      const offset: number = 1024;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('8:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_8_1024.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0028
     * @tc.name      testExtSegmentCache0027
     * @tc.desc      Cache key 9:4096 maps to offset 4096 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 9;
      const offset: number = 4096;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('9:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_9_4096.data');
      expect(rangeEnd).assertEqual(12287);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0029
     * @tc.name      testExtSegmentCache0028
     * @tc.desc      Cache key 9:65536 maps to offset 65536 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 9;
      const offset: number = 65536;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('9:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_9_65536.data');
      expect(rangeEnd).assertEqual(66047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0030
     * @tc.name      testExtSegmentCache0029
     * @tc.desc      Cache key 9:1048576 maps to offset 1048576 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 9;
      const offset: number = 1048576;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('9:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_9_1048576.data');
      expect(rangeEnd).assertEqual(1049599);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0031
     * @tc.name      testExtSegmentCache0030
     * @tc.desc      Cache key 10:0 maps to offset 0 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 10;
      const offset: number = 0;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('10:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_10_0.data');
      expect(rangeEnd).assertEqual(4095);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0032
     * @tc.name      testExtSegmentCache0031
     * @tc.desc      Cache key 10:1024 maps to offset 1024 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 10;
      const offset: number = 1024;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('10:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_10_1024.data');
      expect(rangeEnd).assertEqual(9215);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0033
     * @tc.name      testExtSegmentCache0032
     * @tc.desc      Cache key 10:4096 maps to offset 4096 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 10;
      const offset: number = 4096;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('10:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_10_4096.data');
      expect(rangeEnd).assertEqual(4607);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0034
     * @tc.name      testExtSegmentCache0033
     * @tc.desc      Cache key 11:65536 maps to offset 65536 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 11;
      const offset: number = 65536;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('11:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_11_65536.data');
      expect(rangeEnd).assertEqual(66559);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0035
     * @tc.name      testExtSegmentCache0034
     * @tc.desc      Cache key 11:1048576 maps to offset 1048576 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 11;
      const offset: number = 1048576;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('11:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_11_1048576.data');
      expect(rangeEnd).assertEqual(1052671);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0036
     * @tc.name      testExtSegmentCache0035
     * @tc.desc      Cache key 11:0 maps to offset 0 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 11;
      const offset: number = 0;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('11:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_11_0.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0037
     * @tc.name      testExtSegmentCache0036
     * @tc.desc      Cache key 12:1024 maps to offset 1024 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 12;
      const offset: number = 1024;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('12:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_12_1024.data');
      expect(rangeEnd).assertEqual(1535);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0038
     * @tc.name      testExtSegmentCache0037
     * @tc.desc      Cache key 12:4096 maps to offset 4096 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 12;
      const offset: number = 4096;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('12:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_12_4096.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0039
     * @tc.name      testExtSegmentCache0038
     * @tc.desc      Cache key 12:65536 maps to offset 65536 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 12;
      const offset: number = 65536;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('12:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_12_65536.data');
      expect(rangeEnd).assertEqual(69631);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0040
     * @tc.name      testExtSegmentCache0039
     * @tc.desc      Cache key 13:1048576 maps to offset 1048576 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 13;
      const offset: number = 1048576;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('13:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_13_1048576.data');
      expect(rangeEnd).assertEqual(1056767);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0041
     * @tc.name      testExtSegmentCache0040
     * @tc.desc      Cache key 13:0 maps to offset 0 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 13;
      const offset: number = 0;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('13:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_13_0.data');
      expect(rangeEnd).assertEqual(511);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0042
     * @tc.name      testExtSegmentCache0041
     * @tc.desc      Cache key 13:1024 maps to offset 1024 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 13;
      const offset: number = 1024;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('13:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_13_1024.data');
      expect(rangeEnd).assertEqual(2047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0043
     * @tc.name      testExtSegmentCache0042
     * @tc.desc      Cache key 14:4096 maps to offset 4096 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 14;
      const offset: number = 4096;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('14:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_14_4096.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0044
     * @tc.name      testExtSegmentCache0043
     * @tc.desc      Cache key 14:65536 maps to offset 65536 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 14;
      const offset: number = 65536;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('14:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_14_65536.data');
      expect(rangeEnd).assertEqual(73727);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0045
     * @tc.name      testExtSegmentCache0044
     * @tc.desc      Cache key 14:1048576 maps to offset 1048576 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 14;
      const offset: number = 1048576;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('14:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_14_1048576.data');
      expect(rangeEnd).assertEqual(1049087);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0046
     * @tc.name      testExtSegmentCache0045
     * @tc.desc      Cache key 15:0 maps to offset 0 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 15;
      const offset: number = 0;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('15:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_15_0.data');
      expect(rangeEnd).assertEqual(1023);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0047
     * @tc.name      testExtSegmentCache0046
     * @tc.desc      Cache key 15:1024 maps to offset 1024 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 15;
      const offset: number = 1024;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('15:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_15_1024.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0048
     * @tc.name      testExtSegmentCache0047
     * @tc.desc      Cache key 15:4096 maps to offset 4096 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 15;
      const offset: number = 4096;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('15:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_15_4096.data');
      expect(rangeEnd).assertEqual(12287);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0049
     * @tc.name      testExtSegmentCache0048
     * @tc.desc      Cache key 16:65536 maps to offset 65536 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 16;
      const offset: number = 65536;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('16:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_16_65536.data');
      expect(rangeEnd).assertEqual(66047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0050
     * @tc.name      testExtSegmentCache0049
     * @tc.desc      Cache key 16:1048576 maps to offset 1048576 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 16;
      const offset: number = 1048576;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('16:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_16_1048576.data');
      expect(rangeEnd).assertEqual(1049599);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0051
     * @tc.name      testExtSegmentCache0050
     * @tc.desc      Cache key 16:0 maps to offset 0 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 16;
      const offset: number = 0;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('16:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_16_0.data');
      expect(rangeEnd).assertEqual(4095);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0052
     * @tc.name      testExtSegmentCache0051
     * @tc.desc      Cache key 17:1024 maps to offset 1024 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 17;
      const offset: number = 1024;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('17:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_17_1024.data');
      expect(rangeEnd).assertEqual(9215);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0053
     * @tc.name      testExtSegmentCache0052
     * @tc.desc      Cache key 17:4096 maps to offset 4096 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 17;
      const offset: number = 4096;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('17:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_17_4096.data');
      expect(rangeEnd).assertEqual(4607);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0054
     * @tc.name      testExtSegmentCache0053
     * @tc.desc      Cache key 17:65536 maps to offset 65536 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 17;
      const offset: number = 65536;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('17:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_17_65536.data');
      expect(rangeEnd).assertEqual(66559);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0055
     * @tc.name      testExtSegmentCache0054
     * @tc.desc      Cache key 18:1048576 maps to offset 1048576 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 18;
      const offset: number = 1048576;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('18:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_18_1048576.data');
      expect(rangeEnd).assertEqual(1052671);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0056
     * @tc.name      testExtSegmentCache0055
     * @tc.desc      Cache key 18:0 maps to offset 0 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 18;
      const offset: number = 0;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('18:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_18_0.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0057
     * @tc.name      testExtSegmentCache0056
     * @tc.desc      Cache key 18:1024 maps to offset 1024 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 18;
      const offset: number = 1024;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('18:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_18_1024.data');
      expect(rangeEnd).assertEqual(1535);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0058
     * @tc.name      testExtSegmentCache0057
     * @tc.desc      Cache key 19:4096 maps to offset 4096 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 19;
      const offset: number = 4096;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('19:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_19_4096.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0059
     * @tc.name      testExtSegmentCache0058
     * @tc.desc      Cache key 19:65536 maps to offset 65536 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 19;
      const offset: number = 65536;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('19:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_19_65536.data');
      expect(rangeEnd).assertEqual(69631);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0060
     * @tc.name      testExtSegmentCache0059
     * @tc.desc      Cache key 19:1048576 maps to offset 1048576 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 19;
      const offset: number = 1048576;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('19:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_19_1048576.data');
      expect(rangeEnd).assertEqual(1056767);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0061
     * @tc.name      testExtSegmentCache0060
     * @tc.desc      Cache key 20:0 maps to offset 0 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 20;
      const offset: number = 0;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('20:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_20_0.data');
      expect(rangeEnd).assertEqual(511);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0062
     * @tc.name      testExtSegmentCache0061
     * @tc.desc      Cache key 20:1024 maps to offset 1024 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 20;
      const offset: number = 1024;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('20:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_20_1024.data');
      expect(rangeEnd).assertEqual(2047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0063
     * @tc.name      testExtSegmentCache0062
     * @tc.desc      Cache key 20:4096 maps to offset 4096 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 20;
      const offset: number = 4096;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('20:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_20_4096.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0064
     * @tc.name      testExtSegmentCache0063
     * @tc.desc      Cache key 21:65536 maps to offset 65536 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 21;
      const offset: number = 65536;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('21:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_21_65536.data');
      expect(rangeEnd).assertEqual(73727);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0065
     * @tc.name      testExtSegmentCache0064
     * @tc.desc      Cache key 21:1048576 maps to offset 1048576 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 21;
      const offset: number = 1048576;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('21:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_21_1048576.data');
      expect(rangeEnd).assertEqual(1049087);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0066
     * @tc.name      testExtSegmentCache0065
     * @tc.desc      Cache key 21:0 maps to offset 0 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 21;
      const offset: number = 0;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('21:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_21_0.data');
      expect(rangeEnd).assertEqual(1023);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0067
     * @tc.name      testExtSegmentCache0066
     * @tc.desc      Cache key 22:1024 maps to offset 1024 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 22;
      const offset: number = 1024;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('22:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_22_1024.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0068
     * @tc.name      testExtSegmentCache0067
     * @tc.desc      Cache key 22:4096 maps to offset 4096 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 22;
      const offset: number = 4096;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('22:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_22_4096.data');
      expect(rangeEnd).assertEqual(12287);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0069
     * @tc.name      testExtSegmentCache0068
     * @tc.desc      Cache key 22:65536 maps to offset 65536 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 22;
      const offset: number = 65536;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('22:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_22_65536.data');
      expect(rangeEnd).assertEqual(66047);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0070
     * @tc.name      testExtSegmentCache0069
     * @tc.desc      Cache key 23:1048576 maps to offset 1048576 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 23;
      const offset: number = 1048576;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('23:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_23_1048576.data');
      expect(rangeEnd).assertEqual(1049599);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0071
     * @tc.name      testExtSegmentCache0070
     * @tc.desc      Cache key 23:0 maps to offset 0 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 23;
      const offset: number = 0;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('23:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_23_0.data');
      expect(rangeEnd).assertEqual(4095);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0072
     * @tc.name      testExtSegmentCache0071
     * @tc.desc      Cache key 23:1024 maps to offset 1024 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 23;
      const offset: number = 1024;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('23:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_23_1024.data');
      expect(rangeEnd).assertEqual(9215);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0073
     * @tc.name      testExtSegmentCache0072
     * @tc.desc      Cache key 24:4096 maps to offset 4096 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 24;
      const offset: number = 4096;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('24:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_24_4096.data');
      expect(rangeEnd).assertEqual(4607);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0074
     * @tc.name      testExtSegmentCache0073
     * @tc.desc      Cache key 24:65536 maps to offset 65536 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 24;
      const offset: number = 65536;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('24:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_24_65536.data');
      expect(rangeEnd).assertEqual(66559);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0075
     * @tc.name      testExtSegmentCache0074
     * @tc.desc      Cache key 24:1048576 maps to offset 1048576 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 24;
      const offset: number = 1048576;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('24:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_24_1048576.data');
      expect(rangeEnd).assertEqual(1052671);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0076
     * @tc.name      testExtSegmentCache0075
     * @tc.desc      Cache key 25:0 maps to offset 0 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 25;
      const offset: number = 0;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('25:0');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_25_0.data');
      expect(rangeEnd).assertEqual(8191);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0077
     * @tc.name      testExtSegmentCache0076
     * @tc.desc      Cache key 25:1024 maps to offset 1024 length 512.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 25;
      const offset: number = 1024;
      const length: number = 512;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('25:1024');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_25_1024.data');
      expect(rangeEnd).assertEqual(1535);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0078
     * @tc.name      testExtSegmentCache0077
     * @tc.desc      Cache key 25:4096 maps to offset 4096 length 1024.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 25;
      const offset: number = 4096;
      const length: number = 1024;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('25:4096');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_25_4096.data');
      expect(rangeEnd).assertEqual(5119);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0079
     * @tc.name      testExtSegmentCache0078
     * @tc.desc      Cache key 26:65536 maps to offset 65536 length 4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 26;
      const offset: number = 65536;
      const length: number = 4096;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('26:65536');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_26_65536.data');
      expect(rangeEnd).assertEqual(69631);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEGCACHE_0080
     * @tc.name      testExtSegmentCache0079
     * @tc.desc      Cache key 26:1048576 maps to offset 1048576 length 8192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSegmentCache0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 26;
      const offset: number = 1048576;
      const length: number = 8192;
      const cacheKey: string = `${uuid}:${offset}`;
      const cachePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      const rangeEnd: number = offset + length - 1;
      expect(cacheKey).assertEqual('26:1048576');
      expect(cachePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_26_1048576.data');
      expect(rangeEnd).assertEqual(1056767);
      expect(cachePath.endsWith('.data')).assertTrue();
      expect(rangeEnd).assertLargerOrEqual(offset);
    })
  });
}
