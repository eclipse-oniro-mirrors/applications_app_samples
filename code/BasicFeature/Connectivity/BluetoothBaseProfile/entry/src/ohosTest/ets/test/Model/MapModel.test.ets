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
import { BluetoothConnectionState, MapModel, MapState } from 'library';

const DEVICE_ID: string = 'map_model_device';
const SIBLING_ID: string = 'sibling_map_device';
const MAX_LOG: number = 200;
const DEFAULT_MESSAGE_TYPE: string = 'sms';

interface MessageEntry {
  sender: string;
  body: string;
}

interface MapDataPayload {
  totalMessages: number;
  unreadCount: number;
  messageType: string;
  isSyncing: boolean;
  syncProgress: number;
  lastSyncTime: number;
  folders: string[];
  messages: MessageEntry[];
}

/**
 * 构造一份完整的 MAP 消息访问数据载荷。
 * @param {number} totalMessages - 消息总数
 * @param {string} messageType - 消息类型
 * @param {number} unreadCount - 未读消息数
 * @returns {MapDataPayload} 数据载荷
 */
function buildPayload(totalMessages: number, messageType: string, unreadCount: number): MapDataPayload {
  return {
    totalMessages: totalMessages,
    unreadCount: unreadCount,
    messageType: messageType,
    isSyncing: false,
    syncProgress: 100,
    lastSyncTime: 1700000001000,
    folders: ['inbox', 'outbox'],
    messages: [{ sender: '13800000001', body: 'first message' }]
  };
}

/**
 * 读取日志末条内容（去掉时间戳前缀）。
 * @param {MapModel} model - 被测模型
 * @returns {string} 末条日志正文，无日志时返回空串
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
    // ==================== 构造与实例隔离（2 条） ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0100
     * @tc.name: testMapModel0001
     * @tc.desc: Verify the default field values of a MAP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0001', 0, () => {
      const before: number = Date.now();
      const model = new MapModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.folders.length).assertEqual(0);
      expect(model.messages.length).assertEqual(0);
      expect(model.isSyncing).assertFalse();
      expect(model.lastSyncTime).assertEqual(0);
      expect(model.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      expect(model.syncProgress).assertEqual(0);
      expect(model.totalMessages).assertEqual(0);
      expect(model.unreadCount).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
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
      const model = new MapModel(DEVICE_ID);
      const sibling = new MapModel(SIBLING_ID);

      model.folders.push('inbox');
      model.totalMessages = 12;
      model.unreadCount = 4;
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(MapState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(MapState.DISCONNECTED);
      expect(sibling.folders.length).assertEqual(0);
      expect(sibling.messages.length).assertEqual(0);
      expect(sibling.totalMessages).assertEqual(0);
      expect(sibling.unreadCount).assertEqual(0);
      expect(sibling.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
      expect(model.toString().indexOf('MapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== 连接状态迁移（4 条） ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0300
     * @tc.name: testMapModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0003', 0, () => {
      const model = new MapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(MapState.CONNECTING);
      expect(model.isConnecting()).assertTrue();
      expect(model.isConnected()).assertFalse();
      expect(model.connectionStartTime > 0).assertTrue();
      expect(model.connectionStartTime >= created).assertTrue();
      expect(model.operationCount).assertEqual(1);
      expect(model.getLogs().length).assertEqual(1);
      expect(lastLog(model)).assertEqual('Connecting to device');
      expect(model.retryCount).assertEqual(0);
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
      const model = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('mas feature unsupported', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(MapState.CONNECTED);
      expect(model.isConnected()).assertTrue();
      expect(model.isConnecting()).assertFalse();
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      expect(model.getLogs().length).assertEqual(3);
      expect(lastLog(model)).assertEqual('Connected to device');
      expect(model.operationCount).assertEqual(3);
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
      const model = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(MapState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
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
      const model = new MapModel(DEVICE_ID);

      model.markError('message send rejected', 35200008);
      expect(model.state).assertEqual(MapState.ERROR);
      expect(model.errorMessage).assertEqual('message send rejected');
      expect(model.errorCode).assertEqual(35200008);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: message send rejected');

      model.markError('message send rejected', 35200008);
      model.markError('message send rejected', 35200008);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('message send rejected', 35200008);
      expect(model.retryCount).assertEqual(4);
      expect(model.canRetry()).assertFalse();
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(0);
    });

    // ==================== 操作日志行为（2 条） ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0700
     * @tc.name: testMapModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0007', 0, () => {
      const model = new MapModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      expect(logs.length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
      expect(logs[0].indexOf('[')).assertEqual(0);
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      expect(logs[1].indexOf('T')).assertLarger(0);
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      expect(logs.length).assertEqual(3);
      expect(model.getLogs().length).assertEqual(2);
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      expect(model.messageType).assertEqual(DEFAULT_MESSAGE_TYPE);
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
      const model = new MapModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      expect(logs.length).assertEqual(MAX_LOG);
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      expect(lastLog(model)).assertEqual('log-204');
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      expect(model.state).assertEqual(MapState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== 数据载荷与状态入口（2 条） ====================

    /*
     * @tc.number: SUB_MAP_MODEL_0900
     * @tc.name: testMapModel0009
     * @tc.desc: Verify updating message data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMapModel0009', 0, () => {
      const model = new MapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: MapDataPayload = buildPayload(24, 'email', 6);
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.totalMessages).assertEqual(24);
      expect(stored.unreadCount).assertEqual(6);
      expect(stored.messageType).assertEqual('email');
      expect(stored.isSyncing).assertFalse();
      expect(stored.syncProgress).assertEqual(100);
      expect(stored.lastSyncTime).assertEqual(1700000001000);
      expect(stored.folders.length).assertEqual(2);
      expect(stored.folders[0]).assertEqual('inbox');
      expect(stored.messages.length).assertEqual(1);
      expect(stored.messages[0].sender).assertEqual('13800000001');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(MapState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.unreadCount = 0;
      expect(stored.unreadCount).assertEqual(0);
      expect(model.folders.length).assertEqual(0);
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
      const model = new MapModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(MapState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(MapState.CONNECTING);
      expect(model.isConnecting()).assertTrue();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.data).assertEqual(null);
    });

    // ==================== 重置与序列化（2 条） ====================

    /*
     * @tc.number: SUB_MAP_MODEL_1100
     * @tc.name: testMapModel0011
     * @tc.desc: Verify reset clears session data while message settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMapModel0011', 0, () => {
      const model = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('transfer aborted', 35200002);
      model.updateData(buildPayload(30, 'sms', 3));
      model.totalMessages = 30;
      model.unreadCount = 3;
      model.messageType = 'ims';
      model.folders.push('draft');
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(MapState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.totalMessages).assertEqual(30);
      expect(model.unreadCount).assertEqual(3);
      expect(model.messageType).assertEqual('ims');
      expect(model.folders.length).assertEqual(1);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
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
      const model = new MapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('folder listing failed', 35200005);
      model.totalMessages = 8;
      model.unreadCount = 2;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(MapState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('folder listing failed');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('totalMessages')).assertEqual(-1);
      expect(serialized.indexOf('unreadCount')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('MapModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
