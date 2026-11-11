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

const TAG: string = '[Sample_playWithCacheEviction]';
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

export default function playWithCacheEvictionTest(): void {
  describe('playWithCacheEvictionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0001
     * @tc.name      testExtCacheEvict0000
     * @tc.desc      LRU capacity 3 after 6 inserts keeps k1,k4,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k4,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0002
     * @tc.name      testExtCacheEvict0001
     * @tc.desc      LRU capacity 4 after 8 inserts keeps k5,k6,k0,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k0,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0003
     * @tc.name      testExtCacheEvict0002
     * @tc.desc      LRU capacity 5 after 10 inserts keeps k3,k7,k8,k9,k6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k3,k7,k8,k9,k6');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0004
     * @tc.name      testExtCacheEvict0003
     * @tc.desc      LRU capacity 6 after 12 inserts keeps k7,k8,k9,k5,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k5,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0005
     * @tc.name      testExtCacheEvict0004
     * @tc.desc      LRU capacity 7 after 10 inserts keeps k5,k6,k1,k7,k8,k9,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k1,k7,k8,k9,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0006
     * @tc.name      testExtCacheEvict0005
     * @tc.desc      LRU capacity 3 after 7 inserts keeps k5,k6,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0007
     * @tc.name      testExtCacheEvict0006
     * @tc.desc      LRU capacity 4 after 9 inserts keeps k6,k0,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k0,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0008
     * @tc.name      testExtCacheEvict0007
     * @tc.desc      LRU capacity 5 after 11 inserts keeps k7,k8,k9,k6,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k6,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0009
     * @tc.name      testExtCacheEvict0008
     * @tc.desc      LRU capacity 6 after 9 inserts keeps k4,k5,k6,k2,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k2,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0010
     * @tc.name      testExtCacheEvict0009
     * @tc.desc      LRU capacity 7 after 11 inserts keeps k6,k1,k7,k8,k9,k4,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k1,k7,k8,k9,k4,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0011
     * @tc.name      testExtCacheEvict0010
     * @tc.desc      LRU capacity 3 after 8 inserts keeps k6,k4,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k4,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0012
     * @tc.name      testExtCacheEvict0011
     * @tc.desc      LRU capacity 4 after 10 inserts keeps k7,k8,k9,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0013
     * @tc.name      testExtCacheEvict0012
     * @tc.desc      LRU capacity 5 after 8 inserts keeps k4,k5,k6,k3,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k3,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0014
     * @tc.name      testExtCacheEvict0013
     * @tc.desc      LRU capacity 6 after 10 inserts keeps k6,k2,k7,k8,k9,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k2,k7,k8,k9,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0015
     * @tc.name      testExtCacheEvict0014
     * @tc.desc      LRU capacity 7 after 12 inserts keeps k1,k7,k8,k9,k4,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k7,k8,k9,k4,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0016
     * @tc.name      testExtCacheEvict0015
     * @tc.desc      LRU capacity 3 after 9 inserts keeps k4,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0017
     * @tc.name      testExtCacheEvict0016
     * @tc.desc      LRU capacity 4 after 7 inserts keeps k4,k5,k6,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0018
     * @tc.name      testExtCacheEvict0017
     * @tc.desc      LRU capacity 5 after 9 inserts keeps k5,k6,k3,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k3,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0019
     * @tc.name      testExtCacheEvict0018
     * @tc.desc      LRU capacity 6 after 11 inserts keeps k2,k7,k8,k9,k5,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k2,k7,k8,k9,k5,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0020
     * @tc.name      testExtCacheEvict0019
     * @tc.desc      LRU capacity 7 after 13 inserts keeps k8,k9,k4,k10,k11,k12,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k8,k9,k4,k10,k11,k12,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0021
     * @tc.name      testExtCacheEvict0020
     * @tc.desc      LRU capacity 3 after 6 inserts keeps k1,k4,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k4,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0022
     * @tc.name      testExtCacheEvict0021
     * @tc.desc      LRU capacity 4 after 8 inserts keeps k5,k6,k0,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k0,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0023
     * @tc.name      testExtCacheEvict0022
     * @tc.desc      LRU capacity 5 after 10 inserts keeps k3,k7,k8,k9,k6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k3,k7,k8,k9,k6');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0024
     * @tc.name      testExtCacheEvict0023
     * @tc.desc      LRU capacity 6 after 12 inserts keeps k7,k8,k9,k5,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k5,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0025
     * @tc.name      testExtCacheEvict0024
     * @tc.desc      LRU capacity 7 after 10 inserts keeps k5,k6,k1,k7,k8,k9,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k1,k7,k8,k9,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0026
     * @tc.name      testExtCacheEvict0025
     * @tc.desc      LRU capacity 3 after 7 inserts keeps k5,k6,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0027
     * @tc.name      testExtCacheEvict0026
     * @tc.desc      LRU capacity 4 after 9 inserts keeps k6,k0,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k0,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0028
     * @tc.name      testExtCacheEvict0027
     * @tc.desc      LRU capacity 5 after 11 inserts keeps k7,k8,k9,k6,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k6,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0029
     * @tc.name      testExtCacheEvict0028
     * @tc.desc      LRU capacity 6 after 9 inserts keeps k4,k5,k6,k2,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k2,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0030
     * @tc.name      testExtCacheEvict0029
     * @tc.desc      LRU capacity 7 after 11 inserts keeps k6,k1,k7,k8,k9,k4,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k1,k7,k8,k9,k4,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0031
     * @tc.name      testExtCacheEvict0030
     * @tc.desc      LRU capacity 3 after 8 inserts keeps k6,k4,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k4,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0032
     * @tc.name      testExtCacheEvict0031
     * @tc.desc      LRU capacity 4 after 10 inserts keeps k7,k8,k9,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0033
     * @tc.name      testExtCacheEvict0032
     * @tc.desc      LRU capacity 5 after 8 inserts keeps k4,k5,k6,k3,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k3,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0034
     * @tc.name      testExtCacheEvict0033
     * @tc.desc      LRU capacity 6 after 10 inserts keeps k6,k2,k7,k8,k9,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k2,k7,k8,k9,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0035
     * @tc.name      testExtCacheEvict0034
     * @tc.desc      LRU capacity 7 after 12 inserts keeps k1,k7,k8,k9,k4,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k7,k8,k9,k4,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0036
     * @tc.name      testExtCacheEvict0035
     * @tc.desc      LRU capacity 3 after 9 inserts keeps k4,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0037
     * @tc.name      testExtCacheEvict0036
     * @tc.desc      LRU capacity 4 after 7 inserts keeps k4,k5,k6,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0038
     * @tc.name      testExtCacheEvict0037
     * @tc.desc      LRU capacity 5 after 9 inserts keeps k5,k6,k3,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k3,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0039
     * @tc.name      testExtCacheEvict0038
     * @tc.desc      LRU capacity 6 after 11 inserts keeps k2,k7,k8,k9,k5,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k2,k7,k8,k9,k5,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0040
     * @tc.name      testExtCacheEvict0039
     * @tc.desc      LRU capacity 7 after 13 inserts keeps k8,k9,k4,k10,k11,k12,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k8,k9,k4,k10,k11,k12,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0041
     * @tc.name      testExtCacheEvict0040
     * @tc.desc      LRU capacity 3 after 6 inserts keeps k1,k4,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k4,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0042
     * @tc.name      testExtCacheEvict0041
     * @tc.desc      LRU capacity 4 after 8 inserts keeps k5,k6,k0,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k0,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0043
     * @tc.name      testExtCacheEvict0042
     * @tc.desc      LRU capacity 5 after 10 inserts keeps k3,k7,k8,k9,k6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k3,k7,k8,k9,k6');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0044
     * @tc.name      testExtCacheEvict0043
     * @tc.desc      LRU capacity 6 after 12 inserts keeps k7,k8,k9,k5,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k5,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0045
     * @tc.name      testExtCacheEvict0044
     * @tc.desc      LRU capacity 7 after 10 inserts keeps k5,k6,k1,k7,k8,k9,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k1,k7,k8,k9,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0046
     * @tc.name      testExtCacheEvict0045
     * @tc.desc      LRU capacity 3 after 7 inserts keeps k5,k6,k4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k4');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0047
     * @tc.name      testExtCacheEvict0046
     * @tc.desc      LRU capacity 4 after 9 inserts keeps k6,k0,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k0,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0048
     * @tc.name      testExtCacheEvict0047
     * @tc.desc      LRU capacity 5 after 11 inserts keeps k7,k8,k9,k6,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k6,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0049
     * @tc.name      testExtCacheEvict0048
     * @tc.desc      LRU capacity 6 after 9 inserts keeps k4,k5,k6,k2,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k2,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0050
     * @tc.name      testExtCacheEvict0049
     * @tc.desc      LRU capacity 7 after 11 inserts keeps k6,k1,k7,k8,k9,k4,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k1,k7,k8,k9,k4,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0051
     * @tc.name      testExtCacheEvict0050
     * @tc.desc      LRU capacity 3 after 8 inserts keeps k6,k4,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k4,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0052
     * @tc.name      testExtCacheEvict0051
     * @tc.desc      LRU capacity 4 after 10 inserts keeps k7,k8,k9,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k7,k8,k9,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0053
     * @tc.name      testExtCacheEvict0052
     * @tc.desc      LRU capacity 5 after 8 inserts keeps k4,k5,k6,k3,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k3,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0054
     * @tc.name      testExtCacheEvict0053
     * @tc.desc      LRU capacity 6 after 10 inserts keeps k6,k2,k7,k8,k9,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 10; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k6,k2,k7,k8,k9,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0055
     * @tc.name      testExtCacheEvict0054
     * @tc.desc      LRU capacity 7 after 12 inserts keeps k1,k7,k8,k9,k4,k10,k11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 12; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k7,k8,k9,k4,k10,k11');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0056
     * @tc.name      testExtCacheEvict0055
     * @tc.desc      LRU capacity 3 after 9 inserts keeps k4,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0057
     * @tc.name      testExtCacheEvict0056
     * @tc.desc      LRU capacity 4 after 7 inserts keeps k4,k5,k6,k0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k4,k5,k6,k0');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0058
     * @tc.name      testExtCacheEvict0057
     * @tc.desc      LRU capacity 5 after 9 inserts keeps k5,k6,k3,k7,k8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 5;
      let cache: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k3,k7,k8');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0059
     * @tc.name      testExtCacheEvict0058
     * @tc.desc      LRU capacity 6 after 11 inserts keeps k2,k7,k8,k9,k5,k10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 6;
      let cache: string[] = [];
      for (let index: number = 0; index < 11; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k2,k7,k8,k9,k5,k10');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0060
     * @tc.name      testExtCacheEvict0059
     * @tc.desc      LRU capacity 7 after 13 inserts keeps k8,k9,k4,k10,k11,k12,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 7;
      let cache: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k8,k9,k4,k10,k11,k12,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0061
     * @tc.name      testExtCacheEvict0060
     * @tc.desc      LRU capacity 3 after 6 inserts keeps k1,k4,k5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 3;
      let cache: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k1,k4,k5');
      expect(cache.length).assertLessOrEqual(capacity);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_EVICT_0062
     * @tc.name      testExtCacheEvict0061
     * @tc.desc      LRU capacity 4 after 8 inserts keeps k5,k6,k0,k7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheEvict0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const capacity: number = 4;
      let cache: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        const key: string = 'k' + index;
        cache = cache.filter((item: string) => item !== key);
        cache.push(key);
        if (cache.length > capacity) {
          cache.shift();
        }
        if (index % 3 === 0 && cache.length > 0) {
          const first: string = cache.shift() as string;
          cache.push(first);
        }
      }
      expect(cache.join(',')).assertEqual('k5,k6,k0,k7');
      expect(cache.length).assertLessOrEqual(capacity);
    })
  });
}
