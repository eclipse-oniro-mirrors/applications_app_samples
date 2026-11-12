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
import { DataMigrationManager } from '../../../main/ets/migration/DataMigrationManager';
import { MigrationStatus } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataMigrationTest(): void {
  describe('DataMigrationTest', () => {
    let manager: DataMigrationManager = new DataMigrationManager();

    beforeAll(() => {
      addLog('DataMigrationTest suite started');
    })

    beforeEach(() => {
      manager = new DataMigrationManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('DataMigrationTest suite finished');
    })



    /*
     * @tc.number: SUB_DATA_MIGRATION_0100
     * @tc.name: testDataMigration0001
     * @tc.desc: Verify initialize sets version correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0001', 0, (done: Function) => {
      runCase('testDataMigration0001', async (): Promise<void> => {
        const result: string = manager.initialize(1);
        addLog('testDataMigration0001: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.getCurrentVersion()).assertEqual(1);
        expect(manager.getStatus()).assertEqual(MigrationStatus.IDLE);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0200
     * @tc.name: testDataMigration0002
     * @tc.desc: Verify initialize with version 5.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0002', 0, (done: Function) => {
      runCase('testDataMigration0002', async (): Promise<void> => {
        const result: string = manager.initialize(5);
        addLog('testDataMigration0002: result=%{public}s', result);
        expect(manager.getCurrentVersion()).assertEqual(5);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getStatus()).assertEqual(MigrationStatus.IDLE);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0300
     * @tc.name: testDataMigration0003
     * @tc.desc: Verify initialize fails with invalid version 0.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0003', 0, (done: Function) => {
      runCase('testDataMigration0003', async (): Promise<void> => {
        const result: string = manager.initialize(0);
        addLog('testDataMigration0003: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_0400
     * @tc.name: testDataMigration0004
     * @tc.desc: Verify registerMigrationStep succeeds with valid versions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0004', 0, (done: Function) => {
      runCase('testDataMigration0004', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = manager.registerMigrationStep(1, 2, 'Add user table');
        addLog('testDataMigration0004: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0500
     * @tc.name: testDataMigration0005
     * @tc.desc: Verify registerMigrationStep fails when toVersion <= fromVersion.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0005', 0, (done: Function) => {
      runCase('testDataMigration0005', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = manager.registerMigrationStep(3, 2, 'Downgrade');
        addLog('testDataMigration0005: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0600
     * @tc.name: testDataMigration0006
     * @tc.desc: Verify registerMigrationStep fails with invalid version numbers.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataMigration0006', 0, (done: Function) => {
      runCase('testDataMigration0006', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = manager.registerMigrationStep(0, 2, 'Bad from');
        addLog('testDataMigration0006: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_0700
     * @tc.name: testDataMigration0007
     * @tc.desc: Verify migrateSync updates version to target.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0007', 0, (done: Function) => {
      runCase('testDataMigration0007', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Step 1->2');
        manager.registerMigrationStep(2, 3, 'Step 2->3');
        const result: string = manager.migrateSync(3);
        addLog('testDataMigration0007: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getCurrentVersion()).assertEqual(3);
        expect(manager.getStatus()).assertEqual(MigrationStatus.COMPLETED);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0800
     * @tc.name: testDataMigration0008
     * @tc.desc: Verify migrateSync fails when target <= current.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0008', 0, (done: Function) => {
      runCase('testDataMigration0008', async (): Promise<void> => {
        manager.initialize(3);
        const result: string = manager.migrateSync(2);
        addLog('testDataMigration0008: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(3);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_0900
     * @tc.name: testDataMigration0009
     * @tc.desc: Verify migrateSync fails with invalid target version.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0009', 0, (done: Function) => {
      runCase('testDataMigration0009', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = manager.migrateSync(0);
        addLog('testDataMigration0009: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_1000
     * @tc.name: testDataMigration0010
     * @tc.desc: Verify rollback changes version to lower target.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0010', 0, (done: Function) => {
      runCase('testDataMigration0010', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Step up');
        manager.migrateSync(2);
        const result: string = manager.rollback(1);
        addLog('testDataMigration0010: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getCurrentVersion()).assertEqual(1);
        expect(manager.getStatus()).assertEqual(MigrationStatus.ROLLED_BACK);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_1100
     * @tc.name: testDataMigration0011
     * @tc.desc: Verify rollback fails when target >= current.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0011', 0, (done: Function) => {
      runCase('testDataMigration0011', async (): Promise<void> => {
        manager.initialize(2);
        const result: string = manager.rollback(3);
        addLog('testDataMigration0011: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(2);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_1200
     * @tc.name: testDataMigration0012
     * @tc.desc: Verify setAutoMigrate enables auto-migration.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0012', 0, (done: Function) => {
      runCase('testDataMigration0012', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = manager.setAutoMigrate(true);
        addLog('testDataMigration0012: result=%{public}s, isAuto=%{public}s', result, String(manager.isAutoMigrate()));
        expect(result.indexOf('true')).assertLargerOrEqual(0);
        expect(manager.isAutoMigrate()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_1300
     * @tc.name: testDataMigration0013
     * @tc.desc: Verify setAutoMigrate disables auto-migration.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0013', 0, (done: Function) => {
      runCase('testDataMigration0013', async (): Promise<void> => {
        manager.initialize(1);
        manager.setAutoMigrate(true);
        manager.setAutoMigrate(false);
        expect(manager.isAutoMigrate()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_1400
     * @tc.name: testDataMigration0014
     * @tc.desc: Verify getVersionHistory returns registered steps.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0014', 0, (done: Function) => {
      runCase('testDataMigration0014', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Add table');
        manager.registerMigrationStep(2, 3, 'Add column');
        const history: string = manager.getVersionHistory();
        addLog('testDataMigration0014: history=%{public}s', history);
        expect(history.indexOf('v2')).assertLargerOrEqual(0);
        expect(history.indexOf('v3')).assertLargerOrEqual(0);
        expect(history.indexOf('Add table')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_1500
     * @tc.name: testDataMigration0015
     * @tc.desc: Verify getMigrationLog returns non-empty after operations.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0015', 0, (done: Function) => {
      runCase('testDataMigration0015', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Step');
        const log: string = manager.getMigrationLog();
        addLog('testDataMigration0015: log=%{public}s', log);
        expect(log.indexOf('entries')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(log.indexOf('entries')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_1600
     * @tc.name: testDataMigration0016
     * @tc.desc: Verify getMigrationStrategy returns strategy info.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDataMigration0016', 0, (done: Function) => {
      runCase('testDataMigration0016', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Step A');
        const strategy: string = manager.getMigrationStrategy();
        addLog('testDataMigration0016: strategy=%{public}s', strategy);
        expect(strategy.indexOf('current=v1')).assertLargerOrEqual(0);
        expect(strategy.indexOf('registeredSteps=1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_1700
     * @tc.name: testDataMigration0017
     * @tc.desc: Verify getStatistics returns migration statistics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0017', 0, (done: Function) => {
      runCase('testDataMigration0017', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Step');
        manager.migrateSync(2);
        const stats: string = manager.getStatistics();
        addLog('testDataMigration0017: stats=%{public}s', stats);
        expect(stats.indexOf('version=2')).assertLargerOrEqual(0);
        expect(stats.indexOf('success=')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_MIGRATION_1800
     * @tc.name: testDataMigration0018
     * @tc.desc: Verify getTargetVersion returns the target after migration.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0018', 0, (done: Function) => {
      runCase('testDataMigration0018', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 3, 'Step to v3');
        manager.migrateSync(3);
        const target: number = manager.getTargetVersion();
        addLog('testDataMigration0018: target=%{public}d', String(target));
        expect(target).assertEqual(3);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(3);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_1900
     * @tc.name: testDataMigration0019
     * @tc.desc: Verify getStatusString returns formatted status.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0019', 0, (done: Function) => {
      runCase('testDataMigration0019', async (): Promise<void> => {
        manager.initialize(2);
        const statusStr: string = manager.getStatusString();
        addLog('testDataMigration0019: status=%{public}s', statusStr);
        expect(statusStr.indexOf('version=2')).assertLargerOrEqual(0);
        expect(statusStr.indexOf('status=')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_2000
     * @tc.name: testDataMigration0020
     * @tc.desc: Verify getMigrationLogEntries returns log array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0020', 0, (done: Function) => {
      runCase('testDataMigration0020', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Log step');
        const entries: string[] = manager.getMigrationLogEntries();
        addLog('testDataMigration0020: entries=%{public}d', String(entries.length));
        expect(entries.length).assertLargerOrEqual(1);
        expect(manager.isInitialized()).assertTrue();
        expect(entries.length).assertLargerOrEqual(2);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_2100
     * @tc.name: testDataMigration0021
     * @tc.desc: Verify async migrate updates version and completes.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0021', 0, (done: Function) => {
      runCase('testDataMigration0021', async (): Promise<void> => {
        manager.initialize(1);
        manager.registerMigrationStep(1, 2, 'Async step');
        const result: string = await manager.migrate(2);
        addLog('testDataMigration0021: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getCurrentVersion()).assertEqual(2);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_MIGRATION_2200
     * @tc.name: testDataMigration0022
     * @tc.desc: Verify async migrate fails with invalid target.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataMigration0022', 0, (done: Function) => {
      runCase('testDataMigration0022', async (): Promise<void> => {
        manager.initialize(1);
        const result: string = await manager.migrate(0);
        addLog('testDataMigration0022: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCurrentVersion()).assertEqual(1);
      }, done);
    });
  });
}
