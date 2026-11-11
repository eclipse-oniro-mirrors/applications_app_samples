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

const TAG: string = '[Sample_playWithCacheSegmentPlan]';
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

export default function playWithCacheSegmentPlanTest(): void {
  describe('playWithCacheSegmentPlanTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0001
     * @tc.name      testExtCachePlan0000
     * @tc.desc      Time 0 with 10s segments -> #0 offset 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 0;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(0);
      expect(segmentOffset).assertEqual(0);
      expect(within).assertEqual(0);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0002
     * @tc.name      testExtCachePlan0001
     * @tc.desc      Time 137 with 6s segments -> #22 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 137;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(22);
      expect(segmentOffset).assertEqual(132);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0003
     * @tc.name      testExtCachePlan0002
     * @tc.desc      Time 274 with 4s segments -> #68 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 274;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(68);
      expect(segmentOffset).assertEqual(272);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0004
     * @tc.name      testExtCachePlan0003
     * @tc.desc      Time 411 with 2s segments -> #205 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 411;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(205);
      expect(segmentOffset).assertEqual(410);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0005
     * @tc.name      testExtCachePlan0004
     * @tc.desc      Time 548 with 10s segments -> #54 offset 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 548;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(54);
      expect(segmentOffset).assertEqual(540);
      expect(within).assertEqual(8);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0006
     * @tc.name      testExtCachePlan0005
     * @tc.desc      Time 85 with 6s segments -> #14 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 85;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(14);
      expect(segmentOffset).assertEqual(84);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0007
     * @tc.name      testExtCachePlan0006
     * @tc.desc      Time 222 with 4s segments -> #55 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 222;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(55);
      expect(segmentOffset).assertEqual(220);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0008
     * @tc.name      testExtCachePlan0007
     * @tc.desc      Time 359 with 2s segments -> #179 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 359;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(179);
      expect(segmentOffset).assertEqual(358);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0009
     * @tc.name      testExtCachePlan0008
     * @tc.desc      Time 496 with 10s segments -> #49 offset 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 496;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(49);
      expect(segmentOffset).assertEqual(490);
      expect(within).assertEqual(6);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0010
     * @tc.name      testExtCachePlan0009
     * @tc.desc      Time 33 with 6s segments -> #5 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 33;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(5);
      expect(segmentOffset).assertEqual(30);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0011
     * @tc.name      testExtCachePlan0010
     * @tc.desc      Time 170 with 4s segments -> #42 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 170;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(42);
      expect(segmentOffset).assertEqual(168);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0012
     * @tc.name      testExtCachePlan0011
     * @tc.desc      Time 307 with 2s segments -> #153 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 307;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(153);
      expect(segmentOffset).assertEqual(306);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0013
     * @tc.name      testExtCachePlan0012
     * @tc.desc      Time 444 with 10s segments -> #44 offset 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 444;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(44);
      expect(segmentOffset).assertEqual(440);
      expect(within).assertEqual(4);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0014
     * @tc.name      testExtCachePlan0013
     * @tc.desc      Time 581 with 6s segments -> #96 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 581;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(96);
      expect(segmentOffset).assertEqual(576);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0015
     * @tc.name      testExtCachePlan0014
     * @tc.desc      Time 118 with 4s segments -> #29 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 118;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(29);
      expect(segmentOffset).assertEqual(116);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0016
     * @tc.name      testExtCachePlan0015
     * @tc.desc      Time 255 with 2s segments -> #127 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 255;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(127);
      expect(segmentOffset).assertEqual(254);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0017
     * @tc.name      testExtCachePlan0016
     * @tc.desc      Time 392 with 10s segments -> #39 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 392;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(39);
      expect(segmentOffset).assertEqual(390);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0018
     * @tc.name      testExtCachePlan0017
     * @tc.desc      Time 529 with 6s segments -> #88 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 529;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(88);
      expect(segmentOffset).assertEqual(528);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0019
     * @tc.name      testExtCachePlan0018
     * @tc.desc      Time 66 with 4s segments -> #16 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 66;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(16);
      expect(segmentOffset).assertEqual(64);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0020
     * @tc.name      testExtCachePlan0019
     * @tc.desc      Time 203 with 2s segments -> #101 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 203;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(101);
      expect(segmentOffset).assertEqual(202);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0021
     * @tc.name      testExtCachePlan0020
     * @tc.desc      Time 340 with 10s segments -> #34 offset 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 340;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(34);
      expect(segmentOffset).assertEqual(340);
      expect(within).assertEqual(0);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0022
     * @tc.name      testExtCachePlan0021
     * @tc.desc      Time 477 with 6s segments -> #79 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 477;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(79);
      expect(segmentOffset).assertEqual(474);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0023
     * @tc.name      testExtCachePlan0022
     * @tc.desc      Time 14 with 4s segments -> #3 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 14;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(3);
      expect(segmentOffset).assertEqual(12);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0024
     * @tc.name      testExtCachePlan0023
     * @tc.desc      Time 151 with 2s segments -> #75 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 151;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(75);
      expect(segmentOffset).assertEqual(150);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0025
     * @tc.name      testExtCachePlan0024
     * @tc.desc      Time 288 with 10s segments -> #28 offset 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 288;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(28);
      expect(segmentOffset).assertEqual(280);
      expect(within).assertEqual(8);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0026
     * @tc.name      testExtCachePlan0025
     * @tc.desc      Time 425 with 6s segments -> #70 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 425;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(70);
      expect(segmentOffset).assertEqual(420);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0027
     * @tc.name      testExtCachePlan0026
     * @tc.desc      Time 562 with 4s segments -> #140 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 562;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(140);
      expect(segmentOffset).assertEqual(560);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0028
     * @tc.name      testExtCachePlan0027
     * @tc.desc      Time 99 with 2s segments -> #49 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 99;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(49);
      expect(segmentOffset).assertEqual(98);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0029
     * @tc.name      testExtCachePlan0028
     * @tc.desc      Time 236 with 10s segments -> #23 offset 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 236;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(23);
      expect(segmentOffset).assertEqual(230);
      expect(within).assertEqual(6);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0030
     * @tc.name      testExtCachePlan0029
     * @tc.desc      Time 373 with 6s segments -> #62 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 373;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(62);
      expect(segmentOffset).assertEqual(372);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0031
     * @tc.name      testExtCachePlan0030
     * @tc.desc      Time 510 with 4s segments -> #127 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 510;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(127);
      expect(segmentOffset).assertEqual(508);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0032
     * @tc.name      testExtCachePlan0031
     * @tc.desc      Time 47 with 2s segments -> #23 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 47;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(23);
      expect(segmentOffset).assertEqual(46);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0033
     * @tc.name      testExtCachePlan0032
     * @tc.desc      Time 184 with 10s segments -> #18 offset 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 184;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(18);
      expect(segmentOffset).assertEqual(180);
      expect(within).assertEqual(4);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0034
     * @tc.name      testExtCachePlan0033
     * @tc.desc      Time 321 with 6s segments -> #53 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 321;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(53);
      expect(segmentOffset).assertEqual(318);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0035
     * @tc.name      testExtCachePlan0034
     * @tc.desc      Time 458 with 4s segments -> #114 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 458;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(114);
      expect(segmentOffset).assertEqual(456);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0036
     * @tc.name      testExtCachePlan0035
     * @tc.desc      Time 595 with 2s segments -> #297 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 595;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(297);
      expect(segmentOffset).assertEqual(594);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0037
     * @tc.name      testExtCachePlan0036
     * @tc.desc      Time 132 with 10s segments -> #13 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 132;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(13);
      expect(segmentOffset).assertEqual(130);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0038
     * @tc.name      testExtCachePlan0037
     * @tc.desc      Time 269 with 6s segments -> #44 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 269;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(44);
      expect(segmentOffset).assertEqual(264);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0039
     * @tc.name      testExtCachePlan0038
     * @tc.desc      Time 406 with 4s segments -> #101 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 406;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(101);
      expect(segmentOffset).assertEqual(404);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0040
     * @tc.name      testExtCachePlan0039
     * @tc.desc      Time 543 with 2s segments -> #271 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 543;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(271);
      expect(segmentOffset).assertEqual(542);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0041
     * @tc.name      testExtCachePlan0040
     * @tc.desc      Time 80 with 10s segments -> #8 offset 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 80;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(8);
      expect(segmentOffset).assertEqual(80);
      expect(within).assertEqual(0);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0042
     * @tc.name      testExtCachePlan0041
     * @tc.desc      Time 217 with 6s segments -> #36 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 217;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(36);
      expect(segmentOffset).assertEqual(216);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0043
     * @tc.name      testExtCachePlan0042
     * @tc.desc      Time 354 with 4s segments -> #88 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 354;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(88);
      expect(segmentOffset).assertEqual(352);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0044
     * @tc.name      testExtCachePlan0043
     * @tc.desc      Time 491 with 2s segments -> #245 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 491;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(245);
      expect(segmentOffset).assertEqual(490);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0045
     * @tc.name      testExtCachePlan0044
     * @tc.desc      Time 28 with 10s segments -> #2 offset 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 28;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(2);
      expect(segmentOffset).assertEqual(20);
      expect(within).assertEqual(8);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0046
     * @tc.name      testExtCachePlan0045
     * @tc.desc      Time 165 with 6s segments -> #27 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 165;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(27);
      expect(segmentOffset).assertEqual(162);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0047
     * @tc.name      testExtCachePlan0046
     * @tc.desc      Time 302 with 4s segments -> #75 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 302;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(75);
      expect(segmentOffset).assertEqual(300);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0048
     * @tc.name      testExtCachePlan0047
     * @tc.desc      Time 439 with 2s segments -> #219 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 439;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(219);
      expect(segmentOffset).assertEqual(438);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0049
     * @tc.name      testExtCachePlan0048
     * @tc.desc      Time 576 with 10s segments -> #57 offset 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 576;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(57);
      expect(segmentOffset).assertEqual(570);
      expect(within).assertEqual(6);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0050
     * @tc.name      testExtCachePlan0049
     * @tc.desc      Time 113 with 6s segments -> #18 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 113;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(18);
      expect(segmentOffset).assertEqual(108);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0051
     * @tc.name      testExtCachePlan0050
     * @tc.desc      Time 250 with 4s segments -> #62 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 250;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(62);
      expect(segmentOffset).assertEqual(248);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0052
     * @tc.name      testExtCachePlan0051
     * @tc.desc      Time 387 with 2s segments -> #193 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 387;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(193);
      expect(segmentOffset).assertEqual(386);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0053
     * @tc.name      testExtCachePlan0052
     * @tc.desc      Time 524 with 10s segments -> #52 offset 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 524;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(52);
      expect(segmentOffset).assertEqual(520);
      expect(within).assertEqual(4);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0054
     * @tc.name      testExtCachePlan0053
     * @tc.desc      Time 61 with 6s segments -> #10 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 61;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(10);
      expect(segmentOffset).assertEqual(60);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0055
     * @tc.name      testExtCachePlan0054
     * @tc.desc      Time 198 with 4s segments -> #49 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 198;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(49);
      expect(segmentOffset).assertEqual(196);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0056
     * @tc.name      testExtCachePlan0055
     * @tc.desc      Time 335 with 2s segments -> #167 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 335;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(167);
      expect(segmentOffset).assertEqual(334);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0057
     * @tc.name      testExtCachePlan0056
     * @tc.desc      Time 472 with 10s segments -> #47 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 472;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(47);
      expect(segmentOffset).assertEqual(470);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0058
     * @tc.name      testExtCachePlan0057
     * @tc.desc      Time 9 with 6s segments -> #1 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 9;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(1);
      expect(segmentOffset).assertEqual(6);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0059
     * @tc.name      testExtCachePlan0058
     * @tc.desc      Time 146 with 4s segments -> #36 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 146;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(36);
      expect(segmentOffset).assertEqual(144);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0060
     * @tc.name      testExtCachePlan0059
     * @tc.desc      Time 283 with 2s segments -> #141 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 283;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(141);
      expect(segmentOffset).assertEqual(282);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0061
     * @tc.name      testExtCachePlan0060
     * @tc.desc      Time 420 with 10s segments -> #42 offset 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 420;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(42);
      expect(segmentOffset).assertEqual(420);
      expect(within).assertEqual(0);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0062
     * @tc.name      testExtCachePlan0061
     * @tc.desc      Time 557 with 6s segments -> #92 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 557;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(92);
      expect(segmentOffset).assertEqual(552);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0063
     * @tc.name      testExtCachePlan0062
     * @tc.desc      Time 94 with 4s segments -> #23 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 94;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(23);
      expect(segmentOffset).assertEqual(92);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0064
     * @tc.name      testExtCachePlan0063
     * @tc.desc      Time 231 with 2s segments -> #115 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 231;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(115);
      expect(segmentOffset).assertEqual(230);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0065
     * @tc.name      testExtCachePlan0064
     * @tc.desc      Time 368 with 10s segments -> #36 offset 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 368;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(36);
      expect(segmentOffset).assertEqual(360);
      expect(within).assertEqual(8);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0066
     * @tc.name      testExtCachePlan0065
     * @tc.desc      Time 505 with 6s segments -> #84 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 505;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(84);
      expect(segmentOffset).assertEqual(504);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0067
     * @tc.name      testExtCachePlan0066
     * @tc.desc      Time 42 with 4s segments -> #10 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 42;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(10);
      expect(segmentOffset).assertEqual(40);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0068
     * @tc.name      testExtCachePlan0067
     * @tc.desc      Time 179 with 2s segments -> #89 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 179;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(89);
      expect(segmentOffset).assertEqual(178);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0069
     * @tc.name      testExtCachePlan0068
     * @tc.desc      Time 316 with 10s segments -> #31 offset 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 316;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(31);
      expect(segmentOffset).assertEqual(310);
      expect(within).assertEqual(6);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0070
     * @tc.name      testExtCachePlan0069
     * @tc.desc      Time 453 with 6s segments -> #75 offset 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 453;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(75);
      expect(segmentOffset).assertEqual(450);
      expect(within).assertEqual(3);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0071
     * @tc.name      testExtCachePlan0070
     * @tc.desc      Time 590 with 4s segments -> #147 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 590;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(147);
      expect(segmentOffset).assertEqual(588);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0072
     * @tc.name      testExtCachePlan0071
     * @tc.desc      Time 127 with 2s segments -> #63 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 127;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(63);
      expect(segmentOffset).assertEqual(126);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0073
     * @tc.name      testExtCachePlan0072
     * @tc.desc      Time 264 with 10s segments -> #26 offset 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 264;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(26);
      expect(segmentOffset).assertEqual(260);
      expect(within).assertEqual(4);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0074
     * @tc.name      testExtCachePlan0073
     * @tc.desc      Time 401 with 6s segments -> #66 offset 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 401;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(66);
      expect(segmentOffset).assertEqual(396);
      expect(within).assertEqual(5);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0075
     * @tc.name      testExtCachePlan0074
     * @tc.desc      Time 538 with 4s segments -> #134 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 538;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(134);
      expect(segmentOffset).assertEqual(536);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0076
     * @tc.name      testExtCachePlan0075
     * @tc.desc      Time 75 with 2s segments -> #37 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 75;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(37);
      expect(segmentOffset).assertEqual(74);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0077
     * @tc.name      testExtCachePlan0076
     * @tc.desc      Time 212 with 10s segments -> #21 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 10;
      const time: number = 212;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(21);
      expect(segmentOffset).assertEqual(210);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0078
     * @tc.name      testExtCachePlan0077
     * @tc.desc      Time 349 with 6s segments -> #58 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 6;
      const time: number = 349;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(58);
      expect(segmentOffset).assertEqual(348);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0079
     * @tc.name      testExtCachePlan0078
     * @tc.desc      Time 486 with 4s segments -> #121 offset 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 4;
      const time: number = 486;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(121);
      expect(segmentOffset).assertEqual(484);
      expect(within).assertEqual(2);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PLAN_0080
     * @tc.name      testExtCachePlan0079
     * @tc.desc      Time 23 with 2s segments -> #11 offset 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePlan0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segmentDuration: number = 2;
      const time: number = 23;
      const segmentIndex: number = Math.floor(time / segmentDuration);
      const segmentOffset: number = segmentIndex * segmentDuration;
      const within: number = time - segmentOffset;
      expect(segmentIndex).assertEqual(11);
      expect(segmentOffset).assertEqual(22);
      expect(within).assertEqual(1);
      expect(within).assertLargerOrEqual(0);
      expect(within).assertLess(segmentDuration);
    })
  });
}
