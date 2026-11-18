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
import { DistributedDataManager } from '../../../main/ets/distributed/DistributedDataManager';
import { SyncMode, ConflictPolicy } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function distributedDataTest(): void {
  describe('DistributedDataTest', () => {
    let manager: DistributedDataManager = new DistributedDataManager();

    beforeAll(() => {
      addLog('DistributedDataTest suite started');
    })

    beforeEach(() => {
      manager = new DistributedDataManager();
      manager.initialize();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('DistributedDataTest suite finished');
    })



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0100
     * @tc.name: testDistributedData0001
     * @tc.desc: Verify put inserts a new key-value pair.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0001', 0, (done: Function) => {
      runCase('testDistributedData0001', async (): Promise<void> => {
        const result: string = manager.put('user_name', 'Alice');
        addLog('testDistributedData0001: result=%{public}s', result);
        expect(result.indexOf('inserted')).assertLargerOrEqual(0);
        expect(manager.has('user_name')).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0200
     * @tc.name: testDistributedData0002
     * @tc.desc: Verify put updates existing key value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0002', 0, (done: Function) => {
      runCase('testDistributedData0002', async (): Promise<void> => {
        manager.put('key1', 'old');
        const result: string = manager.put('key1', 'new');
        addLog('testDistributedData0002: result=%{public}s', result);
        expect(result.indexOf('updated')).assertLargerOrEqual(0);
        expect(manager.get('key1').indexOf('new')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0300
     * @tc.name: testDistributedData0003
     * @tc.desc: Verify get retrieves existing key value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0003', 0, (done: Function) => {
      runCase('testDistributedData0003', async (): Promise<void> => {
        manager.put('mykey', 'myvalue');
        const result: string = manager.get('mykey');
        addLog('testDistributedData0003: result=%{public}s', result);
        expect(result.indexOf('myvalue')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.has('mykey')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0400
     * @tc.name: testDistributedData0004
     * @tc.desc: Verify get returns not found for missing key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0004', 0, (done: Function) => {
      runCase('testDistributedData0004', async (): Promise<void> => {
        const result: string = manager.get('nonexistent');
        addLog('testDistributedData0004: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.has('nonexistent')).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0500
     * @tc.name: testDistributedData0005
     * @tc.desc: Verify put fails with empty key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0005', 0, (done: Function) => {
      runCase('testDistributedData0005', async (): Promise<void> => {
        const result: string = manager.put('', 'value');
        addLog('testDistributedData0005: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.has('')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0600
     * @tc.name: testDistributedData0006
     * @tc.desc: Verify get fails with empty key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0006', 0, (done: Function) => {
      runCase('testDistributedData0006', async (): Promise<void> => {
        const result: string = manager.get('');
        addLog('testDistributedData0006: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getAllKeys().indexOf('0 entries')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0700
     * @tc.name: testDistributedData0007
     * @tc.desc: Verify delete removes an existing key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0007', 0, (done: Function) => {
      runCase('testDistributedData0007', async (): Promise<void> => {
        manager.put('del_key', 'del_value');
        const result: string = manager.delete('del_key');
        addLog('testDistributedData0007: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.has('del_key')).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0800
     * @tc.name: testDistributedData0008
     * @tc.desc: Verify delete fails for non-existing key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0008', 0, (done: Function) => {
      runCase('testDistributedData0008', async (): Promise<void> => {
        const result: string = manager.delete('ghost');
        addLog('testDistributedData0008: result=%{public}s', result);
        expect(result.indexOf('not found')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.has('ghost')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_0900
     * @tc.name: testDistributedData0009
     * @tc.desc: Verify has returns correct existence status.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0009', 0, (done: Function) => {
      runCase('testDistributedData0009', async (): Promise<void> => {
        manager.put('exists', 'yes');
        const hasIt: boolean = manager.has('exists');
        const hasNot: boolean = manager.has('missing');
        addLog('testDistributedData0009: has=%{public}s, hasNot=%{public}s', String(hasIt), String(hasNot));
        expect(hasIt).assertTrue();
        expect(hasNot).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1000
     * @tc.name: testDistributedData0010
     * @tc.desc: Verify getAllKeys returns all stored keys.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0010', 0, (done: Function) => {
      runCase('testDistributedData0010', async (): Promise<void> => {
        manager.put('k1', 'v1');
        manager.put('k2', 'v2');
        const keys: string = manager.getAllKeys();
        addLog('testDistributedData0010: keys=%{public}s', keys);
        expect(keys.indexOf('k1')).assertLargerOrEqual(0);
        expect(keys.indexOf('k2')).assertLargerOrEqual(0);
        expect(keys.indexOf('2 entries')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1100
     * @tc.name: testDistributedData0011
     * @tc.desc: Verify registerDevice adds a device successfully.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0011', 0, (done: Function) => {
      runCase('testDistributedData0011', async (): Promise<void> => {
        const result: string = manager.registerDevice('dev_001', 'Phone-A', 'phone');
        addLog('testDistributedData0011: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(result.indexOf('dev_001')).assertLargerOrEqual(0);
        expect(manager.getConnectedDevices()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1200
     * @tc.name: testDistributedData0012
     * @tc.desc: Verify registerDevice fails with duplicate device ID.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0012', 0, (done: Function) => {
      runCase('testDistributedData0012', async (): Promise<void> => {
        manager.registerDevice('dev_dup', 'Phone', 'phone');
        const result: string = manager.registerDevice('dev_dup', 'Phone2', 'tablet');
        addLog('testDistributedData0012: result=%{public}s', result);
        expect(result.indexOf('already registered')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getConnectedDevices()).assertEqual(1);
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1300
     * @tc.name: testDistributedData0013
     * @tc.desc: Verify getStatistics returns correct operation counts.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0013', 0, (done: Function) => {
      runCase('testDistributedData0013', async (): Promise<void> => {
        manager.put('a', '1');
        manager.put('b', '2');
        manager.get('a');
        manager.delete('b');
        const stats: string = manager.getStatistics();
        addLog('testDistributedData0013: stats=%{public}s', stats);
        expect(stats.indexOf('inserts=')).assertLargerOrEqual(0);
        expect(stats.indexOf('queries=')).assertLargerOrEqual(0);
        expect(stats.indexOf('deletes=')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1400
     * @tc.name: testDistributedData0014
     * @tc.desc: Verify unregisterDevice removes a registered device.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0014', 0, (done: Function) => {
      runCase('testDistributedData0014', async (): Promise<void> => {
        manager.registerDevice('dev_rm', 'Phone', 'phone');
        const result: string = manager.unregisterDevice('dev_rm');
        addLog('testDistributedData0014: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getConnectedDevices()).assertEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1500
     * @tc.name: testDistributedData0015
     * @tc.desc: Verify listDevices returns device list string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0015', 0, (done: Function) => {
      runCase('testDistributedData0015', async (): Promise<void> => {
        manager.registerDevice('d1', 'PhoneA', 'phone');
        manager.registerDevice('d2', 'TabletB', 'tablet');
        const list: string = manager.listDevices();
        addLog('testDistributedData0015: list=%{public}s', list);
        expect(list.indexOf('d1')).assertLargerOrEqual(0);
        expect(list.indexOf('d2')).assertLargerOrEqual(0);
        expect(list.indexOf('2 devices')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1600
     * @tc.name: testDistributedData0016
     * @tc.desc: Verify getDeviceInfo returns device details.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0016', 0, (done: Function) => {
      runCase('testDistributedData0016', async (): Promise<void> => {
        manager.registerDevice('info_dev', 'MyPhone', 'phone');
        const info: string = manager.getDeviceInfo('info_dev');
        addLog('testDistributedData0016: info=%{public}s', info);
        expect(info.indexOf('info_dev')).assertLargerOrEqual(0);
        expect(info.indexOf('MyPhone')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1700
     * @tc.name: testDistributedData0017
     * @tc.desc: Verify setDeviceConnected toggles device connection state.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0017', 0, (done: Function) => {
      runCase('testDistributedData0017', async (): Promise<void> => {
        manager.registerDevice('toggle_dev', 'Dev', 'phone');
        expect(manager.getConnectedDevices()).assertEqual(1);
        manager.setDeviceConnected('toggle_dev', false);
        expect(manager.getConnectedDevices()).assertEqual(0);
        manager.setDeviceConnected('toggle_dev', true);
        expect(manager.getConnectedDevices()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1800
     * @tc.name: testDistributedData0018
     * @tc.desc: Verify getConnectedDevices counts only connected devices.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0018', 0, (done: Function) => {
      runCase('testDistributedData0018', async (): Promise<void> => {
        manager.registerDevice('c1', 'A', 'phone');
        manager.registerDevice('c2', 'B', 'tablet');
        manager.setDeviceConnected('c2', false);
        const count: number = manager.getConnectedDevices();
        addLog('testDistributedData0018: connected=%{public}d', String(count));
        expect(count).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.listDevices().indexOf('2 devices')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_1900
     * @tc.name: testDistributedData0019
     * @tc.desc: Verify sync completes with connected devices.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0019', 0, (done: Function) => {
      runCase('testDistributedData0019', async (): Promise<void> => {
        manager.registerDevice('sync_dev', 'SyncPhone', 'phone');
        const result: string = await manager.sync();
        addLog('testDistributedData0019: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getConnectedDevices()).assertEqual(1);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2000
     * @tc.name: testDistributedData0020
     * @tc.desc: Verify syncStatus returns current sync state.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0020', 0, (done: Function) => {
      runCase('testDistributedData0020', async (): Promise<void> => {
        const status: string = manager.syncStatus();
        addLog('testDistributedData0020: status=%{public}s', status);
        expect(status.indexOf('SyncStatus')).assertLargerOrEqual(0);
        expect(status.indexOf('mode=')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2100
     * @tc.name: testDistributedData0021
     * @tc.desc: Verify setSyncMode and getSyncMode work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0021', 0, (done: Function) => {
      runCase('testDistributedData0021', async (): Promise<void> => {
        const setResult: string = manager.setSyncMode(SyncMode.REAL_TIME);
        addLog('testDistributedData0021: setResult=%{public}s', setResult);
        expect(setResult.indexOf('realTime')).assertLargerOrEqual(0);
        expect(manager.getSyncMode()).assertEqual(SyncMode.REAL_TIME);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2200
     * @tc.name: testDistributedData0022
     * @tc.desc: Verify getSyncMode returns default MANUAL mode.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0022', 0, (done: Function) => {
      runCase('testDistributedData0022', async (): Promise<void> => {
        const mode: SyncMode = manager.getSyncMode();
        addLog('testDistributedData0022: mode=%{public}s', mode);
        expect(mode).assertEqual(SyncMode.MANUAL);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.syncStatus().indexOf('mode=')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2300
     * @tc.name: testDistributedData0023
     * @tc.desc: Verify setConflictPolicy and getConflictPolicy.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0023', 0, (done: Function) => {
      runCase('testDistributedData0023', async (): Promise<void> => {
        const result: string = manager.setConflictPolicy(ConflictPolicy.TIMESTAMP);
        addLog('testDistributedData0023: result=%{public}s', result);
        expect(result.indexOf('timestamp')).assertLargerOrEqual(0);
        expect(manager.getConflictPolicy()).assertEqual(ConflictPolicy.TIMESTAMP);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2400
     * @tc.name: testDistributedData0024
     * @tc.desc: Verify getConflictPolicy returns default LOCAL_FIRST.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDistributedData0024', 0, (done: Function) => {
      runCase('testDistributedData0024', async (): Promise<void> => {
        const policy: ConflictPolicy = manager.getConflictPolicy();
        addLog('testDistributedData0024: policy=%{public}s', policy);
        expect(policy).assertEqual(ConflictPolicy.LOCAL_FIRST);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getStatistics().indexOf('policy=')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2500
     * @tc.name: testDistributedData0025
     * @tc.desc: Verify getConflicts returns empty when no conflicts exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDistributedData0025', 0, (done: Function) => {
      runCase('testDistributedData0025', async (): Promise<void> => {
        const conflicts: string = manager.getConflicts();
        addLog('testDistributedData0025: conflicts=%{public}s', conflicts);
        expect(conflicts.indexOf('no conflicts')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getUnresolvedConflicts().indexOf('0 pending')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2600
     * @tc.name: testDistributedData0026
     * @tc.desc: Verify getUnresolvedConflicts returns empty when none pending.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDistributedData0026', 0, (done: Function) => {
      runCase('testDistributedData0026', async (): Promise<void> => {
        const unresolved: string = manager.getUnresolvedConflicts();
        addLog('testDistributedData0026: unresolved=%{public}s', unresolved);
        expect(unresolved.indexOf('0 pending')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getConflicts().indexOf('no conflicts')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2700
     * @tc.name: testDistributedData0027
     * @tc.desc: Verify resetStatistics zeroes all counters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDistributedData0027', 0, (done: Function) => {
      runCase('testDistributedData0027', async (): Promise<void> => {
        manager.put('x', '1');
        manager.get('x');
        const result: string = manager.resetStatistics();
        addLog('testDistributedData0027: result=%{public}s', result);
        expect(result.indexOf('reset')).assertLargerOrEqual(0);
        const stats: string = manager.getStatistics();
        expect(stats.indexOf('inserts=0')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DISTRIBUTED_DATA_2800
     * @tc.name: testDistributedData0028
     * @tc.desc: Verify resolveConflict returns failure when no conflict exists.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testDistributedData0028', 0, (done: Function) => {
      runCase('testDistributedData0028', async (): Promise<void> => {
        const result: string = manager.resolveConflict('nonexistent_key', ConflictPolicy.LOCAL_FIRST);
        addLog('testDistributedData0028: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(result.indexOf('no conflict')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });
  });
}
