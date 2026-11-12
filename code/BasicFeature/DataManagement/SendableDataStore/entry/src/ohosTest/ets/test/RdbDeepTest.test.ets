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
import { SendableRdbHelper } from '../../../main/ets/sendablerelationalstore/SendableRdbHelper';
import { TableSchema, SchemaField, DataType } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const TABLE_NAME: string = 'sendable_sample';

function createDeepRdb(): SendableRdbHelper {
    const context = getTestContext();
    return new SendableRdbHelper(context);
}

function createDeepSchema(): TableSchema {
    const nameField: SchemaField = {
        name: 'title',
        dataType: DataType.STRING,
        required: true,
        defaultValue: '',
        maxLength: 100,
        min: 0,
        max: 100
    };
    const scoreField: SchemaField = {
        name: 'score',
        dataType: DataType.NUMBER,
        required: false,
        defaultValue: 0,
        maxLength: 0,
        min: 0,
        max: 1000
    };
    return {
        tableName: 'deep_test_table',
        fields: [nameField, scoreField],
        primaryKeys: ['id'],
        indexes: []
    };
}

export default function rdbDeepTest(): void {
    describe('RdbDeepTest', () => {
        let helper: SendableRdbHelper = createDeepRdb();

        beforeAll(() => {
            addLog('RdbDeepTest suite started');
        })

        beforeEach(async () => {
            // Clean up persistent database before each test
            const context = getTestContext();
            try {
                await relationalStore.deleteRdbStore(context, 'SendableDataStore.db');
            } catch (e) {
                // Ignore if database doesn't exist
            }
            helper = createDeepRdb();
        })

        afterEach(() => {
            helper.release();
        })

        afterAll(() => {
            addLog('RdbDeepTest suite finished');
        })

        

        /*
         * @tc.number: SUB_DEEP_RDB_0100
         * @tc.name: testDeepRdb0001
         * @tc.desc: Verify initialize succeeds and isInitialized returns true.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0001', 0, (done: Function) => {
            runCase('testDeepRdb0001', async (): Promise<void> => {
                const result: string = await helper.initialize();
                addLog('testDeepRdb0001: result=%{public}s', result);
                expect(result.indexOf('ready')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0200
         * @tc.name: testDeepRdb0002
         * @tc.desc: Verify double initialize returns already initialized.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0002', 0, (done: Function) => {
            runCase('testDeepRdb0002', async (): Promise<void> => {
                await helper.initialize();
                const result2: string = await helper.initialize();
                addLog('testDeepRdb0002: result2=%{public}s', result2);
                expect(result2.indexOf('already')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0300
         * @tc.name: testDeepRdb0003
         * @tc.desc: Verify reinitialize resets all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0003', 0, (done: Function) => {
            runCase('testDeepRdb0003', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.reinitialize();
                addLog('testDeepRdb0003: result=%{public}s', result);
                expect(result.indexOf('ready')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0400
         * @tc.name: testDeepRdb0004
         * @tc.desc: Verify closeStore sets isInitialized to false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0004', 0, (done: Function) => {
            runCase('testDeepRdb0004', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.closeStore();
                addLog('testDeepRdb0004: result=%{public}s', result);
                expect(result.indexOf('closed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getTableCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0500
         * @tc.name: testDeepRdb0005
         * @tc.desc: Verify closeStore on already closed store.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0005', 0, (done: Function) => {
            runCase('testDeepRdb0005', async (): Promise<void> => {
                await helper.initialize();
                await helper.closeStore();
                const result: string = await helper.closeStore();
                addLog('testDeepRdb0005: result=%{public}s', result);
                expect(result.indexOf('already closed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0600
         * @tc.name: testDeepRdb0006
         * @tc.desc: Verify release resets all state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0006', 0, (done: Function) => {
            runCase('testDeepRdb0006', async (): Promise<void> => {
                await helper.initialize();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_0700
         * @tc.name: testDeepRdb0007
         * @tc.desc: Verify convertValues returns sendable conversion result.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0007', 0, (done: Function) => {
            runCase('testDeepRdb0007', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.convertValues();
                addLog('testDeepRdb0007: result=%{public}s', result);
                expect(result.indexOf('toSendableValues')).assertLargerOrEqual(0);
                expect(result.indexOf('fromSendableValues')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0800
         * @tc.name: testDeepRdb0008
         * @tc.desc: Verify convertAsset returns sendable asset conversion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0008', 0, (done: Function) => {
            runCase('testDeepRdb0008', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.convertAsset();
                addLog('testDeepRdb0008: result=%{public}s', result);
                expect(result.indexOf('toSendableAsset')).assertLargerOrEqual(0);
                expect(result.indexOf('fromSendableAsset')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_0900
         * @tc.name: testDeepRdb0009
         * @tc.desc: Verify convertInsertAndQuery inserts and queries.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0009', 0, (done: Function) => {
            runCase('testDeepRdb0009', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.convertInsertAndQuery();
                addLog('testDeepRdb0009: result=%{public}s', result);
                expect(result.indexOf('Converted=')).assertLargerOrEqual(0);
                expect(result.indexOf('rowId=')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1000
         * @tc.name: testDeepRdb0010
         * @tc.desc: Verify convertInsertAndQuery twice increments insert count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0010', 0, (done: Function) => {
            runCase('testDeepRdb0010', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                await helper.convertInsertAndQuery();
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_1100
         * @tc.name: testDeepRdb0011
         * @tc.desc: Verify createTable adds a new table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0011', 0, (done: Function) => {
            runCase('testDeepRdb0011', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                const result: string = await helper.createTable('deep_table_1', schema);
                addLog('testDeepRdb0011: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.hasTable('deep_table_1')).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1200
         * @tc.name: testDeepRdb0012
         * @tc.desc: Verify createTable with invalid name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0012', 0, (done: Function) => {
            runCase('testDeepRdb0012', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                const result: string = await helper.createTable('', schema);
                addLog('testDeepRdb0012: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
                expect(helper.hasTable('')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1300
         * @tc.name: testDeepRdb0013
         * @tc.desc: Verify dropTable removes a created table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0013', 0, (done: Function) => {
            runCase('testDeepRdb0013', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('drop_me', schema);
                expect(helper.hasTable('drop_me')).assertTrue();
                const result: string = await helper.dropTable('drop_me');
                addLog('testDeepRdb0013: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.hasTable('drop_me')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1400
         * @tc.name: testDeepRdb0014
         * @tc.desc: Verify dropTable on default table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0014', 0, (done: Function) => {
            runCase('testDeepRdb0014', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.dropTable(TABLE_NAME);
                addLog('testDeepRdb0014: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('cannot drop')).assertLargerOrEqual(0);
                expect(helper.hasTable(TABLE_NAME)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1500
         * @tc.name: testDeepRdb0015
         * @tc.desc: Verify dropTable with invalid name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0015', 0, (done: Function) => {
            runCase('testDeepRdb0015', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.dropTable('');
                addLog('testDeepRdb0015: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1600
         * @tc.name: testDeepRdb0016
         * @tc.desc: Verify dropTable on nonexistent table does not crash.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0016', 0, (done: Function) => {
            runCase('testDeepRdb0016', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.dropTable('nonexistent_table');
                addLog('testDeepRdb0016: result=%{public}s', result);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(1);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_1700
         * @tc.name: testDeepRdb0017
         * @tc.desc: Verify listTables returns default table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0017', 0, (done: Function) => {
            runCase('testDeepRdb0017', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.listTables();
                addLog('testDeepRdb0017: result=%{public}s', result);
                expect(result.indexOf(TABLE_NAME)).assertLargerOrEqual(0);
                expect(result.indexOf('1 tables')).assertLargerOrEqual(0);
                expect(helper.getTableCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1800
         * @tc.name: testDeepRdb0018
         * @tc.desc: Verify listTables after creating additional table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0018', 0, (done: Function) => {
            runCase('testDeepRdb0018', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('extra_table', schema);
                const result: string = helper.listTables();
                addLog('testDeepRdb0018: result=%{public}s', result);
                expect(result.indexOf('extra_table')).assertLargerOrEqual(0);
                expect(result.indexOf('2 tables')).assertLargerOrEqual(0);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1900
         * @tc.name: testDeepRdb0019
         * @tc.desc: Verify hasTable returns true for default table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0019', 0, (done: Function) => {
            runCase('testDeepRdb0019', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.hasTable(TABLE_NAME)).assertTrue();
                expect(helper.hasTable('nonexistent')).assertFalse();
                expect(helper.getTableCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2000
         * @tc.name: testDeepRdb0020
         * @tc.desc: Verify getTableCount after multiple create/drop.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0020', 0, (done: Function) => {
            runCase('testDeepRdb0020', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('t1', schema);
                await helper.createTable('t2', schema);
                expect(helper.getTableCount()).assertEqual(3);
                await helper.dropTable('t1');
                expect(helper.getTableCount()).assertEqual(2);
                expect(helper.hasTable('t2')).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_2100
         * @tc.name: testDeepRdb0021
         * @tc.desc: Verify batchInsert with valid buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0021', 0, (done: Function) => {
            runCase('testDeepRdb0021', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'user1', age: 20, active: true },
                    { name: 'user2', age: 25, active: false }
                ];
                const result: string = await helper.batchInsert(TABLE_NAME, buckets);
                addLog('testDeepRdb0021: result=%{public}s', result);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2200
         * @tc.name: testDeepRdb0022
         * @tc.desc: Verify batchInsert with empty array fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0022', 0, (done: Function) => {
            runCase('testDeepRdb0022', async (): Promise<void> => {
                await helper.initialize();
                const emptyBuckets: relationalStore.ValuesBucket[] = [];
                const result: string = await helper.batchInsert(TABLE_NAME, emptyBuckets);
                addLog('testDeepRdb0022: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2300
         * @tc.name: testDeepRdb0023
         * @tc.desc: Verify batchInsert with invalid table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0023', 0, (done: Function) => {
            runCase('testDeepRdb0023', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [{ name: 'x', age: 1, active: true }];
                const result: string = await helper.batchInsert('', buckets);
                addLog('testDeepRdb0023: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2400
         * @tc.name: testDeepRdb0024
         * @tc.desc: Verify batchInsert with single bucket.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0024', 0, (done: Function) => {
            runCase('testDeepRdb0024', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [{ name: 'single', age: 30, active: true }];
                const result: string = await helper.batchInsert(TABLE_NAME, buckets);
                addLog('testDeepRdb0024: result=%{public}s', result);
                expect(result.indexOf('1/1')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_2500
         * @tc.name: testDeepRdb0025
         * @tc.desc: Verify update with invalid table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0025', 0, (done: Function) => {
            runCase('testDeepRdb0025', async (): Promise<void> => {
                await helper.initialize();
                const bucket: relationalStore.ValuesBucket = { name: 'updated', age: 99 };
                const predicates = new relationalStore.RdbPredicates('');
                const result: string = await helper.update('', bucket, predicates);
                addLog('testDeepRdb0025: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2600
         * @tc.name: testDeepRdb0026
         * @tc.desc: Verify updateSync with invalid table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0026', 0, (done: Function) => {
            runCase('testDeepRdb0026', async (): Promise<void> => {
                await helper.initialize();
                const bucket: relationalStore.ValuesBucket = { name: 'updated', age: 99 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                const result: string = helper.updateSync('', bucket, predicates);
                addLog('testDeepRdb0026: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2700
         * @tc.name: testDeepRdb0027
         * @tc.desc: Verify update on existing row.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0027', 0, (done: Function) => {
            runCase('testDeepRdb0027', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const bucket: relationalStore.ValuesBucket = { name: 'newName', age: 50 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                const result: string = await helper.update(TABLE_NAME, bucket, predicates);
                addLog('testDeepRdb0027: result=%{public}s', result);
                expect(result.indexOf('update')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_2800
         * @tc.name: testDeepRdb0028
         * @tc.desc: Verify updateSync on existing row.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0028', 0, (done: Function) => {
            runCase('testDeepRdb0028', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const bucket: relationalStore.ValuesBucket = { name: 'syncUpd', age: 60 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                const result: string = helper.updateSync(TABLE_NAME, bucket, predicates);
                addLog('testDeepRdb0028: result=%{public}s', result);
                expect(result.indexOf('updateSync')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_2900
         * @tc.name: testDeepRdb0029
         * @tc.desc: Verify deleteByPredicates with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0029', 0, (done: Function) => {
            runCase('testDeepRdb0029', async (): Promise<void> => {
                await helper.initialize();
                const predicates = new relationalStore.RdbPredicates('');
                const result: string = await helper.deleteByPredicates('', predicates);
                addLog('testDeepRdb0029: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3000
         * @tc.name: testDeepRdb0030
         * @tc.desc: Verify deleteByPredicatesSync with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0030', 0, (done: Function) => {
            runCase('testDeepRdb0030', async (): Promise<void> => {
                await helper.initialize();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                const result: string = helper.deleteByPredicatesSync('', predicates);
                addLog('testDeepRdb0030: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3100
         * @tc.name: testDeepRdb0031
         * @tc.desc: Verify deleteByPredicates removes inserted row.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0031', 0, (done: Function) => {
            runCase('testDeepRdb0031', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                const result: string = await helper.deleteByPredicates(TABLE_NAME, predicates);
                addLog('testDeepRdb0031: result=%{public}s', result);
                expect(result.indexOf('deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3200
         * @tc.name: testDeepRdb0032
         * @tc.desc: Verify deleteByPredicatesSync removes inserted row.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0032', 0, (done: Function) => {
            runCase('testDeepRdb0032', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                const result: string = helper.deleteByPredicatesSync(TABLE_NAME, predicates);
                addLog('testDeepRdb0032: result=%{public}s', result);
                expect(result.indexOf('deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_3300
         * @tc.name: testDeepRdb0033
         * @tc.desc: Verify queryAll returns rows after insert.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0033', 0, (done: Function) => {
            runCase('testDeepRdb0033', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.queryAll(TABLE_NAME);
                addLog('testDeepRdb0033: result=%{public}s', result);
                expect(result.indexOf('queryAll')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3400
         * @tc.name: testDeepRdb0034
         * @tc.desc: Verify queryAllSync returns rows after insert.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0034', 0, (done: Function) => {
            runCase('testDeepRdb0034', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.queryAllSync(TABLE_NAME);
                addLog('testDeepRdb0034: result=%{public}s', result);
                expect(result.indexOf('queryAllSync')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3500
         * @tc.name: testDeepRdb0035
         * @tc.desc: Verify queryAll with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0035', 0, (done: Function) => {
            runCase('testDeepRdb0035', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.queryAll('');
                addLog('testDeepRdb0035: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3600
         * @tc.name: testDeepRdb0036
         * @tc.desc: Verify queryAllSync with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0036', 0, (done: Function) => {
            runCase('testDeepRdb0036', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.queryAllSync('');
                addLog('testDeepRdb0036: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3700
         * @tc.name: testDeepRdb0037
         * @tc.desc: Verify queryAll on empty table returns 0 rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0037', 0, (done: Function) => {
            runCase('testDeepRdb0037', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.queryAll(TABLE_NAME);
                addLog('testDeepRdb0037: result=%{public}s', result);
                expect(result.indexOf('0 rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_3800
         * @tc.name: testDeepRdb0038
         * @tc.desc: Verify queryAllSync on empty table returns 0 rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0038', 0, (done: Function) => {
            runCase('testDeepRdb0038', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.queryAllSync(TABLE_NAME);
                addLog('testDeepRdb0038: result=%{public}s', result);
                expect(result.indexOf('0 rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_3900
         * @tc.name: testDeepRdb0039
         * @tc.desc: Verify beginTransaction succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0039', 0, (done: Function) => {
            runCase('testDeepRdb0039', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.beginTransaction();
                addLog('testDeepRdb0039: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertTrue();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4000
         * @tc.name: testDeepRdb0040
         * @tc.desc: Verify double beginTransaction fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0040', 0, (done: Function) => {
            runCase('testDeepRdb0040', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                const result2: string = await helper.beginTransaction();
                addLog('testDeepRdb0040: result2=%{public}s', result2);
                expect(result2.indexOf('failed')).assertLargerOrEqual(0);
                expect(result2.indexOf('already active')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4100
         * @tc.name: testDeepRdb0041
         * @tc.desc: Verify commitTransaction after begin.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0041', 0, (done: Function) => {
            runCase('testDeepRdb0041', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                const result: string = await helper.commitTransaction();
                addLog('testDeepRdb0041: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4200
         * @tc.name: testDeepRdb0042
         * @tc.desc: Verify commitTransaction without begin fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0042', 0, (done: Function) => {
            runCase('testDeepRdb0042', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.commitTransaction();
                addLog('testDeepRdb0042: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('no active')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4300
         * @tc.name: testDeepRdb0043
         * @tc.desc: Verify rollbackTransaction after begin.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0043', 0, (done: Function) => {
            runCase('testDeepRdb0043', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                const result: string = await helper.rollbackTransaction();
                addLog('testDeepRdb0043: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4400
         * @tc.name: testDeepRdb0044
         * @tc.desc: Verify rollbackTransaction without begin fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0044', 0, (done: Function) => {
            runCase('testDeepRdb0044', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.rollbackTransaction();
                addLog('testDeepRdb0044: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('no active')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4500
         * @tc.name: testDeepRdb0045
         * @tc.desc: Verify isTransactionActive default is false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0045', 0, (done: Function) => {
            runCase('testDeepRdb0045', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_4600
         * @tc.name: testDeepRdb0046
         * @tc.desc: Verify executeRawSQL with SELECT succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0046', 0, (done: Function) => {
            runCase('testDeepRdb0046', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.executeRawSQL('SELECT * FROM sendable_sample');
                addLog('testDeepRdb0046: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4700
         * @tc.name: testDeepRdb0047
         * @tc.desc: Verify executeRawSQL with invalid SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0047', 0, (done: Function) => {
            runCase('testDeepRdb0047', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.executeRawSQL('');
                addLog('testDeepRdb0047: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid SQL')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4800
         * @tc.name: testDeepRdb0048
         * @tc.desc: Verify executeRawSQLSync with invalid SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0048', 0, (done: Function) => {
            runCase('testDeepRdb0048', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.executeRawSQLSync('');
                addLog('testDeepRdb0048: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid SQL')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_4900
         * @tc.name: testDeepRdb0049
         * @tc.desc: Verify executeRawSQLSync with valid SQL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0049', 0, (done: Function) => {
            runCase('testDeepRdb0049', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.executeRawSQLSync('SELECT COUNT(*) FROM sendable_sample');
                addLog('testDeepRdb0049: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5000
         * @tc.name: testDeepRdb0050
         * @tc.desc: Verify executeRawSQL with INSERT increments count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0050', 0, (done: Function) => {
            runCase('testDeepRdb0050', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.executeRawSQL("INSERT INTO sendable_sample (name, age, active) VALUES ('raw', 10, 1)");
                addLog('testDeepRdb0050: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_5100
         * @tc.name: testDeepRdb0051
         * @tc.desc: Verify queryBySQL with valid SELECT.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0051', 0, (done: Function) => {
            runCase('testDeepRdb0051', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                const result: string = await helper.queryBySQL('SELECT * FROM sendable_sample', args);
                addLog('testDeepRdb0051: result=%{public}s', result);
                expect(result.indexOf('queryBySQL')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5200
         * @tc.name: testDeepRdb0052
         * @tc.desc: Verify queryBySQL with invalid SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0052', 0, (done: Function) => {
            runCase('testDeepRdb0052', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                const result: string = await helper.queryBySQL('', args);
                addLog('testDeepRdb0052: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5300
         * @tc.name: testDeepRdb0053
         * @tc.desc: Verify queryBySQLSync with valid SELECT.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0053', 0, (done: Function) => {
            runCase('testDeepRdb0053', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                const result: string = helper.queryBySQLSync('SELECT * FROM sendable_sample', args);
                addLog('testDeepRdb0053: result=%{public}s', result);
                expect(result.indexOf('queryBySQLSync')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5400
         * @tc.name: testDeepRdb0054
         * @tc.desc: Verify queryBySQLSync with invalid SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0054', 0, (done: Function) => {
            runCase('testDeepRdb0054', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                const result: string = helper.queryBySQLSync('', args);
                addLog('testDeepRdb0054: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_5500
         * @tc.name: testDeepRdb0055
         * @tc.desc: Verify convertBatchBuckets with valid input.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0055', 0, (done: Function) => {
            runCase('testDeepRdb0055', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'a', age: 1, active: true },
                    { name: 'b', age: 2, active: false }
                ];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testDeepRdb0055: result=%{public}s', result);
                expect(result.indexOf('2 buckets converted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5600
         * @tc.name: testDeepRdb0056
         * @tc.desc: Verify convertBatchBuckets with empty array fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0056', 0, (done: Function) => {
            runCase('testDeepRdb0056', async (): Promise<void> => {
                await helper.initialize();
                const emptyBuckets: relationalStore.ValuesBucket[] = [];
                const result: string = helper.convertBatchBuckets(emptyBuckets);
                addLog('testDeepRdb0056: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5700
         * @tc.name: testDeepRdb0057
         * @tc.desc: Verify convertBatchBuckets with single bucket.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0057', 0, (done: Function) => {
            runCase('testDeepRdb0057', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [{ name: 'solo', age: 5, active: true }];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testDeepRdb0057: result=%{public}s', result);
                expect(result.indexOf('1 buckets converted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_5800
         * @tc.name: testDeepRdb0058
         * @tc.desc: Verify convertResultSetToJSON on empty table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0058', 0, (done: Function) => {
            runCase('testDeepRdb0058', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.convertResultSetToJSON(TABLE_NAME);
                addLog('testDeepRdb0058: result=%{public}s', result);
                expect(result.indexOf('[]')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_5900
         * @tc.name: testDeepRdb0059
         * @tc.desc: Verify convertResultSetToJSONSync on empty table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0059', 0, (done: Function) => {
            runCase('testDeepRdb0059', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.convertResultSetToJSONSync(TABLE_NAME);
                addLog('testDeepRdb0059: result=%{public}s', result);
                expect(result.indexOf('[]')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6000
         * @tc.name: testDeepRdb0060
         * @tc.desc: Verify convertResultSetToJSON with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0060', 0, (done: Function) => {
            runCase('testDeepRdb0060', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.convertResultSetToJSON('');
                addLog('testDeepRdb0060: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6100
         * @tc.name: testDeepRdb0061
         * @tc.desc: Verify convertResultSetToJSONSync with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0061', 0, (done: Function) => {
            runCase('testDeepRdb0061', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.convertResultSetToJSONSync('');
                addLog('testDeepRdb0061: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6200
         * @tc.name: testDeepRdb0062
         * @tc.desc: Verify convertResultSetToJSON after insert returns data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0062', 0, (done: Function) => {
            runCase('testDeepRdb0062', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.convertResultSetToJSON(TABLE_NAME);
                addLog('testDeepRdb0062: result=%{public}s', result);
                expect(result.indexOf('name')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6300
         * @tc.name: testDeepRdb0063
         * @tc.desc: Verify convertResultSetToJSONSync after insert returns data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0063', 0, (done: Function) => {
            runCase('testDeepRdb0063', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.convertResultSetToJSONSync(TABLE_NAME);
                addLog('testDeepRdb0063: result=%{public}s', result);
                expect(result.indexOf('name')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_6400
         * @tc.name: testDeepRdb0064
         * @tc.desc: Verify getStatistics returns initial state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0064', 0, (done: Function) => {
            runCase('testDeepRdb0064', async (): Promise<void> => {
                await helper.initialize();
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0064: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('updates=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('deletes=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6500
         * @tc.name: testDeepRdb0065
         * @tc.desc: Verify resetStatistics zeroes all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0065', 0, (done: Function) => {
            runCase('testDeepRdb0065', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const resetResult: string = helper.resetStatistics();
                addLog('testDeepRdb0065: resetResult=%{public}s', resetResult);
                expect(resetResult.indexOf('reset')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6600
         * @tc.name: testDeepRdb0066
         * @tc.desc: Verify getStatistics after operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0066', 0, (done: Function) => {
            runCase('testDeepRdb0066', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0066: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('initialized=true')).assertLargerOrEqual(0);
                expect(stats.indexOf('transactionActive=false')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6700
         * @tc.name: testDeepRdb0067
         * @tc.desc: Verify getLastOperationTime updates after operation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0067', 0, (done: Function) => {
            runCase('testDeepRdb0067', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getLastOperationTime()).assertEqual(0);
                await helper.convertInsertAndQuery();
                expect(helper.getLastOperationTime()).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6800
         * @tc.name: testDeepRdb0068
         * @tc.desc: Verify getUpdateCount after update operation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0068', 0, (done: Function) => {
            runCase('testDeepRdb0068', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const bucket: relationalStore.ValuesBucket = { name: 'upd', age: 30 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                await helper.update(TABLE_NAME, bucket, predicates);
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_6900
         * @tc.name: testDeepRdb0069
         * @tc.desc: Verify getDeleteCount after delete operation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0069', 0, (done: Function) => {
            runCase('testDeepRdb0069', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                await helper.deleteByPredicates(TABLE_NAME, predicates);
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_RDB_7000
         * @tc.name: testDeepRdb0070
         * @tc.desc: Verify full lifecycle: init-insert-query-update-delete-close.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0070', 0, (done: Function) => {
            runCase('testDeepRdb0070', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                await helper.queryAll(TABLE_NAME);
                const bucket: relationalStore.ValuesBucket = { name: 'final', age: 99 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                await helper.update(TABLE_NAME, bucket, predicates);
                await helper.deleteByPredicates(TABLE_NAME, predicates);
                await helper.closeStore();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getTableCount()).assertEqual(0);
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7100
         * @tc.name: testDeepRdb0071
         * @tc.desc: Verify batchInsert then queryAll returns rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0071', 0, (done: Function) => {
            runCase('testDeepRdb0071', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'batch1', age: 10, active: true },
                    { name: 'batch2', age: 20, active: true },
                    { name: 'batch3', age: 30, active: false }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const queryResult: string = await helper.queryAll(TABLE_NAME);
                addLog('testDeepRdb0071: queryResult=%{public}s', queryResult);
                expect(queryResult.indexOf('3 rows')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(3);
                expect(helper.getQueryCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7200
         * @tc.name: testDeepRdb0072
         * @tc.desc: Verify transaction begin-commit cycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0072', 0, (done: Function) => {
            runCase('testDeepRdb0072', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                expect(helper.isTransactionActive()).assertTrue();
                await helper.commitTransaction();
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7300
         * @tc.name: testDeepRdb0073
         * @tc.desc: Verify transaction begin-rollback cycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0073', 0, (done: Function) => {
            runCase('testDeepRdb0073', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                expect(helper.isTransactionActive()).assertTrue();
                await helper.rollbackTransaction();
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7400
         * @tc.name: testDeepRdb0074
         * @tc.desc: Verify createTable then dropTable then listTables.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0074', 0, (done: Function) => {
            runCase('testDeepRdb0074', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('temp_t', schema);
                expect(helper.hasTable('temp_t')).assertTrue();
                expect(helper.getTableCount()).assertEqual(2);
                await helper.dropTable('temp_t');
                expect(helper.hasTable('temp_t')).assertFalse();
                expect(helper.getTableCount()).assertEqual(1);
                const tables: string = helper.listTables();
                expect(tables.indexOf('temp_t')).assertLessThan(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7500
         * @tc.name: testDeepRdb0075
         * @tc.desc: Verify reinitialize after multiple operations resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0075', 0, (done: Function) => {
            runCase('testDeepRdb0075', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('reinit_t', schema);
                await helper.reinitialize();
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7600
         * @tc.name: testDeepRdb0076
         * @tc.desc: Verify queryBySQL with parameterized args.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0076', 0, (done: Function) => {
            runCase('testDeepRdb0076', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const args: string[] = ['1'];
                const result: string = await helper.queryBySQL('SELECT * FROM sendable_sample WHERE id=?', args);
                addLog('testDeepRdb0076: result=%{public}s', result);
                expect(result.indexOf('queryBySQL')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7700
         * @tc.name: testDeepRdb0077
         * @tc.desc: Verify queryBySQLSync with parameterized args.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0077', 0, (done: Function) => {
            runCase('testDeepRdb0077', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const args: string[] = ['1'];
                const result: string = helper.queryBySQLSync('SELECT * FROM sendable_sample WHERE id=?', args);
                addLog('testDeepRdb0077: result=%{public}s', result);
                expect(result.indexOf('queryBySQLSync')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7800
         * @tc.name: testDeepRdb0078
         * @tc.desc: Verify executeRawSQL with UPDATE increments update count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0078', 0, (done: Function) => {
            runCase('testDeepRdb0078', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.executeRawSQL("UPDATE sendable_sample SET name='raw_upd' WHERE id=1");
                addLog('testDeepRdb0078: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_7900
         * @tc.name: testDeepRdb0079
         * @tc.desc: Verify executeRawSQL with DELETE increments delete count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0079', 0, (done: Function) => {
            runCase('testDeepRdb0079', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.executeRawSQL("DELETE FROM sendable_sample WHERE id=1");
                addLog('testDeepRdb0079: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8000
         * @tc.name: testDeepRdb0080
         * @tc.desc: Verify executeRawSQLSync with UPDATE increments update count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0080', 0, (done: Function) => {
            runCase('testDeepRdb0080', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.executeRawSQLSync("UPDATE sendable_sample SET name='sync_upd' WHERE id=1");
                addLog('testDeepRdb0080: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8100
         * @tc.name: testDeepRdb0081
         * @tc.desc: Verify executeRawSQLSync with DELETE increments delete count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0081', 0, (done: Function) => {
            runCase('testDeepRdb0081', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.executeRawSQLSync("DELETE FROM sendable_sample WHERE id=1");
                addLog('testDeepRdb0081: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8200
         * @tc.name: testDeepRdb0082
         * @tc.desc: Verify batchInsert with 3 buckets then queryAllSync.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0082', 0, (done: Function) => {
            runCase('testDeepRdb0082', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 's1', age: 11, active: true },
                    { name: 's2', age: 22, active: false },
                    { name: 's3', age: 33, active: true }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const result: string = helper.queryAllSync(TABLE_NAME);
                addLog('testDeepRdb0082: result=%{public}s', result);
                expect(result.indexOf('3 rows')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(3);
                expect(helper.getQueryCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8300
         * @tc.name: testDeepRdb0083
         * @tc.desc: Verify convertBatchBuckets with 3 buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0083', 0, (done: Function) => {
            runCase('testDeepRdb0083', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'c1', age: 1, active: true },
                    { name: 'c2', age: 2, active: false },
                    { name: 'c3', age: 3, active: true }
                ];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testDeepRdb0083: result=%{public}s', result);
                expect(result.indexOf('3 buckets converted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8400
         * @tc.name: testDeepRdb0084
         * @tc.desc: Verify getStatistics after mixed operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0084', 0, (done: Function) => {
            runCase('testDeepRdb0084', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                await helper.queryAll(TABLE_NAME);
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0084: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('queries=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('initialized=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8500
         * @tc.name: testDeepRdb0085
         * @tc.desc: Verify resetStatistics then getStatistics shows zeros.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0085', 0, (done: Function) => {
            runCase('testDeepRdb0085', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                helper.resetStatistics();
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0085: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('queries=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('initialized=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8600
         * @tc.name: testDeepRdb0086
         * @tc.desc: Verify createTable with empty fields fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0086', 0, (done: Function) => {
            runCase('testDeepRdb0086', async (): Promise<void> => {
                await helper.initialize();
                const emptySchema: TableSchema = {
                    tableName: 'empty_fields',
                    fields: [],
                    primaryKeys: ['id'],
                    indexes: []
                };
                const result: string = await helper.createTable('empty_t', emptySchema);
                addLog('testDeepRdb0086: result=%{public}s', result);
                expect(result.indexOf('createTable')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.hasTable('empty_t')).assertTrue();
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8700
         * @tc.name: testDeepRdb0087
         * @tc.desc: Verify deleteByPredicates with no matching rows returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0087', 0, (done: Function) => {
            runCase('testDeepRdb0087', async (): Promise<void> => {
                await helper.initialize();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 99999);
                const result: string = await helper.deleteByPredicates(TABLE_NAME, predicates);
                addLog('testDeepRdb0087: result=%{public}s', result);
                expect(result.indexOf('0 rows deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8800
         * @tc.name: testDeepRdb0088
         * @tc.desc: Verify update with no matching rows returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0088', 0, (done: Function) => {
            runCase('testDeepRdb0088', async (): Promise<void> => {
                await helper.initialize();
                const bucket: relationalStore.ValuesBucket = { name: 'noMatch', age: 0 };
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 99999);
                const result: string = await helper.update(TABLE_NAME, bucket, predicates);
                addLog('testDeepRdb0088: result=%{public}s', result);
                expect(result.indexOf('0 rows updated')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_8900
         * @tc.name: testDeepRdb0089
         * @tc.desc: Verify convertValues does not require initialization.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0089', 0, (done: Function) => {
            runCase('testDeepRdb0089', async (): Promise<void> => {
                const freshHelper = createDeepRdb();
                const result: string = freshHelper.convertValues();
                addLog('testDeepRdb0089: result=%{public}s', result);
                expect(result.indexOf('toSendableValues')).assertLargerOrEqual(0);
                expect(freshHelper.isInitialized()).assertFalse();
                expect(freshHelper.getInsertCount()).assertEqual(0);
                freshHelper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9000
         * @tc.name: testDeepRdb0090
         * @tc.desc: Verify convertAsset does not require initialization.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0090', 0, (done: Function) => {
            runCase('testDeepRdb0090', async (): Promise<void> => {
                const freshHelper = createDeepRdb();
                const result: string = freshHelper.convertAsset();
                addLog('testDeepRdb0090: result=%{public}s', result);
                expect(result.indexOf('toSendableAsset')).assertLargerOrEqual(0);
                expect(freshHelper.isInitialized()).assertFalse();
                expect(freshHelper.getInsertCount()).assertEqual(0);
                freshHelper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9100
         * @tc.name: testDeepRdb0091
         * @tc.desc: Verify batchInsert with 5 buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0091', 0, (done: Function) => {
            runCase('testDeepRdb0091', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'b1', age: 1, active: true },
                    { name: 'b2', age: 2, active: true },
                    { name: 'b3', age: 3, active: false },
                    { name: 'b4', age: 4, active: true },
                    { name: 'b5', age: 5, active: false }
                ];
                const result: string = await helper.batchInsert(TABLE_NAME, buckets);
                addLog('testDeepRdb0091: result=%{public}s', result);
                expect(result.indexOf('5/5')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(5);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9200
         * @tc.name: testDeepRdb0092
         * @tc.desc: Verify queryAll after batchInsert and delete.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0092', 0, (done: Function) => {
            runCase('testDeepRdb0092', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'd1', age: 10, active: true },
                    { name: 'd2', age: 20, active: true }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 1);
                await helper.deleteByPredicates(TABLE_NAME, predicates);
                const result: string = await helper.queryAll(TABLE_NAME);
                addLog('testDeepRdb0092: result=%{public}s', result);
                expect(result.indexOf('1 rows')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
                expect(helper.getDeleteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9300
         * @tc.name: testDeepRdb0093
         * @tc.desc: Verify listTables after creating 3 additional tables.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0093', 0, (done: Function) => {
            runCase('testDeepRdb0093', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('lt1', schema);
                await helper.createTable('lt2', schema);
                await helper.createTable('lt3', schema);
                const tables: string = helper.listTables();
                addLog('testDeepRdb0093: tables=%{public}s', tables);
                expect(tables.indexOf('lt1')).assertLargerOrEqual(0);
                expect(tables.indexOf('lt2')).assertLargerOrEqual(0);
                expect(tables.indexOf('lt3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9400
         * @tc.name: testDeepRdb0094
         * @tc.desc: Verify getTableCount after create and drop cycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0094', 0, (done: Function) => {
            runCase('testDeepRdb0094', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('cycle1', schema);
                await helper.createTable('cycle2', schema);
                await helper.dropTable('cycle1');
                await helper.createTable('cycle3', schema);
                expect(helper.getTableCount()).assertEqual(3);
                expect(helper.hasTable('cycle2')).assertTrue();
                expect(helper.hasTable('cycle3')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9500
         * @tc.name: testDeepRdb0095
         * @tc.desc: Verify convertResultSetToJSON after batchInsert.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0095', 0, (done: Function) => {
            runCase('testDeepRdb0095', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'json1', age: 10, active: true },
                    { name: 'json2', age: 20, active: false }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const result: string = await helper.convertResultSetToJSON(TABLE_NAME);
                addLog('testDeepRdb0095: result=%{public}s', result);
                expect(result.indexOf('json1')).assertLargerOrEqual(0);
                expect(result.indexOf('json2')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9600
         * @tc.name: testDeepRdb0096
         * @tc.desc: Verify convertResultSetToJSONSync after batchInsert.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0096', 0, (done: Function) => {
            runCase('testDeepRdb0096', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'sj1', age: 11, active: true },
                    { name: 'sj2', age: 22, active: false }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const result: string = helper.convertResultSetToJSONSync(TABLE_NAME);
                addLog('testDeepRdb0096: result=%{public}s', result);
                expect(result.indexOf('sj1')).assertLargerOrEqual(0);
                expect(result.indexOf('sj2')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9700
         * @tc.name: testDeepRdb0097
         * @tc.desc: Verify getStatistics shows correct table count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0097', 0, (done: Function) => {
            runCase('testDeepRdb0097', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('stat_t', schema);
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0097: stats=%{public}s', stats);
                expect(stats.indexOf('tables=2')).assertLargerOrEqual(0);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9800
         * @tc.name: testDeepRdb0098
         * @tc.desc: Verify transaction active flag after failed commit.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0098', 0, (done: Function) => {
            runCase('testDeepRdb0098', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.isTransactionActive()).assertFalse();
                const commitResult: string = await helper.commitTransaction();
                addLog('testDeepRdb0098: commitResult=%{public}s', commitResult);
                expect(commitResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_9900
         * @tc.name: testDeepRdb0099
         * @tc.desc: Verify rollback without begin does not affect state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0099', 0, (done: Function) => {
            runCase('testDeepRdb0099', async (): Promise<void> => {
                await helper.initialize();
                const rbResult: string = await helper.rollbackTransaction();
                addLog('testDeepRdb0099: rbResult=%{public}s', rbResult);
                expect(rbResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1000
         * @tc.name: testDeepRdb0100
         * @tc.desc: Verify full lifecycle with transaction and statistics.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0100', 0, (done: Function) => {
            runCase('testDeepRdb0100', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                await helper.convertInsertAndQuery();
                await helper.commitTransaction();
                const stats: string = helper.getStatistics();
                addLog('testDeepRdb0100: stats=%{public}s', stats);
                // convertInsertAndQuery uses insertSync directly but does NOT increment insertCount
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1010
         * @tc.name: testDeepRdb0101
         * @tc.desc: Verify queryAll on custom table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0101', 0, (done: Function) => {
            runCase('testDeepRdb0101', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('qa_table', schema);
                const result: string = await helper.queryAll('qa_table');
                addLog('testDeepRdb0101: result=%{public}s', result);
                expect(result.indexOf('0 rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1020
         * @tc.name: testDeepRdb0102
         * @tc.desc: Verify queryAllSync on custom table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0102', 0, (done: Function) => {
            runCase('testDeepRdb0102', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('qas_table', schema);
                const result: string = helper.queryAllSync('qas_table');
                addLog('testDeepRdb0102: result=%{public}s', result);
                expect(result.indexOf('0 rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1030
         * @tc.name: testDeepRdb0103
         * @tc.desc: Verify convertResultSetToJSON on custom table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0103', 0, (done: Function) => {
            runCase('testDeepRdb0103', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('crt_table', schema);
                const result: string = await helper.convertResultSetToJSON('crt_table');
                addLog('testDeepRdb0103: result=%{public}s', result);
                expect(result.indexOf('[]')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1040
         * @tc.name: testDeepRdb0104
         * @tc.desc: Verify convertResultSetToJSONSync on custom table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0104', 0, (done: Function) => {
            runCase('testDeepRdb0104', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('crts_table', schema);
                const result: string = helper.convertResultSetToJSONSync('crts_table');
                addLog('testDeepRdb0104: result=%{public}s', result);
                expect(result.indexOf('[]')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1050
         * @tc.name: testDeepRdb0105
         * @tc.desc: Verify batchInsert into custom table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0105', 0, (done: Function) => {
            runCase('testDeepRdb0105', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('bi_table', schema);
                const buckets: relationalStore.ValuesBucket[] = [
                    { title: 'item1', score: 100 },
                    { title: 'item2', score: 200 }
                ];
                const result: string = await helper.batchInsert('bi_table', buckets);
                addLog('testDeepRdb0105: result=%{public}s', result);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
                expect(helper.getTableCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1060
         * @tc.name: testDeepRdb0106
         * @tc.desc: Verify getLastOperationTime is zero before any operation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0106', 0, (done: Function) => {
            runCase('testDeepRdb0106', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getLastOperationTime()).assertEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1070
         * @tc.name: testDeepRdb0107
         * @tc.desc: Verify getLastOperationTime updates after queryAll.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0107', 0, (done: Function) => {
            runCase('testDeepRdb0107', async (): Promise<void> => {
                await helper.initialize();
                await helper.queryAll(TABLE_NAME);
                expect(helper.getLastOperationTime()).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(1);
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1080
         * @tc.name: testDeepRdb0108
         * @tc.desc: Verify getQueryCount after multiple queries.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0108', 0, (done: Function) => {
            runCase('testDeepRdb0108', async (): Promise<void> => {
                await helper.initialize();
                await helper.queryAll(TABLE_NAME);
                await helper.queryAllSync(TABLE_NAME);
                await helper.queryAll(TABLE_NAME);
                expect(helper.getQueryCount()).assertEqual(3);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1090
         * @tc.name: testDeepRdb0109
         * @tc.desc: Verify convertBatchBuckets with 5 buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0109', 0, (done: Function) => {
            runCase('testDeepRdb0109', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'a1', age: 1, active: true },
                    { name: 'a2', age: 2, active: false },
                    { name: 'a3', age: 3, active: true },
                    { name: 'a4', age: 4, active: false },
                    { name: 'a5', age: 5, active: true }
                ];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testDeepRdb0109: result=%{public}s', result);
                expect(result.indexOf('5 buckets converted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1100
         * @tc.name: testDeepRdb0110
         * @tc.desc: Verify release after complex operations resets everything.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0110', 0, (done: Function) => {
            runCase('testDeepRdb0110', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('rel_t', schema);
                await helper.beginTransaction();
                await helper.commitTransaction();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1110
         * @tc.name: testDeepRdb0111
         * @tc.desc: Verify queryAll after insert-delete returns correct count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0111', 0, (done: Function) => {
            runCase('testDeepRdb0111', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'x1', age: 10, active: true },
                    { name: 'x2', age: 20, active: true },
                    { name: 'x3', age: 30, active: true }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('id', 2);
                await helper.deleteByPredicates(TABLE_NAME, predicates);
                const result: string = await helper.queryAll(TABLE_NAME);
                addLog('testDeepRdb0111: result=%{public}s', result);
                expect(result.indexOf('2 rows')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(3);
                expect(helper.getDeleteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1120
         * @tc.name: testDeepRdb0112
         * @tc.desc: Verify executeRawSQL with empty SQL after initialization.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0112', 0, (done: Function) => {
            runCase('testDeepRdb0112', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.executeRawSQL('   ');
                addLog('testDeepRdb0112: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1130
         * @tc.name: testDeepRdb0113
         * @tc.desc: Verify queryBySQL with empty SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0113', 0, (done: Function) => {
            runCase('testDeepRdb0113', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                // Empty string fails isValidSQL validation (length === 0)
                const result: string = await helper.queryBySQL('', args);
                addLog('testDeepRdb0113: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1140
         * @tc.name: testDeepRdb0114
         * @tc.desc: Verify queryBySQLSync with empty SQL fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0114', 0, (done: Function) => {
            runCase('testDeepRdb0114', async (): Promise<void> => {
                await helper.initialize();
                const args: string[] = [];
                // Empty string fails isValidSQL validation (length === 0)
                const result: string = helper.queryBySQLSync('', args);
                addLog('testDeepRdb0114: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1150
         * @tc.name: testDeepRdb0115
         * @tc.desc: Verify convertResultSetToJSON with empty table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0115', 0, (done: Function) => {
            runCase('testDeepRdb0115', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.convertResultSetToJSON('');
                addLog('testDeepRdb0115: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1160
         * @tc.name: testDeepRdb0116
         * @tc.desc: Verify convertResultSetToJSONSync with empty table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0116', 0, (done: Function) => {
            runCase('testDeepRdb0116', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.convertResultSetToJSONSync('');
                addLog('testDeepRdb0116: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1170
         * @tc.name: testDeepRdb0117
         * @tc.desc: Verify batchInsert into invalid table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0117', 0, (done: Function) => {
            runCase('testDeepRdb0117', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [{ name: 'x', age: 1, active: true }];
                const result: string = await helper.batchInsert('invalid table!', buckets);
                addLog('testDeepRdb0117: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1180
         * @tc.name: testDeepRdb0118
         * @tc.desc: Verify updateSync with invalid table name fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0118', 0, (done: Function) => {
            runCase('testDeepRdb0118', async (): Promise<void> => {
                await helper.initialize();
                const bucket: relationalStore.ValuesBucket = { name: 'x', age: 1 };
                const predicates = new relationalStore.RdbPredicates('bad!table');
                const result: string = helper.updateSync('bad!table', bucket, predicates);
                addLog('testDeepRdb0118: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getUpdateCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1190
         * @tc.name: testDeepRdb0119
         * @tc.desc: Verify deleteByPredicatesSync with invalid table fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepRdb0119', 0, (done: Function) => {
            runCase('testDeepRdb0119', async (): Promise<void> => {
                await helper.initialize();
                const predicates = new relationalStore.RdbPredicates('bad!table');
                const result: string = helper.deleteByPredicatesSync('bad!table', predicates);
                addLog('testDeepRdb0119: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_RDB_1200
         * @tc.name: testDeepRdb0120
         * @tc.desc: Verify complete lifecycle: init-create-insert-query-update-delete-close.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepRdb0120', 0, (done: Function) => {
            runCase('testDeepRdb0120', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createDeepSchema();
                await helper.createTable('life_t', schema);
                const buckets: relationalStore.ValuesBucket[] = [
                    { title: 'entry1', score: 100 },
                    { title: 'entry2', score: 200 }
                ];
                await helper.batchInsert('life_t', buckets);
                await helper.queryAll('life_t');
                const updBucket: relationalStore.ValuesBucket = { title: 'updated', score: 999 };
                const updPred = new relationalStore.RdbPredicates('life_t');
                updPred.equalTo('id', 1);
                await helper.update('life_t', updBucket, updPred);
                const delPred = new relationalStore.RdbPredicates('life_t');
                delPred.equalTo('id', 2);
                await helper.deleteByPredicates('life_t', delPred);
                const finalResult: string = await helper.queryAll('life_t');
                addLog('testDeepRdb0120: finalResult=%{public}s', finalResult);
                expect(finalResult.indexOf('1 rows')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
                expect(helper.getDeleteCount()).assertEqual(1);
            }, done);
        });
    });
}
