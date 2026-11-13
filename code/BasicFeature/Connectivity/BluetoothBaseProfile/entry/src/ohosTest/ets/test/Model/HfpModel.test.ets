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
import { HfpData, HfpModel, HfpModelJson, HfpState, BluetoothConnectionState } from 'library';

const DEVICE_ID: string = 'hfp_model_device';
const MAX_LOG: number = 200;
const DEFAULT_VOLUME: number = 50;
const DEFAULT_CALL_STATE: number = 0;
const ERROR_CALL_FAILED: number = 35200007;

interface HfpDataPayload {
  callState: string;
  phoneNumber: string;
  callDuration: number;
  isMuted: boolean;
  isSpeakerOn: boolean;
  speakerVolume: number;
  micVolume: number;
  batteryLevel: number;
  networkSignal: number;
  carrierName: string;
}

/**
 * structure build a complete HFP call data payload.
 * @param {string} callState - call state text
 * @param {number} speakerVolume - speaker volume
 * @param {string} carrierName - run operate vendor name name
 * @returns {HfpDataPayload} data payload
 */
function buildPayload(callState: string, speakerVolume: number, carrierName: string): HfpDataPayload {
  return {
    callState: callState,
    phoneNumber: '13800000000',
    callDuration: 126,
    isMuted: false,
    isSpeakerOn: true,
    speakerVolume: speakerVolume,
    micVolume: 12,
    batteryLevel: 88,
    networkSignal: 4,
    carrierName: carrierName
  };
}

/**
 * read day log last internal content (remove drop timestamp prefix).
 * @param {HfpModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
 */
function lastLog(model: HfpModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for HfpModel
 * @since 26.0.0
 */
export default function hfpModelTest(): void {
  describe('HfpModelTest', () => {
    // ==================== structure build and default value (2 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0100
     * @tc.name: testHfpModel0001
     * @tc.desc: Verify the default field values of an HFP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0001', 'begin');
      const before: number = Date.now();
      const model: HfpModel = new HfpModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#11 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(DEFAULT_CALL_STATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#12 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#13 ' + "model.callDuration" + ' = ' + JSON.stringify(model.callDuration));
      expect(model.callDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#14 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#15 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#16 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#17 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#18 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#19 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#20 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0001',
        '#21 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0001', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_0200
     * @tc.name: testHfpModel0002
     * @tc.desc: Verify a model bound to a device identifier starts disconnected and keeps its own state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0002', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      const other: HfpModel = new HfpModel('other_device');
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#2 ' + "other.deviceId" + ' = ' + JSON.stringify(other.deviceId));
      expect(other.deviceId).assertEqual('other_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#3 ' + "other.state" + ' = ' + JSON.stringify(other.state));
      expect(other.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#4 assert ' + "expect(other.getLogs().length).assertEqual(0)");
      expect(other.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#5 ' + "other.operationCount" + ' = ' + JSON.stringify(other.operationCount));
      expect(other.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#6 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#8 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0002',
        '#9 assert ' +
        "expect(model.toString().indexOf('HfpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('HfpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0002', 'end');
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0300
     * @tc.name: testHfpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0003', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0003', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_0400
     * @tc.name: testHfpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0004', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('SLC connection failed', ERROR_CALL_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(ERROR_CALL_FAILED);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0004', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_0500
     * @tc.name: testHfpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0005', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      const frozen: number = model.connectionDuration;

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#5 assert ' + "expect(model.getConnectionDuration()).assertEqual(frozen)");
      expect(model.getConnectionDuration()).assertEqual(frozen);

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#7 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#8 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#10 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0005',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0005', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_0600
     * @tc.name: testHfpModel0006
     * @tc.desc: Verify the error transition stores the message, the code and the incrementing retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0006', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);

      model.markError('Dial failure', 35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('Dial failure');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#5 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: Dial failure')");
      expect(lastLog(model)).assertEqual('Error: Dial failure');

      model.markError('Dial failure', 35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#8 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0006',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0006', 'end');
    });

    // ==================== weight try capability edge interface (1 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0700
     * @tc.name: testHfpModel0007
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0007', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#1 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();

      model.markError('fail 1', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#2 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#3 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);

      model.markError('fail 2', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#4 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#5 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(2);

      model.markError('fail 3', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#6 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);

      model.markError('fail 4', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#10 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#11 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0007',
        '#12 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0007', 'end');
    });

    // ==================== operation log row for (3 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0800
     * @tc.name: testHfpModel0008
     * @tc.desc: Verify each appended log carries an ISO timestamp prefix and raises the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0008', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);

      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#7 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0008',
        '#8 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0008', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_0900
     * @tc.name: testHfpModel0009
     * @tc.desc: Verify the log buffer keeps only the latest entries once the configured ceiling is exceeded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0009', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0009',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0009', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_1000
     * @tc.name: testHfpModel0010
     * @tc.desc: Verify the returned log array is a copy and clearing logs keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0010', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      model.addLog('alpha');
      model.addLog('beta');

      const copy = model.getLogs();
      copy.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#1 ' + "copy.length" + ' = ' + JSON.stringify(copy.length));
      expect(copy.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#2 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#5 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#7 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0010',
        '#10 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0010', 'end');
    });

    // ==================== call and audio field (3 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_1100
     * @tc.name: testHfpModel0011
     * @tc.desc: Verify direct call and audio field updates stay independent from the data payload.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0011', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);

      model.callState = 2;
      model.phoneNumber = '13912345678';
      model.callDuration = 300;
      model.isMuted = true;
      model.isSpeakerOn = true;
      model.speakerVolume = 15;
      model.micVolume = 8;

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#1 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#2 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('13912345678');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#3 ' + "model.callDuration" + ' = ' + JSON.stringify(model.callDuration));
      expect(model.callDuration).assertEqual(300);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#4 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#5 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#6 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#7 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#8 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#11 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);

      const sibling: HfpModel = new HfpModel('sibling_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#12 ' + "sibling.callState" + ' = ' + JSON.stringify(sibling.callState));
      expect(sibling.callState).assertEqual(DEFAULT_CALL_STATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#13 ' + "sibling.phoneNumber" + ' = ' + JSON.stringify(sibling.phoneNumber));
      expect(sibling.phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#14 ' + "sibling.isMuted" + ' = ' + JSON.stringify(sibling.isMuted));
      expect(sibling.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#15 ' + "sibling.speakerVolume" + ' = ' + JSON.stringify(sibling.speakerVolume));
      expect(sibling.speakerVolume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0011',
        '#16 ' + "sibling.micVolume" + ' = ' + JSON.stringify(sibling.micVolume));
      expect(sibling.micVolume).assertEqual(DEFAULT_VOLUME);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0011', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_1200
     * @tc.name: testHfpModel0012
     * @tc.desc: Verify updating call data stores the payload and refreshes the update timestamp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0012', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0012',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      model.updateData(buildPayload('incoming', 15, 'China Mobile'));

      const stored: HfpData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0012',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#3 ' + "stored.callState" + ' = ' + JSON.stringify(stored.callState));
        expect(stored.callState).assertEqual('incoming');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#4 ' + "stored.phoneNumber" + ' = ' + JSON.stringify(stored.phoneNumber));
        expect(stored.phoneNumber).assertEqual('13800000000');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#5 ' + "stored.callDuration" + ' = ' + JSON.stringify(stored.callDuration));
        expect(stored.callDuration).assertEqual(126);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#6 ' + "stored.speakerVolume" + ' = ' + JSON.stringify(stored.speakerVolume));
        expect(stored.speakerVolume).assertEqual(15);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#7 ' + "stored.micVolume" + ' = ' + JSON.stringify(stored.micVolume));
        expect(stored.micVolume).assertEqual(12);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#8 ' + "stored.batteryLevel" + ' = ' + JSON.stringify(stored.batteryLevel));
        expect(stored.batteryLevel).assertEqual(88);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#9 ' + "stored.networkSignal" + ' = ' + JSON.stringify(stored.networkSignal));
        expect(stored.networkSignal).assertEqual(4);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0012',
          '#10 ' + "stored.carrierName" + ' = ' + JSON.stringify(stored.carrierName));
        expect(stored.carrierName).assertEqual('China Mobile');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0012',
        '#11 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0012',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0012',
        '#13 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0012', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_1300
     * @tc.name: testHfpModel0013
     * @tc.desc: Verify the model keeps the payload by reference so later external edits stay visible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0013', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      const payload: HfpDataPayload = buildPayload('active', 10, 'China Unicom');
      model.updateData(payload);

      payload.speakerVolume = 3;
      payload.isMuted = true;

      const stored: HfpData | null = model.data;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#1 ' + "stored.speakerVolume" + ' = ' + JSON.stringify(stored.speakerVolume));
        expect(stored.speakerVolume).assertEqual(3);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#2 ' + "stored.isMuted" + ' = ' + JSON.stringify(stored.isMuted));
        expect(stored.isMuted).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#3 ' + "stored.callState" + ' = ' + JSON.stringify(stored.callState));
        expect(stored.callState).assertEqual('active');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0013',
        '#4 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(DEFAULT_VOLUME);

      const second: HfpDataPayload = buildPayload('held', 7, 'Demo Carrier');
      model.updateData(second);
      const replaced: HfpData | null = model.data;
      if (replaced !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#5 ' + "replaced.callState" + ' = ' + JSON.stringify(replaced.callState));
        expect(replaced.callState).assertEqual('held');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#6 ' + "replaced.carrierName" + ' = ' + JSON.stringify(replaced.carrierName));
        expect(replaced.carrierName).assertEqual('Demo Carrier');
      }
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpModel0013',
          '#7 ' + "stored.callState" + ' = ' + JSON.stringify(stored.callState));
        expect(stored.callState).assertEqual('active');
      }
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0013', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_1400
     * @tc.name: testHfpModel0014
     * @tc.desc: Verify connection state updates are mapped to the matching transitions and unknown states are ignored.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0014', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);

      model.updateConnectionState(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#2 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTING);

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#12 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0014',
        '#14 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0014', 'end');
    });

    // ==================== reset semantics and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_HFP_MODEL_1500
     * @tc.name: testHfpModel0015
     * @tc.desc: Verify reset clears session data while call attributes and audio settings survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0015', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('codec negotiation failed', 35200009);
      model.updateData(buildPayload('active', 9, 'China Mobile'));
      model.callState = 3;
      model.phoneNumber = '13900000000';
      model.callDuration = 45;
      model.isMuted = true;
      model.isSpeakerOn = true;
      model.speakerVolume = 120;
      model.micVolume = 5;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#4 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#5 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#8 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#9 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#10 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#11 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#12 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#13 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#14 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('13900000000');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#15 ' + "model.callDuration" + ' = ' + JSON.stringify(model.callDuration));
      expect(model.callDuration).assertEqual(45);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#16 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#17 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#18 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(120);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#19 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#20 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0015',
        '#21 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0015', 'end');
    });

    /*
     * @tc.number: SUB_HFP_MODEL_1600
     * @tc.name: testHfpModel0016
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit call settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0016', 'begin');
      const model: HfpModel = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('network out of coverage', 35200010);
      model.speakerVolume = 7;
      model.micVolume = 2;

      const json: HfpModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(HfpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('network out of coverage');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200010);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#9 assert ' + "expect(serialized.indexOf('speakerVolume')).assertEqual(-1)");
      expect(serialized.indexOf('speakerVolume')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#10 assert ' + "expect(serialized.indexOf('micVolume')).assertEqual(-1)");
      expect(serialized.indexOf('micVolume')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#12 assert ' + "expect(summary.indexOf('HfpModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('HfpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpModel0016',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpModel0016', 'end');
    });
  });
}
