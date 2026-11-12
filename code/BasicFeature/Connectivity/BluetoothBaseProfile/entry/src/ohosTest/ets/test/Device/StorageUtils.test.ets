/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { StorageUtils } from 'library';

/**
 * Test suite for StorageUtils.
 * @since 26.0.0
 */
const MAX_ENTRIES: number = 200;
const EXPIRED_TTL: number = -1000;
const LONG_TTL: number = 600000;

export default function storageUtilsTest(): void {
  describe('StorageUtilsTest', () => {
    // ==================== empty cache baseline (2 cases) ====================

    /*
     * @tc.number: SUB_STORAGE_UTILS_0100
     * @tc.name: testStorageUtils0001
     * @tc.desc: Clear the cache and confirm the empty baseline of every read accessor.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0001', 0, () => {
      StorageUtils.clear();

      const stats = StorageUtils.getStats();
      expect(StorageUtils.size()).assertEqual(0);
      expect(StorageUtils.keys().length).assertEqual(0);
      expect(StorageUtils.has('absent_key')).assertFalse();
      expect(StorageUtils.get<string>('absent_key')).assertNull();
      expect(stats.totalEntries).assertEqual(0);
      expect(stats.totalAccessCount).assertEqual(0);
      expect(stats.expiredEntries).assertEqual(0);
      expect(stats.maxSize).assertEqual(MAX_ENTRIES);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_0200
     * @tc.name: testStorageUtils0002
     * @tc.desc: Clear an already empty cache and keep the baseline untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0002', 0, () => {
      StorageUtils.clear();
      StorageUtils.clear();
      StorageUtils.remove('never_stored');
      StorageUtils.cleanExpired();

      expect(StorageUtils.size()).assertEqual(0);
      expect(StorageUtils.keys().length).assertEqual(0);
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);
      expect(StorageUtils.getStats().maxSize).assertEqual(MAX_ENTRIES);
      expect(StorageUtils.has('never_stored')).assertFalse();
      expect(StorageUtils.get<number>('never_stored')).assertNull();
    });

    // ==================== access and reference semantics (3 cases) ====================

    /*
     * @tc.number: SUB_STORAGE_UTILS_0300
     * @tc.name: testStorageUtils0003
     * @tc.desc: Store string, number and boolean payloads and read them back unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0003', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('text', 'BT-Speaker-Pro');
      StorageUtils.put('level', 65);
      StorageUtils.put('enabled', true);

      expect(StorageUtils.get<string>('text')).assertEqual('BT-Speaker-Pro');
      expect(StorageUtils.get<number>('level')).assertEqual(65);
      expect(StorageUtils.get<boolean>('enabled')).assertTrue();
      expect(StorageUtils.size()).assertEqual(3);
      expect(StorageUtils.has('text')).assertTrue();
      expect(StorageUtils.has('level')).assertTrue();
      expect(StorageUtils.getStats().totalEntries).assertEqual(3);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_0400
     * @tc.name: testStorageUtils0004
     * @tc.desc: Keep the very same array instance when reading a cached collection.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0004', 0, () => {
      StorageUtils.clear();
      const deviceIds: string[] = ['11:22:33:44:55:66'];
      StorageUtils.put('device_ids', deviceIds);
      const cached: string[] | null = StorageUtils.get<string[]>('device_ids');
      deviceIds.push('77:88:99:11:22:33');

      expect(cached === deviceIds).assertTrue();
      expect(cached!.length).assertEqual(2);
      expect(cached![1]).assertEqual('77:88:99:11:22:33');
      expect(StorageUtils.get<string[]>('device_ids') === deviceIds).assertTrue();
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.keys()[0]).assertEqual('device_ids');
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(2);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_0500
     * @tc.name: testStorageUtils0005
     * @tc.desc: Overwrite a cached key without growing the cache and reset its access counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0005', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('volume', 10);
      expect(StorageUtils.get<number>('volume')).assertEqual(10);
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(1);

      StorageUtils.put('volume', 20);
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(0);
      expect(StorageUtils.get<number>('volume')).assertEqual(20);
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(1);
      expect(StorageUtils.keys().length).assertEqual(1);
      expect(StorageUtils.keys()[0]).assertEqual('volume');
    });

    // ==================== delete and cleanup (2 cases) ====================

    /*
     * @tc.number: SUB_STORAGE_UTILS_0600
     * @tc.name: testStorageUtils0006
     * @tc.desc: Remove one entry and confirm repeated removal is harmless to the remaining data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0006', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('drop', 'gone-soon');
      StorageUtils.put('keep', 'stays');
      StorageUtils.remove('drop');

      expect(StorageUtils.has('drop')).assertFalse();
      expect(StorageUtils.get<string>('drop')).assertNull();
      expect(StorageUtils.size()).assertEqual(1);
      StorageUtils.remove('drop');
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.get<string>('keep')).assertEqual('stays');
      expect(StorageUtils.keys()[0]).assertEqual('keep');
      expect(StorageUtils.getStats().totalEntries).assertEqual(1);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_0700
     * @tc.name: testStorageUtils0007
     * @tc.desc: Clear a filled cache and refill it afterwards without leftover entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0007', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('a', '1');
      StorageUtils.put('b', '2');
      StorageUtils.put('c', '3');
      expect(StorageUtils.size()).assertEqual(3);

      StorageUtils.clear();
      expect(StorageUtils.size()).assertEqual(0);
      expect(StorageUtils.keys().length).assertEqual(0);
      expect(StorageUtils.get<string>('a')).assertNull();
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);

      StorageUtils.put('a', '4');
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.get<string>('a')).assertEqual('4');
      expect(StorageUtils.get<string>('b')).assertNull();
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_0800
     * @tc.name: testStorageUtils0008
     * @tc.desc: List cache keys in insertion order and treat the returned array as a copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0008', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('first', 1);
      StorageUtils.put('second', 2);
      StorageUtils.put('third', 3);
      StorageUtils.put('first', 9);

      const listed: string[] = StorageUtils.keys();
      expect(listed.length).assertEqual(3);
      expect(listed[0]).assertEqual('first');
      expect(listed[1]).assertEqual('second');
      expect(listed[2]).assertEqual('third');

      listed.push('injected');
      listed.splice(0, 1);
      expect(StorageUtils.keys().length).assertEqual(3);
      expect(StorageUtils.keys()[0]).assertEqual('first');
      expect(StorageUtils.has('injected')).assertFalse();
      expect(StorageUtils.get<number>('first')).assertEqual(9);
    });

    // ==================== expiration policy (3 cases) ====================

    /*
     * @tc.number: SUB_STORAGE_UTILS_0900
     * @tc.name: testStorageUtils0009
     * @tc.desc: Expire an entry through its time to live and drop it on the next read.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0009', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('stale_read', 'old', EXPIRED_TTL);
      StorageUtils.put('stale_probe', 'old', EXPIRED_TTL);
      StorageUtils.put('fresh', 'new', LONG_TTL);
      expect(StorageUtils.size()).assertEqual(3);

      expect(StorageUtils.get<string>('stale_read')).assertNull();
      expect(StorageUtils.size()).assertEqual(2);
      expect(StorageUtils.has('stale_read')).assertFalse();
      expect(StorageUtils.has('stale_probe')).assertFalse();
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.get<string>('fresh')).assertEqual('new');
      expect(StorageUtils.has('fresh')).assertTrue();
      expect(StorageUtils.size()).assertEqual(1);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_1000
     * @tc.name: testStorageUtils0010
     * @tc.desc: Clean only the expired entries while the live entries stay addressable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0010', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('live_one', 'keep', LONG_TTL);
      StorageUtils.put('dead_one', 'drop', EXPIRED_TTL);
      StorageUtils.put('dead_two', 'drop', EXPIRED_TTL);
      StorageUtils.put('live_two', 'keep', LONG_TTL);

      const beforeClean = StorageUtils.getStats();
      expect(beforeClean.totalEntries).assertEqual(4);
      expect(beforeClean.expiredEntries).assertEqual(2);

      StorageUtils.cleanExpired();
      expect(StorageUtils.size()).assertEqual(2);
      expect(StorageUtils.has('live_one')).assertTrue();
      expect(StorageUtils.has('live_two')).assertTrue();
      expect(StorageUtils.keys().indexOf('dead_one')).assertEqual(-1);
      expect(StorageUtils.keys().indexOf('dead_two')).assertEqual(-1);
      expect(StorageUtils.get<string>('live_one')).assertEqual('keep');

      StorageUtils.cleanExpired();
      expect(StorageUtils.size()).assertEqual(2);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_1100
     * @tc.name: testStorageUtils0011
     * @tc.desc: Keep default lifetime entries readable across repeated accesses.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0011', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('session', 'active');

      expect(StorageUtils.get<string>('session')).assertEqual('active');
      expect(StorageUtils.get<string>('session')).assertEqual('active');
      expect(StorageUtils.has('session')).assertTrue();
      expect(StorageUtils.size()).assertEqual(1);
      expect(StorageUtils.getStats().expiredEntries).assertEqual(0);
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(2);
      expect(StorageUtils.getStats().totalEntries).assertEqual(1);
    });

    // ==================== statistics and capacity upper limit (3 cases) ====================

    /*
     * @tc.number: SUB_STORAGE_UTILS_1200
     * @tc.name: testStorageUtils0012
     * @tc.desc: Aggregate entry and access counters in the statistics snapshot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0012', 0, () => {
      StorageUtils.clear();
      StorageUtils.put('s1', 'a');
      StorageUtils.put('s2', 'b');
      StorageUtils.put('s3', 'c', EXPIRED_TTL);
      StorageUtils.get<string>('s1');
      StorageUtils.get<string>('s1');
      StorageUtils.get<string>('s2');

      const stats = StorageUtils.getStats();
      expect(stats.totalEntries).assertEqual(3);
      expect(stats.totalAccessCount).assertEqual(3);
      expect(stats.expiredEntries).assertEqual(1);
      expect(stats.maxSize).assertEqual(MAX_ENTRIES);
      expect(StorageUtils.size()).assertEqual(3);
      expect(stats.totalEntries === StorageUtils.size()).assertTrue();
      expect(StorageUtils.get<string>('s1')).assertEqual('a');
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_1300
     * @tc.name: testStorageUtils0013
     * @tc.desc: Fill the cache to its capacity and evict the least accessed entry on overflow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0013', 0, () => {
      StorageUtils.clear();
      for (let i: number = 0; i < MAX_ENTRIES; i++) {
        StorageUtils.put('cap_' + i, i);
      }
      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);

      StorageUtils.get<number>('cap_5');
      StorageUtils.put('cap_overflow', 999);

      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);
      expect(StorageUtils.has('cap_0')).assertFalse();
      expect(StorageUtils.has('cap_1')).assertTrue();
      expect(StorageUtils.has('cap_5')).assertTrue();
      expect(StorageUtils.has('cap_overflow')).assertTrue();
      expect(StorageUtils.get<number>('cap_overflow')).assertEqual(999);
      expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES);
      expect(StorageUtils.getStats().totalEntries).assertEqual(MAX_ENTRIES);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_1400
     * @tc.name: testStorageUtils0014
     * @tc.desc: Evict one more entry on every write beyond the configured capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStorageUtils0014', 0, () => {
      StorageUtils.clear();
      for (let i: number = 0; i < MAX_ENTRIES; i++) {
        StorageUtils.put('ovf_' + i, i);
      }
      StorageUtils.put('ovf_extra_1', 1);
      StorageUtils.put('ovf_extra_2', 2);

      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);
      expect(StorageUtils.has('ovf_0')).assertFalse();
      expect(StorageUtils.has('ovf_1')).assertFalse();
      expect(StorageUtils.has('ovf_2')).assertTrue();
      expect(StorageUtils.has('ovf_extra_1')).assertTrue();
      expect(StorageUtils.has('ovf_extra_2')).assertTrue();
      expect(StorageUtils.get<number>('ovf_199')).assertEqual(199);
      expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES);
    });

    /*
     * @tc.number: SUB_STORAGE_UTILS_1500
     * @tc.name: testStorageUtils0015
     * @tc.desc: Release the whole cache after a capacity run and return to the empty baseline.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStorageUtils0015', 0, () => {
      StorageUtils.clear();
      for (let i: number = 0; i < 20; i++) {
        StorageUtils.put('rel_' + i, i);
      }
      expect(StorageUtils.size()).assertEqual(20);
      expect(StorageUtils.get<number>('rel_19')).assertEqual(19);

      StorageUtils.clear();
      expect(StorageUtils.size()).assertEqual(0);
      expect(StorageUtils.keys().length).assertEqual(0);
      expect(StorageUtils.get<number>('rel_0')).assertNull();
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(0);
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);
      expect(StorageUtils.has('rel_19')).assertFalse();
    });
  });
}
