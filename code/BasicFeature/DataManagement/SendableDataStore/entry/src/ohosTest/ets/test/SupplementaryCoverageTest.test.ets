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

import { describe, expect, it } from '@ohos/hypium';
import { runCase, addLog, getTestContext } from '../testkit/SharedDriver';
import { common } from '@kit.AbilityKit';
import { SendableArrayManager } from '../../../main/ets/sendablearray/SendableArrayManager';
import { SendableMapManager } from '../../../main/ets/sendablemap/SendableMapManager';
import { SendableQueueManager } from '../../../main/ets/sendablequeue/SendableQueueManager';
import { SendableRecordManager } from '../../../main/ets/sendablerecord/SendableRecordManager';
import { DataEncryptionManager } from '../../../main/ets/encryption/DataEncryptionManager';
import { DataBackupManager } from '../../../main/ets/backup/DataBackupManager';
import { DataMigrationManager } from '../../../main/ets/migration/DataMigrationManager';
import { DistributedDataManager } from '../../../main/ets/distributed/DistributedDataManager';
import { SendablePreferencesHelper } from '../../../main/ets/sendablepreferences/SendablePreferencesHelper';
import { DataType, SchemaField } from '../../../main/ets/models/DataModels';
import { EncryptionMode, HashAlgorithm, EncryptionConfig } from '../../../main/ets/models/DataModels';
import { SyncMode, ConflictPolicy, StoreType, MigrationStatus } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function createPrefHelper(): SendablePreferencesHelper {
    const context = getTestContext();
    return new SendablePreferencesHelper(context, (message: string): void => {
        addLog('SuppPrefCallback: %{public}s', message);
    });
}

export default function supplementaryCoverageTest(): void {
    describe('SupplementaryCoverageTest', () => {

        

        /*
         * @tc.number: SUB_SUPP_ARRAY_0100
         * @tc.name: testSuppArray0001
         * @tc.desc: Verify sumNumberArray returns correct sum for populated array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0001', 0, (done: Function) => {
            runCase('testSuppArray0001', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createNumberArray(5);
                mgr.setNumberElement(0, 10);
                mgr.setNumberElement(1, 20);
                mgr.setNumberElement(2, 30);
                mgr.setNumberElement(3, 40);
                mgr.setNumberElement(4, 50);
                const result: string = mgr.sumNumberArray();
                addLog('testSuppArray0001: result=%{public}s', result);
                expect(result.indexOf('150')).assertLargerOrEqual(0);
                expect(result.indexOf('sumNumberArray')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(5);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0200
         * @tc.name: testSuppArray0002
         * @tc.desc: Verify minNumber returns the smallest element.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0002', 0, (done: Function) => {
            runCase('testSuppArray0002', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([42, 7, 99, 3, 55]);
                const result: string = mgr.minNumber();
                addLog('testSuppArray0002: result=%{public}s', result);
                expect(result.indexOf('3')).assertLargerOrEqual(0);
                expect(result.indexOf('minNumber')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(5);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0300
         * @tc.name: testSuppArray0003
         * @tc.desc: Verify maxNumber returns the largest element.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0003', 0, (done: Function) => {
            runCase('testSuppArray0003', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([42, 7, 99, 3, 55]);
                const result: string = mgr.maxNumber();
                addLog('testSuppArray0003: result=%{public}s', result);
                expect(result.indexOf('99')).assertLargerOrEqual(0);
                expect(result.indexOf('maxNumber')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(5);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0400
         * @tc.name: testSuppArray0004
         * @tc.desc: Verify averageNumber returns correct average.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0004', 0, (done: Function) => {
            runCase('testSuppArray0004', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([10, 20, 30]);
                const result: string = mgr.averageNumber();
                addLog('testSuppArray0004: result=%{public}s', result);
                expect(result.indexOf('20')).assertLargerOrEqual(0);
                expect(result.indexOf('averageNumber')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0500
         * @tc.name: testSuppArray0005
         * @tc.desc: Verify containsNumber finds and misses elements.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0005', 0, (done: Function) => {
            runCase('testSuppArray0005', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([10, 20, 30, 40, 50]);
                const found: string = mgr.containsNumber(30);
                const notFound: string = mgr.containsNumber(99);
                addLog('testSuppArray0005: found=%{public}s, notFound=%{public}s', found, notFound);
                expect(found.indexOf('true')).assertLargerOrEqual(0);
                expect(notFound.indexOf('false')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(5);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0600
         * @tc.name: testSuppArray0006
         * @tc.desc: Verify containsString finds and misses elements.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0006', 0, (done: Function) => {
            runCase('testSuppArray0006', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromStringArray(['hello', 'world', 'test']);
                const found: string = mgr.containsString('world');
                const notFound: string = mgr.containsString('missing');
                addLog('testSuppArray0006: found=%{public}s, notFound=%{public}s', found, notFound);
                expect(found.indexOf('true')).assertLargerOrEqual(0);
                expect(notFound.indexOf('false')).assertLargerOrEqual(0);
                expect(mgr.getCapacity()).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0700
         * @tc.name: testSuppArray0007
         * @tc.desc: Verify toNumberJSON returns correct JSON string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0007', 0, (done: Function) => {
            runCase('testSuppArray0007', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([1, 2, 3]);
                const json: string = mgr.toNumberJSON();
                const parsed: number[] = JSON.parse(json) as number[];
                addLog('testSuppArray0007: json=%{public}s', json);
                expect(parsed.length).assertEqual(3);
                expect(parsed[0]).assertEqual(1);
                expect(parsed[2]).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0800
         * @tc.name: testSuppArray0008
         * @tc.desc: Verify toStringJSON returns correct JSON string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0008', 0, (done: Function) => {
            runCase('testSuppArray0008', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromStringArray(['a', 'b', 'c']);
                const json: string = mgr.toStringJSON();
                const parsed: string[] = JSON.parse(json) as string[];
                addLog('testSuppArray0008: json=%{public}s', json);
                expect(parsed.length).assertEqual(3);
                expect(parsed[0]).assertEqual('a');
                expect(parsed[2]).assertEqual('c');
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_0900
         * @tc.name: testSuppArray0009
         * @tc.desc: Verify toJSON dispatches to correct type-specific method.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppArray0009', 0, (done: Function) => {
            runCase('testSuppArray0009', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromArray([10, 20]);
                const numJson: string = mgr.toJSON();
                expect(numJson.indexOf('10')).assertLargerOrEqual(0);
                expect(numJson.indexOf('20')).assertLargerOrEqual(0);
                expect(mgr.getDataType()).assertEqual(DataType.NUMBER);
                mgr.release();
                const mgr2: SendableArrayManager = new SendableArrayManager();
                mgr2.createFromStringArray(['x', 'y']);
                const strJson: string = mgr2.toJSON();
                expect(strJson.indexOf('x')).assertLargerOrEqual(0);
                expect(strJson.indexOf('y')).assertLargerOrEqual(0);
                expect(mgr2.getDataType()).assertEqual(DataType.STRING);
                mgr2.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ARRAY_1000
         * @tc.name: testSuppArray0010
         * @tc.desc: Verify sumNumberArray fails for non-number type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppArray0010', 0, (done: Function) => {
            runCase('testSuppArray0010', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createStringArray(3);
                const sumResult: string = mgr.sumNumberArray();
                const minResult: string = mgr.minNumber();
                const maxResult: string = mgr.maxNumber();
                addLog('testSuppArray0010: sum=%{public}s', sumResult);
                expect(sumResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(minResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(maxResult.indexOf('failed')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_MAP_0100
         * @tc.name: testSuppMap0001
         * @tc.desc: Verify putNumber stores number value and get retrieves it.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0001', 0, (done: Function) => {
            runCase('testSuppMap0001', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                const putResult: string = mgr.putNumber('count', 42);
                const getResult: string = mgr.get('count');
                addLog('testSuppMap0001: put=%{public}s, get=%{public}s', putResult, getResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(getResult.indexOf('42')).assertLargerOrEqual(0);
                expect(getResult.indexOf('number')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0200
         * @tc.name: testSuppMap0002
         * @tc.desc: Verify putBoolean stores boolean value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0002', 0, (done: Function) => {
            runCase('testSuppMap0002', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                const putTrue: string = mgr.putBoolean('flag', true);
                const putFalse: string = mgr.putBoolean('off', false);
                const getTrue: string = mgr.get('flag');
                addLog('testSuppMap0002: putTrue=%{public}s', putTrue);
                expect(putTrue.indexOf('completed')).assertLargerOrEqual(0);
                expect(putFalse.indexOf('completed')).assertLargerOrEqual(0);
                expect(getTrue.indexOf('true')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0300
         * @tc.name: testSuppMap0003
         * @tc.desc: Verify getValue returns raw value string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0003', 0, (done: Function) => {
            runCase('testSuppMap0003', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('key1', 'value1');
                const raw: string = mgr.getValue('key1');
                const missing: string = mgr.getValue('nonexist');
                addLog('testSuppMap0003: raw=%{public}s, missing=%{public}s', raw, missing);
                expect(raw).assertEqual('value1');
                expect(missing).assertEqual('');
                expect(mgr.getSize()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0400
         * @tc.name: testSuppMap0004
         * @tc.desc: Verify allKeys returns all stored keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0004', 0, (done: Function) => {
            runCase('testSuppMap0004', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('a', '1');
                mgr.putString('b', '2');
                mgr.putString('c', '3');
                const keys: string = mgr.allKeys();
                addLog('testSuppMap0004: keys=%{public}s', keys);
                expect(keys.indexOf('a')).assertLargerOrEqual(0);
                expect(keys.indexOf('b')).assertLargerOrEqual(0);
                expect(keys.indexOf('3 keys')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0500
         * @tc.name: testSuppMap0005
         * @tc.desc: Verify allValues returns all stored values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0005', 0, (done: Function) => {
            runCase('testSuppMap0005', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('x', 'alpha');
                mgr.putString('y', 'beta');
                const vals: string = mgr.allValues();
                addLog('testSuppMap0005: vals=%{public}s', vals);
                expect(vals.indexOf('alpha')).assertLargerOrEqual(0);
                expect(vals.indexOf('beta')).assertLargerOrEqual(0);
                expect(vals.indexOf('2 values')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0600
         * @tc.name: testSuppMap0006
         * @tc.desc: Verify allEntries returns typed entry list.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0006', 0, (done: Function) => {
            runCase('testSuppMap0006', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('name', 'test');
                mgr.putNumber('count', 5);
                const entries: string = mgr.allEntries();
                addLog('testSuppMap0006: entries=%{public}s', entries);
                expect(entries.indexOf('name')).assertLargerOrEqual(0);
                expect(entries.indexOf('count')).assertLargerOrEqual(0);
                expect(entries.indexOf('string')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0700
         * @tc.name: testSuppMap0007
         * @tc.desc: Verify toJSONObject returns JSON object string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0007', 0, (done: Function) => {
            runCase('testSuppMap0007', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('k1', 'v1');
                mgr.putString('k2', 'v2');
                const json: string = mgr.toJSONObject();
                addLog('testSuppMap0007: json=%{public}s', json);
                expect(json.indexOf('"k1"')).assertLargerOrEqual(0);
                expect(json.indexOf('"v2"')).assertLargerOrEqual(0);
                expect(json.indexOf('{')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0800
         * @tc.name: testSuppMap0008
         * @tc.desc: Verify toJSONTyped returns typed JSON with metadata.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0008', 0, (done: Function) => {
            runCase('testSuppMap0008', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putNumber('num', 99);
                const json: string = mgr.toJSONTyped();
                addLog('testSuppMap0008: json=%{public}s', json);
                expect(json.indexOf('value')).assertLargerOrEqual(0);
                expect(json.indexOf('type')).assertLargerOrEqual(0);
                expect(json.indexOf('number')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_0900
         * @tc.name: testSuppMap0009
         * @tc.desc: Verify filterByType returns entries matching target type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0009', 0, (done: Function) => {
            runCase('testSuppMap0009', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('s1', 'hello');
                mgr.putNumber('n1', 42);
                mgr.putBoolean('b1', true);
                const stringEntries: string = mgr.filterByType(DataType.STRING);
                const numberEntries: string = mgr.filterByType(DataType.NUMBER);
                addLog('testSuppMap0009: strings=%{public}s', stringEntries);
                expect(stringEntries.indexOf('s1')).assertLargerOrEqual(0);
                expect(stringEntries.indexOf('1 matches')).assertLargerOrEqual(0);
                expect(numberEntries.indexOf('n1')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MAP_1000
         * @tc.name: testSuppMap0010
         * @tc.desc: Verify getKeysArray and getValuesArray return correct arrays.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMap0010', 0, (done: Function) => {
            runCase('testSuppMap0010', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(10);
                mgr.putString('a', '1');
                mgr.putString('b', '2');
                const keys: string[] = mgr.getKeysArray();
                const vals: string[] = mgr.getValuesArray();
                addLog('testSuppMap0010: keys=%{public}d, vals=%{public}d', String(keys.length), String(vals.length));
                expect(keys.length).assertEqual(2);
                expect(vals.length).assertEqual(2);
                expect(keys[0]).assertEqual('a');
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_QUEUE_0100
         * @tc.name: testSuppQueue0001
         * @tc.desc: Verify enqueueNumber adds number items to queue.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0001', 0, (done: Function) => {
            runCase('testSuppQueue0001', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                const r1: string = mgr.enqueueNumber(100, 5);
                const r2: string = mgr.enqueueNumber(200, 3);
                const peeked: string = mgr.dequeue();
                addLog('testSuppQueue0001: r1=%{public}s', r1);
                expect(r1.indexOf('completed')).assertLargerOrEqual(0);
                expect(r2.indexOf('completed')).assertLargerOrEqual(0);
                expect(peeked.indexOf('100')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0200
         * @tc.name: testSuppQueue0002
         * @tc.desc: Verify enqueueBoolean adds boolean items to queue.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0002', 0, (done: Function) => {
            runCase('testSuppQueue0002', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                const r1: string = mgr.enqueueBoolean(true, 1);
                const peeked: string = mgr.dequeue();
                addLog('testSuppQueue0002: r1=%{public}s', r1);
                expect(r1.indexOf('completed')).assertLargerOrEqual(0);
                expect(peeked.indexOf('boolean')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0300
         * @tc.name: testSuppQueue0003
         * @tc.desc: Verify batchEnqueueString adds multiple string items.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0003', 0, (done: Function) => {
            runCase('testSuppQueue0003', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(20);
                const items: string[] = ['alpha', 'beta', 'gamma'];
                const result: string = mgr.batchEnqueueString(items, 5);
                addLog('testSuppQueue0003: result=%{public}s', result);
                expect(result.indexOf('3/3')).assertLargerOrEqual(0);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0400
         * @tc.name: testSuppQueue0004
         * @tc.desc: Verify batchEnqueueNumber adds multiple number items.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0004', 0, (done: Function) => {
            runCase('testSuppQueue0004', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(20);
                const nums: number[] = [10, 20, 30, 40];
                const result: string = mgr.batchEnqueueNumber(nums, 3);
                addLog('testSuppQueue0004: result=%{public}s', result);
                expect(result.indexOf('4/4')).assertLargerOrEqual(0);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(4);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0500
         * @tc.name: testSuppQueue0005
         * @tc.desc: Verify batchDequeue removes multiple items from queue.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0005', 0, (done: Function) => {
            runCase('testSuppQueue0005', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(20);
                mgr.enqueueString('a', 1);
                mgr.enqueueString('b', 2);
                mgr.enqueueString('c', 3);
                const result: string = mgr.batchDequeue(2);
                addLog('testSuppQueue0005: result=%{public}s', result);
                expect(result.indexOf('drain(2)')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(1);
                expect(mgr.isEmpty()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0600
         * @tc.name: testSuppQueue0006
         * @tc.desc: Verify toArray returns formatted array string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0006', 0, (done: Function) => {
            runCase('testSuppQueue0006', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                mgr.enqueueString('hello', 5);
                mgr.enqueueString('world', 3);
                const arr: string = mgr.toArray();
                addLog('testSuppQueue0006: arr=%{public}s', arr);
                expect(arr.indexOf('hello')).assertLargerOrEqual(0);
                expect(arr.indexOf('world')).assertLargerOrEqual(0);
                expect(arr.indexOf('[')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0700
         * @tc.name: testSuppQueue0007
         * @tc.desc: Verify toJSON returns same format as toArray.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppQueue0007', 0, (done: Function) => {
            runCase('testSuppQueue0007', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                mgr.enqueueNumber(42, 1);
                const json: string = mgr.toJSON();
                const arr: string = mgr.toArray();
                addLog('testSuppQueue0007: json=%{public}s', json);
                expect(json).assertEqual(arr);
                expect(json.indexOf('42')).assertLargerOrEqual(0);
                expect(json.length).assertLarger(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_QUEUE_0800
         * @tc.name: testSuppQueue0008
         * @tc.desc: Verify batchEnqueueString fails with empty input.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppQueue0008', 0, (done: Function) => {
            runCase('testSuppQueue0008', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                const emptyResult: string = mgr.batchEnqueueString([], 1);
                const emptyNumResult: string = mgr.batchEnqueueNumber([], 1);
                addLog('testSuppQueue0008: empty=%{public}s', emptyResult);
                expect(emptyResult.indexOf('empty')).assertLargerOrEqual(0);
                expect(emptyNumResult.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(0);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_REC_0100
         * @tc.name: testSuppRec0001
         * @tc.desc: Verify setNumberField and getNumberField for number type fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0001', 0, (done: Function) => {
            runCase('testSuppRec0001', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'age', dataType: DataType.NUMBER, required: true, defaultValue: 0, maxLength: 0, min: 0, max: 200 },
                    { name: 'name', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 100, min: 0, max: 0 }
                ];
                mgr.createRecord('person', fields);
                const setResult: string = mgr.setNumberField('age', 25);
                const getResult: string = mgr.getNumberField('age');
                addLog('testSuppRec0001: set=%{public}s, get=%{public}s', setResult, getResult);
                expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(getResult.indexOf('25')).assertLargerOrEqual(0);
                expect(mgr.getFieldCount()).assertEqual(2);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0200
         * @tc.name: testSuppRec0002
         * @tc.desc: Verify setBooleanField and getBooleanField for boolean type fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0002', 0, (done: Function) => {
            runCase('testSuppRec0002', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'active', dataType: DataType.BOOLEAN, required: false, defaultValue: false, maxLength: 0, min: 0, max: 0 }
                ];
                mgr.createRecord('status', fields);
                const setResult: string = mgr.setBooleanField('active', true);
                const getResult: string = mgr.getBooleanField('active');
                addLog('testSuppRec0002: set=%{public}s, get=%{public}s', setResult, getResult);
                expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(getResult.indexOf('true')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0300
         * @tc.name: testSuppRec0003
         * @tc.desc: Verify validateRequired detects missing required fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0003', 0, (done: Function) => {
            runCase('testSuppRec0003', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'req1', dataType: DataType.STRING, required: true, defaultValue: '', maxLength: 50, min: 0, max: 0 },
                    { name: 'opt1', dataType: DataType.STRING, required: false, defaultValue: 'def', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('testRec', fields);
                const missingResult: string = mgr.validateRequired();
                addLog('testSuppRec0003: missing=%{public}s', missingResult);
                expect(missingResult.indexOf('MISSING')).assertLargerOrEqual(0);
                expect(missingResult.indexOf('req1')).assertLargerOrEqual(0);
                expect(mgr.getFieldCount()).assertEqual(2);
                mgr.setStringField('req1', 'filled');
                const okResult: string = mgr.validateRequired();
                expect(okResult.indexOf('all required')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0400
         * @tc.name: testSuppRec0004
         * @tc.desc: Verify resetField clears a field value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0004', 0, (done: Function) => {
            runCase('testSuppRec0004', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'data', dataType: DataType.STRING, required: false, defaultValue: 'fallback', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('resetRec', fields);
                mgr.setStringField('data', 'hello');
                const resetResult: string = mgr.resetField('data');
                const afterReset: string = mgr.getStringField('data');
                addLog('testSuppRec0004: reset=%{public}s', resetResult);
                expect(resetResult.indexOf('reset')).assertLargerOrEqual(0);
                expect(afterReset.indexOf('fallback')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0500
         * @tc.name: testSuppRec0005
         * @tc.desc: Verify resetAllFields clears all values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0005', 0, (done: Function) => {
            runCase('testSuppRec0005', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'a', dataType: DataType.STRING, required: false, defaultValue: 'da', maxLength: 50, min: 0, max: 0 },
                    { name: 'b', dataType: DataType.STRING, required: false, defaultValue: 'db', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('multi', fields);
                mgr.setStringField('a', 'va');
                mgr.setStringField('b', 'vb');
                const result: string = mgr.resetAllFields();
                addLog('testSuppRec0005: result=%{public}s', result);
                expect(result.indexOf('resetAllFields')).assertLargerOrEqual(0);
                const allFields: string = mgr.getAllFields();
                expect(allFields.indexOf('da')).assertLargerOrEqual(0);
                expect(allFields.indexOf('db')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0600
         * @tc.name: testSuppRec0006
         * @tc.desc: Verify setDefaults applies default values to all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0006', 0, (done: Function) => {
            runCase('testSuppRec0006', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'x', dataType: DataType.STRING, required: false, defaultValue: 'dx', maxLength: 50, min: 0, max: 0 },
                    { name: 'y', dataType: DataType.NUMBER, required: false, defaultValue: 99, maxLength: 0, min: 0, max: 1000 }
                ];
                mgr.createRecord('defaults', fields);
                const result: string = mgr.setDefaults();
                addLog('testSuppRec0006: result=%{public}s', result);
                expect(result.indexOf('setDefaults')).assertLargerOrEqual(0);
                const allFields: string = mgr.getAllFields();
                expect(allFields.indexOf('dx')).assertLargerOrEqual(0);
                expect(allFields.indexOf('99')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0700
         * @tc.name: testSuppRec0007
         * @tc.desc: Verify toSchemaJSON returns schema definition as JSON.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0007', 0, (done: Function) => {
            runCase('testSuppRec0007', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'id', dataType: DataType.NUMBER, required: true, defaultValue: 0, maxLength: 0, min: 0, max: 100 },
                    { name: 'label', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('schema', fields);
                const schema: string = mgr.toSchemaJSON();
                addLog('testSuppRec0007: schema=%{public}s', schema);
                expect(schema.indexOf('schema')).assertLargerOrEqual(0);
                expect(schema.indexOf('fields')).assertLargerOrEqual(0);
                expect(schema.indexOf('required')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0800
         * @tc.name: testSuppRec0008
         * @tc.desc: Verify getField returns value with type info.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0008', 0, (done: Function) => {
            runCase('testSuppRec0008', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'val', dataType: DataType.STRING, required: false, defaultValue: 'def', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('getRec', fields);
                const result: string = mgr.getField('val');
                addLog('testSuppRec0008: result=%{public}s', result);
                expect(result.indexOf('val')).assertLargerOrEqual(0);
                expect(result.indexOf('def')).assertLargerOrEqual(0);
                expect(result.indexOf('string')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_0900
         * @tc.name: testSuppRec0009
         * @tc.desc: Verify getFieldNames returns correct field name list.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppRec0009', 0, (done: Function) => {
            runCase('testSuppRec0009', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'alpha', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 50, min: 0, max: 0 },
                    { name: 'beta', dataType: DataType.NUMBER, required: false, defaultValue: 0, maxLength: 0, min: 0, max: 100 },
                    { name: 'gamma', dataType: DataType.BOOLEAN, required: false, defaultValue: false, maxLength: 0, min: 0, max: 0 }
                ];
                mgr.createRecord('names', fields);
                const names: string[] = mgr.getFieldNames();
                addLog('testSuppRec0009: names=%{public}d', String(names.length));
                expect(names.length).assertEqual(3);
                expect(names[0]).assertEqual('alpha');
                expect(names[2]).assertEqual('gamma');
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_REC_1000
         * @tc.name: testSuppRec0010
         * @tc.desc: Verify setNumberField fails for non-number type field.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppRec0010', 0, (done: Function) => {
            runCase('testSuppRec0010', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'text', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 50, min: 0, max: 0 }
                ];
                mgr.createRecord('typeCheck', fields);
                const result: string = mgr.setNumberField('text', 42);
                addLog('testSuppRec0010: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('not number')).assertLargerOrEqual(0);
                expect(mgr.getFieldCount()).assertEqual(1);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_ENC_0100
         * @tc.name: testSuppEnc0001
         * @tc.desc: Verify encryptSync and decryptSync round-trip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppEnc0001', 0, (done: Function) => {
            runCase('testSuppEnc0001', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                mgr.generateKey();
                const encrypted: string = mgr.encryptSync('HelloSync');
                const decrypted: string = mgr.decryptSync(encrypted.substring(encrypted.indexOf(': ') + 2));
                addLog('testSuppEnc0001: enc=%{public}s', encrypted);
                expect(encrypted.indexOf('encrypt')).assertLargerOrEqual(0);
                expect(decrypted.indexOf('HelloSync')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ENC_0200
         * @tc.name: testSuppEnc0002
         * @tc.desc: Verify setKey sets a custom encryption key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppEnc0002', 0, (done: Function) => {
            runCase('testSuppEnc0002', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const longKey: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnop';
                const setResult: string = mgr.setKey(longKey);
                const keyInfo: string = mgr.getKey();
                addLog('testSuppEnc0002: set=%{public}s', setResult);
                expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(keyInfo.indexOf('Key:')).assertLargerOrEqual(0);
                expect(mgr.isKeyGenerated()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ENC_0300
         * @tc.name: testSuppEnc0003
         * @tc.desc: Verify setKey fails with too-short key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppEnc0003', 0, (done: Function) => {
            runCase('testSuppEnc0003', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = mgr.setKey('short');
                addLog('testSuppEnc0003: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('too short')).assertLargerOrEqual(0);
                expect(mgr.isKeyGenerated()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ENC_0400
         * @tc.name: testSuppEnc0004
         * @tc.desc: Verify setAutoEncrypt and isAutoEncrypt toggle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppEnc0004', 0, (done: Function) => {
            runCase('testSuppEnc0004', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                expect(mgr.isAutoEncrypt()).assertFalse();
                const setResult: string = mgr.setAutoEncrypt(true);
                addLog('testSuppEnc0004: set=%{public}s', setResult);
                expect(setResult.indexOf('true')).assertLargerOrEqual(0);
                expect(mgr.isAutoEncrypt()).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ENC_0500
         * @tc.name: testSuppEnc0005
         * @tc.desc: Verify configure sets encryption parameters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppEnc0005', 0, (done: Function) => {
            runCase('testSuppEnc0005', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                const config: EncryptionConfig = {
                    mode: EncryptionMode.SM4,
                    keyLength: 256,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SM3,
                    autoEncrypt: true
                };
                const result: string = mgr.configure(config);
                addLog('testSuppEnc0005: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(mgr.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
                expect(mgr.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_ENC_0600
         * @tc.name: testSuppEnc0006
         * @tc.desc: Verify getEncryptionConfig returns current configuration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppEnc0006', 0, (done: Function) => {
            runCase('testSuppEnc0006', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                const config: string = mgr.getEncryptionConfig();
                addLog('testSuppEnc0006: config=%{public}s', config);
                expect(config.indexOf('EncryptionConfig')).assertLargerOrEqual(0);
                expect(config.indexOf('AES-256')).assertLargerOrEqual(0);
                expect(config.indexOf('SHA-512')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_BAK_0100
         * @tc.name: testSuppBak0001
         * @tc.desc: Verify getLatestBackup returns most recently created backup.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0001', 0, (done: Function) => {
            runCase('testSuppBak0001', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                mgr.createBackup('bak1', StoreType.PREFERENCES, 10);
                mgr.createBackup('bak2', StoreType.RDB, 20);
                const latest: string = mgr.getLatestBackup();
                addLog('testSuppBak0001: latest=%{public}s', latest);
                expect(latest.indexOf('bak2')).assertLargerOrEqual(0);
                expect(latest.indexOf('20')).assertLargerOrEqual(0);
                expect(latest.indexOf('Latest')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0200
         * @tc.name: testSuppBak0002
         * @tc.desc: Verify getOldestBackup returns earliest created backup.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0002', 0, (done: Function) => {
            runCase('testSuppBak0002', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                mgr.createBackup('first', StoreType.ARRAY, 5);
                mgr.createBackup('second', StoreType.MAP, 15);
                const oldest: string = mgr.getOldestBackup();
                addLog('testSuppBak0002: oldest=%{public}s', oldest);
                expect(oldest.indexOf('first')).assertLargerOrEqual(0);
                expect(oldest.indexOf('5')).assertLargerOrEqual(0);
                expect(oldest.indexOf('Oldest')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0300
         * @tc.name: testSuppBak0003
         * @tc.desc: Verify getLatestBackup returns empty message when no backups.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppBak0003', 0, (done: Function) => {
            runCase('testSuppBak0003', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const latest: string = mgr.getLatestBackup();
                const oldest: string = mgr.getOldestBackup();
                addLog('testSuppBak0003: latest=%{public}s', latest);
                expect(latest.indexOf('no backups')).assertLargerOrEqual(0);
                expect(oldest.indexOf('no backups')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0400
         * @tc.name: testSuppBak0004
         * @tc.desc: Verify setAutoBackup configures auto-backup settings.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0004', 0, (done: Function) => {
            runCase('testSuppBak0004', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                expect(mgr.isAutoBackupEnabled()).assertFalse();
                const result: string = mgr.setAutoBackup(true, 120000);
                addLog('testSuppBak0004: result=%{public}s', result);
                expect(result.indexOf('enabled=true')).assertLargerOrEqual(0);
                expect(mgr.isAutoBackupEnabled()).assertTrue();
                expect(mgr.getAutoBackupInterval()).assertEqual(120000);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0500
         * @tc.name: testSuppBak0005
         * @tc.desc: Verify checkAutoBackup triggers when interval elapsed.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0005', 0, (done: Function) => {
            runCase('testSuppBak0005', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const disabledResult: string = mgr.checkAutoBackup();
                mgr.setAutoBackup(true, 60000);
                const triggeredResult: string = mgr.checkAutoBackup();
                addLog('testSuppBak0005: disabled=%{public}s', disabledResult);
                expect(disabledResult.indexOf('disabled')).assertLargerOrEqual(0);
                expect(triggeredResult.indexOf('triggered')).assertLargerOrEqual(0);
                expect(mgr.isAutoBackupEnabled()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0600
         * @tc.name: testSuppBak0006
         * @tc.desc: Verify getTotalBackupSize and getTotalEntryCount aggregate values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0006', 0, (done: Function) => {
            runCase('testSuppBak0006', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                mgr.createBackup('s1', StoreType.PREFERENCES, 10);
                mgr.createBackup('s2', StoreType.RDB, 20);
                const totalSize: number = mgr.getTotalBackupSize();
                const totalEntries: number = mgr.getTotalEntryCount();
                addLog('testSuppBak0006: size=%{public}d, entries=%{public}d', String(totalSize), String(totalEntries));
                expect(totalSize).assertEqual(10 * 128 + 20 * 128);
                expect(totalEntries).assertEqual(30);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0700
         * @tc.name: testSuppBak0007
         * @tc.desc: Verify verifyBackupIntegrity checks checksum validity.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppBak0007', 0, (done: Function) => {
            runCase('testSuppBak0007', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                mgr.createBackup('integrity', StoreType.MAP, 50);
                const result: string = mgr.verifyBackupIntegrity('integrity');
                const missing: string = mgr.verifyBackupIntegrity('nonexist');
                addLog('testSuppBak0007: result=%{public}s', result);
                expect(result.indexOf('VALID')).assertLargerOrEqual(0);
                expect(missing.indexOf('not found')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_BAK_0800
         * @tc.name: testSuppBak0008
         * @tc.desc: Verify setAutoBackup rejects interval below 60000ms.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppBak0008', 0, (done: Function) => {
            runCase('testSuppBak0008', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const result: string = mgr.setAutoBackup(true, 1000);
                addLog('testSuppBak0008: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('60000')).assertLargerOrEqual(0);
                expect(mgr.isAutoBackupEnabled()).assertFalse();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_MIG_0100
         * @tc.name: testSuppMig0001
         * @tc.desc: Verify migrateSync applies migration steps synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0001', 0, (done: Function) => {
            runCase('testSuppMig0001', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                mgr.registerMigrationStep(1, 2, 'Add users table');
                mgr.registerMigrationStep(2, 3, 'Add index');
                const result: string = mgr.migrateSync(3);
                addLog('testSuppMig0001: result=%{public}s', result);
                expect(result.indexOf('migrateSync')).assertLargerOrEqual(0);
                expect(result.indexOf('3')).assertLargerOrEqual(0);
                expect(mgr.getCurrentVersion()).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0200
         * @tc.name: testSuppMig0002
         * @tc.desc: Verify rollback reverts to a lower version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0002', 0, (done: Function) => {
            runCase('testSuppMig0002', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                mgr.registerMigrationStep(1, 2, 'Step A');
                mgr.registerMigrationStep(2, 3, 'Step B');
                await mgr.migrate(3);
                const result: string = mgr.rollback(1);
                addLog('testSuppMig0002: result=%{public}s', result);
                expect(result.indexOf('rollback')).assertLargerOrEqual(0);
                expect(result.indexOf('1')).assertLargerOrEqual(0);
                expect(mgr.getCurrentVersion()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0300
         * @tc.name: testSuppMig0003
         * @tc.desc: Verify setAutoMigrate and isAutoMigrate toggle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0003', 0, (done: Function) => {
            runCase('testSuppMig0003', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                expect(mgr.isAutoMigrate()).assertFalse();
                const result: string = mgr.setAutoMigrate(true);
                addLog('testSuppMig0003: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(mgr.isAutoMigrate()).assertTrue();
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0400
         * @tc.name: testSuppMig0004
         * @tc.desc: Verify getMigrationLog returns log entry count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0004', 0, (done: Function) => {
            runCase('testSuppMig0004', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                mgr.registerMigrationStep(1, 2, 'Log test');
                const log: string = mgr.getMigrationLog();
                addLog('testSuppMig0004: log=%{public}s', log);
                expect(log.indexOf('entries')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getCurrentVersion()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0500
         * @tc.name: testSuppMig0005
         * @tc.desc: Verify getMigrationLogEntries returns log messages.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0005', 0, (done: Function) => {
            runCase('testSuppMig0005', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                const entries: string[] = mgr.getMigrationLogEntries();
                addLog('testSuppMig0005: entries=%{public}d', String(entries.length));
                expect(entries.length).assertLargerOrEqual(1);
                expect(entries[0].indexOf('initialized')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0600
         * @tc.name: testSuppMig0006
         * @tc.desc: Verify getMigrationStrategy returns strategy summary.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0006', 0, (done: Function) => {
            runCase('testSuppMig0006', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                mgr.registerMigrationStep(1, 2, 'Strategy step');
                const strategy: string = mgr.getMigrationStrategy();
                addLog('testSuppMig0006: strategy=%{public}s', strategy);
                expect(strategy.indexOf('Strategy')).assertLargerOrEqual(0);
                expect(strategy.indexOf('current=v1')).assertLargerOrEqual(0);
                expect(strategy.indexOf('Strategy step')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0700
         * @tc.name: testSuppMig0007
         * @tc.desc: Verify rollback fails when target >= current.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppMig0007', 0, (done: Function) => {
            runCase('testSuppMig0007', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(3);
                const result: string = mgr.rollback(3);
                const invalidResult: string = mgr.rollback(5);
                addLog('testSuppMig0007: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(invalidResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(mgr.getCurrentVersion()).assertEqual(3);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_MIG_0800
         * @tc.name: testSuppMig0008
         * @tc.desc: Verify getStatusString reflects current migration state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppMig0008', 0, (done: Function) => {
            runCase('testSuppMig0008', async (): Promise<void> => {
                const mgr: DataMigrationManager = new DataMigrationManager();
                mgr.initialize(1);
                const statusStr: string = mgr.getStatusString();
                addLog('testSuppMig0008: status=%{public}s', statusStr);
                expect(statusStr.indexOf('version=1')).assertLargerOrEqual(0);
                expect(statusStr.indexOf('idle')).assertLargerOrEqual(0);
                expect(mgr.getStatus()).assertEqual(MigrationStatus.IDLE);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_DIST_0100
         * @tc.name: testSuppDist0001
         * @tc.desc: Verify unregisterDevice removes a registered device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0001', 0, (done: Function) => {
            runCase('testSuppDist0001', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                mgr.registerDevice('dev001', 'Phone', 'mobile');
                mgr.registerDevice('dev002', 'Tablet', 'tablet');
                const result: string = mgr.unregisterDevice('dev001');
                addLog('testSuppDist0001: result=%{public}s', result);
                expect(result.indexOf('unregisterDevice')).assertLargerOrEqual(0);
                expect(result.indexOf('dev001')).assertLargerOrEqual(0);
                expect(mgr.getConnectedDevices()).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0200
         * @tc.name: testSuppDist0002
         * @tc.desc: Verify getDeviceInfo returns device details.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0002', 0, (done: Function) => {
            runCase('testSuppDist0002', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                mgr.registerDevice('d1', 'MyPhone', 'mobile');
                const info: string = mgr.getDeviceInfo('d1');
                const missing: string = mgr.getDeviceInfo('nonexist');
                addLog('testSuppDist0002: info=%{public}s', info);
                expect(info.indexOf('MyPhone')).assertLargerOrEqual(0);
                expect(info.indexOf('mobile')).assertLargerOrEqual(0);
                expect(missing.indexOf('not found')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0300
         * @tc.name: testSuppDist0003
         * @tc.desc: Verify setDeviceConnected toggles device connection state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0003', 0, (done: Function) => {
            runCase('testSuppDist0003', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                mgr.registerDevice('d1', 'Phone', 'mobile');
                const result: string = mgr.setDeviceConnected('d1', false);
                addLog('testSuppDist0003: result=%{public}s', result);
                expect(result.indexOf('setDeviceConnected')).assertLargerOrEqual(0);
                expect(result.indexOf('false')).assertLargerOrEqual(0);
                expect(mgr.getConnectedDevices()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0400
         * @tc.name: testSuppDist0004
         * @tc.desc: Verify sync completes with registered devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0004', 0, (done: Function) => {
            runCase('testSuppDist0004', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                mgr.registerDevice('d1', 'Phone', 'mobile');
                const result: string = await mgr.sync();
                addLog('testSuppDist0004: result=%{public}s', result);
                expect(result.indexOf('sync')).assertLargerOrEqual(0);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('1/1')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0500
         * @tc.name: testSuppDist0005
         * @tc.desc: Verify setSyncMode and getSyncMode configuration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0005', 0, (done: Function) => {
            runCase('testSuppDist0005', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                expect(mgr.getSyncMode()).assertEqual(SyncMode.MANUAL);
                const result: string = mgr.setSyncMode(SyncMode.REAL_TIME);
                addLog('testSuppDist0005: result=%{public}s', result);
                expect(result.indexOf('realTime')).assertLargerOrEqual(0);
                expect(mgr.getSyncMode()).assertEqual(SyncMode.REAL_TIME);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0600
         * @tc.name: testSuppDist0006
         * @tc.desc: Verify setConflictPolicy and getConflictPolicy configuration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0006', 0, (done: Function) => {
            runCase('testSuppDist0006', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                expect(mgr.getConflictPolicy()).assertEqual(ConflictPolicy.LOCAL_FIRST);
                const result: string = mgr.setConflictPolicy(ConflictPolicy.TIMESTAMP);
                addLog('testSuppDist0006: result=%{public}s', result);
                expect(result.indexOf('timestamp')).assertLargerOrEqual(0);
                expect(mgr.getConflictPolicy()).assertEqual(ConflictPolicy.TIMESTAMP);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0700
         * @tc.name: testSuppDist0007
         * @tc.desc: Verify getConnectedDevices counts only connected devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppDist0007', 0, (done: Function) => {
            runCase('testSuppDist0007', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                mgr.registerDevice('d1', 'A', 'mobile');
                mgr.registerDevice('d2', 'B', 'tablet');
                mgr.setDeviceConnected('d2', false);
                const connected: number = mgr.getConnectedDevices();
                addLog('testSuppDist0007: connected=%{public}d', String(connected));
                expect(connected).assertEqual(1);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getConnectedDevices()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_DIST_0800
         * @tc.name: testSuppDist0008
         * @tc.desc: Verify sync fails with no devices registered.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppDist0008', 0, (done: Function) => {
            runCase('testSuppDist0008', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = await mgr.sync();
                addLog('testSuppDist0008: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('no devices')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SUPP_PREF_0100
         * @tc.name: testSuppPref0001
         * @tc.desc: Verify subscribeChange and unsubscribeChange lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppPref0001', 0, (done: Function) => {
            runCase('testSuppPref0001', async (): Promise<void> => {
                const helper: SendablePreferencesHelper = createPrefHelper();
                await helper.initialize();
                const subResult: string = helper.subscribeChange();
                const unsubResult: string = helper.unsubscribeChange();
                addLog('testSuppPref0001: sub=%{public}s', subResult);
                expect(subResult.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(unsubResult.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                helper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_PREF_0200
         * @tc.name: testSuppPref0002
         * @tc.desc: Verify subscribeMultiProcessChange and unsubscribeMultiProcessChange.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppPref0002', 0, (done: Function) => {
            runCase('testSuppPref0002', async (): Promise<void> => {
                const helper: SendablePreferencesHelper = createPrefHelper();
                await helper.initialize();
                const subResult: string = helper.subscribeMultiProcessChange();
                const unsubResult: string = helper.unsubscribeMultiProcessChange();
                addLog('testSuppPref0002: sub=%{public}s', subResult);
                expect(subResult.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(unsubResult.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                helper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_PREF_0300
         * @tc.name: testSuppPref0003
         * @tc.desc: Verify subscribeDataChange and unsubscribeDataChange.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSuppPref0003', 0, (done: Function) => {
            runCase('testSuppPref0003', async (): Promise<void> => {
                const helper: SendablePreferencesHelper = createPrefHelper();
                await helper.initialize();
                const subResult: string = helper.subscribeDataChange();
                const unsubResult: string = helper.unsubscribeDataChange();
                addLog('testSuppPref0003: sub=%{public}s', subResult);
                expect(subResult.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(unsubResult.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                helper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SUPP_PREF_0400
         * @tc.name: testSuppPref0004
         * @tc.desc: Verify removeFromCache and removeFromCacheSync clear preferences.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSuppPref0004', 0, (done: Function) => {
            runCase('testSuppPref0004', async (): Promise<void> => {
                const helper: SendablePreferencesHelper = createPrefHelper();
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.removeFromCache();
                addLog('testSuppPref0004: result=%{public}s', result);
                expect(result.indexOf('removePreferencesFromCache')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                helper.release();
            }, done);
        });
    });
}
