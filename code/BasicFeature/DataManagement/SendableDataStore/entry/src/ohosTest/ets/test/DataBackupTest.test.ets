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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import { DataBackupManager } from '../../../main/ets/backup/DataBackupManager';
import { StoreType } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataBackupTest(): void {
  describe('DataBackupTest', () => {
    let manager: DataBackupManager = new DataBackupManager();

    beforeAll(() => {
      addLog('DataBackupTest suite started');
    })

    beforeEach(() => {
      manager = new DataBackupManager();
      manager.initialize();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('DataBackupTest suite finished');
    })



    /*
     * @tc.number: SUB_DATA_BACKUP_0100
     * @tc.name: testDataBackup0001
     * @tc.desc: Verify createBackup succeeds with valid name and type.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0001', 0, (done: Function) => {
      runCase('testDataBackup0001', async (): Promise<void> => {
        const result: string = manager.createBackup('backup1', StoreType.PREFERENCES, 100);
        addLog('testDataBackup0001: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(result.indexOf('backup1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_0200
     * @tc.name: testDataBackup0002
     * @tc.desc: Verify createBackup fails with empty name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0002', 0, (done: Function) => {
      runCase('testDataBackup0002', async (): Promise<void> => {
        const result: string = manager.createBackup('', StoreType.RDB, 50);
        addLog('testDataBackup0002: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(result.indexOf('invalid')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_0300
     * @tc.name: testDataBackup0003
     * @tc.desc: Verify createBackup fails with duplicate name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0003', 0, (done: Function) => {
      runCase('testDataBackup0003', async (): Promise<void> => {
        manager.createBackup('dup', StoreType.PREFERENCES, 10);
        const result: string = manager.createBackup('dup', StoreType.RDB, 20);
        addLog('testDataBackup0003: result=%{public}s', result);
        expect(result.indexOf('already exists')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_0400
     * @tc.name: testDataBackup0004
     * @tc.desc: Verify createBackup with RDB store type.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0004', 0, (done: Function) => {
      runCase('testDataBackup0004', async (): Promise<void> => {
        const result: string = manager.createBackup('rdb_backup', StoreType.RDB, 500);
        addLog('testDataBackup0004: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(result.indexOf('500')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_0500
     * @tc.name: testDataBackup0005
     * @tc.desc: Verify restoreBackup succeeds for existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0005', 0, (done: Function) => {
      runCase('testDataBackup0005', async (): Promise<void> => {
        manager.createBackup('restore_me', StoreType.PREFERENCES, 50);
        const result: string = manager.restoreBackup('restore_me');
        addLog('testDataBackup0005: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(result.indexOf('50 entries')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_0600
     * @tc.name: testDataBackup0006
     * @tc.desc: Verify restoreBackup fails for non-existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0006', 0, (done: Function) => {
      runCase('testDataBackup0006', async (): Promise<void> => {
        const result: string = manager.restoreBackup('nonexistent');
        addLog('testDataBackup0006: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_0700
     * @tc.name: testDataBackup0007
     * @tc.desc: Verify deleteBackup removes existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0007', 0, (done: Function) => {
      runCase('testDataBackup0007', async (): Promise<void> => {
        manager.createBackup('del_me', StoreType.PREFERENCES, 10);
        const result: string = manager.deleteBackup('del_me');
        addLog('testDataBackup0007: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const info: string = manager.getBackupInfo('del_me');
        expect(info.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_0800
     * @tc.name: testDataBackup0008
     * @tc.desc: Verify deleteBackup fails for non-existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0008', 0, (done: Function) => {
      runCase('testDataBackup0008', async (): Promise<void> => {
        const result: string = manager.deleteBackup('ghost');
        addLog('testDataBackup0008: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_0900
     * @tc.name: testDataBackup0009
     * @tc.desc: Verify listBackups returns all backups.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0009', 0, (done: Function) => {
      runCase('testDataBackup0009', async (): Promise<void> => {
        manager.createBackup('b1', StoreType.PREFERENCES, 10);
        manager.createBackup('b2', StoreType.RDB, 20);
        const list: string = manager.listBackups();
        addLog('testDataBackup0009: list=%{public}s', list);
        expect(list.indexOf('b1')).assertLargerOrEqual(0);
        expect(list.indexOf('b2')).assertLargerOrEqual(0);
        expect(list.indexOf('2 total')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1000
     * @tc.name: testDataBackup0010
     * @tc.desc: Verify getBackupInfo returns correct backup details.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0010', 0, (done: Function) => {
      runCase('testDataBackup0010', async (): Promise<void> => {
        manager.createBackup('info_test', StoreType.ARRAY, 100);
        const info: string = manager.getBackupInfo('info_test');
        addLog('testDataBackup0010: info=%{public}s', info);
        expect(info.indexOf('info_test')).assertLargerOrEqual(0);
        expect(info.indexOf('100')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_1100
     * @tc.name: testDataBackup0011
     * @tc.desc: Verify setAutoBackup enables auto-backup with interval.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0011', 0, (done: Function) => {
      runCase('testDataBackup0011', async (): Promise<void> => {
        const result: string = manager.setAutoBackup(true, 120000);
        addLog('testDataBackup0011: result=%{public}s', result);
        expect(result.indexOf('enabled=true')).assertLargerOrEqual(0);
        expect(manager.isAutoBackupEnabled()).assertTrue();
        expect(manager.getAutoBackupInterval()).assertEqual(120000);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1200
     * @tc.name: testDataBackup0012
     * @tc.desc: Verify setAutoBackup fails with interval below minimum.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0012', 0, (done: Function) => {
      runCase('testDataBackup0012', async (): Promise<void> => {
        const result: string = manager.setAutoBackup(true, 1000);
        addLog('testDataBackup0012: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isAutoBackupEnabled()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_1300
     * @tc.name: testDataBackup0013
     * @tc.desc: Verify getLatestBackup returns the most recent backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0013', 0, (done: Function) => {
      runCase('testDataBackup0013', async (): Promise<void> => {
        manager.createBackup('old_backup', StoreType.PREFERENCES, 10);
        manager.createBackup('new_backup', StoreType.RDB, 20);
        const latest: string = manager.getLatestBackup();
        addLog('testDataBackup0013: latest=%{public}s', latest);
        expect(latest.indexOf('new_backup')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(latest.indexOf('entries=')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1400
     * @tc.name: testDataBackup0014
     * @tc.desc: Verify getStatistics returns correct backup statistics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0014', 0, (done: Function) => {
      runCase('testDataBackup0014', async (): Promise<void> => {
        manager.createBackup('stat_test', StoreType.PREFERENCES, 50);
        manager.restoreBackup('stat_test');
        const stats: string = manager.getStatistics();
        addLog('testDataBackup0014: stats=%{public}s', stats);
        expect(stats.indexOf('count=1')).assertLargerOrEqual(0);
        expect(stats.indexOf('creates=1')).assertLargerOrEqual(0);
        expect(stats.indexOf('restores=1')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1500
     * @tc.name: testDataBackup0015
     * @tc.desc: Verify getTotalEntryCount sums entries across backups.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0015', 0, (done: Function) => {
      runCase('testDataBackup0015', async (): Promise<void> => {
        manager.createBackup('e1', StoreType.PREFERENCES, 30);
        manager.createBackup('e2', StoreType.RDB, 70);
        const total: number = manager.getTotalEntryCount();
        addLog('testDataBackup0015: total=%{public}d', String(total));
        expect(total).assertEqual(100);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getTotalBackupSize()).assertLarger(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_BACKUP_1600
     * @tc.name: testDataBackup0016
     * @tc.desc: Verify getOldestBackup returns the earliest backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0016', 0, (done: Function) => {
      runCase('testDataBackup0016', async (): Promise<void> => {
        manager.createBackup('old_one', StoreType.PREFERENCES, 10);
        manager.createBackup('new_one', StoreType.RDB, 20);
        const oldest: string = manager.getOldestBackup();
        addLog('testDataBackup0016: oldest=%{public}s', oldest);
        expect(oldest.indexOf('old_one')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(oldest.indexOf('entries=')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1700
     * @tc.name: testDataBackup0017
     * @tc.desc: Verify checkAutoBackup reports disabled when auto-backup off.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0017', 0, (done: Function) => {
      runCase('testDataBackup0017', async (): Promise<void> => {
        const result: string = manager.checkAutoBackup();
        addLog('testDataBackup0017: result=%{public}s', result);
        expect(result.indexOf('disabled')).assertLargerOrEqual(0);
        expect(manager.isAutoBackupEnabled()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1800
     * @tc.name: testDataBackup0018
     * @tc.desc: Verify getTotalBackupSize sums sizes across backups.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0018', 0, (done: Function) => {
      runCase('testDataBackup0018', async (): Promise<void> => {
        manager.createBackup('s1', StoreType.PREFERENCES, 10);
        manager.createBackup('s2', StoreType.RDB, 20);
        const totalSize: number = manager.getTotalBackupSize();
        addLog('testDataBackup0018: totalSize=%{public}d', String(totalSize));
        expect(totalSize).assertEqual(10 * 128 + 20 * 128);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getTotalEntryCount()).assertEqual(30);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_1900
     * @tc.name: testDataBackup0019
     * @tc.desc: Verify verifyBackupIntegrity returns VALID for existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataBackup0019', 0, (done: Function) => {
      runCase('testDataBackup0019', async (): Promise<void> => {
        manager.createBackup('integrity_test', StoreType.PREFERENCES, 50);
        const result: string = manager.verifyBackupIntegrity('integrity_test');
        addLog('testDataBackup0019: result=%{public}s', result);
        expect(result.indexOf('VALID')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('integrity_test')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_2000
     * @tc.name: testDataBackup0020
     * @tc.desc: Verify verifyBackupIntegrity fails for non-existing backup.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataBackup0020', 0, (done: Function) => {
      runCase('testDataBackup0020', async (): Promise<void> => {
        const result: string = manager.verifyBackupIntegrity('nonexistent');
        addLog('testDataBackup0020: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_2100
     * @tc.name: testDataBackup0021
     * @tc.desc: Verify resetStatistics zeroes create/restore/delete counters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0021', 0, (done: Function) => {
      runCase('testDataBackup0021', async (): Promise<void> => {
        manager.createBackup('reset_test', StoreType.PREFERENCES, 10);
        const result: string = manager.resetStatistics();
        addLog('testDataBackup0021: result=%{public}s', result);
        expect(result.indexOf('reset')).assertLargerOrEqual(0);
        const stats: string = manager.getStatistics();
        expect(stats.indexOf('creates=0')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(stats.indexOf('restores=0')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_BACKUP_2200
     * @tc.name: testDataBackup0022
     * @tc.desc: Verify isInitialized returns true after initialize.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataBackup0022', 0, (done: Function) => {
      runCase('testDataBackup0022', async (): Promise<void> => {
        const freshManager: DataBackupManager = new DataBackupManager();
        expect(freshManager.isInitialized()).assertFalse();
        freshManager.initialize();
        expect(freshManager.isInitialized()).assertTrue();
        expect(freshManager.isInitialized()).assertTrue();
        freshManager.release();
      }, done);
    });
  });
}
