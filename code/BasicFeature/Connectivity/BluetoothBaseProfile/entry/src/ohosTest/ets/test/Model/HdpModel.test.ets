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
import { BluetoothConnectionState, HdpModel, HdpState, HdpData, HdpModelJson } from 'library';

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
 * structure build a complete HDP health data payload.
 * @param {string} healthDeviceType - health device class type
 * @param {number} measurementValue - test amount value
 * @param {string} deviceStatus - device status
 * @returns {HdpDataPayload} data payload
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
 * read day log last internal content (remove drop timestamp prefix).
 * @param {HdpModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
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
    // ==================== structure build and instance isolation (2 cases) ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0100
     * @tc.name: testHdpModel0001
     * @tc.desc: Verify the default field values of an HDP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0001', 'begin');
      const before: number = Date.now();
      const model: HdpModel = new HdpModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#11 ' + "model.healthDeviceType" + ' = ' + JSON.stringify(model.healthDeviceType));
      expect(model.healthDeviceType).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#12 ' + "model.dataType" + ' = ' + JSON.stringify(model.dataType));
      expect(model.dataType).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#13 ' + "model.measurementValue" + ' = ' + JSON.stringify(model.measurementValue));
      expect(model.measurementValue).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#14 ' + "model.measurementUnit" + ' = ' + JSON.stringify(model.measurementUnit));
      expect(model.measurementUnit).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#15 ' + "model.measurementTime" + ' = ' + JSON.stringify(model.measurementTime));
      expect(model.measurementTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#16 ' + "model.isMeasuring" + ' = ' + JSON.stringify(model.isMeasuring));
      expect(model.isMeasuring).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#17 ' + "model.historyCount" + ' = ' + JSON.stringify(model.historyCount));
      expect(model.historyCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#18 ' + "model.accuracy" + ' = ' + JSON.stringify(model.accuracy));
      expect(model.accuracy).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#19 ' + "model.deviceStatus" + ' = ' + JSON.stringify(model.deviceStatus));
      expect(model.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#20 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#21 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#22 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0001',
        '#23 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0002', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      const sibling: HdpModel = new HdpModel(SIBLING_ID);

      model.healthDeviceType = 'blood-pressure';
      model.measurementValue = 118;
      model.isMeasuring = true;
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#4 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#5 ' + "sibling.state" + ' = ' + JSON.stringify(sibling.state));
      expect(sibling.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#6 ' + "sibling.healthDeviceType" + ' = ' + JSON.stringify(sibling.healthDeviceType));
      expect(sibling.healthDeviceType).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#7 ' + "sibling.measurementValue" + ' = ' + JSON.stringify(sibling.measurementValue));
      expect(sibling.measurementValue).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#8 ' + "sibling.isMeasuring" + ' = ' + JSON.stringify(sibling.isMeasuring));
      expect(sibling.isMeasuring).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#9 ' + "sibling.deviceStatus" + ' = ' + JSON.stringify(sibling.deviceStatus));
      expect(sibling.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#10 assert ' + "expect(sibling.getLogs().length).assertEqual(0)");
      expect(sibling.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0002',
        '#11 assert ' +
        "expect(model.toString().indexOf('HdpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('HdpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0002', 'end');
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0300
     * @tc.name: testHdpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0003', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0004', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('channel closed by sink', 35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0005', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#9 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0005',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0006', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);

      model.markError('registry unavailable', 35200010);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('registry unavailable');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200010);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: registry unavailable')");
      expect(lastLog(model)).assertEqual('Error: registry unavailable');

      model.markError('registry unavailable', 35200010);
      model.markError('registry unavailable', 35200010);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#9 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markError('registry unavailable', 35200010);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#11 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#14 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0006',
        '#15 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0006', 'end');
    });

    // ==================== operation log row for (2 cases) ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0700
     * @tc.name: testHdpModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0007', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#7 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0007',
        '#10 ' + "model.deviceStatus" + ' = ' + JSON.stringify(model.deviceStatus));
      expect(model.deviceStatus).assertEqual(DEFAULT_DEVICE_STATUS);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0008', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0008',
        '#12 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0008', 'end');
    });

    // ==================== data payload and state entry (2 cases) ====================

    /*
     * @tc.number: SUB_HDP_MODEL_0900
     * @tc.name: testHdpModel0009
     * @tc.desc: Verify updating health data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0009', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: HdpDataPayload = buildPayload('blood-pressure', 124, 'measuring');
      model.updateData(payload);

      const stored: HdpData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#3 ' + "stored.healthDeviceType" + ' = ' + JSON.stringify(stored.healthDeviceType));
        expect(stored.healthDeviceType).assertEqual('blood-pressure');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#4 ' + "stored.dataType" + ' = ' + JSON.stringify(stored.dataType));
        expect(stored.dataType).assertEqual('systolic-blood-pressure');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#5 ' + "stored.measurementValue" + ' = ' + JSON.stringify(stored.measurementValue));
        expect(stored.measurementValue).assertEqual(124);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#6 ' + "stored.measurementUnit" + ' = ' + JSON.stringify(stored.measurementUnit));
        expect(stored.measurementUnit).assertEqual('mmHg');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#7 ' + "stored.measurementTime" + ' = ' + JSON.stringify(stored.measurementTime));
        expect(stored.measurementTime).assertEqual(1700000002000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#8 ' + "stored.isMeasuring" + ' = ' + JSON.stringify(stored.isMeasuring));
        expect(stored.isMeasuring).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#9 ' + "stored.historyCount" + ' = ' + JSON.stringify(stored.historyCount));
        expect(stored.historyCount).assertEqual(26);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#10 ' + "stored.accuracy" + ' = ' + JSON.stringify(stored.accuracy));
        expect(stored.accuracy).assertEqual(0.5);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#11 ' + "stored.deviceStatus" + ' = ' + JSON.stringify(stored.deviceStatus));
        expect(stored.deviceStatus).assertEqual('measuring');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#14 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#15 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.measurementValue = 131;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpModel0009',
          '#16 ' + "stored.measurementValue" + ' = ' + JSON.stringify(stored.measurementValue));
        expect(stored.measurementValue).assertEqual(131);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0009',
        '#17 ' + "model.measurementValue" + ' = ' + JSON.stringify(model.measurementValue));
      expect(model.measurementValue).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0010', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#3 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#4 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#5 ' + "model.lastUpdateTime >= before" + ' = ' + JSON.stringify(model.lastUpdateTime >= before));
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#10 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#11 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#12 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0010',
        '#13 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0010', 'end');
    });

    // ==================== reset and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_HDP_MODEL_1100
     * @tc.name: testHdpModel0011
     * @tc.desc: Verify reset clears session data while measurement settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0011', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('stream suspended', 35200002);
      model.updateData(buildPayload('glucose', 96, 'measuring'));
      model.healthDeviceType = 'glucose';
      model.measurementValue = 96;
      model.measurementUnit = 'mg/dL';
      model.isMeasuring = true;
      model.historyCount = 7;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HdpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#11 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#12 ' + "model.healthDeviceType" + ' = ' + JSON.stringify(model.healthDeviceType));
      expect(model.healthDeviceType).assertEqual('glucose');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#13 ' + "model.measurementValue" + ' = ' + JSON.stringify(model.measurementValue));
      expect(model.measurementValue).assertEqual(96);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#14 ' + "model.measurementUnit" + ' = ' + JSON.stringify(model.measurementUnit));
      expect(model.measurementUnit).assertEqual('mg/dL');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#15 ' + "model.isMeasuring" + ' = ' + JSON.stringify(model.isMeasuring));
      expect(model.isMeasuring).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#16 ' + "model.historyCount" + ' = ' + JSON.stringify(model.historyCount));
      expect(model.historyCount).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#17 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0011',
        '#18 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0012', 'begin');
      const model: HdpModel = new HdpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('application aspect not supported', 35200005);
      model.measurementValue = 77;
      model.historyCount = 3;

      const json: HdpModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(HdpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('application aspect not supported');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#9 assert ' + "expect(serialized.indexOf('measurementValue')).assertEqual(-1)");
      expect(serialized.indexOf('measurementValue')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#10 assert ' + "expect(serialized.indexOf('historyCount')).assertEqual(-1)");
      expect(serialized.indexOf('historyCount')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#12 assert ' + "expect(summary.indexOf('HdpModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('HdpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpModel0012',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpModel0012', 'end');
    });
  });
}
