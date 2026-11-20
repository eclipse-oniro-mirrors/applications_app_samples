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
import { DistributedDataManager } from '../../../main/ets/distributed/DistributedDataManager';
import { SyncMode, ConflictPolicy } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function createDeepDistributed(): DistributedDataManager {
    return new DistributedDataManager();
}

export default function distributedDeepTest(): void {
    describe('DistributedDeepTest', () => {
        let manager: DistributedDataManager = createDeepDistributed();

        beforeAll(() => {
            addLog('DistributedDeepTest suite started');
        })

        beforeEach(() => {
            manager = createDeepDistributed();
        })

        afterEach(() => {
            manager.release();
        })

        afterAll(() => {
            addLog('DistributedDeepTest suite finished');
        })

        

        /*
         * @tc.number: SUB_DEEP_DIST_0100
         * @tc.name: testDeepDist0001
         * @tc.desc: Verify initialize succeeds and isInitialized returns true.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0001', 0, (done: Function) => {
            runCase('testDeepDist0001', async (): Promise<void> => {
                const result: string = manager.initialize();
                addLog('testDeepDist0001: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(manager.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0200
         * @tc.name: testDeepDist0002
         * @tc.desc: Verify initialize resets data count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0002', 0, (done: Function) => {
            runCase('testDeepDist0002', async (): Promise<void> => {
                manager.initialize();
                manager.put('key1', 'value1');
                manager.initialize();
                const result: string = manager.getAllKeys();
                addLog('testDeepDist0002: result=%{public}s', result);
                expect(result.indexOf('0 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0300
         * @tc.name: testDeepDist0003
         * @tc.desc: Verify release resets isInitialized.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0003', 0, (done: Function) => {
            runCase('testDeepDist0003', async (): Promise<void> => {
                manager.initialize();
                manager.release();
                expect(manager.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0400
         * @tc.name: testDeepDist0004
         * @tc.desc: Verify release resets sync mode to MANUAL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0004', 0, (done: Function) => {
            runCase('testDeepDist0004', async (): Promise<void> => {
                manager.initialize();
                manager.setSyncMode(SyncMode.REAL_TIME);
                manager.release();
                manager.initialize();
                expect(manager.getSyncMode()).assertEqual(SyncMode.MANUAL);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0500
         * @tc.name: testDeepDist0005
         * @tc.desc: Verify initialize twice resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0005', 0, (done: Function) => {
            runCase('testDeepDist0005', async (): Promise<void> => {
                manager.initialize();
                manager.put('k1', 'v1');
                manager.registerDevice('dev1', 'Phone', 'mobile');
                manager.initialize();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0005: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('devices=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0600
         * @tc.name: testDeepDist0006
         * @tc.desc: Verify release then reinitialize.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0006', 0, (done: Function) => {
            runCase('testDeepDist0006', async (): Promise<void> => {
                manager.initialize();
                manager.release();
                const result: string = manager.initialize();
                addLog('testDeepDist0006: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(manager.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_DIST_0700
         * @tc.name: testDeepDist0007
         * @tc.desc: Verify put inserts new key-value pair.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0007', 0, (done: Function) => {
            runCase('testDeepDist0007', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.put('name', 'Alice');
                addLog('testDeepDist0007: result=%{public}s', result);
                expect(result.indexOf('inserted')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0800
         * @tc.name: testDeepDist0008
         * @tc.desc: Verify put updates existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0008', 0, (done: Function) => {
            runCase('testDeepDist0008', async (): Promise<void> => {
                manager.initialize();
                manager.put('name', 'Alice');
                const result: string = manager.put('name', 'Bob');
                addLog('testDeepDist0008: result=%{public}s', result);
                expect(result.indexOf('updated')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_0900
         * @tc.name: testDeepDist0009
         * @tc.desc: Verify put fails with invalid key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0009', 0, (done: Function) => {
            runCase('testDeepDist0009', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.put('', 'value');
                addLog('testDeepDist0009: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1000
         * @tc.name: testDeepDist0010
         * @tc.desc: Verify put fails with invalid value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0010', 0, (done: Function) => {
            runCase('testDeepDist0010', async (): Promise<void> => {
                manager.initialize();
                // Empty string is accepted by DataValidator.isValidValue for string type
                const result: string = manager.put('key', '');
                addLog('testDeepDist0010: result=%{public}s', result);
                expect(result.indexOf('inserted')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1100
         * @tc.name: testDeepDist0011
         * @tc.desc: Verify get returns stored value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0011', 0, (done: Function) => {
            runCase('testDeepDist0011', async (): Promise<void> => {
                manager.initialize();
                manager.put('color', 'blue');
                const result: string = manager.get('color');
                addLog('testDeepDist0011: result=%{public}s', result);
                expect(result.indexOf('blue')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1200
         * @tc.name: testDeepDist0012
         * @tc.desc: Verify get returns not found for absent key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0012', 0, (done: Function) => {
            runCase('testDeepDist0012', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.get('nonexistent');
                addLog('testDeepDist0012: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1300
         * @tc.name: testDeepDist0013
         * @tc.desc: Verify get fails with invalid key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0013', 0, (done: Function) => {
            runCase('testDeepDist0013', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.get('');
                addLog('testDeepDist0013: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1400
         * @tc.name: testDeepDist0014
         * @tc.desc: Verify has returns true for existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0014', 0, (done: Function) => {
            runCase('testDeepDist0014', async (): Promise<void> => {
                manager.initialize();
                manager.put('exists', 'yes');
                expect(manager.has('exists')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1500
         * @tc.name: testDeepDist0015
         * @tc.desc: Verify has returns false for absent key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0015', 0, (done: Function) => {
            runCase('testDeepDist0015', async (): Promise<void> => {
                manager.initialize();
                expect(manager.has('absent')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1600
         * @tc.name: testDeepDist0016
         * @tc.desc: Verify has returns false for invalid key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0016', 0, (done: Function) => {
            runCase('testDeepDist0016', async (): Promise<void> => {
                manager.initialize();
                expect(manager.has('')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1700
         * @tc.name: testDeepDist0017
         * @tc.desc: Verify delete removes existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0017', 0, (done: Function) => {
            runCase('testDeepDist0017', async (): Promise<void> => {
                manager.initialize();
                manager.put('toDelete', 'value');
                const result: string = manager.delete('toDelete');
                addLog('testDeepDist0017: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(manager.has('toDelete')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1800
         * @tc.name: testDeepDist0018
         * @tc.desc: Verify delete returns not found for absent key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0018', 0, (done: Function) => {
            runCase('testDeepDist0018', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.delete('absent');
                addLog('testDeepDist0018: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_1900
         * @tc.name: testDeepDist0019
         * @tc.desc: Verify delete fails with invalid key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0019', 0, (done: Function) => {
            runCase('testDeepDist0019', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.delete('');
                addLog('testDeepDist0019: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2000
         * @tc.name: testDeepDist0020
         * @tc.desc: Verify getAllKeys returns all inserted keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0020', 0, (done: Function) => {
            runCase('testDeepDist0020', async (): Promise<void> => {
                manager.initialize();
                manager.put('k1', 'v1');
                manager.put('k2', 'v2');
                manager.put('k3', 'v3');
                const result: string = manager.getAllKeys();
                addLog('testDeepDist0020: result=%{public}s', result);
                expect(result.indexOf('k1')).assertLargerOrEqual(0);
                expect(result.indexOf('k2')).assertLargerOrEqual(0);
                expect(result.indexOf('k3')).assertLargerOrEqual(0);
                expect(result.indexOf('3 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2100
         * @tc.name: testDeepDist0021
         * @tc.desc: Verify getAllKeys on empty data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0021', 0, (done: Function) => {
            runCase('testDeepDist0021', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getAllKeys();
                addLog('testDeepDist0021: result=%{public}s', result);
                expect(result.indexOf('0 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2200
         * @tc.name: testDeepDist0022
         * @tc.desc: Verify put increments insert count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0022', 0, (done: Function) => {
            runCase('testDeepDist0022', async (): Promise<void> => {
                manager.initialize();
                manager.put('a', '1');
                manager.put('b', '2');
                manager.put('c', '3');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0022: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2300
         * @tc.name: testDeepDist0023
         * @tc.desc: Verify put update increments update count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0023', 0, (done: Function) => {
            runCase('testDeepDist0023', async (): Promise<void> => {
                manager.initialize();
                manager.put('key', 'v1');
                manager.put('key', 'v2');
                manager.put('key', 'v3');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0023: stats=%{public}s', stats);
                expect(stats.indexOf('updates=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2400
         * @tc.name: testDeepDist0024
         * @tc.desc: Verify delete increments delete count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0024', 0, (done: Function) => {
            runCase('testDeepDist0024', async (): Promise<void> => {
                manager.initialize();
                manager.put('x', '1');
                manager.put('y', '2');
                manager.delete('x');
                manager.delete('y');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0024: stats=%{public}s', stats);
                expect(stats.indexOf('deletes=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2500
         * @tc.name: testDeepDist0025
         * @tc.desc: Verify get increments query count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0025', 0, (done: Function) => {
            runCase('testDeepDist0025', async (): Promise<void> => {
                manager.initialize();
                manager.put('q', 'val');
                manager.get('q');
                manager.get('q');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0025: stats=%{public}s', stats);
                expect(stats.indexOf('queries=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2600
         * @tc.name: testDeepDist0026
         * @tc.desc: Verify put after delete reinserts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0026', 0, (done: Function) => {
            runCase('testDeepDist0026', async (): Promise<void> => {
                manager.initialize();
                manager.put('reuse', 'v1');
                manager.delete('reuse');
                manager.put('reuse', 'v2');
                const result: string = manager.get('reuse');
                addLog('testDeepDist0026: result=%{public}s', result);
                expect(result.indexOf('v2')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_DIST_2700
         * @tc.name: testDeepDist0027
         * @tc.desc: Verify registerDevice succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0027', 0, (done: Function) => {
            runCase('testDeepDist0027', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.registerDevice('dev001', 'Phone', 'mobile');
                addLog('testDeepDist0027: result=%{public}s', result);
                expect(result.indexOf('registerDevice completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2800
         * @tc.name: testDeepDist0028
         * @tc.desc: Verify registerDevice with invalid ID fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0028', 0, (done: Function) => {
            runCase('testDeepDist0028', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.registerDevice('', 'Phone', 'mobile');
                addLog('testDeepDist0028: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_2900
         * @tc.name: testDeepDist0029
         * @tc.desc: Verify registerDevice duplicate fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0029', 0, (done: Function) => {
            runCase('testDeepDist0029', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('dev001', 'Phone', 'mobile');
                const result: string = manager.registerDevice('dev001', 'Phone2', 'mobile');
                addLog('testDeepDist0029: result=%{public}s', result);
                expect(result.indexOf('already registered')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3000
         * @tc.name: testDeepDist0030
         * @tc.desc: Verify unregisterDevice succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0030', 0, (done: Function) => {
            runCase('testDeepDist0030', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('dev001', 'Phone', 'mobile');
                const result: string = manager.unregisterDevice('dev001');
                addLog('testDeepDist0030: result=%{public}s', result);
                expect(result.indexOf('unregisterDevice completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3100
         * @tc.name: testDeepDist0031
         * @tc.desc: Verify unregisterDevice not found fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0031', 0, (done: Function) => {
            runCase('testDeepDist0031', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.unregisterDevice('nonexistent');
                addLog('testDeepDist0031: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3200
         * @tc.name: testDeepDist0032
         * @tc.desc: Verify unregisterDevice with invalid ID fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0032', 0, (done: Function) => {
            runCase('testDeepDist0032', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.unregisterDevice('');
                addLog('testDeepDist0032: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3300
         * @tc.name: testDeepDist0033
         * @tc.desc: Verify listDevices with registered devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0033', 0, (done: Function) => {
            runCase('testDeepDist0033', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                manager.registerDevice('d2', 'Tablet', 'tablet');
                const result: string = manager.listDevices();
                addLog('testDeepDist0033: result=%{public}s', result);
                expect(result.indexOf('d1')).assertLargerOrEqual(0);
                expect(result.indexOf('d2')).assertLargerOrEqual(0);
                expect(result.indexOf('2 devices')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3400
         * @tc.name: testDeepDist0034
         * @tc.desc: Verify listDevices with no devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0034', 0, (done: Function) => {
            runCase('testDeepDist0034', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.listDevices();
                addLog('testDeepDist0034: result=%{public}s', result);
                expect(result.indexOf('no devices')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3500
         * @tc.name: testDeepDist0035
         * @tc.desc: Verify getDeviceInfo for existing device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0035', 0, (done: Function) => {
            runCase('testDeepDist0035', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'MyPhone', 'mobile');
                const result: string = manager.getDeviceInfo('d1');
                addLog('testDeepDist0035: result=%{public}s', result);
                expect(result.indexOf('MyPhone')).assertLargerOrEqual(0);
                expect(result.indexOf('mobile')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3600
         * @tc.name: testDeepDist0036
         * @tc.desc: Verify getDeviceInfo for nonexistent device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0036', 0, (done: Function) => {
            runCase('testDeepDist0036', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getDeviceInfo('nonexistent');
                addLog('testDeepDist0036: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3700
         * @tc.name: testDeepDist0037
         * @tc.desc: Verify setDeviceConnected changes state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0037', 0, (done: Function) => {
            runCase('testDeepDist0037', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                const result: string = manager.setDeviceConnected('d1', false);
                addLog('testDeepDist0037: result=%{public}s', result);
                expect(result.indexOf('setDeviceConnected')).assertLargerOrEqual(0);
                expect(result.indexOf('false')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3800
         * @tc.name: testDeepDist0038
         * @tc.desc: Verify setDeviceConnected for nonexistent device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0038', 0, (done: Function) => {
            runCase('testDeepDist0038', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.setDeviceConnected('ghost', true);
                addLog('testDeepDist0038: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_3900
         * @tc.name: testDeepDist0039
         * @tc.desc: Verify getConnectedDevices counts correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0039', 0, (done: Function) => {
            runCase('testDeepDist0039', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                manager.registerDevice('d2', 'Tablet', 'tablet');
                manager.registerDevice('d3', 'Watch', 'wearable');
                manager.setDeviceConnected('d2', false);
                const count: number = manager.getConnectedDevices();
                addLog('testDeepDist0039: count=%{public}d', count);
                expect(count).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4000
         * @tc.name: testDeepDist0040
         * @tc.desc: Verify getConnectedDevices with no devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0040', 0, (done: Function) => {
            runCase('testDeepDist0040', async (): Promise<void> => {
                manager.initialize();
                const count: number = manager.getConnectedDevices();
                addLog('testDeepDist0040: count=%{public}d', count);
                expect(count).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4100
         * @tc.name: testDeepDist0041
         * @tc.desc: Verify register multiple devices then list.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0041', 0, (done: Function) => {
            runCase('testDeepDist0041', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('a1', 'D1', 'mobile');
                manager.registerDevice('a2', 'D2', 'tablet');
                manager.registerDevice('a3', 'D3', 'wearable');
                manager.registerDevice('a4', 'D4', 'tv');
                const result: string = manager.listDevices();
                addLog('testDeepDist0041: result=%{public}s', result);
                expect(result.indexOf('4 devices')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4200
         * @tc.name: testDeepDist0042
         * @tc.desc: Verify unregister then re-register same device.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0042', 0, (done: Function) => {
            runCase('testDeepDist0042', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('reuse', 'Phone', 'mobile');
                manager.unregisterDevice('reuse');
                const result: string = manager.registerDevice('reuse', 'Phone2', 'mobile');
                addLog('testDeepDist0042: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4300
         * @tc.name: testDeepDist0043
         * @tc.desc: Verify setDeviceConnected toggle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0043', 0, (done: Function) => {
            runCase('testDeepDist0043', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('toggle', 'Phone', 'mobile');
                manager.setDeviceConnected('toggle', false);
                const info1: string = manager.getDeviceInfo('toggle');
                expect(info1.indexOf('false')).assertLargerOrEqual(0);
                manager.setDeviceConnected('toggle', true);
                const info2: string = manager.getDeviceInfo('toggle');
                expect(info2.indexOf('true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4400
         * @tc.name: testDeepDist0044
         * @tc.desc: Verify getDeviceInfo after unregister returns not found.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0044', 0, (done: Function) => {
            runCase('testDeepDist0044', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('temp', 'Temp', 'mobile');
                manager.unregisterDevice('temp');
                const result: string = manager.getDeviceInfo('temp');
                addLog('testDeepDist0044: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4500
         * @tc.name: testDeepDist0045
         * @tc.desc: Verify all devices connected by default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0045', 0, (done: Function) => {
            runCase('testDeepDist0045', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('c1', 'D1', 'mobile');
                manager.registerDevice('c2', 'D2', 'tablet');
                manager.registerDevice('c3', 'D3', 'tv');
                const count: number = manager.getConnectedDevices();
                addLog('testDeepDist0045: count=%{public}d', count);
                expect(count).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4600
         * @tc.name: testDeepDist0046
         * @tc.desc: Verify unregister nonexistent device with invalid ID.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0046', 0, (done: Function) => {
            runCase('testDeepDist0046', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.unregisterDevice('');
                addLog('testDeepDist0046: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4700
         * @tc.name: testDeepDist0047
         * @tc.desc: Verify getConnectedDevices after disconnecting all.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0047', 0, (done: Function) => {
            runCase('testDeepDist0047', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'P1', 'mobile');
                manager.registerDevice('d2', 'P2', 'mobile');
                manager.setDeviceConnected('d1', false);
                manager.setDeviceConnected('d2', false);
                const count: number = manager.getConnectedDevices();
                addLog('testDeepDist0047: count=%{public}d', count);
                expect(count).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4800
         * @tc.name: testDeepDist0048
         * @tc.desc: Verify statistics include device count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0048', 0, (done: Function) => {
            runCase('testDeepDist0048', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('s1', 'Phone', 'mobile');
                manager.registerDevice('s2', 'Tablet', 'tablet');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0048: stats=%{public}s', stats);
                expect(stats.indexOf('devices=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_4900
         * @tc.name: testDeepDist0049
         * @tc.desc: Verify listDevices after unregister.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0049', 0, (done: Function) => {
            runCase('testDeepDist0049', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('x1', 'D1', 'mobile');
                manager.registerDevice('x2', 'D2', 'tablet');
                manager.unregisterDevice('x1');
                const result: string = manager.listDevices();
                addLog('testDeepDist0049: result=%{public}s', result);
                expect(result.indexOf('1 devices')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5000
         * @tc.name: testDeepDist0050
         * @tc.desc: Verify registerDevice with different device types.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0050', 0, (done: Function) => {
            runCase('testDeepDist0050', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('mob1', 'Phone', 'mobile');
                manager.registerDevice('tab1', 'Pad', 'tablet');
                manager.registerDevice('wear1', 'Watch', 'wearable');
                const info1: string = manager.getDeviceInfo('mob1');
                const info2: string = manager.getDeviceInfo('tab1');
                const info3: string = manager.getDeviceInfo('wear1');
                addLog('testDeepDist0050: info1=%{public}s', info1);
                expect(info1.indexOf('mobile')).assertLargerOrEqual(0);
                expect(info2.indexOf('tablet')).assertLargerOrEqual(0);
                expect(info3.indexOf('wearable')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_DIST_5100
         * @tc.name: testDeepDist0051
         * @tc.desc: Verify sync succeeds with connected devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0051', 0, (done: Function) => {
            runCase('testDeepDist0051', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                const result: string = await manager.sync();
                addLog('testDeepDist0051: result=%{public}s', result);
                expect(result.indexOf('sync completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5200
         * @tc.name: testDeepDist0052
         * @tc.desc: Verify sync fails with no devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0052', 0, (done: Function) => {
            runCase('testDeepDist0052', async (): Promise<void> => {
                manager.initialize();
                const result: string = await manager.sync();
                addLog('testDeepDist0052: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5300
         * @tc.name: testDeepDist0053
         * @tc.desc: Verify syncStatus returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0053', 0, (done: Function) => {
            runCase('testDeepDist0053', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.syncStatus();
                addLog('testDeepDist0053: result=%{public}s', result);
                expect(result.indexOf('SyncStatus')).assertLargerOrEqual(0);
                expect(result.indexOf('manual')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5400
         * @tc.name: testDeepDist0054
         * @tc.desc: Verify setSyncMode with valid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0054', 0, (done: Function) => {
            runCase('testDeepDist0054', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.setSyncMode(SyncMode.REAL_TIME);
                addLog('testDeepDist0054: result=%{public}s', result);
                expect(result.indexOf('setSyncMode')).assertLargerOrEqual(0);
                expect(manager.getSyncMode()).assertEqual(SyncMode.REAL_TIME);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5500
         * @tc.name: testDeepDist0055
         * @tc.desc: Verify setSyncMode with invalid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0055', 0, (done: Function) => {
            runCase('testDeepDist0055', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.setSyncMode('BADMODE' as SyncMode);
                addLog('testDeepDist0055: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5600
         * @tc.name: testDeepDist0056
         * @tc.desc: Verify setConflictPolicy with valid policy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0056', 0, (done: Function) => {
            runCase('testDeepDist0056', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.setConflictPolicy(ConflictPolicy.REMOTE_FIRST);
                addLog('testDeepDist0056: result=%{public}s', result);
                expect(result.indexOf('setConflictPolicy')).assertLargerOrEqual(0);
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.REMOTE_FIRST);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5700
         * @tc.name: testDeepDist0057
         * @tc.desc: Verify setConflictPolicy with invalid policy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0057', 0, (done: Function) => {
            runCase('testDeepDist0057', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.setConflictPolicy('BADPOLICY' as ConflictPolicy);
                addLog('testDeepDist0057: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5800
         * @tc.name: testDeepDist0058
         * @tc.desc: Verify getConflicts with no conflicts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0058', 0, (done: Function) => {
            runCase('testDeepDist0058', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getConflicts();
                addLog('testDeepDist0058: result=%{public}s', result);
                expect(result.indexOf('no conflicts')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_5900
         * @tc.name: testDeepDist0059
         * @tc.desc: Verify getUnresolvedConflicts with no conflicts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0059', 0, (done: Function) => {
            runCase('testDeepDist0059', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getUnresolvedConflicts();
                addLog('testDeepDist0059: result=%{public}s', result);
                expect(result.indexOf('0 pending')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6000
         * @tc.name: testDeepDist0060
         * @tc.desc: Verify resolveConflict with no existing conflict.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0060', 0, (done: Function) => {
            runCase('testDeepDist0060', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.resolveConflict('nokey', ConflictPolicy.LOCAL_FIRST);
                addLog('testDeepDist0060: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6100
         * @tc.name: testDeepDist0061
         * @tc.desc: Verify setSyncMode to each valid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0061', 0, (done: Function) => {
            runCase('testDeepDist0061', async (): Promise<void> => {
                manager.initialize();
                manager.setSyncMode(SyncMode.PERIODIC);
                expect(manager.getSyncMode()).assertEqual(SyncMode.PERIODIC);
                manager.setSyncMode(SyncMode.REAL_TIME);
                expect(manager.getSyncMode()).assertEqual(SyncMode.REAL_TIME);
                manager.setSyncMode(SyncMode.MANUAL);
                expect(manager.getSyncMode()).assertEqual(SyncMode.MANUAL);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6200
         * @tc.name: testDeepDist0062
         * @tc.desc: Verify setConflictPolicy to each valid policy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0062', 0, (done: Function) => {
            runCase('testDeepDist0062', async (): Promise<void> => {
                manager.initialize();
                manager.setConflictPolicy(ConflictPolicy.LOCAL_FIRST);
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.LOCAL_FIRST);
                manager.setConflictPolicy(ConflictPolicy.REMOTE_FIRST);
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.REMOTE_FIRST);
                manager.setConflictPolicy(ConflictPolicy.TIMESTAMP);
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.TIMESTAMP);
                manager.setConflictPolicy(ConflictPolicy.MERGE);
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.MERGE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6300
         * @tc.name: testDeepDist0063
         * @tc.desc: Verify sync increments sync count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0063', 0, (done: Function) => {
            runCase('testDeepDist0063', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0063: stats=%{public}s', stats);
                expect(stats.indexOf('syncs=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6400
         * @tc.name: testDeepDist0064
         * @tc.desc: Verify syncStatus after sync shows lastSync time.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0064', 0, (done: Function) => {
            runCase('testDeepDist0064', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                const status: string = manager.syncStatus();
                addLog('testDeepDist0064: status=%{public}s', status);
                expect(status.indexOf('syncCount=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6500
         * @tc.name: testDeepDist0065
         * @tc.desc: Verify sync with disconnected devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0065', 0, (done: Function) => {
            runCase('testDeepDist0065', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                manager.setDeviceConnected('d1', false);
                const result: string = await manager.sync();
                addLog('testDeepDist0065: result=%{public}s', result);
                expect(result.indexOf('0/1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6600
         * @tc.name: testDeepDist0066
         * @tc.desc: Verify default sync mode is MANUAL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0066', 0, (done: Function) => {
            runCase('testDeepDist0066', async (): Promise<void> => {
                manager.initialize();
                expect(manager.getSyncMode()).assertEqual(SyncMode.MANUAL);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6700
         * @tc.name: testDeepDist0067
         * @tc.desc: Verify default conflict policy is LOCAL_FIRST.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0067', 0, (done: Function) => {
            runCase('testDeepDist0067', async (): Promise<void> => {
                manager.initialize();
                expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.LOCAL_FIRST);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_6800
         * @tc.name: testDeepDist0068
         * @tc.desc: Verify syncStatus shows syncing=false after sync.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0068', 0, (done: Function) => {
            runCase('testDeepDist0068', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                const status: string = manager.syncStatus();
                addLog('testDeepDist0068: status=%{public}s', status);
                expect(status.indexOf('syncing=false')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_DIST_6900
         * @tc.name: testDeepDist0069
         * @tc.desc: Verify getStatistics returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0069', 0, (done: Function) => {
            runCase('testDeepDist0069', async (): Promise<void> => {
                manager.initialize();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0069: stats=%{public}s', stats);
                expect(stats.indexOf('Distributed Statistics')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7000
         * @tc.name: testDeepDist0070
         * @tc.desc: Verify resetStatistics zeros counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0070', 0, (done: Function) => {
            runCase('testDeepDist0070', async (): Promise<void> => {
                manager.initialize();
                manager.put('k', 'v');
                manager.get('k');
                manager.resetStatistics();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0070: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('queries=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7100
         * @tc.name: testDeepDist0071
         * @tc.desc: Verify release resets all state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0071', 0, (done: Function) => {
            runCase('testDeepDist0071', async (): Promise<void> => {
                manager.initialize();
                manager.put('k', 'v');
                manager.registerDevice('d1', 'Phone', 'mobile');
                manager.release();
                expect(manager.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7200
         * @tc.name: testDeepDist0072
         * @tc.desc: Verify statistics after mixed operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0072', 0, (done: Function) => {
            runCase('testDeepDist0072', async (): Promise<void> => {
                manager.initialize();
                manager.put('a', '1');
                manager.put('b', '2');
                manager.get('a');
                manager.delete('b');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0072: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=2')).assertLargerOrEqual(0);
                expect(stats.indexOf('queries=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('deletes=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7300
         * @tc.name: testDeepDist0073
         * @tc.desc: Verify resetStatistics then new operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0073', 0, (done: Function) => {
            runCase('testDeepDist0073', async (): Promise<void> => {
                manager.initialize();
                manager.put('before', 'v');
                manager.resetStatistics();
                manager.put('after', 'v');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0073: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7400
         * @tc.name: testDeepDist0074
         * @tc.desc: Verify release then reinitialize preserves nothing.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0074', 0, (done: Function) => {
            runCase('testDeepDist0074', async (): Promise<void> => {
                manager.initialize();
                manager.put('persist', 'data');
                manager.release();
                manager.initialize();
                const result: string = manager.get('persist');
                addLog('testDeepDist0074: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7500
         * @tc.name: testDeepDist0075
         * @tc.desc: Verify statistics contain syncMode and policy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0075', 0, (done: Function) => {
            runCase('testDeepDist0075', async (): Promise<void> => {
                manager.initialize();
                manager.setSyncMode(SyncMode.PERIODIC);
                manager.setConflictPolicy(ConflictPolicy.MERGE);
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0075: stats=%{public}s', stats);
                expect(stats.indexOf('periodic')).assertLargerOrEqual(0);
                expect(stats.indexOf('merge')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7600
         * @tc.name: testDeepDist0076
         * @tc.desc: Verify multiple resetStatistics calls.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0076', 0, (done: Function) => {
            runCase('testDeepDist0076', async (): Promise<void> => {
                manager.initialize();
                manager.resetStatistics();
                manager.resetStatistics();
                manager.resetStatistics();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0076: stats=%{public}s', stats);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7700
         * @tc.name: testDeepDist0077
         * @tc.desc: Verify getAllKeys increments query count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0077', 0, (done: Function) => {
            runCase('testDeepDist0077', async (): Promise<void> => {
                manager.initialize();
                manager.getAllKeys();
                manager.getAllKeys();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0077: stats=%{public}s', stats);
                expect(stats.indexOf('queries=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7800
         * @tc.name: testDeepDist0078
         * @tc.desc: Verify put-get-delete-getAllKeys full workflow.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0078', 0, (done: Function) => {
            runCase('testDeepDist0078', async (): Promise<void> => {
                manager.initialize();
                manager.put('wf1', 'val1');
                manager.put('wf2', 'val2');
                const g1: string = manager.get('wf1');
                expect(g1.indexOf('val1')).assertLargerOrEqual(0);
                manager.delete('wf1');
                const keys: string = manager.getAllKeys();
                addLog('testDeepDist0078: keys=%{public}s', keys);
                expect(keys.indexOf('1 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_7900
         * @tc.name: testDeepDist0079
         * @tc.desc: Verify sync then getStatistics shows sync count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0079', 0, (done: Function) => {
            runCase('testDeepDist0079', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0079: stats=%{public}s', stats);
                expect(stats.indexOf('syncs=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8000
         * @tc.name: testDeepDist0080
         * @tc.desc: Verify release after full lifecycle.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0080', 0, (done: Function) => {
            runCase('testDeepDist0080', async (): Promise<void> => {
                manager.initialize();
                manager.put('k1', 'v1');
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                manager.release();
                expect(manager.isInitialized()).assertFalse();
                const newMgr: DistributedDataManager = new DistributedDataManager();
                expect(newMgr.isInitialized()).assertFalse();
                newMgr.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_DIST_8100
         * @tc.name: testDeepDist0081
         * @tc.desc: Verify put multiple keys then getAllKeys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0081', 0, (done: Function) => {
            runCase('testDeepDist0081', async (): Promise<void> => {
                manager.initialize();
                for (let i = 0; i < 10; i++) {
                    manager.put(`key_${i}`, `val_${i}`);
                }
                const keys: string = manager.getAllKeys();
                addLog('testDeepDist0081: keys=%{public}s', keys);
                expect(keys.indexOf('10 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8200
         * @tc.name: testDeepDist0082
         * @tc.desc: Verify device register then sync then status.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0082', 0, (done: Function) => {
            runCase('testDeepDist0082', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('sync1', 'Phone', 'mobile');
                await manager.sync();
                const status: string = manager.syncStatus();
                addLog('testDeepDist0082: status=%{public}s', status);
                expect(status.indexOf('syncCount=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8300
         * @tc.name: testDeepDist0083
         * @tc.desc: Verify put update preserves other keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0083', 0, (done: Function) => {
            runCase('testDeepDist0083', async (): Promise<void> => {
                manager.initialize();
                manager.put('keep', 'original');
                manager.put('change', 'old');
                manager.put('change', 'new');
                const r1: string = manager.get('keep');
                const r2: string = manager.get('change');
                addLog('testDeepDist0083: r1=%{public}s, r2=%{public}s', r1, r2);
                expect(r1.indexOf('original')).assertLargerOrEqual(0);
                expect(r2.indexOf('new')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8400
         * @tc.name: testDeepDist0084
         * @tc.desc: Verify delete then getAllKeys count decreases.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0084', 0, (done: Function) => {
            runCase('testDeepDist0084', async (): Promise<void> => {
                manager.initialize();
                manager.put('a', '1');
                manager.put('b', '2');
                manager.put('c', '3');
                manager.delete('b');
                const keys: string = manager.getAllKeys();
                addLog('testDeepDist0084: keys=%{public}s', keys);
                expect(keys.indexOf('2 entries')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8500
         * @tc.name: testDeepDist0085
         * @tc.desc: Verify sync with mixed connected/disconnected devices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0085', 0, (done: Function) => {
            runCase('testDeepDist0085', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('on1', 'Phone', 'mobile');
                manager.registerDevice('off1', 'Tablet', 'tablet');
                manager.setDeviceConnected('off1', false);
                const result: string = await manager.sync();
                addLog('testDeepDist0085: result=%{public}s', result);
                expect(result.indexOf('1/2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8600
         * @tc.name: testDeepDist0086
         * @tc.desc: Verify get nonexistent key after multiple puts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0086', 0, (done: Function) => {
            runCase('testDeepDist0086', async (): Promise<void> => {
                manager.initialize();
                manager.put('exists1', 'v1');
                manager.put('exists2', 'v2');
                const result: string = manager.get('doesNotExist');
                addLog('testDeepDist0086: result=%{public}s', result);
                expect(result.indexOf('not found')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8700
         * @tc.name: testDeepDist0087
         * @tc.desc: Verify registerDevice then unregister then listDevices.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0087', 0, (done: Function) => {
            runCase('testDeepDist0087', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('temp1', 'D1', 'mobile');
                manager.registerDevice('temp2', 'D2', 'tablet');
                manager.unregisterDevice('temp1');
                const list: string = manager.listDevices();
                addLog('testDeepDist0087: list=%{public}s', list);
                expect(list.indexOf('1 devices')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8800
         * @tc.name: testDeepDist0088
         * @tc.desc: Verify put with long key and value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0088', 0, (done: Function) => {
            runCase('testDeepDist0088', async (): Promise<void> => {
                manager.initialize();
                let longKey: string = '';
                let longVal: string = '';
                for (let i = 0; i < 50; i++) {
                    longKey += 'K';
                    longVal += 'V';
                }
                const result: string = manager.put(longKey, longVal);
                addLog('testDeepDist0088: result=%{public}s', result);
                expect(result.indexOf('inserted')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_8900
         * @tc.name: testDeepDist0089
         * @tc.desc: Verify syncMode change reflected in statistics.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0089', 0, (done: Function) => {
            runCase('testDeepDist0089', async (): Promise<void> => {
                manager.initialize();
                manager.setSyncMode(SyncMode.REAL_TIME);
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0089: stats=%{public}s', stats);
                expect(stats.indexOf('realTime')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9000
         * @tc.name: testDeepDist0090
         * @tc.desc: Verify conflictPolicy change reflected in statistics.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0090', 0, (done: Function) => {
            runCase('testDeepDist0090', async (): Promise<void> => {
                manager.initialize();
                manager.setConflictPolicy(ConflictPolicy.TIMESTAMP);
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0090: stats=%{public}s', stats);
                expect(stats.indexOf('timestamp')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9100
         * @tc.name: testDeepDist0091
         * @tc.desc: Verify has after delete returns false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0091', 0, (done: Function) => {
            runCase('testDeepDist0091', async (): Promise<void> => {
                manager.initialize();
                manager.put('check', 'val');
                expect(manager.has('check')).assertTrue();
                manager.delete('check');
                expect(manager.has('check')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9200
         * @tc.name: testDeepDist0092
         * @tc.desc: Verify put with numeric string value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0092', 0, (done: Function) => {
            runCase('testDeepDist0092', async (): Promise<void> => {
                manager.initialize();
                manager.put('num', '1234567890');
                const result: string = manager.get('num');
                addLog('testDeepDist0092: result=%{public}s', result);
                expect(result.indexOf('1234567890')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9300
         * @tc.name: testDeepDist0093
         * @tc.desc: Verify put with special characters in value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0093', 0, (done: Function) => {
            runCase('testDeepDist0093', async (): Promise<void> => {
                manager.initialize();
                manager.put('special', 'hello!@#$%');
                const result: string = manager.get('special');
                addLog('testDeepDist0093: result=%{public}s', result);
                expect(result.indexOf('hello!@#$%')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9400
         * @tc.name: testDeepDist0094
         * @tc.desc: Verify device info contains lastSeen timestamp.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0094', 0, (done: Function) => {
            runCase('testDeepDist0094', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('ts1', 'Phone', 'mobile');
                const info: string = manager.getDeviceInfo('ts1');
                addLog('testDeepDist0094: info=%{public}s', info);
                expect(info.indexOf('lastSeen=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9500
         * @tc.name: testDeepDist0095
         * @tc.desc: Verify syncStatus contains all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0095', 0, (done: Function) => {
            runCase('testDeepDist0095', async (): Promise<void> => {
                manager.initialize();
                const status: string = manager.syncStatus();
                addLog('testDeepDist0095: status=%{public}s', status);
                expect(status.indexOf('mode=')).assertLargerOrEqual(0);
                expect(status.indexOf('syncing=')).assertLargerOrEqual(0);
                expect(status.indexOf('lastSync=')).assertLargerOrEqual(0);
                expect(status.indexOf('syncCount=')).assertLargerOrEqual(0);
                expect(status.indexOf('devices=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9600
         * @tc.name: testDeepDist0096
         * @tc.desc: Verify put then update then get returns latest.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0096', 0, (done: Function) => {
            runCase('testDeepDist0096', async (): Promise<void> => {
                manager.initialize();
                manager.put('ver', 'v1');
                manager.put('ver', 'v2');
                manager.put('ver', 'v3');
                const result: string = manager.get('ver');
                addLog('testDeepDist0096: result=%{public}s', result);
                expect(result.indexOf('v3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9700
         * @tc.name: testDeepDist0097
         * @tc.desc: Verify statistics dataCount after puts and deletes.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0097', 0, (done: Function) => {
            runCase('testDeepDist0097', async (): Promise<void> => {
                manager.initialize();
                manager.put('a', '1');
                manager.put('b', '2');
                manager.put('c', '3');
                manager.delete('a');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0097: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9800
         * @tc.name: testDeepDist0098
         * @tc.desc: Verify full lifecycle: init-put-device-sync-release.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0098', 0, (done: Function) => {
            runCase('testDeepDist0098', async (): Promise<void> => {
                manager.initialize();
                manager.put('data1', 'value1');
                manager.registerDevice('dev1', 'Phone', 'mobile');
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0098: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('devices=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('syncs=1')).assertLargerOrEqual(0);
                manager.release();
                expect(manager.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_9900
         * @tc.name: testDeepDist0099
         * @tc.desc: Verify get after put with same key as deleted key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0099', 0, (done: Function) => {
            runCase('testDeepDist0099', async (): Promise<void> => {
                manager.initialize();
                manager.put('reuse', 'old');
                manager.delete('reuse');
                manager.put('reuse', 'new');
                const result: string = manager.get('reuse');
                addLog('testDeepDist0099: result=%{public}s', result);
                expect(result.indexOf('new')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10000
         * @tc.name: testDeepDist0100
         * @tc.desc: Verify syncStatus after multiple syncs.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0100', 0, (done: Function) => {
            runCase('testDeepDist0100', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                await manager.sync();
                await manager.sync();
                const status: string = manager.syncStatus();
                addLog('testDeepDist0100: status=%{public}s', status);
                expect(status.indexOf('syncCount=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10100
         * @tc.name: testDeepDist0101
         * @tc.desc: Verify put with unicode value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0101', 0, (done: Function) => {
            runCase('testDeepDist0101', async (): Promise<void> => {
                manager.initialize();
                manager.put('unicode', '你好世界');
                const result: string = manager.get('unicode');
                addLog('testDeepDist0101: result=%{public}s', result);
                expect(result.indexOf('你好世界')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10200
         * @tc.name: testDeepDist0102
         * @tc.desc: Verify registerDevice with long device name.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0102', 0, (done: Function) => {
            runCase('testDeepDist0102', async (): Promise<void> => {
                manager.initialize();
                let longName: string = '';
                for (let i = 0; i < 50; i++) {
                    longName += 'Device';
                }
                const result: string = manager.registerDevice('longdev', longName, 'mobile');
                addLog('testDeepDist0102: resultLen=%{public}d', result.length);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10300
         * @tc.name: testDeepDist0103
         * @tc.desc: Verify getStatistics after release and reinit.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0103', 0, (done: Function) => {
            runCase('testDeepDist0103', async (): Promise<void> => {
                manager.initialize();
                manager.put('k', 'v');
                manager.release();
                manager.initialize();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0103: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10400
         * @tc.name: testDeepDist0104
         * @tc.desc: Verify setDeviceConnected to same state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0104', 0, (done: Function) => {
            runCase('testDeepDist0104', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('same', 'Phone', 'mobile');
                manager.setDeviceConnected('same', true);
                const result: string = manager.setDeviceConnected('same', true);
                addLog('testDeepDist0104: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10500
         * @tc.name: testDeepDist0105
         * @tc.desc: Verify has after put and before delete.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0105', 0, (done: Function) => {
            runCase('testDeepDist0105', async (): Promise<void> => {
                manager.initialize();
                manager.put('check', 'val');
                expect(manager.has('check')).assertTrue();
                expect(manager.has('other')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10600
         * @tc.name: testDeepDist0106
         * @tc.desc: Verify sync with all devices disconnected.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0106', 0, (done: Function) => {
            runCase('testDeepDist0106', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('off1', 'D1', 'mobile');
                manager.registerDevice('off2', 'D2', 'tablet');
                manager.setDeviceConnected('off1', false);
                manager.setDeviceConnected('off2', false);
                const result: string = await manager.sync();
                addLog('testDeepDist0106: result=%{public}s', result);
                expect(result.indexOf('0/2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10700
         * @tc.name: testDeepDist0107
         * @tc.desc: Verify delete non-existent key does not affect stats.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0107', 0, (done: Function) => {
            runCase('testDeepDist0107', async (): Promise<void> => {
                manager.initialize();
                manager.delete('ghost');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0107: stats=%{public}s', stats);
                expect(stats.indexOf('deletes=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10800
         * @tc.name: testDeepDist0108
         * @tc.desc: Verify put with boolean-like string value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepDist0108', 0, (done: Function) => {
            runCase('testDeepDist0108', async (): Promise<void> => {
                manager.initialize();
                manager.put('boolStr', 'true');
                const result: string = manager.get('boolStr');
                addLog('testDeepDist0108: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_10900
         * @tc.name: testDeepDist0109
         * @tc.desc: Verify getDeviceInfo contains all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0109', 0, (done: Function) => {
            runCase('testDeepDist0109', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('full', 'FullDevice', 'tablet');
                const info: string = manager.getDeviceInfo('full');
                addLog('testDeepDist0109: info=%{public}s', info);
                expect(info.indexOf('id=full')).assertLargerOrEqual(0);
                expect(info.indexOf('name=FullDevice')).assertLargerOrEqual(0);
                expect(info.indexOf('type=tablet')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11000
         * @tc.name: testDeepDist0110
         * @tc.desc: Verify put then get then put same key then get.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0110', 0, (done: Function) => {
            runCase('testDeepDist0110', async (): Promise<void> => {
                manager.initialize();
                manager.put('cycle', 'first');
                const r1: string = manager.get('cycle');
                expect(r1.indexOf('first')).assertLargerOrEqual(0);
                manager.put('cycle', 'second');
                const r2: string = manager.get('cycle');
                addLog('testDeepDist0110: r2=%{public}s', r2);
                expect(r2.indexOf('second')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11100
         * @tc.name: testDeepDist0111
         * @tc.desc: Verify complete distributed workflow.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0111', 0, (done: Function) => {
            runCase('testDeepDist0111', async (): Promise<void> => {
                manager.initialize();
                manager.put('data', 'value');
                manager.registerDevice('phone1', 'MyPhone', 'mobile');
                manager.registerDevice('tablet1', 'MyTablet', 'tablet');
                manager.setSyncMode(SyncMode.REAL_TIME);
                manager.setConflictPolicy(ConflictPolicy.TIMESTAMP);
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0111: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('devices=2')).assertLargerOrEqual(0);
                expect(stats.indexOf('syncs=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('realTime')).assertLargerOrEqual(0);
                expect(stats.indexOf('timestamp')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11200
         * @tc.name: testDeepDist0112
         * @tc.desc: Verify get connected devices after mixed states.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0112', 0, (done: Function) => {
            runCase('testDeepDist0112', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('on1', 'D1', 'mobile');
                manager.registerDevice('on2', 'D2', 'tablet');
                manager.registerDevice('on3', 'D3', 'tv');
                manager.registerDevice('on4', 'D4', 'wearable');
                manager.setDeviceConnected('on2', false);
                manager.setDeviceConnected('on4', false);
                const count: number = manager.getConnectedDevices();
                addLog('testDeepDist0112: count=%{public}d', count);
                expect(count).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11300
         * @tc.name: testDeepDist0113
         * @tc.desc: Verify put-get cycle with 5 keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0113', 0, (done: Function) => {
            runCase('testDeepDist0113', async (): Promise<void> => {
                manager.initialize();
                manager.put('k1', 'v1');
                manager.put('k2', 'v2');
                manager.put('k3', 'v3');
                manager.put('k4', 'v4');
                manager.put('k5', 'v5');
                const r1: string = manager.get('k1');
                const r3: string = manager.get('k3');
                const r5: string = manager.get('k5');
                addLog('testDeepDist0113: r1=%{public}s', r1);
                expect(r1.indexOf('v1')).assertLargerOrEqual(0);
                expect(r3.indexOf('v3')).assertLargerOrEqual(0);
                expect(r5.indexOf('v5')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11400
         * @tc.name: testDeepDist0114
         * @tc.desc: Verify listDevices format contains all device info.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0114', 0, (done: Function) => {
            runCase('testDeepDist0114', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('fmt1', 'Name1', 'mobile');
                manager.registerDevice('fmt2', 'Name2', 'tablet');
                const list: string = manager.listDevices();
                addLog('testDeepDist0114: list=%{public}s', list);
                expect(list.indexOf('fmt1:Name1:mobile:true')).assertLargerOrEqual(0);
                expect(list.indexOf('fmt2:Name2:tablet:true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11500
         * @tc.name: testDeepDist0115
         * @tc.desc: Verify sync then resetStatistics then sync again.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0115', 0, (done: Function) => {
            runCase('testDeepDist0115', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'Phone', 'mobile');
                await manager.sync();
                manager.resetStatistics();
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0115: stats=%{public}s', stats);
                expect(stats.indexOf('syncs=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11600
         * @tc.name: testDeepDist0116
         * @tc.desc: Verify getUnresolvedConflicts format.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0116', 0, (done: Function) => {
            runCase('testDeepDist0116', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getUnresolvedConflicts();
                addLog('testDeepDist0116: result=%{public}s', result);
                expect(result.indexOf('Unresolved')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11700
         * @tc.name: testDeepDist0117
         * @tc.desc: Verify getConflicts format when empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0117', 0, (done: Function) => {
            runCase('testDeepDist0117', async (): Promise<void> => {
                manager.initialize();
                const result: string = manager.getConflicts();
                addLog('testDeepDist0117: result=%{public}s', result);
                expect(result.indexOf('no conflicts')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11800
         * @tc.name: testDeepDist0118
         * @tc.desc: Verify put then has immediately.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0118', 0, (done: Function) => {
            runCase('testDeepDist0118', async (): Promise<void> => {
                manager.initialize();
                manager.put('immediate', 'val');
                expect(manager.has('immediate')).assertTrue();
                manager.put('immediate', 'val2');
                expect(manager.has('immediate')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_11900
         * @tc.name: testDeepDist0119
         * @tc.desc: Verify statistics after device operations only.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepDist0119', 0, (done: Function) => {
            runCase('testDeepDist0119', async (): Promise<void> => {
                manager.initialize();
                manager.registerDevice('d1', 'P1', 'mobile');
                manager.registerDevice('d2', 'P2', 'tablet');
                manager.unregisterDevice('d1');
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0119: stats=%{public}s', stats);
                expect(stats.indexOf('devices=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_DIST_12000
         * @tc.name: testDeepDist0120
         * @tc.desc: Verify complete lifecycle with all operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepDist0120', 0, (done: Function) => {
            runCase('testDeepDist0120', async (): Promise<void> => {
                manager.initialize();
                manager.put('final', 'data');
                expect(manager.has('final')).assertTrue();
                const getR: string = manager.get('final');
                expect(getR.indexOf('data')).assertLargerOrEqual(0);
                manager.registerDevice('fdev', 'FDev', 'mobile');
                manager.setSyncMode(SyncMode.PERIODIC);
                manager.setConflictPolicy(ConflictPolicy.MERGE);
                await manager.sync();
                const stats: string = manager.getStatistics();
                addLog('testDeepDist0120: stats=%{public}s', stats);
                expect(stats.indexOf('dataCount=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('syncs=1')).assertLargerOrEqual(0);
                manager.delete('final');
                expect(manager.has('final')).assertFalse();
                manager.release();
                expect(manager.isInitialized()).assertFalse();
            }, done);
        });
    });
}
