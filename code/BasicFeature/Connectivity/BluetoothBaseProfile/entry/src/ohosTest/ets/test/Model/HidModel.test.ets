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
import { BluetoothConnectionState, HidModel, HidState } from 'library';

const DEVICE_ID: string = 'hid_model_device';
const SIBLING_ID: string = 'sibling_hid_device';
const MAX_LOG: number = 200;
const DEFAULT_POINTER_SPEED: number = 1;

interface HidDataPayload {
  subType: string;
  isReady: boolean;
  keyMappingCount: number;
  supportedKeys: string[];
  pointerSpeed: number;
  supportsTouchpadGestures: boolean;
  batteryLevel: number;
  firmwareVersion: string;
}

/**
 * 构造一份完整的 HID 输入设备数据载荷。
 * @param {string} subType - 设备子类型
 * @param {number} batteryLevel - 电池电量
 * @param {string} firmwareVersion - 固件版本
 * @returns {HidDataPayload} 数据载荷
 */
function buildPayload(subType: string, batteryLevel: number, firmwareVersion: string): HidDataPayload {
  return {
    subType: subType,
    isReady: true,
    keyMappingCount: 12,
    supportedKeys: ['power', 'volume_up', 'volume_down'],
    pointerSpeed: 2.5,
    supportsTouchpadGestures: true,
    batteryLevel: batteryLevel,
    firmwareVersion: firmwareVersion
  };
}

/**
 * 读取日志末条内容（去掉时间戳前缀）。
 * @param {HidModel} model - 被测模型
 * @returns {string} 末条日志正文，无日志时返回空串
 */
function lastLog(model: HidModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for HidModel
 * @since 26.0.0
 */
export default function hidModelTest(): void {
  describe('HidModelTest', () => {
    // ==================== 构造与实例隔离（2 条） ====================

    /*
     * @tc.number: SUB_HID_MODEL_0100
     * @tc.name: testHidModel0001
     * @tc.desc: Verify the default field values of an HID model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0001', 0, () => {
      const before: number = Date.now();
      const model = new HidModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(HidState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.keyMappingCount).assertEqual(0);
      expect(model.pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      expect(model.supportedKeys.length).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    });

    /*
     * @tc.number: SUB_HID_MODEL_0200
     * @tc.name: testHidModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own input settings and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0002', 0, () => {
      const model = new HidModel(DEVICE_ID);
      const sibling = new HidModel(SIBLING_ID);

      model.keyMappingCount = 24;
      model.pointerSpeed = 3.5;
      model.supportedKeys.push(18);
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(HidState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(HidState.DISCONNECTED);
      expect(sibling.keyMappingCount).assertEqual(0);
      expect(sibling.pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      expect(sibling.supportedKeys.length).assertEqual(0);
      expect(sibling.getLogs().length).assertEqual(0);
      expect(sibling.operationCount).assertEqual(0);
      expect(model.toString().indexOf('HidModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== 连接状态迁移（4 条） ====================

    /*
     * @tc.number: SUB_HID_MODEL_0300
     * @tc.name: testHidModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0003', 0, () => {
      const model = new HidModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(HidState.CONNECTING);
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
     * @tc.number: SUB_HID_MODEL_0400
     * @tc.name: testHidModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0004', 0, () => {
      const model = new HidModel(DEVICE_ID);
      model.markConnecting();
      model.markError('descriptor read failed', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(HidState.CONNECTED);
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
     * @tc.number: SUB_HID_MODEL_0500
     * @tc.name: testHidModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0005', 0, () => {
      const model = new HidModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(HidState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(HidState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
    });

    /*
     * @tc.number: SUB_HID_MODEL_0600
     * @tc.name: testHidModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidModel0006', 0, () => {
      const model = new HidModel(DEVICE_ID);

      model.markError('report parsing failed', 35200006);
      expect(model.state).assertEqual(HidState.ERROR);
      expect(model.errorMessage).assertEqual('report parsing failed');
      expect(model.errorCode).assertEqual(35200006);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: report parsing failed');

      model.markError('report parsing failed', 35200006);
      model.markError('report parsing failed', 35200006);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('report parsing failed', 35200006);
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
     * @tc.number: SUB_HID_MODEL_0700
     * @tc.name: testHidModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0007', 0, () => {
      const model = new HidModel(DEVICE_ID);
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
      expect(model.state).assertEqual(HidState.DISCONNECTED);
      expect(model.pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
    });

    /*
     * @tc.number: SUB_HID_MODEL_0800
     * @tc.name: testHidModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidModel0008', 0, () => {
      const model = new HidModel(DEVICE_ID);
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
      expect(model.state).assertEqual(HidState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== 数据载荷与状态入口（2 条） ====================

    /*
     * @tc.number: SUB_HID_MODEL_0900
     * @tc.name: testHidModel0009
     * @tc.desc: Verify updating input data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidModel0009', 0, () => {
      const model = new HidModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: HidDataPayload = buildPayload('keyboard', 76, '1.4.2');
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.subType).assertEqual('keyboard');
      expect(stored.isReady).assertTrue();
      expect(stored.keyMappingCount).assertEqual(12);
      expect(stored.supportedKeys.length).assertEqual(3);
      expect(stored.supportedKeys[0]).assertEqual('power');
      expect(stored.pointerSpeed).assertEqual(2.5);
      expect(stored.supportsTouchpadGestures).assertTrue();
      expect(stored.firmwareVersion).assertEqual('1.4.2');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(HidState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.batteryLevel = 12;
      expect(stored.batteryLevel).assertEqual(12);
      expect(model.supportedKeys.length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HID_MODEL_1000
     * @tc.name: testHidModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidModel0010', 0, () => {
      const model = new HidModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(HidState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(HidState.CONNECTING);
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
     * @tc.number: SUB_HID_MODEL_1100
     * @tc.name: testHidModel0011
     * @tc.desc: Verify reset clears session data while input settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidModel0011', 0, () => {
      const model = new HidModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('link lost', 35200002);
      model.updateData(buildPayload('mouse', 44, '2.0.1'));
      model.keyMappingCount = 9;
      model.pointerSpeed = 4.5;
      model.supportedKeys.push(7);
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(HidState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.keyMappingCount).assertEqual(9);
      expect(model.pointerSpeed).assertEqual(4.5);
      expect(model.supportedKeys.length).assertEqual(1);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
      expect(model.maxRetries).assertEqual(3);
    });

    /*
     * @tc.number: SUB_HID_MODEL_1200
     * @tc.name: testHidModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit input settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidModel0012', 0, () => {
      const model = new HidModel(DEVICE_ID);
      model.markConnecting();
      model.markError('unsupported descriptor', 35200005);
      model.keyMappingCount = 6;
      model.pointerSpeed = 5;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(HidState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('unsupported descriptor');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('pointerSpeed')).assertEqual(-1);
      expect(serialized.indexOf('keyMappingCount')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('HidModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
