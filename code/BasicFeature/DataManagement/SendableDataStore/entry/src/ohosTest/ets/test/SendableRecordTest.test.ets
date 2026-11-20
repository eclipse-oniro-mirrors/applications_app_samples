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
import { SendableRecordManager } from '../../../main/ets/sendablerecord/SendableRecordManager';
import { SchemaField, DataType } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function buildTestFields(): SchemaField[] {
  const fields: SchemaField[] = [
    { name: 'name', dataType: DataType.STRING, required: true, defaultValue: 'unknown', maxLength: 100, min: 0, max: 0 },
    { name: 'age', dataType: DataType.NUMBER, required: false, defaultValue: '0', maxLength: 0, min: 0, max: 200 },
    { name: 'active', dataType: DataType.BOOLEAN, required: false, defaultValue: 'true', maxLength: 0, min: 0, max: 0 }
  ];
  return fields;
}

export default function sendableRecordTest(): void {
  describe('SendableRecordTest', () => {
    let manager: SendableRecordManager = new SendableRecordManager();

    beforeAll(() => {
      addLog('SendableRecordTest suite started');
    })

    beforeEach(() => {
      manager = new SendableRecordManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('SendableRecordTest suite finished');
    })



    /*
     * @tc.number: SUB_SENDABLE_RECORD_0100
     * @tc.name: testSendableRecord0001
     * @tc.desc: Verify createRecord succeeds with valid name and fields.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0001', 0, (done: Function) => {
      runCase('testSendableRecord0001', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        const result: string = manager.createRecord('UserRecord', fields);
        addLog('testSendableRecord0001: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getFieldCount()).assertEqual(3);
        expect(manager.getRecordName()).assertEqual('UserRecord');
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0200
     * @tc.name: testSendableRecord0002
     * @tc.desc: Verify createRecord fails with empty name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0002', 0, (done: Function) => {
      runCase('testSendableRecord0002', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        const result: string = manager.createRecord('', fields);
        addLog('testSendableRecord0002: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getFieldCount()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0300
     * @tc.name: testSendableRecord0003
     * @tc.desc: Verify createRecord fails with empty fields array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0003', 0, (done: Function) => {
      runCase('testSendableRecord0003', async (): Promise<void> => {
        const fields: SchemaField[] = [];
        const result: string = manager.createRecord('EmptyRecord', fields);
        addLog('testSendableRecord0003: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getFieldCount()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0400
     * @tc.name: testSendableRecord0004
     * @tc.desc: Verify createRecord fails with invalid field name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0004', 0, (done: Function) => {
      runCase('testSendableRecord0004', async (): Promise<void> => {
        const fields: SchemaField[] = [
          { name: '', dataType: DataType.STRING, required: false, defaultValue: '', maxLength: 0, min: 0, max: 0 }
        ];
        const result: string = manager.createRecord('BadField', fields);
        addLog('testSendableRecord0004: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getFieldCount()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_0500
     * @tc.name: testSendableRecord0005
     * @tc.desc: Verify setStringField and getStringField work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0005', 0, (done: Function) => {
      runCase('testSendableRecord0005', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const setResult: string = manager.setStringField('name', 'Alice');
        const getResult: string = manager.getStringField('name');
        addLog('testSendableRecord0005: set=%{public}s, get=%{public}s', setResult, getResult);
        expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('Alice')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0600
     * @tc.name: testSendableRecord0006
     * @tc.desc: Verify setStringField fails for non-existing field.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0006', 0, (done: Function) => {
      runCase('testSendableRecord0006', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const result: string = manager.setStringField('nonexistent', 'value');
        addLog('testSendableRecord0006: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getFieldCount()).assertEqual(3);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0700
     * @tc.name: testSendableRecord0007
     * @tc.desc: Verify setStringField fails for non-string type field.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0007', 0, (done: Function) => {
      runCase('testSendableRecord0007', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const result: string = manager.setStringField('age', '25');
        addLog('testSendableRecord0007: result=%{public}s', result);
        expect(result.indexOf('not string type')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getRecordName()).assertEqual('User');
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_0800
     * @tc.name: testSendableRecord0008
     * @tc.desc: Verify setNumberField and getNumberField work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0008', 0, (done: Function) => {
      runCase('testSendableRecord0008', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const setResult: string = manager.setNumberField('age', 30);
        const getResult: string = manager.getNumberField('age');
        addLog('testSendableRecord0008: set=%{public}s, get=%{public}s', setResult, getResult);
        expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('30')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_0900
     * @tc.name: testSendableRecord0009
     * @tc.desc: Verify setNumberField fails for non-number type field.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0009', 0, (done: Function) => {
      runCase('testSendableRecord0009', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const result: string = manager.setNumberField('name', 42);
        addLog('testSendableRecord0009: result=%{public}s', result);
        expect(result.indexOf('not number type')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getRecordName()).assertEqual('User');
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_1000
     * @tc.name: testSendableRecord0010
     * @tc.desc: Verify setBooleanField and getBooleanField work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0010', 0, (done: Function) => {
      runCase('testSendableRecord0010', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const setResult: string = manager.setBooleanField('active', false);
        const getResult: string = manager.getBooleanField('active');
        addLog('testSendableRecord0010: set=%{public}s, get=%{public}s', setResult, getResult);
        expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('false')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1100
     * @tc.name: testSendableRecord0011
     * @tc.desc: Verify setBooleanField fails for non-boolean type field.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0011', 0, (done: Function) => {
      runCase('testSendableRecord0011', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const result: string = manager.setBooleanField('name', true);
        addLog('testSendableRecord0011: result=%{public}s', result);
        expect(result.indexOf('not boolean type')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getFieldCount()).assertEqual(3);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_1200
     * @tc.name: testSendableRecord0012
     * @tc.desc: Verify hasField returns correct existence status.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0012', 0, (done: Function) => {
      runCase('testSendableRecord0012', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const exists: boolean = manager.hasField('name');
        const notExists: boolean = manager.hasField('email');
        addLog('testSendableRecord0012: exists=%{public}s, notExists=%{public}s', String(exists), String(notExists));
        expect(exists).assertTrue();
        expect(notExists).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1300
     * @tc.name: testSendableRecord0013
     * @tc.desc: Verify getField returns value and type info.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0013', 0, (done: Function) => {
      runCase('testSendableRecord0013', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Bob');
        const result: string = manager.getField('name');
        addLog('testSendableRecord0013: result=%{public}s', result);
        expect(result.indexOf('Bob')).assertLargerOrEqual(0);
        expect(result.indexOf('string')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1400
     * @tc.name: testSendableRecord0014
     * @tc.desc: Verify getAllFields returns all field information.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0014', 0, (done: Function) => {
      runCase('testSendableRecord0014', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Charlie');
        manager.setNumberField('age', 28);
        const result: string = manager.getAllFields();
        addLog('testSendableRecord0014: result=%{public}s', result);
        expect(result.indexOf('name')).assertLargerOrEqual(0);
        expect(result.indexOf('Charlie')).assertLargerOrEqual(0);
        expect(result.indexOf('age')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_1500
     * @tc.name: testSendableRecord0015
     * @tc.desc: Verify validateRequired passes when all required fields have values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0015', 0, (done: Function) => {
      runCase('testSendableRecord0015', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Dave');
        const result: string = manager.validateRequired();
        addLog('testSendableRecord0015: result=%{public}s', result);
        expect(result.indexOf('all required')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getRecordName()).assertEqual('User');
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1600
     * @tc.name: testSendableRecord0016
     * @tc.desc: Verify validateRequired detects missing required fields.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0016', 0, (done: Function) => {
      runCase('testSendableRecord0016', async (): Promise<void> => {
        const fields: SchemaField[] = [
          { name: 'id', dataType: DataType.STRING, required: true, defaultValue: null, maxLength: 50, min: 0, max: 0 }
        ];
        manager.createRecord('Strict', fields);
        const result: string = manager.validateRequired();
        addLog('testSendableRecord0016: result=%{public}s', result);
        expect(result.indexOf('MISSING')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getRecordName()).assertEqual('Strict');
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_1700
     * @tc.name: testSendableRecord0017
     * @tc.desc: Verify resetField clears value to default.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0017', 0, (done: Function) => {
      runCase('testSendableRecord0017', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Eve');
        const result: string = manager.resetField('name');
        addLog('testSendableRecord0017: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const getValue: string = manager.getStringField('name');
        expect(getValue.indexOf('unknown')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1800
     * @tc.name: testSendableRecord0018
     * @tc.desc: Verify resetAllFields clears all field values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0018', 0, (done: Function) => {
      runCase('testSendableRecord0018', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Frank');
        manager.setNumberField('age', 40);
        const result: string = manager.resetAllFields();
        addLog('testSendableRecord0018: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getFieldCount()).assertEqual(3);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_1900
     * @tc.name: testSendableRecord0019
     * @tc.desc: Verify setDefaults applies default values to all fields.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0019', 0, (done: Function) => {
      runCase('testSendableRecord0019', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const result: string = manager.setDefaults();
        addLog('testSendableRecord0019: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const name: string = manager.getStringField('name');
        expect(name.indexOf('unknown')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_2000
     * @tc.name: testSendableRecord0020
     * @tc.desc: Verify addNestedRecord and getNestedRecord work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0020', 0, (done: Function) => {
      runCase('testSendableRecord0020', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('Parent', fields);
        const addResult: string = manager.addNestedRecord('child', 'child_value');
        const getResult: string = manager.getNestedRecord('child');
        addLog('testSendableRecord0020: add=%{public}s, get=%{public}s', addResult, getResult);
        expect(addResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('child_value')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_2100
     * @tc.name: testSendableRecord0021
     * @tc.desc: Verify removeNestedRecord deletes nested record correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0021', 0, (done: Function) => {
      runCase('testSendableRecord0021', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('Parent', fields);
        manager.addNestedRecord('nested1', 'val1');
        const result: string = manager.removeNestedRecord('nested1');
        addLog('testSendableRecord0021: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const getResult: string = manager.getNestedRecord('nested1');
        expect(getResult.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_2200
     * @tc.name: testSendableRecord0022
     * @tc.desc: Verify listNestedRecords returns all nested record names.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0022', 0, (done: Function) => {
      runCase('testSendableRecord0022', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('Parent', fields);
        manager.addNestedRecord('sub1', 'v1');
        manager.addNestedRecord('sub2', 'v2');
        const result: string = manager.listNestedRecords();
        addLog('testSendableRecord0022: result=%{public}s', result);
        expect(result.indexOf('sub1')).assertLargerOrEqual(0);
        expect(result.indexOf('sub2')).assertLargerOrEqual(0);
        expect(result.indexOf('2 records')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_2300
     * @tc.name: testSendableRecord0023
     * @tc.desc: Verify toJSONObject returns correct JSON representation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0023', 0, (done: Function) => {
      runCase('testSendableRecord0023', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Grace');
        const json: string = manager.toJSONObject();
        addLog('testSendableRecord0023: json=%{public}s', json);
        expect(json.indexOf('name')).assertLargerOrEqual(0);
        expect(json.indexOf('Grace')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_2400
     * @tc.name: testSendableRecord0024
     * @tc.desc: Verify toSchemaJSON includes field definitions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableRecord0024', 0, (done: Function) => {
      runCase('testSendableRecord0024', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        const json: string = manager.toSchemaJSON();
        addLog('testSendableRecord0024: json=%{public}s', json);
        expect(json.indexOf('User')).assertLargerOrEqual(0);
        expect(json.indexOf('fields')).assertLargerOrEqual(0);
        expect(json.indexOf('name')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_RECORD_2500
     * @tc.name: testSendableRecord0025
     * @tc.desc: Verify getStatistics returns correct record statistics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0025', 0, (done: Function) => {
      runCase('testSendableRecord0025', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('User', fields);
        manager.setStringField('name', 'Hank');
        const stats: string = manager.getStatistics();
        addLog('testSendableRecord0025: stats=%{public}s', stats);
        expect(stats.indexOf('User')).assertLargerOrEqual(0);
        expect(stats.indexOf('fields=3')).assertLargerOrEqual(0);
        expect(stats.indexOf('writes=')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_RECORD_2600
     * @tc.name: testSendableRecord0026
     * @tc.desc: Verify getDefinition returns record name and field count.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableRecord0026', 0, (done: Function) => {
      runCase('testSendableRecord0026', async (): Promise<void> => {
        const fields: SchemaField[] = buildTestFields();
        manager.createRecord('TestRecord', fields);
        const def: string = manager.getDefinition();
        addLog('testSendableRecord0026: def=%{public}s', def);
        expect(def.indexOf('TestRecord')).assertLargerOrEqual(0);
        expect(def.indexOf('3 fields')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });
  });
}
