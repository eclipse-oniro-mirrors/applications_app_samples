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
import { A2dpData, A2dpModel, A2dpModelJson, A2dpState, BluetoothConnectionState } from 'library';

const DEVICE_ID: string = 'a2dp_model_device';
const MAX_LOG: number = 200;

interface A2dpDataPayload {
  codec: string;
  sampleRate: number;
  bitRate: number;
  volume: number;
  isPlaying: boolean;
  playbackPosition: number;
  totalDuration: number;
  audioSourceName: string;
  audioSourceType: string;
}

/**
 * structure build a complete A2DP audio data payload.
 * @param {string} codec - codec device name name
 * @param {number} volume - volume
 * @param {boolean} isPlaying - whether playing
 * @returns {A2dpDataPayload} data payload
 */
function buildPayload(codec: string, volume: number, isPlaying: boolean): A2dpDataPayload {
  return {
    codec: codec,
    sampleRate: 44100,
    bitRate: 320000,
    volume: volume,
    isPlaying: isPlaying,
    playbackPosition: 1500,
    totalDuration: 240000,
    audioSourceName: 'Phone Music',
    audioSourceType: 'streaming'
  };
}

/**
 * read day log last internal content (remove drop timestamp prefix).
 * @param {A2dpModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
 */
function lastLog(model: A2dpModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for A2dpModel
 * @since 26.0.0
 */
export default function a2dpModelTest(): void {
  describe('A2dpModelTest', () => {
    // ==================== structure build and default value (2 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_0100
     * @tc.name: testA2dpModel0001
     * @tc.desc: Verify the default field values of an A2DP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0001', 'begin');
      const before: number = Date.now();
      const model: A2dpModel = new A2dpModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#11 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#12 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#13 ' + "model.codec" + ' = ' + JSON.stringify(model.codec));
      expect(model.codec).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#14 ' + "model.bitRate" + ' = ' + JSON.stringify(model.bitRate));
      expect(model.bitRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#15 ' + "model.playbackPosition" + ' = ' + JSON.stringify(model.playbackPosition));
      expect(model.playbackPosition).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#16 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#17 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#18 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0001',
        '#19 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0001', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_0200
     * @tc.name: testA2dpModel0002
     * @tc.desc: Verify a model built with a device identifier stays disconnected and retryable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0002', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      const blank: A2dpModel = new A2dpModel();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#2 ' + "blank.deviceId" + ' = ' + JSON.stringify(blank.deviceId));
      expect(blank.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#4 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#6 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#8 assert ' +
        "expect(model.toString().indexOf('A2dpModel[deviceId=' + DEVICE_ID + ', state=disconnected')).assertEqual(0)");
      expect(model.toString().indexOf('A2dpModel[deviceId=' + DEVICE_ID + ', state=disconnected')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0002',
        '#9 assert ' + "expect(blank.toString().indexOf('deviceId=,')).assertEqual(10)");
      expect(blank.toString().indexOf('deviceId=,')).assertEqual(10);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0002', 'end');
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_0300
     * @tc.name: testA2dpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0003', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0003', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_0400
     * @tc.name: testA2dpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0004', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('Pairing failed', 35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#3 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#4 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#5 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#6 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#7 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#8 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#10 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0004',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0004', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_0500
     * @tc.name: testA2dpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0005', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      const stored: number = model.connectionDuration;
      const connectedDuration: number = model.getConnectionDuration();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#8 ' + "connectedDuration >= stored" + ' = ' + JSON.stringify(connectedDuration >= stored));
      expect(connectedDuration >= stored).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#9 ' + "connectedDuration < 5000" + ' = ' + JSON.stringify(connectedDuration < 5000));
      expect(connectedDuration < 5000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0005',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0005', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_0600
     * @tc.name: testA2dpModel0006
     * @tc.desc: Verify the error transition stores the message, the code and the incrementing retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0006', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);

      model.markError('Stream start timeout', 35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('Stream start timeout');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#5 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: Stream start timeout')");
      expect(lastLog(model)).assertEqual('Error: Stream start timeout');

      model.markError('Stream start timeout', 35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#8 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0006',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0006', 'end');
    });

    // ==================== weight try capability edge interface (1 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_0700
     * @tc.name: testA2dpModel0007
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0007', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#1 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();

      model.markError('fail 1', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#2 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#3 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);

      model.markError('fail 2', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#4 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#5 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(2);

      model.markError('fail 3', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#6 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);

      model.markError('fail 4', 35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#10 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#11 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0007',
        '#12 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0007', 'end');
    });

    // ==================== operation log row for (3 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_0800
     * @tc.name: testA2dpModel0008
     * @tc.desc: Verify each appended log carries an ISO timestamp prefix and raises the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0008', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);

      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#7 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0008',
        '#8 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0008', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_0900
     * @tc.name: testA2dpModel0009
     * @tc.desc: Verify the log buffer keeps only the latest entries once the configured ceiling is exceeded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0009', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0009',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0009', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_1000
     * @tc.name: testA2dpModel0010
     * @tc.desc: Verify the returned log array is a copy and clearing logs keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0010', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      model.addLog('alpha');
      model.addLog('beta');

      const copy = model.getLogs();
      copy.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#1 ' + "copy.length" + ' = ' + JSON.stringify(copy.length));
      expect(copy.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#2 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#5 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#7 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0010',
        '#10 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0010', 'end');
    });

    // ==================== data payload and state mapping (3 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_1100
     * @tc.name: testA2dpModel0011
     * @tc.desc: Verify updating audio data stores the payload and refreshes the update timestamp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0011', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: A2dpDataPayload = buildPayload('LDAC', 80, true);
      model.updateData(payload);

      const stored: A2dpData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#3 ' + "stored.codec" + ' = ' + JSON.stringify(stored.codec));
        expect(stored.codec).assertEqual('LDAC');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#4 ' + "stored.sampleRate" + ' = ' + JSON.stringify(stored.sampleRate));
        expect(stored.sampleRate).assertEqual(44100);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#5 ' + "stored.bitRate" + ' = ' + JSON.stringify(stored.bitRate));
        expect(stored.bitRate).assertEqual(320000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#6 ' + "stored.volume" + ' = ' + JSON.stringify(stored.volume));
        expect(stored.volume).assertEqual(80);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#7 ' + "stored.isPlaying" + ' = ' + JSON.stringify(stored.isPlaying));
        expect(stored.isPlaying).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0011',
          '#8 ' + "stored.audioSourceName" + ' = ' + JSON.stringify(stored.audioSourceName));
        expect(stored.audioSourceName).assertEqual('Phone Music');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#11 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0011',
        '#12 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0011', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_1200
     * @tc.name: testA2dpModel0012
     * @tc.desc: Verify the model keeps the payload by reference so later external edits stay visible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0012', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      const payload: A2dpDataPayload = buildPayload('SBC', 20, false);
      model.updateData(payload);

      payload.volume = 66;
      payload.isPlaying = true;

      const stored: A2dpData | null = model.data;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#1 ' + "stored.volume" + ' = ' + JSON.stringify(stored.volume));
        expect(stored.volume).assertEqual(66);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#2 ' + "stored.isPlaying" + ' = ' + JSON.stringify(stored.isPlaying));
        expect(stored.isPlaying).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#3 ' + "stored.codec" + ' = ' + JSON.stringify(stored.codec));
        expect(stored.codec).assertEqual('SBC');
      }

      const second: A2dpDataPayload = buildPayload('AAC', 30, true);
      model.updateData(second);
      const replaced: A2dpData | null = model.data;
      if (replaced !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#4 ' + "replaced.codec" + ' = ' + JSON.stringify(replaced.codec));
        expect(replaced.codec).assertEqual('AAC');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#5 ' + "replaced.volume" + ' = ' + JSON.stringify(replaced.volume));
        expect(replaced.volume).assertEqual(30);
      }
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpModel0012',
          '#6 ' + "stored.codec" + ' = ' + JSON.stringify(stored.codec));
        expect(stored.codec).assertEqual('SBC');
      }
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0012', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_1300
     * @tc.name: testA2dpModel0013
     * @tc.desc: Verify connection state updates are mapped to the matching transitions and unknown states are ignored.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0013', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);

      model.updateConnectionState(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#2 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTING);

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#12 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0013',
        '#14 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0013', 'end');
    });

    // ==================== connection time length and reset semantics (2 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_1400
     * @tc.name: testA2dpModel0014
     * @tc.desc: Verify the reported connection duration switches between the live and the stored value by state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0014', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#1 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);

      model.markConnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#2 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#3 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();

      model.markConnected();
      const frozen: number = model.connectionDuration;
      const live: number = model.getConnectionDuration();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#4 ' + "live >= frozen" + ' = ' + JSON.stringify(live >= frozen));
      expect(live >= frozen).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#5 ' + "live <= 5000" + ' = ' + JSON.stringify(live <= 5000));
      expect(live <= 5000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#6 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();

      model.markError('lost', 35200002);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(frozen)");
      expect(model.getConnectionDuration()).assertEqual(frozen);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#8 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.ERROR);

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#9 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0014',
        '#10 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0014', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_MODEL_1500
     * @tc.name: testA2dpModel0015
     * @tc.desc: Verify reset clears session data while the audio settings and device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0015', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('broken', 35200005);
      model.updateData(buildPayload('aptX', 70, true));
      model.volume = 33;
      model.isPlaying = true;
      model.codec = 2;
      model.bitRate = 320000;
      model.playbackPosition = 9000;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#4 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#5 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#8 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#9 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#10 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#11 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#12 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#13 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(33);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#14 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#15 ' + "model.codec" + ' = ' + JSON.stringify(model.codec));
      expect(model.codec).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#16 ' + "model.bitRate" + ' = ' + JSON.stringify(model.bitRate));
      expect(model.bitRate).assertEqual(320000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#17 ' + "model.playbackPosition" + ' = ' + JSON.stringify(model.playbackPosition));
      expect(model.playbackPosition).assertEqual(9000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#18 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#19 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#20 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0015',
        '#21 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0015', 'end');
    });

    // ==================== serialize and text describe describe (1 cases) ====================

    /*
     * @tc.number: SUB_A2DP_MODEL_1600
     * @tc.name: testA2dpModel0016
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit audio settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpModel0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0016', 'begin');
      const model: A2dpModel = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('dropped', 35200004);
      model.volume = 42;
      model.codec = 3;

      const json: A2dpModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(A2dpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('dropped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#9 assert ' + "expect(serialized.indexOf('volume')).assertEqual(-1)");
      expect(serialized.indexOf('volume')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#10 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#11 assert ' + "expect(serialized.indexOf('isInitialized')).assertEqual(-1)");
      expect(serialized.indexOf('isInitialized')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#12 assert ' + "expect(summary.indexOf('A2dpModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('A2dpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#16 assert ' + "expect(summary.indexOf('volume')).assertEqual(-1)");
      expect(summary.indexOf('volume')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpModel0016',
        '#17 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpModel0016', 'end');
    });
  });
}
