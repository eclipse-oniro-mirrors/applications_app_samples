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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0001', 'begin');
      StorageUtils.clear();

      const stats = StorageUtils.getStats();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(0)");
      expect(StorageUtils.size()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#2 assert ' + "expect(StorageUtils.keys().length).assertEqual(0)");
      expect(StorageUtils.keys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#3 assert ' + "expect(StorageUtils.has('absent_key')).assertFalse()");
      expect(StorageUtils.has('absent_key')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#4 assert ' + "expect(StorageUtils.get<string>('absent_key')).assertNull()");
      expect(StorageUtils.get<string>('absent_key')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#5 ' + "stats.totalEntries" + ' = ' + JSON.stringify(stats.totalEntries));
      expect(stats.totalEntries).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#6 ' + "stats.totalAccessCount" + ' = ' + JSON.stringify(stats.totalAccessCount));
      expect(stats.totalAccessCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#7 ' + "stats.expiredEntries" + ' = ' + JSON.stringify(stats.expiredEntries));
      expect(stats.expiredEntries).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0001',
        '#8 ' + "stats.maxSize" + ' = ' + JSON.stringify(stats.maxSize));
      expect(stats.maxSize).assertEqual(MAX_ENTRIES);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0002', 'begin');
      StorageUtils.clear();
      StorageUtils.clear();
      StorageUtils.remove('never_stored');
      StorageUtils.cleanExpired();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(0)");
      expect(StorageUtils.size()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#2 assert ' + "expect(StorageUtils.keys().length).assertEqual(0)");
      expect(StorageUtils.keys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#3 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(0)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#4 assert ' + "expect(StorageUtils.getStats().maxSize).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.getStats().maxSize).assertEqual(MAX_ENTRIES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#5 assert ' + "expect(StorageUtils.has('never_stored')).assertFalse()");
      expect(StorageUtils.has('never_stored')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0002',
        '#6 assert ' + "expect(StorageUtils.get<number>('never_stored')).assertNull()");
      expect(StorageUtils.get<number>('never_stored')).assertNull();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0003', 'begin');
      StorageUtils.clear();
      StorageUtils.put('text', 'BT-Speaker-Pro');
      StorageUtils.put('level', 65);
      StorageUtils.put('enabled', true);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#1 assert ' + "expect(StorageUtils.get<string>('text')).assertEqual('BT-Speaker-Pro')");
      expect(StorageUtils.get<string>('text')).assertEqual('BT-Speaker-Pro');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#2 assert ' + "expect(StorageUtils.get<number>('level')).assertEqual(65)");
      expect(StorageUtils.get<number>('level')).assertEqual(65);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#3 assert ' + "expect(StorageUtils.get<boolean>('enabled')).assertTrue()");
      expect(StorageUtils.get<boolean>('enabled')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#4 assert ' + "expect(StorageUtils.size()).assertEqual(3)");
      expect(StorageUtils.size()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#5 assert ' + "expect(StorageUtils.has('text')).assertTrue()");
      expect(StorageUtils.has('text')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#6 assert ' + "expect(StorageUtils.has('level')).assertTrue()");
      expect(StorageUtils.has('level')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0003',
        '#7 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(3)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0004', 'begin');
      StorageUtils.clear();
      const deviceIds: string[] = ['11:22:33:44:55:66'];
      StorageUtils.put('device_ids', deviceIds);
      const cached: string[] | null = StorageUtils.get<string[]>('device_ids');
      deviceIds.push('77:88:99:11:22:33');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#1 ' + "cached === deviceIds" + ' = ' + JSON.stringify(cached === deviceIds));
      expect(cached === deviceIds).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#2 ' + "cached!.length" + ' = ' + JSON.stringify(cached!.length));
      expect(cached!.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#3 ' + "cached![1]" + ' = ' + JSON.stringify(cached![1]));
      expect(cached![1]).assertEqual('77:88:99:11:22:33');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#4 assert ' + "expect(StorageUtils.get<string[]>('device_ids') === deviceIds).assertTrue()");
      expect(StorageUtils.get<string[]>('device_ids') === deviceIds).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#5 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#6 assert ' + "expect(StorageUtils.keys()[0]).assertEqual('device_ids')");
      expect(StorageUtils.keys()[0]).assertEqual('device_ids');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0004',
        '#7 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(2)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0005', 'begin');
      StorageUtils.clear();
      StorageUtils.put('volume', 10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#1 assert ' + "expect(StorageUtils.get<number>('volume')).assertEqual(10)");
      expect(StorageUtils.get<number>('volume')).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#2 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(1)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(1);

      StorageUtils.put('volume', 20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#3 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#4 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(0)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#5 assert ' + "expect(StorageUtils.get<number>('volume')).assertEqual(20)");
      expect(StorageUtils.get<number>('volume')).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#6 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(1)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#7 assert ' + "expect(StorageUtils.keys().length).assertEqual(1)");
      expect(StorageUtils.keys().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0005',
        '#8 assert ' + "expect(StorageUtils.keys()[0]).assertEqual('volume')");
      expect(StorageUtils.keys()[0]).assertEqual('volume');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0006', 'begin');
      StorageUtils.clear();
      StorageUtils.put('drop', 'gone-soon');
      StorageUtils.put('keep', 'stays');
      StorageUtils.remove('drop');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#1 assert ' + "expect(StorageUtils.has('drop')).assertFalse()");
      expect(StorageUtils.has('drop')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#2 assert ' + "expect(StorageUtils.get<string>('drop')).assertNull()");
      expect(StorageUtils.get<string>('drop')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#3 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      StorageUtils.remove('drop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#4 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#5 assert ' + "expect(StorageUtils.get<string>('keep')).assertEqual('stays')");
      expect(StorageUtils.get<string>('keep')).assertEqual('stays');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#6 assert ' + "expect(StorageUtils.keys()[0]).assertEqual('keep')");
      expect(StorageUtils.keys()[0]).assertEqual('keep');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0006',
        '#7 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(1)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0007', 'begin');
      StorageUtils.clear();
      StorageUtils.put('a', '1');
      StorageUtils.put('b', '2');
      StorageUtils.put('c', '3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(3)");
      expect(StorageUtils.size()).assertEqual(3);

      StorageUtils.clear();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#2 assert ' + "expect(StorageUtils.size()).assertEqual(0)");
      expect(StorageUtils.size()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#3 assert ' + "expect(StorageUtils.keys().length).assertEqual(0)");
      expect(StorageUtils.keys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#4 assert ' + "expect(StorageUtils.get<string>('a')).assertNull()");
      expect(StorageUtils.get<string>('a')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#5 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(0)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);

      StorageUtils.put('a', '4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#6 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#7 assert ' + "expect(StorageUtils.get<string>('a')).assertEqual('4')");
      expect(StorageUtils.get<string>('a')).assertEqual('4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0007',
        '#8 assert ' + "expect(StorageUtils.get<string>('b')).assertNull()");
      expect(StorageUtils.get<string>('b')).assertNull();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0008', 'begin');
      StorageUtils.clear();
      StorageUtils.put('first', 1);
      StorageUtils.put('second', 2);
      StorageUtils.put('third', 3);
      StorageUtils.put('first', 9);

      const listed: string[] = StorageUtils.keys();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#1 ' + "listed.length" + ' = ' + JSON.stringify(listed.length));
      expect(listed.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#2 ' + "listed[0]" + ' = ' + JSON.stringify(listed[0]));
      expect(listed[0]).assertEqual('first');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#3 ' + "listed[1]" + ' = ' + JSON.stringify(listed[1]));
      expect(listed[1]).assertEqual('second');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#4 ' + "listed[2]" + ' = ' + JSON.stringify(listed[2]));
      expect(listed[2]).assertEqual('third');

      listed.push('injected');
      listed.splice(0, 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#5 assert ' + "expect(StorageUtils.keys().length).assertEqual(3)");
      expect(StorageUtils.keys().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#6 assert ' + "expect(StorageUtils.keys()[0]).assertEqual('first')");
      expect(StorageUtils.keys()[0]).assertEqual('first');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#7 assert ' + "expect(StorageUtils.has('injected')).assertFalse()");
      expect(StorageUtils.has('injected')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0008',
        '#8 assert ' + "expect(StorageUtils.get<number>('first')).assertEqual(9)");
      expect(StorageUtils.get<number>('first')).assertEqual(9);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0009', 'begin');
      StorageUtils.clear();
      StorageUtils.put('stale_read', 'old', EXPIRED_TTL);
      StorageUtils.put('stale_probe', 'old', EXPIRED_TTL);
      StorageUtils.put('fresh', 'new', LONG_TTL);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(3)");
      expect(StorageUtils.size()).assertEqual(3);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#2 assert ' + "expect(StorageUtils.get<string>('stale_read')).assertNull()");
      expect(StorageUtils.get<string>('stale_read')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#3 assert ' + "expect(StorageUtils.size()).assertEqual(2)");
      expect(StorageUtils.size()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#4 assert ' + "expect(StorageUtils.has('stale_read')).assertFalse()");
      expect(StorageUtils.has('stale_read')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#5 assert ' + "expect(StorageUtils.has('stale_probe')).assertFalse()");
      expect(StorageUtils.has('stale_probe')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#6 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#7 assert ' + "expect(StorageUtils.get<string>('fresh')).assertEqual('new')");
      expect(StorageUtils.get<string>('fresh')).assertEqual('new');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#8 assert ' + "expect(StorageUtils.has('fresh')).assertTrue()");
      expect(StorageUtils.has('fresh')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0009',
        '#9 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0010', 'begin');
      StorageUtils.clear();
      StorageUtils.put('live_one', 'keep', LONG_TTL);
      StorageUtils.put('dead_one', 'drop', EXPIRED_TTL);
      StorageUtils.put('dead_two', 'drop', EXPIRED_TTL);
      StorageUtils.put('live_two', 'keep', LONG_TTL);

      const beforeClean = StorageUtils.getStats();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#1 ' + "beforeClean.totalEntries" + ' = ' + JSON.stringify(beforeClean.totalEntries));
      expect(beforeClean.totalEntries).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#2 ' + "beforeClean.expiredEntries" + ' = ' + JSON.stringify(beforeClean.expiredEntries));
      expect(beforeClean.expiredEntries).assertEqual(2);

      StorageUtils.cleanExpired();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#3 assert ' + "expect(StorageUtils.size()).assertEqual(2)");
      expect(StorageUtils.size()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#4 assert ' + "expect(StorageUtils.has('live_one')).assertTrue()");
      expect(StorageUtils.has('live_one')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#5 assert ' + "expect(StorageUtils.has('live_two')).assertTrue()");
      expect(StorageUtils.has('live_two')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#6 assert ' + "expect(StorageUtils.keys().indexOf('dead_one')).assertEqual(-1)");
      expect(StorageUtils.keys().indexOf('dead_one')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#7 assert ' + "expect(StorageUtils.keys().indexOf('dead_two')).assertEqual(-1)");
      expect(StorageUtils.keys().indexOf('dead_two')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#8 assert ' + "expect(StorageUtils.get<string>('live_one')).assertEqual('keep')");
      expect(StorageUtils.get<string>('live_one')).assertEqual('keep');

      StorageUtils.cleanExpired();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0010',
        '#9 assert ' + "expect(StorageUtils.size()).assertEqual(2)");
      expect(StorageUtils.size()).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0011', 'begin');
      StorageUtils.clear();
      StorageUtils.put('session', 'active');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#1 assert ' + "expect(StorageUtils.get<string>('session')).assertEqual('active')");
      expect(StorageUtils.get<string>('session')).assertEqual('active');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#2 assert ' + "expect(StorageUtils.get<string>('session')).assertEqual('active')");
      expect(StorageUtils.get<string>('session')).assertEqual('active');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#3 assert ' + "expect(StorageUtils.has('session')).assertTrue()");
      expect(StorageUtils.has('session')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#4 assert ' + "expect(StorageUtils.size()).assertEqual(1)");
      expect(StorageUtils.size()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#5 assert ' + "expect(StorageUtils.getStats().expiredEntries).assertEqual(0)");
      expect(StorageUtils.getStats().expiredEntries).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#6 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(2)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0011',
        '#7 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(1)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0012', 'begin');
      StorageUtils.clear();
      StorageUtils.put('s1', 'a');
      StorageUtils.put('s2', 'b');
      StorageUtils.put('s3', 'c', EXPIRED_TTL);
      StorageUtils.get<string>('s1');
      StorageUtils.get<string>('s1');
      StorageUtils.get<string>('s2');

      const stats = StorageUtils.getStats();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#1 ' + "stats.totalEntries" + ' = ' + JSON.stringify(stats.totalEntries));
      expect(stats.totalEntries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#2 ' + "stats.totalAccessCount" + ' = ' + JSON.stringify(stats.totalAccessCount));
      expect(stats.totalAccessCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#3 ' + "stats.expiredEntries" + ' = ' + JSON.stringify(stats.expiredEntries));
      expect(stats.expiredEntries).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#4 ' + "stats.maxSize" + ' = ' + JSON.stringify(stats.maxSize));
      expect(stats.maxSize).assertEqual(MAX_ENTRIES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#5 assert ' + "expect(StorageUtils.size()).assertEqual(3)");
      expect(StorageUtils.size()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#6 assert ' + "expect(stats.totalEntries === StorageUtils.size()).assertTrue()");
      expect(stats.totalEntries === StorageUtils.size()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0012',
        '#7 assert ' + "expect(StorageUtils.get<string>('s1')).assertEqual('a')");
      expect(StorageUtils.get<string>('s1')).assertEqual('a');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0013', 'begin');
      StorageUtils.clear();
      for (let i: number = 0; i < MAX_ENTRIES; i++) {
        StorageUtils.put('cap_' + i, i);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);

      StorageUtils.get<number>('cap_5');
      StorageUtils.put('cap_overflow', 999);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#2 assert ' + "expect(StorageUtils.size()).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#3 assert ' + "expect(StorageUtils.has('cap_0')).assertFalse()");
      expect(StorageUtils.has('cap_0')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#4 assert ' + "expect(StorageUtils.has('cap_1')).assertTrue()");
      expect(StorageUtils.has('cap_1')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#5 assert ' + "expect(StorageUtils.has('cap_5')).assertTrue()");
      expect(StorageUtils.has('cap_5')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#6 assert ' + "expect(StorageUtils.has('cap_overflow')).assertTrue()");
      expect(StorageUtils.has('cap_overflow')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#7 assert ' + "expect(StorageUtils.get<number>('cap_overflow')).assertEqual(999)");
      expect(StorageUtils.get<number>('cap_overflow')).assertEqual(999);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#8 assert ' + "expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0013',
        '#9 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(MAX_ENTRIES);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0014', 'begin');
      StorageUtils.clear();
      for (let i: number = 0; i < MAX_ENTRIES; i++) {
        StorageUtils.put('ovf_' + i, i);
      }
      StorageUtils.put('ovf_extra_1', 1);
      StorageUtils.put('ovf_extra_2', 2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.size()).assertEqual(MAX_ENTRIES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#2 assert ' + "expect(StorageUtils.has('ovf_0')).assertFalse()");
      expect(StorageUtils.has('ovf_0')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#3 assert ' + "expect(StorageUtils.has('ovf_1')).assertFalse()");
      expect(StorageUtils.has('ovf_1')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#4 assert ' + "expect(StorageUtils.has('ovf_2')).assertTrue()");
      expect(StorageUtils.has('ovf_2')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#5 assert ' + "expect(StorageUtils.has('ovf_extra_1')).assertTrue()");
      expect(StorageUtils.has('ovf_extra_1')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#6 assert ' + "expect(StorageUtils.has('ovf_extra_2')).assertTrue()");
      expect(StorageUtils.has('ovf_extra_2')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#7 assert ' + "expect(StorageUtils.get<number>('ovf_199')).assertEqual(199)");
      expect(StorageUtils.get<number>('ovf_199')).assertEqual(199);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0014',
        '#8 assert ' + "expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES)");
      expect(StorageUtils.keys().length).assertEqual(MAX_ENTRIES);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0015', 'begin');
      StorageUtils.clear();
      for (let i: number = 0; i < 20; i++) {
        StorageUtils.put('rel_' + i, i);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#1 assert ' + "expect(StorageUtils.size()).assertEqual(20)");
      expect(StorageUtils.size()).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#2 assert ' + "expect(StorageUtils.get<number>('rel_19')).assertEqual(19)");
      expect(StorageUtils.get<number>('rel_19')).assertEqual(19);

      StorageUtils.clear();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#3 assert ' + "expect(StorageUtils.size()).assertEqual(0)");
      expect(StorageUtils.size()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#4 assert ' + "expect(StorageUtils.keys().length).assertEqual(0)");
      expect(StorageUtils.keys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#5 assert ' + "expect(StorageUtils.get<number>('rel_0')).assertNull()");
      expect(StorageUtils.get<number>('rel_0')).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#6 assert ' + "expect(StorageUtils.getStats().totalAccessCount).assertEqual(0)");
      expect(StorageUtils.getStats().totalAccessCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#7 assert ' + "expect(StorageUtils.getStats().totalEntries).assertEqual(0)");
      expect(StorageUtils.getStats().totalEntries).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStorageUtils0015',
        '#8 assert ' + "expect(StorageUtils.has('rel_19')).assertFalse()");
      expect(StorageUtils.has('rel_19')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStorageUtils0015', 'end');
    });
  });
}
