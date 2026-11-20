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
  MapModel,
  MapProfileManager,
  MapService
} from 'library';
import { MapMessage } from 'library';

/**
 * @description Test suite for message access synchronization of MapProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'MapService';
const DEVICE_A: string = 'map_msg_device_a';
const DEVICE_B: string = 'map_msg_device_b';
const DEFAULT_MESSAGE_TYPE: string = 'sms';

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

function recordsOf(manager: MapProfileManager): RecordView[] {
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

function lastRecord(manager: MapProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: MapProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: MapProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<MapProfileManager> {
  const manager: MapProfileManager = new MapProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<MapProfileManager> {
  const manager: MapProfileManager = new MapProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function mapProfileMessageTest(): void {
  describe('MapProfileMessageTest', () => {
    /*
     * @tc.number: SUB_MAP_MSG_0100
     * @tc.name: testMapMsg0001
     * @tc.desc: Verify that message synchronization and every message reading are blocked before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0001', 'begin');
      const manager: MapProfileManager = new MapProfileManager();
      const service: MapService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#4 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#5 assert ' + "expect(await manager.stopSync()).assertFalse()");
      expect(await manager.stopSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#6 assert ' + "expect(await manager.setMessageType(1)).assertFalse()");
      expect(await manager.setMessageType(1)).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#7 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#8 assert ' + "expect(manager.getTotalMessages()).assertEqual(0)");
      expect(manager.getTotalMessages()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#9 assert ' + "expect(manager.getUnreadCount()).assertEqual(0)");
      expect(manager.getUnreadCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#10 assert ' + "expect(manager.getLastSyncTime()).assertEqual(0)");
      expect(manager.getLastSyncTime()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#11 assert ' + "expect(manager.getMessageType()).assertEqual(0)");
      expect(manager.getMessageType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#12 assert ' + "expect(manager.getFolders().length).assertEqual(0)");
      expect(manager.getFolders().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#13 assert ' + "expect(manager.getMessages().length).assertEqual(0)");
      expect(manager.getMessages().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#14 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#15 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#17 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0001',
        '#18 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0001', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0200
     * @tc.name: testMapMsg0002
     * @tc.desc: Verify that only starting synchronization requires a managed device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#3 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#4 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#5 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#6 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#7 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#8 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#9 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#10 assert ' + "expect(lastRecord(manager).operationName).assertEqual('stopSync')");
      expect(lastRecord(manager).operationName).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#11 assert ' + "expect(lastRecord(manager).details).assertEqual('Sync stopped')");
      expect(lastRecord(manager).details).assertEqual('Sync stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#12 assert ' + "expect(await manager.setMessageType(2)).assertTrue()");
      expect(await manager.setMessageType(2)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#13 assert ' + "expect(lastRecord(manager).details).assertEqual('Type: 2')");
      expect(lastRecord(manager).details).assertEqual('Type: 2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#14 assert ' + "expect(manager.getMessageType()).assertEqual(2)");
      expect(manager.getMessageType()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#15 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0002',
        '#16 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0002', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0300
     * @tc.name: testMapMsg0003
     * @tc.desc: Verify the recorded details of a synchronization cycle on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#4 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#5 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#6 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#7 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#8 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#9 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#10 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Sync started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#11 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#12 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Sync stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#13 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Sync started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#14 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#15 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#16 ' + "records[4].errorMessage" + ' = ' + JSON.stringify(records[4].errorMessage));
      expect(records[4].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#17 ' + "records[4].durationMs" + ' = ' + JSON.stringify(records[4].durationMs));
      expect(records[4].durationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#18 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#19 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0003',
        '#20 assert ' + "expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect')");
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0003', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0400
     * @tc.name: testMapMsg0004
     * @tc.desc: Verify that the message type filter is stored as text and read back as a number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0004', 'begin');
      const manager = await readyManager();
      const inputs: number[] = [0, 1, 2, -5, 1.5];
      const expected: number[] = [0, 1, 2, -5, 1.5];
      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapMsg0004',
          '#1 assert ' + "expect(await manager.setMessageType(inputs[i])).assertTrue()");
        expect(await manager.setMessageType(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapMsg0004',
          '#2 assert ' + "expect(manager.getMessageType()).assertEqual(expected[i])");
        expect(manager.getMessageType()).assertEqual(expected[i]);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapMsg0004',
          '#3 assert ' + "expect(lastRecord(manager).details).assertEqual(`Type: ${expected[i]}`)");
        expect(lastRecord(manager).details).assertEqual(`Type: ${expected[i]}`);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapMsg0004',
          '#4 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setMessageType')");
        expect(lastRecord(manager).operationName).assertEqual('setMessageType');
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0004',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0004',
        '#6 ' + "records[5].operationId" + ' = ' + JSON.stringify(records[5].operationId));
      expect(records[5].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0004',
        '#7 assert ' + "expect(manager.getModel().messageType).assertEqual(DEFAULT_MESSAGE_TYPE)");
      expect(manager.getModel().messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0004',
        '#8 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0004', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0500
     * @tc.name: testMapMsg0005
     * @tc.desc: Verify that the default message type reads zero while the service model keeps the text value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#1 assert ' + "expect(manager.getMessageType()).assertEqual(0)");
      expect(manager.getMessageType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#2 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#3 assert ' + "expect(manager.getMessageType()).assertEqual(0)");
      expect(manager.getMessageType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#4 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#5 assert ' + "expect(manager.getMessageType()).assertEqual(0)");
      expect(manager.getMessageType()).assertEqual(0);

      const exposed: MapModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#6 ' + "exposed.messageType" + ' = ' + JSON.stringify(exposed.messageType));
      expect(exposed.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#7 ' + "exposed.isSyncing" + ' = ' + JSON.stringify(exposed.isSyncing));
      expect(exposed.isSyncing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#8 ' + "exposed.syncProgress" + ' = ' + JSON.stringify(exposed.syncProgress));
      expect(exposed.syncProgress).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#9 ' + "exposed.totalMessages" + ' = ' + JSON.stringify(exposed.totalMessages));
      expect(exposed.totalMessages).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#10 ' + "exposed.unreadCount" + ' = ' + JSON.stringify(exposed.unreadCount));
      expect(exposed.unreadCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0005',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0005', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0600
     * @tc.name: testMapMsg0006
     * @tc.desc: Verify that folder and message listings stay empty and return independent copies.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#2 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();

      const foldersFirst: string[] = manager.getFolders();
      const foldersSecond: string[] = manager.getFolders();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#3 ' + "foldersFirst.length" + ' = ' + JSON.stringify(foldersFirst.length));
      expect(foldersFirst.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#4 ' + "foldersFirst === foldersSecond" + ' = ' + JSON.stringify(foldersFirst === foldersSecond));
      expect(foldersFirst === foldersSecond).assertFalse();
      foldersFirst.push('Inbox');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#5 ' + "foldersFirst.length" + ' = ' + JSON.stringify(foldersFirst.length));
      expect(foldersFirst.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#6 assert ' + "expect(manager.getFolders().length).assertEqual(0)");
      expect(manager.getFolders().length).assertEqual(0);

      const messagesFirst: MapMessage[] = manager.getMessages();
      const messagesSecond: MapMessage[] = manager.getMessages();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#7 ' + "messagesFirst.length" + ' = ' + JSON.stringify(messagesFirst.length));
      expect(messagesFirst.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#8 ' + "messagesFirst === messagesSecond" + ' = ' + JSON.stringify(messagesFirst === messagesSecond));
      expect(messagesFirst === messagesSecond).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#9 assert ' + "expect(manager.getModel().folders.length).assertEqual(0)");
      expect(manager.getModel().folders.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#10 assert ' + "expect(manager.getModel().messages.length).assertEqual(0)");
      expect(manager.getModel().messages.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0006',
        '#11 assert ' + "expect(recordsOf(manager).length).assertEqual(4)");
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0006', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0700
     * @tc.name: testMapMsg0007
     * @tc.desc: Verify that message counters and the sync timestamp stay zero after synchronization attempts.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0007', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const before = manager.getLastSyncTime();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#2 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#4 assert ' + "expect(manager.getTotalMessages()).assertEqual(0)");
      expect(manager.getTotalMessages()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#5 assert ' + "expect(manager.getUnreadCount()).assertEqual(0)");
      expect(manager.getUnreadCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#6 assert ' + "expect(manager.getSyncProgress()).assertEqual(0)");
      expect(manager.getSyncProgress()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#7 assert ' + "expect(manager.getLastSyncTime()).assertEqual(before)");
      expect(manager.getLastSyncTime()).assertEqual(before);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#8 assert ' + "expect(manager.getMessages().length).assertEqual(0)");
      expect(manager.getMessages().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#9 assert ' + "expect(recordsOf(manager).length).assertEqual(5)");
      expect(recordsOf(manager).length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0007',
        '#10 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0007', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0800
     * @tc.name: testMapMsg0008
     * @tc.desc: Verify that an unfinished synchronization is reported again after re-initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0008', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#2 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#3 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#4 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#5 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#6 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#7 assert ' + "expect(await manager.stopSync()).assertFalse()");
      expect(await manager.stopSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#8 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#9 assert ' + "expect(lastRecord(manager).operationName).assertEqual('reset')");
      expect(lastRecord(manager).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#10 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#11 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#12 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#13 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#14 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#15 assert ' + "expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1')");
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#16 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0008',
        '#17 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0008', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_0900
     * @tc.name: testMapMsg0009
     * @tc.desc: Verify the recorded order when synchronization calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] = [manager.startSync(), manager.stopSync(), manager.startSync()];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#9 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#10 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0009',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0009', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_1000
     * @tc.name: testMapMsg0010
     * @tc.desc: Verify that reset keeps the synchronization flag and lets the operation identifier counter grow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#1 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#2 assert ' + "expect(await manager.setMessageType(3)).assertTrue()");
      expect(await manager.setMessageType(3)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(4)");
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#4 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#5 ' + "afterReset[0].operationName" + ' = ' + JSON.stringify(afterReset[0].operationName));
      expect(afterReset[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#6 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#7 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#8 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#9 assert ' + "expect(manager.getMessageType()).assertEqual(3)");
      expect(manager.getMessageType()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#10 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#11 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#12 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#13 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#14 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#15 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#16 assert ' + "expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7')");
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0010',
        '#17 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0010', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MSG_1100
     * @tc.name: testMapMsg0011
     * @tc.desc: Verify that synchronization control only depends on having at least one managed device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#1 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#3 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#4 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#5 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#6 assert ' + "expect(await manager.startSync()).assertTrue()");
      expect(await manager.startSync()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#7 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#8 assert ' + "expect(await manager.startSync()).assertFalse()");
      expect(await manager.startSync()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#9 assert ' + "expect(manager.isSyncing()).assertTrue()");
      expect(manager.isSyncing()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#10 assert ' + "expect(await manager.stopSync()).assertTrue()");
      expect(await manager.stopSync()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#11 assert ' + "expect(manager.isSyncing()).assertFalse()");
      expect(manager.isSyncing()).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#12 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#13 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('startSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#14 ' + "records[7].operationName" + ' = ' + JSON.stringify(records[7].operationName));
      expect(records[7].operationName).assertEqual('stopSync');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapMsg0011',
        '#15 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(5)");
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapMsg0011', 'end');
    });
  });
}
