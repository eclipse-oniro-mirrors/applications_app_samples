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

function createHelper(): SendableRdbHelper {
    const context = getTestContext();
    return new SendableRdbHelper(context);
}

function createTestSchema(): TableSchema {
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
        tableName: 'test_table',
        fields: [nameField, scoreField],
        primaryKeys: ['id'],
        indexes: []
    };
}

export default function sendableRdbTest(): void {
    describe('SendableRdbTest', () => {
        let helper: SendableRdbHelper = createHelper();

        beforeAll(() => {
            addLog('SendableRdbTest suite started');
        })

        beforeEach(() => {
            helper = createHelper();
        })

        afterEach(() => {
            helper.release();
        })

        afterAll(() => {
            addLog('SendableRdbTest suite finished');
        })

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_0100
         * @tc.name: testSendableRdb0001
         * @tc.desc: Verify initialize creates RDB store and default table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0001', 0, (done: Function) => {
            runCase('testSendableRdb0001', async (): Promise<void> => {
                const result: string = await helper.initialize();
                addLog('testSendableRdb0001: result=%{public}s', result);
                expect(result.indexOf('ready')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getTableCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0200
         * @tc.name: testSendableRdb0002
         * @tc.desc: Verify isInitialized returns false before init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0002', 0, (done: Function) => {
            runCase('testSendableRdb0002', async (): Promise<void> => {
                const freshHelper = createHelper();
                expect(freshHelper.isInitialized()).assertFalse();
                expect(freshHelper.getInsertCount()).assertEqual(0);
                expect(freshHelper.getQueryCount()).assertEqual(0);
                freshHelper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0300
         * @tc.name: testSendableRdb0003
         * @tc.desc: Verify reinitialize closes and re-opens store.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0003', 0, (done: Function) => {
            runCase('testSendableRdb0003', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.reinitialize();
                addLog('testSendableRdb0003: result=%{public}s', result);
                expect(result.indexOf('ready')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0400
         * @tc.name: testSendableRdb0004
         * @tc.desc: Verify closeStore releases the RDB store.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0004', 0, (done: Function) => {
            runCase('testSendableRdb0004', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.closeStore();
                addLog('testSendableRdb0004: result=%{public}s', result);
                expect(result.indexOf('closed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getTableCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0500
         * @tc.name: testSendableRdb0005
         * @tc.desc: Verify release resets all internal state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0005', 0, (done: Function) => {
            runCase('testSendableRdb0005', async (): Promise<void> => {
                await helper.initialize();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_0600
         * @tc.name: testSendableRdb0006
         * @tc.desc: Verify convertInsertAndQuery inserts and queries via sendable conversion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0006', 0, (done: Function) => {
            runCase('testSendableRdb0006', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.convertInsertAndQuery();
                addLog('testSendableRdb0006: result=%{public}s', result);
                expect(result.indexOf('Converted=')).assertLargerOrEqual(0);
                expect(result.indexOf('rowId=')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0700
         * @tc.name: testSendableRdb0007
         * @tc.desc: Verify convertValues round-trips non-sendable values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0007', 0, (done: Function) => {
            runCase('testSendableRdb0007', async (): Promise<void> => {
                const result: string = helper.convertValues();
                addLog('testSendableRdb0007: result=%{public}s', result);
                expect(result.indexOf('toSendableValues length=')).assertLargerOrEqual(0);
                expect(result.indexOf('fromSendableValues=')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0800
         * @tc.name: testSendableRdb0008
         * @tc.desc: Verify convertAsset round-trips asset metadata.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0008', 0, (done: Function) => {
            runCase('testSendableRdb0008', async (): Promise<void> => {
                const result: string = helper.convertAsset();
                addLog('testSendableRdb0008: result=%{public}s', result);
                expect(result.indexOf('toSendableAsset name=')).assertLargerOrEqual(0);
                expect(result.indexOf('fromSendableAsset=')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_0900
         * @tc.name: testSendableRdb0009
         * @tc.desc: Verify convertBatchBuckets converts multiple buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0009', 0, (done: Function) => {
            runCase('testSendableRdb0009', async (): Promise<void> => {
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'batch1', age: 20, active: true },
                    { name: 'batch2', age: 30, active: false }
                ];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testSendableRdb0009: result=%{public}s', result);
                expect(result.indexOf('2 buckets converted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(result.indexOf('buckets')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1000
         * @tc.name: testSendableRdb0010
         * @tc.desc: Verify convertResultSetToJSON returns JSON array string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0010', 0, (done: Function) => {
            runCase('testSendableRdb0010', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.convertResultSetToJSON(TABLE_NAME);
                addLog('testSendableRdb0010: result=%{public}s', result);
                expect(result.indexOf('[')).assertLargerOrEqual(0);
                expect(result.indexOf(']')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1100
         * @tc.name: testSendableRdb0011
         * @tc.desc: Verify convertResultSetToJSONSync returns JSON synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0011', 0, (done: Function) => {
            runCase('testSendableRdb0011', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.convertResultSetToJSONSync(TABLE_NAME);
                addLog('testSendableRdb0011: result=%{public}s', result);
                expect(result.indexOf('[')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_1200
         * @tc.name: testSendableRdb0012
         * @tc.desc: Verify createTable creates a new table with schema fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0012', 0, (done: Function) => {
            runCase('testSendableRdb0012', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createTestSchema();
                const result: string = await helper.createTable('test_table', schema);
                addLog('testSendableRdb0012: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('2 fields')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1300
         * @tc.name: testSendableRdb0013
         * @tc.desc: Verify dropTable removes a non-default table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0013', 0, (done: Function) => {
            runCase('testSendableRdb0013', async (): Promise<void> => {
                await helper.initialize();
                const schema: TableSchema = createTestSchema();
                await helper.createTable('test_table', schema);
                const result: string = await helper.dropTable('test_table');
                addLog('testSendableRdb0013: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.hasTable('test_table')).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1400
         * @tc.name: testSendableRdb0014
         * @tc.desc: Verify listTables returns table list string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0014', 0, (done: Function) => {
            runCase('testSendableRdb0014', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.listTables();
                addLog('testSendableRdb0014: result=%{public}s', result);
                expect(result.indexOf('Tables:')).assertLargerOrEqual(0);
                expect(result.indexOf(TABLE_NAME)).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1500
         * @tc.name: testSendableRdb0015
         * @tc.desc: Verify hasTable returns true for default table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0015', 0, (done: Function) => {
            runCase('testSendableRdb0015', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.hasTable(TABLE_NAME)).assertTrue();
                expect(helper.hasTable('nonexistent')).assertFalse();
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1600
         * @tc.name: testSendableRdb0016
         * @tc.desc: Verify getTableCount returns correct count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0016', 0, (done: Function) => {
            runCase('testSendableRdb0016', async (): Promise<void> => {
                await helper.initialize();
                const initialCount: number = helper.getTableCount();
                expect(initialCount).assertEqual(1);
                const schema: TableSchema = createTestSchema();
                await helper.createTable('extra_table', schema);
                expect(helper.getTableCount()).assertEqual(2);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.hasTable('extra_table')).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_1700
         * @tc.name: testSendableRdb0017
         * @tc.desc: Verify batchInsert inserts multiple rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0017', 0, (done: Function) => {
            runCase('testSendableRdb0017', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'Alice', age: 25, active: 1 },
                    { name: 'Bob', age: 30, active: 0 }
                ];
                const result: string = await helper.batchInsert(TABLE_NAME, buckets);
                addLog('testSendableRdb0017: result=%{public}s', result);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(2);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_1800
         * @tc.name: testSendableRdb0018
         * @tc.desc: Verify batchInsert rejects empty buckets.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0018', 0, (done: Function) => {
            runCase('testSendableRdb0018', async (): Promise<void> => {
                await helper.initialize();
                const buckets: relationalStore.ValuesBucket[] = [];
                const result: string = await helper.batchInsert(TABLE_NAME, buckets);
                addLog('testSendableRdb0018: result=%{public}s', result);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_1900
         * @tc.name: testSendableRdb0019
         * @tc.desc: Verify update modifies matching rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0019', 0, (done: Function) => {
            runCase('testSendableRdb0019', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                predicates.equalTo('age', 26);
                const bucket: relationalStore.ValuesBucket = { age: 99 };
                const result: string = await helper.update(TABLE_NAME, bucket, predicates);
                addLog('testSendableRdb0019: result=%{public}s', result);
                expect(result.indexOf('update')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2000
         * @tc.name: testSendableRdb0020
         * @tc.desc: Verify updateSync modifies rows synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0020', 0, (done: Function) => {
            runCase('testSendableRdb0020', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                const bucket: relationalStore.ValuesBucket = { age: 50 };
                const result: string = helper.updateSync(TABLE_NAME, bucket, predicates);
                addLog('testSendableRdb0020: result=%{public}s', result);
                expect(result.indexOf('updateSync')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_2100
         * @tc.name: testSendableRdb0021
         * @tc.desc: Verify deleteByPredicates removes matching rows.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0021', 0, (done: Function) => {
            runCase('testSendableRdb0021', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                const result: string = await helper.deleteByPredicates(TABLE_NAME, predicates);
                addLog('testSendableRdb0021: result=%{public}s', result);
                expect(result.indexOf('deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2200
         * @tc.name: testSendableRdb0022
         * @tc.desc: Verify deleteByPredicatesSync removes rows synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0022', 0, (done: Function) => {
            runCase('testSendableRdb0022', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const predicates = new relationalStore.RdbPredicates(TABLE_NAME);
                const result: string = helper.deleteByPredicatesSync(TABLE_NAME, predicates);
                addLog('testSendableRdb0022: result=%{public}s', result);
                expect(result.indexOf('deleted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_2300
         * @tc.name: testSendableRdb0023
         * @tc.desc: Verify queryAll returns all rows from table.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0023', 0, (done: Function) => {
            runCase('testSendableRdb0023', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = await helper.queryAll(TABLE_NAME);
                addLog('testSendableRdb0023: result=%{public}s', result);
                expect(result.indexOf('queryAll')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2400
         * @tc.name: testSendableRdb0024
         * @tc.desc: Verify queryAllSync returns all rows synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0024', 0, (done: Function) => {
            runCase('testSendableRdb0024', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.queryAllSync(TABLE_NAME);
                addLog('testSendableRdb0024: result=%{public}s', result);
                expect(result.indexOf('queryAllSync')).assertLargerOrEqual(0);
                expect(result.indexOf('rows')).assertLargerOrEqual(0);
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2500
         * @tc.name: testSendableRdb0025
         * @tc.desc: Verify queryBySQL executes parameterized SQL query.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0025', 0, (done: Function) => {
            runCase('testSendableRdb0025', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const sql: string = 'SELECT * FROM sendable_sample WHERE age > ?';
                const result: string = await helper.queryBySQL(sql, ['20']);
                addLog('testSendableRdb0025: result=%{public}s', result);
                expect(result.indexOf('queryBySQL')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2600
         * @tc.name: testSendableRdb0026
         * @tc.desc: Verify queryBySQLSync executes SQL query synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0026', 0, (done: Function) => {
            runCase('testSendableRdb0026', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const sql: string = 'SELECT * FROM sendable_sample';
                const result: string = helper.queryBySQLSync(sql, []);
                addLog('testSendableRdb0026: result=%{public}s', result);
                expect(result.indexOf('queryBySQLSync')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getQueryCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_2700
         * @tc.name: testSendableRdb0027
         * @tc.desc: Verify executeRawSQL runs a valid SQL statement.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0027', 0, (done: Function) => {
            runCase('testSendableRdb0027', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.executeRawSQL('INSERT INTO sendable_sample (name, age) VALUES (\'RawSQL\', 40)');
                addLog('testSendableRdb0027: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getInsertCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_2800
         * @tc.name: testSendableRdb0028
         * @tc.desc: Verify executeRawSQLSync runs SQL synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0028', 0, (done: Function) => {
            runCase('testSendableRdb0028', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.executeRawSQLSync('UPDATE sendable_sample SET age = 41 WHERE name = \'RawSQL\'');
                addLog('testSendableRdb0028: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getUpdateCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_2900
         * @tc.name: testSendableRdb0029
         * @tc.desc: Verify beginTransaction and commitTransaction workflow.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0029', 0, (done: Function) => {
            runCase('testSendableRdb0029', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.isTransactionActive()).assertFalse();
                const beginResult: string = await helper.beginTransaction();
                addLog('testSendableRdb0029: begin=%{public}s', beginResult);
                expect(beginResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertTrue();
                const commitResult: string = await helper.commitTransaction();
                addLog('testSendableRdb0029: commit=%{public}s', commitResult);
                expect(commitResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3000
         * @tc.name: testSendableRdb0030
         * @tc.desc: Verify rollbackTransaction reverts active transaction.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0030', 0, (done: Function) => {
            runCase('testSendableRdb0030', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                expect(helper.isTransactionActive()).assertTrue();
                const result: string = await helper.rollbackTransaction();
                addLog('testSendableRdb0030: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3100
         * @tc.name: testSendableRdb0031
         * @tc.desc: Verify beginTransaction fails when transaction already active.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0031', 0, (done: Function) => {
            runCase('testSendableRdb0031', async (): Promise<void> => {
                await helper.initialize();
                await helper.beginTransaction();
                const result: string = await helper.beginTransaction();
                addLog('testSendableRdb0031: result=%{public}s', result);
                expect(result.indexOf('already active')).assertLargerOrEqual(0);
                expect(helper.isTransactionActive()).assertTrue();
                expect(helper.isInitialized()).assertTrue();
                await helper.rollbackTransaction();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3200
         * @tc.name: testSendableRdb0032
         * @tc.desc: Verify commitTransaction fails when no active transaction.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0032', 0, (done: Function) => {
            runCase('testSendableRdb0032', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.commitTransaction();
                addLog('testSendableRdb0032: result=%{public}s', result);
                expect(result.indexOf('no active')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.isTransactionActive()).assertFalse();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_RDB_3300
         * @tc.name: testSendableRdb0033
         * @tc.desc: Verify getStatistics returns formatted statistics string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0033', 0, (done: Function) => {
            runCase('testSendableRdb0033', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.getStatistics();
                addLog('testSendableRdb0033: result=%{public}s', result);
                expect(result.indexOf('RDB Statistics')).assertLargerOrEqual(0);
                expect(result.indexOf('inserts=')).assertLargerOrEqual(0);
                expect(result.indexOf('queries=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3400
         * @tc.name: testSendableRdb0034
         * @tc.desc: Verify resetStatistics zeroes all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendableRdb0034', 0, (done: Function) => {
            runCase('testSendableRdb0034', async (): Promise<void> => {
                await helper.initialize();
                await helper.convertInsertAndQuery();
                const result: string = helper.resetStatistics();
                addLog('testSendableRdb0034: result=%{public}s', result);
                expect(result.indexOf('reset')).assertLargerOrEqual(0);
                expect(helper.getInsertCount()).assertEqual(0);
                expect(helper.getQueryCount()).assertEqual(0);
                expect(helper.getLastOperationTime()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3500
         * @tc.name: testSendableRdb0035
         * @tc.desc: Verify getInsertCount tracks batch insert operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0035', 0, (done: Function) => {
            runCase('testSendableRdb0035', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getInsertCount()).assertEqual(0);
                const buckets: relationalStore.ValuesBucket[] = [
                    { name: 'Count1', age: 20, active: 1 },
                    { name: 'Count2', age: 25, active: 0 },
                    { name: 'Count3', age: 30, active: 1 }
                ];
                await helper.batchInsert(TABLE_NAME, buckets);
                expect(helper.getInsertCount()).assertEqual(3);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3600
         * @tc.name: testSendableRdb0036
         * @tc.desc: Verify getUpdateCount and getDeleteCount track operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0036', 0, (done: Function) => {
            runCase('testSendableRdb0036', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getUpdateCount()).assertEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                await helper.convertInsertAndQuery();
                const delPred = new relationalStore.RdbPredicates(TABLE_NAME);
                await helper.deleteByPredicates(TABLE_NAME, delPred);
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3700
         * @tc.name: testSendableRdb0037
         * @tc.desc: Verify getQueryCount increments after query operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0037', 0, (done: Function) => {
            runCase('testSendableRdb0037', async (): Promise<void> => {
                await helper.initialize();
                const initialCount: number = helper.getQueryCount();
                await helper.queryAll(TABLE_NAME);
                expect(helper.getQueryCount()).assertEqual(initialCount + 1);
                helper.queryAllSync(TABLE_NAME);
                expect(helper.getQueryCount()).assertEqual(initialCount + 2);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3800
         * @tc.name: testSendableRdb0038
         * @tc.desc: Verify getLastOperationTime updates after CRUD operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendableRdb0038', 0, (done: Function) => {
            runCase('testSendableRdb0038', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getLastOperationTime()).assertEqual(0);
                const buckets: relationalStore.ValuesBucket[] = [{ name: 'TimeTest', age: 20, active: 1 }];
                await helper.batchInsert(TABLE_NAME, buckets);
                expect(helper.getLastOperationTime()).assertLarger(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_RDB_3900
         * @tc.name: testSendableRdb0039
         * @tc.desc: Verify convertBatchBuckets handles empty input.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendableRdb0039', 0, (done: Function) => {
            runCase('testSendableRdb0039', async (): Promise<void> => {
                const buckets: relationalStore.ValuesBucket[] = [];
                const result: string = helper.convertBatchBuckets(buckets);
                addLog('testSendableRdb0039: result=%{public}s', result);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });
    });
}
