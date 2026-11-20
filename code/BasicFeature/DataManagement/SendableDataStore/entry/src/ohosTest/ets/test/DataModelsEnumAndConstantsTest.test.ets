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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import {
    DataType, StoreType, SyncMode, EncryptionMode, HashAlgorithm,
    ConflictPolicy, MigrationStatus, BackupStatus, LogLevel, SecurityLevel
} from '../../../main/ets/models/DataModels';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataModelsEnumAndConstantsTest(): void {
    describe('DataModelsEnumAndConstantsTest', () => {
        beforeAll(() => {
            addLog('DataModelsEnumAndConstantsTest suite started');
        })

        afterAll(() => {
            addLog('DataModelsEnumAndConstantsTest suite finished');
        })

        

        /*
         * @tc.number: SUB_ENUM_0100
         * @tc.name: testEnum0001
         * @tc.desc: Verify DataType enum has all 7 expected values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0001', 0, (done: Function) => {
            runCase('testEnum0001', async (): Promise<void> => {
                expect(DataType.STRING).assertEqual('string');
                expect(DataType.NUMBER).assertEqual('number');
                expect(DataType.BOOLEAN).assertEqual('boolean');
                expect(DataType.OBJECT).assertEqual('object');
                expect(DataType.ARRAY).assertEqual('array');
                expect(DataType.NULL).assertEqual('null');
                expect(DataType.UNDEFINED).assertEqual('undefined');
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_0200
         * @tc.name: testEnum0002
         * @tc.desc: Verify DataType enum values are unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0002', 0, (done: Function) => {
            runCase('testEnum0002', async (): Promise<void> => {
                const values: string[] = [
                    DataType.STRING, DataType.NUMBER, DataType.BOOLEAN,
                    DataType.OBJECT, DataType.ARRAY, DataType.NULL, DataType.UNDEFINED
                ];
                expect(values.length).assertEqual(7);
                expect(values[0]).assertEqual('string');
                for (let i = 0; i < values.length; i++) {
                    for (let j = i + 1; j < values.length; j++) {
                        expect(values[i] === values[j]).assertFalse();
                    }
                }
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_0300
         * @tc.name: testEnum0003
         * @tc.desc: Verify DataType string values are lowercase.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testEnum0003', 0, (done: Function) => {
            runCase('testEnum0003', async (): Promise<void> => {
                const values: string[] = [
                    DataType.STRING, DataType.NUMBER, DataType.BOOLEAN,
                    DataType.OBJECT, DataType.ARRAY, DataType.NULL, DataType.UNDEFINED
                ];
                expect(values.length).assertEqual(7);
                expect(values[0]).assertEqual('string');
                for (let i = 0; i < values.length; i++) {
                    const lower = values[i].toLowerCase();
                    expect(lower).assertEqual(values[i]);
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_0400
         * @tc.name: testEnum0004
         * @tc.desc: Verify StoreType enum has all 6 expected values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0004', 0, (done: Function) => {
            runCase('testEnum0004', async (): Promise<void> => {
                expect(StoreType.PREFERENCES).assertEqual('preferences');
                expect(StoreType.RDB).assertEqual('rdb');
                expect(StoreType.ARRAY).assertEqual('array');
                expect(StoreType.MAP).assertEqual('map');
                expect(StoreType.QUEUE).assertEqual('queue');
                expect(StoreType.RECORD).assertEqual('record');
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_0500
         * @tc.name: testEnum0005
         * @tc.desc: Verify StoreType enum values are unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0005', 0, (done: Function) => {
            runCase('testEnum0005', async (): Promise<void> => {
                const values: string[] = [
                    StoreType.PREFERENCES, StoreType.RDB, StoreType.ARRAY,
                    StoreType.MAP, StoreType.QUEUE, StoreType.RECORD
                ];
                expect(values.length).assertEqual(6);
                expect(values[0]).assertEqual('preferences');
                for (let i = 0; i < values.length; i++) {
                    for (let j = i + 1; j < values.length; j++) {
                        expect(values[i] === values[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_0600
         * @tc.name: testEnum0006
         * @tc.desc: Verify SyncMode enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0006', 0, (done: Function) => {
            runCase('testEnum0006', async (): Promise<void> => {
                expect(SyncMode.REAL_TIME).assertEqual('realTime');
                expect(SyncMode.PERIODIC).assertEqual('periodic');
                expect(SyncMode.MANUAL).assertEqual('manual');
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_0700
         * @tc.name: testEnum0007
         * @tc.desc: Verify SyncMode values are unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testEnum0007', 0, (done: Function) => {
            runCase('testEnum0007', async (): Promise<void> => {
                const values: string[] = [SyncMode.REAL_TIME, SyncMode.PERIODIC, SyncMode.MANUAL];
                expect(values.length).assertEqual(3);
                expect(values[0]).assertEqual('realTime');
                for (let i = 0; i < values.length; i++) {
                    for (let j = i + 1; j < values.length; j++) {
                        expect(values[i] === values[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_0800
         * @tc.name: testEnum0008
         * @tc.desc: Verify EncryptionMode enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0008', 0, (done: Function) => {
            runCase('testEnum0008', async (): Promise<void> => {
                expect(EncryptionMode.AES_128).assertEqual('AES-128');
                expect(EncryptionMode.AES_256).assertEqual('AES-256');
                expect(EncryptionMode.SM4).assertEqual('SM4');
                expect(EncryptionMode.NONE).assertEqual('NONE');
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_0900
         * @tc.name: testEnum0009
         * @tc.desc: Verify EncryptionMode values are unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testEnum0009', 0, (done: Function) => {
            runCase('testEnum0009', async (): Promise<void> => {
                const values: string[] = [
                    EncryptionMode.AES_128, EncryptionMode.AES_256,
                    EncryptionMode.SM4, EncryptionMode.NONE
                ];
                expect(values.length).assertEqual(4);
                expect(values[0]).assertEqual('AES-128');
                for (let i = 0; i < values.length; i++) {
                    for (let j = i + 1; j < values.length; j++) {
                        expect(values[i] === values[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1000
         * @tc.name: testEnum0010
         * @tc.desc: Verify HashAlgorithm enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0010', 0, (done: Function) => {
            runCase('testEnum0010', async (): Promise<void> => {
                expect(HashAlgorithm.SHA_256).assertEqual('SHA-256');
                expect(HashAlgorithm.SHA_512).assertEqual('SHA-512');
                expect(HashAlgorithm.SM3).assertEqual('SM3');
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1100
         * @tc.name: testEnum0011
         * @tc.desc: Verify ConflictPolicy enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0011', 0, (done: Function) => {
            runCase('testEnum0011', async (): Promise<void> => {
                expect(ConflictPolicy.LOCAL_FIRST).assertEqual('localFirst');
                expect(ConflictPolicy.REMOTE_FIRST).assertEqual('remoteFirst');
                expect(ConflictPolicy.TIMESTAMP).assertEqual('timestamp');
                expect(ConflictPolicy.MERGE).assertEqual('merge');
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_1200
         * @tc.name: testEnum0012
         * @tc.desc: Verify ConflictPolicy values are unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testEnum0012', 0, (done: Function) => {
            runCase('testEnum0012', async (): Promise<void> => {
                const values: string[] = [
                    ConflictPolicy.LOCAL_FIRST, ConflictPolicy.REMOTE_FIRST,
                    ConflictPolicy.TIMESTAMP, ConflictPolicy.MERGE
                ];
                expect(values.length).assertEqual(4);
                expect(values[0]).assertEqual('localFirst');
                for (let i = 0; i < values.length; i++) {
                    for (let j = i + 1; j < values.length; j++) {
                        expect(values[i] === values[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1300
         * @tc.name: testEnum0013
         * @tc.desc: Verify MigrationStatus enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0013', 0, (done: Function) => {
            runCase('testEnum0013', async (): Promise<void> => {
                expect(MigrationStatus.IDLE).assertEqual('idle');
                expect(MigrationStatus.IN_PROGRESS).assertEqual('inProgress');
                expect(MigrationStatus.COMPLETED).assertEqual('completed');
                expect(MigrationStatus.FAILED).assertEqual('failed');
                expect(MigrationStatus.ROLLED_BACK).assertEqual('rolledBack');
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1400
         * @tc.name: testEnum0014
         * @tc.desc: Verify BackupStatus enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0014', 0, (done: Function) => {
            runCase('testEnum0014', async (): Promise<void> => {
                expect(BackupStatus.IDLE).assertEqual('idle');
                expect(BackupStatus.CREATING).assertEqual('creating');
                expect(BackupStatus.COMPLETED).assertEqual('completed');
                expect(BackupStatus.RESTORING).assertEqual('restoring');
                expect(BackupStatus.FAILED).assertEqual('failed');
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1500
         * @tc.name: testEnum0015
         * @tc.desc: Verify LogLevel enum numeric values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0015', 0, (done: Function) => {
            runCase('testEnum0015', async (): Promise<void> => {
                expect(LogLevel.DEBUG).assertEqual(0);
                expect(LogLevel.INFO).assertEqual(1);
                expect(LogLevel.WARN).assertEqual(2);
                expect(LogLevel.ERROR).assertEqual(3);
                expect(LogLevel.NONE).assertEqual(4);
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_1600
         * @tc.name: testEnum0016
         * @tc.desc: Verify LogLevel values are strictly ascending.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testEnum0016', 0, (done: Function) => {
            runCase('testEnum0016', async (): Promise<void> => {
                expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
                expect(LogLevel.INFO < LogLevel.WARN).assertTrue();
                expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
                expect(LogLevel.ERROR < LogLevel.NONE).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1700
         * @tc.name: testEnum0017
         * @tc.desc: Verify SecurityLevel enum values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0017', 0, (done: Function) => {
            runCase('testEnum0017', async (): Promise<void> => {
                expect(SecurityLevel.S1).assertEqual('S1');
                expect(SecurityLevel.S2).assertEqual('S2');
                expect(SecurityLevel.S3).assertEqual('S3');
                expect(SecurityLevel.S4).assertEqual('S4');
            }, done);
        });

        

        /*
         * @tc.number: SUB_ENUM_1800
         * @tc.name: testEnum0018
         * @tc.desc: Verify DataType enum matches DataStoreConstants DATA_TYPE values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0018', 0, (done: Function) => {
            runCase('testEnum0018', async (): Promise<void> => {
                expect(DataType.STRING).assertEqual(DataStoreConstants.DATA_TYPE_STRING);
                expect(DataType.NUMBER).assertEqual(DataStoreConstants.DATA_TYPE_NUMBER);
                expect(DataType.BOOLEAN).assertEqual(DataStoreConstants.DATA_TYPE_BOOLEAN);
                expect(DataType.OBJECT).assertEqual(DataStoreConstants.DATA_TYPE_OBJECT);
                expect(DataType.ARRAY).assertEqual(DataStoreConstants.DATA_TYPE_ARRAY);
                expect(DataType.NULL).assertEqual(DataStoreConstants.DATA_TYPE_NULL);
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_1900
         * @tc.name: testEnum0019
         * @tc.desc: Verify StoreType enum matches DataStoreConstants STORE_TYPE values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0019', 0, (done: Function) => {
            runCase('testEnum0019', async (): Promise<void> => {
                expect(StoreType.PREFERENCES).assertEqual(DataStoreConstants.STORE_TYPE_PREFERENCES);
                expect(StoreType.RDB).assertEqual(DataStoreConstants.STORE_TYPE_RDB);
                expect(StoreType.ARRAY).assertEqual(DataStoreConstants.STORE_TYPE_ARRAY);
                expect(StoreType.MAP).assertEqual(DataStoreConstants.STORE_TYPE_MAP);
                expect(StoreType.QUEUE).assertEqual(DataStoreConstants.STORE_TYPE_QUEUE);
                expect(StoreType.RECORD).assertEqual(DataStoreConstants.STORE_TYPE_RECORD);
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_2000
         * @tc.name: testEnum0020
         * @tc.desc: Verify SyncMode enum matches DataStoreConstants SYNC_MODE values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0020', 0, (done: Function) => {
            runCase('testEnum0020', async (): Promise<void> => {
                expect(SyncMode.REAL_TIME).assertEqual(DataStoreConstants.SYNC_MODE_REAL_TIME);
                expect(SyncMode.PERIODIC).assertEqual(DataStoreConstants.SYNC_MODE_PERIODIC);
                expect(SyncMode.MANUAL).assertEqual(DataStoreConstants.SYNC_MODE_MANUAL);
            }, done);
        });

        /*
         * @tc.number: SUB_ENUM_2100
         * @tc.name: testEnum0021
         * @tc.desc: Verify EncryptionMode and HashAlgorithm match constants.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testEnum0021', 0, (done: Function) => {
            runCase('testEnum0021', async (): Promise<void> => {
                expect(EncryptionMode.AES_128).assertEqual(DataStoreConstants.ENCRYPTION_AES_128);
                expect(EncryptionMode.AES_256).assertEqual(DataStoreConstants.ENCRYPTION_AES_256);
                expect(EncryptionMode.SM4).assertEqual(DataStoreConstants.ENCRYPTION_SM4);
                expect(HashAlgorithm.SHA_256).assertEqual(DataStoreConstants.HASH_SHA256);
                expect(HashAlgorithm.SHA_512).assertEqual(DataStoreConstants.HASH_SHA512);
                expect(HashAlgorithm.SM3).assertEqual(DataStoreConstants.HASH_SM3);
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_0100
         * @tc.name: testConst0001
         * @tc.desc: Verify error codes are in range 10001-10018 and unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0001', 0, (done: Function) => {
            runCase('testConst0001', async (): Promise<void> => {
                const codes: number[] = [
                    DataStoreConstants.ERROR_NOT_INITIALIZED,
                    DataStoreConstants.ERROR_ALREADY_INITIALIZED,
                    DataStoreConstants.ERROR_INVALID_KEY,
                    DataStoreConstants.ERROR_INVALID_VALUE,
                    DataStoreConstants.ERROR_STORE_FULL,
                    DataStoreConstants.ERROR_TABLE_NOT_FOUND,
                    DataStoreConstants.ERROR_NETWORK,
                    DataStoreConstants.ERROR_ENCRYPTION,
                    DataStoreConstants.ERROR_MIGRATION,
                    DataStoreConstants.ERROR_BACKUP,
                    DataStoreConstants.ERROR_CONFLICT,
                    DataStoreConstants.ERROR_CAPACITY_EXCEEDED,
                    DataStoreConstants.ERROR_INDEX_OUT_OF_BOUNDS,
                    DataStoreConstants.ERROR_TYPE_MISMATCH,
                    DataStoreConstants.ERROR_SCHEMA_MISMATCH,
                    DataStoreConstants.ERROR_TRANSACTION,
                    DataStoreConstants.ERROR_SQL_EXECUTION,
                    DataStoreConstants.ERROR_DEVICE_OFFLINE
                ];
                expect(codes.length).assertEqual(18);
                expect(codes[0]).assertEqual(10001);
                expect(codes[17]).assertEqual(10018);
                for (let i = 0; i < codes.length; i++) {
                    for (let j = i + 1; j < codes.length; j++) {
                        expect(codes[i] === codes[j]).assertFalse();
                    }
                }
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_0200
         * @tc.name: testConst0002
         * @tc.desc: Verify error codes are strictly sequential starting from 10001.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0002', 0, (done: Function) => {
            runCase('testConst0002', async (): Promise<void> => {
                expect(DataStoreConstants.ERROR_NOT_INITIALIZED).assertEqual(10001);
                expect(DataStoreConstants.ERROR_ALREADY_INITIALIZED).assertEqual(10002);
                expect(DataStoreConstants.ERROR_INVALID_KEY).assertEqual(10003);
                expect(DataStoreConstants.ERROR_INVALID_VALUE).assertEqual(10004);
                expect(DataStoreConstants.ERROR_STORE_FULL).assertEqual(10005);
                expect(DataStoreConstants.ERROR_TABLE_NOT_FOUND).assertEqual(10006);
                expect(DataStoreConstants.ERROR_NETWORK).assertEqual(10007);
                expect(DataStoreConstants.ERROR_ENCRYPTION).assertEqual(10008);
                expect(DataStoreConstants.ERROR_MIGRATION).assertEqual(10009);
                expect(DataStoreConstants.ERROR_BACKUP).assertEqual(10010);
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_0300
         * @tc.name: testConst0003
         * @tc.desc: Verify remaining error codes 10011-10018.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0003', 0, (done: Function) => {
            runCase('testConst0003', async (): Promise<void> => {
                expect(DataStoreConstants.ERROR_CONFLICT).assertEqual(10011);
                expect(DataStoreConstants.ERROR_CAPACITY_EXCEEDED).assertEqual(10012);
                expect(DataStoreConstants.ERROR_INDEX_OUT_OF_BOUNDS).assertEqual(10013);
                expect(DataStoreConstants.ERROR_TYPE_MISMATCH).assertEqual(10014);
                expect(DataStoreConstants.ERROR_SCHEMA_MISMATCH).assertEqual(10015);
                expect(DataStoreConstants.ERROR_TRANSACTION).assertEqual(10016);
                expect(DataStoreConstants.ERROR_SQL_EXECUTION).assertEqual(10017);
                expect(DataStoreConstants.ERROR_DEVICE_OFFLINE).assertEqual(10018);
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_0400
         * @tc.name: testConst0004
         * @tc.desc: Verify all error codes are positive integers.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0004', 0, (done: Function) => {
            runCase('testConst0004', async (): Promise<void> => {
                const codes: number[] = [
                    DataStoreConstants.ERROR_NOT_INITIALIZED,
                    DataStoreConstants.ERROR_ALREADY_INITIALIZED,
                    DataStoreConstants.ERROR_INVALID_KEY,
                    DataStoreConstants.ERROR_INVALID_VALUE,
                    DataStoreConstants.ERROR_STORE_FULL,
                    DataStoreConstants.ERROR_TABLE_NOT_FOUND,
                    DataStoreConstants.ERROR_NETWORK,
                    DataStoreConstants.ERROR_ENCRYPTION,
                    DataStoreConstants.ERROR_MIGRATION,
                    DataStoreConstants.ERROR_BACKUP,
                    DataStoreConstants.ERROR_CONFLICT,
                    DataStoreConstants.ERROR_CAPACITY_EXCEEDED,
                    DataStoreConstants.ERROR_INDEX_OUT_OF_BOUNDS,
                    DataStoreConstants.ERROR_TYPE_MISMATCH,
                    DataStoreConstants.ERROR_SCHEMA_MISMATCH,
                    DataStoreConstants.ERROR_TRANSACTION,
                    DataStoreConstants.ERROR_SQL_EXECUTION,
                    DataStoreConstants.ERROR_DEVICE_OFFLINE
                ];
                for (let i = 0; i < codes.length; i++) {
                    expect(Number.isInteger(codes[i])).assertTrue();
                    expect(codes[i] > 0).assertTrue();
                }
                expect(codes.length).assertEqual(18);
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_0500
         * @tc.name: testConst0005
         * @tc.desc: Verify event name constants have expected string values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0005', 0, (done: Function) => {
            runCase('testConst0005', async (): Promise<void> => {
                expect(DataStoreConstants.EVENT_CHANGE).assertEqual('change');
                expect(DataStoreConstants.EVENT_MULTI_PROCESS_CHANGE).assertEqual('multiProcessChange');
                expect(DataStoreConstants.EVENT_DATA_CHANGE).assertEqual('dataChange');
                expect(DataStoreConstants.EVENT_SYNC).assertEqual('sync');
                expect(DataStoreConstants.EVENT_MIGRATION).assertEqual('migration');
                expect(DataStoreConstants.EVENT_BACKUP).assertEqual('backup');
                expect(DataStoreConstants.EVENT_ENCRYPTION).assertEqual('encryption');
                expect(DataStoreConstants.EVENT_DEVICE_CONNECTED).assertEqual('deviceConnected');
                expect(DataStoreConstants.EVENT_DEVICE_DISCONNECTED).assertEqual('deviceDisconnected');
                expect(DataStoreConstants.EVENT_CONFLICT_RESOLVED).assertEqual('conflictResolved');
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_0600
         * @tc.name: testConst0006
         * @tc.desc: Verify event name constants are all unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0006', 0, (done: Function) => {
            runCase('testConst0006', async (): Promise<void> => {
                const events: string[] = [
                    DataStoreConstants.EVENT_CHANGE,
                    DataStoreConstants.EVENT_MULTI_PROCESS_CHANGE,
                    DataStoreConstants.EVENT_DATA_CHANGE,
                    DataStoreConstants.EVENT_SYNC,
                    DataStoreConstants.EVENT_MIGRATION,
                    DataStoreConstants.EVENT_BACKUP,
                    DataStoreConstants.EVENT_ENCRYPTION,
                    DataStoreConstants.EVENT_DEVICE_CONNECTED,
                    DataStoreConstants.EVENT_DEVICE_DISCONNECTED,
                    DataStoreConstants.EVENT_CONFLICT_RESOLVED
                ];
                expect(events.length).assertEqual(10);
                expect(events[0]).assertEqual('change');
                for (let i = 0; i < events.length; i++) {
                    for (let j = i + 1; j < events.length; j++) {
                        expect(events[i] === events[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_0700
         * @tc.name: testConst0007
         * @tc.desc: Verify config key constants have expected string values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0007', 0, (done: Function) => {
            runCase('testConst0007', async (): Promise<void> => {
                expect(DataStoreConstants.CONFIG_AUTO_BACKUP).assertEqual('autoBackup');
                expect(DataStoreConstants.CONFIG_ENCRYPTION_MODE).assertEqual('encryptionMode');
                expect(DataStoreConstants.CONFIG_SYNC_INTERVAL).assertEqual('syncInterval');
                expect(DataStoreConstants.CONFIG_MAX_RETRIES).assertEqual('maxRetries');
                expect(DataStoreConstants.CONFIG_LOG_LEVEL).assertEqual('logLevel');
                expect(DataStoreConstants.CONFIG_DEBUG_MODE).assertEqual('debugMode');
                expect(DataStoreConstants.CONFIG_BATCH_SIZE).assertEqual('batchSize');
                expect(DataStoreConstants.CONFIG_CACHE_ENABLED).assertEqual('cacheEnabled');
                expect(DataStoreConstants.CONFIG_MIGRATION_AUTO).assertEqual('migrationAuto');
                expect(DataStoreConstants.CONFIG_CONFLICT_POLICY).assertEqual('conflictPolicy');
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_0800
         * @tc.name: testConst0008
         * @tc.desc: Verify config key constants are all unique.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0008', 0, (done: Function) => {
            runCase('testConst0008', async (): Promise<void> => {
                const keys: string[] = [
                    DataStoreConstants.CONFIG_AUTO_BACKUP,
                    DataStoreConstants.CONFIG_ENCRYPTION_MODE,
                    DataStoreConstants.CONFIG_SYNC_INTERVAL,
                    DataStoreConstants.CONFIG_MAX_RETRIES,
                    DataStoreConstants.CONFIG_LOG_LEVEL,
                    DataStoreConstants.CONFIG_DEBUG_MODE,
                    DataStoreConstants.CONFIG_BATCH_SIZE,
                    DataStoreConstants.CONFIG_CACHE_ENABLED,
                    DataStoreConstants.CONFIG_MIGRATION_AUTO,
                    DataStoreConstants.CONFIG_CONFLICT_POLICY
                ];
                expect(keys.length).assertEqual(10);
                expect(keys[0]).assertEqual('autoBackup');
                for (let i = 0; i < keys.length; i++) {
                    for (let j = i + 1; j < keys.length; j++) {
                        expect(keys[i] === keys[j]).assertFalse();
                    }
                }
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_0900
         * @tc.name: testConst0009
         * @tc.desc: Verify capacity limit constants have expected values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0009', 0, (done: Function) => {
            runCase('testConst0009', async (): Promise<void> => {
                expect(DataStoreConstants.MAX_STORE_COUNT).assertEqual(16);
                expect(DataStoreConstants.MAX_KEY_LENGTH).assertEqual(8192);
                expect(DataStoreConstants.MAX_VALUE_LENGTH).assertEqual(8192);
                expect(DataStoreConstants.MAX_BATCH_SIZE).assertEqual(200);
                expect(DataStoreConstants.MAX_QUEUE_CAPACITY).assertEqual(10000);
                expect(DataStoreConstants.MAX_MAP_SIZE).assertEqual(50000);
                expect(DataStoreConstants.MAX_ARRAY_CAPACITY).assertEqual(100000);
                expect(DataStoreConstants.MAX_RECORD_FIELDS).assertEqual(256);
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_1000
         * @tc.name: testConst0010
         * @tc.desc: Verify capacity limits are all positive integers.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0010', 0, (done: Function) => {
            runCase('testConst0010', async (): Promise<void> => {
                const limits: number[] = [
                    DataStoreConstants.MAX_STORE_COUNT,
                    DataStoreConstants.MAX_KEY_LENGTH,
                    DataStoreConstants.MAX_VALUE_LENGTH,
                    DataStoreConstants.MAX_BATCH_SIZE,
                    DataStoreConstants.MAX_QUEUE_CAPACITY,
                    DataStoreConstants.MAX_MAP_SIZE,
                    DataStoreConstants.MAX_ARRAY_CAPACITY,
                    DataStoreConstants.MAX_RECORD_FIELDS
                ];
                for (let i = 0; i < limits.length; i++) {
                    expect(Number.isInteger(limits[i])).assertTrue();
                    expect(limits[i] > 0).assertTrue();
                }
                expect(limits.length).assertEqual(8);
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_1100
         * @tc.name: testConst0011
         * @tc.desc: Verify store version constants.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0011', 0, (done: Function) => {
            runCase('testConst0011', async (): Promise<void> => {
                expect(DataStoreConstants.STORE_VERSION_1).assertEqual(1);
                expect(DataStoreConstants.STORE_VERSION_2).assertEqual(2);
                expect(DataStoreConstants.STORE_VERSION_3).assertEqual(3);
                expect(DataStoreConstants.CURRENT_STORE_VERSION).assertEqual(3);
                expect(DataStoreConstants.CURRENT_STORE_VERSION).assertEqual(DataStoreConstants.STORE_VERSION_3);
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_1200
         * @tc.name: testConst0012
         * @tc.desc: Verify default store/db/table name constants are non-empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0012', 0, (done: Function) => {
            runCase('testConst0012', async (): Promise<void> => {
                expect(DataStoreConstants.DEFAULT_STORE_NAME.length > 0).assertTrue();
                expect(DataStoreConstants.DEFAULT_DB_NAME.length > 0).assertTrue();
                expect(DataStoreConstants.DEFAULT_TABLE_NAME.length > 0).assertTrue();
                expect(DataStoreConstants.DEFAULT_STORE_NAME).assertEqual('sendable_data_store');
                expect(DataStoreConstants.DEFAULT_DB_NAME).assertEqual('SendableDataStore.db');
                expect(DataStoreConstants.DEFAULT_TABLE_NAME).assertEqual('sendable_sample');
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_1300
         * @tc.name: testConst0013
         * @tc.desc: Verify hilog domain and tag constants.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0013', 0, (done: Function) => {
            runCase('testConst0013', async (): Promise<void> => {
                expect(DataStoreConstants.HILOG_DOMAIN).assertEqual(0xF811);
                expect(DataStoreConstants.HILOG_DOMAIN > 0).assertTrue();
                expect(DataStoreConstants.HILOG_TAG.length > 0).assertTrue();
                expect(DataStoreConstants.HILOG_TAG.indexOf('SendableDataStore') >= 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_1400
         * @tc.name: testConst0014
         * @tc.desc: Verify MIME type constants.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0014', 0, (done: Function) => {
            runCase('testConst0014', async (): Promise<void> => {
                expect(DataStoreConstants.MIME_JSON).assertEqual('application/json');
                expect(DataStoreConstants.MIME_TEXT).assertEqual('text/plain');
                expect(DataStoreConstants.MIME_BINARY).assertEqual('application/octet-stream');
            }, done);
        });

        /*
         * @tc.number: SUB_CONST_1500
         * @tc.name: testConst0015
         * @tc.desc: Verify file extension and meta file constants.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testConst0015', 0, (done: Function) => {
            runCase('testConst0015', async (): Promise<void> => {
                expect(DataStoreConstants.BACKUP_EXTENSION).assertEqual('.sdbackup');
                expect(DataStoreConstants.BACKUP_META_FILE).assertEqual('backup_meta.json');
                expect(DataStoreConstants.MIGRATION_LOG_FILE).assertEqual('migration_log.json');
                expect(DataStoreConstants.BACKUP_EXTENSION.length > 0).assertTrue();
                expect(DataStoreConstants.BACKUP_META_FILE.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_1600
         * @tc.name: testConst0016
         * @tc.desc: Verify LogLevel enum matches DataStoreConstants LOG_LEVEL values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0016', 0, (done: Function) => {
            runCase('testConst0016', async (): Promise<void> => {
                expect(LogLevel.DEBUG).assertEqual(DataStoreConstants.LOG_LEVEL_DEBUG);
                expect(LogLevel.INFO).assertEqual(DataStoreConstants.LOG_LEVEL_INFO);
                expect(LogLevel.WARN).assertEqual(DataStoreConstants.LOG_LEVEL_WARN);
                expect(LogLevel.ERROR).assertEqual(DataStoreConstants.LOG_LEVEL_ERROR);
                expect(LogLevel.NONE).assertEqual(DataStoreConstants.LOG_LEVEL_NONE);
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_1700
         * @tc.name: testConst0017
         * @tc.desc: Verify SecurityLevel enum matches DataStoreConstants SECURITY_LEVEL values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0017', 0, (done: Function) => {
            runCase('testConst0017', async (): Promise<void> => {
                expect(SecurityLevel.S1).assertEqual(DataStoreConstants.SECURITY_LEVEL_S1);
                expect(SecurityLevel.S2).assertEqual(DataStoreConstants.SECURITY_LEVEL_S2);
                expect(SecurityLevel.S3).assertEqual(DataStoreConstants.SECURITY_LEVEL_S3);
                expect(SecurityLevel.S4).assertEqual(DataStoreConstants.SECURITY_LEVEL_S4);
            }, done);
        });

        

        /*
         * @tc.number: SUB_CONST_1800
         * @tc.name: testConst0018
         * @tc.desc: Verify ConflictPolicy enum matches DataStoreConstants CONFLICT_POLICY values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testConst0018', 0, (done: Function) => {
            runCase('testConst0018', async (): Promise<void> => {
                expect(ConflictPolicy.LOCAL_FIRST).assertEqual(DataStoreConstants.CONFLICT_POLICY_LOCAL_FIRST);
                expect(ConflictPolicy.REMOTE_FIRST).assertEqual(DataStoreConstants.CONFLICT_POLICY_REMOTE_FIRST);
                expect(ConflictPolicy.TIMESTAMP).assertEqual(DataStoreConstants.CONFLICT_POLICY_TIMESTAMP);
                expect(ConflictPolicy.MERGE).assertEqual(DataStoreConstants.CONFLICT_POLICY_MERGE);
            }, done);
        });
    });
}
