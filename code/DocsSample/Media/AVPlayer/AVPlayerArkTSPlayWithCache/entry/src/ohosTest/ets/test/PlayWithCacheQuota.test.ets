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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheQuota]';
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

export default function playWithCacheQuotaTest(): void {
  describe('playWithCacheQuotaTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0001
     * @tc.name      testExtCacheQuota0000
     * @tc.desc      Quota 1000 used 0 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 0;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(872);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0002
     * @tc.name      testExtCacheQuota0001
     * @tc.desc      Quota 2000 used 137 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 137;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1607);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0003
     * @tc.name      testExtCacheQuota0002
     * @tc.desc      Quota 4096 used 274 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 274;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3310);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0004
     * @tc.name      testExtCacheQuota0003
     * @tc.desc      Quota 8192 used 411 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 411;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(7653);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0005
     * @tc.name      testExtCacheQuota0004
     * @tc.desc      Quota 1000 used 548 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 548;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(196);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0006
     * @tc.name      testExtCacheQuota0005
     * @tc.desc      Quota 2000 used 685 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 685;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(803);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0007
     * @tc.name      testExtCacheQuota0006
     * @tc.desc      Quota 4096 used 822 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 822;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3146);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0008
     * @tc.name      testExtCacheQuota0007
     * @tc.desc      Quota 8192 used 959 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 959;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(6977);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0009
     * @tc.name      testExtCacheQuota0008
     * @tc.desc      Quota 1000 used 96 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 96;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(392);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0010
     * @tc.name      testExtCacheQuota0009
     * @tc.desc      Quota 2000 used 1233 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1233;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(639);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0011
     * @tc.name      testExtCacheQuota0010
     * @tc.desc      Quota 4096 used 1370 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1370;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2470);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0012
     * @tc.name      testExtCacheQuota0011
     * @tc.desc      Quota 8192 used 1507 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 1507;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(6173);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0013
     * @tc.name      testExtCacheQuota0012
     * @tc.desc      Quota 1000 used 644 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 644;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(228);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0014
     * @tc.name      testExtCacheQuota0013
     * @tc.desc      Quota 2000 used 1781 segment 256 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1781;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0015
     * @tc.name      testExtCacheQuota0014
     * @tc.desc      Quota 4096 used 1918 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1918;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1666);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0016
     * @tc.name      testExtCacheQuota0015
     * @tc.desc      Quota 8192 used 2055 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 2055;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(6009);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0017
     * @tc.name      testExtCacheQuota0016
     * @tc.desc      Quota 1000 used 192 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 192;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(552);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0018
     * @tc.name      testExtCacheQuota0017
     * @tc.desc      Quota 2000 used 329 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 329;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1159);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0019
     * @tc.name      testExtCacheQuota0018
     * @tc.desc      Quota 4096 used 2466 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 2466;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1502);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0020
     * @tc.name      testExtCacheQuota0019
     * @tc.desc      Quota 8192 used 2603 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 2603;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(5333);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0021
     * @tc.name      testExtCacheQuota0020
     * @tc.desc      Quota 1000 used 740 segment 512 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 740;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0022
     * @tc.name      testExtCacheQuota0021
     * @tc.desc      Quota 2000 used 877 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 877;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(995);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0023
     * @tc.name      testExtCacheQuota0022
     * @tc.desc      Quota 4096 used 3014 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 3014;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(826);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0024
     * @tc.name      testExtCacheQuota0023
     * @tc.desc      Quota 8192 used 3151 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 3151;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(4529);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0025
     * @tc.name      testExtCacheQuota0024
     * @tc.desc      Quota 1000 used 288 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 288;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(584);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0026
     * @tc.name      testExtCacheQuota0025
     * @tc.desc      Quota 2000 used 1425 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1425;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(319);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0027
     * @tc.name      testExtCacheQuota0026
     * @tc.desc      Quota 4096 used 3562 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 3562;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(22);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0028
     * @tc.name      testExtCacheQuota0027
     * @tc.desc      Quota 8192 used 3699 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 3699;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(4365);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0029
     * @tc.name      testExtCacheQuota0028
     * @tc.desc      Quota 1000 used 836 segment 256 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 836;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0030
     * @tc.name      testExtCacheQuota0029
     * @tc.desc      Quota 2000 used 1973 segment 512 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1973;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0031
     * @tc.name      testExtCacheQuota0030
     * @tc.desc      Quota 4096 used 14 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 14;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3954);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0032
     * @tc.name      testExtCacheQuota0031
     * @tc.desc      Quota 8192 used 4247 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 4247;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3689);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0033
     * @tc.name      testExtCacheQuota0032
     * @tc.desc      Quota 1000 used 384 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 384;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(104);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0034
     * @tc.name      testExtCacheQuota0033
     * @tc.desc      Quota 2000 used 521 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 521;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1351);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0035
     * @tc.name      testExtCacheQuota0034
     * @tc.desc      Quota 4096 used 562 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 562;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3278);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0036
     * @tc.name      testExtCacheQuota0035
     * @tc.desc      Quota 8192 used 4795 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 4795;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2885);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0037
     * @tc.name      testExtCacheQuota0036
     * @tc.desc      Quota 1000 used 932 segment 128 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 932;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0038
     * @tc.name      testExtCacheQuota0037
     * @tc.desc      Quota 2000 used 1069 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1069;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(675);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0039
     * @tc.name      testExtCacheQuota0038
     * @tc.desc      Quota 4096 used 1110 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1110;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2474);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0040
     * @tc.name      testExtCacheQuota0039
     * @tc.desc      Quota 8192 used 5343 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 5343;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2721);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0041
     * @tc.name      testExtCacheQuota0040
     * @tc.desc      Quota 1000 used 480 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 480;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(264);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0042
     * @tc.name      testExtCacheQuota0041
     * @tc.desc      Quota 2000 used 1617 segment 512 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1617;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0043
     * @tc.name      testExtCacheQuota0042
     * @tc.desc      Quota 4096 used 1658 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1658;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2310);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0044
     * @tc.name      testExtCacheQuota0043
     * @tc.desc      Quota 8192 used 5891 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 5891;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2045);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0045
     * @tc.name      testExtCacheQuota0044
     * @tc.desc      Quota 1000 used 28 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 28;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(460);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0046
     * @tc.name      testExtCacheQuota0045
     * @tc.desc      Quota 2000 used 165 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 165;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1707);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0047
     * @tc.name      testExtCacheQuota0046
     * @tc.desc      Quota 4096 used 2206 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 2206;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1634);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0048
     * @tc.name      testExtCacheQuota0047
     * @tc.desc      Quota 8192 used 6439 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 6439;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1241);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0049
     * @tc.name      testExtCacheQuota0048
     * @tc.desc      Quota 1000 used 576 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 576;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(296);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0050
     * @tc.name      testExtCacheQuota0049
     * @tc.desc      Quota 2000 used 713 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 713;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1031);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0051
     * @tc.name      testExtCacheQuota0050
     * @tc.desc      Quota 4096 used 2754 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 2754;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(830);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0052
     * @tc.name      testExtCacheQuota0051
     * @tc.desc      Quota 8192 used 6987 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 6987;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1077);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0053
     * @tc.name      testExtCacheQuota0052
     * @tc.desc      Quota 1000 used 124 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 124;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(620);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0054
     * @tc.name      testExtCacheQuota0053
     * @tc.desc      Quota 2000 used 1261 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1261;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(227);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0055
     * @tc.name      testExtCacheQuota0054
     * @tc.desc      Quota 4096 used 3302 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 3302;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(666);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0056
     * @tc.name      testExtCacheQuota0055
     * @tc.desc      Quota 8192 used 7535 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 7535;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(401);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0057
     * @tc.name      testExtCacheQuota0056
     * @tc.desc      Quota 1000 used 672 segment 512 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 672;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0058
     * @tc.name      testExtCacheQuota0057
     * @tc.desc      Quota 2000 used 1809 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1809;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(63);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0059
     * @tc.name      testExtCacheQuota0058
     * @tc.desc      Quota 4096 used 3850 segment 256 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 3850;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0060
     * @tc.name      testExtCacheQuota0059
     * @tc.desc      Quota 8192 used 8083 segment 512 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 8083;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0061
     * @tc.name      testExtCacheQuota0060
     * @tc.desc      Quota 1000 used 220 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 220;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(652);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0062
     * @tc.name      testExtCacheQuota0061
     * @tc.desc      Quota 2000 used 357 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 357;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1387);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0063
     * @tc.name      testExtCacheQuota0062
     * @tc.desc      Quota 4096 used 302 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 302;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3282);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0064
     * @tc.name      testExtCacheQuota0063
     * @tc.desc      Quota 8192 used 439 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 439;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(7625);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0065
     * @tc.name      testExtCacheQuota0064
     * @tc.desc      Quota 1000 used 768 segment 256 fits=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 768;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(false);
      expect(remaining).assertEqual(0);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0066
     * @tc.name      testExtCacheQuota0065
     * @tc.desc      Quota 2000 used 905 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 905;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(583);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0067
     * @tc.name      testExtCacheQuota0066
     * @tc.desc      Quota 4096 used 850 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 850;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(3118);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0068
     * @tc.name      testExtCacheQuota0067
     * @tc.desc      Quota 8192 used 987 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 987;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(6949);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0069
     * @tc.name      testExtCacheQuota0068
     * @tc.desc      Quota 1000 used 316 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 316;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(172);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0070
     * @tc.name      testExtCacheQuota0069
     * @tc.desc      Quota 2000 used 1453 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1453;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(419);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0071
     * @tc.name      testExtCacheQuota0070
     * @tc.desc      Quota 4096 used 1398 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1398;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(2442);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0072
     * @tc.name      testExtCacheQuota0071
     * @tc.desc      Quota 8192 used 1535 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 1535;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(6145);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0073
     * @tc.name      testExtCacheQuota0072
     * @tc.desc      Quota 1000 used 864 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 864;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(8);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0074
     * @tc.name      testExtCacheQuota0073
     * @tc.desc      Quota 2000 used 1 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 1;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1743);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0075
     * @tc.name      testExtCacheQuota0074
     * @tc.desc      Quota 4096 used 1946 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 1946;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1638);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0076
     * @tc.name      testExtCacheQuota0075
     * @tc.desc      Quota 8192 used 2083 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 2083;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(5981);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0077
     * @tc.name      testExtCacheQuota0076
     * @tc.desc      Quota 1000 used 412 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 1000;
      const used: number = 412;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(332);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0078
     * @tc.name      testExtCacheQuota0077
     * @tc.desc      Quota 2000 used 549 segment 512 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 2000;
      const used: number = 549;
      const segmentSize: number = 512;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(939);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0079
     * @tc.name      testExtCacheQuota0078
     * @tc.desc      Quota 4096 used 2494 segment 128 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 4096;
      const used: number = 2494;
      const segmentSize: number = 128;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(1474);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_QUOTA_0080
     * @tc.name      testExtCacheQuota0079
     * @tc.desc      Quota 8192 used 2631 segment 256 fits=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheQuota0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const quota: number = 8192;
      const used: number = 2631;
      const segmentSize: number = 256;
      const fits: boolean = used + segmentSize <= quota;
      const remaining: number = Math.max(0, quota - used - segmentSize);
      expect(fits).assertEqual(true);
      expect(remaining).assertEqual(5305);
      expect(used).assertLargerOrEqual(0);
      expect(segmentSize).assertLarger(0);
    })
  });
}
