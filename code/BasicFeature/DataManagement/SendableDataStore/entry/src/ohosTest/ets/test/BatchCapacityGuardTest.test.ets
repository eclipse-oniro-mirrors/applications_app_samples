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
import { relationalStore } from '@kit.ArkData';
import { SendablePreferencesHelper } from '../../../main/ets/sendablepreferences/SendablePreferencesHelper';
import { SendableRdbHelper } from '../../../main/ets/sendablerelationalstore/SendableRdbHelper';
import { DataValidator } from '../../../main/ets/utils/DataValidator';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const TABLE_NAME: string = 'sendable_sample';

function createPrefHelper(): SendablePreferencesHelper {
    const context = getTestContext();
    return new SendablePreferencesHelper(context, (message: string): void => {
        addLog('BatchGuardPrefCallback: %{public}s', message);
    });
}

function createRdbHelper(): SendableRdbHelper {
    const context = getTestContext();
    return new SendableRdbHelper(context);
}

export default function batchCapacityGuardTest(): void {
    describe('BatchCapacityGuardTest', () => {
        let prefHelper: SendablePreferencesHelper = createPrefHelper();
        let rdbHelper: SendableRdbHelper = createRdbHelper();

        beforeAll(() => {
            addLog('BatchCapacityGuardTest suite started');
        })

        beforeEach(() => {
            prefHelper = createPrefHelper();
            rdbHelper = createRdbHelper();
        })

        afterEach(() => {
            prefHelper.release();
            rdbHelper.release();
        })

        afterAll(() => {
            addLog('BatchCapacityGuardTest suite finished');
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0001
         * @tc.name testBatchGuard0001
         * @tc.desc Verify putMultiple rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0001', 0, (done: Function) => {
            runCase('testBatchGuard0001', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                const values: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`batch_key_${i}`);
                    values.push(`batch_val_${i}`);
                }
                const result: string = await prefHelper.putMultiple(keys, values);
                addLog('testBatchGuard0001: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0002
         * @tc.name testBatchGuard0002
         * @tc.desc Verify getMultiple rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0002', 0, (done: Function) => {
            runCase('testBatchGuard0002', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`get_key_${i}`);
                }
                const result: string = await prefHelper.getMultiple(keys);
                addLog('testBatchGuard0002: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0003
         * @tc.name testBatchGuard0003
         * @tc.desc Verify deleteMultiple rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0003', 0, (done: Function) => {
            runCase('testBatchGuard0003', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`del_key_${i}`);
                }
                const result: string = await prefHelper.deleteMultiple(keys);
                addLog('testBatchGuard0003: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0004
         * @tc.name testBatchGuard0004
         * @tc.desc Verify hasMultiple rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0004', 0, (done: Function) => {
            runCase('testBatchGuard0004', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`has_key_${i}`);
                }
                const result: string = await prefHelper.hasMultiple(keys);
                addLog('testBatchGuard0004: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0005
         * @tc.name testBatchGuard0005
         * @tc.desc Verify putMultipleSync rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0005', 0, (done: Function) => {
            runCase('testBatchGuard0005', async () => {
                prefHelper.initializeSync();
                const keys: string[] = [];
                const values: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`sync_batch_${i}`);
                    values.push(`sync_val_${i}`);
                }
                const result: string = prefHelper.putMultipleSync(keys, values);
                addLog('testBatchGuard0005: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0006
         * @tc.name testBatchGuard0006
         * @tc.desc Verify getMultipleSync rejects keys exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0006', 0, (done: Function) => {
            runCase('testBatchGuard0006', async () => {
                prefHelper.initializeSync();
                const keys: string[] = [];
                for (let i = 0; i < 201; i++) {
                    keys.push(`sync_get_${i}`);
                }
                const result: string = prefHelper.getMultipleSync(keys);
                addLog('testBatchGuard0006: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0007
         * @tc.name testBatchGuard0007
         * @tc.desc Verify putMultiple rejects mismatched keys and values length.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0007', 0, (done: Function) => {
            runCase('testBatchGuard0007', async () => {
                await prefHelper.initialize();
                const keys: string[] = ['k1', 'k2', 'k3'];
                const values: string[] = ['v1', 'v2'];
                const result: string = await prefHelper.putMultiple(keys, values);
                addLog('testBatchGuard0007: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('mismatch');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0008
         * @tc.name testBatchGuard0008
         * @tc.desc Verify putMultipleSync rejects mismatched keys and values length.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0008', 0, (done: Function) => {
            runCase('testBatchGuard0008', async () => {
                prefHelper.initializeSync();
                const keys: string[] = ['a', 'b'];
                const values: string[] = ['x'];
                const result: string = prefHelper.putMultipleSync(keys, values);
                addLog('testBatchGuard0008: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('mismatch');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0009
         * @tc.name testBatchGuard0009
         * @tc.desc Verify putNumber rejects NaN value.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0009', 0, (done: Function) => {
            runCase('testBatchGuard0009', async () => {
                await prefHelper.initialize();
                const result: string = await prefHelper.putNumber('nanKey', NaN);
                addLog('testBatchGuard0009: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('invalid');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0010
         * @tc.name testBatchGuard0010
         * @tc.desc Verify putString rejects empty key.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0010', 0, (done: Function) => {
            runCase('testBatchGuard0010', async () => {
                await prefHelper.initialize();
                const result: string = await prefHelper.putString('', 'someValue');
                addLog('testBatchGuard0010: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('invalid key');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0011
         * @tc.name testBatchGuard0011
         * @tc.desc Verify setStoreVersion rejects version 0.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0011', 0, (done: Function) => {
            runCase('testBatchGuard0011', async () => {
                await prefHelper.initialize();
                const result: string = await prefHelper.setStoreVersion(0);
                addLog('testBatchGuard0011: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('invalid');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0012
         * @tc.name testBatchGuard0012
         * @tc.desc Verify putMultiple accepts exactly MAX_BATCH_SIZE=200 keys.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0012', 0, (done: Function) => {
            runCase('testBatchGuard0012', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                const values: string[] = [];
                for (let i = 0; i < DataStoreConstants.MAX_BATCH_SIZE; i++) {
                    keys.push(`exact_${i}`);
                    values.push(`val_${i}`);
                }
                const result: string = await prefHelper.putMultiple(keys, values);
                addLog('testBatchGuard0012: result=%{public}s', result);
                expect(result).assertContain('completed');
                expect(result).assertContain('200/200');
                expect(prefHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0013
         * @tc.name testBatchGuard0013
         * @tc.desc Verify getMultiple accepts exactly MAX_BATCH_SIZE=200 keys.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0013', 0, (done: Function) => {
            runCase('testBatchGuard0013', async () => {
                await prefHelper.initialize();
                const keys: string[] = [];
                const values: string[] = [];
                for (let i = 0; i < DataStoreConstants.MAX_BATCH_SIZE; i++) {
                    keys.push(`get_exact_${i}`);
                    values.push(`get_val_${i}`);
                }
                await prefHelper.putMultiple(keys, values);
                const result: string = await prefHelper.getMultiple(keys);
                addLog('testBatchGuard0013: result=%{public}s', result);
                expect(result).assertContain('getMultiple:');
                expect(prefHelper.isInitialized()).assertTrue();
                expect(result.indexOf('200')).assertLargerOrEqual(0);
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0014
         * @tc.name testBatchGuard0014
         * @tc.desc Verify RDB batchInsert rejects buckets exceeding MAX_BATCH_SIZE=200.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0014', 0, (done: Function) => {
            runCase('testBatchGuard0014', async () => {
                await rdbHelper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [];
                for (let i = 0; i < 201; i++) {
                    const bucket: relationalStore.ValuesBucket = { name: `user_${i}`, age: 20, active: 1 };
                    buckets.push(bucket);
                }
                const result: string = await rdbHelper.batchInsert(TABLE_NAME, buckets);
                addLog('testBatchGuard0014: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(rdbHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0015
         * @tc.name testBatchGuard0015
         * @tc.desc Verify RDB batchInsert accepts exactly MAX_BATCH_SIZE=200 buckets.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0015', 0, (done: Function) => {
            runCase('testBatchGuard0015', async () => {
                await rdbHelper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [];
                for (let i = 0; i < DataStoreConstants.MAX_BATCH_SIZE; i++) {
                    const bucket: relationalStore.ValuesBucket = { name: `batch_${i}`, age: 25, active: 1 };
                    buckets.push(bucket);
                }
                const result: string = await rdbHelper.batchInsert(TABLE_NAME, buckets);
                addLog('testBatchGuard0015: result=%{public}s', result);
                expect(result).assertContain('200/200');
                expect(rdbHelper.isInitialized()).assertTrue();
                expect(result.indexOf('rows inserted')).assertLargerOrEqual(0);
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0016
         * @tc.name testBatchGuard0016
         * @tc.desc Verify dropTable refuses to drop the default main table.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0016', 0, (done: Function) => {
            runCase('testBatchGuard0016', async () => {
                await rdbHelper.initialize();
                const result: string = await rdbHelper.dropTable(TABLE_NAME);
                addLog('testBatchGuard0016: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('cannot drop');
                expect(rdbHelper.hasTable(TABLE_NAME)).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0017
         * @tc.name testBatchGuard0017
         * @tc.desc Verify dropTable rejects invalid table name.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0017', 0, (done: Function) => {
            runCase('testBatchGuard0017', async () => {
                await rdbHelper.initialize();
                const result: string = await rdbHelper.dropTable('1invalid');
                addLog('testBatchGuard0017: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('invalid');
                expect(rdbHelper.isInitialized()).assertTrue();
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0018
         * @tc.name testBatchGuard0018
         * @tc.desc Verify isValidSQL rejects ALTER DATABASE statement.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0018', 0, (done: Function) => {
            runCase('testBatchGuard0018', async () => {
                expect(DataValidator.isValidSQL('ALTER DATABASE mydb SET READONLY')).assertFalse();
                expect(DataValidator.isValidSQL('alter database test')).assertFalse();
                expect(DataValidator.isValidSQL('  ALTER   DATABASE x')).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0019
         * @tc.name testBatchGuard0019
         * @tc.desc Verify isValidSQL rejects TRUNCATE statement.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0019', 0, (done: Function) => {
            runCase('testBatchGuard0019', async () => {
                expect(DataValidator.isValidSQL('TRUNCATE TABLE users')).assertFalse();
                expect(DataValidator.isValidSQL('truncate table logs')).assertFalse();
                expect(DataValidator.isValidSQL('  TRUNCATE  data')).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0020
         * @tc.name testBatchGuard0020
         * @tc.desc Verify isValidSQL rejects null or undefined SQL.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0020', 0, (done: Function) => {
            runCase('testBatchGuard0020', async () => {
                expect(DataValidator.isValidSQL('')).assertFalse();
                expect(DataValidator.isValidSQL('   ')).assertTrue();
                expect(DataValidator.isValidSQL('INSERT INTO t (c) VALUES (1)')).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0021
         * @tc.name testBatchGuard0021
         * @tc.desc Verify isValidSQL accepts safe DML statements.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testBatchGuard0021', 0, (done: Function) => {
            runCase('testBatchGuard0021', async () => {
                expect(DataValidator.isValidSQL('INSERT INTO users (name) VALUES (\'test\')')).assertTrue();
                expect(DataValidator.isValidSQL('UPDATE users SET age=30 WHERE id=1')).assertTrue();
                expect(DataValidator.isValidSQL('DELETE FROM users WHERE id=5')).assertTrue();
                expect(DataValidator.isValidSQL('SELECT * FROM users')).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0022
         * @tc.name testBatchGuard0022
         * @tc.desc Verify isValidSQL rejects whitespace-padded dangerous patterns.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0022', 0, (done: Function) => {
            runCase('testBatchGuard0022', async () => {
                expect(DataValidator.isValidSQL('  DROP DATABASE hidden  ')).assertFalse();
                expect(DataValidator.isValidSQL('\tTRUNCATE\ttable')).assertFalse();
                expect(DataValidator.isValidSQL('Alter Database test')).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0023
         * @tc.name testBatchGuard0023
         * @tc.desc Verify isValidSQL handles SQL containing but not starting with dangerous keyword.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testBatchGuard0023', 0, (done: Function) => {
            runCase('testBatchGuard0023', async () => {
                const sqlWithDrop: string = 'SELECT * FROM users WHERE name LIKE \'%DROP DATABASE%\'';
                const result: boolean = DataValidator.isValidSQL(sqlWithDrop);
                expect(result).assertFalse();
                expect(DataValidator.isValidSQL('SELECT * FROM logs')).assertTrue();
                expect(DataValidator.isValidSQL('SELECT 1')).assertTrue();
            }, done);
        })



        /**
         * @tc.number SUB_BATCH_GUARD_0024
         * @tc.name testBatchGuard0024
         * @tc.desc Verify convertBatchBuckets rejects buckets exceeding MAX_BATCH_SIZE.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0024', 0, (done: Function) => {
            runCase('testBatchGuard0024', async () => {
                await rdbHelper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [];
                for (let i = 0; i < 201; i++) {
                    const bucket: relationalStore.ValuesBucket = { name: `overflow_${i}`, age: 10, active: 1 };
                    buckets.push(bucket);
                }
                const result: string = rdbHelper.convertBatchBuckets(buckets);
                addLog('testBatchGuard0024: result=%{public}s', result);
                expect(result).assertContain('failed');
                expect(result).assertContain('exceeds max');
                expect(rdbHelper.isInitialized()).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_BATCH_GUARD_0025
         * @tc.name testBatchGuard0025
         * @tc.desc Verify convertBatchBuckets accepts exactly MAX_BATCH_SIZE buckets.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testBatchGuard0025', 0, (done: Function) => {
            runCase('testBatchGuard0025', async () => {
                await rdbHelper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [];
                for (let i = 0; i < DataStoreConstants.MAX_BATCH_SIZE; i++) {
                    const bucket: relationalStore.ValuesBucket = { name: `exact_${i}`, age: 20, active: 0 };
                    buckets.push(bucket);
                }
                const result: string = rdbHelper.convertBatchBuckets(buckets);
                addLog('testBatchGuard0025: result=%{public}s', result);
                expect(result).assertContain('200 buckets converted');
                expect(rdbHelper.isInitialized()).assertTrue();
                expect(result.indexOf('converted')).assertLargerOrEqual(0);
            }, done);
        })
    })
}
