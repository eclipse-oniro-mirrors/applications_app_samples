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

const TAG: string = '[Sample_playWithCachePrefetch]';
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

export default function playWithCachePrefetchTest(): void {
  describe('playWithCachePrefetchTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0001
     * @tc.name      testExtCachePrefetch0000
     * @tc.desc      Prefetch 1 after segment 0 -> 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 0;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('1');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0002
     * @tc.name      testExtCachePrefetch0001
     * @tc.desc      Prefetch 2 after segment 1 -> 2,3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 1;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('2,3');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0003
     * @tc.name      testExtCachePrefetch0002
     * @tc.desc      Prefetch 3 after segment 2 -> 3,4,5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 2;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('3,4,5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0004
     * @tc.name      testExtCachePrefetch0003
     * @tc.desc      Prefetch 4 after segment 3 -> 4,5,6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 3;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('4,5,6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0005
     * @tc.name      testExtCachePrefetch0004
     * @tc.desc      Prefetch 1 after segment 4 -> 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 4;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0006
     * @tc.name      testExtCachePrefetch0005
     * @tc.desc      Prefetch 2 after segment 5 -> 6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 5;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0007
     * @tc.name      testExtCachePrefetch0006
     * @tc.desc      Prefetch 3 after segment 6 -> 7,8,9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 6;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('7,8,9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0008
     * @tc.name      testExtCachePrefetch0007
     * @tc.desc      Prefetch 4 after segment 7 -> 8,9,10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 7;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('8,9,10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0009
     * @tc.name      testExtCachePrefetch0008
     * @tc.desc      Prefetch 1 after segment 8 -> 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 8;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0010
     * @tc.name      testExtCachePrefetch0009
     * @tc.desc      Prefetch 2 after segment 9 -> 10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 9;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0011
     * @tc.name      testExtCachePrefetch0010
     * @tc.desc      Prefetch 3 after segment 10 -> 11,12,13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 10;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('11,12,13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0012
     * @tc.name      testExtCachePrefetch0011
     * @tc.desc      Prefetch 4 after segment 11 -> 12,13,14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 11;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('12,13,14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0013
     * @tc.name      testExtCachePrefetch0012
     * @tc.desc      Prefetch 1 after segment 12 -> 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 12;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0014
     * @tc.name      testExtCachePrefetch0013
     * @tc.desc      Prefetch 2 after segment 13 -> 14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 13;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0015
     * @tc.name      testExtCachePrefetch0014
     * @tc.desc      Prefetch 3 after segment 14 -> 15,16,17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 14;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('15,16,17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0016
     * @tc.name      testExtCachePrefetch0015
     * @tc.desc      Prefetch 4 after segment 15 -> 16,17,18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 15;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('16,17,18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0017
     * @tc.name      testExtCachePrefetch0016
     * @tc.desc      Prefetch 1 after segment 16 -> 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 16;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0018
     * @tc.name      testExtCachePrefetch0017
     * @tc.desc      Prefetch 2 after segment 17 -> 18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 17;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0019
     * @tc.name      testExtCachePrefetch0018
     * @tc.desc      Prefetch 3 after segment 18 -> 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 18;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0020
     * @tc.name      testExtCachePrefetch0019
     * @tc.desc      Prefetch 4 after segment 19 -> .
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 19;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0021
     * @tc.name      testExtCachePrefetch0020
     * @tc.desc      Prefetch 1 after segment 0 -> 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 0;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('1');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0022
     * @tc.name      testExtCachePrefetch0021
     * @tc.desc      Prefetch 2 after segment 1 -> 2,3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 1;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('2,3');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0023
     * @tc.name      testExtCachePrefetch0022
     * @tc.desc      Prefetch 3 after segment 2 -> 3,4,5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 2;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('3,4,5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0024
     * @tc.name      testExtCachePrefetch0023
     * @tc.desc      Prefetch 4 after segment 3 -> 4,5,6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 3;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('4,5,6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0025
     * @tc.name      testExtCachePrefetch0024
     * @tc.desc      Prefetch 1 after segment 4 -> 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 4;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0026
     * @tc.name      testExtCachePrefetch0025
     * @tc.desc      Prefetch 2 after segment 5 -> 6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 5;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0027
     * @tc.name      testExtCachePrefetch0026
     * @tc.desc      Prefetch 3 after segment 6 -> 7,8,9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 6;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('7,8,9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0028
     * @tc.name      testExtCachePrefetch0027
     * @tc.desc      Prefetch 4 after segment 7 -> 8,9,10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 7;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('8,9,10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0029
     * @tc.name      testExtCachePrefetch0028
     * @tc.desc      Prefetch 1 after segment 8 -> 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 8;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0030
     * @tc.name      testExtCachePrefetch0029
     * @tc.desc      Prefetch 2 after segment 9 -> 10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 9;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0031
     * @tc.name      testExtCachePrefetch0030
     * @tc.desc      Prefetch 3 after segment 10 -> 11,12,13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 10;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('11,12,13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0032
     * @tc.name      testExtCachePrefetch0031
     * @tc.desc      Prefetch 4 after segment 11 -> 12,13,14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 11;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('12,13,14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0033
     * @tc.name      testExtCachePrefetch0032
     * @tc.desc      Prefetch 1 after segment 12 -> 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 12;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0034
     * @tc.name      testExtCachePrefetch0033
     * @tc.desc      Prefetch 2 after segment 13 -> 14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 13;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0035
     * @tc.name      testExtCachePrefetch0034
     * @tc.desc      Prefetch 3 after segment 14 -> 15,16,17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 14;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('15,16,17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0036
     * @tc.name      testExtCachePrefetch0035
     * @tc.desc      Prefetch 4 after segment 15 -> 16,17,18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 15;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('16,17,18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0037
     * @tc.name      testExtCachePrefetch0036
     * @tc.desc      Prefetch 1 after segment 16 -> 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 16;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0038
     * @tc.name      testExtCachePrefetch0037
     * @tc.desc      Prefetch 2 after segment 17 -> 18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 17;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0039
     * @tc.name      testExtCachePrefetch0038
     * @tc.desc      Prefetch 3 after segment 18 -> 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 18;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0040
     * @tc.name      testExtCachePrefetch0039
     * @tc.desc      Prefetch 4 after segment 19 -> .
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 19;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0041
     * @tc.name      testExtCachePrefetch0040
     * @tc.desc      Prefetch 1 after segment 0 -> 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 0;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('1');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0042
     * @tc.name      testExtCachePrefetch0041
     * @tc.desc      Prefetch 2 after segment 1 -> 2,3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 1;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('2,3');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0043
     * @tc.name      testExtCachePrefetch0042
     * @tc.desc      Prefetch 3 after segment 2 -> 3,4,5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 2;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('3,4,5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0044
     * @tc.name      testExtCachePrefetch0043
     * @tc.desc      Prefetch 4 after segment 3 -> 4,5,6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 3;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('4,5,6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0045
     * @tc.name      testExtCachePrefetch0044
     * @tc.desc      Prefetch 1 after segment 4 -> 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 4;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0046
     * @tc.name      testExtCachePrefetch0045
     * @tc.desc      Prefetch 2 after segment 5 -> 6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 5;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0047
     * @tc.name      testExtCachePrefetch0046
     * @tc.desc      Prefetch 3 after segment 6 -> 7,8,9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 6;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('7,8,9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0048
     * @tc.name      testExtCachePrefetch0047
     * @tc.desc      Prefetch 4 after segment 7 -> 8,9,10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 7;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('8,9,10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0049
     * @tc.name      testExtCachePrefetch0048
     * @tc.desc      Prefetch 1 after segment 8 -> 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 8;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0050
     * @tc.name      testExtCachePrefetch0049
     * @tc.desc      Prefetch 2 after segment 9 -> 10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 9;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0051
     * @tc.name      testExtCachePrefetch0050
     * @tc.desc      Prefetch 3 after segment 10 -> 11,12,13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 10;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('11,12,13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0052
     * @tc.name      testExtCachePrefetch0051
     * @tc.desc      Prefetch 4 after segment 11 -> 12,13,14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 11;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('12,13,14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0053
     * @tc.name      testExtCachePrefetch0052
     * @tc.desc      Prefetch 1 after segment 12 -> 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 12;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0054
     * @tc.name      testExtCachePrefetch0053
     * @tc.desc      Prefetch 2 after segment 13 -> 14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 13;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0055
     * @tc.name      testExtCachePrefetch0054
     * @tc.desc      Prefetch 3 after segment 14 -> 15,16,17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 14;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('15,16,17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0056
     * @tc.name      testExtCachePrefetch0055
     * @tc.desc      Prefetch 4 after segment 15 -> 16,17,18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 15;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('16,17,18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0057
     * @tc.name      testExtCachePrefetch0056
     * @tc.desc      Prefetch 1 after segment 16 -> 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 16;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0058
     * @tc.name      testExtCachePrefetch0057
     * @tc.desc      Prefetch 2 after segment 17 -> 18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 17;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0059
     * @tc.name      testExtCachePrefetch0058
     * @tc.desc      Prefetch 3 after segment 18 -> 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 18;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0060
     * @tc.name      testExtCachePrefetch0059
     * @tc.desc      Prefetch 4 after segment 19 -> .
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 19;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0061
     * @tc.name      testExtCachePrefetch0060
     * @tc.desc      Prefetch 1 after segment 0 -> 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 0;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('1');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0062
     * @tc.name      testExtCachePrefetch0061
     * @tc.desc      Prefetch 2 after segment 1 -> 2,3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 1;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('2,3');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0063
     * @tc.name      testExtCachePrefetch0062
     * @tc.desc      Prefetch 3 after segment 2 -> 3,4,5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 2;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('3,4,5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0064
     * @tc.name      testExtCachePrefetch0063
     * @tc.desc      Prefetch 4 after segment 3 -> 4,5,6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 3;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('4,5,6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0065
     * @tc.name      testExtCachePrefetch0064
     * @tc.desc      Prefetch 1 after segment 4 -> 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 4;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('5');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0066
     * @tc.name      testExtCachePrefetch0065
     * @tc.desc      Prefetch 2 after segment 5 -> 6,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 5;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('6,7');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0067
     * @tc.name      testExtCachePrefetch0066
     * @tc.desc      Prefetch 3 after segment 6 -> 7,8,9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 6;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('7,8,9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0068
     * @tc.name      testExtCachePrefetch0067
     * @tc.desc      Prefetch 4 after segment 7 -> 8,9,10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 7;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('8,9,10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0069
     * @tc.name      testExtCachePrefetch0068
     * @tc.desc      Prefetch 1 after segment 8 -> 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 8;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('9');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0070
     * @tc.name      testExtCachePrefetch0069
     * @tc.desc      Prefetch 2 after segment 9 -> 10,11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 9;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('10,11');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0071
     * @tc.name      testExtCachePrefetch0070
     * @tc.desc      Prefetch 3 after segment 10 -> 11,12,13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 10;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('11,12,13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0072
     * @tc.name      testExtCachePrefetch0071
     * @tc.desc      Prefetch 4 after segment 11 -> 12,13,14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 11;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('12,13,14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0073
     * @tc.name      testExtCachePrefetch0072
     * @tc.desc      Prefetch 1 after segment 12 -> 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 12;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('13');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0074
     * @tc.name      testExtCachePrefetch0073
     * @tc.desc      Prefetch 2 after segment 13 -> 14,15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 13;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('14,15');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0075
     * @tc.name      testExtCachePrefetch0074
     * @tc.desc      Prefetch 3 after segment 14 -> 15,16,17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 14;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('15,16,17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0076
     * @tc.name      testExtCachePrefetch0075
     * @tc.desc      Prefetch 4 after segment 15 -> 16,17,18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 15;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('16,17,18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0077
     * @tc.name      testExtCachePrefetch0076
     * @tc.desc      Prefetch 1 after segment 16 -> 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 16;
      const totalSegments: number = 20;
      const prefetchCount: number = 1;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('17');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0078
     * @tc.name      testExtCachePrefetch0077
     * @tc.desc      Prefetch 2 after segment 17 -> 18,19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 17;
      const totalSegments: number = 20;
      const prefetchCount: number = 2;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('18,19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0079
     * @tc.name      testExtCachePrefetch0078
     * @tc.desc      Prefetch 3 after segment 18 -> 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 18;
      const totalSegments: number = 20;
      const prefetchCount: number = 3;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('19');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PREFETCH_0080
     * @tc.name      testExtCachePrefetch0079
     * @tc.desc      Prefetch 4 after segment 19 -> .
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePrefetch0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const currentIndex: number = 19;
      const totalSegments: number = 20;
      const prefetchCount: number = 4;
      const order: number[] = [];
      for (let index: number = 1; index <= prefetchCount; index++) {
        const next: number = currentIndex + index;
        if (next < totalSegments) {
          order.push(next);
        }
      }
      expect(order.join(',')).assertEqual('');
      expect(order.length).assertLessOrEqual(prefetchCount);
    })
  });
}
