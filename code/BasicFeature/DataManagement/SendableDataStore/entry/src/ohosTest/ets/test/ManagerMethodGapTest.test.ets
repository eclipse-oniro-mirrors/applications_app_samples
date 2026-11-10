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
import { runCase, addLog } from '../testkit/SharedDriver';
import { SendableArrayManager } from '../../../main/ets/sendablearray/SendableArrayManager';
import { SendableMapManager } from '../../../main/ets/sendablemap/SendableMapManager';
import { SendableQueueManager } from '../../../main/ets/sendablequeue/SendableQueueManager';
import { SendableRecordManager } from '../../../main/ets/sendablerecord/SendableRecordManager';
import { DataEncryptionManager } from '../../../main/ets/encryption/DataEncryptionManager';
import { DataBackupManager } from '../../../main/ets/backup/DataBackupManager';
import { DistributedDataManager } from '../../../main/ets/distributed/DistributedDataManager';
import { DataType, MapEntry, SchemaField, RecordDefinition } from '../../../main/ets/models/DataModels';
import { EncryptionMode, HashAlgorithm, EncryptionConfig } from '../../../main/ets/models/DataModels';
import { SyncMode, ConflictPolicy } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function managerMethodGapTest(): void {
    describe('ManagerMethodGapTest', () => {

        

        /*
         * @tc.number: SUB_MGR_GAP_0100
         * @tc.name: testMgrGap0001
         * @tc.desc: Verify sliceStringArray returns correct sub-array for string type.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0001', 0, (done: Function) => {
            runCase('testMgrGap0001', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createStringArray(5);
                mgr.setStringElement(0, 'alpha');
                mgr.setStringElement(1, 'beta');
                mgr.setStringElement(2, 'gamma');
                mgr.setStringElement(3, 'delta');
                mgr.setStringElement(4, 'epsilon');
                const result: string = mgr.sliceStringArray(1, 4);
                addLog('testMgrGap0001: result=%{public}s', result);
                expect(result.indexOf('beta')).assertLargerOrEqual(0);
                expect(result.indexOf('gamma')).assertLargerOrEqual(0);
                expect(result.indexOf('3 elements')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0200
         * @tc.name: testMgrGap0002
         * @tc.desc: Verify filterStringContains returns matching elements.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0002', 0, (done: Function) => {
            runCase('testMgrGap0002', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromStringArray(['apple_pie', 'banana_split', 'apple_juice', 'cherry']);
                const result: string = mgr.filterStringContains('apple');
                addLog('testMgrGap0002: result=%{public}s', result);
                expect(result.indexOf('apple_pie')).assertLargerOrEqual(0);
                expect(result.indexOf('apple_juice')).assertLargerOrEqual(0);
                expect(result.indexOf('2 matches')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0300
         * @tc.name: testMgrGap0003
         * @tc.desc: Verify reverseArray works on string type array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0003', 0, (done: Function) => {
            runCase('testMgrGap0003', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromStringArray(['a', 'b', 'c', 'd']);
                const result: string = mgr.reverseArray();
                addLog('testMgrGap0003: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                const first: string = mgr.getStringElement(0);
                const last: string = mgr.getStringElement(3);
                expect(first.indexOf('d')).assertLargerOrEqual(0);
                expect(last.indexOf('a')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0400
         * @tc.name: testMgrGap0004
         * @tc.desc: Verify swapElements works on string type array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0004', 0, (done: Function) => {
            runCase('testMgrGap0004', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                mgr.createFromStringArray(['x', 'y', 'z']);
                const result: string = mgr.swapElements(0, 2);
                addLog('testMgrGap0004: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                const pos0: string = mgr.getStringElement(0);
                const pos2: string = mgr.getStringElement(2);
                expect(pos0.indexOf('z')).assertLargerOrEqual(0);
                expect(pos2.indexOf('x')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0500
         * @tc.name: testMgrGap0005
         * @tc.desc: Verify createFromArray fails when input exceeds MAX_RESIZE_CAPACITY 100000.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0005', 0, (done: Function) => {
            runCase('testMgrGap0005', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                const big: number[] = new Array<number>(100001);
                for (let i = 0; i < 100001; i++) {
                    big[i] = i;
                }
                const result: string = mgr.createFromArray(big);
                addLog('testMgrGap0005: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('exceeds max')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0600
         * @tc.name: testMgrGap0006
         * @tc.desc: Verify createFromStringArray fails when input exceeds MAX_RESIZE_CAPACITY.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0006', 0, (done: Function) => {
            runCase('testMgrGap0006', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                const big: string[] = new Array<string>(100001);
                for (let i = 0; i < 100001; i++) {
                    big[i] = 'x';
                }
                const result: string = mgr.createFromStringArray(big);
                addLog('testMgrGap0006: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('exceeds max')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0700
         * @tc.name: testMgrGap0007
         * @tc.desc: Verify getDataType returns correct type after creation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0007', 0, (done: Function) => {
            runCase('testMgrGap0007', async (): Promise<void> => {
                const mgr: SendableArrayManager = new SendableArrayManager();
                expect(mgr.getDataType()).assertEqual(DataType.NULL);
                mgr.createNumberArray(5);
                expect(mgr.getDataType()).assertEqual(DataType.NUMBER);
                mgr.createStringArray(5);
                expect(mgr.getDataType()).assertEqual(DataType.STRING);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_0800
         * @tc.name: testMgrGap0008
         * @tc.desc: Verify putAll fails with empty entries array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0008', 0, (done: Function) => {
            runCase('testMgrGap0008', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                const entries: MapEntry[] = [];
                const result: string = mgr.putAll(entries);
                addLog('testMgrGap0008: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.getSize()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_0900
         * @tc.name: testMgrGap0009
         * @tc.desc: Verify getAll fails with empty keys array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0009', 0, (done: Function) => {
            runCase('testMgrGap0009', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                mgr.putString('a', '1');
                const keys: string[] = [];
                const result: string = mgr.getAll(keys);
                addLog('testMgrGap0009: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.getSize()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1000
         * @tc.name: testMgrGap0010
         * @tc.desc: Verify removeAll fails with empty keys array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0010', 0, (done: Function) => {
            runCase('testMgrGap0010', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                mgr.putString('a', '1');
                const keys: string[] = [];
                const result: string = mgr.removeAll(keys);
                addLog('testMgrGap0010: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.getSize()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1100
         * @tc.name: testMgrGap0011
         * @tc.desc: Verify getWithType returns value with type and timestamp info.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0011', 0, (done: Function) => {
            runCase('testMgrGap0011', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                mgr.putNumber('count', 42);
                const result: string = mgr.getWithType('count');
                addLog('testMgrGap0011: result=%{public}s', result);
                expect(result.indexOf('count')).assertLargerOrEqual(0);
                expect(result.indexOf('42')).assertLargerOrEqual(0);
                expect(result.indexOf('number')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1200
         * @tc.name: testMgrGap0012
         * @tc.desc: Verify forEach traverses all stored entries.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0012', 0, (done: Function) => {
            runCase('testMgrGap0012', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                mgr.putString('name', 'Alice');
                mgr.putNumber('age', 30);
                const result: string = mgr.forEach();
                addLog('testMgrGap0012: result=%{public}s', result);
                expect(result.indexOf('[name]=Alice')).assertLargerOrEqual(0);
                expect(result.indexOf('[age]=30')).assertLargerOrEqual(0);
                expect(result.indexOf('forEach')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1300
         * @tc.name: testMgrGap0013
         * @tc.desc: Verify filterByKeyPrefix fails with empty prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0013', 0, (done: Function) => {
            runCase('testMgrGap0013', async (): Promise<void> => {
                const mgr: SendableMapManager = new SendableMapManager();
                mgr.initialize(64);
                mgr.putString('user_name', 'Alice');
                const result: string = mgr.filterByKeyPrefix('');
                addLog('testMgrGap0013: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
                expect(mgr.getSize()).assertEqual(1);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_1400
         * @tc.name: testMgrGap0014
         * @tc.desc: Verify drain fails with zero count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0014', 0, (done: Function) => {
            runCase('testMgrGap0014', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                mgr.enqueueString('item', 5);
                const result: string = mgr.drain(0);
                addLog('testMgrGap0014: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('positive')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1500
         * @tc.name: testMgrGap0015
         * @tc.desc: Verify peekAll returns empty indicator on empty queue.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0015', 0, (done: Function) => {
            runCase('testMgrGap0015', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(10);
                const result: string = mgr.peekAll();
                addLog('testMgrGap0015: result=%{public}s', result);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.isEmpty()).assertTrue();
                expect(mgr.size()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1600
         * @tc.name: testMgrGap0016
         * @tc.desc: Verify peek on LIFO queue returns last enqueued item.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0016', 0, (done: Function) => {
            runCase('testMgrGap0016', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeLIFO(10);
                mgr.enqueueString('first', 1);
                mgr.enqueueString('second', 2);
                mgr.enqueueString('third', 3);
                const result: string = mgr.peek();
                addLog('testMgrGap0016: peek=%{public}s', result);
                expect(result.indexOf('third')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(3);
                expect(mgr.getQueueType()).assertEqual('LIFO');
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1700
         * @tc.name: testMgrGap0017
         * @tc.desc: Verify batchEnqueueString fails with empty input array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0017', 0, (done: Function) => {
            runCase('testMgrGap0017', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(100);
                const items: string[] = [];
                const result: string = mgr.batchEnqueueString(items, 5);
                addLog('testMgrGap0017: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_1800
         * @tc.name: testMgrGap0018
         * @tc.desc: Verify batchEnqueueNumber fails when exceeding queue capacity.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0018', 0, (done: Function) => {
            runCase('testMgrGap0018', async (): Promise<void> => {
                const mgr: SendableQueueManager = new SendableQueueManager();
                mgr.initializeFIFO(3);
                mgr.enqueueNumber(1, 5);
                const items: number[] = [10, 20, 30];
                const result: string = mgr.batchEnqueueNumber(items, 5);
                addLog('testMgrGap0018: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('capacity')).assertLargerOrEqual(0);
                expect(mgr.size()).assertEqual(1);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_1900
         * @tc.name: testMgrGap0019
         * @tc.desc: Verify createRecord fails when fields exceed MAX_RECORD_FIELDS 256.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0019', 0, (done: Function) => {
            runCase('testMgrGap0019', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [];
                for (let i = 0; i < 257; i++) {
                    const f: SchemaField = {
                        name: 'field_' + i,
                        dataType: DataType.STRING,
                        required: false,
                        defaultValue: '',
                        maxLength: 100,
                        min: 0,
                        max: 0
                    };
                    fields.push(f);
                }
                const result: string = mgr.createRecord('BigRecord', fields);
                addLog('testMgrGap0019: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('exceeds max')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertFalse();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2000
         * @tc.name: testMgrGap0020
         * @tc.desc: Verify setStringField fails when value exceeds MAX_VALUE_LENGTH 8192.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0020', 0, (done: Function) => {
            runCase('testMgrGap0020', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'content', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 8192, min: 0, max: 0 }
                ];
                mgr.createRecord('TextRecord', fields);
                const longValue: string = 'A'.repeat(8193);
                const result: string = mgr.setStringField('content', longValue);
                addLog('testMgrGap0020: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('max length')).assertLargerOrEqual(0);
                expect(mgr.getFieldCount()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2100
         * @tc.name: testMgrGap0021
         * @tc.desc: Verify getFieldNames returns all defined field names.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0021', 0, (done: Function) => {
            runCase('testMgrGap0021', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'firstName', dataType: DataType.STRING, required: true, defaultValue: '', maxLength: 50, min: 0, max: 0 },
                    { name: 'age', dataType: DataType.NUMBER, required: false, defaultValue: '0', maxLength: 0, min: 0, max: 200 },
                    { name: 'active', dataType: DataType.BOOLEAN, required: false, defaultValue: 'true', maxLength: 0, min: 0, max: 0 }
                ];
                mgr.createRecord('Person', fields);
                const names: string[] = mgr.getFieldNames();
                addLog('testMgrGap0021: names=%{public}s', JSON.stringify(names));
                expect(names.length).assertEqual(3);
                expect(names[0]).assertEqual('firstName');
                expect(names[1]).assertEqual('age');
                expect(names[2]).assertEqual('active');
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2200
         * @tc.name: testMgrGap0022
         * @tc.desc: Verify createFromDefinition creates record via RecordDefinition.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0022', 0, (done: Function) => {
            runCase('testMgrGap0022', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'title', dataType: DataType.STRING, required: true, defaultValue: 'untitled', maxLength: 200, min: 0, max: 0 }
                ];
                const def: RecordDefinition = {
                    name: 'Article',
                    fields: fields,
                    createdAt: Date.now(),
                    updatedAt: Date.now()
                };
                const result: string = mgr.createFromDefinition(def);
                addLog('testMgrGap0022: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(mgr.getRecordName()).assertEqual('Article');
                expect(mgr.getFieldCount()).assertEqual(1);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2300
         * @tc.name: testMgrGap0023
         * @tc.desc: Verify toSchemaJSON returns schema with field definitions.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testMgrGap0023', 0, (done: Function) => {
            runCase('testMgrGap0023', async (): Promise<void> => {
                const mgr: SendableRecordManager = new SendableRecordManager();
                const fields: SchemaField[] = [
                    { name: 'id', dataType: DataType.NUMBER, required: true, defaultValue: '0', maxLength: 0, min: 1, max: 9999 }
                ];
                mgr.createRecord('Item', fields);
                const schema: string = mgr.toSchemaJSON();
                addLog('testMgrGap0023: schema=%{public}s', schema);
                expect(schema.indexOf('Item')).assertLargerOrEqual(0);
                expect(schema.indexOf('id')).assertLargerOrEqual(0);
                expect(schema.indexOf('number')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_2400
         * @tc.name: testMgrGap0024
         * @tc.desc: Verify configure fails with invalid encryption mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0024', 0, (done: Function) => {
            runCase('testMgrGap0024', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const config: EncryptionConfig = {
                    mode: 'INVALID_MODE' as EncryptionMode,
                    keyLength: 256,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SHA_256,
                    autoEncrypt: false
                };
                const result: string = mgr.configure(config);
                addLog('testMgrGap0024: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
                expect(mgr.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2500
         * @tc.name: testMgrGap0025
         * @tc.desc: Verify configure fails with keyLength below MIN_KEY_LENGTH 16.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0025', 0, (done: Function) => {
            runCase('testMgrGap0025', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const config: EncryptionConfig = {
                    mode: EncryptionMode.AES_128,
                    keyLength: 8,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SHA_256,
                    autoEncrypt: false
                };
                const result: string = mgr.configure(config);
                addLog('testMgrGap0025: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('out of range')).assertLargerOrEqual(0);
                expect(mgr.getKeyLength()).assertEqual(256);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2600
         * @tc.name: testMgrGap0026
         * @tc.desc: Verify configure fails with keyLength above MAX_KEY_LENGTH 512.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0026', 0, (done: Function) => {
            runCase('testMgrGap0026', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const config: EncryptionConfig = {
                    mode: EncryptionMode.AES_256,
                    keyLength: 1024,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SHA_256,
                    autoEncrypt: false
                };
                const result: string = mgr.configure(config);
                addLog('testMgrGap0026: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('out of range')).assertLargerOrEqual(0);
                expect(mgr.getKeyLength()).assertEqual(256);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2700
         * @tc.name: testMgrGap0027
         * @tc.desc: Verify encrypt fails with empty plaintext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0027', 0, (done: Function) => {
            runCase('testMgrGap0027', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                mgr.generateKey();
                const result: string = mgr.encrypt('');
                addLog('testMgrGap0027: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
                expect(mgr.isKeyGenerated()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2800
         * @tc.name: testMgrGap0028
         * @tc.desc: Verify decrypt fails with invalid ciphertext format.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0028', 0, (done: Function) => {
            runCase('testMgrGap0028', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                mgr.generateKey();
                const result: string = mgr.decrypt('abc');
                addLog('testMgrGap0028: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('format')).assertLargerOrEqual(0);
                expect(mgr.isKeyGenerated()).assertTrue();
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_2900
         * @tc.name: testMgrGap0029
         * @tc.desc: Verify computeHash produces SHA-512 hash with correct prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0029', 0, (done: Function) => {
            runCase('testMgrGap0029', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                const result: string = mgr.computeHash('test_data');
                addLog('testMgrGap0029: result=%{public}s', result);
                expect(result.indexOf('sha512_')).assertLargerOrEqual(0);
                expect(result.indexOf('SHA-512')).assertLargerOrEqual(0);
                expect(result.length).assertLargerOrEqual(10);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3000
         * @tc.name: testMgrGap0030
         * @tc.desc: Verify computeHash produces SM3 hash with correct prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0030', 0, (done: Function) => {
            runCase('testMgrGap0030', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                const result: string = mgr.computeHash('test_data');
                addLog('testMgrGap0030: result=%{public}s', result);
                expect(result.indexOf('sm3_')).assertLargerOrEqual(0);
                expect(result.indexOf('SM3')).assertLargerOrEqual(0);
                expect(result.length).assertLargerOrEqual(8);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3100
         * @tc.name: testMgrGap0031
         * @tc.desc: Verify getKey fails when no key has been generated.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0031', 0, (done: Function) => {
            runCase('testMgrGap0031', async (): Promise<void> => {
                const mgr: DataEncryptionManager = new DataEncryptionManager();
                mgr.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const keyResult: string = mgr.getKey();
                addLog('testMgrGap0031: key=%{public}s', keyResult);
                expect(keyResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(keyResult.indexOf('no key')).assertLargerOrEqual(0);
                expect(mgr.isKeyGenerated()).assertFalse();
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_3200
         * @tc.name: testMgrGap0032
         * @tc.desc: Verify listBackups returns empty indicator when no backups exist.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0032', 0, (done: Function) => {
            runCase('testMgrGap0032', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const result: string = mgr.listBackups();
                addLog('testMgrGap0032: result=%{public}s', result);
                expect(result.indexOf('no backups')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getStatistics().indexOf('count=0')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3300
         * @tc.name: testMgrGap0033
         * @tc.desc: Verify getLatestBackup returns empty indicator when no backups exist.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0033', 0, (done: Function) => {
            runCase('testMgrGap0033', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const result: string = mgr.getLatestBackup();
                addLog('testMgrGap0033: result=%{public}s', result);
                expect(result.indexOf('no backups')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getStatistics().indexOf('count=0')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3400
         * @tc.name: testMgrGap0034
         * @tc.desc: Verify getOldestBackup returns empty indicator when no backups exist.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0034', 0, (done: Function) => {
            runCase('testMgrGap0034', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const result: string = mgr.getOldestBackup();
                addLog('testMgrGap0034: result=%{public}s', result);
                expect(result.indexOf('no backups')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getStatistics().indexOf('count=0')).assertLargerOrEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3500
         * @tc.name: testMgrGap0035
         * @tc.desc: Verify checkAutoBackup returns disabled message when auto-backup is off.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0035', 0, (done: Function) => {
            runCase('testMgrGap0035', async (): Promise<void> => {
                const mgr: DataBackupManager = new DataBackupManager();
                mgr.initialize();
                const result: string = mgr.checkAutoBackup();
                addLog('testMgrGap0035: result=%{public}s', result);
                expect(result.indexOf('disabled')).assertLargerOrEqual(0);
                expect(mgr.isAutoBackupEnabled()).assertFalse();
                expect(mgr.getAutoBackupInterval()).assertEqual(3600000);
                mgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_MGR_GAP_3600
         * @tc.name: testMgrGap0036
         * @tc.desc: Verify sync fails when no devices are registered.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0036', 0, (done: Function) => {
            runCase('testMgrGap0036', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = await mgr.sync();
                addLog('testMgrGap0036: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('no devices')).assertLargerOrEqual(0);
                expect(mgr.getConnectedDevices()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3700
         * @tc.name: testMgrGap0037
         * @tc.desc: Verify listDevices returns empty indicator when no devices registered.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0037', 0, (done: Function) => {
            runCase('testMgrGap0037', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = mgr.listDevices();
                addLog('testMgrGap0037: result=%{public}s', result);
                expect(result.indexOf('no devices')).assertLargerOrEqual(0);
                expect(mgr.isInitialized()).assertTrue();
                expect(mgr.getConnectedDevices()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3800
         * @tc.name: testMgrGap0038
         * @tc.desc: Verify getDeviceInfo returns not found for non-existing device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0038', 0, (done: Function) => {
            runCase('testMgrGap0038', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = mgr.getDeviceInfo('ghost_device');
                addLog('testMgrGap0038: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
                expect(result.indexOf('ghost_device')).assertLargerOrEqual(0);
                expect(mgr.getConnectedDevices()).assertEqual(0);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_3900
         * @tc.name: testMgrGap0039
         * @tc.desc: Verify setSyncMode fails with invalid mode string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0039', 0, (done: Function) => {
            runCase('testMgrGap0039', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = mgr.setSyncMode('invalidMode' as SyncMode);
                addLog('testMgrGap0039: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
                expect(mgr.getSyncMode()).assertEqual(SyncMode.MANUAL);
                mgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_MGR_GAP_4000
         * @tc.name: testMgrGap0040
         * @tc.desc: Verify setConflictPolicy fails with invalid policy string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testMgrGap0040', 0, (done: Function) => {
            runCase('testMgrGap0040', async (): Promise<void> => {
                const mgr: DistributedDataManager = new DistributedDataManager();
                mgr.initialize();
                const result: string = mgr.setConflictPolicy('invalidPolicy' as ConflictPolicy);
                addLog('testMgrGap0040: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
                expect(mgr.getConflictPolicy()).assertEqual(ConflictPolicy.LOCAL_FIRST);
                mgr.release();
            }, done);
        });
    });
}
