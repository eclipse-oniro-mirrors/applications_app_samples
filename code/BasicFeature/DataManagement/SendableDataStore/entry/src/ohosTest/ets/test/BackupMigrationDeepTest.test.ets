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
import { runCase, addLog, getTestContext } from '../testkit/SharedDriver';
import { common } from '@kit.AbilityKit';
import { DataBackupManager } from '../../../main/ets/backup/DataBackupManager';
import { DataMigrationManager } from '../../../main/ets/migration/DataMigrationManager';
import { StoreType, MigrationStatus } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function createDeepBackup(): DataBackupManager {
    return new DataBackupManager();
}

function createDeepMigration(): DataMigrationManager {
    return new DataMigrationManager();
}

export default function backupMigrationDeepTest(): void {
    describe('BackupMigrationDeepTest', () => {
        let backupMgr: DataBackupManager = createDeepBackup();
        let migrationMgr: DataMigrationManager = createDeepMigration();

        beforeAll(() => {
            addLog('BackupMigrationDeepTest suite started');
        })

        beforeEach(() => {
            backupMgr = createDeepBackup();
            migrationMgr = createDeepMigration();
        })

        afterEach(() => {
            backupMgr.release();
            migrationMgr.release();
        })

        afterAll(() => {
            addLog('BackupMigrationDeepTest suite finished');
        })



        /*
         * @tc.number: SUB_DEEP_BKM_0100
         * @tc.name: testDeepBkm0001
         * @tc.desc: Verify backup initialize succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0001', 0, (done: Function) => {
            runCase('testDeepBkm0001', async (): Promise<void> => {
                const result: string = backupMgr.initialize();
                addLog('testDeepBkm0001: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(backupMgr.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0200
         * @tc.name: testDeepBkm0002
         * @tc.desc: Verify createBackup with valid name.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0002', 0, (done: Function) => {
            runCase('testDeepBkm0002', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('backup1', StoreType.PREFERENCES, 10);
                addLog('testDeepBkm0002: result=%{public}s', result);
                expect(result.indexOf('createBackup completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0300
         * @tc.name: testDeepBkm0003
         * @tc.desc: Verify createBackup with invalid name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0003', 0, (done: Function) => {
            runCase('testDeepBkm0003', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('', StoreType.RDB, 5);
                addLog('testDeepBkm0003: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0400
         * @tc.name: testDeepBkm0004
         * @tc.desc: Verify createBackup duplicate name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0004', 0, (done: Function) => {
            runCase('testDeepBkm0004', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('dup', StoreType.PREFERENCES, 10);
                const result: string = backupMgr.createBackup('dup', StoreType.RDB, 20);
                addLog('testDeepBkm0004: result=%{public}s', result);
                expect(result.indexOf('already exists')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0500
         * @tc.name: testDeepBkm0005
         * @tc.desc: Verify createBackup with RDB store type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0005', 0, (done: Function) => {
            runCase('testDeepBkm0005', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('rdbBackup', StoreType.RDB, 50);
                addLog('testDeepBkm0005: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0600
         * @tc.name: testDeepBkm0006
         * @tc.desc: Verify createBackup increments create count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0006', 0, (done: Function) => {
            runCase('testDeepBkm0006', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('b1', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('b2', StoreType.RDB, 10);
                backupMgr.createBackup('b3', StoreType.ARRAY, 15);
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0006: stats=%{public}s', stats);
                expect(stats.indexOf('creates=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0700
         * @tc.name: testDeepBkm0007
         * @tc.desc: Verify createBackup with zero entries.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0007', 0, (done: Function) => {
            runCase('testDeepBkm0007', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('empty', StoreType.PREFERENCES, 0);
                addLog('testDeepBkm0007: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0800
         * @tc.name: testDeepBkm0008
         * @tc.desc: Verify createBackup with large entry count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0008', 0, (done: Function) => {
            runCase('testDeepBkm0008', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('large', StoreType.RDB, 10000);
                addLog('testDeepBkm0008: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_0900
         * @tc.name: testDeepBkm0009
         * @tc.desc: Verify initialize resets create count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0009', 0, (done: Function) => {
            runCase('testDeepBkm0009', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('before', StoreType.PREFERENCES, 5);
                backupMgr.initialize();
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0009: stats=%{public}s', stats);
                expect(stats.indexOf('creates=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1000
         * @tc.name: testDeepBkm0010
         * @tc.desc: Verify createBackup with all store types.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0010', 0, (done: Function) => {
            runCase('testDeepBkm0010', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('pref', StoreType.PREFERENCES, 1);
                backupMgr.createBackup('rdb', StoreType.RDB, 2);
                backupMgr.createBackup('arr', StoreType.ARRAY, 3);
                backupMgr.createBackup('map', StoreType.MAP, 4);
                backupMgr.createBackup('que', StoreType.QUEUE, 5);
                backupMgr.createBackup('rec', StoreType.RECORD, 6);
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0010: stats=%{public}s', stats);
                expect(stats.indexOf('creates=6')).assertLargerOrEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_1100
         * @tc.name: testDeepBkm0011
         * @tc.desc: Verify restoreBackup succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0011', 0, (done: Function) => {
            runCase('testDeepBkm0011', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('restore1', StoreType.PREFERENCES, 10);
                const result: string = backupMgr.restoreBackup('restore1');
                addLog('testDeepBkm0011: result=%{public}s', result);
                expect(result.indexOf('restoreBackup completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1200
         * @tc.name: testDeepBkm0012
         * @tc.desc: Verify restoreBackup nonexistent fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0012', 0, (done: Function) => {
            runCase('testDeepBkm0012', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.restoreBackup('ghost');
                addLog('testDeepBkm0012: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1300
         * @tc.name: testDeepBkm0013
         * @tc.desc: Verify restoreBackup with invalid name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0013', 0, (done: Function) => {
            runCase('testDeepBkm0013', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.restoreBackup('');
                addLog('testDeepBkm0013: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1400
         * @tc.name: testDeepBkm0014
         * @tc.desc: Verify deleteBackup succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0014', 0, (done: Function) => {
            runCase('testDeepBkm0014', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('del1', StoreType.PREFERENCES, 5);
                const result: string = backupMgr.deleteBackup('del1');
                addLog('testDeepBkm0014: result=%{public}s', result);
                expect(result.indexOf('deleteBackup completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1500
         * @tc.name: testDeepBkm0015
         * @tc.desc: Verify deleteBackup nonexistent fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0015', 0, (done: Function) => {
            runCase('testDeepBkm0015', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.deleteBackup('nonexistent');
                addLog('testDeepBkm0015: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1600
         * @tc.name: testDeepBkm0016
         * @tc.desc: Verify getBackupInfo returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0016', 0, (done: Function) => {
            runCase('testDeepBkm0016', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('info1', StoreType.RDB, 25);
                const info: string = backupMgr.getBackupInfo('info1');
                addLog('testDeepBkm0016: info=%{public}s', info);
                expect(info.indexOf('BackupInfo')).assertLargerOrEqual(0);
                expect(info.indexOf('info1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1700
         * @tc.name: testDeepBkm0017
         * @tc.desc: Verify getBackupInfo nonexistent returns not found.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0017', 0, (done: Function) => {
            runCase('testDeepBkm0017', async (): Promise<void> => {
                backupMgr.initialize();
                const info: string = backupMgr.getBackupInfo('missing');
                addLog('testDeepBkm0017: info=%{public}s', info);
                expect(info.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1800
         * @tc.name: testDeepBkm0018
         * @tc.desc: Verify listBackups with multiple backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0018', 0, (done: Function) => {
            runCase('testDeepBkm0018', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('lb1', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('lb2', StoreType.RDB, 10);
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0018: list=%{public}s', list);
                expect(list.indexOf('lb1')).assertLargerOrEqual(0);
                expect(list.indexOf('lb2')).assertLargerOrEqual(0);
                expect(list.indexOf('2 total')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_1900
         * @tc.name: testDeepBkm0019
         * @tc.desc: Verify listBackups with no backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0019', 0, (done: Function) => {
            runCase('testDeepBkm0019', async (): Promise<void> => {
                backupMgr.initialize();
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0019: list=%{public}s', list);
                expect(list.indexOf('no backups')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2000
         * @tc.name: testDeepBkm0020
         * @tc.desc: Verify restoreBackup increments restore count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0020', 0, (done: Function) => {
            runCase('testDeepBkm0020', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('rc1', StoreType.PREFERENCES, 5);
                backupMgr.restoreBackup('rc1');
                backupMgr.restoreBackup('rc1');
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0020: stats=%{public}s', stats);
                expect(stats.indexOf('restores=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2100
         * @tc.name: testDeepBkm0021
         * @tc.desc: Verify deleteBackup increments delete count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0021', 0, (done: Function) => {
            runCase('testDeepBkm0021', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('dc1', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('dc2', StoreType.RDB, 10);
                backupMgr.deleteBackup('dc1');
                backupMgr.deleteBackup('dc2');
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0021: stats=%{public}s', stats);
                expect(stats.indexOf('deletes=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2200
         * @tc.name: testDeepBkm0022
         * @tc.desc: Verify getBackupInfo with invalid name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0022', 0, (done: Function) => {
            runCase('testDeepBkm0022', async (): Promise<void> => {
                backupMgr.initialize();
                const info: string = backupMgr.getBackupInfo('');
                addLog('testDeepBkm0022: info=%{public}s', info);
                expect(info.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_2300
         * @tc.name: testDeepBkm0023
         * @tc.desc: Verify getLatestBackup returns most recent.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0023', 0, (done: Function) => {
            runCase('testDeepBkm0023', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('old1', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('new1', StoreType.RDB, 10);
                const latest: string = backupMgr.getLatestBackup();
                addLog('testDeepBkm0023: latest=%{public}s', latest);
                expect(latest.indexOf('Latest backup')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2400
         * @tc.name: testDeepBkm0024
         * @tc.desc: Verify getLatestBackup with no backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0024', 0, (done: Function) => {
            runCase('testDeepBkm0024', async (): Promise<void> => {
                backupMgr.initialize();
                const latest: string = backupMgr.getLatestBackup();
                addLog('testDeepBkm0024: latest=%{public}s', latest);
                expect(latest.indexOf('no backups')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2500
         * @tc.name: testDeepBkm0025
         * @tc.desc: Verify getOldestBackup returns earliest.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0025', 0, (done: Function) => {
            runCase('testDeepBkm0025', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('first', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('second', StoreType.RDB, 10);
                const oldest: string = backupMgr.getOldestBackup();
                addLog('testDeepBkm0025: oldest=%{public}s', oldest);
                expect(oldest.indexOf('Oldest backup')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2600
         * @tc.name: testDeepBkm0026
         * @tc.desc: Verify getOldestBackup with no backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0026', 0, (done: Function) => {
            runCase('testDeepBkm0026', async (): Promise<void> => {
                backupMgr.initialize();
                const oldest: string = backupMgr.getOldestBackup();
                addLog('testDeepBkm0026: oldest=%{public}s', oldest);
                expect(oldest.indexOf('no backups')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2700
         * @tc.name: testDeepBkm0027
         * @tc.desc: Verify setAutoBackup enables auto backup.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0027', 0, (done: Function) => {
            runCase('testDeepBkm0027', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.setAutoBackup(true, 120000);
                addLog('testDeepBkm0027: result=%{public}s', result);
                expect(result.indexOf('enabled=true')).assertLargerOrEqual(0);
                expect(backupMgr.isAutoBackupEnabled()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2800
         * @tc.name: testDeepBkm0028
         * @tc.desc: Verify setAutoBackup with interval too small fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0028', 0, (done: Function) => {
            runCase('testDeepBkm0028', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.setAutoBackup(true, 1000);
                addLog('testDeepBkm0028: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_2900
         * @tc.name: testDeepBkm0029
         * @tc.desc: Verify checkAutoBackup when disabled.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0029', 0, (done: Function) => {
            runCase('testDeepBkm0029', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.checkAutoBackup();
                addLog('testDeepBkm0029: result=%{public}s', result);
                expect(result.indexOf('disabled')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3000
         * @tc.name: testDeepBkm0030
         * @tc.desc: Verify checkAutoBackup when enabled triggers.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0030', 0, (done: Function) => {
            runCase('testDeepBkm0030', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.setAutoBackup(true, 60000);
                const result: string = backupMgr.checkAutoBackup();
                addLog('testDeepBkm0030: result=%{public}s', result);
                expect(result.indexOf('triggered')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3100
         * @tc.name: testDeepBkm0031
         * @tc.desc: Verify getAutoBackupInterval returns configured value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0031', 0, (done: Function) => {
            runCase('testDeepBkm0031', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.setAutoBackup(true, 180000);
                const interval: number = backupMgr.getAutoBackupInterval();
                addLog('testDeepBkm0031: interval=%{public}d', interval);
                expect(interval).assertEqual(180000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3200
         * @tc.name: testDeepBkm0032
         * @tc.desc: Verify setAutoBackup disable.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0032', 0, (done: Function) => {
            runCase('testDeepBkm0032', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.setAutoBackup(true, 60000);
                expect(backupMgr.isAutoBackupEnabled()).assertTrue();
                backupMgr.setAutoBackup(false, 60000);
                expect(backupMgr.isAutoBackupEnabled()).assertFalse();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_3300
         * @tc.name: testDeepBkm0033
         * @tc.desc: Verify getTotalBackupSize sums correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0033', 0, (done: Function) => {
            runCase('testDeepBkm0033', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('s1', StoreType.PREFERENCES, 10);
                backupMgr.createBackup('s2', StoreType.RDB, 20);
                const total: number = backupMgr.getTotalBackupSize();
                addLog('testDeepBkm0033: total=%{public}d', total);
                expect(total).assertEqual(10 * 128 + 20 * 128);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3400
         * @tc.name: testDeepBkm0034
         * @tc.desc: Verify getTotalEntryCount sums correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0034', 0, (done: Function) => {
            runCase('testDeepBkm0034', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('e1', StoreType.PREFERENCES, 15);
                backupMgr.createBackup('e2', StoreType.RDB, 25);
                const total: number = backupMgr.getTotalEntryCount();
                addLog('testDeepBkm0034: total=%{public}d', total);
                expect(total).assertEqual(40);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3500
         * @tc.name: testDeepBkm0035
         * @tc.desc: Verify verifyBackupIntegrity returns VALID.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0035', 0, (done: Function) => {
            runCase('testDeepBkm0035', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('integrity1', StoreType.PREFERENCES, 10);
                const result: string = backupMgr.verifyBackupIntegrity('integrity1');
                addLog('testDeepBkm0035: result=%{public}s', result);
                expect(result.indexOf('VALID')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3600
         * @tc.name: testDeepBkm0036
         * @tc.desc: Verify verifyBackupIntegrity nonexistent fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0036', 0, (done: Function) => {
            runCase('testDeepBkm0036', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.verifyBackupIntegrity('missing');
                addLog('testDeepBkm0036: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3700
         * @tc.name: testDeepBkm0037
         * @tc.desc: Verify getStatistics returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0037', 0, (done: Function) => {
            runCase('testDeepBkm0037', async (): Promise<void> => {
                backupMgr.initialize();
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0037: stats=%{public}s', stats);
                expect(stats.indexOf('Backup Statistics')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3800
         * @tc.name: testDeepBkm0038
         * @tc.desc: Verify resetStatistics zeros counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0038', 0, (done: Function) => {
            runCase('testDeepBkm0038', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('rs1', StoreType.PREFERENCES, 5);
                backupMgr.restoreBackup('rs1');
                backupMgr.resetStatistics();
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0038: stats=%{public}s', stats);
                expect(stats.indexOf('creates=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('restores=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_3900
         * @tc.name: testDeepBkm0039
         * @tc.desc: Verify release resets all state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0039', 0, (done: Function) => {
            runCase('testDeepBkm0039', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('rel1', StoreType.PREFERENCES, 5);
                backupMgr.release();
                expect(backupMgr.isInitialized()).assertFalse();
                expect(backupMgr.isAutoBackupEnabled()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4000
         * @tc.name: testDeepBkm0040
         * @tc.desc: Verify getTotalBackupSize with no backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0040', 0, (done: Function) => {
            runCase('testDeepBkm0040', async (): Promise<void> => {
                backupMgr.initialize();
                const total: number = backupMgr.getTotalBackupSize();
                addLog('testDeepBkm0040: total=%{public}d', total);
                expect(total).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4100
         * @tc.name: testDeepBkm0041
         * @tc.desc: Verify deleteBackup then listBackups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0041', 0, (done: Function) => {
            runCase('testDeepBkm0041', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('keep', StoreType.PREFERENCES, 5);
                backupMgr.createBackup('remove', StoreType.RDB, 10);
                backupMgr.deleteBackup('remove');
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0041: list=%{public}s', list);
                expect(list.indexOf('1 total')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4200
         * @tc.name: testDeepBkm0042
         * @tc.desc: Verify complete backup lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0042', 0, (done: Function) => {
            runCase('testDeepBkm0042', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('lifecycle', StoreType.PREFERENCES, 100);
                const info: string = backupMgr.getBackupInfo('lifecycle');
                expect(info.indexOf('lifecycle')).assertLargerOrEqual(0);
                backupMgr.restoreBackup('lifecycle');
                backupMgr.setAutoBackup(true, 60000);
                expect(backupMgr.isAutoBackupEnabled()).assertTrue();
                const stats: string = backupMgr.getStatistics();
                expect(stats.indexOf('creates=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('restores=1')).assertLargerOrEqual(0);
                backupMgr.release();
                expect(backupMgr.isInitialized()).assertFalse();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_4300
         * @tc.name: testDeepBkm0043
         * @tc.desc: Verify migration initialize with version 1.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0043', 0, (done: Function) => {
            runCase('testDeepBkm0043', async (): Promise<void> => {
                const result: string = migrationMgr.initialize(1);
                addLog('testDeepBkm0043: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
                expect(migrationMgr.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4400
         * @tc.name: testDeepBkm0044
         * @tc.desc: Verify migration initialize with higher version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0044', 0, (done: Function) => {
            runCase('testDeepBkm0044', async (): Promise<void> => {
                const result: string = migrationMgr.initialize(5);
                addLog('testDeepBkm0044: result=%{public}s', result);
                expect(result.indexOf('version=5')).assertLargerOrEqual(0);
                expect(migrationMgr.getCurrentVersion()).assertEqual(5);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4500
         * @tc.name: testDeepBkm0045
         * @tc.desc: Verify migration initialize with invalid version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0045', 0, (done: Function) => {
            runCase('testDeepBkm0045', async (): Promise<void> => {
                const result: string = migrationMgr.initialize(0);
                addLog('testDeepBkm0045: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4600
         * @tc.name: testDeepBkm0046
         * @tc.desc: Verify migration initialize with negative version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0046', 0, (done: Function) => {
            runCase('testDeepBkm0046', async (): Promise<void> => {
                const result: string = migrationMgr.initialize(-1);
                addLog('testDeepBkm0046: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4700
         * @tc.name: testDeepBkm0047
         * @tc.desc: Verify getStatus returns IDLE after init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0047', 0, (done: Function) => {
            runCase('testDeepBkm0047', async (): Promise<void> => {
                migrationMgr.initialize(1);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.IDLE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4800
         * @tc.name: testDeepBkm0048
         * @tc.desc: Verify getStatusString returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0048', 0, (done: Function) => {
            runCase('testDeepBkm0048', async (): Promise<void> => {
                migrationMgr.initialize(3);
                const status: string = migrationMgr.getStatusString();
                addLog('testDeepBkm0048: status=%{public}s', status);
                expect(status.indexOf('version=3')).assertLargerOrEqual(0);
                expect(status.indexOf('idle')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_4900
         * @tc.name: testDeepBkm0049
         * @tc.desc: Verify getTargetVersion equals current after init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0049', 0, (done: Function) => {
            runCase('testDeepBkm0049', async (): Promise<void> => {
                migrationMgr.initialize(2);
                expect(migrationMgr.getTargetVersion()).assertEqual(2);
                expect(migrationMgr.getCurrentVersion()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5000
         * @tc.name: testDeepBkm0050
         * @tc.desc: Verify migration initialize resets history.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0050', 0, (done: Function) => {
            runCase('testDeepBkm0050', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step 1->2');
                migrationMgr.initialize(1);
                const history: string = migrationMgr.getVersionHistory();
                addLog('testDeepBkm0050: history=%{public}s', history);
                expect(history.indexOf('empty')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5100
         * @tc.name: testDeepBkm0051
         * @tc.desc: Verify release resets version to initial.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0051', 0, (done: Function) => {
            runCase('testDeepBkm0051', async (): Promise<void> => {
                migrationMgr.initialize(5);
                migrationMgr.release();
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.IDLE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5200
         * @tc.name: testDeepBkm0052
         * @tc.desc: Verify migration initialize twice resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0052', 0, (done: Function) => {
            runCase('testDeepBkm0052', async (): Promise<void> => {
                migrationMgr.initialize(3);
                migrationMgr.registerMigrationStep(3, 4, 'Step');
                migrationMgr.initialize(1);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
                const history: string = migrationMgr.getVersionHistory();
                expect(history.indexOf('empty')).assertLargerOrEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_5300
         * @tc.name: testDeepBkm0053
         * @tc.desc: Verify registerMigrationStep succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0053', 0, (done: Function) => {
            runCase('testDeepBkm0053', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.registerMigrationStep(1, 2, 'Add users table');
                addLog('testDeepBkm0053: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5400
         * @tc.name: testDeepBkm0054
         * @tc.desc: Verify registerMigrationStep with invalid fromVersion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0054', 0, (done: Function) => {
            runCase('testDeepBkm0054', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.registerMigrationStep(0, 2, 'Bad step');
                addLog('testDeepBkm0054: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5500
         * @tc.name: testDeepBkm0055
         * @tc.desc: Verify registerMigrationStep with from >= to fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0055', 0, (done: Function) => {
            runCase('testDeepBkm0055', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.registerMigrationStep(3, 2, 'Backward');
                addLog('testDeepBkm0055: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5600
         * @tc.name: testDeepBkm0056
         * @tc.desc: Verify migrate applies registered steps.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0056', 0, (done: Function) => {
            runCase('testDeepBkm0056', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step 1->2');
                migrationMgr.registerMigrationStep(2, 3, 'Step 2->3');
                const result: string = await migrationMgr.migrate(3);
                addLog('testDeepBkm0056: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(migrationMgr.getCurrentVersion()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5700
         * @tc.name: testDeepBkm0057
         * @tc.desc: Verify migrate fails with lower target version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0057', 0, (done: Function) => {
            runCase('testDeepBkm0057', async (): Promise<void> => {
                migrationMgr.initialize(3);
                const result: string = await migrationMgr.migrate(2);
                addLog('testDeepBkm0057: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5800
         * @tc.name: testDeepBkm0058
         * @tc.desc: Verify migrate fails with invalid target.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0058', 0, (done: Function) => {
            runCase('testDeepBkm0058', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = await migrationMgr.migrate(0);
                addLog('testDeepBkm0058: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_5900
         * @tc.name: testDeepBkm0059
         * @tc.desc: Verify migrateSync applies steps synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0059', 0, (done: Function) => {
            runCase('testDeepBkm0059', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Sync step');
                const result: string = migrationMgr.migrateSync(2);
                addLog('testDeepBkm0059: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(migrationMgr.getCurrentVersion()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6000
         * @tc.name: testDeepBkm0060
         * @tc.desc: Verify migrateSync fails with lower target.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0060', 0, (done: Function) => {
            runCase('testDeepBkm0060', async (): Promise<void> => {
                migrationMgr.initialize(5);
                const result: string = migrationMgr.migrateSync(3);
                addLog('testDeepBkm0060: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6100
         * @tc.name: testDeepBkm0061
         * @tc.desc: Verify rollback to lower version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0061', 0, (done: Function) => {
            runCase('testDeepBkm0061', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 3, 'Jump to 3');
                await migrationMgr.migrate(3);
                const result: string = migrationMgr.rollback(1);
                addLog('testDeepBkm0061: result=%{public}s', result);
                expect(result.indexOf('rollback completed')).assertLargerOrEqual(0);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6200
         * @tc.name: testDeepBkm0062
         * @tc.desc: Verify rollback fails with higher target.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0062', 0, (done: Function) => {
            runCase('testDeepBkm0062', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.rollback(3);
                addLog('testDeepBkm0062: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6300
         * @tc.name: testDeepBkm0063
         * @tc.desc: Verify rollback fails with invalid version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0063', 0, (done: Function) => {
            runCase('testDeepBkm0063', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.rollback(0);
                addLog('testDeepBkm0063: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6400
         * @tc.name: testDeepBkm0064
         * @tc.desc: Verify migrate sets status to COMPLETED.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0064', 0, (done: Function) => {
            runCase('testDeepBkm0064', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step');
                await migrationMgr.migrate(2);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.COMPLETED);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_6500
         * @tc.name: testDeepBkm0065
         * @tc.desc: Verify getMigrationStrategy returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0065', 0, (done: Function) => {
            runCase('testDeepBkm0065', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Add table');
                const strategy: string = migrationMgr.getMigrationStrategy();
                addLog('testDeepBkm0065: strategy=%{public}s', strategy);
                expect(strategy.indexOf('Strategy')).assertLargerOrEqual(0);
                expect(strategy.indexOf('current=v1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6600
         * @tc.name: testDeepBkm0066
         * @tc.desc: Verify setAutoMigrate enables auto migration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0066', 0, (done: Function) => {
            runCase('testDeepBkm0066', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.setAutoMigrate(true);
                addLog('testDeepBkm0066: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(migrationMgr.isAutoMigrate()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6700
         * @tc.name: testDeepBkm0067
         * @tc.desc: Verify getVersionHistory with steps.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0067', 0, (done: Function) => {
            runCase('testDeepBkm0067', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step A');
                migrationMgr.registerMigrationStep(2, 3, 'Step B');
                const history: string = migrationMgr.getVersionHistory();
                addLog('testDeepBkm0067: history=%{public}s', history);
                expect(history.indexOf('v2')).assertLargerOrEqual(0);
                expect(history.indexOf('v3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6800
         * @tc.name: testDeepBkm0068
         * @tc.desc: Verify getVersionHistory empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0068', 0, (done: Function) => {
            runCase('testDeepBkm0068', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const history: string = migrationMgr.getVersionHistory();
                addLog('testDeepBkm0068: history=%{public}s', history);
                expect(history.indexOf('empty')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_6900
         * @tc.name: testDeepBkm0069
         * @tc.desc: Verify getMigrationLog with entries.
         * @tc.size: SmallTest
         * @tc.name: testDeepBkm0069
         * @tc.desc: Verify getMigrationLog with entries.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0069', 0, (done: Function) => {
            runCase('testDeepBkm0069', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Log step');
                const log: string = migrationMgr.getMigrationLog();
                addLog('testDeepBkm0069: log=%{public}s', log);
                expect(log.indexOf('entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7000
         * @tc.name: testDeepBkm0070
         * @tc.desc: Verify getMigrationLog empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0070', 0, (done: Function) => {
            runCase('testDeepBkm0070', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const log: string = migrationMgr.getMigrationLog();
                addLog('testDeepBkm0070: log=%{public}s', log);
                // initialize() adds a log entry, so log is not empty
                expect(log.indexOf('1 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7100
         * @tc.name: testDeepBkm0071
         * @tc.desc: Verify getMigrationLogEntries returns array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0071', 0, (done: Function) => {
            runCase('testDeepBkm0071', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Entry step');
                const entries: string[] = migrationMgr.getMigrationLogEntries();
                addLog('testDeepBkm0071: entries=%{public}d', entries.length);
                expect(entries.length).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7200
         * @tc.name: testDeepBkm0072
         * @tc.desc: Verify getStatistics returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0072', 0, (done: Function) => {
            runCase('testDeepBkm0072', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0072: stats=%{public}s', stats);
                expect(stats.indexOf('Migration Statistics')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7300
         * @tc.name: testDeepBkm0073
         * @tc.desc: Verify statistics after migration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0073', 0, (done: Function) => {
            runCase('testDeepBkm0073', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step');
                await migrationMgr.migrate(2);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0073: stats=%{public}s', stats);
                expect(stats.indexOf('success=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('version=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7400
         * @tc.name: testDeepBkm0074
         * @tc.desc: Verify rollback sets status to ROLLED_BACK.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0074', 0, (done: Function) => {
            runCase('testDeepBkm0074', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 3, 'Jump');
                await migrationMgr.migrate(3);
                migrationMgr.rollback(1);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.ROLLED_BACK);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_BKM_7500
         * @tc.name: testDeepBkm0075
         * @tc.desc: Verify multiple migration steps applied in order.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0075', 0, (done: Function) => {
            runCase('testDeepBkm0075', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'S1');
                migrationMgr.registerMigrationStep(2, 3, 'S2');
                migrationMgr.registerMigrationStep(3, 4, 'S3');
                await migrationMgr.migrate(4);
                expect(migrationMgr.getCurrentVersion()).assertEqual(4);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0075: stats=%{public}s', stats);
                expect(stats.indexOf('success=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7600
         * @tc.name: testDeepBkm0076
         * @tc.desc: Verify autoMigrate toggle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0076', 0, (done: Function) => {
            runCase('testDeepBkm0076', async (): Promise<void> => {
                migrationMgr.initialize(1);
                expect(migrationMgr.isAutoMigrate()).assertFalse();
                migrationMgr.setAutoMigrate(true);
                expect(migrationMgr.isAutoMigrate()).assertTrue();
                migrationMgr.setAutoMigrate(false);
                expect(migrationMgr.isAutoMigrate()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7700
         * @tc.name: testDeepBkm0077
         * @tc.desc: Verify backup create then restore then delete.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0077', 0, (done: Function) => {
            runCase('testDeepBkm0077', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('flow', StoreType.PREFERENCES, 10);
                backupMgr.restoreBackup('flow');
                backupMgr.deleteBackup('flow');
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0077: list=%{public}s', list);
                expect(list.indexOf('no backups')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7800
         * @tc.name: testDeepBkm0078
         * @tc.desc: Verify migration strategy after steps registered.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0078', 0, (done: Function) => {
            runCase('testDeepBkm0078', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Add col');
                migrationMgr.registerMigrationStep(2, 3, 'Add idx');
                const strategy: string = migrationMgr.getMigrationStrategy();
                addLog('testDeepBkm0078: strategy=%{public}s', strategy);
                expect(strategy.indexOf('registeredSteps=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_7900
         * @tc.name: testDeepBkm0079
         * @tc.desc: Verify backup statistics after mixed operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0079', 0, (done: Function) => {
            runCase('testDeepBkm0079', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('b1', StoreType.PREFERENCES, 10);
                backupMgr.createBackup('b2', StoreType.RDB, 20);
                backupMgr.restoreBackup('b1');
                backupMgr.deleteBackup('b2');
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0079: stats=%{public}s', stats);
                expect(stats.indexOf('creates=2')).assertLargerOrEqual(0);
                expect(stats.indexOf('restores=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('deletes=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8000
         * @tc.name: testDeepBkm0080
         * @tc.desc: Verify migration getStatistics after rollback.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0080', 0, (done: Function) => {
            runCase('testDeepBkm0080', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step');
                await migrationMgr.migrate(2);
                migrationMgr.rollback(1);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0080: stats=%{public}s', stats);
                expect(stats.indexOf('rolledBack')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8100
         * @tc.name: testDeepBkm0081
         * @tc.desc: Verify backup size calculation after multiple creates.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0081', 0, (done: Function) => {
            runCase('testDeepBkm0081', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('s1', StoreType.PREFERENCES, 100);
                backupMgr.createBackup('s2', StoreType.RDB, 200);
                backupMgr.createBackup('s3', StoreType.ARRAY, 300);
                const total: number = backupMgr.getTotalBackupSize();
                addLog('testDeepBkm0081: total=%{public}d', total);
                expect(total).assertEqual(100 * 128 + 200 * 128 + 300 * 128);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8200
         * @tc.name: testDeepBkm0082
         * @tc.desc: Verify migration log entries count after operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0082', 0, (done: Function) => {
            runCase('testDeepBkm0082', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step A');
                migrationMgr.registerMigrationStep(2, 3, 'Step B');
                await migrationMgr.migrate(3);
                const entries: string[] = migrationMgr.getMigrationLogEntries();
                addLog('testDeepBkm0082: entries=%{public}d', entries.length);
                expect(entries.length).assertLargerOrEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8300
         * @tc.name: testDeepBkm0083
         * @tc.desc: Verify backup autoBackup interval default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0083', 0, (done: Function) => {
            runCase('testDeepBkm0083', async (): Promise<void> => {
                backupMgr.initialize();
                const interval: number = backupMgr.getAutoBackupInterval();
                addLog('testDeepBkm0083: interval=%{public}d', interval);
                expect(interval).assertEqual(3600000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8400
         * @tc.name: testDeepBkm0084
         * @tc.desc: Verify migration with same version fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0084', 0, (done: Function) => {
            runCase('testDeepBkm0084', async (): Promise<void> => {
                migrationMgr.initialize(2);
                const result: string = await migrationMgr.migrate(2);
                addLog('testDeepBkm0084: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8500
         * @tc.name: testDeepBkm0085
         * @tc.desc: Verify migrateSync with same version fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0085', 0, (done: Function) => {
            runCase('testDeepBkm0085', async (): Promise<void> => {
                migrationMgr.initialize(3);
                const result: string = migrationMgr.migrateSync(3);
                addLog('testDeepBkm0085: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8600
         * @tc.name: testDeepBkm0086
         * @tc.desc: Verify rollback to same version fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0086', 0, (done: Function) => {
            runCase('testDeepBkm0086', async (): Promise<void> => {
                migrationMgr.initialize(2);
                const result: string = migrationMgr.rollback(2);
                addLog('testDeepBkm0086: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8700
         * @tc.name: testDeepBkm0087
         * @tc.desc: Verify backup getTotalEntryCount after deletes.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0087', 0, (done: Function) => {
            runCase('testDeepBkm0087', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('e1', StoreType.PREFERENCES, 10);
                backupMgr.createBackup('e2', StoreType.RDB, 20);
                backupMgr.createBackup('e3', StoreType.ARRAY, 30);
                backupMgr.deleteBackup('e2');
                const total: number = backupMgr.getTotalEntryCount();
                addLog('testDeepBkm0087: total=%{public}d', total);
                expect(total).assertEqual(40);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8800
         * @tc.name: testDeepBkm0088
         * @tc.desc: Verify migration version history after migrate.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0088', 0, (done: Function) => {
            runCase('testDeepBkm0088', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Applied');
                await migrationMgr.migrate(2);
                const history: string = migrationMgr.getVersionHistory();
                addLog('testDeepBkm0088: history=%{public}s', history);
                expect(history.indexOf('OK')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_8900
         * @tc.name: testDeepBkm0089
         * @tc.desc: Verify backup release then reinitialize.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0089', 0, (done: Function) => {
            runCase('testDeepBkm0089', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('before', StoreType.PREFERENCES, 5);
                backupMgr.release();
                backupMgr.initialize();
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0089: list=%{public}s', list);
                expect(list.indexOf('no backups')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9000
         * @tc.name: testDeepBkm0090
         * @tc.desc: Verify migration release then reinitialize.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0090', 0, (done: Function) => {
            runCase('testDeepBkm0090', async (): Promise<void> => {
                migrationMgr.initialize(5);
                migrationMgr.release();
                migrationMgr.initialize(1);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9100
         * @tc.name: testDeepBkm0091
         * @tc.desc: Verify backup verifyBackupIntegrity after create.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0091', 0, (done: Function) => {
            runCase('testDeepBkm0091', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('chk1', StoreType.PREFERENCES, 42);
                const result: string = backupMgr.verifyBackupIntegrity('chk1');
                addLog('testDeepBkm0091: result=%{public}s', result);
                expect(result.indexOf('VALID')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9200
         * @tc.name: testDeepBkm0092
         * @tc.desc: Verify migration registerMigrationStep with equal versions.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0092', 0, (done: Function) => {
            runCase('testDeepBkm0092', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.registerMigrationStep(2, 2, 'Same');
                addLog('testDeepBkm0092: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9300
         * @tc.name: testDeepBkm0093
         * @tc.desc: Verify backup createBackup with QUEUE type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0093', 0, (done: Function) => {
            runCase('testDeepBkm0093', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('queue_bk', StoreType.QUEUE, 50);
                addLog('testDeepBkm0093: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9400
         * @tc.name: testDeepBkm0094
         * @tc.desc: Verify migration getStatistics with fail count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0094', 0, (done: Function) => {
            runCase('testDeepBkm0094', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0094: stats=%{public}s', stats);
                expect(stats.indexOf('fail=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9500
         * @tc.name: testDeepBkm0095
         * @tc.desc: Verify backup listBackups format.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0095', 0, (done: Function) => {
            runCase('testDeepBkm0095', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('fmt1', StoreType.PREFERENCES, 10);
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0095: list=%{public}s', list);
                expect(list.indexOf('fmt1')).assertLargerOrEqual(0);
                expect(list.indexOf('preferences')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9600
         * @tc.name: testDeepBkm0096
         * @tc.desc: Verify migration getMigrationStrategy with auto flag.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0096', 0, (done: Function) => {
            runCase('testDeepBkm0096', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.setAutoMigrate(true);
                const strategy: string = migrationMgr.getMigrationStrategy();
                addLog('testDeepBkm0096: strategy=%{public}s', strategy);
                expect(strategy.indexOf('auto=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9700
         * @tc.name: testDeepBkm0097
         * @tc.desc: Verify backup autoBackup check after trigger.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0097', 0, (done: Function) => {
            runCase('testDeepBkm0097', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.setAutoBackup(true, 60000);
                backupMgr.checkAutoBackup();
                const result: string = backupMgr.checkAutoBackup();
                addLog('testDeepBkm0097: result=%{public}s', result);
                expect(result.indexOf('next backup')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9800
         * @tc.name: testDeepBkm0098
         * @tc.desc: Verify migration rollback to invalid version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0098', 0, (done: Function) => {
            runCase('testDeepBkm0098', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.rollback(-1);
                addLog('testDeepBkm0098: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_9900
         * @tc.name: testDeepBkm0099
         * @tc.desc: Verify backup create then getLatest and getOldest.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0099', 0, (done: Function) => {
            runCase('testDeepBkm0099', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('only', StoreType.PREFERENCES, 5);
                const latest: string = backupMgr.getLatestBackup();
                const oldest: string = backupMgr.getOldestBackup();
                addLog('testDeepBkm0099: latest=%{public}s', latest);
                expect(latest.indexOf('only')).assertLargerOrEqual(0);
                expect(oldest.indexOf('only')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10000
         * @tc.name: testDeepBkm0100
         * @tc.desc: Verify migration register step then get strategy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0100', 0, (done: Function) => {
            runCase('testDeepBkm0100', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'First');
                migrationMgr.registerMigrationStep(2, 3, 'Second');
                migrationMgr.registerMigrationStep(3, 4, 'Third');
                const strategy: string = migrationMgr.getMigrationStrategy();
                addLog('testDeepBkm0100: strategy=%{public}s', strategy);
                expect(strategy.indexOf('registeredSteps=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10100
         * @tc.name: testDeepBkm0101
         * @tc.desc: Verify backup getBackupInfo contains all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0101', 0, (done: Function) => {
            runCase('testDeepBkm0101', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('full', StoreType.RDB, 99);
                const info: string = backupMgr.getBackupInfo('full');
                addLog('testDeepBkm0101: info=%{public}s', info);
                expect(info.indexOf('name=full')).assertLargerOrEqual(0);
                expect(info.indexOf('rdb')).assertLargerOrEqual(0);
                expect(info.indexOf('99')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10200
         * @tc.name: testDeepBkm0102
         * @tc.desc: Verify migration complete lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0102', 0, (done: Function) => {
            runCase('testDeepBkm0102', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Add table');
                migrationMgr.registerMigrationStep(2, 3, 'Add index');
                await migrationMgr.migrate(3);
                expect(migrationMgr.getCurrentVersion()).assertEqual(3);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.COMPLETED);
                migrationMgr.rollback(1);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
                expect(migrationMgr.getStatus()).assertEqual(MigrationStatus.ROLLED_BACK);
                migrationMgr.release();
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10300
         * @tc.name: testDeepBkm0103
         * @tc.desc: Verify backup complete lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0103', 0, (done: Function) => {
            runCase('testDeepBkm0103', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('life1', StoreType.PREFERENCES, 10);
                backupMgr.createBackup('life2', StoreType.RDB, 20);
                backupMgr.restoreBackup('life1');
                backupMgr.setAutoBackup(true, 120000);
                backupMgr.checkAutoBackup();
                const size: number = backupMgr.getTotalBackupSize();
                expect(size).assertLargerOrEqual(0);
                const entries: number = backupMgr.getTotalEntryCount();
                expect(entries).assertEqual(30);
                backupMgr.deleteBackup('life2');
                backupMgr.release();
                expect(backupMgr.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10400
         * @tc.name: testDeepBkm0104
         * @tc.desc: Verify migration migrateSync then rollback.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0104', 0, (done: Function) => {
            runCase('testDeepBkm0104', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Sync step');
                migrationMgr.registerMigrationStep(2, 3, 'Another');
                migrationMgr.migrateSync(3);
                expect(migrationMgr.getCurrentVersion()).assertEqual(3);
                migrationMgr.rollback(1);
                expect(migrationMgr.getCurrentVersion()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10500
         * @tc.name: testDeepBkm0105
         * @tc.desc: Verify backup resetStatistics preserves data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0105', 0, (done: Function) => {
            runCase('testDeepBkm0105', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('keep', StoreType.PREFERENCES, 10);
                backupMgr.resetStatistics();
                const list: string = backupMgr.listBackups();
                addLog('testDeepBkm0105: list=%{public}s', list);
                expect(list.indexOf('keep')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10600
         * @tc.name: testDeepBkm0106
         * @tc.desc: Verify migration statistics contain version and status.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0106', 0, (done: Function) => {
            runCase('testDeepBkm0106', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const stats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0106: stats=%{public}s', stats);
                expect(stats.indexOf('version=')).assertLargerOrEqual(0);
                expect(stats.indexOf('status=')).assertLargerOrEqual(0);
                expect(stats.indexOf('steps=')).assertLargerOrEqual(0);
                expect(stats.indexOf('success=')).assertLargerOrEqual(0);
                expect(stats.indexOf('fail=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10700
         * @tc.name: testDeepBkm0107
         * @tc.desc: Verify backup with RECORD store type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0107', 0, (done: Function) => {
            runCase('testDeepBkm0107', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('rec_bk', StoreType.RECORD, 7);
                addLog('testDeepBkm0107: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                const info: string = backupMgr.getBackupInfo('rec_bk');
                expect(info.indexOf('record')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10800
         * @tc.name: testDeepBkm0108
         * @tc.desc: Verify migration register step with long description.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepBkm0108', 0, (done: Function) => {
            runCase('testDeepBkm0108', async (): Promise<void> => {
                migrationMgr.initialize(1);
                let desc: string = '';
                for (let i = 0; i < 50; i++) {
                    desc += 'LongDesc';
                }
                const result: string = migrationMgr.registerMigrationStep(1, 2, desc);
                addLog('testDeepBkm0108: resultLen=%{public}d', result.length);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_10900
         * @tc.name: testDeepBkm0109
         * @tc.desc: Verify backup deleteBackup with invalid name.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0109', 0, (done: Function) => {
            runCase('testDeepBkm0109', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.deleteBackup('');
                addLog('testDeepBkm0109: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11000
         * @tc.name: testDeepBkm0110
         * @tc.desc: Verify migration getStatusString after migrate.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0110', 0, (done: Function) => {
            runCase('testDeepBkm0110', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Step');
                await migrationMgr.migrate(2);
                const status: string = migrationMgr.getStatusString();
                addLog('testDeepBkm0110: status=%{public}s', status);
                expect(status.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11100
         * @tc.name: testDeepBkm0111
         * @tc.desc: Verify backup getStatistics contains all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0111', 0, (done: Function) => {
            runCase('testDeepBkm0111', async (): Promise<void> => {
                backupMgr.initialize();
                const stats: string = backupMgr.getStatistics();
                addLog('testDeepBkm0111: stats=%{public}s', stats);
                expect(stats.indexOf('count=')).assertLargerOrEqual(0);
                expect(stats.indexOf('totalSize=')).assertLargerOrEqual(0);
                expect(stats.indexOf('totalEntries=')).assertLargerOrEqual(0);
                expect(stats.indexOf('creates=')).assertLargerOrEqual(0);
                expect(stats.indexOf('restores=')).assertLargerOrEqual(0);
                expect(stats.indexOf('deletes=')).assertLargerOrEqual(0);
                expect(stats.indexOf('autoBackup=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11200
         * @tc.name: testDeepBkm0112
         * @tc.desc: Verify migration getVersionHistory after partial migrate.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0112', 0, (done: Function) => {
            runCase('testDeepBkm0112', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.registerMigrationStep(1, 2, 'Applied');
                migrationMgr.registerMigrationStep(2, 3, 'Pending');
                migrationMgr.registerMigrationStep(3, 4, 'Pending');
                await migrationMgr.migrate(2);
                const history: string = migrationMgr.getVersionHistory();
                addLog('testDeepBkm0112: history=%{public}s', history);
                expect(history.indexOf('OK')).assertLargerOrEqual(0);
                expect(history.indexOf('PENDING')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11300
         * @tc.name: testDeepBkm0113
         * @tc.desc: Verify backup createBackup checksum in info.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0113', 0, (done: Function) => {
            runCase('testDeepBkm0113', async (): Promise<void> => {
                backupMgr.initialize();
                backupMgr.createBackup('checksum', StoreType.PREFERENCES, 10);
                const info: string = backupMgr.getBackupInfo('checksum');
                addLog('testDeepBkm0113: info=%{public}s', info);
                expect(info.indexOf('checksum=chk_')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11400
         * @tc.name: testDeepBkm0114
         * @tc.desc: Verify migration register step with negative toVersion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0114', 0, (done: Function) => {
            runCase('testDeepBkm0114', async (): Promise<void> => {
                migrationMgr.initialize(1);
                const result: string = migrationMgr.registerMigrationStep(1, -1, 'Bad');
                addLog('testDeepBkm0114: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11500
         * @tc.name: testDeepBkm0115
         * @tc.desc: Verify backup isInitialized before and after init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0115', 0, (done: Function) => {
            runCase('testDeepBkm0115', async (): Promise<void> => {
                expect(backupMgr.isInitialized()).assertFalse();
                backupMgr.initialize();
                expect(backupMgr.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11600
         * @tc.name: testDeepBkm0116
         * @tc.desc: Verify migration isInitialized after init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0116', 0, (done: Function) => {
            runCase('testDeepBkm0116', async (): Promise<void> => {
                migrationMgr.initialize(1);
                expect(migrationMgr.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11700
         * @tc.name: testDeepBkm0117
         * @tc.desc: Verify backup setAutoBackup with exact minimum interval.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0117', 0, (done: Function) => {
            runCase('testDeepBkm0117', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.setAutoBackup(true, 60000);
                addLog('testDeepBkm0117: result=%{public}s', result);
                expect(result.indexOf('enabled=true')).assertLargerOrEqual(0);
                expect(backupMgr.getAutoBackupInterval()).assertEqual(60000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11800
         * @tc.name: testDeepBkm0118
         * @tc.desc: Verify migration getMigrationLogEntries empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0118', 0, (done: Function) => {
            runCase('testDeepBkm0118', async (): Promise<void> => {
                migrationMgr.initialize(1);
                migrationMgr.release();
                migrationMgr.initialize(1);
                const entries: string[] = migrationMgr.getMigrationLogEntries();
                addLog('testDeepBkm0118: entries=%{public}d', entries.length);
                // initialize() adds a log entry, so entries.length is 1, not 0
                expect(entries.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_11900
         * @tc.name: testDeepBkm0119
         * @tc.desc: Verify backup createBackup with MAP store type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepBkm0119', 0, (done: Function) => {
            runCase('testDeepBkm0119', async (): Promise<void> => {
                backupMgr.initialize();
                const result: string = backupMgr.createBackup('map_bk', StoreType.MAP, 33);
                addLog('testDeepBkm0119: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                const info: string = backupMgr.getBackupInfo('map_bk');
                expect(info.indexOf('map')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_BKM_12000
         * @tc.name: testDeepBkm0120
         * @tc.desc: Verify combined backup and migration lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepBkm0120', 0, (done: Function) => {
            runCase('testDeepBkm0120', async (): Promise<void> => {
                backupMgr.initialize();
                migrationMgr.initialize(1);
                backupMgr.createBackup('combined', StoreType.PREFERENCES, 50);
                migrationMgr.registerMigrationStep(1, 2, 'Schema update');
                await migrationMgr.migrate(2);
                backupMgr.restoreBackup('combined');
                const bStats: string = backupMgr.getStatistics();
                const mStats: string = migrationMgr.getStatistics();
                addLog('testDeepBkm0120: bStats=%{public}s', bStats);
                addLog('testDeepBkm0120: mStats=%{public}s', mStats);
                expect(bStats.indexOf('creates=1')).assertLargerOrEqual(0);
                expect(mStats.indexOf('version=2')).assertLargerOrEqual(0);
                backupMgr.release();
                migrationMgr.release();
            }, done);
        });
    });
}
