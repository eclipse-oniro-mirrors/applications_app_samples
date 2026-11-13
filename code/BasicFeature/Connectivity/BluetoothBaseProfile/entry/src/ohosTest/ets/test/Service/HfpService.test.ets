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
import {
  BluetoothConnectionState,
  HfpConnectionState,
  HfpService
} from 'library';
import { HfpServiceStatistics, ServiceCallbackCounts } from 'library';

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
 * read audio config snapshot, not yet initialize time use -1 mark missing value.
 * @param {HfpService} service - passive test service
 * @returns {AudioSnapshot} audio config snapshot
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
 * read network info snapshot, not yet initialize time use -1 mark missing value.
 * @param {HfpService} service - passive test service
 * @returns {NetworkSnapshot} network info snapshot
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
 * read current call snapshot, none call time exists for false.
 * @param {HfpService} service - passive test service
 * @returns {CallSnapshot} call snapshot
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
 * read statistics snapshot. getStatistics return typed statistics object, read fields directly.
 * @param {HfpService} service - passive test service
 * @returns {HfpStatsSnapshot} statistics snapshot
 */
function statsSnapshot(service: HfpService): HfpStatsSnapshot {
  const stats: HfpServiceStatistics = service.getStatistics();
  const callbacks: ServiceCallbackCounts = stats.callbackCounts;
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
    connectionCallbackCount: callbacks.connection ?? 0,
    dataCallbackCount: callbacks.data ?? 0,
    callCallbackCount: callbacks.call ?? 0,
    audioCallbackCount: callbacks.audio ?? 0
  };
  return snapshot;
}

/**
 * read last one item operation history, empty history return empty record.
 * @param {HfpService} service - passive test service
 * @returns {HistoryEntrySnapshot} last one item history
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
    // ==================== lifecycle and initialize (4 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_0100
     * @tc.name: testHfpService0001
     * @tc.desc: Verify the default state of a newly created service before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0001', 'begin');
      const service: HfpService = new HfpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#1 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#2 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#4 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#5 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#6 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#7 assert ' + "expect(service.getCallHistory().length).assertEqual(0)");
      expect(service.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#8 assert ' + "expect(service.getNetworkInfo()).assertEqual(null)");
      expect(service.getNetworkInfo()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#9 assert ' + "expect(service.getAudioConfig()).assertEqual(null)");
      expect(service.getAudioConfig()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#10 assert ' + "expect(service.getBatteryInfo()).assertEqual(null)");
      expect(service.getBatteryInfo()).assertEqual(null);

      const model = service.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#11 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#12 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#13 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#14 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(50);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#15 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#16 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0001',
        '#17 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0002', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      const audio = audioSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#2 ' + "audio.micVolume" + ' = ' + JSON.stringify(audio.micVolume));
      expect(audio.micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#3 ' + "audio.speakerVolume" + ' = ' + JSON.stringify(audio.speakerVolume));
      expect(audio.speakerVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#4 ' + "audio.isMuted" + ' = ' + JSON.stringify(audio.isMuted));
      expect(audio.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#5 ' + "audio.isSpeakerOn" + ' = ' + JSON.stringify(audio.isSpeakerOn));
      expect(audio.isSpeakerOn).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#6 ' + "audio.echoCancellation" + ' = ' + JSON.stringify(audio.echoCancellation));
      expect(audio.echoCancellation).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#7 ' + "audio.noiseSuppression" + ' = ' + JSON.stringify(audio.noiseSuppression));
      expect(audio.noiseSuppression).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#8 ' + "audio.voiceCodec" + ' = ' + JSON.stringify(audio.voiceCodec));
      expect(audio.voiceCodec).assertEqual('CVSD');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#9 ' + "audio.sampleRate" + ' = ' + JSON.stringify(audio.sampleRate));
      expect(audio.sampleRate).assertEqual(8000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#10 ' + "audio.widebandSpeech" + ' = ' + JSON.stringify(audio.widebandSpeech));
      expect(audio.widebandSpeech).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#11 ' + "audio.audioRouting" + ' = ' + JSON.stringify(audio.audioRouting));
      expect(audio.audioRouting).assertEqual('bluetooth');

      const network = networkSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#12 ' + "network.carrierName" + ' = ' + JSON.stringify(network.carrierName));
      expect(network.carrierName).assertEqual('Mock Carrier');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#13 ' + "network.signalStrength" + ' = ' + JSON.stringify(network.signalStrength));
      expect(network.signalStrength).assertEqual(-65);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#14 ' + "network.networkType" + ' = ' + JSON.stringify(network.networkType));
      expect(network.networkType).assertEqual('4G');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#15 ' + "network.registrationStatus" + ' = ' + JSON.stringify(network.registrationStatus));
      expect(network.registrationStatus).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#16 ' + "network.isRoaming" + ' = ' + JSON.stringify(network.isRoaming));
      expect(network.isRoaming).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#17 ' + "network.volteAvailable" + ' = ' + JSON.stringify(network.volteAvailable));
      expect(network.volteAvailable).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#18 ' + "network.mcc" + ' = ' + JSON.stringify(network.mcc));
      expect(network.mcc).assertEqual('310');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#19 ' + "network.mnc" + ' = ' + JSON.stringify(network.mnc));
      expect(network.mnc).assertEqual('260');

      const battery = service.getBatteryInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#20 ' + "battery === null" + ' = ' + JSON.stringify(battery === null));
      expect(battery === null).assertFalse();
      if (battery !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#21 ' + "battery.level" + ' = ' + JSON.stringify(battery.level));
        expect(battery.level).assertEqual(85);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#22 ' + "battery.isCharging" + ' = ' + JSON.stringify(battery.isCharging));
        expect(battery.isCharging).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#23 ' + "battery.healthStatus" + ' = ' + JSON.stringify(battery.healthStatus));
        expect(battery.healthStatus).assertEqual('good');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#24 ' + "battery.estimatedTimeMinutes" + ' = ' + JSON.stringify(battery.estimatedTimeMinutes));
        expect(battery.estimatedTimeMinutes).assertEqual(480);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#25 ' + "battery.temperature" + ' = ' + JSON.stringify(battery.temperature));
        expect(battery.temperature).assertEqual(25);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#26 ' + "battery.voltage" + ' = ' + JSON.stringify(battery.voltage));
        expect(battery.voltage).assertEqual(3800);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0002',
          '#27 ' + "battery.chargeCycles" + ' = ' + JSON.stringify(battery.chargeCycles));
        expect(battery.chargeCycles).assertEqual(150);
      }

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#28 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#29 ' + "stats.inBandRinging" + ' = ' + JSON.stringify(stats.inBandRinging));
      expect(stats.inBandRinging).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#30 ' + "stats.threeWayCalling" + ' = ' + JSON.stringify(stats.threeWayCalling));
      expect(stats.threeWayCalling).assertTrue();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#31 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0002',
        '#32 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0003', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#2 assert ' + "expect(await service.initialize()).assertFalse()");
      expect(await service.initialize()).assertFalse();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#3 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#4 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#5 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Already initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#6 assert ' + "expect(service.getOperationHistory().length).assertEqual(2)");
      expect(service.getOperationHistory().length).assertEqual(2);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#7 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#8 assert ' + "expect(audioSnapshot(service).micVolume).assertEqual(50)");
      expect(audioSnapshot(service).micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0003',
        '#9 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0004', 'begin');
      const service: HfpService = new HfpService();
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);

      const registered = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#2 ' + "registered.connectionCallbackCount" + ' = ' + JSON.stringify(registered.connectionCallbackCount));
      expect(registered.connectionCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#3 ' + "registered.dataCallbackCount" + ' = ' + JSON.stringify(registered.dataCallbackCount));
      expect(registered.dataCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#4 ' + "registered.callCallbackCount" + ' = ' + JSON.stringify(registered.callCallbackCount));
      expect(registered.callCallbackCount).assertEqual(1);

      await service.destroy();

      const destroyed = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#5 ' + "destroyed.isInitialized" + ' = ' + JSON.stringify(destroyed.isInitialized));
      expect(destroyed.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#6 ' + "destroyed.connectionCallbackCount" + ' = ' + JSON.stringify(destroyed.connectionCallbackCount));
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#7 ' + "destroyed.dataCallbackCount" + ' = ' + JSON.stringify(destroyed.dataCallbackCount));
      expect(destroyed.dataCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#8 ' + "destroyed.callCallbackCount" + ' = ' + JSON.stringify(destroyed.callCallbackCount));
      expect(destroyed.callCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#9 ' + "destroyed.audioCallbackCount" + ' = ' + JSON.stringify(destroyed.audioCallbackCount));
      expect(destroyed.audioCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#10 ' + "callbackCount" + ' = ' + JSON.stringify(callbackCount));
      expect(callbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#11 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#12 assert ' + "expect(audioSnapshot(service).micVolume).assertEqual(50)");
      expect(audioSnapshot(service).micVolume).assertEqual(50);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#13 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0004',
        '#14 assert ' + "expect(statsSnapshot(service).isInitialized).assertTrue()");
      expect(statsSnapshot(service).isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0004', 'end');
    });

    // ==================== connect and disconnect (5 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_0500
     * @tc.name: testHfpService0005
     * @tc.desc: Verify connect is rejected before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0005', 'begin');
      const service: HfpService = new HfpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#1 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertFalse()");
      expect(await service.connect(TEST_DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#2 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#3 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#5 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#6 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#7 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Service not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0005',
        '#8 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0006', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#2 assert ' + "expect(await service.connect('')).assertFalse()");
      expect(await service.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#5 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#6 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#7 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Invalid device ID');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0006',
        '#8 assert ' + "expect(service.getOperationHistory().length).assertEqual(2)");
      expect(service.getOperationHistory().length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0007', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#3 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#5 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#6 assert ' + "expect(service.getModel().isConnected()).assertTrue()");
      expect(service.getModel().isConnected()).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#7 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#8 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#9 ' + "stats.hfpState" + ' = ' + JSON.stringify(stats.hfpState));
      expect(stats.hfpState).assertEqual(HfpConnectionState.SLC_CONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#10 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#11 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#12 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual(`Connected to ${TEST_DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0007',
        '#13 assert ' + "expect(service.getModel().getLogs().length).assertEqual(1)");
      expect(service.getModel().getLogs().length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0008', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#3 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#4 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#5 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#6 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#7 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#8 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#9 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Already connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0008',
        '#10 assert ' + "expect(service.getOperationHistory().length).assertEqual(3)");
      expect(service.getOperationHistory().length).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0009', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#3 assert ' + "expect(await service.connect(TEST_DEVICE_B)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#4 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(2)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#5 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#6 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#7 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#8 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.SLC_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#9 assert ' + "expect(service.getModel().isConnected()).assertTrue()");
      expect(service.getModel().isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#10 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#11 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#12 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0009',
        '#13 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual(`Disconnected from ${TEST_DEVICE_A}`);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0009', 'end');
    });

    // ==================== disconnect guard, reset and destroy (4 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_1000
     * @tc.name: testHfpService0010
     * @tc.desc: Verify disconnecting the last device resets model state and connection flags.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0010', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#3 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#6 assert ' + "expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED)");
      expect(service.getHfpState()).assertEqual(HfpConnectionState.NOT_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#7 assert ' + "expect(service.getModel().isConnected()).assertFalse()");
      expect(service.getModel().isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#8 assert ' + "expect(service.getModel().getLogs().length).assertEqual(0)");
      expect(service.getModel().getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#9 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#10 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0010',
        '#11 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0011', 'begin');
      const uninitialized: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#1 assert ' + "expect(await uninitialized.disconnect(TEST_DEVICE_A)).assertFalse()");
      expect(await uninitialized.disconnect(TEST_DEVICE_A)).assertFalse();
      const uninitializedHistory = lastHistory(uninitialized);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#2 ' + "uninitializedHistory.operation" + ' = ' + JSON.stringify(uninitializedHistory.operation));
      expect(uninitializedHistory.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#3 ' + "uninitializedHistory.success" + ' = ' + JSON.stringify(uninitializedHistory.success));
      expect(uninitializedHistory.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#4 ' + "uninitializedHistory.details" + ' = ' + JSON.stringify(uninitializedHistory.details));
      expect(uninitializedHistory.details).assertEqual('Not initialized');

      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#5 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#6 assert ' + "expect(await service.disconnect('unknown_device')).assertFalse()");
      expect(await service.disconnect('unknown_device')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#7 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#8 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#9 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#10 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Device not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0011',
        '#11 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0012', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#3 assert ' + "expect(await service.setMicVolume(70)).assertTrue()");
      expect(await service.setMicVolume(70)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#4 assert ' + "expect(await service.setSpeakerVolume(20)).assertTrue()");
      expect(await service.setSpeakerVolume(20)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#5 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#6 assert ' + "expect(await service.endCall()).assertTrue()");
      expect(await service.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#7 assert ' + "expect(service.getCallHistory().length).assertEqual(1)");
      expect(service.getCallHistory().length).assertEqual(1);

      await service.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#8 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#9 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#10 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#11 assert ' + "expect(service.getCallHistory().length).assertEqual(0)");
      expect(service.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#12 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);

      const audio = audioSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#13 ' + "audio.micVolume" + ' = ' + JSON.stringify(audio.micVolume));
      expect(audio.micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#14 ' + "audio.speakerVolume" + ' = ' + JSON.stringify(audio.speakerVolume));
      expect(audio.speakerVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#15 ' + "audio.isMuted" + ' = ' + JSON.stringify(audio.isMuted));
      expect(audio.isMuted).assertFalse();

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#16 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#17 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#18 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#19 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0012',
        '#20 ' + "stats.totalCallsInHistory" + ' = ' + JSON.stringify(stats.totalCallsInHistory));
      expect(stats.totalCallsInHistory).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0013', 'begin');
      const service: HfpService = new HfpService();
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#3 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);

      const registered = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#4 ' + "registered.connectionCallbackCount" + ' = ' + JSON.stringify(registered.connectionCallbackCount));
      expect(registered.connectionCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#5 ' + "registered.dataCallbackCount" + ' = ' + JSON.stringify(registered.dataCallbackCount));
      expect(registered.dataCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#6 ' + "registered.callCallbackCount" + ' = ' + JSON.stringify(registered.callCallbackCount));
      expect(registered.callCallbackCount).assertEqual(1);

      await service.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#7 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#8 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#9 ' + "callbackCount" + ' = ' + JSON.stringify(callbackCount));
      expect(callbackCount).assertEqual(0);

      const destroyed = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#10 ' + "destroyed.isInitialized" + ' = ' + JSON.stringify(destroyed.isInitialized));
      expect(destroyed.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#11 ' + "destroyed.connectedDeviceCount" + ' = ' + JSON.stringify(destroyed.connectedDeviceCount));
      expect(destroyed.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#12 ' + "destroyed.connectionCallbackCount" + ' = ' + JSON.stringify(destroyed.connectionCallbackCount));
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#13 ' + "destroyed.dataCallbackCount" + ' = ' + JSON.stringify(destroyed.dataCallbackCount));
      expect(destroyed.dataCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#14 ' + "destroyed.callCallbackCount" + ' = ' + JSON.stringify(destroyed.callCallbackCount));
      expect(destroyed.callCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#15 ' + "destroyed.audioCallbackCount" + ' = ' + JSON.stringify(destroyed.audioCallbackCount));
      expect(destroyed.audioCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0013',
        '#16 ' + "destroyed.operationHistoryCount" + ' = ' + JSON.stringify(destroyed.operationHistoryCount));
      expect(destroyed.operationHistoryCount).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0013', 'end');
    });

    // ==================== call management (9 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_1400
     * @tc.name: testHfpService0014
     * @tc.desc: Verify all call controls are rejected when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0014', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0014', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#2 assert ' + "expect(await service.answerCall()).assertFalse()");
      expect(await service.answerCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#3 assert ' + "expect(await service.rejectCall()).assertFalse()");
      expect(await service.rejectCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#4 assert ' + "expect(await service.endCall()).assertFalse()");
      expect(await service.endCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#5 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertFalse()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#6 assert ' + "expect(await service.redialLastNumber()).assertFalse()");
      expect(await service.redialLastNumber()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#7 assert ' + "expect(await service.holdCall()).assertFalse()");
      expect(await service.holdCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#8 assert ' + "expect(await service.resumeCall()).assertFalse()");
      expect(await service.resumeCall()).assertFalse();

      const history = service.getOperationHistory().slice(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#9 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#10 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('answerCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#11 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('rejectCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#12 ' + "history[2].operation" + ' = ' + JSON.stringify(history[2].operation));
      expect(history[2].operation).assertEqual('endCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#13 ' + "history[3].operation" + ' = ' + JSON.stringify(history[3].operation));
      expect(history[3].operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#14 ' + "history[4].operation" + ' = ' + JSON.stringify(history[4].operation));
      expect(history[4].operation).assertEqual('redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#15 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#16 ' + "history[4].details" + ' = ' + JSON.stringify(history[4].details));
      expect(history[4].details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#17 ' + "history[5].details" + ' = ' + JSON.stringify(history[5].details));
      expect(history[5].details).assertEqual('No active call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#18 ' + "history[6].details" + ' = ' + JSON.stringify(history[6].details));
      expect(history[6].details).assertEqual('No held call');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#19 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#20 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0014',
        '#21 assert ' + "expect(service.getModel().callState).assertEqual(0)");
      expect(service.getModel().callState).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0015', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#3 assert ' + "expect(await service.answerCall()).assertTrue()");
      expect(await service.answerCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#4 assert ' + "expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE)");
      expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#5 assert ' + "expect(service.getActiveCallCount()).assertEqual(1)");
      expect(service.getActiveCallCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#6 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);

      const first = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#7 ' + "first.operation" + ' = ' + JSON.stringify(first.operation));
      expect(first.operation).assertEqual('answerCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#8 ' + "first.success" + ' = ' + JSON.stringify(first.success));
      expect(first.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#9 ' + "first.details" + ' = ' + JSON.stringify(first.details));
      expect(first.details).assertEqual('Call answered');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#10 assert ' + "expect(await service.answerCall()).assertTrue()");
      expect(await service.answerCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#11 assert ' + "expect(service.getActiveCallCount()).assertEqual(2)");
      expect(service.getActiveCallCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0015',
        '#12 assert ' + "expect(statsSnapshot(service).activeCallCount).assertEqual(2)");
      expect(statsSnapshot(service).activeCallCount).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0016', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#3 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const call = callSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#4 ' + "call.exists" + ' = ' + JSON.stringify(call.exists));
      expect(call.exists).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#5 ' + "call.phoneNumber" + ' = ' + JSON.stringify(call.phoneNumber));
      expect(call.phoneNumber).assertEqual(PRIMARY_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#6 ' + "call.callState" + ' = ' + JSON.stringify(call.callState));
      expect(call.callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#7 ' + "call.callDirection" + ' = ' + JSON.stringify(call.callDirection));
      expect(call.callDirection).assertEqual('outgoing');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#8 ' + "call.participantCount" + ' = ' + JSON.stringify(call.participantCount));
      expect(call.participantCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#9 ' + "call.isOnHold" + ' = ' + JSON.stringify(call.isOnHold));
      expect(call.isOnHold).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#10 ' + "call.durationSec" + ' = ' + JSON.stringify(call.durationSec));
      expect(call.durationSec).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#11 ' + "call.endTime" + ' = ' + JSON.stringify(call.endTime));
      expect(call.endTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#12 ' + "call.networkType" + ' = ' + JSON.stringify(call.networkType));
      expect(call.networkType).assertEqual('4G');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#13 ' + "call.echoCancellation" + ' = ' + JSON.stringify(call.echoCancellation));
      expect(call.echoCancellation).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#14 ' + "call.noiseReduction" + ' = ' + JSON.stringify(call.noiseReduction));
      expect(call.noiseReduction).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#15 ' + "call.hdVoiceEnabled" + ' = ' + JSON.stringify(call.hdVoiceEnabled));
      expect(call.hdVoiceEnabled).assertFalse();

      const model = service.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#16 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#17 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual(PRIMARY_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#18 assert ' + "expect(service.getActiveCallCount()).assertEqual(1)");
      expect(service.getActiveCallCount()).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#19 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#20 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0016',
        '#21 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual(`Dialing ${PRIMARY_NUMBER}`);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0017', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#3 assert ' + "expect(await service.dialNumber('')).assertFalse()");
      expect(await service.dialNumber('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#4 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#5 assert ' + "expect(service.getModel().callState).assertEqual(0)");
      expect(service.getModel().callState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#6 assert ' + "expect(service.getModel().phoneNumber).assertEqual('')");
      expect(service.getModel().phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#7 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#8 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#9 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0017',
        '#10 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Empty phone number');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0018', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#3 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#4 assert ' + "expect(await service.holdCall()).assertTrue()");
      expect(await service.holdCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#5 assert ' + "expect(callSnapshot(service).isOnHold).assertTrue()");
      expect(callSnapshot(service).isOnHold).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#6 assert ' + "expect(service.getModel().callState).assertEqual(CALL_STATE_HOLD)");
      expect(service.getModel().callState).assertEqual(CALL_STATE_HOLD);
      const holdHistory = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#7 ' + "holdHistory.operation" + ' = ' + JSON.stringify(holdHistory.operation));
      expect(holdHistory.operation).assertEqual('holdCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#8 ' + "holdHistory.success" + ' = ' + JSON.stringify(holdHistory.success));
      expect(holdHistory.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#9 ' + "holdHistory.details" + ' = ' + JSON.stringify(holdHistory.details));
      expect(holdHistory.details).assertEqual('Call on hold');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#10 assert ' + "expect(await service.resumeCall()).assertTrue()");
      expect(await service.resumeCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#11 assert ' + "expect(callSnapshot(service).isOnHold).assertFalse()");
      expect(callSnapshot(service).isOnHold).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#12 assert ' + "expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE)");
      expect(service.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      const resumeHistory = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#13 ' + "resumeHistory.operation" + ' = ' + JSON.stringify(resumeHistory.operation));
      expect(resumeHistory.operation).assertEqual('resumeCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#14 ' + "resumeHistory.success" + ' = ' + JSON.stringify(resumeHistory.success));
      expect(resumeHistory.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0018',
        '#15 ' + "resumeHistory.details" + ' = ' + JSON.stringify(resumeHistory.details));
      expect(resumeHistory.details).assertEqual('Call resumed');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0019', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#3 assert ' + "expect(await service.holdCall()).assertFalse()");
      expect(await service.holdCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#4 assert ' + "expect(lastHistory(service).details).assertEqual('No active call')");
      expect(lastHistory(service).details).assertEqual('No active call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#5 assert ' + "expect(await service.resumeCall()).assertFalse()");
      expect(await service.resumeCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#6 assert ' + "expect(lastHistory(service).details).assertEqual('No held call')");
      expect(lastHistory(service).details).assertEqual('No held call');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#7 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#8 assert ' + "expect(await service.resumeCall()).assertFalse()");
      expect(await service.resumeCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#9 assert ' + "expect(lastHistory(service).details).assertEqual('No held call')");
      expect(lastHistory(service).details).assertEqual('No held call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#10 assert ' + "expect(service.getModel().callState).assertEqual(CALL_STATE_DIALING)");
      expect(service.getModel().callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0019',
        '#11 assert ' + "expect(service.getOperationHistory().length).assertEqual(6)");
      expect(service.getOperationHistory().length).assertEqual(6);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0020', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#3 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#4 assert ' + "expect(await service.endCall()).assertTrue()");
      expect(await service.endCall()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#5 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#6 assert ' + "expect(service.getModel().callState).assertEqual(0)");
      expect(service.getModel().callState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#7 assert ' + "expect(service.getModel().phoneNumber).assertEqual('')");
      expect(service.getModel().phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#8 assert ' + "expect(service.getModel().callDuration).assertEqual(0)");
      expect(service.getModel().callDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#9 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);

      const records = service.getCallHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#10 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#11 ' + "records[0].callState" + ' = ' + JSON.stringify(records[0].callState));
      expect(records[0].callState).assertEqual(CALL_STATE_ENDED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#12 ' + "records[0].phoneNumber" + ' = ' + JSON.stringify(records[0].phoneNumber));
      expect(records[0].phoneNumber).assertEqual(PRIMARY_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#13 ' + "records[0].endTime > 0" + ' = ' + JSON.stringify(records[0].endTime > 0));
      expect(records[0].endTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#14 ' + "records[0].endTime >= records[0].startTime" + ' = ' +
        JSON.stringify(records[0].endTime >= records[0].startTime));
      expect(records[0].endTime >= records[0].startTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#15 ' + "records[0].durationSec" + ' = ' + JSON.stringify(records[0].durationSec));
      expect(records[0].durationSec)
        .assertEqual(Math.floor((records[0].endTime - records[0].startTime) / 1000));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#16 assert ' + "expect(statsSnapshot(service).totalCallsInHistory).assertEqual(1)");
      expect(statsSnapshot(service).totalCallsInHistory).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#17 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('endCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#18 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0020',
        '#19 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Call ended');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0020', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0021', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#3 assert ' + "expect(await service.dialNumber(SECOND_NUMBER)).assertTrue()");
      expect(await service.dialNumber(SECOND_NUMBER)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#4 assert ' + "expect(await service.rejectCall()).assertTrue()");
      expect(await service.rejectCall()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#5 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#6 assert ' + "expect(service.getModel().callState).assertEqual(0)");
      expect(service.getModel().callState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#7 assert ' + "expect(service.getModel().phoneNumber).assertEqual('')");
      expect(service.getModel().phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#8 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);

      const records = service.getCallHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#9 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#10 ' + "records[0].callState" + ' = ' + JSON.stringify(records[0].callState));
      expect(records[0].callState).assertEqual(CALL_STATE_REJECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#11 ' + "records[0].phoneNumber" + ' = ' + JSON.stringify(records[0].phoneNumber));
      expect(records[0].phoneNumber).assertEqual(SECOND_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#12 ' + "records[0].endTime > 0" + ' = ' + JSON.stringify(records[0].endTime > 0));
      expect(records[0].endTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#13 ' + "records[0].endTime >= records[0].startTime" + ' = ' +
        JSON.stringify(records[0].endTime >= records[0].startTime));
      expect(records[0].endTime >= records[0].startTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#14 ' + "records[0].durationSec" + ' = ' + JSON.stringify(records[0].durationSec));
      expect(records[0].durationSec).assertEqual(0);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#15 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('rejectCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#16 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0021',
        '#17 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Call rejected');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0021', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0022', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#3 assert ' + "expect(await service.endCall()).assertTrue()");
      expect(await service.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#4 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#5 assert ' + "expect(await service.rejectCall()).assertTrue()");
      expect(await service.rejectCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#6 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#7 assert ' + "expect(service.getCallHistory().length).assertEqual(0)");
      expect(service.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#8 assert ' + "expect(service.getCurrentCall()).assertEqual(null)");
      expect(service.getCurrentCall()).assertEqual(null);

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#9 ' + "history[history.length - 2].details" + ' = ' + JSON.stringify(history[history.length - 2].details));
      expect(history[history.length - 2].details).assertEqual('Call ended');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#10 ' + "history[history.length - 1].details" + ' = ' + JSON.stringify(history[history.length - 1].details));
      expect(history[history.length - 1].details).assertEqual('Call rejected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0022',
        '#11 assert ' + "expect(statsSnapshot(service).totalCallsInHistory).assertEqual(0)");
      expect(statsSnapshot(service).totalCallsInHistory).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0022', 'end');
    });

    // ==================== replay and volume (4 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2300
     * @tc.name: testHfpService0023
     * @tc.desc: Verify redialLastNumber requires call history and redials the archived number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0023', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0023', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#3 assert ' + "expect(await service.redialLastNumber()).assertFalse()");
      expect(await service.redialLastNumber()).assertFalse();
      let history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#4 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#5 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#6 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('No previous call to redial');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#7 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#8 assert ' + "expect(await service.endCall()).assertTrue()");
      expect(await service.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#9 assert ' + "expect(service.getCallHistory().length).assertEqual(1)");
      expect(service.getCallHistory().length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#10 assert ' + "expect(await service.redialLastNumber()).assertTrue()");
      expect(await service.redialLastNumber()).assertTrue();
      const call = callSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#11 ' + "call.phoneNumber" + ' = ' + JSON.stringify(call.phoneNumber));
      expect(call.phoneNumber).assertEqual(PRIMARY_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#12 ' + "call.callState" + ' = ' + JSON.stringify(call.callState));
      expect(call.callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#13 assert ' + "expect(service.getActiveCallCount()).assertEqual(1)");
      expect(service.getActiveCallCount()).assertEqual(1);

      history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#14 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#15 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0023',
        '#16 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual(`Redialing ${PRIMARY_NUMBER}`);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0023', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0024', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#2 assert ' + "expect(await service.setMicVolume(70)).assertTrue()");
      expect(await service.setMicVolume(70)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#3 assert ' + "expect(service.getModel().micVolume).assertEqual(70)");
      expect(service.getModel().micVolume).assertEqual(70);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#4 assert ' + "expect(audioSnapshot(service).micVolume).assertEqual(70)");
      expect(audioSnapshot(service).micVolume).assertEqual(70);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#5 assert ' + "expect(lastHistory(service).details).assertEqual('Mic volume: 70')");
      expect(lastHistory(service).details).assertEqual('Mic volume: 70');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#6 assert ' + "expect(await service.setSpeakerVolume(30)).assertTrue()");
      expect(await service.setSpeakerVolume(30)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#7 assert ' + "expect(service.getModel().speakerVolume).assertEqual(30)");
      expect(service.getModel().speakerVolume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#8 assert ' + "expect(audioSnapshot(service).speakerVolume).assertEqual(30)");
      expect(audioSnapshot(service).speakerVolume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#9 assert ' + "expect(lastHistory(service).details).assertEqual('Speaker volume: 30')");
      expect(lastHistory(service).details).assertEqual('Speaker volume: 30');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#10 assert ' + "expect(await service.setMicVolume(-5)).assertTrue()");
      expect(await service.setMicVolume(-5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#11 assert ' + "expect(service.getModel().micVolume).assertEqual(0)");
      expect(service.getModel().micVolume).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#12 assert ' + "expect(await service.setMicVolume(150)).assertTrue()");
      expect(await service.setMicVolume(150)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#13 assert ' + "expect(service.getModel().micVolume).assertEqual(100)");
      expect(service.getModel().micVolume).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#14 assert ' + "expect(await service.setSpeakerVolume(50.6)).assertTrue()");
      expect(await service.setSpeakerVolume(50.6)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#15 assert ' + "expect(service.getModel().speakerVolume).assertEqual(51)");
      expect(service.getModel().speakerVolume).assertEqual(51);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0024',
        '#16 assert ' + "expect(audioSnapshot(service).speakerVolume).assertEqual(51)");
      expect(audioSnapshot(service).speakerVolume).assertEqual(51);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0024', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0025', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#2 assert ' + "expect(await service.toggleMute()).assertTrue()");
      expect(await service.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#3 assert ' + "expect(service.getModel().isMuted).assertTrue()");
      expect(service.getModel().isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#4 assert ' + "expect(audioSnapshot(service).isMuted).assertTrue()");
      expect(audioSnapshot(service).isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#5 assert ' + "expect(lastHistory(service).details).assertEqual('Muted: true')");
      expect(lastHistory(service).details).assertEqual('Muted: true');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#6 assert ' + "expect(await service.toggleMute()).assertTrue()");
      expect(await service.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#7 assert ' + "expect(service.getModel().isMuted).assertFalse()");
      expect(service.getModel().isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#8 assert ' + "expect(audioSnapshot(service).isMuted).assertFalse()");
      expect(audioSnapshot(service).isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#9 assert ' + "expect(lastHistory(service).details).assertEqual('Muted: false')");
      expect(lastHistory(service).details).assertEqual('Muted: false');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#10 assert ' + "expect(await service.toggleSpeaker()).assertTrue()");
      expect(await service.toggleSpeaker()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#11 assert ' + "expect(service.getModel().isSpeakerOn).assertTrue()");
      expect(service.getModel().isSpeakerOn).assertTrue();
      const speakerOn = audioSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#12 ' + "speakerOn.isSpeakerOn" + ' = ' + JSON.stringify(speakerOn.isSpeakerOn));
      expect(speakerOn.isSpeakerOn).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#13 ' + "speakerOn.audioRouting" + ' = ' + JSON.stringify(speakerOn.audioRouting));
      expect(speakerOn.audioRouting).assertEqual('speaker');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#14 assert ' + "expect(lastHistory(service).details).assertEqual('Speaker: true')");
      expect(lastHistory(service).details).assertEqual('Speaker: true');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#15 assert ' + "expect(await service.toggleSpeaker()).assertTrue()");
      expect(await service.toggleSpeaker()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#16 assert ' + "expect(service.getModel().isSpeakerOn).assertFalse()");
      expect(service.getModel().isSpeakerOn).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#17 assert ' + "expect(audioSnapshot(service).audioRouting).assertEqual('bluetooth')");
      expect(audioSnapshot(service).audioRouting).assertEqual('bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0025',
        '#18 assert ' + "expect(statsSnapshot(service).audioCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).audioCallbackCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0025', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0026', 'begin');
      const service: HfpService = new HfpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#1 assert ' + "expect(await service.setMicVolume(10)).assertFalse()");
      expect(await service.setMicVolume(10)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#2 assert ' + "expect(await service.setSpeakerVolume(10)).assertFalse()");
      expect(await service.setSpeakerVolume(10)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#3 assert ' + "expect(await service.toggleMute()).assertFalse()");
      expect(await service.toggleMute()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#4 assert ' + "expect(await service.toggleSpeaker()).assertFalse()");
      expect(await service.toggleSpeaker()).assertFalse();

      const model = service.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#5 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#6 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#7 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#8 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#9 assert ' + "expect(service.getAudioConfig()).assertEqual(null)");
      expect(service.getAudioConfig()).assertEqual(null);

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#11 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('setMicVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#12 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('setSpeakerVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#13 ' + "history[2].operation" + ' = ' + JSON.stringify(history[2].operation));
      expect(history[2].operation).assertEqual('toggleMute');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#14 ' + "history[3].operation" + ' = ' + JSON.stringify(history[3].operation));
      expect(history[3].operation).assertEqual('toggleSpeaker');
      let failedCount: number = 0;
      for (const entry of history) {
        if (!entry.success) {
          failedCount += 1;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#15 ' + "failedCount" + ' = ' + JSON.stringify(failedCount));
      expect(failedCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0026',
        '#16 ' + "history[3].details" + ' = ' + JSON.stringify(history[3].details));
      expect(history[3].details).assertEqual('Not initialized');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0026', 'end');
    });

    // ==================== sound identify distinguish (1 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2700
     * @tc.name: testHfpService0027
     * @tc.desc: Verify voice recognition lifecycle and the unguarded stop path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpService0027', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0027', 'begin');
      const uninitialized: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#1 assert ' + "expect(await uninitialized.startVoiceRecognition()).assertFalse()");
      expect(await uninitialized.startVoiceRecognition()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#2 assert ' + "expect(lastHistory(uninitialized).details).assertEqual('Not connected')");
      expect(lastHistory(uninitialized).details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#3 assert ' + "expect(await uninitialized.stopVoiceRecognition()).assertTrue()");
      expect(await uninitialized.stopVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#4 assert ' + "expect(uninitialized.isVoiceRecognitionActive()).assertFalse()");
      expect(uninitialized.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#5 assert ' + "expect(lastHistory(uninitialized).details).assertEqual('Voice recognition stopped')");
      expect(lastHistory(uninitialized).details).assertEqual('Voice recognition stopped');

      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#6 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#7 assert ' + "expect(await service.startVoiceRecognition()).assertFalse()");
      expect(await service.startVoiceRecognition()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#8 assert ' + "expect(lastHistory(service).details).assertEqual('Not connected')");
      expect(lastHistory(service).details).assertEqual('Not connected');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#9 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#10 assert ' + "expect(await service.startVoiceRecognition()).assertTrue()");
      expect(await service.startVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#11 assert ' + "expect(service.isVoiceRecognitionActive()).assertTrue()");
      expect(service.isVoiceRecognitionActive()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#12 assert ' + "expect(statsSnapshot(service).voiceRecognitionActive).assertTrue()");
      expect(statsSnapshot(service).voiceRecognitionActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#13 assert ' + "expect(lastHistory(service).details).assertEqual('Voice recognition started')");
      expect(lastHistory(service).details).assertEqual('Voice recognition started');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#14 assert ' + "expect(await service.stopVoiceRecognition()).assertTrue()");
      expect(await service.stopVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#15 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0027',
        '#16 assert ' + "expect(lastHistory(service).details).assertEqual('Voice recognition stopped')");
      expect(lastHistory(service).details).assertEqual('Voice recognition stopped');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0027', 'end');
    });

    // ==================== statistics, copy and callback (3 cases) ====================

    /*
     * @tc.number: SUB_HFP_SERVICE_2800
     * @tc.name: testHfpService0028
     * @tc.desc: Verify statistics reflect connection, call and callback state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpService0028', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0028', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#3 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#4 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual('HfpService');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#5 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#6 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#7 ' + "stats.hfpState" + ' = ' + JSON.stringify(stats.hfpState));
      expect(stats.hfpState).assertEqual(HfpConnectionState.SLC_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#8 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#9 ' + "stats.activeCallCount" + ' = ' + JSON.stringify(stats.activeCallCount));
      expect(stats.activeCallCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#10 ' + "stats.totalCallsInHistory" + ' = ' + JSON.stringify(stats.totalCallsInHistory));
      expect(stats.totalCallsInHistory).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#11 ' + "stats.voiceRecognitionActive" + ' = ' + JSON.stringify(stats.voiceRecognitionActive));
      expect(stats.voiceRecognitionActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#12 ' + "stats.inBandRinging" + ' = ' + JSON.stringify(stats.inBandRinging));
      expect(stats.inBandRinging).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#13 ' + "stats.threeWayCalling" + ' = ' + JSON.stringify(stats.threeWayCalling));
      expect(stats.threeWayCalling).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#14 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#15 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#16 ' + "stats.connectionCallbackCount" + ' = ' + JSON.stringify(stats.connectionCallbackCount));
      expect(stats.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0028',
        '#17 ' + "stats.audioCallbackCount" + ' = ' + JSON.stringify(stats.audioCallbackCount));
      expect(stats.audioCallbackCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0028', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0029', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#3 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();

      const callCopy = service.getCurrentCall();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#4 ' + "callCopy === null" + ' = ' + JSON.stringify(callCopy === null));
      expect(callCopy === null).assertFalse();
      if (callCopy !== null) {
        callCopy.callState = 99;
        callCopy.phoneNumber = 'tampered';
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#5 assert ' + "expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING)");
      expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#6 assert ' + "expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER)");
      expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER);

      const audioCopy = service.getAudioConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#7 ' + "audioCopy === null" + ' = ' + JSON.stringify(audioCopy === null));
      expect(audioCopy === null).assertFalse();
      if (audioCopy !== null) {
        audioCopy.micVolume = 99;
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#8 assert ' + "expect(audioSnapshot(service).micVolume).assertEqual(50)");
      expect(audioSnapshot(service).micVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#9 assert ' + "expect(service.getModel().micVolume).assertEqual(50)");
      expect(service.getModel().micVolume).assertEqual(50);

      const networkCopy = service.getNetworkInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#10 ' + "networkCopy === null" + ' = ' + JSON.stringify(networkCopy === null));
      expect(networkCopy === null).assertFalse();
      if (networkCopy !== null) {
        networkCopy.carrierName = 'Tampered Carrier';
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#11 assert ' + "expect(networkSnapshot(service).carrierName).assertEqual('Mock Carrier')");
      expect(networkSnapshot(service).carrierName).assertEqual('Mock Carrier');

      const batteryCopy = service.getBatteryInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#12 ' + "batteryCopy === null" + ' = ' + JSON.stringify(batteryCopy === null));
      expect(batteryCopy === null).assertFalse();
      if (batteryCopy !== null) {
        batteryCopy.level = 1;
      }
      const battery = service.getBatteryInfo();
      if (battery !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpService0029',
          '#13 ' + "battery.level" + ' = ' + JSON.stringify(battery.level));
        expect(battery.level).assertEqual(85);
      }

      const callback = (): void => {};
      service.addCallCallback(callback);
      service.addCallCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#14 assert ' + "expect(statsSnapshot(service).callCallbackCount).assertEqual(1)");
      expect(statsSnapshot(service).callCallbackCount).assertEqual(1);
      service.removeCallCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#15 assert ' + "expect(statsSnapshot(service).callCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).callCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0029',
        '#16 assert ' + "expect(statsSnapshot(service).audioCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).audioCallbackCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0029', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0030', 'begin');
      const service: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#3 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#4 ' + "states[0]" + ' = ' + JSON.stringify(states[0]));
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#5 ' + "states[1]" + ' = ' + JSON.stringify(states[1]));
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#6 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#7 assert ' + "expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue()");
      expect(await service.dialNumber(PRIMARY_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#8 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#9 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#10 assert ' + "expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER)");
      expect(callSnapshot(service).phoneNumber).assertEqual(PRIMARY_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#11 assert ' + "expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING)");
      expect(callSnapshot(service).callState).assertEqual(CALL_STATE_DIALING);

      service.removeCallCallback(callCallback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#12 assert ' + "expect(statsSnapshot(service).callCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).callCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#13 assert ' + "expect(await service.dialNumber(SECOND_NUMBER)).assertTrue()");
      expect(await service.dialNumber(SECOND_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#14 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#15 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpService0030',
        '#16 assert ' + "expect(callSnapshot(service).phoneNumber).assertEqual(SECOND_NUMBER)");
      expect(callSnapshot(service).phoneNumber).assertEqual(SECOND_NUMBER);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpService0030', 'end');
    });
  });
}
