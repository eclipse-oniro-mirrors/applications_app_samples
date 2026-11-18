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
import { SendableMapManager } from '../../../main/ets/sendablemap/SendableMapManager';
import { DataType, MapEntry } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function sendableMapTest(): void {
  describe('SendableMapTest', () => {
    let manager: SendableMapManager = new SendableMapManager();

    beforeAll(() => {
      addLog('SendableMapTest suite started');
    })

    beforeEach(() => {
      manager = new SendableMapManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('SendableMapTest suite finished');
    })



    /*
     * @tc.number: SUB_SENDABLE_MAP_0100
     * @tc.name: testSendableMap0001
     * @tc.desc: Verify initialize succeeds with valid capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0001', 0, (done: Function) => {
      runCase('testSendableMap0001', async (): Promise<void> => {
        const result: string = manager.initialize(64);
        addLog('testSendableMap0001: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0200
     * @tc.name: testSendableMap0002
     * @tc.desc: Verify initialize fails with zero capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0002', 0, (done: Function) => {
      runCase('testSendableMap0002', async (): Promise<void> => {
        const result: string = manager.initialize(0);
        addLog('testSendableMap0002: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0300
     * @tc.name: testSendableMap0003
     * @tc.desc: Verify initialize fails with negative capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0003', 0, (done: Function) => {
      runCase('testSendableMap0003', async (): Promise<void> => {
        const result: string = manager.initialize(-10);
        addLog('testSendableMap0003: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_0400
     * @tc.name: testSendableMap0004
     * @tc.desc: Verify putString and get work for a single entry.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0004', 0, (done: Function) => {
      runCase('testSendableMap0004', async (): Promise<void> => {
        manager.initialize(64);
        const putResult: string = manager.putString('name', 'Alice');
        const getResult: string = manager.get('name');
        addLog('testSendableMap0004: put=%{public}s, get=%{public}s', putResult, getResult);
        expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('Alice')).assertLargerOrEqual(0);
        expect(manager.getSize()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0500
     * @tc.name: testSendableMap0005
     * @tc.desc: Verify putString updates existing key value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0005', 0, (done: Function) => {
      runCase('testSendableMap0005', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('key', 'old_value');
        const updateResult: string = manager.putString('key', 'new_value');
        const getValue: string = manager.getValue('key');
        addLog('testSendableMap0005: update=%{public}s, value=%{public}s', updateResult, getValue);
        expect(updateResult.indexOf('updated')).assertLargerOrEqual(0);
        expect(getValue).assertEqual('new_value');
        expect(manager.getSize()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0600
     * @tc.name: testSendableMap0006
     * @tc.desc: Verify putString fails with empty key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0006', 0, (done: Function) => {
      runCase('testSendableMap0006', async (): Promise<void> => {
        manager.initialize(64);
        const result: string = manager.putString('', 'value');
        addLog('testSendableMap0006: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0700
     * @tc.name: testSendableMap0007
     * @tc.desc: Verify get returns not found for non-existing key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0007', 0, (done: Function) => {
      runCase('testSendableMap0007', async (): Promise<void> => {
        manager.initialize(64);
        const result: string = manager.get('nonexistent');
        addLog('testSendableMap0007: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_0800
     * @tc.name: testSendableMap0008
     * @tc.desc: Verify putNumber stores number value correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0008', 0, (done: Function) => {
      runCase('testSendableMap0008', async (): Promise<void> => {
        manager.initialize(64);
        const result: string = manager.putNumber('age', 25);
        const value: string = manager.getValue('age');
        addLog('testSendableMap0008: result=%{public}s, value=%{public}s', result, value);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(value).assertEqual('25');
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_0900
     * @tc.name: testSendableMap0009
     * @tc.desc: Verify putNumber fails with NaN value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0009', 0, (done: Function) => {
      runCase('testSendableMap0009', async (): Promise<void> => {
        manager.initialize(64);
        const result: string = manager.putNumber('val', NaN);
        addLog('testSendableMap0009: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1000
     * @tc.name: testSendableMap0010
     * @tc.desc: Verify putBoolean stores boolean value correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0010', 0, (done: Function) => {
      runCase('testSendableMap0010', async (): Promise<void> => {
        manager.initialize(64);
        const result: string = manager.putBoolean('active', true);
        const value: string = manager.getValue('active');
        addLog('testSendableMap0010: result=%{public}s, value=%{public}s', result, value);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(value).assertEqual('true');
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_1100
     * @tc.name: testSendableMap0011
     * @tc.desc: Verify remove deletes an existing key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0011', 0, (done: Function) => {
      runCase('testSendableMap0011', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('key1', 'value1');
        const result: string = manager.remove('key1');
        addLog('testSendableMap0011: result=%{public}s, size=%{public}d', result, String(manager.getSize()));
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getSize()).assertEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1200
     * @tc.name: testSendableMap0012
     * @tc.desc: Verify has returns correct existence status.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0012', 0, (done: Function) => {
      runCase('testSendableMap0012', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('exists', 'yes');
        const hasResult: string = manager.has('exists');
        const notHasResult: string = manager.has('missing');
        addLog('testSendableMap0012: has=%{public}s, notHas=%{public}s', hasResult, notHasResult);
        expect(hasResult.indexOf('true')).assertLargerOrEqual(0);
        expect(notHasResult.indexOf('false')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1300
     * @tc.name: testSendableMap0013
     * @tc.desc: Verify hasKey returns boolean correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0013', 0, (done: Function) => {
      runCase('testSendableMap0013', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('mykey', 'val');
        const exists: boolean = manager.hasKey('mykey');
        const notExists: boolean = manager.hasKey('nokey');
        addLog('testSendableMap0013: exists=%{public}s, notExists=%{public}s', String(exists), String(notExists));
        expect(exists).assertTrue();
        expect(notExists).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_1400
     * @tc.name: testSendableMap0014
     * @tc.desc: Verify putAll inserts multiple entries at once.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0014', 0, (done: Function) => {
      runCase('testSendableMap0014', async (): Promise<void> => {
        manager.initialize(64);
        const entries: MapEntry[] = [
          { key: 'a', value: '1', dataType: DataType.STRING, updatedAt: 0 },
          { key: 'b', value: '2', dataType: DataType.STRING, updatedAt: 0 },
          { key: 'c', value: '3', dataType: DataType.STRING, updatedAt: 0 }
        ];
        const result: string = manager.putAll(entries);
        addLog('testSendableMap0014: result=%{public}s', result);
        expect(result.indexOf('3/3')).assertLargerOrEqual(0);
        expect(manager.getSize()).assertEqual(3);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1500
     * @tc.name: testSendableMap0015
     * @tc.desc: Verify getAll retrieves values for multiple keys.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0015', 0, (done: Function) => {
      runCase('testSendableMap0015', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('x', '10');
        manager.putString('y', '20');
        const keys: string[] = ['x', 'y', 'z'];
        const result: string = manager.getAll(keys);
        addLog('testSendableMap0015: result=%{public}s', result);
        expect(result.indexOf('x=10')).assertLargerOrEqual(0);
        expect(result.indexOf('y=20')).assertLargerOrEqual(0);
        expect(result.indexOf('z=NOT_FOUND')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1600
     * @tc.name: testSendableMap0016
     * @tc.desc: Verify removeAll deletes multiple keys at once.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0016', 0, (done: Function) => {
      runCase('testSendableMap0016', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('a', '1');
        manager.putString('b', '2');
        manager.putString('c', '3');
        const keys: string[] = ['a', 'c'];
        const result: string = manager.removeAll(keys);
        addLog('testSendableMap0016: result=%{public}s, size=%{public}d', result, String(manager.getSize()));
        expect(result.indexOf('2/2')).assertLargerOrEqual(0);
        expect(manager.getSize()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_1700
     * @tc.name: testSendableMap0017
     * @tc.desc: Verify allKeys returns all stored keys.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0017', 0, (done: Function) => {
      runCase('testSendableMap0017', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('k1', 'v1');
        manager.putString('k2', 'v2');
        const result: string = manager.allKeys();
        addLog('testSendableMap0017: result=%{public}s', result);
        expect(result.indexOf('k1')).assertLargerOrEqual(0);
        expect(result.indexOf('k2')).assertLargerOrEqual(0);
        expect(result.indexOf('2 keys')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1800
     * @tc.name: testSendableMap0018
     * @tc.desc: Verify allValues returns all stored values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0018', 0, (done: Function) => {
      runCase('testSendableMap0018', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('k1', 'v1');
        manager.putString('k2', 'v2');
        const result: string = manager.allValues();
        addLog('testSendableMap0018: result=%{public}s', result);
        expect(result.indexOf('v1')).assertLargerOrEqual(0);
        expect(result.indexOf('v2')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_1900
     * @tc.name: testSendableMap0019
     * @tc.desc: Verify allEntries returns all key-value-type entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0019', 0, (done: Function) => {
      runCase('testSendableMap0019', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('name', 'Bob');
        manager.putNumber('age', 30);
        const result: string = manager.allEntries();
        addLog('testSendableMap0019: result=%{public}s', result);
        expect(result.indexOf('name')).assertLargerOrEqual(0);
        expect(result.indexOf('Bob')).assertLargerOrEqual(0);
        expect(result.indexOf('age')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_2000
     * @tc.name: testSendableMap0020
     * @tc.desc: Verify filterByType returns entries matching given type.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0020', 0, (done: Function) => {
      runCase('testSendableMap0020', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('s1', 'hello');
        manager.putNumber('n1', 42);
        manager.putString('s2', 'world');
        const result: string = manager.filterByType(DataType.STRING);
        addLog('testSendableMap0020: result=%{public}s', result);
        expect(result.indexOf('2 matches')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(3);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_2100
     * @tc.name: testSendableMap0021
     * @tc.desc: Verify filterByKeyPrefix returns entries with matching prefix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0021', 0, (done: Function) => {
      runCase('testSendableMap0021', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('user_name', 'Alice');
        manager.putString('user_age', '25');
        manager.putString('config_theme', 'dark');
        const result: string = manager.filterByKeyPrefix('user');
        addLog('testSendableMap0021: result=%{public}s', result);
        expect(result.indexOf('2 matches')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getSize()).assertEqual(3);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_2200
     * @tc.name: testSendableMap0022
     * @tc.desc: Verify toJSONObject returns correct JSON representation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0022', 0, (done: Function) => {
      runCase('testSendableMap0022', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('key1', 'val1');
        const json: string = manager.toJSONObject();
        addLog('testSendableMap0022: json=%{public}s', json);
        expect(json.indexOf('key1')).assertLargerOrEqual(0);
        expect(json.indexOf('val1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_2300
     * @tc.name: testSendableMap0023
     * @tc.desc: Verify toJSONTyped includes type information.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableMap0023', 0, (done: Function) => {
      runCase('testSendableMap0023', async (): Promise<void> => {
        manager.initialize(64);
        manager.putNumber('count', 99);
        const json: string = manager.toJSONTyped();
        addLog('testSendableMap0023: json=%{public}s', json);
        expect(json.indexOf('count')).assertLargerOrEqual(0);
        expect(json.indexOf('number')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_MAP_2400
     * @tc.name: testSendableMap0024
     * @tc.desc: Verify getStatistics and resetStatistics work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0024', 0, (done: Function) => {
      runCase('testSendableMap0024', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('a', '1');
        manager.get('a');
        const stats: string = manager.getStatistics();
        addLog('testSendableMap0024: stats=%{public}s', stats);
        expect(stats.indexOf('reads=')).assertLargerOrEqual(0);
        expect(stats.indexOf('writes=')).assertLargerOrEqual(0);
        const resetResult: string = manager.resetStatistics();
        expect(resetResult.indexOf('reset')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_2500
     * @tc.name: testSendableMap0025
     * @tc.desc: Verify clear removes all entries from the map.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0025', 0, (done: Function) => {
      runCase('testSendableMap0025', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('a', '1');
        manager.putString('b', '2');
        const result: string = manager.clear();
        addLog('testSendableMap0025: result=%{public}s, size=%{public}d', result, String(manager.getSize()));
        expect(result.indexOf('cleared')).assertLargerOrEqual(0);
        expect(manager.getSize()).assertEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_MAP_2600
     * @tc.name: testSendableMap0026
     * @tc.desc: Verify getKeysArray and getValuesArray return correct arrays.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableMap0026', 0, (done: Function) => {
      runCase('testSendableMap0026', async (): Promise<void> => {
        manager.initialize(64);
        manager.putString('k1', 'v1');
        manager.putString('k2', 'v2');
        const keys: string[] = manager.getKeysArray();
        const values: string[] = manager.getValuesArray();
        addLog('testSendableMap0026: keys=%{public}s, values=%{public}s',
          JSON.stringify(keys), JSON.stringify(values));
        expect(keys.length).assertEqual(2);
        expect(values.length).assertEqual(2);
        expect(keys[0]).assertEqual('k1');
        expect(values[0]).assertEqual('v1');
      }, done);
    });
  });
}
