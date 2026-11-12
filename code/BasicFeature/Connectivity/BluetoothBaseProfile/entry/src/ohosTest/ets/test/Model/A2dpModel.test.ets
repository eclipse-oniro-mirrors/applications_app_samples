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
import { A2dpModel, A2dpState, BluetoothConnectionState } from 'library';

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
      const before: number = Date.now();
      const model = new A2dpModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isPlaying).assertFalse();
      expect(model.volume).assertEqual(50);
      expect(model.codec).assertEqual(0);
      expect(model.bitRate).assertEqual(0);
      expect(model.playbackPosition).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
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
      const model = new A2dpModel(DEVICE_ID);
      const blank = new A2dpModel();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(blank.deviceId).assertEqual('');
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(model.canRetry()).assertTrue();
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.toString().indexOf('A2dpModel[deviceId=' + DEVICE_ID + ', state=disconnected')).assertEqual(0);
      expect(blank.toString().indexOf('deviceId=,')).assertEqual(10);
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
      const model = new A2dpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(A2dpState.CONNECTING);
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
     * @tc.number: SUB_A2DP_MODEL_0400
     * @tc.name: testA2dpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0004', 0, () => {
      const model = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('Pairing failed', 35200009);
      expect(model.retryCount).assertEqual(1);

      model.markConnected();

      expect(model.state).assertEqual(A2dpState.CONNECTED);
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
     * @tc.number: SUB_A2DP_MODEL_0500
     * @tc.name: testA2dpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpModel0005', 0, () => {
      const model = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      const stored: number = model.connectionDuration;
      const connectedDuration: number = model.getConnectionDuration();

      model.markDisconnecting();
      expect(model.state).assertEqual(A2dpState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(connectedDuration >= stored).assertTrue();
      expect(connectedDuration < 5000).assertTrue();
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
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
      const model = new A2dpModel(DEVICE_ID);

      model.markError('Stream start timeout', 35200004);
      expect(model.state).assertEqual(A2dpState.ERROR);
      expect(model.errorMessage).assertEqual('Stream start timeout');
      expect(model.errorCode).assertEqual(35200004);
      expect(model.retryCount).assertEqual(1);
      expect(model.isConnected()).assertFalse();
      expect(lastLog(model)).assertEqual('Error: Stream start timeout');

      model.markError('Stream start timeout', 35200004);
      expect(model.retryCount).assertEqual(2);
      expect(model.state).assertEqual(A2dpState.ERROR);
      expect(model.getLogs().length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
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
      const model = new A2dpModel(DEVICE_ID);
      expect(model.canRetry()).assertTrue();

      model.markError('fail 1', 35200001);
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(1);

      model.markError('fail 2', 35200001);
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(2);

      model.markError('fail 3', 35200001);
      expect(model.canRetry()).assertFalse();
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);

      model.markError('fail 4', 35200001);
      expect(model.retryCount).assertEqual(4);
      expect(model.canRetry()).assertFalse();

      model.markConnected();
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(0);
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
      const model = new A2dpModel(DEVICE_ID);

      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      expect(logs.length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
      expect(logs[0].indexOf('[')).assertEqual(0);
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      expect(logs[1].indexOf('T')).assertLarger(0);
      expect(logs[1].indexOf('Z] ')).assertLarger(0);
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.deviceId).assertEqual(DEVICE_ID);
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
      const model = new A2dpModel(DEVICE_ID);
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
      const model = new A2dpModel(DEVICE_ID);
      model.addLog('alpha');
      model.addLog('beta');

      const copy = model.getLogs();
      copy.push('injected');
      expect(copy.length).assertEqual(3);
      expect(model.getLogs().length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);

      model.clearLogs();
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(2);
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(3);
      expect(lastLog(model)).assertEqual('gamma');
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
      const model = new A2dpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: A2dpDataPayload = buildPayload('LDAC', 80, true);
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.codec).assertEqual('LDAC');
      expect(stored.sampleRate).assertEqual(44100);
      expect(stored.bitRate).assertEqual(320000);
      expect(stored.volume).assertEqual(80);
      expect(stored.isPlaying).assertTrue();
      expect(stored.audioSourceName).assertEqual('Phone Music');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.lastUpdateTime >= created).assertTrue();
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
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
      const model = new A2dpModel(DEVICE_ID);
      const payload: A2dpDataPayload = buildPayload('SBC', 20, false);
      model.updateData(payload);

      payload.volume = 66;
      payload.isPlaying = true;

      const stored: ESObject = model.data;
      expect(stored.volume).assertEqual(66);
      expect(stored.isPlaying).assertTrue();
      expect(stored.codec).assertEqual('SBC');

      const second: A2dpDataPayload = buildPayload('AAC', 30, true);
      model.updateData(second);
      const replaced: ESObject = model.data;
      expect(replaced.codec).assertEqual('AAC');
      expect(replaced.volume).assertEqual(30);
      expect(stored.codec).assertEqual('SBC');
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
      const model = new A2dpModel(DEVICE_ID);

      model.updateConnectionState(BluetoothConnectionState.CONNECTING);
      expect(model.state).assertEqual(A2dpState.CONNECTING);
      expect(model.getLogs().length).assertEqual(1);

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(A2dpState.CONNECTED);
      expect(model.isConnected()).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      expect(model.state).assertEqual(A2dpState.DISCONNECTING);

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);
      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.operationCount).assertEqual(4);
      expect(model.errorMessage).assertEqual('');
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
      const model = new A2dpModel(DEVICE_ID);
      expect(model.getConnectionDuration()).assertEqual(0);

      model.markConnecting();
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.connectionStartTime > 0).assertTrue();

      model.markConnected();
      const frozen: number = model.connectionDuration;
      const live: number = model.getConnectionDuration();
      expect(live >= frozen).assertTrue();
      expect(live <= 5000).assertTrue();
      expect(model.connectionStartTime > 0).assertTrue();

      model.markError('lost', 35200002);
      expect(model.getConnectionDuration()).assertEqual(frozen);
      expect(model.state).assertEqual(A2dpState.ERROR);

      model.markDisconnected();
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
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
      const model = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('broken', 35200005);
      model.updateData(buildPayload('aptX', 70, true));
      model.volume = 33;
      model.isPlaying = true;
      model.codec = 2;
      model.bitRate = 320000;
      model.playbackPosition = 9000;
      expect(model.getLogs().length).assertEqual(3);
      expect(model.operationCount).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(A2dpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.volume).assertEqual(33);
      expect(model.isPlaying).assertTrue();
      expect(model.codec).assertEqual(2);
      expect(model.bitRate).assertEqual(320000);
      expect(model.playbackPosition).assertEqual(9000);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
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
      const model = new A2dpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('dropped', 35200004);
      model.volume = 42;
      model.codec = 3;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(A2dpState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('dropped');
      expect(json.errorCode).assertEqual(35200004);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('volume')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);
      expect(serialized.indexOf('isInitialized')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('A2dpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.indexOf('volume')).assertEqual(-1);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
