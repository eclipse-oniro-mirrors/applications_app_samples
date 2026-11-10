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
  MapModel,
  MapProfileManager,
  MapService
} from 'library';

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
  const manager = new MapProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<MapProfileManager> {
  const manager = new MapProfileManager();
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
      const manager = new MapProfileManager();
      const service: MapService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.startSync()).assertFalse();
      expect(await manager.stopSync()).assertFalse();
      expect(await manager.setMessageType(1)).assertFalse();

      expect(manager.getSyncProgress()).assertEqual(0);
      expect(manager.getTotalMessages()).assertEqual(0);
      expect(manager.getUnreadCount()).assertEqual(0);
      expect(manager.getLastSyncTime()).assertEqual(0);
      expect(manager.getMessageType()).assertEqual(0);
      expect(manager.getFolders().length).assertEqual(0);
      expect(manager.getMessages().length).assertEqual(0);
      expect(manager.isSyncing()).assertFalse();

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.isConnected()).assertFalse();
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
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      expect(await manager.startSync()).assertFalse();
      expect(await manager.startSync()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.isSyncing()).assertFalse();
      expect(manager.getSyncProgress()).assertEqual(0);

      expect(await manager.stopSync()).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('stopSync');
      expect(lastRecord(manager).details).assertEqual('Sync stopped');
      expect(await manager.setMessageType(2)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Type: 2');
      expect(manager.getMessageType()).assertEqual(2);
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
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
      expect(records[4].errorMessage).assertEqual('');
      expect(records[4].durationMs).assertEqual(0);
      expect(manager.getSyncProgress()).assertEqual(0);

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
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
      const manager = await readyManager();
      const inputs: number[] = [0, 1, 2, -5, 1.5];
      const expected: number[] = [0, 1, 2, -5, 1.5];
      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setMessageType(inputs[i])).assertTrue();
        expect(manager.getMessageType()).assertEqual(expected[i]);
        expect(lastRecord(manager).details).assertEqual(`Type: ${expected[i]}`);
        expect(lastRecord(manager).operationName).assertEqual('setMessageType');
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(6);
      expect(records[5].operationId).assertEqual('mgr_op_6');
      expect(manager.getModel().messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getMessageType()).assertEqual(0);
      expect(await manager.startSync()).assertTrue();
      expect(manager.getMessageType()).assertEqual(0);
      expect(await manager.stopSync()).assertTrue();
      expect(manager.getMessageType()).assertEqual(0);

      const exposed: MapModel = manager.getModel();
      expect(exposed.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      expect(exposed.isSyncing).assertFalse();
      expect(exposed.syncProgress).assertEqual(0);
      expect(exposed.totalMessages).assertEqual(0);
      expect(exposed.unreadCount).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startSync()).assertTrue();
      expect(await manager.stopSync()).assertTrue();

      const foldersFirst: string[] = manager.getFolders();
      const foldersSecond: string[] = manager.getFolders();
      expect(foldersFirst.length).assertEqual(0);
      expect(foldersFirst === foldersSecond).assertFalse();
      foldersFirst.push('Inbox');
      expect(foldersFirst.length).assertEqual(1);
      expect(manager.getFolders().length).assertEqual(0);

      const messagesFirst: Array<object> = manager.getMessages();
      const messagesSecond: Array<object> = manager.getMessages();
      expect(messagesFirst.length).assertEqual(0);
      expect(messagesFirst === messagesSecond).assertFalse();
      expect(manager.getModel().folders.length).assertEqual(0);
      expect(manager.getModel().messages.length).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      const before = manager.getLastSyncTime();
      expect(await manager.startSync()).assertTrue();
      expect(await manager.stopSync()).assertTrue();
      expect(await manager.startSync()).assertTrue();

      expect(manager.getTotalMessages()).assertEqual(0);
      expect(manager.getUnreadCount()).assertEqual(0);
      expect(manager.getSyncProgress()).assertEqual(0);
      expect(manager.getLastSyncTime()).assertEqual(before);
      expect(manager.getMessages().length).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(5);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startSync()).assertTrue();
      expect(manager.isSyncing()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isSyncing()).assertTrue();
      expect(await manager.startSync()).assertFalse();

      await manager.destroy();
      expect(manager.isSyncing()).assertFalse();
      expect(await manager.stopSync()).assertFalse();
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
     * @tc.number: SUB_MAP_MSG_0900
     * @tc.name: testMapMsg0009
     * @tc.desc: Verify the recorded order when synchronization calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapMsg0009', 0, async () => {
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
     * @tc.number: SUB_MAP_MSG_1000
     * @tc.name: testMapMsg0010
     * @tc.desc: Verify that reset keeps the synchronization flag and lets the operation identifier counter grow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapMsg0010', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startSync()).assertTrue();
      expect(await manager.setMessageType(3)).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationName).assertEqual('reset');
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isSyncing()).assertTrue();
      expect(manager.getMessageType()).assertEqual(3);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await manager.startSync()).assertFalse();
      expect(await manager.stopSync()).assertTrue();
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      expect(manager.getStatistics().totalOperations).assertEqual(7);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(await manager.startSync()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(await manager.startSync()).assertTrue();

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(await manager.startSync()).assertFalse();
      expect(manager.isSyncing()).assertTrue();
      expect(await manager.stopSync()).assertTrue();
      expect(manager.isSyncing()).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(8);
      expect(records[3].operationName).assertEqual('startSync');
      expect(records[7].operationName).assertEqual('stopSync');
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    });
  });
}
