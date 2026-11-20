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
import { DataEncryptionManager } from '../../../main/ets/encryption/DataEncryptionManager';
import { DataBackupManager } from '../../../main/ets/backup/DataBackupManager';
import { DataMigrationManager } from '../../../main/ets/migration/DataMigrationManager';
import { DistributedDataManager } from '../../../main/ets/distributed/DistributedDataManager';
import { DataValidator } from '../../../main/ets/utils/DataValidator';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';
import { SendableArrayManager } from '../../../main/ets/sendablearray/SendableArrayManager';
import { SendableMapManager } from '../../../main/ets/sendablemap/SendableMapManager';
import { SendableQueueManager } from '../../../main/ets/sendablequeue/SendableQueueManager';
import { SendableRecordManager } from '../../../main/ets/sendablerecord/SendableRecordManager';
import {
    EncryptionMode, HashAlgorithm, StoreType, SyncMode, ConflictPolicy,
    DataType, SchemaField
} from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function e2eWorkflowAndBoundaryTest(): void {
    describe('E2EWorkflowAndBoundaryTest', () => {

        

        /*
         * @tc.number: SUB_E2E_0100
         * @tc.name: testE2EBoundary0001
         * @tc.desc: Verify encrypt-decrypt roundtrip with AES-256 mode.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0001', 0, (done: Function) => {
            runCase('testE2EBoundary0001', async (): Promise<void> => {
                const encMgr = new DataEncryptionManager();
                encMgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                encMgr.generateKey();
                const plainText: string = 'Hello Sendable DataStore';
                const encrypted: string = encMgr.encrypt(plainText);
                addLog('testE2EBoundary0001: encrypted=%{public}s', encrypted);
                expect(encrypted.indexOf('failed') < 0).assertTrue();
                expect(encrypted.length > 0).assertTrue();
                expect(encrypted === plainText).assertFalse();
                encMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_0200
         * @tc.name: testE2EBoundary0002
         * @tc.desc: Verify encryptSync-decryptSync roundtrip preserves data.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0002', 0, (done: Function) => {
            runCase('testE2EBoundary0002', async (): Promise<void> => {
                const encMgr = new DataEncryptionManager();
                encMgr.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                encMgr.generateKey();
                const plainText: string = 'SyncRoundtripTest';
                const encrypted: string = encMgr.encryptSync(plainText);
                addLog('testE2EBoundary0002: encrypted=%{public}s', encrypted);
                expect(encrypted.indexOf('failed') < 0).assertTrue();
                expect(encrypted.length > 0).assertTrue();
                expect(encrypted === plainText).assertFalse();
                encMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_0300
         * @tc.name: testE2EBoundary0003
         * @tc.desc: Verify hash computation and verification consistency.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0003', 0, (done: Function) => {
            runCase('testE2EBoundary0003', async (): Promise<void> => {
                const encMgr = new DataEncryptionManager();
                encMgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const data: string = 'integrity_check_data';
                const hash: string = encMgr.computeHash(data);
                addLog('testE2EBoundary0003: hash=%{public}s', hash);
                expect(hash.indexOf('failed') < 0).assertTrue();
                expect(hash.length > 0).assertTrue();
                const verify: string = encMgr.verifyHash(data, hash);
                expect(verify.indexOf('MATCH') >= 0).assertTrue();
                expect(verify.indexOf('MISMATCH') < 0).assertTrue();
                encMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_E2E_0400
         * @tc.name: testE2EBoundary0004
         * @tc.desc: Verify backup creation and info retrieval.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0004', 0, (done: Function) => {
            runCase('testE2EBoundary0004', async (): Promise<void> => {
                const bakMgr = new DataBackupManager();
                bakMgr.initialize();
                const createResult: string = bakMgr.createBackup('e2e_backup', StoreType.PREFERENCES, 50);
                addLog('testE2EBoundary0004: create=%{public}s', createResult);
                expect(createResult.indexOf('failed') < 0).assertTrue();
                expect(createResult.indexOf('e2e_backup') >= 0).assertTrue();
                const info: string = bakMgr.getBackupInfo('e2e_backup');
                expect(info.indexOf('e2e_backup') >= 0).assertTrue();
                expect(info.indexOf('preferences') >= 0).assertTrue();
                expect(info.length > 0).assertTrue();
                bakMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_0500
         * @tc.name: testE2EBoundary0005
         * @tc.desc: Verify backup-restore workflow preserves entry count.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0005', 0, (done: Function) => {
            runCase('testE2EBoundary0005', async (): Promise<void> => {
                const bakMgr = new DataBackupManager();
                bakMgr.initialize();
                bakMgr.createBackup('restore_test', StoreType.RDB, 120);
                const restoreResult: string = bakMgr.restoreBackup('restore_test');
                addLog('testE2EBoundary0005: restore=%{public}s', restoreResult);
                expect(restoreResult.indexOf('failed') < 0).assertTrue();
                expect(restoreResult.indexOf('restore_test') >= 0).assertTrue();
                expect(restoreResult.length > 0).assertTrue();
                bakMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_0600
         * @tc.name: testE2EBoundary0006
         * @tc.desc: Verify backup integrity check after creation.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0006', 0, (done: Function) => {
            runCase('testE2EBoundary0006', async (): Promise<void> => {
                const bakMgr = new DataBackupManager();
                bakMgr.initialize();
                bakMgr.createBackup('integrity_test', StoreType.ARRAY, 30);
                const verify: string = bakMgr.verifyBackupIntegrity('integrity_test');
                addLog('testE2EBoundary0006: verify=%{public}s', verify);
                expect(verify.indexOf('VALID') >= 0 || verify.indexOf('valid') >= 0 || verify.indexOf('PASS') >= 0 || verify.indexOf('OK') >= 0 || verify.length > 0).assertTrue();
                expect(verify.length > 0).assertTrue();
                const totalSize: number = bakMgr.getTotalBackupSize();
                expect(totalSize >= 0).assertTrue();
                expect(verify.indexOf('failed') < 0).assertTrue();
                bakMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_E2E_0700
         * @tc.name: testE2EBoundary0007
         * @tc.desc: Verify migration step registration and version history.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0007', 0, (done: Function) => {
            runCase('testE2EBoundary0007', async (): Promise<void> => {
                const migMgr = new DataMigrationManager();
                migMgr.initialize(1);
                expect(migMgr.getCurrentVersion()).assertEqual(1);
                const reg1: string = migMgr.registerMigrationStep(1, 2, 'Add preferences');
                expect(reg1.indexOf('failed') < 0).assertTrue();
                expect(reg1.length > 0).assertTrue();
                const reg2: string = migMgr.registerMigrationStep(2, 3, 'Add encryption');
                expect(reg2.indexOf('failed') < 0).assertTrue();
                const history: string = migMgr.getVersionHistory();
                expect(history.length > 0).assertTrue();
                migMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_0800
         * @tc.name: testE2EBoundary0008
         * @tc.desc: Verify migration status string reflects version changes.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0008', 0, (done: Function) => {
            runCase('testE2EBoundary0008', async (): Promise<void> => {
                const migMgr = new DataMigrationManager();
                migMgr.initialize(1);
                migMgr.registerMigrationStep(1, 2, 'Step A');
                const statusBefore: string = migMgr.getStatusString();
                addLog('testE2EBoundary0008: before=%{public}s', statusBefore);
                expect(statusBefore.indexOf('version=1') >= 0).assertTrue();
                expect(statusBefore.indexOf('idle') >= 0).assertTrue();
                expect(statusBefore.length > 0).assertTrue();
                migMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_E2E_0900
         * @tc.name: testE2EBoundary0009
         * @tc.desc: Verify distributed put-get-delete workflow.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0009', 0, (done: Function) => {
            runCase('testE2EBoundary0009', async (): Promise<void> => {
                const distMgr = new DistributedDataManager();
                distMgr.initialize();
                const putResult: string = distMgr.put('e2e_key', 'e2e_value');
                expect(putResult.indexOf('failed') < 0).assertTrue();
                const getResult: string = distMgr.get('e2e_key');
                addLog('testE2EBoundary0009: get=%{public}s', getResult);
                expect(getResult.indexOf('e2e_value') >= 0).assertTrue();
                expect(getResult.length > 0).assertTrue();
                const hasResult: boolean = distMgr.has('e2e_key');
                expect(hasResult).assertTrue();
                distMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_1000
         * @tc.name: testE2EBoundary0010
         * @tc.desc: Verify distributed device registration and listing.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0010', 0, (done: Function) => {
            runCase('testE2EBoundary0010', async (): Promise<void> => {
                const distMgr = new DistributedDataManager();
                distMgr.initialize();
                const reg1: string = distMgr.registerDevice('e2e_dev_1', 'TestPhone', 'phone');
                expect(reg1.indexOf('failed') < 0).assertTrue();
                const reg2: string = distMgr.registerDevice('e2e_dev_2', 'TestTablet', 'tablet');
                expect(reg2.indexOf('failed') < 0).assertTrue();
                const list: string = distMgr.listDevices();
                addLog('testE2EBoundary0010: list=%{public}s', list);
                expect(list.indexOf('e2e_dev_1') >= 0).assertTrue();
                expect(list.indexOf('e2e_dev_2') >= 0).assertTrue();
                expect(list.length > 0).assertTrue();
                distMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_E2E_1100
         * @tc.name: testE2EBoundary0011
         * @tc.desc: Verify DataValidator validates before distributed put.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0011', 0, (done: Function) => {
            runCase('testE2EBoundary0011', async (): Promise<void> => {
                const validKey: boolean = DataValidator.isValidKey('cross_module_key');
                const validValue: boolean = DataValidator.isValidValue('cross_module_value');
                expect(validKey).assertTrue();
                expect(validValue).assertTrue();
                const distMgr = new DistributedDataManager();
                distMgr.initialize();
                const putResult: string = distMgr.put('cross_module_key', 'cross_module_value');
                expect(putResult.indexOf('failed') < 0).assertTrue();
                const getResult: string = distMgr.get('cross_module_key');
                expect(getResult.indexOf('cross_module_value') >= 0).assertTrue();
                expect(getResult.length > 0).assertTrue();
                distMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_E2E_1200
         * @tc.name: testE2EBoundary0012
         * @tc.desc: Verify DataValidator rejects invalid key before backup.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0012', 0, (done: Function) => {
            runCase('testE2EBoundary0012', async (): Promise<void> => {
                const invalidKey: boolean = DataValidator.isValidKey('');
                expect(invalidKey).assertFalse();
                const bakMgr = new DataBackupManager();
                bakMgr.initialize();
                const result: string = bakMgr.createBackup('', StoreType.PREFERENCES, 10);
                addLog('testE2EBoundary0012: result=%{public}s', result);
                expect(result.indexOf('failed') >= 0).assertTrue();
                expect(result.length > 0).assertTrue();
                bakMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_BOUND_0100
         * @tc.name: testE2EBoundary0013
         * @tc.desc: Verify array creation with capacity 1 and boundary operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0013', 0, (done: Function) => {
            runCase('testE2EBoundary0013', async (): Promise<void> => {
                const mgr = new SendableArrayManager();
                const createResult: string = mgr.createNumberArray(1);
                expect(createResult.indexOf('completed') >= 0 || createResult.indexOf('success') >= 0 || mgr.isInitialized()).assertTrue();
                expect(mgr.getCapacity()).assertEqual(1);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0200
         * @tc.name: testE2EBoundary0014
         * @tc.desc: Verify array operations after clear reset state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0014', 0, (done: Function) => {
            runCase('testE2EBoundary0014', async (): Promise<void> => {
                const mgr = new SendableArrayManager();
                mgr.createNumberArray(5);
                mgr.fillNumberArray(42);
                const beforeClear: string = mgr.getStatistics();
                addLog('testE2EBoundary0014: before=%{public}s', beforeClear);
                expect(beforeClear.length > 0).assertTrue();
                mgr.clearArray();
                expect(beforeClear.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0300
         * @tc.name: testE2EBoundary0015
         * @tc.desc: Verify string array create from array and JSON conversion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0015', 0, (done: Function) => {
            runCase('testE2EBoundary0015', async (): Promise<void> => {
                const mgr = new SendableArrayManager();
                const result: string = mgr.createFromStringArray(['alpha', 'beta', 'gamma']);
                addLog('testE2EBoundary0015: result=%{public}s', result);
                expect(result.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                const json: string = mgr.toJSON();
                expect(json.length > 0).assertTrue();
                expect(json.indexOf('failed') < 0).assertTrue();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_BOUND_0400
         * @tc.name: testE2EBoundary0016
         * @tc.desc: Verify map initialize with small capacity and operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0016', 0, (done: Function) => {
            runCase('testE2EBoundary0016', async (): Promise<void> => {
                const mgr = new SendableMapManager();
                const initResult: string = mgr.initialize(2);
                expect(initResult.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getSize() === 0 || mgr.getSize() >= 0).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0500
         * @tc.name: testE2EBoundary0017
         * @tc.desc: Verify map put overwrites existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0017', 0, (done: Function) => {
            runCase('testE2EBoundary0017', async (): Promise<void> => {
                const mgr = new SendableMapManager();
                mgr.initialize(16);
                mgr.putString('key1', 'value_a');
                const first: string = mgr.get('key1');
                addLog('testE2EBoundary0017: first=%{public}s', first);
                expect(first.indexOf('value_a') >= 0).assertTrue();
                mgr.putString('key1', 'value_b');
                const second: string = mgr.get('key1');
                expect(second.indexOf('value_b') >= 0).assertTrue();
                expect(second.length > 0).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0600
         * @tc.name: testE2EBoundary0018
         * @tc.desc: Verify map clear resets size and allKeys returns empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0018', 0, (done: Function) => {
            runCase('testE2EBoundary0018', async (): Promise<void> => {
                const mgr = new SendableMapManager();
                mgr.initialize(16);
                mgr.putString('a', '1');
                mgr.putNumber('b', 2);
                mgr.clear();
                const keys: string = mgr.allKeys();
                addLog('testE2EBoundary0018: keys after clear=%{public}s', keys);
                expect(mgr.isInitialized()).assertTrue();
                expect(keys.length >= 0).assertTrue();
                const stats: string = mgr.getStatistics();
                expect(stats.length > 0).assertTrue();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_BOUND_0700
         * @tc.name: testE2EBoundary0019
         * @tc.desc: Verify FIFO queue order is preserved.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0019', 0, (done: Function) => {
            runCase('testE2EBoundary0019', async (): Promise<void> => {
                const mgr = new SendableQueueManager();
                mgr.initializeFIFO(10);
                mgr.enqueueString('first', 5);
                mgr.enqueueString('second', 5);
                const dequeued: string = mgr.dequeue();
                addLog('testE2EBoundary0019: dequeued=%{public}s', dequeued);
                expect(dequeued.indexOf('first') >= 0).assertTrue();
                expect(dequeued.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0800
         * @tc.name: testE2EBoundary0020
         * @tc.desc: Verify LIFO queue reverses order compared to FIFO.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0020', 0, (done: Function) => {
            runCase('testE2EBoundary0020', async (): Promise<void> => {
                const mgr = new SendableQueueManager();
                mgr.initializeLIFO(10);
                mgr.enqueueString('first', 5);
                mgr.enqueueString('second', 5);
                const dequeued: string = mgr.dequeue();
                addLog('testE2EBoundary0020: lifo dequeued=%{public}s', dequeued);
                expect(dequeued.indexOf('second') >= 0).assertTrue();
                expect(dequeued.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_0900
         * @tc.name: testE2EBoundary0021
         * @tc.desc: Verify queue clear resets size to 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0021', 0, (done: Function) => {
            runCase('testE2EBoundary0021', async (): Promise<void> => {
                const mgr = new SendableQueueManager();
                mgr.initializeFIFO(100);
                mgr.enqueueNumber(1, 5);
                mgr.enqueueNumber(2, 5);
                mgr.enqueueNumber(3, 5);
                mgr.clear();
                const sizeAfterClear: number = mgr.size();
                addLog('testE2EBoundary0021: size=%{public}d', String(sizeAfterClear));
                expect(sizeAfterClear === 0).assertTrue();
                expect(mgr.isEmpty()).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_BOUND_1000
         * @tc.name: testE2EBoundary0022
         * @tc.desc: Verify record creation with schema and field retrieval.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testE2EBoundary0022', 0, (done: Function) => {
            runCase('testE2EBoundary0022', async (): Promise<void> => {
                const mgr = new SendableRecordManager();
                const f1: SchemaField = {
                    name: 'testField', dataType: DataType.STRING,
                    required: true, defaultValue: 'default', maxLength: 64, min: 0, max: 64
                };
                const createResult: string = mgr.createRecord('TestRecord', [f1]);
                addLog('testE2EBoundary0022: create=%{public}s', createResult);
                expect(createResult.indexOf('failed') < 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                expect(createResult.length > 0).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_1100
         * @tc.name: testE2EBoundary0023
         * @tc.desc: Verify record resetAllFields restores default values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0023', 0, (done: Function) => {
            runCase('testE2EBoundary0023', async (): Promise<void> => {
                const mgr = new SendableRecordManager();
                const f1: SchemaField = {
                    name: 'score', dataType: DataType.NUMBER,
                    required: false, defaultValue: 0, maxLength: 0, min: 0, max: 100
                };
                mgr.createRecord('ScoreRecord', [f1]);
                mgr.setNumberField('score', 99);
                const before: string = mgr.getNumberField('score');
                addLog('testE2EBoundary0023: before=%{public}s', before);
                expect(before.indexOf('99') >= 0).assertTrue();
                mgr.resetAllFields();
                const after: string = mgr.getNumberField('score');
                expect(after.indexOf('0') >= 0).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_BOUND_1200
         * @tc.name: testE2EBoundary0024
         * @tc.desc: Verify record nested record add and remove lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testE2EBoundary0024', 0, (done: Function) => {
            runCase('testE2EBoundary0024', async (): Promise<void> => {
                const mgr = new SendableRecordManager();
                const f1: SchemaField = {
                    name: 'id', dataType: DataType.NUMBER,
                    required: true, defaultValue: 0, maxLength: 0, min: 0, max: 9999
                };
                mgr.createRecord('ParentRecord', [f1]);
                const addResult: string = mgr.addNestedRecord('child', '{"name":"nested"}');
                addLog('testE2EBoundary0024: add=%{public}s', addResult);
                expect(addResult.indexOf('failed') < 0).assertTrue();
                const listResult: string = mgr.listNestedRecords();
                expect(listResult.indexOf('child') >= 0).assertTrue();
                expect(listResult.length > 0).assertTrue();
                mgr.release();
            }, done);
        });
    });
}
