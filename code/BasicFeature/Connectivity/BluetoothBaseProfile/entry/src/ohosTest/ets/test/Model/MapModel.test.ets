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
import { BluetoothConnectionState, MapData, MapMessage, MapModel, MapState, MapModelJson } from 'library';

const DEVICE_ID: string = 'map_model_device';
const SIBLING_ID: string = 'sibling_map_device';
const MAX_LOG: number = 200;
const DEFAULT_MESSAGE_TYPE: string = 'sms';

/**
 * structure build a complete MAP message access data payload.
 * @param {number} totalMessages - total message count
 * @param {string} messageType - message type
 * @param {number} unreadCount - unread message count
 * @returns {MapData} data payload
 */
function buildPayload(totalMessages: number, messageType: string, unreadCount: number): MapData {
  const message: MapMessage = {
    sender: '13800000001',
    subject: 'welcome',
    body: 'first message',
    timestamp: 1700000001000,
    isRead: false,
    type: messageType
  };
  return {
    totalMessages: totalMessages,
    unreadCount: unreadCount,
    messageType: messageType,
    isSyncing: false,
    syncProgress: 100,
    lastSyncTime: 1700000001000,
    folders: ['inbox', 'outbox'],
    messages: [message]
  };
}

/**
 * read day log last internal content (remove drop timestamp prefix).
 * @param {MapModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
 */
function lastLog(model: MapModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for MapModel
 * @since 26.0.0
 */
export default function mapModelTest(): void {
  describe('MapModelTest', () => {
    // ==================== structure build and instance isolation (2 cases) ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0100
     * @tc.name: testMapModel0001
     * @tc.desc: Verify the default field values of a MAP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0001', 'begin');
      const before: number = Date.now();
      const model: MapModel = new MapModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#11 ' + "model.folders.length" + ' = ' + JSON.stringify(model.folders.length));
      expect(model.folders.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#12 ' + "model.messages.length" + ' = ' + JSON.stringify(model.messages.length));
      expect(model.messages.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#13 ' + "model.isSyncing" + ' = ' + JSON.stringify(model.isSyncing));
      expect(model.isSyncing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#14 ' + "model.lastSyncTime" + ' = ' + JSON.stringify(model.lastSyncTime));
      expect(model.lastSyncTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#15 ' + "model.messageType" + ' = ' + JSON.stringify(model.messageType));
      expect(model.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#16 ' + "model.syncProgress" + ' = ' + JSON.stringify(model.syncProgress));
      expect(model.syncProgress).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#17 ' + "model.totalMessages" + ' = ' + JSON.stringify(model.totalMessages));
      expect(model.totalMessages).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#18 ' + "model.unreadCount" + ' = ' + JSON.stringify(model.unreadCount));
      expect(model.unreadCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#19 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#20 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#21 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0001',
        '#22 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0001', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_0200
     * @tc.name: testMapModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own message lists and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0002', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      const sibling: MapModel = new MapModel(SIBLING_ID);

      model.folders.push('inbox');
      model.totalMessages = 12;
      model.unreadCount = 4;
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#4 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#5 ' + "sibling.state" + ' = ' + JSON.stringify(sibling.state));
      expect(sibling.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#6 ' + "sibling.folders.length" + ' = ' + JSON.stringify(sibling.folders.length));
      expect(sibling.folders.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#7 ' + "sibling.messages.length" + ' = ' + JSON.stringify(sibling.messages.length));
      expect(sibling.messages.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#8 ' + "sibling.totalMessages" + ' = ' + JSON.stringify(sibling.totalMessages));
      expect(sibling.totalMessages).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#9 ' + "sibling.unreadCount" + ' = ' + JSON.stringify(sibling.unreadCount));
      expect(sibling.unreadCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#10 ' + "sibling.messageType" + ' = ' + JSON.stringify(sibling.messageType));
      expect(sibling.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0002',
        '#11 assert ' +
        "expect(model.toString().indexOf('MapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('MapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0002', 'end');
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0300
     * @tc.name: testMapModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0003', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0003', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_0400
     * @tc.name: testMapModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0004', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('mas feature unsupported', 35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0004', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_0500
     * @tc.name: testMapModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0005', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#9 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0005',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0005', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_0600
     * @tc.name: testMapModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0006', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);

      model.markError('message send rejected', 35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('message send rejected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: message send rejected')");
      expect(lastLog(model)).assertEqual('Error: message send rejected');

      model.markError('message send rejected', 35200008);
      model.markError('message send rejected', 35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#9 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markError('message send rejected', 35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#11 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#14 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0006',
        '#15 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0006', 'end');
    });

    // ==================== operation log row for (2 cases) ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0700
     * @tc.name: testMapModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0007', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#7 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0007',
        '#10 ' + "model.messageType" + ' = ' + JSON.stringify(model.messageType));
      expect(model.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0007', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_0800
     * @tc.name: testMapModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0008', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0008',
        '#12 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0008', 'end');
    });

    // ==================== data payload and state entry (2 cases) ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0900
     * @tc.name: testMapModel0009
     * @tc.desc: Verify updating message data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0009', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: MapData = buildPayload(24, 'email', 6);
      model.updateData(payload);

      const stored: MapData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#3 ' + "stored.totalMessages" + ' = ' + JSON.stringify(stored.totalMessages));
        expect(stored.totalMessages).assertEqual(24);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#4 ' + "stored.unreadCount" + ' = ' + JSON.stringify(stored.unreadCount));
        expect(stored.unreadCount).assertEqual(6);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#5 ' + "stored.messageType" + ' = ' + JSON.stringify(stored.messageType));
        expect(stored.messageType).assertEqual('email');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#6 ' + "stored.isSyncing" + ' = ' + JSON.stringify(stored.isSyncing));
        expect(stored.isSyncing).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#7 ' + "stored.syncProgress" + ' = ' + JSON.stringify(stored.syncProgress));
        expect(stored.syncProgress).assertEqual(100);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#8 ' + "stored.lastSyncTime" + ' = ' + JSON.stringify(stored.lastSyncTime));
        expect(stored.lastSyncTime).assertEqual(1700000001000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#9 ' + "stored.folders.length" + ' = ' + JSON.stringify(stored.folders.length));
        expect(stored.folders.length).assertEqual(2);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#10 ' + "stored.folders[0]" + ' = ' + JSON.stringify(stored.folders[0]));
        expect(stored.folders[0]).assertEqual('inbox');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#11 ' + "stored.messages.length" + ' = ' + JSON.stringify(stored.messages.length));
        expect(stored.messages.length).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#12 ' + "stored.messages[0].sender" + ' = ' + JSON.stringify(stored.messages[0].sender));
        expect(stored.messages[0].sender).assertEqual('13800000001');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#13 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#14 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#15 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#16 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.unreadCount = 0;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMapModel0009',
          '#17 ' + "stored.unreadCount" + ' = ' + JSON.stringify(stored.unreadCount));
        expect(stored.unreadCount).assertEqual(0);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0009',
        '#18 ' + "model.folders.length" + ' = ' + JSON.stringify(model.folders.length));
      expect(model.folders.length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0009', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_1000
     * @tc.name: testMapModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0010', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#3 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#4 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#5 ' + "model.lastUpdateTime >= before" + ' = ' + JSON.stringify(model.lastUpdateTime >= before));
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#10 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#11 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#12 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0010',
        '#13 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0010', 'end');
    });

    // ==================== reset and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_MAP_MODEL_1100
     * @tc.name: testMapModel0011
     * @tc.desc: Verify reset clears session data while message settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0011', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('transfer aborted', 35200002);
      model.updateData(buildPayload(30, 'sms', 3));
      model.totalMessages = 30;
      model.unreadCount = 3;
      model.messageType = 'ims';
      model.folders.push('draft');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#11 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#12 ' + "model.totalMessages" + ' = ' + JSON.stringify(model.totalMessages));
      expect(model.totalMessages).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#13 ' + "model.unreadCount" + ' = ' + JSON.stringify(model.unreadCount));
      expect(model.unreadCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#14 ' + "model.messageType" + ' = ' + JSON.stringify(model.messageType));
      expect(model.messageType).assertEqual('ims');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#15 ' + "model.folders.length" + ' = ' + JSON.stringify(model.folders.length));
      expect(model.folders.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#16 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0011',
        '#17 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0011', 'end');
    });

    /*
     * @tc.number: SUB_MAP_MODEL_1200
     * @tc.name: testMapModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit message settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0012', 'begin');
      const model: MapModel = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('folder listing failed', 35200005);
      model.totalMessages = 8;
      model.unreadCount = 2;

      const json: MapModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(MapState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('folder listing failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#9 assert ' + "expect(serialized.indexOf('totalMessages')).assertEqual(-1)");
      expect(serialized.indexOf('totalMessages')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#10 assert ' + "expect(serialized.indexOf('unreadCount')).assertEqual(-1)");
      expect(serialized.indexOf('unreadCount')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#12 assert ' + "expect(summary.indexOf('MapModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('MapModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMapModel0012',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMapModel0012', 'end');
    });
  });
}
