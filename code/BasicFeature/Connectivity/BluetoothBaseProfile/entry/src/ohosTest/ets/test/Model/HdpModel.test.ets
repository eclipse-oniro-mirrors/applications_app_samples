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
import { BluetoothConnectionState, HdpModel, HdpState } from 'library';

const DEVICE_ID: string = 'hdp_model_device';
const SIBLING_ID: string = 'sibling_hdp_device';
const MAX_LOG: number = 200;
const DEFAULT_DEVICE_STATUS: string = 'idle';

interface HdpDataPayload {
  healthDeviceType: string;
  dataType: string;
  measurementValue: number;
  measurementUnit: string;
  measurementTime: number;
  isMeasuring: boolean;
  historyCount: number;
  accuracy: number;
  deviceStatus: string;
}

/**
 * 构造一份完整的 HDP 健康数据载荷。
 * @param {string} healthDeviceType - 健康设备类型
 * @param {number} measurementValue - 测量值
 * @param {string} deviceStatus - 设备状态
 * @returns {HdpDataPayload} 数据载荷
 */
function buildPayload(healthDeviceType: string, measurementValue: number, deviceStatus: string): HdpDataPayload {
  return {
    healthDeviceType: healthDeviceType,
    dataType: 'systolic-blood-pressure',
    measurementValue: measurementValue,
    measurementUnit: 'mmHg',
    measurementTime: 1700000002000,
    isMeasuring: true,
    historyCount: 26,
    accuracy: 0.5,
    deviceStatus: deviceStatus
  };
}

/**
 * 读取日志末条内容（去掉时间戳前缀）。
 * @param {HdpModel} model - 被测模型
 * @returns {string} 末条日志正文，无日志时返回空串
 */
function lastLog(model: HdpModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for HdpModel
 * @since 26.0.0
 */
export default function hdpModelTest(): void {
  describe('HdpModelTest', () => {
    // ==================== 构造与实例隔离（2 条） ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0100
     * @tc.name: testHdpModel0001
     * @tc.desc: Verify the default field values of an HDP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0001', 0, () => {
      const before: number = Date.now();
      const model = new HdpModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.healthDeviceType).assertEqual('');
      expect(model.dataType).assertEqual('');
      expect(model.measurementValue).assertEqual(0);
      expect(model.measurementUnit).assertEqual('');
      expect(model.measurementTime).assertEqual(0);
      expect(model.isMeasuring).assertFalse();
      expect(model.historyCount).assertEqual(0);
      expect(model.accuracy).assertEqual(0);
      expect(model.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    });

    /*
     * @tc.number: SUB_HDP_MODEL_0200
     * @tc.name: testHdpModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own measurement fields and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0002', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      const sibling = new HdpModel(SIBLING_ID);

      model.healthDeviceType = 'blood-pressure';
      model.measurementValue = 118;
      model.isMeasuring = true;
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(HdpState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(HdpState.DISCONNECTED);
      expect(sibling.healthDeviceType).assertEqual('');
      expect(sibling.measurementValue).assertEqual(0);
      expect(sibling.isMeasuring).assertFalse();
      expect(sibling.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
      expect(sibling.getLogs().length).assertEqual(0);
      expect(model.toString().indexOf('HdpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== 连接状态迁移（4 条） ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0300
     * @tc.name: testHdpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0003', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(HdpState.CONNECTING);
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
     * @tc.number: SUB_HDP_MODEL_0400
     * @tc.name: testHdpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0004', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('channel closed by sink', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(HdpState.CONNECTED);
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
     * @tc.number: SUB_HDP_MODEL_0500
     * @tc.name: testHdpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0005', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(HdpState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
    });

    /*
     * @tc.number: SUB_HDP_MODEL_0600
     * @tc.name: testHdpModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0006', 0, () => {
      const model = new HdpModel(DEVICE_ID);

      model.markError('registry unavailable', 35200010);
      expect(model.state).assertEqual(HdpState.ERROR);
      expect(model.errorMessage).assertEqual('registry unavailable');
      expect(model.errorCode).assertEqual(35200010);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: registry unavailable');

      model.markError('registry unavailable', 35200010);
      model.markError('registry unavailable', 35200010);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('registry unavailable', 35200010);
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
     * @tc.number: SUB_HDP_MODEL_0700
     * @tc.name: testHdpModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0007', 0, () => {
      const model = new HdpModel(DEVICE_ID);
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
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      expect(model.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
    });

    /*
     * @tc.number: SUB_HDP_MODEL_0800
     * @tc.name: testHdpModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0008', 0, () => {
      const model = new HdpModel(DEVICE_ID);
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
      expect(model.state).assertEqual(HdpState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== 数据载荷与状态入口（2 条） ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0900
     * @tc.name: testHdpModel0009
     * @tc.desc: Verify updating health data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0009', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: HdpDataPayload = buildPayload('blood-pressure', 124, 'measuring');
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.healthDeviceType).assertEqual('blood-pressure');
      expect(stored.dataType).assertEqual('systolic-blood-pressure');
      expect(stored.measurementValue).assertEqual(124);
      expect(stored.measurementUnit).assertEqual('mmHg');
      expect(stored.measurementTime).assertEqual(1700000002000);
      expect(stored.isMeasuring).assertTrue();
      expect(stored.historyCount).assertEqual(26);
      expect(stored.accuracy).assertEqual(0.5);
      expect(stored.deviceStatus).assertEqual('measuring');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.measurementValue = 131;
      expect(stored.measurementValue).assertEqual(131);
      expect(model.measurementValue).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HDP_MODEL_1000
     * @tc.name: testHdpModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0010', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(HdpState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(HdpState.CONNECTING);
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
     * @tc.number: SUB_HDP_MODEL_1100
     * @tc.name: testHdpModel0011
     * @tc.desc: Verify reset clears session data while measurement settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0011', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('stream suspended', 35200002);
      model.updateData(buildPayload('glucose', 96, 'measuring'));
      model.healthDeviceType = 'glucose';
      model.measurementValue = 96;
      model.measurementUnit = 'mg/dL';
      model.isMeasuring = true;
      model.historyCount = 7;
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.healthDeviceType).assertEqual('glucose');
      expect(model.measurementValue).assertEqual(96);
      expect(model.measurementUnit).assertEqual('mg/dL');
      expect(model.isMeasuring).assertTrue();
      expect(model.historyCount).assertEqual(7);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
    });

    /*
     * @tc.number: SUB_HDP_MODEL_1200
     * @tc.name: testHdpModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit measurement settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0012', 0, () => {
      const model = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('application aspect not supported', 35200005);
      model.measurementValue = 77;
      model.historyCount = 3;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(HdpState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('application aspect not supported');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('measurementValue')).assertEqual(-1);
      expect(serialized.indexOf('historyCount')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('HdpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
