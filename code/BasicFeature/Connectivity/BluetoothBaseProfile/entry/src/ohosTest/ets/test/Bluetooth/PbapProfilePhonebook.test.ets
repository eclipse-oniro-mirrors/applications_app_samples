/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import {
  BluetoothConnectionState,
  PbapModel,
  PbapProfileManager,
  PbapService
} from 'library';

/**
 * @description Test suite for phonebook access synchronization of PbapProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'PbapService';
const DEVICE_A: string = 'pbap_pb_device_a';
const DEVICE_B: string = 'pbap_pb_device_b';
const DEFAULT_PHONEBOOK_TYPE: string = 'SIM';
const DEFAULT_SORT_ORDER: string = 'indexed';
const KEYWORD_ALICE: string = 'Alice';
const KEYWORD_BOB: string = 'Bob';

interface RecordView {
  operationId: string;
  operationName: string;
  startTime: number;
  endTime: number;
  durationMs: number;
  success: boolean;
  errorMessage: string;
  details: string;
}

interface ContactStub {
  name: string;
  number: string;
}

function recordsOf(manager: PbapProfileManager): RecordView[] {
  const source = manager.getOperationRecords();
  const list: RecordView[] = [];
  for (let i = 0; i < source.length; i++) {
    list.push({
      operationId: source[i].operationId,
      operationName: source[i].operationName,
      startTime: source[i].startTime,
      endTime: source[i].endTime,
      durationMs: source[i].durationMs,
      success: source[i].success,
      errorMessage: source[i].errorMessage,
      details: source[i].details
    });
  }
  return list;
}

function lastRecord(manager: PbapProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: PbapProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: PbapProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<PbapProfileManager> {
  const manager = new PbapProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<PbapProfileManager> {
  const manager = new PbapProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function pbapProfilePhonebookTest(): void {
  describe('PbapProfilePhonebookTest', () => {
    /*
     * @tc.number: SUB_PBAP_PB_0100
     * @tc.name: testPbapPb0001
     * @tc.desc: Verify that phonebook synchronization and every contact reading are blocked before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapPb0001', 0, async () => {
      const manager = new PbapProfileManager();
      const service: PbapService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.startSync()).assertFalse();
      expect(await manager.stopSync()).assertFalse();
      expect(await manager.setSortOrder(1)).assertFalse();
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);

      expect(manager.getSyncProgress()).assertEqual(0);
      expect(manager.getTotalContacts()).assertEqual(0);
      expect(manager.getSyncedContacts()).assertEqual(0);
      expect(manager.getLastSyncTime()).assertEqual(0);
      expect(manager.getPhonebookType()).assertEqual(0);
      expect(manager.isSyncing()).assertFalse();

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.isConnected()).assertFalse();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0200
     * @tc.name: testPbapPb0002
     * @tc.desc: Verify that only starting synchronization requires a managed device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0002', 0, async () => {
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      expect(await manager.startSync()).assertFalse();
      expect(await manager.startSync()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.isSyncing()).assertFalse();

      expect(await manager.stopSync()).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('stopSync');
      expect(lastRecord(manager).details).assertEqual('Sync stopped');
      expect(await manager.setSortOrder(2)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Order: 2');
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_3');
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0300
     * @tc.name: testPbapPb0003
     * @tc.desc: Verify the recorded details of a phonebook synchronization cycle on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapPb0003', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      expect(await manager.startSync()).assertTrue();
      expect(manager.isSyncing()).assertTrue();
      expect(await manager.stopSync()).assertTrue();
      expect(manager.isSyncing()).assertFalse();
      expect(await manager.startSync()).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[2].operationName).assertEqual('startSync');
      expect(records[2].details).assertEqual('Sync started');
      expect(records[3].operationName).assertEqual('stopSync');
      expect(records[3].details).assertEqual('Sync stopped');
      expect(records[4].details).assertEqual('Sync started');
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[4].operationId).assertEqual('mgr_op_5');
      expect(records[4].success).assertTrue();
      expect(manager.getSyncProgress()).assertEqual(0);

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0400
     * @tc.name: testPbapPb0004
     * @tc.desc: Verify that every sort order value is accepted and stored as text without a matching getter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0004', 0, async () => {
      const manager = await readyManager();
      const inputs: number[] = [0, 1, 2, -3, 7.5];
      const expected: string[] = ['Order: 0', 'Order: 1', 'Order: 2', 'Order: -3', 'Order: 7.5'];
      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setSortOrder(inputs[i])).assertTrue();
        expect(lastRecord(manager).operationName).assertEqual('setSortOrder');
        expect(lastRecord(manager).details).assertEqual(expected[i]);
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(6);
      expect(records[5].operationId).assertEqual('mgr_op_6');

      const exposed: PbapModel = manager.getModel();
      expect(exposed.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0500
     * @tc.name: testPbapPb0005
     * @tc.desc: Verify that contact search ignores the keyword and hands out the internal list twice.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0005', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const first: Array<object> = manager.searchContacts(KEYWORD_ALICE);
      const second: Array<object> = manager.searchContacts(KEYWORD_BOB);
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first === second).assertTrue();

      const third: Array<object> = manager.searchContacts('');
      expect(third === first).assertTrue();
      expect(manager.getTotalContacts()).assertEqual(0);
      expect(manager.getSyncedContacts()).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(2);

      const exposed: PbapModel = manager.getModel();
      expect(exposed.searchKeyword).assertEqual('');
      expect(exposed.contacts.length).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0600
     * @tc.name: testPbapPb0006
     * @tc.desc: Verify that a caller appended contact is retained by the following searches.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0006', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const list: Array<object> = manager.searchContacts(KEYWORD_ALICE);
      const stub: ContactStub = { name: 'Local Contact', number: '13800000000' };
      list.push(stub);
      expect(list.length).assertEqual(1);

      const repeated: Array<object> = manager.searchContacts(KEYWORD_BOB);
      expect(repeated.length).assertEqual(1);
      expect(repeated === list).assertTrue();

      expect(manager.getTotalContacts()).assertEqual(0);
      expect(manager.getSyncedContacts()).assertEqual(0);
      expect(manager.getModel().contacts.length).assertEqual(0);
      expect(manager.getModel().searchKeyword).assertEqual('');
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0700
     * @tc.name: testPbapPb0007
     * @tc.desc: Verify that contact counters and the sync timestamp stay zero through synchronization cycles.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapPb0007', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const before = manager.getLastSyncTime();
      expect(await manager.startSync()).assertTrue();
      expect(await manager.stopSync()).assertTrue();
      expect(await manager.startSync()).assertTrue();

      expect(manager.getTotalContacts()).assertEqual(0);
      expect(manager.getSyncedContacts()).assertEqual(0);
      expect(manager.getSyncProgress()).assertEqual(0);
      expect(manager.getLastSyncTime()).assertEqual(before);
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(5);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0800
     * @tc.name: testPbapPb0008
     * @tc.desc: Verify that the numeric phonebook type stays zero while the model keeps the text type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0008', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getPhonebookType()).assertEqual(0);
      expect(await manager.startSync()).assertTrue();
      expect(manager.getPhonebookType()).assertEqual(0);
      expect(await manager.setSortOrder(1)).assertTrue();
      expect(manager.getPhonebookType()).assertEqual(0);

      const exposed: PbapModel = manager.getModel();
      expect(exposed.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      expect(Number(exposed.phonebookType) === 0).assertFalse();
      expect(exposed.isSyncing).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_0900
     * @tc.name: testPbapPb0009
     * @tc.desc: Verify that an unfinished synchronization is reported again after re-initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0009', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startSync()).assertTrue();
      expect(manager.isSyncing()).assertTrue();

      await manager.destroy();
      expect(manager.isSyncing()).assertFalse();
      expect(await manager.startSync()).assertFalse();
      expect(await manager.stopSync()).assertFalse();
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(1);
      expect(lastRecord(manager).operationName).assertEqual('reset');
      expect(serviceHistoryCount(manager)).assertEqual(1);

      expect(await manager.initialize()).assertTrue();
      expect(manager.isSyncing()).assertTrue();
      expect(await manager.startSync()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      expect(await manager.stopSync()).assertTrue();
      expect(manager.isSyncing()).assertFalse();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_1000
     * @tc.name: testPbapPb0010
     * @tc.desc: Verify the recorded order when synchronization calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0010', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] = [manager.startSync(), manager.stopSync(), manager.startSync()];
      const results: boolean[] = await Promise.all(tasks);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual('startSync');
      expect(names[3]).assertEqual('stopSync');
      expect(names[4]).assertEqual('startSync');
      expect(manager.isSyncing()).assertTrue();
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_PBAP_PB_1100
     * @tc.name: testPbapPb0011
     * @tc.desc: Verify synchronization control with two managed devices and the record counter after reset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapPb0011', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(await manager.startSync()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.startSync()).assertTrue();

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(await manager.startSync()).assertFalse();
      expect(manager.isSyncing()).assertTrue();

      const recordsBefore = recordsOf(manager).length;
      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(recordsBefore).assertEqual(7);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationId).assertEqual('mgr_op_8');
      expect(manager.isSyncing()).assertTrue();
      expect(manager.getStatistics().totalOperations).assertEqual(8);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    });
  });
}
