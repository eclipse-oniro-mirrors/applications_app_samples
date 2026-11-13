/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BluetoothConnectionState,
  PbapModel,
  PbapProfileManager,
  PbapService
} from 'library';
import { PbapContact } from 'library';

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
  const manager: PbapProfileManager = new PbapProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<PbapProfileManager> {
  const manager: PbapProfileManager = new PbapProfileManager();
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0001', 'begin');
      const manager: PbapProfileManager = new PbapProfileManager();
      const service: PbapService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#4 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#5 assert ' + "expect(await manager.stopSync()).assertFalse()");
      expect(await manager.stopSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#6 assert ' + "expect(await manager.setSortOrder(1)).assertFalse()");
      expect(await manager.setSortOrder(1)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#7 assert ' + "expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0)");
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#8 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#9 assert ' + "expect(manager.getTotalContacts()).assertEqual(0)");
      expect(manager.getTotalContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#10 assert ' + "expect(manager.getSyncedContacts()).assertEqual(0)");
      expect(manager.getSyncedContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#11 assert ' + "expect(manager.getLastSyncTime()).assertEqual(0)");
      expect(manager.getLastSyncTime()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#12 assert ' + "expect(manager.getPhonebookType()).assertEqual(0)");
      expect(manager.getPhonebookType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#13 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#14 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#15 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#16 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0001',
        '#17 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#3 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#4 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#5 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#6 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#7 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#8 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#9 assert ' + "expect(lastRecord(manager).operationName).assertEqual('stopSync')");
      expect(lastRecord(manager).operationName).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#10 assert ' + "expect(lastRecord(manager).details).assertEqual('Sync stopped')");
      expect(lastRecord(manager).details).assertEqual('Sync stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#11 assert ' + "expect(await manager.setSortOrder(2)).assertTrue()");
      expect(await manager.setSortOrder(2)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#12 assert ' + "expect(lastRecord(manager).details).assertEqual('Order: 2')");
      expect(lastRecord(manager).details).assertEqual('Order: 2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#13 assert ' + "expect(lastRecord(manager).operationId).assertEqual('mgr_op_3')");
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#14 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0002',
        '#15 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#4 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#5 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#6 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#7 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#8 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#9 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#10 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Sync started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#11 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#12 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Sync stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#13 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Sync started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#14 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#15 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#16 ' + "records[4].success" + ' = ' + JSON.stringify(records[4].success));
      expect(records[4].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#17 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#18 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0003',
        '#19 assert ' + "expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect')");
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0004', 'begin');
      const manager = await readyManager();
      const inputs: number[] = [0, 1, 2, -3, 7.5];
      const expected: string[] = ['Order: 0', 'Order: 1', 'Order: 2', 'Order: -3', 'Order: 7.5'];
      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapPb0004',
          '#1 assert ' + "expect(await manager.setSortOrder(inputs[i])).assertTrue()");
        expect(await manager.setSortOrder(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapPb0004',
          '#2 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setSortOrder')");
        expect(lastRecord(manager).operationName).assertEqual('setSortOrder');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapPb0004',
          '#3 assert ' + "expect(lastRecord(manager).details).assertEqual(expected[i])");
        expect(lastRecord(manager).details).assertEqual(expected[i]);
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0004',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0004',
        '#5 ' + "records[5].operationId" + ' = ' + JSON.stringify(records[5].operationId));
      expect(records[5].operationId).assertEqual('mgr_op_6');

      const exposed: PbapModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0004',
        '#6 ' + "exposed.sortOrder" + ' = ' + JSON.stringify(exposed.sortOrder));
      expect(exposed.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0004',
        '#7 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0004',
        '#8 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const first: PbapContact[] = manager.searchContacts(KEYWORD_ALICE);
      const second: PbapContact[] = manager.searchContacts(KEYWORD_BOB);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#1 ' + "first.length" + ' = ' + JSON.stringify(first.length));
      expect(first.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#2 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#3 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertTrue();

      const third: PbapContact[] = manager.searchContacts('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#4 ' + "third === first" + ' = ' + JSON.stringify(third === first));
      expect(third === first).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#5 assert ' + "expect(manager.getTotalContacts()).assertEqual(0)");
      expect(manager.getTotalContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#6 assert ' + "expect(manager.getSyncedContacts()).assertEqual(0)");
      expect(manager.getSyncedContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#7 assert ' + "expect(recordsOf(manager).length).assertEqual(2)");
      expect(recordsOf(manager).length).assertEqual(2);

      const exposed: PbapModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#8 ' + "exposed.searchKeyword" + ' = ' + JSON.stringify(exposed.searchKeyword));
      expect(exposed.searchKeyword).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0005',
        '#9 ' + "exposed.contacts.length" + ' = ' + JSON.stringify(exposed.contacts.length));
      expect(exposed.contacts.length).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const list: PbapContact[] = manager.searchContacts(KEYWORD_ALICE);
      const stub: ContactStub = { name: 'Local Contact', number: '13800000000' };
      list.push(stub);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#1 ' + "list.length" + ' = ' + JSON.stringify(list.length));
      expect(list.length).assertEqual(1);

      const repeated: PbapContact[] = manager.searchContacts(KEYWORD_BOB);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#2 ' + "repeated.length" + ' = ' + JSON.stringify(repeated.length));
      expect(repeated.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#3 ' + "repeated === list" + ' = ' + JSON.stringify(repeated === list));
      expect(repeated === list).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#4 assert ' + "expect(manager.getTotalContacts()).assertEqual(0)");
      expect(manager.getTotalContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#5 assert ' + "expect(manager.getSyncedContacts()).assertEqual(0)");
      expect(manager.getSyncedContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#6 assert ' + "expect(manager.getModel().contacts.length).assertEqual(0)");
      expect(manager.getModel().contacts.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#7 assert ' + "expect(manager.getModel().searchKeyword).assertEqual('')");
      expect(manager.getModel().searchKeyword).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0006',
        '#8 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0007', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const before = manager.getLastSyncTime();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#2 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#4 assert ' + "expect(manager.getTotalContacts()).assertEqual(0)");
      expect(manager.getTotalContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#5 assert ' + "expect(manager.getSyncedContacts()).assertEqual(0)");
      expect(manager.getSyncedContacts()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#6 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#7 assert ' + "expect(manager.getLastSyncTime()).assertEqual(before)");
      expect(manager.getLastSyncTime()).assertEqual(before);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#8 assert ' + "expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0)");
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#9 assert ' + "expect(recordsOf(manager).length).assertEqual(5)");
      expect(recordsOf(manager).length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0007',
        '#10 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0008', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#1 assert ' + "expect(manager.getPhonebookType()).assertEqual(0)");
      expect(manager.getPhonebookType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#2 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#3 assert ' + "expect(manager.getPhonebookType()).assertEqual(0)");
      expect(manager.getPhonebookType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#4 assert ' + "expect(await manager.setSortOrder(1)).assertTrue()");
      expect(await manager.setSortOrder(1)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#5 assert ' + "expect(manager.getPhonebookType()).assertEqual(0)");
      expect(manager.getPhonebookType()).assertEqual(0);

      const exposed: PbapModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#6 ' + "exposed.phonebookType" + ' = ' + JSON.stringify(exposed.phonebookType));
      expect(exposed.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#7 assert ' + "expect(Number(exposed.phonebookType) === 0).assertFalse()");
      expect(Number(exposed.phonebookType) === 0).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#8 ' + "exposed.isSyncing" + ' = ' + JSON.stringify(exposed.isSyncing));
      expect(exposed.isSyncing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0008',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#2 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#3 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#4 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#5 assert ' + "expect(await manager.stopSync()).assertFalse()");
      expect(await manager.stopSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#6 assert ' + "expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0)");
      expect(manager.searchContacts(KEYWORD_ALICE).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#7 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#8 assert ' + "expect(lastRecord(manager).operationName).assertEqual('reset')");
      expect(lastRecord(manager).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#10 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#11 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#12 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#13 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#14 assert ' + "expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1')");
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#15 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0009',
        '#16 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] = [manager.startSync(), manager.stopSync(), manager.startSync()];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#9 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#10 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0010',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#1 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#4 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#5 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#6 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#7 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#8 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();

      const recordsBefore = recordsOf(manager).length;
      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#9 ' + "recordsBefore" + ' = ' + JSON.stringify(recordsBefore));
      expect(recordsBefore).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#10 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#11 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_8');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#12 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#13 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(8)");
      expect(manager.getStatistics().totalOperations).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapPb0011',
        '#14 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapPb0011', 'end');
    });
  });
}
