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
import { BluetoothConnectionState, PanModel, PanState, PanData, PanModelJson } from 'library';

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
 * structure build a complete PAN network sharing data payload.
 * @param {string} networkRole - network role
 * @param {string} ipAddress - assign IP ground address
 * @param {number} connectedDeviceCount - connected device count
 * @returns {PanDataPayload} data payload
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
 * read day log last internal content (remove drop timestamp prefix).
 * @param {PanModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
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
    // ==================== structure build and instance isolation (2 cases) ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0100
     * @tc.name: testPanModel0001
     * @tc.desc: Verify the default field values of a PAN model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0001', 'begin');
      const before: number = Date.now();
      const model: PanModel = new PanModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#11 ' + "model.networkRole" + ' = ' + JSON.stringify(model.networkRole));
      expect(model.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#12 ' + "model.ipAddress" + ' = ' + JSON.stringify(model.ipAddress));
      expect(model.ipAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#13 ' + "model.subnetMask" + ' = ' + JSON.stringify(model.subnetMask));
      expect(model.subnetMask).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#14 ' + "model.gatewayAddress" + ' = ' + JSON.stringify(model.gatewayAddress));
      expect(model.gatewayAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#15 ' + "model.dnsServer" + ' = ' + JSON.stringify(model.dnsServer));
      expect(model.dnsServer).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#16 ' + "model.isSharingEnabled" + ' = ' + JSON.stringify(model.isSharingEnabled));
      expect(model.isSharingEnabled).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#17 ' + "model.uploadSpeed" + ' = ' + JSON.stringify(model.uploadSpeed));
      expect(model.uploadSpeed).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#18 ' + "model.downloadSpeed" + ' = ' + JSON.stringify(model.downloadSpeed));
      expect(model.downloadSpeed).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#19 ' + "model.bytesTransferred" + ' = ' + JSON.stringify(model.bytesTransferred));
      expect(model.bytesTransferred).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#20 ' + "model.connectedDeviceCount" + ' = ' + JSON.stringify(model.connectedDeviceCount));
      expect(model.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#21 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#22 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#23 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0001',
        '#24 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0002', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      const sibling: PanModel = new PanModel(SIBLING_ID);

      model.networkRole = 'nap';
      model.ipAddress = '192.168.44.1';
      model.connectedDeviceCount = 3;
      model.bytesTransferred = 2048;
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#4 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#5 ' + "sibling.state" + ' = ' + JSON.stringify(sibling.state));
      expect(sibling.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#6 ' + "sibling.networkRole" + ' = ' + JSON.stringify(sibling.networkRole));
      expect(sibling.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#7 ' + "sibling.ipAddress" + ' = ' + JSON.stringify(sibling.ipAddress));
      expect(sibling.ipAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#8 ' + "sibling.connectedDeviceCount" + ' = ' + JSON.stringify(sibling.connectedDeviceCount));
      expect(sibling.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#9 ' + "sibling.bytesTransferred" + ' = ' + JSON.stringify(sibling.bytesTransferred));
      expect(sibling.bytesTransferred).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#10 assert ' + "expect(sibling.getLogs().length).assertEqual(0)");
      expect(sibling.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0002',
        '#11 assert ' +
        "expect(model.toString().indexOf('PanModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('PanModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0002', 'end');
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0300
     * @tc.name: testPanModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0003', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0004', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markError('BNEP negotiation failed', 35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0005', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#9 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0005',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0006', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);

      model.markError('no IP address available', 35200006);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('no IP address available');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200006);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: no IP address available')");
      expect(lastLog(model)).assertEqual('Error: no IP address available');

      model.markError('no IP address available', 35200006);
      model.markError('no IP address available', 35200006);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#9 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markError('no IP address available', 35200006);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#11 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#14 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0006',
        '#15 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0006', 'end');
    });

    // ==================== operation log row for (2 cases) ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0700
     * @tc.name: testPanModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0007', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#7 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0007',
        '#10 ' + "model.networkRole" + ' = ' + JSON.stringify(model.networkRole));
      expect(model.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0008', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0008',
        '#12 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0008', 'end');
    });

    // ==================== data payload and state entry (2 cases) ====================

    /*
     * @tc.number: SUB_PAN_MODEL_0900
     * @tc.name: testPanModel0009
     * @tc.desc: Verify updating network data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0009', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: PanDataPayload = buildPayload('nap', '192.168.44.10', 2);
      model.updateData(payload);

      const stored: PanData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#3 ' + "stored.networkRole" + ' = ' + JSON.stringify(stored.networkRole));
        expect(stored.networkRole).assertEqual('nap');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#4 ' + "stored.ipAddress" + ' = ' + JSON.stringify(stored.ipAddress));
        expect(stored.ipAddress).assertEqual('192.168.44.10');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#5 ' + "stored.subnetMask" + ' = ' + JSON.stringify(stored.subnetMask));
        expect(stored.subnetMask).assertEqual('255.255.255.0');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#6 ' + "stored.gatewayAddress" + ' = ' + JSON.stringify(stored.gatewayAddress));
        expect(stored.gatewayAddress).assertEqual('192.168.44.1');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#7 ' + "stored.dnsServer" + ' = ' + JSON.stringify(stored.dnsServer));
        expect(stored.dnsServer).assertEqual('8.8.8.8');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#8 ' + "stored.isSharingEnabled" + ' = ' + JSON.stringify(stored.isSharingEnabled));
        expect(stored.isSharingEnabled).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#9 ' + "stored.uploadSpeed" + ' = ' + JSON.stringify(stored.uploadSpeed));
        expect(stored.uploadSpeed).assertEqual(1024);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#10 ' + "stored.downloadSpeed" + ' = ' + JSON.stringify(stored.downloadSpeed));
        expect(stored.downloadSpeed).assertEqual(4096);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#11 ' + "stored.bytesTransferred" + ' = ' + JSON.stringify(stored.bytesTransferred));
        expect(stored.bytesTransferred).assertEqual(921600);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#12 ' + "stored.connectedDeviceCount" + ' = ' + JSON.stringify(stored.connectedDeviceCount));
        expect(stored.connectedDeviceCount).assertEqual(2);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#13 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#14 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#15 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#16 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.connectedDeviceCount = 5;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPanModel0009',
          '#17 ' + "stored.connectedDeviceCount" + ' = ' + JSON.stringify(stored.connectedDeviceCount));
        expect(stored.connectedDeviceCount).assertEqual(5);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0009',
        '#18 ' + "model.connectedDeviceCount" + ' = ' + JSON.stringify(model.connectedDeviceCount));
      expect(model.connectedDeviceCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0010', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#3 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#4 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#5 ' + "model.lastUpdateTime >= before" + ' = ' + JSON.stringify(model.lastUpdateTime >= before));
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#10 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#11 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#12 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0010',
        '#13 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0010', 'end');
    });

    // ==================== reset and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_PAN_MODEL_1100
     * @tc.name: testPanModel0011
     * @tc.desc: Verify reset clears session data while network settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0011', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('link lost', 35200002);
      model.updateData(buildPayload('panu', '192.168.44.21', 1));
      model.networkRole = 'panu';
      model.ipAddress = '192.168.44.21';
      model.isSharingEnabled = true;
      model.bytesTransferred = 4096;
      model.connectedDeviceCount = 4;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#11 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#12 ' + "model.networkRole" + ' = ' + JSON.stringify(model.networkRole));
      expect(model.networkRole).assertEqual('panu');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#13 ' + "model.ipAddress" + ' = ' + JSON.stringify(model.ipAddress));
      expect(model.ipAddress).assertEqual('192.168.44.21');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#14 ' + "model.isSharingEnabled" + ' = ' + JSON.stringify(model.isSharingEnabled));
      expect(model.isSharingEnabled).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#15 ' + "model.bytesTransferred" + ' = ' + JSON.stringify(model.bytesTransferred));
      expect(model.bytesTransferred).assertEqual(4096);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#16 ' + "model.connectedDeviceCount" + ' = ' + JSON.stringify(model.connectedDeviceCount));
      expect(model.connectedDeviceCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#17 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#18 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0011',
        '#19 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0012', 'begin');
      const model: PanModel = new PanModel(DEVICE_ID);
      model.markConnecting();
      model.markError('role negotiation rejected', 35200005);
      model.ipAddress = '10.0.0.5';
      model.bytesTransferred = 88;

      const json: PanModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(PanState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('role negotiation rejected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#9 assert ' + "expect(serialized.indexOf('ipAddress')).assertEqual(-1)");
      expect(serialized.indexOf('ipAddress')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#10 assert ' + "expect(serialized.indexOf('bytesTransferred')).assertEqual(-1)");
      expect(serialized.indexOf('bytesTransferred')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#12 assert ' + "expect(summary.indexOf('PanModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('PanModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanModel0012',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanModel0012', 'end');
    });
  });
}
