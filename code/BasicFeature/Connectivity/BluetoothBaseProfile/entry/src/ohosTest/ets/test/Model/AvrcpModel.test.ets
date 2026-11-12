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
import { AvrcpModel, AvrcpState, BluetoothConnectionState } from 'library';

const DEVICE_ID: string = 'avrcp_model_device';
const SIBLING_ID: string = 'sibling_avrcp_device';
const MAX_LOG: number = 200;
const DEFAULT_PLAYBACK_STATE: string = 'stopped';
const DEFAULT_VOLUME: number = 50;

interface AvrcpDataPayload {
  playbackState: string;
  trackName: string;
  artistName: string;
  albumName: string;
  position: number;
  duration: number;
  volume: number;
  playlistCount: number;
  currentTrackIndex: number;
}

/**
 * structure build a complete AVRCP media control data payload.
 * @param {string} playbackState - playback state
 * @param {string} trackName - track item name name
 * @param {number} position - playback position
 * @returns {AvrcpDataPayload} data payload
 */
function buildPayload(playbackState: string, trackName: string, position: number): AvrcpDataPayload {
  return {
    playbackState: playbackState,
    trackName: trackName,
    artistName: 'Sample Artist',
    albumName: 'Sample Album',
    position: position,
    duration: 214000,
    volume: 65,
    playlistCount: 18,
    currentTrackIndex: 3
  };
}

/**
 * read day log last internal content (remove drop timestamp prefix).
 * @param {AvrcpModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
 */
function lastLog(model: AvrcpModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for AvrcpModel
 * @since 26.0.0
 */
export default function avrcpModelTest(): void {
  describe('AvrcpModelTest', () => {
    // ==================== structure build and instance isolation (2 cases) ====================

    /*
     * @tc.number: SUB_AVRCP_MODEL_0100
     * @tc.name: testAvrcpModel0001
     * @tc.desc: Verify the default field values of an AVRCP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0001', 0, () => {
      const before: number = Date.now();
      const model = new AvrcpModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.playbackState).assertEqual(DEFAULT_PLAYBACK_STATE);
      expect(model.trackName).assertEqual('');
      expect(model.artistName).assertEqual('');
      expect(model.albumName).assertEqual('');
      expect(model.position).assertEqual(0);
      expect(model.duration).assertEqual(0);
      expect(model.volume).assertEqual(DEFAULT_VOLUME);
      expect(model.playlistCount).assertEqual(0);
      expect(model.currentTrackIndex).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    });

    /*
     * @tc.number: SUB_AVRCP_MODEL_0200
     * @tc.name: testAvrcpModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own media metadata and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0002', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      const sibling = new AvrcpModel(SIBLING_ID);

      model.playbackState = 'playing';
      model.trackName = 'First Track';
      model.volume = 80;
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(sibling.playbackState).assertEqual(DEFAULT_PLAYBACK_STATE);
      expect(sibling.trackName).assertEqual('');
      expect(sibling.volume).assertEqual(DEFAULT_VOLUME);
      expect(sibling.currentTrackIndex).assertEqual(0);
      expect(sibling.getLogs().length).assertEqual(0);
      expect(model.toString().indexOf('AvrcpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_AVRCP_MODEL_0300
     * @tc.name: testAvrcpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0003', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(AvrcpState.CONNECTING);
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
     * @tc.number: SUB_AVRCP_MODEL_0400
     * @tc.name: testAvrcpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0004', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('absolute volume unsupported', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(AvrcpState.CONNECTED);
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
     * @tc.number: SUB_AVRCP_MODEL_0500
     * @tc.name: testAvrcpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0005', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(AvrcpState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
    });

    /*
     * @tc.number: SUB_AVRCP_MODEL_0600
     * @tc.name: testAvrcpModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpModel0006', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);

      model.markError('pass play notification lost', 35200004);
      expect(model.state).assertEqual(AvrcpState.ERROR);
      expect(model.errorMessage).assertEqual('pass play notification lost');
      expect(model.errorCode).assertEqual(35200004);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: pass play notification lost');

      model.markError('pass play notification lost', 35200004);
      model.markError('pass play notification lost', 35200004);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('pass play notification lost', 35200004);
      expect(model.retryCount).assertEqual(4);
      expect(model.canRetry()).assertFalse();
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(0);
    });

    // ==================== operation log row for (2 cases) ====================

    /*
     * @tc.number: SUB_AVRCP_MODEL_0700
     * @tc.name: testAvrcpModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0007', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
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
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(model.volume).assertEqual(DEFAULT_VOLUME);
    });

    /*
     * @tc.number: SUB_AVRCP_MODEL_0800
     * @tc.name: testAvrcpModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpModel0008', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
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
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== data payload and state entry (2 cases) ====================

    /*
     * @tc.number: SUB_AVRCP_MODEL_0900
     * @tc.name: testAvrcpModel0009
     * @tc.desc: Verify updating media data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpModel0009', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: AvrcpDataPayload = buildPayload('playing', 'Night Drive', 48000);
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.playbackState).assertEqual('playing');
      expect(stored.trackName).assertEqual('Night Drive');
      expect(stored.artistName).assertEqual('Sample Artist');
      expect(stored.albumName).assertEqual('Sample Album');
      expect(stored.position).assertEqual(48000);
      expect(stored.duration).assertEqual(214000);
      expect(stored.volume).assertEqual(65);
      expect(stored.playlistCount).assertEqual(18);
      expect(stored.currentTrackIndex).assertEqual(3);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.position = 96000;
      expect(stored.position).assertEqual(96000);
      expect(model.position).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_MODEL_1000
     * @tc.name: testAvrcpModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpModel0010', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      expect(model.isConnecting()).assertTrue();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.data).assertEqual(null);
    });

    // ==================== reset and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_AVRCP_MODEL_1100
     * @tc.name: testAvrcpModel0011
     * @tc.desc: Verify reset clears session data while media metadata and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpModel0011', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('notification window closed', 35200002);
      model.updateData(buildPayload('paused', 'Open Road', 12000));
      model.playbackState = 'paused';
      model.trackName = 'Open Road';
      model.volume = 22;
      model.currentTrackIndex = 5;
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.playbackState).assertEqual('paused');
      expect(model.trackName).assertEqual('Open Road');
      expect(model.volume).assertEqual(22);
      expect(model.currentTrackIndex).assertEqual(5);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
    });

    /*
     * @tc.number: SUB_AVRCP_MODEL_1200
     * @tc.name: testAvrcpModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit media metadata.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpModel0012', 0, () => {
      const model = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('element id invalid', 35200005);
      model.trackName = 'Hidden Track';
      model.volume = 31;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(AvrcpState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('element id invalid');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('trackName')).assertEqual(-1);
      expect(serialized.indexOf('volume')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('AvrcpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
