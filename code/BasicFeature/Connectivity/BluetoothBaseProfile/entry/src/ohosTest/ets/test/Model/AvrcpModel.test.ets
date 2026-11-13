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
import { AvrcpModel, AvrcpState, BluetoothConnectionState, AvrcpData, AvrcpModelJson } from 'library';

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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0001', 'begin');
      const before: number = Date.now();
      const model: AvrcpModel = new AvrcpModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#11 ' + "model.playbackState" + ' = ' + JSON.stringify(model.playbackState));
      expect(model.playbackState).assertEqual(DEFAULT_PLAYBACK_STATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#12 ' + "model.trackName" + ' = ' + JSON.stringify(model.trackName));
      expect(model.trackName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#13 ' + "model.artistName" + ' = ' + JSON.stringify(model.artistName));
      expect(model.artistName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#14 ' + "model.albumName" + ' = ' + JSON.stringify(model.albumName));
      expect(model.albumName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#15 ' + "model.position" + ' = ' + JSON.stringify(model.position));
      expect(model.position).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#16 ' + "model.duration" + ' = ' + JSON.stringify(model.duration));
      expect(model.duration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#17 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#18 ' + "model.playlistCount" + ' = ' + JSON.stringify(model.playlistCount));
      expect(model.playlistCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#19 ' + "model.currentTrackIndex" + ' = ' + JSON.stringify(model.currentTrackIndex));
      expect(model.currentTrackIndex).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#20 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#21 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#22 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0001',
        '#23 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0002', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      const sibling: AvrcpModel = new AvrcpModel(SIBLING_ID);

      model.playbackState = 'playing';
      model.trackName = 'First Track';
      model.volume = 80;
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#4 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#5 ' + "sibling.state" + ' = ' + JSON.stringify(sibling.state));
      expect(sibling.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#6 ' + "sibling.playbackState" + ' = ' + JSON.stringify(sibling.playbackState));
      expect(sibling.playbackState).assertEqual(DEFAULT_PLAYBACK_STATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#7 ' + "sibling.trackName" + ' = ' + JSON.stringify(sibling.trackName));
      expect(sibling.trackName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#8 ' + "sibling.volume" + ' = ' + JSON.stringify(sibling.volume));
      expect(sibling.volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#9 ' + "sibling.currentTrackIndex" + ' = ' + JSON.stringify(sibling.currentTrackIndex));
      expect(sibling.currentTrackIndex).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#10 assert ' + "expect(sibling.getLogs().length).assertEqual(0)");
      expect(sibling.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0002',
        '#11 assert ' +
        "expect(model.toString().indexOf('AvrcpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('AvrcpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0003', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0004', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('absolute volume unsupported', 35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0005', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#9 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0005',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0006', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);

      model.markError('pass play notification lost', 35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('pass play notification lost');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: pass play notification lost')");
      expect(lastLog(model)).assertEqual('Error: pass play notification lost');

      model.markError('pass play notification lost', 35200004);
      model.markError('pass play notification lost', 35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#9 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markError('pass play notification lost', 35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#11 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#14 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0006',
        '#15 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0007', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#7 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0007',
        '#10 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(DEFAULT_VOLUME);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0008', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0008',
        '#12 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0009', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: AvrcpDataPayload = buildPayload('playing', 'Night Drive', 48000);
      model.updateData(payload);

      const stored: AvrcpData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#3 ' + "stored.playbackState" + ' = ' + JSON.stringify(stored.playbackState));
        expect(stored.playbackState).assertEqual('playing');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#4 ' + "stored.trackName" + ' = ' + JSON.stringify(stored.trackName));
        expect(stored.trackName).assertEqual('Night Drive');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#5 ' + "stored.artistName" + ' = ' + JSON.stringify(stored.artistName));
        expect(stored.artistName).assertEqual('Sample Artist');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#6 ' + "stored.albumName" + ' = ' + JSON.stringify(stored.albumName));
        expect(stored.albumName).assertEqual('Sample Album');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#7 ' + "stored.position" + ' = ' + JSON.stringify(stored.position));
        expect(stored.position).assertEqual(48000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#8 ' + "stored.duration" + ' = ' + JSON.stringify(stored.duration));
        expect(stored.duration).assertEqual(214000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#9 ' + "stored.volume" + ' = ' + JSON.stringify(stored.volume));
        expect(stored.volume).assertEqual(65);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#10 ' + "stored.playlistCount" + ' = ' + JSON.stringify(stored.playlistCount));
        expect(stored.playlistCount).assertEqual(18);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#11 ' + "stored.currentTrackIndex" + ' = ' + JSON.stringify(stored.currentTrackIndex));
        expect(stored.currentTrackIndex).assertEqual(3);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#14 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#15 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.position = 96000;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
          '#16 ' + "stored.position" + ' = ' + JSON.stringify(stored.position));
        expect(stored.position).assertEqual(96000);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0009',
        '#17 ' + "model.position" + ' = ' + JSON.stringify(model.position));
      expect(model.position).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0010', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#3 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#4 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#5 ' + "model.lastUpdateTime >= before" + ' = ' + JSON.stringify(model.lastUpdateTime >= before));
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#10 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#11 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#12 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0010',
        '#13 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0011', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('notification window closed', 35200002);
      model.updateData(buildPayload('paused', 'Open Road', 12000));
      model.playbackState = 'paused';
      model.trackName = 'Open Road';
      model.volume = 22;
      model.currentTrackIndex = 5;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(AvrcpState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#11 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#12 ' + "model.playbackState" + ' = ' + JSON.stringify(model.playbackState));
      expect(model.playbackState).assertEqual('paused');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#13 ' + "model.trackName" + ' = ' + JSON.stringify(model.trackName));
      expect(model.trackName).assertEqual('Open Road');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#14 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(22);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#15 ' + "model.currentTrackIndex" + ' = ' + JSON.stringify(model.currentTrackIndex));
      expect(model.currentTrackIndex).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#16 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0011',
        '#17 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0012', 'begin');
      const model: AvrcpModel = new AvrcpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('element id invalid', 35200005);
      model.trackName = 'Hidden Track';
      model.volume = 31;

      const json: AvrcpModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(AvrcpState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('element id invalid');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#9 assert ' + "expect(serialized.indexOf('trackName')).assertEqual(-1)");
      expect(serialized.indexOf('trackName')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#10 assert ' + "expect(serialized.indexOf('volume')).assertEqual(-1)");
      expect(serialized.indexOf('volume')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#12 assert ' + "expect(summary.indexOf('AvrcpModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('AvrcpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpModel0012',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpModel0012', 'end');
    });
  });
}
