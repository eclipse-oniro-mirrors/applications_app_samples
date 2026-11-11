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
import {
  BluetoothConnectionState,
  HfpConnectionState,
  HfpService
} from 'library';

const TEST_DEVICE_A: string = 'hfp_test_device_a';
const TEST_DEVICE_B: string = 'hfp_test_device_b';
const PRIMARY_NUMBER: string = '10086';
const SECOND_NUMBER: string = '10010';
const CALL_STATE_DIALING: number = 2;
const CALL_STATE_ACTIVE: number = 1;
const CALL_STATE_HOLD: number = 3;
const CALL_STATE_ENDED: number = 4;
const CALL_STATE_REJECTED: number = 6;

interface AudioSnapshot {
  micVolume: number;
  speakerVolume: number;
  isMuted: boolean;
  isSpeakerOn: boolean;
  echoCancellation: boolean;
  noiseSuppression: boolean;
  voiceCodec: string;
  sampleRate: number;
  widebandSpeech: boolean;
  audioRouting: string;
}

interface NetworkSnapshot {
  carrierName: string;
  signalStrength: number;
  networkType: string;
  registrationStatus: number;
  isRoaming: boolean;
  volteAvailable: boolean;
  mcc: string;
  mnc: string;
}

interface CallSnapshot {
  exists: boolean;
  callState: number;
  phoneNumber: string;
  callDirection: string;
  isOnHold: boolean;
  participantCount: number;
  durationSec: number;
  endTime: number;
  networkType: string;
  echoCancellation: boolean;
  noiseReduction: boolean;
  hdVoiceEnabled: boolean;
}

interface HfpStatsSnapshot {
  serviceName: string;
  isInitialized: boolean;
  connectionState: string;
  hfpState: string;
  connectedDeviceCount: number;
  activeCallCount: number;
  totalCallsInHistory: number;
  voiceRecognitionActive: boolean;
  inBandRinging: boolean;
  threeWayCalling: boolean;
  operationHistoryCount: number;
  connectionCallbackCount: number;
  dataCallbackCount: number;
  callCallbackCount: number;
  audioCallbackCount: number;
}

interface HistoryEntrySnapshot {
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
}

/**
 * 读取音频配置快照，未初始化时用 -1 标记缺失值。
 * @param {HfpService} service - 被测服务
 * @returns {AudioSnapshot} 音频配置快照
 */
function audioSnapshot(service: HfpService): AudioSnapshot {
  const config = service.getAudioConfig();
  if (config === null) {
    return {
      micVolume: -1,
      speakerVolume: -1,
      isMuted: false,
      isSpeakerOn: false,
      echoCancellation: false,
      noiseSuppression: false,
      voiceCodec: '',
      sampleRate: -1,
      widebandSpeech: false,
      audioRouting: ''
    };
  }
  return {
    micVolume: config.micVolume,
    speakerVolume: config.speakerVolume,
    isMuted: config.isMuted,
    isSpeakerOn: config.isSpeakerOn,
    echoCancellation: config.echoCancellation,
    noiseSuppression: config.noiseSuppression,
    voiceCodec: config.voiceCodec,
    sampleRate: config.sampleRate,
    widebandSpeech: config.widebandSpeech,
    audioRouting: config.audioRouting
  };
}

/**
 * 读取网络信息快照，未初始化时用 -1 标记缺失值。
 * @param {HfpService} service - 被测服务
 * @returns {NetworkSnapshot} 网络信息快照
 */
function networkSnapshot(service: HfpService): NetworkSnapshot {
  const info = service.getNetworkInfo();
  if (info === null) {
    return {
      carrierName: '',
      signalStrength: 0,
      networkType: '',
      registrationStatus: -1,
      isRoaming: false,
      volteAvailable: false,
      mcc: '',
      mnc: ''
    };
  }
  return {
    carrierName: info.carrierName,
    signalStrength: info.signalStrength,
    networkType: info.networkType,
    registrationStatus: info.registrationStatus,
    isRoaming: info.isRoaming,
    volteAvailable: info.volteAvailable,
    mcc: info.mcc,
    mnc: info.mnc
  };
}

/**
 * 读取当前通话快照，无通话时 exists 为 false。
 * @param {HfpService} service - 被测服务
 * @returns {CallSnapshot} 通话快照
 */
function callSnapshot(service: HfpService): CallSnapshot {
  const call = service.getCurrentCall();
  if (call === null) {
    return {
      exists: false,
      callState: -1,
      phoneNumber: '',
      callDirection: '',
      isOnHold: false,
      participantCount: -1,
      durationSec: -1,
      endTime: -1,
      networkType: '',
      echoCancellation: false,
      noiseReduction: false,
      hdVoiceEnabled: false
    };
  }
  return {
    exists: true,
    callState: call.callState,
    phoneNumber: call.phoneNumber,
    callDirection: call.callDirection,
    isOnHold: call.isOnHold,
    participantCount: call.participantCount,
    durationSec: call.durationSec,
    endTime: call.endTime,
    networkType: call.networkType,
    echoCancellation: call.echoCancellation,
    noiseReduction: call.noiseReduction,
    hdVoiceEnabled: call.hdVoiceEnabled
  };
}

/**
 * 读取统计信息快照。getStatistics 返回 object，需通过 ESObject 读取字段。
 * @param {HfpService} service - 被测服务
 * @returns {HfpStatsSnapshot} 统计快照
 */
function statsSnapshot(service: HfpService): HfpStatsSnapshot {
  const stats: ESObject = service.getStatistics();
  const callbacks: ESObject = stats.callbackCounts;
  const snapshot: HfpStatsSnapshot = {
    serviceName: stats.serviceName,
    isInitialized: stats.isInitialized,
    connectionState: stats.connectionState,
    hfpState: stats.hfpState,
    connectedDeviceCount: stats.connectedDeviceCount,
    activeCallCount: stats.activeCallCount,
    totalCallsInHistory: stats.totalCallsInHistory,
    voiceRecognitionActive: stats.voiceRecognitionActive,
    inBandRinging: stats.inBandRinging,
    threeWayCalling: stats.threeWayCalling,
    operationHistoryCount: stats.operationHistoryCount,
    connectionCallbackCount: callbacks.connection,
    dataCallbackCount: callbacks.data,
    callCallbackCount: callbacks.call,
    audioCallbackCount: callbacks.audio
  };
  return snapshot;
}

/**
 * 读取最后一条操作历史，空历史返回空记录。
 * @param {HfpService} service - 被测服务
 * @returns {HistoryEntrySnapshot} 最后一条历史
 */
function lastHistory(service: HfpService): HistoryEntrySnapshot {
  const history = service.getOperationHistory();
  if (history.length === 0) {
    return { operation: '', timestamp: 0, success: false, details: '' };
  }
  const entry = history[history.length - 1];
  return {
    operation: entry.operation,
    timestamp: entry.timestamp,
    success: entry.success,
    details: entry.details
  };
}

/**
 * @description Test suite for HfpService
 * @since 26.0.0
 */
export default function hfpServiceTest(): void {
  describe('HfpServiceTest', () => {
    // ==================== 生命周期与初始化（4 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_0100
     * @tc.name: testHfpService0001
     * @tc.desc: Verify the default state of a newly created service before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0001', 0, () => {
      const service = new HfpService();

      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(service.isVoiceRecognitionActive()).assertFalse();
      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getCallHistory().length).assertEqual(0);
      expect(service.getNetworkInfo()).assertEqual(null);
      expect(service.getAudioConfig()).assertEqual(null);
      expect(service.getBatteryInfo()).assertEqual(null);

      const model = service.getModel();
      expect(model.callState).assertEqual(0);
      expect(model.phoneNumber).assertEqual('');
      expect(model.micVolume).assertEqual(50);
      expect(model.speakerVolume).assertEqual(50);

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertFalse();
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.operationHistoryCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0200
     * @tc.name: testHfpService0002
     * @tc.desc: Verify initialization creates default audio, network and battery configurations.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0002', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      const audio = audioSnapshot(service);
      expect(audio.micVolume).assertEqual(50);
      expect(audio.speakerVolume).assertEqual(50);
      expect(audio.isMuted).assertFalse();
      expect(audio.isSpeakerOn).assertFalse();
      expect(audio.echoCancellation).assertTrue();
      expect(audio.noiseSuppression).assertTrue();
      expect(audio.voiceCodec).assertEqual('CVSD');
      expect(audio.sampleRate).assertEqual(8000);
      expect(audio.widebandSpeech).assertFalse();
      expect(audio.audioRouting).assertEqual('bluetooth');

      const network = networkSnapshot(service);
      expect(network.carrierName).assertEqual('Mock Carrier');
      expect(network.signalStrength).assertEqual(-65);
      expect(network.networkType).assertEqual('4G');
      expect(network.registrationStatus).assertEqual(1);
      expect(network.isRoaming).assertFalse();
      expect(network.volteAvailable).assertTrue();
      expect(network.mcc).assertEqual('310');
      expect(network.mnc).assertEqual('260');

      const battery = service.getBatteryInfo();
      expect(battery === null).assertFalse();
      if (battery !== null) {
        expect(battery.level).assertEqual(85);
        expect(battery.isCharging).assertFalse();
        expect(battery.healthStatus).assertEqual('good');
        expect(battery.estimatedTimeMinutes).assertEqual(480);
        expect(battery.temperature).assertEqual(25);
        expect(battery.voltage).assertEqual(3800);
        expect(battery.chargeCycles).assertEqual(150);
      }

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertTrue();
      expect(stats.inBandRinging).assertTrue();
      expect(stats.threeWayCalling).assertTrue();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('initialize');
      expect(history.success).assertTrue();
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0300
     * @tc.name: testHfpService0003
     * @tc.desc: Verify a repeated initialization is rejected and recorded as a failed operation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0003', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.initialize()).assertFalse();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('initialize');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Already initialized');
      expect(service.getOperationHistory().length).assertEqual(2);

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertTrue();
      expect(audioSnapshot(service).micVolume).assertEqual(50);
      expect(service.isConnected()).assertFalse();
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0400
     * @tc.name: testHfpService0004
     * @tc.desc: Verify destroy clears all callback registrations and allows re-initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0004', 0, async () => {
      const service = new HfpService();
      let callbackCount: number = 0;
      const connectionCallback = (): void => {
        callbackCount += 1;
      };
      const dataCallback = (): void => {
        callbackCount += 1;
      };
      const callCallback = (): void => {
        callbackCount += 1;
      };

      expect(await service.initialize()).assertTrue();
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);

      const registered = statsSnapshot(service);
      expect(registered.connectionCallbackCount).assertEqual(1);
      expect(registered.dataCallbackCount).assertEqual(1);
      expect(registered.callCallbackCount).assertEqual(1);

      await service.destroy();

      const destroyed = statsSnapshot(service);
      expect(destroyed.isInitialized).assertFalse();
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      expect(destroyed.dataCallbackCount).assertEqual(0);
      expect(destroyed.callCallbackCount).assertEqual(0);
      expect(destroyed.audioCallbackCount).assertEqual(0);
      expect(callbackCount).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      expect(audioSnapshot(service).micVolume).assertEqual(50);

      expect(await service.initialize()).assertTrue();
      expect(statsSnapshot(service).isInitialized).assertTrue();
    });

    // ==================== 连接与断开（5 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_0500
     * @tc.name: testHfpService0005
     * @tc.desc: Verify connect is rejected before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0005', 0, async () => {
      const service = new HfpService();

      expect(await service.connect(TEST_DEVICE_A)).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Service not initialized');
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0600
     * @tc.name: testHfpService0006
     * @tc.desc: Verify connect rejects an empty device identifier.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0006', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect('')).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Invalid device ID');
      expect(service.getOperationHistory().length).assertEqual(2);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0700
     * @tc.name: testHfpService0007
     * @tc.desc: Verify a successful connection updates connection state, HFP state and statistics.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0007', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);
      expect(service.getModel().isConnected()).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(stats.hfpState).assertEqual(HfpConnectionState.SLC_CONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual(`Connected to ${TEST_DEVICE_A}`);
      expect(service.getModel().getLogs().length).assertEqual(1);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0800
     * @tc.name: testHfpService0008
     * @tc.desc: Verify reconnecting the same device is idempotent but recorded as already connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0008', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Already connected');
      expect(service.getOperationHistory().length).assertEqual(3);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_0900
     * @tc.name: testHfpService0009
     * @tc.desc: Verify disconnecting one of two connected devices keeps the service connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0009', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.connect(TEST_DEVICE_B)).assertTrue();
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(2);

      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);
      expect(service.getModel().isConnected()).assertTrue();
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual(`Disconnected from ${TEST_DEVICE_A}`);
    });

    // ==================== 断开守卫、重置与销毁（4 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_1000
     * @tc.name: testHfpService0010
     * @tc.desc: Verify disconnecting the last device resets model state and connection flags.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0010', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      expect(service.getModel().isConnected()).assertFalse();
      expect(service.getModel().getLogs().length).assertEqual(0);
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertTrue();
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1100
     * @tc.name: testHfpService0011
     * @tc.desc: Verify disconnect is rejected before initialization and for unknown devices.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0011', 0, async () => {
      const uninitialized = new HfpService();
      expect(await uninitialized.disconnect(TEST_DEVICE_A)).assertFalse();
      const uninitializedHistory = lastHistory(uninitialized);
      expect(uninitializedHistory.operation).assertEqual('disconnect');
      expect(uninitializedHistory.success).assertFalse();
      expect(uninitializedHistory.details).assertEqual('Not initialized');

      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.disconnect('unknown_device')).assertFalse();
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Device not connected');
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1200
     * @tc.name: testHfpService0012
     * @tc.desc: Verify reset clears connections and call state while restoring default audio config.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0012', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.setMicVolume(70)).assertTrue();
      expect(await service.setSpeakerVolume(20)).assertTrue();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      expect(await service.endCall()).assertTrue();
      expect(service.getCallHistory().length).assertEqual(1);

      await service.reset();

      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getCallHistory().length).assertEqual(0);
      expect(service.getActiveCallCount()).assertEqual(0);

      const audio = audioSnapshot(service);
      expect(audio.micVolume).assertEqual(50);
      expect(audio.speakerVolume).assertEqual(50);
      expect(audio.isMuted).assertFalse();

      const history = service.getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].success).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.totalCallsInHistory).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1300
     * @tc.name: testHfpService0013
     * @tc.desc: Verify destroy releases connections and registered callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0013', 0, async () => {
      const service = new HfpService();
      let callbackCount: number = 0;
      const connectionCallback = (): void => {
        callbackCount += 1;
      };
      const dataCallback = (): void => {
        callbackCount += 1;
      };
      const callCallback = (): void => {
        callbackCount += 1;
      };

      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);

      const registered = statsSnapshot(service);
      expect(registered.connectionCallbackCount).assertEqual(1);
      expect(registered.dataCallbackCount).assertEqual(1);
      expect(registered.callCallbackCount).assertEqual(1);

      await service.destroy();

      expect(service.isConnected()).assertFalse();
      expect(service.getCurrentCall()).assertEqual(null);
      expect(callbackCount).assertEqual(0);

      const destroyed = statsSnapshot(service);
      expect(destroyed.isInitialized).assertFalse();
      expect(destroyed.connectedDeviceCount).assertEqual(0);
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      expect(destroyed.dataCallbackCount).assertEqual(0);
      expect(destroyed.callCallbackCount).assertEqual(0);
      expect(destroyed.audioCallbackCount).assertEqual(0);
      expect(destroyed.operationHistoryCount).assertEqual(1);
    });

    // ==================== 通话管理（9 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_1400
     * @tc.name: testHfpService0014
     * @tc.desc: Verify all call controls are rejected when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0014', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.answerCall()).assertFalse();
      expect(await service.rejectCall()).assertFalse();
      expect(await service.endCall()).assertFalse();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertFalse();
      expect(await service.redialLastNumber()).assertFalse();
      expect(await service.holdCall()).assertFalse();
      expect(await service.resumeCall()).assertFalse();

      const history = service.getOperationHistory().slice(1);
      expect(history.length).assertEqual(7);
      expect(history[0].operation).assertEqual('answerCall');
      expect(history[1].operation).assertEqual('rejectCall');
      expect(history[2].operation).assertEqual('endCall');
      expect(history[3].operation).assertEqual('dialNumber');
      expect(history[4].operation).assertEqual('redial');
      expect(history[0].details).assertEqual('Not connected');
      expect(history[4].details).assertEqual('Not connected');
      expect(history[5].details).assertEqual('No active call');
      expect(history[6].details).assertEqual('No held call');

      expect(service.getActiveCallCount()).assertEqual(0);
      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getModel().callState).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1500
     * @tc.name: testHfpService0015
     * @tc.desc: Verify answerCall activates the call state without an incoming call record.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0015', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.answerCall()).assertTrue();
      expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      expect(service.getActiveCallCount()).assertEqual(1);
      expect(service.getCurrentCall()).assertEqual(null);

      const first = lastHistory(service);
      expect(first.operation).assertEqual('answerCall');
      expect(first.success).assertTrue();
      expect(first.details).assertEqual('Call answered');

      expect(await service.answerCall()).assertTrue();
      expect(service.getActiveCallCount()).assertEqual(2);
      expect(statsSnapshot(service).activeCallCount).assertEqual(2);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1600
     * @tc.name: testHfpService0016
     * @tc.desc: Verify dialNumber creates an outgoing call with expected metadata.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0016', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const call = callSnapshot(service);
      expect(call.exists).assertTrue();
      expect(call.phoneNumber).assertEqual(PRIMARY_NUMBER);
      expect(call.callState).assertEqual(CALL_STATE_DIALING);
      expect(call.callDirection).assertEqual('outgoing');
      expect(call.participantCount).assertEqual(1);
      expect(call.isOnHold).assertFalse();
      expect(call.durationSec).assertEqual(0);
      expect(call.endTime).assertEqual(0);
      expect(call.networkType).assertEqual('4G');
      expect(call.echoCancellation).assertTrue();
      expect(call.noiseReduction).assertTrue();
      expect(call.hdVoiceEnabled).assertFalse();

      const model = service.getModel();
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      expect(model.phoneNumber).assertEqual(PRIMARY_NUMBER);
      expect(service.getActiveCallCount()).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('dialNumber');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual(`Dialing ${PRIMARY_NUMBER}`);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1700
     * @tc.name: testHfpService0017
     * @tc.desc: Verify dialNumber rejects an empty phone number and keeps state idle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0017', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.dialNumber('')).assertFalse();
      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getModel().callState).assertEqual(0);
      expect(service.getModel().phoneNumber).assertEqual('');
      expect(service.getActiveCallCount()).assertEqual(0);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('dialNumber');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Empty phone number');
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1800
     * @tc.name: testHfpService0018
     * @tc.desc: Verify holdCall and resumeCall switch the call hold flag and model state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0018', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      expect(await service.holdCall()).assertTrue();
      expect(callSnapshot(service).isOnHold).assertTrue();
      expect(service.getModel().callState).assertEqual(CALL_STATE_HOLD);
      const holdHistory = lastHistory(service);
      expect(holdHistory.operation).assertEqual('holdCall');
      expect(holdHistory.success).assertTrue();
      expect(holdHistory.details).assertEqual('Call on hold');

      expect(await service.resumeCall()).assertTrue();
      expect(callSnapshot(service).isOnHold).assertFalse();
      expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      const resumeHistory = lastHistory(service);
      expect(resumeHistory.operation).assertEqual('resumeCall');
      expect(resumeHistory.success).assertTrue();
      expect(resumeHistory.details).assertEqual('Call resumed');
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_1900
     * @tc.name: testHfpService0019
     * @tc.desc: Verify holdCall and resumeCall guards reject calls in the wrong state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0019', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.holdCall()).assertFalse();
      expect(lastHistory(service).details).assertEqual('No active call');
      expect(await service.resumeCall()).assertFalse();
      expect(lastHistory(service).details).assertEqual('No held call');

      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      expect(await service.resumeCall()).assertFalse();
      expect(lastHistory(service).details).assertEqual('No held call');
      expect(service.getModel().callState).assertEqual(CALL_STATE_DIALING);
      expect(service.getOperationHistory().length).assertEqual(6);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2000
     * @tc.name: testHfpService0020
     * @tc.desc: Verify endCall archives the call record and clears the active call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0020', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      expect(await service.endCall()).assertTrue();

      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getModel().callState).assertEqual(0);
      expect(service.getModel().phoneNumber).assertEqual('');
      expect(service.getModel().callDuration).assertEqual(0);
      expect(service.getActiveCallCount()).assertEqual(0);

      const records = service.getCallHistory();
      expect(records.length).assertEqual(1);
      expect(records[0].callState).assertEqual(CALL_STATE_ENDED);
      expect(records[0].phoneNumber).assertEqual(PRIMARY_NUMBER);
      expect(records[0].endTime > 0).assertTrue();
      expect(records[0].endTime >= records[0].startTime).assertTrue();
      expect(records[0].durationSec)
        .assertEqual(Math.floor((records[0].endTime - records[0].startTime) / 1000));
      expect(statsSnapshot(service).totalCallsInHistory).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('endCall');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Call ended');
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2100
     * @tc.name: testHfpService0021
     * @tc.desc: Verify rejectCall archives the call as rejected and resets call state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0021', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.dialNumber(SECOND_NUMBER)).assertTrue();

      expect(await service.rejectCall()).assertTrue();

      expect(service.getCurrentCall()).assertEqual(null);
      expect(service.getModel().callState).assertEqual(0);
      expect(service.getModel().phoneNumber).assertEqual('');
      expect(service.getActiveCallCount()).assertEqual(0);

      const records = service.getCallHistory();
      expect(records.length).assertEqual(1);
      expect(records[0].callState).assertEqual(CALL_STATE_REJECTED);
      expect(records[0].phoneNumber).assertEqual(SECOND_NUMBER);
      expect(records[0].endTime > 0).assertTrue();
      expect(records[0].endTime >= records[0].startTime).assertTrue();
      expect(records[0].durationSec).assertEqual(0);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('rejectCall');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Call rejected');
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2200
     * @tc.name: testHfpService0022
     * @tc.desc: Verify endCall and rejectCall succeed without an active call and keep counts at zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0022', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.endCall()).assertTrue();
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(await service.rejectCall()).assertTrue();
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(service.getCallHistory().length).assertEqual(0);
      expect(service.getCurrentCall()).assertEqual(null);

      const history = service.getOperationHistory();
      expect(history[history.length - 2].details).assertEqual('Call ended');
      expect(history[history.length - 1].details).assertEqual('Call rejected');
      expect(statsSnapshot(service).totalCallsInHistory).assertEqual(0);
    });

    // ==================== 重播与音量（4 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2300
     * @tc.name: testHfpService0023
     * @tc.desc: Verify redialLastNumber requires call history and redials the archived number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0023', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.redialLastNumber()).assertFalse();
      let history = lastHistory(service);
      expect(history.operation).assertEqual('redial');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('No previous call to redial');

      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      expect(await service.endCall()).assertTrue();
      expect(service.getCallHistory().length).assertEqual(1);

      expect(await service.redialLastNumber()).assertTrue();
      const call = callSnapshot(service);
      expect(call.phoneNumber).assertEqual(PRIMARY_NUMBER);
      expect(call.callState).assertEqual(CALL_STATE_DIALING);
      expect(service.getActiveCallCount()).assertEqual(1);

      history = lastHistory(service);
      expect(history.operation).assertEqual('redial');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual(`Redialing ${PRIMARY_NUMBER}`);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2400
     * @tc.name: testHfpService0024
     * @tc.desc: Verify microphone and speaker volume clamping keeps model and config in sync.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0024', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.setMicVolume(70)).assertTrue();
      expect(service.getModel().micVolume).assertEqual(70);
      expect(audioSnapshot(service).micVolume).assertEqual(70);
      expect(lastHistory(service).details).assertEqual('Mic volume: 70');

      expect(await service.setSpeakerVolume(30)).assertTrue();
      expect(service.getModel().speakerVolume).assertEqual(30);
      expect(audioSnapshot(service).speakerVolume).assertEqual(30);
      expect(lastHistory(service).details).assertEqual('Speaker volume: 30');

      expect(await service.setMicVolume(-5)).assertTrue();
      expect(service.getModel().micVolume).assertEqual(0);
      expect(await service.setMicVolume(150)).assertTrue();
      expect(service.getModel().micVolume).assertEqual(100);
      expect(await service.setSpeakerVolume(50.6)).assertTrue();
      expect(service.getModel().speakerVolume).assertEqual(51);
      expect(audioSnapshot(service).speakerVolume).assertEqual(51);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2500
     * @tc.name: testHfpService0025
     * @tc.desc: Verify mute and speaker toggles flip model, config and audio routing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0025', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.toggleMute()).assertTrue();
      expect(service.getModel().isMuted).assertTrue();
      expect(audioSnapshot(service).isMuted).assertTrue();
      expect(lastHistory(service).details).assertEqual('Muted: true');

      expect(await service.toggleMute()).assertTrue();
      expect(service.getModel().isMuted).assertFalse();
      expect(audioSnapshot(service).isMuted).assertFalse();
      expect(lastHistory(service).details).assertEqual('Muted: false');

      expect(await service.toggleSpeaker()).assertTrue();
      expect(service.getModel().isSpeakerOn).assertTrue();
      const speakerOn = audioSnapshot(service);
      expect(speakerOn.isSpeakerOn).assertTrue();
      expect(speakerOn.audioRouting).assertEqual('speaker');
      expect(lastHistory(service).details).assertEqual('Speaker: true');

      expect(await service.toggleSpeaker()).assertTrue();
      expect(service.getModel().isSpeakerOn).assertFalse();
      expect(audioSnapshot(service).audioRouting).assertEqual('bluetooth');
      expect(statsSnapshot(service).audioCallbackCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2600
     * @tc.name: testHfpService0026
     * @tc.desc: Verify audio controls are rejected before initialization and keep default values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0026', 0, async () => {
      const service = new HfpService();

      expect(await service.setMicVolume(10)).assertFalse();
      expect(await service.setSpeakerVolume(10)).assertFalse();
      expect(await service.toggleMute()).assertFalse();
      expect(await service.toggleSpeaker()).assertFalse();

      const model = service.getModel();
      expect(model.micVolume).assertEqual(50);
      expect(model.speakerVolume).assertEqual(50);
      expect(model.isMuted).assertFalse();
      expect(model.isSpeakerOn).assertFalse();
      expect(service.getAudioConfig()).assertEqual(null);

      const history = service.getOperationHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].operation).assertEqual('setMicVolume');
      expect(history[1].operation).assertEqual('setSpeakerVolume');
      expect(history[2].operation).assertEqual('toggleMute');
      expect(history[3].operation).assertEqual('toggleSpeaker');
      let failedCount: number = 0;
      for (const entry of history) {
        if (!entry.success) {
          failedCount += 1;
        }
      }
      expect(failedCount).assertEqual(4);
      expect(history[3].details).assertEqual('Not initialized');
    });

    // ==================== 语音识别（1 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2700
     * @tc.name: testHfpService0027
     * @tc.desc: Verify voice recognition lifecycle and the unguarded stop path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0027', 0, async () => {
      const uninitialized = new HfpService();
      expect(await uninitialized.startVoiceRecognition()).assertFalse();
      expect(lastHistory(uninitialized).details).assertEqual('Not connected');
      expect(await uninitialized.stopVoiceRecognition()).assertTrue();
      expect(uninitialized.isVoiceRecognitionActive()).assertFalse();
      expect(lastHistory(uninitialized).details).assertEqual('Voice recognition stopped');

      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.startVoiceRecognition()).assertFalse();
      expect(lastHistory(service).details).assertEqual('Not connected');

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.startVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertTrue();
      expect(statsSnapshot(service).voiceRecognitionActive).assertTrue();
      expect(lastHistory(service).details).assertEqual('Voice recognition started');

      expect(await service.stopVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertFalse();
      expect(lastHistory(service).details).assertEqual('Voice recognition stopped');
    });

    // ==================== 统计、副本与回调（3 条） ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2800
     * @tc.name: testHfpService0028
     * @tc.desc: Verify statistics reflect connection, call and callback state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0028', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.serviceName).assertEqual('HfpService');
      expect(stats.isInitialized).assertTrue();
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(stats.hfpState).assertEqual(HfpConnectionState.SLC_CONNECTED);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.activeCallCount).assertEqual(1);
      expect(stats.totalCallsInHistory).assertEqual(0);
      expect(stats.voiceRecognitionActive).assertFalse();
      expect(stats.inBandRinging).assertTrue();
      expect(stats.threeWayCalling).assertTrue();
      expect(stats.operationHistoryCount).assertEqual(3);
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      expect(stats.connectionCallbackCount).assertEqual(0);
      expect(stats.audioCallbackCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_2900
     * @tc.name: testHfpService0029
     * @tc.desc: Verify getters return defensive copies and call callback registration deduplicates.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0029', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const callCopy = service.getCurrentCall();
      expect(callCopy === null).assertFalse();
      if (callCopy !== null) {
        callCopy.callState = 99;
        callCopy.phoneNumber = 'tampered';
      }
      expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING);
      expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER);

      const audioCopy = service.getAudioConfig();
      expect(audioCopy === null).assertFalse();
      if (audioCopy !== null) {
        audioCopy.micVolume = 99;
      }
      expect(audioSnapshot(service).micVolume).assertEqual(50);
      expect(service.getModel().micVolume).assertEqual(50);

      const networkCopy = service.getNetworkInfo();
      expect(networkCopy === null).assertFalse();
      if (networkCopy !== null) {
        networkCopy.carrierName = 'Tampered Carrier';
      }
      expect(networkSnapshot(service).carrierName).assertEqual('Mock Carrier');

      const batteryCopy = service.getBatteryInfo();
      expect(batteryCopy === null).assertFalse();
      if (batteryCopy !== null) {
        batteryCopy.level = 1;
      }
      const battery = service.getBatteryInfo();
      if (battery !== null) {
        expect(battery.level).assertEqual(85);
      }

      const callback = (): void => {};
      service.addCallCallback(callback);
      service.addCallCallback(callback);
      expect(statsSnapshot(service).callCallbackCount).assertEqual(1);
      service.removeCallCallback(callback);
      expect(statsSnapshot(service).callCallbackCount).assertEqual(0);
      expect(statsSnapshot(service).audioCallbackCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HFP_SERVICE_3000
     * @tc.name: testHfpService0030
     * @tc.desc: Verify connection, data and call callbacks fire on connect and dial, and stop after removal.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0030', 0, async () => {
      const service = new HfpService();
      expect(await service.initialize()).assertTrue();

      const states: BluetoothConnectionState[] = [];
      const connectionCallback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };
      let dataCount: number = 0;
      const dataCallback = (): void => {
        dataCount += 1;
      };
      let callCount: number = 0;
      const callCallback = (): void => {
        callCount += 1;
      };
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(2);
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(dataCount).assertEqual(1);

      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      expect(callCount).assertEqual(1);
      expect(dataCount).assertEqual(2);
      expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER);
      expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING);

      service.removeCallCallback(callCallback);
      expect(statsSnapshot(service).callCallbackCount).assertEqual(0);
      expect(await service.dialNumber(SECOND_NUMBER)).assertTrue();
      expect(callCount).assertEqual(1);
      expect(dataCount).assertEqual(3);
      expect(callSnapshot(service).phoneNumber).assertEqual(SECOND_NUMBER);
    });
  });
}
