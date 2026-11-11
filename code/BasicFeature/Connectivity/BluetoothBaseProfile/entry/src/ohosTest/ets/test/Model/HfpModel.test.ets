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
import { HfpModel, HfpState, BluetoothConnectionState } from 'library';

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
 * 构造一份完整的 HFP 通话数据载荷。
 * @param {string} callState - 通话状态文本
 * @param {number} speakerVolume - 扬声器音量
 * @param {string} carrierName - 运营商名称
 * @returns {HfpDataPayload} 数据载荷
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
 * 读取日志末条内容（去掉时间戳前缀）。
 * @param {HfpModel} model - 被测模型
 * @returns {string} 末条日志正文，无日志时返回空串
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
    // ==================== 构造与默认值（2 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0100
     * @tc.name: testHfpModel0001
     * @tc.desc: Verify the default field values of an HFP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0001', 0, () => {
      const before: number = Date.now();
      const model = new HfpModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.callState).assertEqual(DEFAULT_CALL_STATE);
      expect(model.phoneNumber).assertEqual('');
      expect(model.callDuration).assertEqual(0);
      expect(model.isMuted).assertFalse();
      expect(model.isSpeakerOn).assertFalse();
      expect(model.speakerVolume).assertEqual(DEFAULT_VOLUME);
      expect(model.micVolume).assertEqual(DEFAULT_VOLUME);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
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
      const model = new HfpModel(DEVICE_ID);
      const other = new HfpModel('other_device');
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(other.deviceId).assertEqual('other_device');
      expect(other.state).assertEqual(HfpState.DISCONNECTED);
      expect(other.getLogs().length).assertEqual(0);
      expect(other.operationCount).assertEqual(0);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertTrue();
      expect(model.canRetry()).assertTrue();
      expect(model.toString().indexOf('HfpModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== 连接状态迁移（4 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0300
     * @tc.name: testHfpModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0003', 0, () => {
      const model = new HfpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(HfpState.CONNECTING);
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
     * @tc.number: SUB_HFP_MODEL_0400
     * @tc.name: testHfpModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0004', 0, () => {
      const model = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('SLC connection failed', ERROR_CALL_FAILED);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(ERROR_CALL_FAILED);

      model.markConnected();

      expect(model.state).assertEqual(HfpState.CONNECTED);
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
     * @tc.number: SUB_HFP_MODEL_0500
     * @tc.name: testHfpModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0005', 0, () => {
      const model = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      const frozen: number = model.connectionDuration;

      model.markDisconnecting();
      expect(model.state).assertEqual(HfpState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');
      expect(model.getConnectionDuration()).assertEqual(frozen);

      model.markDisconnected();
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
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
      const model = new HfpModel(DEVICE_ID);

      model.markError('Dial failure', 35200008);
      expect(model.state).assertEqual(HfpState.ERROR);
      expect(model.errorMessage).assertEqual('Dial failure');
      expect(model.errorCode).assertEqual(35200008);
      expect(model.retryCount).assertEqual(1);
      expect(model.isConnected()).assertFalse();
      expect(lastLog(model)).assertEqual('Error: Dial failure');

      model.markError('Dial failure', 35200008);
      expect(model.retryCount).assertEqual(2);
      expect(model.state).assertEqual(HfpState.ERROR);
      expect(model.getLogs().length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
    });

    // ==================== 重试能力边界（1 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0700
     * @tc.name: testHfpModel0007
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0007', 0, () => {
      const model = new HfpModel(DEVICE_ID);
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

    // ==================== 操作日志行为（3 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_0800
     * @tc.name: testHfpModel0008
     * @tc.desc: Verify each appended log carries an ISO timestamp prefix and raises the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0008', 0, () => {
      const model = new HfpModel(DEVICE_ID);

      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      expect(logs.length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
      expect(logs[0].indexOf('[')).assertEqual(0);
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      expect(logs[1].indexOf('T')).assertLarger(0);
      expect(logs[1].indexOf('Z] ')).assertLarger(0);
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.deviceId).assertEqual(DEVICE_ID);
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
      const model = new HfpModel(DEVICE_ID);
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
     * @tc.number: SUB_HFP_MODEL_1000
     * @tc.name: testHfpModel0010
     * @tc.desc: Verify the returned log array is a copy and clearing logs keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0010', 0, () => {
      const model = new HfpModel(DEVICE_ID);
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
      expect(model.state).assertEqual(HfpState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(3);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== 通话与音频字段（3 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_1100
     * @tc.name: testHfpModel0011
     * @tc.desc: Verify direct call and audio field updates stay independent from the data payload.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpModel0011', 0, () => {
      const model = new HfpModel(DEVICE_ID);

      model.callState = 2;
      model.phoneNumber = '13912345678';
      model.callDuration = 300;
      model.isMuted = true;
      model.isSpeakerOn = true;
      model.speakerVolume = 15;
      model.micVolume = 8;

      expect(model.callState).assertEqual(2);
      expect(model.phoneNumber).assertEqual('13912345678');
      expect(model.callDuration).assertEqual(300);
      expect(model.isMuted).assertTrue();
      expect(model.isSpeakerOn).assertTrue();
      expect(model.speakerVolume).assertEqual(15);
      expect(model.micVolume).assertEqual(8);
      expect(model.data).assertEqual(null);
      expect(model.operationCount).assertEqual(0);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.state).assertEqual(HfpState.DISCONNECTED);

      const sibling = new HfpModel('sibling_device');
      expect(sibling.callState).assertEqual(DEFAULT_CALL_STATE);
      expect(sibling.phoneNumber).assertEqual('');
      expect(sibling.isMuted).assertFalse();
      expect(sibling.speakerVolume).assertEqual(DEFAULT_VOLUME);
      expect(sibling.micVolume).assertEqual(DEFAULT_VOLUME);
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
      const model = new HfpModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      model.updateData(buildPayload('incoming', 15, 'China Mobile'));

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.callState).assertEqual('incoming');
      expect(stored.phoneNumber).assertEqual('13800000000');
      expect(stored.callDuration).assertEqual(126);
      expect(stored.speakerVolume).assertEqual(15);
      expect(stored.micVolume).assertEqual(12);
      expect(stored.batteryLevel).assertEqual(88);
      expect(stored.networkSignal).assertEqual(4);
      expect(stored.carrierName).assertEqual('China Mobile');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.lastUpdateTime >= created).assertTrue();
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
      const model = new HfpModel(DEVICE_ID);
      const payload: HfpDataPayload = buildPayload('active', 10, 'China Unicom');
      model.updateData(payload);

      payload.speakerVolume = 3;
      payload.isMuted = true;

      const stored: ESObject = model.data;
      expect(stored.speakerVolume).assertEqual(3);
      expect(stored.isMuted).assertTrue();
      expect(stored.callState).assertEqual('active');
      expect(model.speakerVolume).assertEqual(DEFAULT_VOLUME);

      const second: HfpDataPayload = buildPayload('held', 7, 'China Telecom');
      model.updateData(second);
      const replaced: ESObject = model.data;
      expect(replaced.callState).assertEqual('held');
      expect(replaced.carrierName).assertEqual('China Telecom');
      expect(stored.callState).assertEqual('active');
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
      const model = new HfpModel(DEVICE_ID);

      model.updateConnectionState(BluetoothConnectionState.CONNECTING);
      expect(model.state).assertEqual(HfpState.CONNECTING);
      expect(model.getLogs().length).assertEqual(1);

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(HfpState.CONNECTED);
      expect(model.isConnected()).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      expect(model.state).assertEqual(HfpState.DISCONNECTING);

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);
      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.operationCount).assertEqual(4);
      expect(model.errorMessage).assertEqual('');
    });

    // ==================== 重置语义与序列化（2 条） ====================

    /*
     * @tc.number: SUB_HFP_MODEL_1500
     * @tc.name: testHfpModel0015
     * @tc.desc: Verify reset clears session data while call attributes and audio settings survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpModel0015', 0, () => {
      const model = new HfpModel(DEVICE_ID);
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
      expect(model.getLogs().length).assertEqual(3);
      expect(model.operationCount).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(HfpState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.callState).assertEqual(3);
      expect(model.phoneNumber).assertEqual('13900000000');
      expect(model.callDuration).assertEqual(45);
      expect(model.isMuted).assertTrue();
      expect(model.isSpeakerOn).assertTrue();
      expect(model.speakerVolume).assertEqual(120);
      expect(model.micVolume).assertEqual(5);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
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
      const model = new HfpModel(DEVICE_ID);
      model.markConnecting();
      model.markError('network out of coverage', 35200010);
      model.speakerVolume = 7;
      model.micVolume = 2;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(HfpState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('network out of coverage');
      expect(json.errorCode).assertEqual(35200010);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('speakerVolume')).assertEqual(-1);
      expect(serialized.indexOf('micVolume')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('HfpModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
