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

const TAG: string = '[Sample_playWithCacheRangeMerge]';
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

export default function playWithCacheRangeMergeTest(): void {
  describe('playWithCacheRangeMergeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0001
     * @tc.name      testExtCacheRangeMerge0000
     * @tc.desc      Ranges 0-99 and 100-179 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 0;
      const end1: number = 99;
      const start2: number = 100;
      const end2: number = 179;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(0);
      expect(mergedEnd).assertEqual(179);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0002
     * @tc.name      testExtCacheRangeMerge0001
     * @tc.desc      Ranges 17-166 and 168-287 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 17;
      const end1: number = 166;
      const start2: number = 168;
      const end2: number = 287;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(168);
      expect(mergedEnd).assertEqual(287);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0003
     * @tc.name      testExtCacheRangeMerge0002
     * @tc.desc      Ranges 34-233 and 333-492 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 34;
      const end1: number = 233;
      const start2: number = 333;
      const end2: number = 492;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(333);
      expect(mergedEnd).assertEqual(492);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0004
     * @tc.name      testExtCacheRangeMerge0003
     * @tc.desc      Ranges 51-300 and 250-449 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 51;
      const end1: number = 300;
      const start2: number = 250;
      const end2: number = 449;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(51);
      expect(mergedEnd).assertEqual(449);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0005
     * @tc.name      testExtCacheRangeMerge0004
     * @tc.desc      Ranges 68-367 and 366-445 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 68;
      const end1: number = 367;
      const start2: number = 366;
      const end2: number = 445;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(68);
      expect(mergedEnd).assertEqual(445);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0006
     * @tc.name      testExtCacheRangeMerge0005
     * @tc.desc      Ranges 85-184 and 185-304 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 85;
      const end1: number = 184;
      const start2: number = 185;
      const end2: number = 304;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(85);
      expect(mergedEnd).assertEqual(304);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0007
     * @tc.name      testExtCacheRangeMerge0006
     * @tc.desc      Ranges 102-251 and 253-412 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 102;
      const end1: number = 251;
      const start2: number = 253;
      const end2: number = 412;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(253);
      expect(mergedEnd).assertEqual(412);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0008
     * @tc.name      testExtCacheRangeMerge0007
     * @tc.desc      Ranges 119-318 and 418-617 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 119;
      const end1: number = 318;
      const start2: number = 418;
      const end2: number = 617;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(418);
      expect(mergedEnd).assertEqual(617);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0009
     * @tc.name      testExtCacheRangeMerge0008
     * @tc.desc      Ranges 136-385 and 335-414 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 136;
      const end1: number = 385;
      const start2: number = 335;
      const end2: number = 414;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(136);
      expect(mergedEnd).assertEqual(414);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0010
     * @tc.name      testExtCacheRangeMerge0009
     * @tc.desc      Ranges 153-452 and 451-570 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 153;
      const end1: number = 452;
      const start2: number = 451;
      const end2: number = 570;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(153);
      expect(mergedEnd).assertEqual(570);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0011
     * @tc.name      testExtCacheRangeMerge0010
     * @tc.desc      Ranges 170-269 and 270-429 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 170;
      const end1: number = 269;
      const start2: number = 270;
      const end2: number = 429;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(170);
      expect(mergedEnd).assertEqual(429);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0012
     * @tc.name      testExtCacheRangeMerge0011
     * @tc.desc      Ranges 187-336 and 338-537 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 187;
      const end1: number = 336;
      const start2: number = 338;
      const end2: number = 537;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(338);
      expect(mergedEnd).assertEqual(537);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0013
     * @tc.name      testExtCacheRangeMerge0012
     * @tc.desc      Ranges 204-403 and 503-582 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 204;
      const end1: number = 403;
      const start2: number = 503;
      const end2: number = 582;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(503);
      expect(mergedEnd).assertEqual(582);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0014
     * @tc.name      testExtCacheRangeMerge0013
     * @tc.desc      Ranges 221-470 and 420-539 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 221;
      const end1: number = 470;
      const start2: number = 420;
      const end2: number = 539;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(221);
      expect(mergedEnd).assertEqual(539);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0015
     * @tc.name      testExtCacheRangeMerge0014
     * @tc.desc      Ranges 238-537 and 536-695 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 238;
      const end1: number = 537;
      const start2: number = 536;
      const end2: number = 695;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(238);
      expect(mergedEnd).assertEqual(695);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0016
     * @tc.name      testExtCacheRangeMerge0015
     * @tc.desc      Ranges 255-354 and 355-554 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 255;
      const end1: number = 354;
      const start2: number = 355;
      const end2: number = 554;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(255);
      expect(mergedEnd).assertEqual(554);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0017
     * @tc.name      testExtCacheRangeMerge0016
     * @tc.desc      Ranges 272-421 and 423-502 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 272;
      const end1: number = 421;
      const start2: number = 423;
      const end2: number = 502;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(423);
      expect(mergedEnd).assertEqual(502);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0018
     * @tc.name      testExtCacheRangeMerge0017
     * @tc.desc      Ranges 289-488 and 588-707 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 289;
      const end1: number = 488;
      const start2: number = 588;
      const end2: number = 707;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(588);
      expect(mergedEnd).assertEqual(707);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0019
     * @tc.name      testExtCacheRangeMerge0018
     * @tc.desc      Ranges 306-555 and 505-664 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 306;
      const end1: number = 555;
      const start2: number = 505;
      const end2: number = 664;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(306);
      expect(mergedEnd).assertEqual(664);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0020
     * @tc.name      testExtCacheRangeMerge0019
     * @tc.desc      Ranges 323-622 and 621-820 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 323;
      const end1: number = 622;
      const start2: number = 621;
      const end2: number = 820;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(323);
      expect(mergedEnd).assertEqual(820);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0021
     * @tc.name      testExtCacheRangeMerge0020
     * @tc.desc      Ranges 340-439 and 440-519 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 340;
      const end1: number = 439;
      const start2: number = 440;
      const end2: number = 519;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(340);
      expect(mergedEnd).assertEqual(519);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0022
     * @tc.name      testExtCacheRangeMerge0021
     * @tc.desc      Ranges 357-506 and 508-627 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 357;
      const end1: number = 506;
      const start2: number = 508;
      const end2: number = 627;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(508);
      expect(mergedEnd).assertEqual(627);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0023
     * @tc.name      testExtCacheRangeMerge0022
     * @tc.desc      Ranges 374-573 and 673-832 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 374;
      const end1: number = 573;
      const start2: number = 673;
      const end2: number = 832;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(673);
      expect(mergedEnd).assertEqual(832);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0024
     * @tc.name      testExtCacheRangeMerge0023
     * @tc.desc      Ranges 391-640 and 590-789 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 391;
      const end1: number = 640;
      const start2: number = 590;
      const end2: number = 789;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(391);
      expect(mergedEnd).assertEqual(789);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0025
     * @tc.name      testExtCacheRangeMerge0024
     * @tc.desc      Ranges 408-707 and 706-785 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 408;
      const end1: number = 707;
      const start2: number = 706;
      const end2: number = 785;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(408);
      expect(mergedEnd).assertEqual(785);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0026
     * @tc.name      testExtCacheRangeMerge0025
     * @tc.desc      Ranges 425-524 and 525-644 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 425;
      const end1: number = 524;
      const start2: number = 525;
      const end2: number = 644;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(425);
      expect(mergedEnd).assertEqual(644);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0027
     * @tc.name      testExtCacheRangeMerge0026
     * @tc.desc      Ranges 442-591 and 593-752 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 442;
      const end1: number = 591;
      const start2: number = 593;
      const end2: number = 752;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(593);
      expect(mergedEnd).assertEqual(752);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0028
     * @tc.name      testExtCacheRangeMerge0027
     * @tc.desc      Ranges 459-658 and 758-957 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 459;
      const end1: number = 658;
      const start2: number = 758;
      const end2: number = 957;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(758);
      expect(mergedEnd).assertEqual(957);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0029
     * @tc.name      testExtCacheRangeMerge0028
     * @tc.desc      Ranges 476-725 and 675-754 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 476;
      const end1: number = 725;
      const start2: number = 675;
      const end2: number = 754;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(476);
      expect(mergedEnd).assertEqual(754);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0030
     * @tc.name      testExtCacheRangeMerge0029
     * @tc.desc      Ranges 493-792 and 791-910 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 493;
      const end1: number = 792;
      const start2: number = 791;
      const end2: number = 910;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(493);
      expect(mergedEnd).assertEqual(910);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0031
     * @tc.name      testExtCacheRangeMerge0030
     * @tc.desc      Ranges 510-609 and 610-769 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 510;
      const end1: number = 609;
      const start2: number = 610;
      const end2: number = 769;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(510);
      expect(mergedEnd).assertEqual(769);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0032
     * @tc.name      testExtCacheRangeMerge0031
     * @tc.desc      Ranges 527-676 and 678-877 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 527;
      const end1: number = 676;
      const start2: number = 678;
      const end2: number = 877;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(678);
      expect(mergedEnd).assertEqual(877);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0033
     * @tc.name      testExtCacheRangeMerge0032
     * @tc.desc      Ranges 544-743 and 843-922 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 544;
      const end1: number = 743;
      const start2: number = 843;
      const end2: number = 922;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(843);
      expect(mergedEnd).assertEqual(922);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0034
     * @tc.name      testExtCacheRangeMerge0033
     * @tc.desc      Ranges 561-810 and 760-879 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 561;
      const end1: number = 810;
      const start2: number = 760;
      const end2: number = 879;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(561);
      expect(mergedEnd).assertEqual(879);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0035
     * @tc.name      testExtCacheRangeMerge0034
     * @tc.desc      Ranges 578-877 and 876-1035 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 578;
      const end1: number = 877;
      const start2: number = 876;
      const end2: number = 1035;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(578);
      expect(mergedEnd).assertEqual(1035);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0036
     * @tc.name      testExtCacheRangeMerge0035
     * @tc.desc      Ranges 595-694 and 695-894 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 595;
      const end1: number = 694;
      const start2: number = 695;
      const end2: number = 894;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(595);
      expect(mergedEnd).assertEqual(894);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0037
     * @tc.name      testExtCacheRangeMerge0036
     * @tc.desc      Ranges 612-761 and 763-842 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 612;
      const end1: number = 761;
      const start2: number = 763;
      const end2: number = 842;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(763);
      expect(mergedEnd).assertEqual(842);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0038
     * @tc.name      testExtCacheRangeMerge0037
     * @tc.desc      Ranges 629-828 and 928-1047 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 629;
      const end1: number = 828;
      const start2: number = 928;
      const end2: number = 1047;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(928);
      expect(mergedEnd).assertEqual(1047);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0039
     * @tc.name      testExtCacheRangeMerge0038
     * @tc.desc      Ranges 646-895 and 845-1004 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 646;
      const end1: number = 895;
      const start2: number = 845;
      const end2: number = 1004;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(646);
      expect(mergedEnd).assertEqual(1004);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0040
     * @tc.name      testExtCacheRangeMerge0039
     * @tc.desc      Ranges 663-962 and 961-1160 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 663;
      const end1: number = 962;
      const start2: number = 961;
      const end2: number = 1160;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(663);
      expect(mergedEnd).assertEqual(1160);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0041
     * @tc.name      testExtCacheRangeMerge0040
     * @tc.desc      Ranges 680-779 and 780-859 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 680;
      const end1: number = 779;
      const start2: number = 780;
      const end2: number = 859;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(680);
      expect(mergedEnd).assertEqual(859);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0042
     * @tc.name      testExtCacheRangeMerge0041
     * @tc.desc      Ranges 697-846 and 848-967 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 697;
      const end1: number = 846;
      const start2: number = 848;
      const end2: number = 967;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(848);
      expect(mergedEnd).assertEqual(967);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0043
     * @tc.name      testExtCacheRangeMerge0042
     * @tc.desc      Ranges 714-913 and 1013-1172 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 714;
      const end1: number = 913;
      const start2: number = 1013;
      const end2: number = 1172;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1013);
      expect(mergedEnd).assertEqual(1172);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0044
     * @tc.name      testExtCacheRangeMerge0043
     * @tc.desc      Ranges 731-980 and 930-1129 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 731;
      const end1: number = 980;
      const start2: number = 930;
      const end2: number = 1129;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(731);
      expect(mergedEnd).assertEqual(1129);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0045
     * @tc.name      testExtCacheRangeMerge0044
     * @tc.desc      Ranges 748-1047 and 1046-1125 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 748;
      const end1: number = 1047;
      const start2: number = 1046;
      const end2: number = 1125;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(748);
      expect(mergedEnd).assertEqual(1125);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0046
     * @tc.name      testExtCacheRangeMerge0045
     * @tc.desc      Ranges 765-864 and 865-984 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 765;
      const end1: number = 864;
      const start2: number = 865;
      const end2: number = 984;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(765);
      expect(mergedEnd).assertEqual(984);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0047
     * @tc.name      testExtCacheRangeMerge0046
     * @tc.desc      Ranges 782-931 and 933-1092 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 782;
      const end1: number = 931;
      const start2: number = 933;
      const end2: number = 1092;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(933);
      expect(mergedEnd).assertEqual(1092);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0048
     * @tc.name      testExtCacheRangeMerge0047
     * @tc.desc      Ranges 799-998 and 1098-1297 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 799;
      const end1: number = 998;
      const start2: number = 1098;
      const end2: number = 1297;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1098);
      expect(mergedEnd).assertEqual(1297);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0049
     * @tc.name      testExtCacheRangeMerge0048
     * @tc.desc      Ranges 816-1065 and 1015-1094 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 816;
      const end1: number = 1065;
      const start2: number = 1015;
      const end2: number = 1094;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(816);
      expect(mergedEnd).assertEqual(1094);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0050
     * @tc.name      testExtCacheRangeMerge0049
     * @tc.desc      Ranges 833-1132 and 1131-1250 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 833;
      const end1: number = 1132;
      const start2: number = 1131;
      const end2: number = 1250;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(833);
      expect(mergedEnd).assertEqual(1250);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0051
     * @tc.name      testExtCacheRangeMerge0050
     * @tc.desc      Ranges 850-949 and 950-1109 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 850;
      const end1: number = 949;
      const start2: number = 950;
      const end2: number = 1109;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(850);
      expect(mergedEnd).assertEqual(1109);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0052
     * @tc.name      testExtCacheRangeMerge0051
     * @tc.desc      Ranges 867-1016 and 1018-1217 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 867;
      const end1: number = 1016;
      const start2: number = 1018;
      const end2: number = 1217;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1018);
      expect(mergedEnd).assertEqual(1217);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0053
     * @tc.name      testExtCacheRangeMerge0052
     * @tc.desc      Ranges 884-1083 and 1183-1262 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 884;
      const end1: number = 1083;
      const start2: number = 1183;
      const end2: number = 1262;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1183);
      expect(mergedEnd).assertEqual(1262);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0054
     * @tc.name      testExtCacheRangeMerge0053
     * @tc.desc      Ranges 901-1150 and 1100-1219 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 901;
      const end1: number = 1150;
      const start2: number = 1100;
      const end2: number = 1219;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(901);
      expect(mergedEnd).assertEqual(1219);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0055
     * @tc.name      testExtCacheRangeMerge0054
     * @tc.desc      Ranges 918-1217 and 1216-1375 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 918;
      const end1: number = 1217;
      const start2: number = 1216;
      const end2: number = 1375;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(918);
      expect(mergedEnd).assertEqual(1375);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0056
     * @tc.name      testExtCacheRangeMerge0055
     * @tc.desc      Ranges 935-1034 and 1035-1234 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 935;
      const end1: number = 1034;
      const start2: number = 1035;
      const end2: number = 1234;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(935);
      expect(mergedEnd).assertEqual(1234);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0057
     * @tc.name      testExtCacheRangeMerge0056
     * @tc.desc      Ranges 952-1101 and 1103-1182 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 952;
      const end1: number = 1101;
      const start2: number = 1103;
      const end2: number = 1182;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1103);
      expect(mergedEnd).assertEqual(1182);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0058
     * @tc.name      testExtCacheRangeMerge0057
     * @tc.desc      Ranges 969-1168 and 1268-1387 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 969;
      const end1: number = 1168;
      const start2: number = 1268;
      const end2: number = 1387;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1268);
      expect(mergedEnd).assertEqual(1387);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0059
     * @tc.name      testExtCacheRangeMerge0058
     * @tc.desc      Ranges 986-1235 and 1185-1344 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 986;
      const end1: number = 1235;
      const start2: number = 1185;
      const end2: number = 1344;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(986);
      expect(mergedEnd).assertEqual(1344);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0060
     * @tc.name      testExtCacheRangeMerge0059
     * @tc.desc      Ranges 1003-1302 and 1301-1500 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1003;
      const end1: number = 1302;
      const start2: number = 1301;
      const end2: number = 1500;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1003);
      expect(mergedEnd).assertEqual(1500);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0061
     * @tc.name      testExtCacheRangeMerge0060
     * @tc.desc      Ranges 1020-1119 and 1120-1199 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1020;
      const end1: number = 1119;
      const start2: number = 1120;
      const end2: number = 1199;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1020);
      expect(mergedEnd).assertEqual(1199);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0062
     * @tc.name      testExtCacheRangeMerge0061
     * @tc.desc      Ranges 1037-1186 and 1188-1307 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1037;
      const end1: number = 1186;
      const start2: number = 1188;
      const end2: number = 1307;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1188);
      expect(mergedEnd).assertEqual(1307);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0063
     * @tc.name      testExtCacheRangeMerge0062
     * @tc.desc      Ranges 1054-1253 and 1353-1512 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1054;
      const end1: number = 1253;
      const start2: number = 1353;
      const end2: number = 1512;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1353);
      expect(mergedEnd).assertEqual(1512);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0064
     * @tc.name      testExtCacheRangeMerge0063
     * @tc.desc      Ranges 1071-1320 and 1270-1469 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1071;
      const end1: number = 1320;
      const start2: number = 1270;
      const end2: number = 1469;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1071);
      expect(mergedEnd).assertEqual(1469);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0065
     * @tc.name      testExtCacheRangeMerge0064
     * @tc.desc      Ranges 1088-1387 and 1386-1465 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1088;
      const end1: number = 1387;
      const start2: number = 1386;
      const end2: number = 1465;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1088);
      expect(mergedEnd).assertEqual(1465);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0066
     * @tc.name      testExtCacheRangeMerge0065
     * @tc.desc      Ranges 1105-1204 and 1205-1324 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1105;
      const end1: number = 1204;
      const start2: number = 1205;
      const end2: number = 1324;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1105);
      expect(mergedEnd).assertEqual(1324);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0067
     * @tc.name      testExtCacheRangeMerge0066
     * @tc.desc      Ranges 1122-1271 and 1273-1432 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1122;
      const end1: number = 1271;
      const start2: number = 1273;
      const end2: number = 1432;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1273);
      expect(mergedEnd).assertEqual(1432);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0068
     * @tc.name      testExtCacheRangeMerge0067
     * @tc.desc      Ranges 1139-1338 and 1438-1637 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1139;
      const end1: number = 1338;
      const start2: number = 1438;
      const end2: number = 1637;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1438);
      expect(mergedEnd).assertEqual(1637);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0069
     * @tc.name      testExtCacheRangeMerge0068
     * @tc.desc      Ranges 1156-1405 and 1355-1434 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1156;
      const end1: number = 1405;
      const start2: number = 1355;
      const end2: number = 1434;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1156);
      expect(mergedEnd).assertEqual(1434);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0070
     * @tc.name      testExtCacheRangeMerge0069
     * @tc.desc      Ranges 1173-1472 and 1471-1590 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1173;
      const end1: number = 1472;
      const start2: number = 1471;
      const end2: number = 1590;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1173);
      expect(mergedEnd).assertEqual(1590);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0071
     * @tc.name      testExtCacheRangeMerge0070
     * @tc.desc      Ranges 1190-1289 and 1290-1449 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1190;
      const end1: number = 1289;
      const start2: number = 1290;
      const end2: number = 1449;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1190);
      expect(mergedEnd).assertEqual(1449);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0072
     * @tc.name      testExtCacheRangeMerge0071
     * @tc.desc      Ranges 1207-1356 and 1358-1557 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1207;
      const end1: number = 1356;
      const start2: number = 1358;
      const end2: number = 1557;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1358);
      expect(mergedEnd).assertEqual(1557);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0073
     * @tc.name      testExtCacheRangeMerge0072
     * @tc.desc      Ranges 1224-1423 and 1523-1602 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1224;
      const end1: number = 1423;
      const start2: number = 1523;
      const end2: number = 1602;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1523);
      expect(mergedEnd).assertEqual(1602);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0074
     * @tc.name      testExtCacheRangeMerge0073
     * @tc.desc      Ranges 1241-1490 and 1440-1559 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1241;
      const end1: number = 1490;
      const start2: number = 1440;
      const end2: number = 1559;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1241);
      expect(mergedEnd).assertEqual(1559);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0075
     * @tc.name      testExtCacheRangeMerge0074
     * @tc.desc      Ranges 1258-1557 and 1556-1715 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1258;
      const end1: number = 1557;
      const start2: number = 1556;
      const end2: number = 1715;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1258);
      expect(mergedEnd).assertEqual(1715);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0076
     * @tc.name      testExtCacheRangeMerge0075
     * @tc.desc      Ranges 1275-1374 and 1375-1574 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1275;
      const end1: number = 1374;
      const start2: number = 1375;
      const end2: number = 1574;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1275);
      expect(mergedEnd).assertEqual(1574);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0077
     * @tc.name      testExtCacheRangeMerge0076
     * @tc.desc      Ranges 1292-1441 and 1443-1522 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1292;
      const end1: number = 1441;
      const start2: number = 1443;
      const end2: number = 1522;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1443);
      expect(mergedEnd).assertEqual(1522);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0078
     * @tc.name      testExtCacheRangeMerge0077
     * @tc.desc      Ranges 1309-1508 and 1608-1727 merge=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1309;
      const end1: number = 1508;
      const start2: number = 1608;
      const end2: number = 1727;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(false);
      expect(mergedStart).assertEqual(1608);
      expect(mergedEnd).assertEqual(1727);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0079
     * @tc.name      testExtCacheRangeMerge0078
     * @tc.desc      Ranges 1326-1575 and 1525-1684 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1326;
      const end1: number = 1575;
      const start2: number = 1525;
      const end2: number = 1684;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1326);
      expect(mergedEnd).assertEqual(1684);
      expect(end1).assertLargerOrEqual(start1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_MERGE_0080
     * @tc.name      testExtCacheRangeMerge0079
     * @tc.desc      Ranges 1343-1642 and 1641-1840 merge=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRangeMerge0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start1: number = 1343;
      const end1: number = 1642;
      const start2: number = 1641;
      const end2: number = 1840;
      const merge: boolean = start2 <= end1 + 1;
      const mergedStart: number = merge ? start1 : start2;
      const mergedEnd: number = merge ? Math.max(end1, end2) : end2;
      expect(merge).assertEqual(true);
      expect(mergedStart).assertEqual(1343);
      expect(mergedEnd).assertEqual(1840);
      expect(end1).assertLargerOrEqual(start1);
    })
  });
}
