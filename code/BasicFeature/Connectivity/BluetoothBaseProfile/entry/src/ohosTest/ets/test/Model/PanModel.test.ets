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
import { BluetoothConnectionState, PanModel, PanState } from 'library';

const DEVICE_ID: string = 'pan_model_device';
const SIBLING_ID: string = 'sibling_pan_device';
const MAX_LOG: number = 200;
const DEFAULT_NETWORK_ROLE: string = 'none';

interface PanDataPayload {
  networkRole: string;
  ipAddress: string;
  subnetMask: string;
  gatewayAddress: string;
  dnsServer: string;
  isSharingEnabled: boolean;
  uploadSpeed: number;
  downloadSpeed: number;
  bytesTransferred: number;
  connectedDeviceCount: number;
}

/**
 * 构造一份完整的 PAN 网络共享数据载荷。
 * @param {string} networkRole - 网络角色
 * @param {string} ipAddress - 分配的 IP 地址
 * @param {number} connectedDeviceCount - 已接入设备数
 * @returns {PanDataPayload} 数据载荷
 */
function buildPayload(networkRole: string, ipAddress: string, connectedDeviceCount: number): PanDataPayload {
  return {
    networkRole: networkRole,
    ipAddress: ipAddress,
    subnetMask: '255.255.255.0',
    gatewayAddress: '192.168.44.1',
    dnsServer: '8.8.8.8',
    isSharingEnabled: true,
    uploadSpeed: 1024,
    downloadSpeed: 4096,
    bytesTransferred: 921600,
    connectedDeviceCount: connectedDeviceCount
  };
}

/**
 * 读取日志末条内容（去掉时间戳前缀）。
 * @param {PanModel} model - 被测模型
 * @returns {string} 末条日志正文，无日志时返回空串
 */
function lastLog(model: PanModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for PanModel
 * @since 26.0.0
 */
export default function panModelTest(): void {
  describe('PanModelTest', () => {
    // ==================== 构造与实例隔离（2 条） ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0100
     * @tc.name: testPanModel0001
     * @tc.desc: Verify the default field values of a PAN model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0001', 0, () => {
      const before: number = Date.now();
      const model = new PanModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      expect(model.ipAddress).assertEqual('');
      expect(model.subnetMask).assertEqual('');
      expect(model.gatewayAddress).assertEqual('');
      expect(model.dnsServer).assertEqual('');
      expect(model.isSharingEnabled).assertFalse();
      expect(model.uploadSpeed).assertEqual(0);
      expect(model.downloadSpeed).assertEqual(0);
      expect(model.bytesTransferred).assertEqual(0);
      expect(model.connectedDeviceCount).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    });

    /*
     * @tc.number: SUB_PAN_MODEL_0200
     * @tc.name: testPanModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own network settings and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0002', 0, () => {
      const model = new PanModel(DEVICE_ID);
      const sibling = new PanModel(SIBLING_ID);

      model.networkRole = 'nap';
      model.ipAddress = '192.168.44.1';
      model.connectedDeviceCount = 3;
      model.bytesTransferred = 2048;
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(PanState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(PanState.DISCONNECTED);
      expect(sibling.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      expect(sibling.ipAddress).assertEqual('');
      expect(sibling.connectedDeviceCount).assertEqual(0);
      expect(sibling.bytesTransferred).assertEqual(0);
      expect(sibling.getLogs().length).assertEqual(0);
      expect(model.toString().indexOf('PanModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== 连接状态迁移（4 条） ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0300
     * @tc.name: testPanModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0003', 0, () => {
      const model = new PanModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(PanState.CONNECTING);
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
     * @tc.number: SUB_PAN_MODEL_0400
     * @tc.name: testPanModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0004', 0, () => {
      const model = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markError('BNEP negotiation failed', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(PanState.CONNECTED);
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
     * @tc.number: SUB_PAN_MODEL_0500
     * @tc.name: testPanModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0005', 0, () => {
      const model = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(PanState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
    });

    /*
     * @tc.number: SUB_PAN_MODEL_0600
     * @tc.name: testPanModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0006', 0, () => {
      const model = new PanModel(DEVICE_ID);

      model.markError('no IP address available', 35200006);
      expect(model.state).assertEqual(PanState.ERROR);
      expect(model.errorMessage).assertEqual('no IP address available');
      expect(model.errorCode).assertEqual(35200006);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: no IP address available');

      model.markError('no IP address available', 35200006);
      model.markError('no IP address available', 35200006);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('no IP address available', 35200006);
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
     * @tc.number: SUB_PAN_MODEL_0700
     * @tc.name: testPanModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0007', 0, () => {
      const model = new PanModel(DEVICE_ID);
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
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
    });

    /*
     * @tc.number: SUB_PAN_MODEL_0800
     * @tc.name: testPanModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0008', 0, () => {
      const model = new PanModel(DEVICE_ID);
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
      expect(model.state).assertEqual(PanState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== 数据载荷与状态入口（2 条） ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0900
     * @tc.name: testPanModel0009
     * @tc.desc: Verify updating network data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0009', 0, () => {
      const model = new PanModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: PanDataPayload = buildPayload('nap', '192.168.44.10', 2);
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.networkRole).assertEqual('nap');
      expect(stored.ipAddress).assertEqual('192.168.44.10');
      expect(stored.subnetMask).assertEqual('255.255.255.0');
      expect(stored.gatewayAddress).assertEqual('192.168.44.1');
      expect(stored.dnsServer).assertEqual('8.8.8.8');
      expect(stored.isSharingEnabled).assertTrue();
      expect(stored.uploadSpeed).assertEqual(1024);
      expect(stored.downloadSpeed).assertEqual(4096);
      expect(stored.bytesTransferred).assertEqual(921600);
      expect(stored.connectedDeviceCount).assertEqual(2);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.connectedDeviceCount = 5;
      expect(stored.connectedDeviceCount).assertEqual(5);
      expect(model.connectedDeviceCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PAN_MODEL_1000
     * @tc.name: testPanModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0010', 0, () => {
      const model = new PanModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(PanState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(PanState.CONNECTING);
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
     * @tc.number: SUB_PAN_MODEL_1100
     * @tc.name: testPanModel0011
     * @tc.desc: Verify reset clears session data while network settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0011', 0, () => {
      const model = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('link lost', 35200002);
      model.updateData(buildPayload('panu', '192.168.44.21', 1));
      model.networkRole = 'panu';
      model.ipAddress = '192.168.44.21';
      model.isSharingEnabled = true;
      model.bytesTransferred = 4096;
      model.connectedDeviceCount = 4;
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.networkRole).assertEqual('panu');
      expect(model.ipAddress).assertEqual('192.168.44.21');
      expect(model.isSharingEnabled).assertTrue();
      expect(model.bytesTransferred).assertEqual(4096);
      expect(model.connectedDeviceCount).assertEqual(4);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
      expect(model.maxRetries).assertEqual(3);
    });

    /*
     * @tc.number: SUB_PAN_MODEL_1200
     * @tc.name: testPanModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit network settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0012', 0, () => {
      const model = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markError('role negotiation rejected', 35200005);
      model.ipAddress = '10.0.0.5';
      model.bytesTransferred = 88;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(PanState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('role negotiation rejected');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('ipAddress')).assertEqual(-1);
      expect(serialized.indexOf('bytesTransferred')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('PanModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
