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

const TAG: string = '[Sample_playWithCacheKeyCollision]';
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

export default function playWithCacheKeyCollisionTest(): void {
  describe('playWithCacheKeyCollisionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0001
     * @tc.name      testExtCacheCollision0000
     * @tc.desc      5 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k0', 'k3', 'k2', 'k1', 'k0'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(1);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0002
     * @tc.name      testExtCacheCollision0001
     * @tc.desc      6 keys in 8 buckets -> 6 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k1', 'k0', 'k7', 'k6', 'k5', 'k4'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(6);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0003
     * @tc.name      testExtCacheCollision0002
     * @tc.desc      7 keys in 16 buckets -> 7 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k2', 'k9', 'k0', 'k7', 'k14', 'k5', 'k12'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(7);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0004
     * @tc.name      testExtCacheCollision0003
     * @tc.desc      8 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(4);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0005
     * @tc.name      testExtCacheCollision0004
     * @tc.desc      9 keys in 8 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k4', 'k3', 'k2', 'k1', 'k0', 'k7', 'k6', 'k5', 'k4'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(1);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0006
     * @tc.name      testExtCacheCollision0005
     * @tc.desc      10 keys in 16 buckets -> 10 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k5', 'k12', 'k3', 'k10', 'k1', 'k8', 'k15', 'k6', 'k13', 'k4'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(10);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0007
     * @tc.name      testExtCacheCollision0006
     * @tc.desc      11 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(7);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0008
     * @tc.name      testExtCacheCollision0007
     * @tc.desc      5 keys in 8 buckets -> 5 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k7', 'k6', 'k5', 'k4', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(5);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0009
     * @tc.name      testExtCacheCollision0008
     * @tc.desc      6 keys in 16 buckets -> 6 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k8', 'k15', 'k6', 'k13', 'k4', 'k11'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(6);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0010
     * @tc.name      testExtCacheCollision0009
     * @tc.desc      7 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k1', 'k0', 'k3', 'k2', 'k1', 'k0', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(3);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0011
     * @tc.name      testExtCacheCollision0010
     * @tc.desc      8 keys in 8 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k2', 'k1', 'k0', 'k7', 'k6', 'k5', 'k4', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0012
     * @tc.name      testExtCacheCollision0011
     * @tc.desc      9 keys in 16 buckets -> 9 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k11', 'k2', 'k9', 'k0', 'k7', 'k14', 'k5', 'k12', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(9);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0013
     * @tc.name      testExtCacheCollision0012
     * @tc.desc      10 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k0', 'k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(6);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0014
     * @tc.name      testExtCacheCollision0013
     * @tc.desc      11 keys in 8 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k5', 'k4', 'k3', 'k2', 'k1', 'k0', 'k7', 'k6', 'k5', 'k4', 'k3'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(3);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0015
     * @tc.name      testExtCacheCollision0014
     * @tc.desc      5 keys in 16 buckets -> 5 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k14', 'k5', 'k12', 'k3', 'k10'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(5);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0016
     * @tc.name      testExtCacheCollision0015
     * @tc.desc      6 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k3', 'k2', 'k1', 'k0', 'k3', 'k2'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(2);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0017
     * @tc.name      testExtCacheCollision0016
     * @tc.desc      7 keys in 8 buckets -> 7 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k0', 'k7', 'k6', 'k5', 'k4', 'k3', 'k2'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(7);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0018
     * @tc.name      testExtCacheCollision0017
     * @tc.desc      8 keys in 16 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k1', 'k8', 'k15', 'k6', 'k13', 'k4', 'k11', 'k2'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0019
     * @tc.name      testExtCacheCollision0018
     * @tc.desc      9 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0', 'k3', 'k2'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(5);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0020
     * @tc.name      testExtCacheCollision0019
     * @tc.desc      10 keys in 8 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k3', 'k2', 'k1', 'k0', 'k7', 'k6', 'k5', 'k4', 'k3', 'k2'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(2);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0021
     * @tc.name      testExtCacheCollision0020
     * @tc.desc      11 keys in 16 buckets -> 11 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k4', 'k11', 'k2', 'k9', 'k0', 'k7', 'k14', 'k5', 'k12', 'k3', 'k10'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(11);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0022
     * @tc.name      testExtCacheCollision0021
     * @tc.desc      5 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k1', 'k0', 'k3', 'k2', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(1);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0023
     * @tc.name      testExtCacheCollision0022
     * @tc.desc      6 keys in 8 buckets -> 6 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k6', 'k5', 'k4', 'k3', 'k2', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(6);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0024
     * @tc.name      testExtCacheCollision0023
     * @tc.desc      7 keys in 16 buckets -> 7 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k7', 'k14', 'k5', 'k12', 'k3', 'k10', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(7);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0025
     * @tc.name      testExtCacheCollision0024
     * @tc.desc      8 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k0', 'k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(4);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0026
     * @tc.name      testExtCacheCollision0025
     * @tc.desc      9 keys in 8 buckets -> 8 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k1', 'k0', 'k7', 'k6', 'k5', 'k4', 'k3', 'k2', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(8);
      expect(collisions).assertEqual(1);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0027
     * @tc.name      testExtCacheCollision0026
     * @tc.desc      10 keys in 16 buckets -> 10 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k10', 'k1', 'k8', 'k15', 'k6', 'k13', 'k4', 'k11', 'k2', 'k9'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(10);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0028
     * @tc.name      testExtCacheCollision0027
     * @tc.desc      11 keys in 4 buckets -> 4 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 4;
      const keys: string[] = ['k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1', 'k0', 'k3', 'k2', 'k1'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(4);
      expect(collisions).assertEqual(7);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0029
     * @tc.name      testExtCacheCollision0028
     * @tc.desc      5 keys in 8 buckets -> 5 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 8;
      const keys: string[] = ['k4', 'k3', 'k2', 'k1', 'k0'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(5);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_COLLISION_0030
     * @tc.name      testExtCacheCollision0029
     * @tc.desc      6 keys in 16 buckets -> 6 unique.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheCollision0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buckets: number = 16;
      const keys: string[] = ['k13', 'k4', 'k11', 'k2', 'k9', 'k0'];
      const unique: number = new Set<string>(keys).size;
      const collisions: number = keys.length - unique;
      expect(unique).assertEqual(6);
      expect(collisions).assertEqual(0);
      expect(unique).assertLessOrEqual(keys.length);
      expect(buckets).assertLarger(0);
    })
  });
}
