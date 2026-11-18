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
  HfpModel,
  HfpProfileManager,
  HfpService
} from 'library';
import {
  HfpAudioConfig,
  HfpBatteryInfo,
  HfpCallInfo,
  HfpNetworkInfo,
  HfpServiceStatistics,
  ServiceCallbackCounts
} from 'library';

/**
 * @description Test suite for HFP call operations of HfpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'HfpService';
const DEVICE_A: string = 'hfp_call_device_a';
const DEVICE_B: string = 'hfp_call_device_b';
const PHONE_NUMBER: string = '10086';
const BLANK_NUMBER: string = '   ';
const CALL_STATE_NONE: number = 0;
const CALL_STATE_ACTIVE: number = 1;
const CALL_STATE_DIALING: number = 2;
const CALL_STATE_HOLD: number = 3;
const CALL_STATE_ENDED: number = 4;
const CALL_STATE_REJECTED: number = 6;
const DEFAULT_VOLUME: number = 50;

interface HistoryView {
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
}

interface CallView {
  phoneNumber: string;
  contactName: string;
  callState: number;
  callDirection: string;
  startTime: number;
  endTime: number;
  durationSec: number;
  isOnHold: boolean;
  isConference: boolean;
  participantCount: number;
  callType: string;
  networkType: string;
  hdVoiceEnabled: boolean;
  echoCancellation: boolean;
  noiseReduction: boolean;
}

interface NetworkView {
  registrationStatus: number;
  carrierName: string;
  signalStrength: number;
  networkType: string;
  isRoaming: boolean;
  volteAvailable: boolean;
  cellId: string;
  locationAreaCode: string;
  mcc: string;
  mnc: string;
}

interface AudioView {
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

interface BatteryView {
  level: number;
  isCharging: boolean;
  estimatedTimeMinutes: number;
  healthStatus: string;
  temperature: number;
  voltage: number;
  chargeCycles: number;
}

interface ServiceView {
  serviceName: string;
  isInitialized: boolean;
  connectionState: string;
  connectedDeviceCount: number;
  activeCallCount: number;
  totalCallsInHistory: number;
  voiceRecognitionActive: boolean;
  inBandRinging: boolean;
  threeWayCalling: boolean;
  operationHistoryCount: number;
  callCallbackCount: number;
  audioCallbackCount: number;
}

function historyOf(manager: HfpProfileManager): HistoryView[] {
  const source = manager.getService().getOperationHistory();
  const list: HistoryView[] = [];
  for (let i = 0; i < source.length; i++) {
    list.push({
      operation: source[i].operation,
      timestamp: source[i].timestamp,
      success: source[i].success,
      details: source[i].details
    });
  }
  return list;
}

function lastHistory(manager: HfpProfileManager): HistoryView {
  const list = historyOf(manager);
  return list[list.length - 1];
}

function currentCallOf(manager: HfpProfileManager): CallView | null {
  const info: HfpCallInfo | null = manager.getCurrentCall();
  if (info === null) {
    return null;
  }
  return {
    phoneNumber: info.phoneNumber,
    contactName: info.contactName,
    callState: info.callState,
    callDirection: info.callDirection,
    startTime: info.startTime,
    endTime: info.endTime,
    durationSec: info.durationSec,
    isOnHold: info.isOnHold,
    isConference: info.isConference,
    participantCount: info.participantCount,
    callType: info.callType,
    networkType: info.networkType,
    hdVoiceEnabled: info.hdVoiceEnabled,
    echoCancellation: info.echoCancellation,
    noiseReduction: info.noiseReduction
  };
}

function callHistoryOf(manager: HfpProfileManager): CallView[] {
  const source: HfpCallInfo[] = manager.getCallHistory();
  const list: CallView[] = [];
  const length: number = source.length;
  for (let i = 0; i < length; i++) {
    list.push({
      phoneNumber: source[i].phoneNumber,
      contactName: source[i].contactName,
      callState: source[i].callState,
      callDirection: source[i].callDirection,
      startTime: source[i].startTime,
      endTime: source[i].endTime,
      durationSec: source[i].durationSec,
      isOnHold: source[i].isOnHold,
      isConference: source[i].isConference,
      participantCount: source[i].participantCount,
      callType: source[i].callType,
      networkType: source[i].networkType,
      hdVoiceEnabled: source[i].hdVoiceEnabled,
      echoCancellation: source[i].echoCancellation,
      noiseReduction: source[i].noiseReduction
    });
  }
  return list;
}

function networkOf(manager: HfpProfileManager): NetworkView | null {
  const info: HfpNetworkInfo | null = manager.getNetworkInfo();
  if (info === null) {
    return null;
  }
  return {
    registrationStatus: info.registrationStatus,
    carrierName: info.carrierName,
    signalStrength: info.signalStrength,
    networkType: info.networkType,
    isRoaming: info.isRoaming,
    volteAvailable: info.volteAvailable,
    cellId: info.cellId,
    locationAreaCode: info.locationAreaCode,
    mcc: info.mcc,
    mnc: info.mnc
  };
}

function audioOf(manager: HfpProfileManager): AudioView | null {
  const info: HfpAudioConfig | null = manager.getAudioConfig();
  if (info === null) {
    return null;
  }
  return {
    micVolume: info.micVolume,
    speakerVolume: info.speakerVolume,
    isMuted: info.isMuted,
    isSpeakerOn: info.isSpeakerOn,
    echoCancellation: info.echoCancellation,
    noiseSuppression: info.noiseSuppression,
    voiceCodec: info.voiceCodec,
    sampleRate: info.sampleRate,
    widebandSpeech: info.widebandSpeech,
    audioRouting: info.audioRouting
  };
}

function batteryOf(manager: HfpProfileManager): BatteryView | null {
  const info: HfpBatteryInfo | null = manager.getBatteryInfo();
  if (info === null) {
    return null;
  }
  return {
    level: info.level,
    isCharging: info.isCharging,
    estimatedTimeMinutes: info.estimatedTimeMinutes,
    healthStatus: info.healthStatus,
    temperature: info.temperature,
    voltage: info.voltage,
    chargeCycles: info.chargeCycles
  };
}

function serviceOf(manager: HfpProfileManager): ServiceView {
  const stats: HfpServiceStatistics = manager.getService().getStatistics();
  const callbacks: ServiceCallbackCounts = stats.callbackCounts;
  return {
    serviceName: stats.serviceName,
    isInitialized: stats.isInitialized,
    connectionState: stats.connectionState,
    connectedDeviceCount: stats.connectedDeviceCount,
    activeCallCount: stats.activeCallCount,
    totalCallsInHistory: stats.totalCallsInHistory,
    voiceRecognitionActive: stats.voiceRecognitionActive,
    inBandRinging: stats.inBandRinging,
    threeWayCalling: stats.threeWayCalling,
    operationHistoryCount: stats.operationHistoryCount,
    callCallbackCount: callbacks.call ?? 0,
    audioCallbackCount: callbacks.audio ?? 0
  };
}

async function readyManager(): Promise<HfpProfileManager> {
  const manager: HfpProfileManager = new HfpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HfpProfileManager> {
  const manager: HfpProfileManager = new HfpProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

async function dialedManager(): Promise<HfpProfileManager> {
  const manager = await connectedManager(DEVICE_A);
  await manager.dialNumber(PHONE_NUMBER);
  return manager;
}

export default function hfpProfileCallTest(): void {
  describe('HfpProfileCallTest', () => {
    /*
     * @tc.number: SUB_HFP_CALL_0100
     * @tc.name: testHfpCall0001
     * @tc.desc: Verify that every call operation and getter is blocked before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0001', 'begin');
      const manager: HfpProfileManager = new HfpProfileManager();
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#2 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#3 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#4 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#5 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#6 assert ' + "expect(manager.getNetworkInfo()).assertNull()");
      expect(manager.getNetworkInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#7 assert ' + "expect(manager.getAudioConfig()).assertNull()");
      expect(manager.getAudioConfig()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#8 assert ' + "expect(manager.getBatteryInfo()).assertNull()");
      expect(manager.getBatteryInfo()).assertNull();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#9 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#10 assert ' + "expect(await manager.answerCall()).assertFalse()");
      expect(await manager.answerCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#11 assert ' + "expect(await manager.rejectCall()).assertFalse()");
      expect(await manager.rejectCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#12 assert ' + "expect(await manager.endCall()).assertFalse()");
      expect(await manager.endCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#13 assert ' + "expect(await manager.holdCall()).assertFalse()");
      expect(await manager.holdCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#14 assert ' + "expect(await manager.resumeCall()).assertFalse()");
      expect(await manager.resumeCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#15 assert ' + "expect(await manager.redialLastNumber()).assertFalse()");
      expect(await manager.redialLastNumber()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#16 assert ' + "expect(await manager.setMicVolume(30)).assertFalse()");
      expect(await manager.setMicVolume(30)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#17 assert ' + "expect(await manager.setSpeakerVolume(40)).assertFalse()");
      expect(await manager.setSpeakerVolume(40)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#18 assert ' + "expect(await manager.toggleMute()).assertFalse()");
      expect(await manager.toggleMute()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#19 assert ' + "expect(await manager.toggleSpeaker()).assertFalse()");
      expect(await manager.toggleSpeaker()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#20 assert ' + "expect(await manager.startVoiceRecognition()).assertFalse()");
      expect(await manager.startVoiceRecognition()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#21 assert ' + "expect(await manager.stopVoiceRecognition()).assertFalse()");
      expect(await manager.stopVoiceRecognition()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#22 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#23 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#24 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#25 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#26 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#27 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#28 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#29 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#30 ' + "stats.activeCallCount" + ' = ' + JSON.stringify(stats.activeCallCount));
      expect(stats.activeCallCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#31 ' + "stats.totalCallsInHistory" + ' = ' + JSON.stringify(stats.totalCallsInHistory));
      expect(stats.totalCallsInHistory).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0001',
        '#32 ' + "stats.voiceRecognitionActive" + ' = ' + JSON.stringify(stats.voiceRecognitionActive));
      expect(stats.voiceRecognitionActive).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0001', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0200
     * @tc.name: testHfpCall0002
     * @tc.desc: Verify call guards without a device while audio settings stay adjustable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#1 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#2 assert ' + "expect(historyOf(manager).length).assertEqual(1)");
      expect(historyOf(manager).length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#3 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#4 assert ' + "expect(await manager.answerCall()).assertFalse()");
      expect(await manager.answerCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#5 assert ' + "expect(await manager.rejectCall()).assertFalse()");
      expect(await manager.rejectCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#6 assert ' + "expect(await manager.endCall()).assertFalse()");
      expect(await manager.endCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#7 assert ' + "expect(await manager.startVoiceRecognition()).assertFalse()");
      expect(await manager.startVoiceRecognition()).assertFalse();
      const refused = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#8 ' + "refused.length" + ' = ' + JSON.stringify(refused.length));
      expect(refused.length).assertEqual(6);
      for (let i = 1; i < 6; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#9 ' + "refused[i].success" + ' = ' + JSON.stringify(refused[i].success));
        expect(refused[i].success).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#10 ' + "refused[i].details" + ' = ' + JSON.stringify(refused[i].details));
        expect(refused[i].details).assertEqual('Not connected');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#11 ' + "refused[1].operation" + ' = ' + JSON.stringify(refused[1].operation));
      expect(refused[1].operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#12 ' + "refused[5].operation" + ' = ' + JSON.stringify(refused[5].operation));
      expect(refused[5].operation).assertEqual('startVoiceRecognition');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#13 assert ' + "expect(await manager.holdCall()).assertFalse()");
      expect(await manager.holdCall()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#14 assert ' + "expect(await manager.resumeCall()).assertFalse()");
      expect(await manager.resumeCall()).assertFalse();
      const holdGuard = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#15 ' + "holdGuard[6].details" + ' = ' + JSON.stringify(holdGuard[6].details));
      expect(holdGuard[6].details).assertEqual('No active call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#16 ' + "holdGuard[7].details" + ' = ' + JSON.stringify(holdGuard[7].details));
      expect(holdGuard[7].details).assertEqual('No held call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#17 ' + "holdGuard.length" + ' = ' + JSON.stringify(holdGuard.length));
      expect(holdGuard.length).assertEqual(8);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#18 assert ' + "expect(await manager.setMicVolume(30)).assertTrue()");
      expect(await manager.setMicVolume(30)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#19 assert ' + "expect(await manager.setSpeakerVolume(40)).assertTrue()");
      expect(await manager.setSpeakerVolume(40)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#20 assert ' + "expect(await manager.toggleMute()).assertTrue()");
      expect(await manager.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#21 assert ' + "expect(await manager.toggleSpeaker()).assertTrue()");
      expect(await manager.toggleSpeaker()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#22 assert ' + "expect(await manager.stopVoiceRecognition()).assertTrue()");
      expect(await manager.stopVoiceRecognition()).assertTrue();

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#23 ' + "model.micVolume" + ' = ' + JSON.stringify(model.micVolume));
      expect(model.micVolume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#24 ' + "model.speakerVolume" + ' = ' + JSON.stringify(model.speakerVolume));
      expect(model.speakerVolume).assertEqual(40);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#25 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#26 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#27 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#28 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');

      const audio = audioOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#29 ' + "audio !== null" + ' = ' + JSON.stringify(audio !== null));
      expect(audio !== null).assertTrue();
      if (audio !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#30 ' + "audio.micVolume" + ' = ' + JSON.stringify(audio.micVolume));
        expect(audio.micVolume).assertEqual(30);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#31 ' + "audio.speakerVolume" + ' = ' + JSON.stringify(audio.speakerVolume));
        expect(audio.speakerVolume).assertEqual(40);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#32 ' + "audio.isMuted" + ' = ' + JSON.stringify(audio.isMuted));
        expect(audio.isMuted).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#33 ' + "audio.isSpeakerOn" + ' = ' + JSON.stringify(audio.isSpeakerOn));
        expect(audio.isSpeakerOn).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0002',
          '#34 ' + "audio.audioRouting" + ' = ' + JSON.stringify(audio.audioRouting));
        expect(audio.audioRouting).assertEqual('speaker');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#35 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#36 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(0)");
      expect(manager.getService().getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#37 assert ' + "expect(manager.getService().isVoiceRecognitionActive()).assertFalse()");
      expect(manager.getService().isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#38 assert ' + "expect(historyOf(manager).length).assertEqual(13)");
      expect(historyOf(manager).length).assertEqual(13);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#39 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0002',
        '#40 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0002', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0300
     * @tc.name: testHfpCall0003
     * @tc.desc: Verify the call record built by a successful dial request and its notifications.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0003', 'begin');
      const manager: HfpProfileManager = new HfpProfileManager();
      const service = manager.getService();
      let dataCount: number = 0;
      let callCount: number = 0;
      let connectionCount: number = 0;
      const dataCallback = (): void => {
        dataCount += 1;
      };
      const callCallback = (): void => {
        callCount += 1;
      };
      const connectionCallback = (): void => {
        connectionCount += 1;
      };
      service.addDataCallback(dataCallback);
      service.addCallCallback(callCallback);
      service.addConnectionCallback(connectionCallback);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#1 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#2 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#3 ' + "connectionCount" + ' = ' + JSON.stringify(connectionCount));
      expect(connectionCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#4 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#5 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#6 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      const call = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#7 ' + "call !== null" + ' = ' + JSON.stringify(call !== null));
      expect(call !== null).assertTrue();
      if (call !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#8 ' + "call.phoneNumber" + ' = ' + JSON.stringify(call.phoneNumber));
        expect(call.phoneNumber).assertEqual(PHONE_NUMBER);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#9 ' + "call.contactName" + ' = ' + JSON.stringify(call.contactName));
        expect(call.contactName).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#10 ' + "call.callState" + ' = ' + JSON.stringify(call.callState));
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#11 ' + "call.callDirection" + ' = ' + JSON.stringify(call.callDirection));
        expect(call.callDirection).assertEqual('outgoing');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#12 ' + "call.endTime" + ' = ' + JSON.stringify(call.endTime));
        expect(call.endTime).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#13 ' + "call.durationSec" + ' = ' + JSON.stringify(call.durationSec));
        expect(call.durationSec).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#14 ' + "call.isOnHold" + ' = ' + JSON.stringify(call.isOnHold));
        expect(call.isOnHold).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#15 ' + "call.isConference" + ' = ' + JSON.stringify(call.isConference));
        expect(call.isConference).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#16 ' + "call.participantCount" + ' = ' + JSON.stringify(call.participantCount));
        expect(call.participantCount).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#17 ' + "call.callType" + ' = ' + JSON.stringify(call.callType));
        expect(call.callType).assertEqual('voice');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#18 ' + "call.networkType" + ' = ' + JSON.stringify(call.networkType));
        expect(call.networkType).assertEqual('4G');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#19 ' + "call.hdVoiceEnabled" + ' = ' + JSON.stringify(call.hdVoiceEnabled));
        expect(call.hdVoiceEnabled).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#20 ' + "call.echoCancellation" + ' = ' + JSON.stringify(call.echoCancellation));
        expect(call.echoCancellation).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#21 ' + "call.noiseReduction" + ' = ' + JSON.stringify(call.noiseReduction));
        expect(call.noiseReduction).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0003',
          '#22 ' + "call.startTime > 0" + ' = ' + JSON.stringify(call.startTime > 0));
        expect(call.startTime > 0).assertTrue();
      }

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#23 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#24 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual(PHONE_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#25 assert ' + "expect(service.getActiveCallCount()).assertEqual(1)");
      expect(service.getActiveCallCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#26 assert ' + "expect(serviceOf(manager).activeCallCount).assertEqual(1)");
      expect(serviceOf(manager).activeCallCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#27 assert ' + "expect(serviceOf(manager).totalCallsInHistory).assertEqual(0)");
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#28 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#29 assert ' + "expect(manager.getStatistics().connectedDeviceCount).assertEqual(1)");
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(1);

      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#30 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#31 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#32 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual(`Dialing ${PHONE_NUMBER}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#33 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#34 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0003',
        '#35 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);

      service.removeDataCallback(dataCallback);
      service.removeCallCallback(callCallback);
      service.removeConnectionCallback(connectionCallback);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0003', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0400
     * @tc.name: testHfpCall0004
     * @tc.desc: Verify that an empty number is refused while a blank number starts a call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0004', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#1 assert ' + "expect(await manager.dialNumber('')).assertFalse()");
      expect(await manager.dialNumber('')).assertFalse();
      const empty = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#2 ' + "empty.operation" + ' = ' + JSON.stringify(empty.operation));
      expect(empty.operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#3 ' + "empty.success" + ' = ' + JSON.stringify(empty.success));
      expect(empty.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#4 ' + "empty.details" + ' = ' + JSON.stringify(empty.details));
      expect(empty.details).assertEqual('Empty phone number');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#5 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#6 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#7 assert ' + "expect(manager.getModel().phoneNumber).assertEqual('')");
      expect(manager.getModel().phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#8 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(0)");
      expect(manager.getService().getActiveCallCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#9 assert ' + "expect(await manager.dialNumber(BLANK_NUMBER)).assertTrue()");
      expect(await manager.dialNumber(BLANK_NUMBER)).assertTrue();
      const call = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#10 ' + "call !== null" + ' = ' + JSON.stringify(call !== null));
      expect(call !== null).assertTrue();
      if (call !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0004',
          '#11 ' + "call.phoneNumber" + ' = ' + JSON.stringify(call.phoneNumber));
        expect(call.phoneNumber).assertEqual(BLANK_NUMBER);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0004',
          '#12 ' + "call.callState" + ' = ' + JSON.stringify(call.callState));
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#13 assert ' + "expect(manager.getModel().phoneNumber).assertEqual(BLANK_NUMBER)");
      expect(manager.getModel().phoneNumber).assertEqual(BLANK_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#14 assert ' + "expect(lastHistory(manager).details).assertEqual(`Dialing ${BLANK_NUMBER}`)");
      expect(lastHistory(manager).details).assertEqual(`Dialing ${BLANK_NUMBER}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0004',
        '#15 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(1)");
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0004', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0500
     * @tc.name: testHfpCall0005
     * @tc.desc: Verify that answering without an established call report success and raise the active count.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#1 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#2 assert ' + "expect(await manager.answerCall()).assertTrue()");
      expect(await manager.answerCall()).assertTrue();

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#3 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#4 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#5 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(1)");
      expect(manager.getService().getActiveCallCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#6 assert ' + "expect(serviceOf(manager).activeCallCount).assertEqual(1)");
      expect(serviceOf(manager).activeCallCount).assertEqual(1);
      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#7 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('answerCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#8 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#9 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Call answered');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#10 assert ' + "expect(await manager.answerCall()).assertTrue()");
      expect(await manager.answerCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#11 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(2)");
      expect(manager.getService().getActiveCallCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#12 assert ' + "expect(historyOf(manager).length).assertEqual(4)");
      expect(historyOf(manager).length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0005',
        '#13 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0005', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0600
     * @tc.name: testHfpCall0006
     * @tc.desc: Verify that answering a dialed call switches the call record to the active state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0006', 'begin');
      const manager = await dialedManager();
      const beforeAnswer = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#1 ' + "beforeAnswer !== null" + ' = ' + JSON.stringify(beforeAnswer !== null));
      expect(beforeAnswer !== null).assertTrue();
      const startedBefore = beforeAnswer !== null ? beforeAnswer.startTime : 0;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#2 ' + "startedBefore > 0" + ' = ' + JSON.stringify(startedBefore > 0));
      expect(startedBefore > 0).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#3 assert ' + "expect(await manager.answerCall()).assertTrue()");
      expect(await manager.answerCall()).assertTrue();
      const afterAnswer = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#4 ' + "afterAnswer !== null" + ' = ' + JSON.stringify(afterAnswer !== null));
      expect(afterAnswer !== null).assertTrue();
      if (afterAnswer !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0006',
          '#5 ' + "afterAnswer.callState" + ' = ' + JSON.stringify(afterAnswer.callState));
        expect(afterAnswer.callState).assertEqual(CALL_STATE_ACTIVE);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0006',
          '#6 ' + "afterAnswer.phoneNumber" + ' = ' + JSON.stringify(afterAnswer.phoneNumber));
        expect(afterAnswer.phoneNumber).assertEqual(PHONE_NUMBER);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0006',
          '#7 ' + "afterAnswer.isOnHold" + ' = ' + JSON.stringify(afterAnswer.isOnHold));
        expect(afterAnswer.isOnHold).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0006',
          '#8 ' + "afterAnswer.startTime >= startedBefore" + ' = ' +
          JSON.stringify(afterAnswer.startTime >= startedBefore));
        expect(afterAnswer.startTime >= startedBefore).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#9 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#10 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(2)");
      expect(manager.getService().getActiveCallCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#11 assert ' + "expect(lastHistory(manager).details).assertEqual('Call answered')");
      expect(lastHistory(manager).details).assertEqual('Call answered');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0006',
        '#12 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0006', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0700
     * @tc.name: testHfpCall0007
     * @tc.desc: Verify holding and resuming a call and the guard that blocks a second resume.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0007', 'begin');
      const manager = await dialedManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#1 assert ' + "expect(await manager.holdCall()).assertTrue()");
      expect(await manager.holdCall()).assertTrue();
      const held = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#2 ' + "held !== null" + ' = ' + JSON.stringify(held !== null));
      expect(held !== null).assertTrue();
      if (held !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0007',
          '#3 ' + "held.isOnHold" + ' = ' + JSON.stringify(held.isOnHold));
        expect(held.isOnHold).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0007',
          '#4 ' + "held.callState" + ' = ' + JSON.stringify(held.callState));
        expect(held.callState).assertEqual(CALL_STATE_DIALING);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#5 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_HOLD)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_HOLD);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#6 assert ' + "expect(lastHistory(manager).details).assertEqual('Call on hold')");
      expect(lastHistory(manager).details).assertEqual('Call on hold');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#7 assert ' + "expect(await manager.resumeCall()).assertTrue()");
      expect(await manager.resumeCall()).assertTrue();
      const resumed = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#8 ' + "resumed !== null" + ' = ' + JSON.stringify(resumed !== null));
      expect(resumed !== null).assertTrue();
      if (resumed !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0007',
          '#9 ' + "resumed.isOnHold" + ' = ' + JSON.stringify(resumed.isOnHold));
        expect(resumed.isOnHold).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0007',
          '#10 ' + "resumed.callState" + ' = ' + JSON.stringify(resumed.callState));
        expect(resumed.callState).assertEqual(CALL_STATE_DIALING);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#11 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#12 assert ' + "expect(lastHistory(manager).details).assertEqual('Call resumed')");
      expect(lastHistory(manager).details).assertEqual('Call resumed');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#13 assert ' + "expect(await manager.resumeCall()).assertFalse()");
      expect(await manager.resumeCall()).assertFalse();
      const guard = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#14 ' + "guard.operation" + ' = ' + JSON.stringify(guard.operation));
      expect(guard.operation).assertEqual('resumeCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#15 ' + "guard.success" + ' = ' + JSON.stringify(guard.success));
      expect(guard.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#16 ' + "guard.details" + ' = ' + JSON.stringify(guard.details));
      expect(guard.details).assertEqual('No held call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#17 assert ' + "expect(historyOf(manager).length).assertEqual(6)");
      expect(historyOf(manager).length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0007',
        '#18 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(1)");
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0007', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0800
     * @tc.name: testHfpCall0008
     * @tc.desc: Verify that hold and resume keep working after the device has been disconnected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0008', 'begin');
      const manager = await dialedManager();
      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#1 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#3 assert ' +
        "expect(manager.getService().getConnectionState()) .assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#4 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#5 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual(PHONE_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#6 assert ' + "expect(currentCallOf(manager) !== null).assertTrue()");
      expect(currentCallOf(manager) !== null).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#7 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(1)");
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#8 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#9 assert ' + "expect(lastHistory(manager).details).assertEqual('Not connected')");
      expect(lastHistory(manager).details).assertEqual('Not connected');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#10 assert ' + "expect(await manager.holdCall()).assertTrue()");
      expect(await manager.holdCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#11 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_HOLD);
      const held = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#12 ' + "held !== null" + ' = ' + JSON.stringify(held !== null));
      expect(held !== null).assertTrue();
      if (held !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0008',
          '#13 ' + "held.isOnHold" + ' = ' + JSON.stringify(held.isOnHold));
        expect(held.isOnHold).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#14 assert ' + "expect(await manager.resumeCall()).assertTrue()");
      expect(await manager.resumeCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#15 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#16 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#17 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#18 assert ' + "expect(await manager.endCall()).assertTrue()");
      expect(await manager.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#19 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#20 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');
      const archived = callHistoryOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#21 ' + "archived.length" + ' = ' + JSON.stringify(archived.length));
      expect(archived.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#22 ' + "archived[0].phoneNumber" + ' = ' + JSON.stringify(archived[0].phoneNumber));
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0008',
        '#23 ' + "archived[0].callState" + ' = ' + JSON.stringify(archived[0].callState));
      expect(archived[0].callState).assertEqual(CALL_STATE_ENDED);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0008', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_0900
     * @tc.name: testHfpCall0009
     * @tc.desc: Verify that ending a call archives the record and clears the active call context.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0009', 'begin');
      const manager = await dialedManager();
      const service = manager.getService();
      let callCount: number = 0;
      const callCallback = (): void => {
        callCount += 1;
      };
      service.addCallCallback(callCallback);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#1 assert ' + "expect(await manager.endCall()).assertTrue()");
      expect(await manager.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#2 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      const archived = callHistoryOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#3 ' + "archived.length" + ' = ' + JSON.stringify(archived.length));
      expect(archived.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#4 ' + "archived[0].callState" + ' = ' + JSON.stringify(archived[0].callState));
      expect(archived[0].callState).assertEqual(CALL_STATE_ENDED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#5 ' + "archived[0].phoneNumber" + ' = ' + JSON.stringify(archived[0].phoneNumber));
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#6 ' + "archived[0].callDirection" + ' = ' + JSON.stringify(archived[0].callDirection));
      expect(archived[0].callDirection).assertEqual('outgoing');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#7 ' + "archived[0].callType" + ' = ' + JSON.stringify(archived[0].callType));
      expect(archived[0].callType).assertEqual('voice');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#8 ' + "archived[0].endTime >= archived[0].startTime" + ' = ' +
        JSON.stringify(archived[0].endTime >= archived[0].startTime));
      expect(archived[0].endTime >= archived[0].startTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#9 ' + "archived[0].durationSec" + ' = ' + JSON.stringify(archived[0].durationSec));
      expect(archived[0].durationSec).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#10 ' + "archived[0].isOnHold" + ' = ' + JSON.stringify(archived[0].isOnHold));
      expect(archived[0].isOnHold).assertFalse();

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#11 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#12 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#13 ' + "model.callDuration" + ' = ' + JSON.stringify(model.callDuration));
      expect(model.callDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#14 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#15 assert ' + "expect(serviceOf(manager).totalCallsInHistory).assertEqual(1)");
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(1);
      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#16 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('endCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#17 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#18 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Call ended');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#19 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#20 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0009',
        '#21 ' + "callCount" + ' = ' + JSON.stringify(callCount));
      expect(callCount).assertEqual(1);
      service.removeCallCallback(callCallback);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0009', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1000
     * @tc.name: testHfpCall0010
     * @tc.desc: Verify that rejecting a call archives a rejected record without a call duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0010', 'begin');
      const manager = await dialedManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#1 assert ' + "expect(await manager.rejectCall()).assertTrue()");
      expect(await manager.rejectCall()).assertTrue();

      const archived = callHistoryOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#2 ' + "archived.length" + ' = ' + JSON.stringify(archived.length));
      expect(archived.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#3 ' + "archived[0].callState" + ' = ' + JSON.stringify(archived[0].callState));
      expect(archived[0].callState).assertEqual(CALL_STATE_REJECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#4 ' + "archived[0].phoneNumber" + ' = ' + JSON.stringify(archived[0].phoneNumber));
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#5 ' + "archived[0].endTime > 0" + ' = ' + JSON.stringify(archived[0].endTime > 0));
      expect(archived[0].endTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#6 ' + "archived[0].durationSec" + ' = ' + JSON.stringify(archived[0].durationSec));
      expect(archived[0].durationSec).assertEqual(0);
      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#7 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('rejectCall');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#8 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#9 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Call rejected');

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#10 ' + "model.callState" + ' = ' + JSON.stringify(model.callState));
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#11 ' + "model.phoneNumber" + ' = ' + JSON.stringify(model.phoneNumber));
      expect(model.phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#12 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#13 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(0)");
      expect(manager.getService().getActiveCallCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#14 assert ' + "expect(await manager.rejectCall()).assertTrue()");
      expect(await manager.rejectCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#15 assert ' + "expect(callHistoryOf(manager).length).assertEqual(1)");
      expect(callHistoryOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#16 assert ' + "expect(lastHistory(manager).details).assertEqual('Call rejected')");
      expect(lastHistory(manager).details).assertEqual('Call rejected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0010',
        '#17 assert ' + "expect(historyOf(manager).length).assertEqual(5)");
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0010', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1100
     * @tc.name: testHfpCall0011
     * @tc.desc: Verify that redial without any previous call is refused and logged under the redial label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#1 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#2 assert ' + "expect(await manager.redialLastNumber()).assertFalse()");
      expect(await manager.redialLastNumber()).assertFalse();

      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#3 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#4 ' + "last.operation === 'redialLastNumber'" + ' = ' +
        JSON.stringify(last.operation === 'redialLastNumber'));
      expect(last.operation === 'redialLastNumber').assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#5 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#6 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('No previous call to redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#7 assert ' + "expect(historyOf(manager).length).assertEqual(3)");
      expect(historyOf(manager).length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#8 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#9 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#10 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(0)");
      expect(manager.getService().getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#11 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0011',
        '#12 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(2)");
      expect(manager.getStatistics().totalOperations).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0011', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1200
     * @tc.name: testHfpCall0012
     * @tc.desc: Verify that redial repeats the archived number and creates a fresh dialing record.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0012', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0012', 'begin');
      const manager = await dialedManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#1 assert ' + "expect(await manager.endCall()).assertTrue()");
      expect(await manager.endCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#2 assert ' + "expect(historyOf(manager).length).assertEqual(4)");
      expect(historyOf(manager).length).assertEqual(4);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#3 assert ' + "expect(await manager.redialLastNumber()).assertTrue()");
      expect(await manager.redialLastNumber()).assertTrue();
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#4 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#5 ' + "history[4].operation" + ' = ' + JSON.stringify(history[4].operation));
      expect(history[4].operation).assertEqual('dialNumber');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#6 ' + "history[4].details" + ' = ' + JSON.stringify(history[4].details));
      expect(history[4].details).assertEqual(`Dialing ${PHONE_NUMBER}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#7 ' + "history[5].operation" + ' = ' + JSON.stringify(history[5].operation));
      expect(history[5].operation).assertEqual('redial');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#8 ' + "history[5].success" + ' = ' + JSON.stringify(history[5].success));
      expect(history[5].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#9 ' + "history[5].details" + ' = ' + JSON.stringify(history[5].details));
      expect(history[5].details).assertEqual(`Redialing ${PHONE_NUMBER}`);

      const call = currentCallOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#10 ' + "call !== null" + ' = ' + JSON.stringify(call !== null));
      expect(call !== null).assertTrue();
      if (call !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0012',
          '#11 ' + "call.phoneNumber" + ' = ' + JSON.stringify(call.phoneNumber));
        expect(call.phoneNumber).assertEqual(PHONE_NUMBER);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0012',
          '#12 ' + "call.callState" + ' = ' + JSON.stringify(call.callState));
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0012',
          '#13 ' + "call.callDirection" + ' = ' + JSON.stringify(call.callDirection));
        expect(call.callDirection).assertEqual('outgoing');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#14 assert ' + "expect(manager.getModel().callState).assertEqual(CALL_STATE_DIALING)");
      expect(manager.getModel().callState).assertEqual(CALL_STATE_DIALING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#15 assert ' + "expect(manager.getCallHistory().length).assertEqual(1)");
      expect(manager.getCallHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#16 assert ' + "expect(serviceOf(manager).totalCallsInHistory).assertEqual(1)");
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0012',
        '#17 assert ' + "expect(manager.getService().getActiveCallCount()).assertEqual(1)");
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0012', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1300
     * @tc.name: testHfpCall0013
     * @tc.desc: Verify microphone and speaker volume clamping across invalid and fractional input values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHfpCall0013', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0013', 'begin');
      const manager = await readyManager();
      const inputs: number[] = [-10, 150, 33.6, 0, 100, 55.5];
      const expected: number[] = [0, 100, 34, 0, 100, 56];
      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#1 assert ' + "expect(await manager.setMicVolume(inputs[i])).assertTrue()");
        expect(await manager.setMicVolume(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#2 assert ' + "expect(manager.getModel().micVolume).assertEqual(expected[i])");
        expect(manager.getModel().micVolume).assertEqual(expected[i]);
        const micAudio = audioOf(manager);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#3 ' + "micAudio !== null" + ' = ' + JSON.stringify(micAudio !== null));
        expect(micAudio !== null).assertTrue();
        if (micAudio !== null) {
          hilog.info(0xF811,
            '[Sample_BluetoothBaseProfile] testHfpCall0013',
            '#4 ' + "micAudio.micVolume" + ' = ' + JSON.stringify(micAudio.micVolume));
          expect(micAudio.micVolume).assertEqual(expected[i]);
        }
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#5 assert ' + "expect(lastHistory(manager).details).assertEqual(`Mic volume: ${expected[i]}`)");
        expect(lastHistory(manager).details).assertEqual(`Mic volume: ${expected[i]}`);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0013',
        '#6 assert ' + "expect(historyOf(manager).length).assertEqual(7)");
      expect(historyOf(manager).length).assertEqual(7);

      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#7 assert ' + "expect(await manager.setSpeakerVolume(inputs[i])).assertTrue()");
        expect(await manager.setSpeakerVolume(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#8 assert ' + "expect(manager.getModel().speakerVolume).assertEqual(expected[i])");
        expect(manager.getModel().speakerVolume).assertEqual(expected[i]);
        const speakerAudio = audioOf(manager);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#9 ' + "speakerAudio !== null" + ' = ' + JSON.stringify(speakerAudio !== null));
        expect(speakerAudio !== null).assertTrue();
        if (speakerAudio !== null) {
          hilog.info(0xF811,
            '[Sample_BluetoothBaseProfile] testHfpCall0013',
            '#10 ' + "speakerAudio.speakerVolume" + ' = ' + JSON.stringify(speakerAudio.speakerVolume));
          expect(speakerAudio.speakerVolume).assertEqual(expected[i]);
          hilog.info(0xF811,
            '[Sample_BluetoothBaseProfile] testHfpCall0013',
            '#11 ' + "speakerAudio.isMuted" + ' = ' + JSON.stringify(speakerAudio.isMuted));
          expect(speakerAudio.isMuted).assertFalse();
        }
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0013',
          '#12 assert ' + "expect(lastHistory(manager).details).assertEqual(`Speaker volume: ${expected[i]}`)");
        expect(lastHistory(manager).details).assertEqual(`Speaker volume: ${expected[i]}`);
      }
      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0013',
        '#13 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(13);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0013',
        '#14 ' + "stats.activeCallCount" + ' = ' + JSON.stringify(stats.activeCallCount));
      expect(stats.activeCallCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0013',
        '#15 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0013',
        '#16 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0013', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1400
     * @tc.name: testHfpCall0014
     * @tc.desc: Verify mute and speaker toggling flips both the model and the audio routing path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0014', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0014', 'begin');
      const manager = await readyManager();
      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#1 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#2 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#3 assert ' + "expect(await manager.toggleMute()).assertTrue()");
      expect(await manager.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#4 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#5 assert ' + "expect(lastHistory(manager).details).assertEqual('Muted: true')");
      expect(lastHistory(manager).details).assertEqual('Muted: true');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#6 assert ' + "expect(await manager.toggleMute()).assertTrue()");
      expect(await manager.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#7 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#8 assert ' + "expect(lastHistory(manager).details).assertEqual('Muted: false')");
      expect(lastHistory(manager).details).assertEqual('Muted: false');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#9 assert ' + "expect(await manager.toggleMute()).assertTrue()");
      expect(await manager.toggleMute()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#10 ' + "model.isMuted" + ' = ' + JSON.stringify(model.isMuted));
      expect(model.isMuted).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#11 assert ' + "expect(await manager.toggleSpeaker()).assertTrue()");
      expect(await manager.toggleSpeaker()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#12 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertTrue();
      const speakerOn = audioOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#13 ' + "speakerOn !== null" + ' = ' + JSON.stringify(speakerOn !== null));
      expect(speakerOn !== null).assertTrue();
      if (speakerOn !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#14 ' + "speakerOn.audioRouting" + ' = ' + JSON.stringify(speakerOn.audioRouting));
        expect(speakerOn.audioRouting).assertEqual('speaker');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#15 ' + "speakerOn.isSpeakerOn" + ' = ' + JSON.stringify(speakerOn.isSpeakerOn));
        expect(speakerOn.isSpeakerOn).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#16 ' + "speakerOn.isMuted" + ' = ' + JSON.stringify(speakerOn.isMuted));
        expect(speakerOn.isMuted).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#17 ' + "speakerOn.micVolume" + ' = ' + JSON.stringify(speakerOn.micVolume));
        expect(speakerOn.micVolume).assertEqual(DEFAULT_VOLUME);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#18 assert ' + "expect(lastHistory(manager).details).assertEqual('Speaker: true')");
      expect(lastHistory(manager).details).assertEqual('Speaker: true');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#19 assert ' + "expect(await manager.toggleSpeaker()).assertTrue()");
      expect(await manager.toggleSpeaker()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#20 ' + "model.isSpeakerOn" + ' = ' + JSON.stringify(model.isSpeakerOn));
      expect(model.isSpeakerOn).assertFalse();
      const speakerOff = audioOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#21 ' + "speakerOff !== null" + ' = ' + JSON.stringify(speakerOff !== null));
      expect(speakerOff !== null).assertTrue();
      if (speakerOff !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#22 ' + "speakerOff.audioRouting" + ' = ' + JSON.stringify(speakerOff.audioRouting));
        expect(speakerOff.audioRouting).assertEqual('bluetooth');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0014',
          '#23 ' + "speakerOff.isSpeakerOn" + ' = ' + JSON.stringify(speakerOff.isSpeakerOn));
        expect(speakerOff.isSpeakerOn).assertFalse();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#24 assert ' + "expect(serviceOf(manager).audioCallbackCount).assertEqual(0)");
      expect(serviceOf(manager).audioCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#25 assert ' + "expect(historyOf(manager).length).assertEqual(6)");
      expect(historyOf(manager).length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0014',
        '#26 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0014', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1500
     * @tc.name: testHfpCall0015
     * @tc.desc: Verify voice recognition start and stop behaviour on every connection state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0015', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0015', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#1 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#2 assert ' + "expect(await manager.startVoiceRecognition()).assertTrue()");
      expect(await manager.startVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#3 assert ' + "expect(service.isVoiceRecognitionActive()).assertTrue()");
      expect(service.isVoiceRecognitionActive()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#4 assert ' + "expect(serviceOf(manager).voiceRecognitionActive).assertTrue()");
      expect(serviceOf(manager).voiceRecognitionActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#5 assert ' + "expect(lastHistory(manager).details).assertEqual('Voice recognition started')");
      expect(lastHistory(manager).details).assertEqual('Voice recognition started');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#6 assert ' + "expect(await manager.startVoiceRecognition()).assertTrue()");
      expect(await manager.startVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#7 assert ' + "expect(service.isVoiceRecognitionActive()).assertTrue()");
      expect(service.isVoiceRecognitionActive()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#8 assert ' + "expect(historyOf(manager).length).assertEqual(4)");
      expect(historyOf(manager).length).assertEqual(4);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#9 assert ' + "expect(await manager.stopVoiceRecognition()).assertTrue()");
      expect(await manager.stopVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#10 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#11 assert ' + "expect(lastHistory(manager).details).assertEqual('Voice recognition stopped')");
      expect(lastHistory(manager).details).assertEqual('Voice recognition stopped');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#12 assert ' + "expect(await manager.stopVoiceRecognition()).assertTrue()");
      expect(await manager.stopVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#13 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#14 assert ' + "expect(historyOf(manager).length).assertEqual(6)");
      expect(historyOf(manager).length).assertEqual(6);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#15 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#16 assert ' + "expect(await manager.startVoiceRecognition()).assertFalse()");
      expect(await manager.startVoiceRecognition()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#17 assert ' + "expect(lastHistory(manager).details).assertEqual('Not connected')");
      expect(lastHistory(manager).details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#18 assert ' + "expect(await manager.stopVoiceRecognition()).assertTrue()");
      expect(await manager.stopVoiceRecognition()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#19 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#20 assert ' + "expect(historyOf(manager).length).assertEqual(9)");
      expect(historyOf(manager).length).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0015',
        '#21 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0015', 'end');
    });

    /*
     * @tc.number: SUB_HFP_CALL_1600
     * @tc.name: testHfpCall0016
     * @tc.desc: Verify network, audio and battery snapshots and their state after a destroy cycle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHfpCall0016', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0016', 'begin');
      const manager: HfpProfileManager = new HfpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#1 assert ' + "expect(manager.getNetworkInfo()).assertNull()");
      expect(manager.getNetworkInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#2 assert ' + "expect(manager.getAudioConfig()).assertNull()");
      expect(manager.getAudioConfig()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#3 assert ' + "expect(manager.getBatteryInfo()).assertNull()");
      expect(manager.getBatteryInfo()).assertNull();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#4 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const network = networkOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#5 ' + "network !== null" + ' = ' + JSON.stringify(network !== null));
      expect(network !== null).assertTrue();
      if (network !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#6 ' + "network.registrationStatus" + ' = ' + JSON.stringify(network.registrationStatus));
        expect(network.registrationStatus).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#7 ' + "network.carrierName" + ' = ' + JSON.stringify(network.carrierName));
        expect(network.carrierName).assertEqual('Mock Carrier');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#8 ' + "network.signalStrength" + ' = ' + JSON.stringify(network.signalStrength));
        expect(network.signalStrength).assertEqual(-65);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#9 ' + "network.networkType" + ' = ' + JSON.stringify(network.networkType));
        expect(network.networkType).assertEqual('4G');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#10 ' + "network.isRoaming" + ' = ' + JSON.stringify(network.isRoaming));
        expect(network.isRoaming).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#11 ' + "network.volteAvailable" + ' = ' + JSON.stringify(network.volteAvailable));
        expect(network.volteAvailable).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#12 ' + "network.cellId" + ' = ' + JSON.stringify(network.cellId));
        expect(network.cellId).assertEqual('0x1234');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#13 ' + "network.locationAreaCode" + ' = ' + JSON.stringify(network.locationAreaCode));
        expect(network.locationAreaCode).assertEqual('0x0001');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#14 ' + "network.mcc" + ' = ' + JSON.stringify(network.mcc));
        expect(network.mcc).assertEqual('310');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#15 ' + "network.mnc" + ' = ' + JSON.stringify(network.mnc));
        expect(network.mnc).assertEqual('260');
      }
      const battery = batteryOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#16 ' + "battery !== null" + ' = ' + JSON.stringify(battery !== null));
      expect(battery !== null).assertTrue();
      if (battery !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#17 ' + "battery.level" + ' = ' + JSON.stringify(battery.level));
        expect(battery.level).assertEqual(85);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#18 ' + "battery.isCharging" + ' = ' + JSON.stringify(battery.isCharging));
        expect(battery.isCharging).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#19 ' + "battery.estimatedTimeMinutes" + ' = ' + JSON.stringify(battery.estimatedTimeMinutes));
        expect(battery.estimatedTimeMinutes).assertEqual(480);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#20 ' + "battery.healthStatus" + ' = ' + JSON.stringify(battery.healthStatus));
        expect(battery.healthStatus).assertEqual('good');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#21 ' + "battery.temperature" + ' = ' + JSON.stringify(battery.temperature));
        expect(battery.temperature).assertEqual(25);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#22 ' + "battery.voltage" + ' = ' + JSON.stringify(battery.voltage));
        expect(battery.voltage).assertEqual(3800);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#23 ' + "battery.chargeCycles" + ' = ' + JSON.stringify(battery.chargeCycles));
        expect(battery.chargeCycles).assertEqual(150);
      }
      const audio = audioOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#24 ' + "audio !== null" + ' = ' + JSON.stringify(audio !== null));
      expect(audio !== null).assertTrue();
      if (audio !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#25 ' + "audio.voiceCodec" + ' = ' + JSON.stringify(audio.voiceCodec));
        expect(audio.voiceCodec).assertEqual('CVSD');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#26 ' + "audio.sampleRate" + ' = ' + JSON.stringify(audio.sampleRate));
        expect(audio.sampleRate).assertEqual(8000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#27 ' + "audio.widebandSpeech" + ' = ' + JSON.stringify(audio.widebandSpeech));
        expect(audio.widebandSpeech).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#28 ' + "audio.echoCancellation" + ' = ' + JSON.stringify(audio.echoCancellation));
        expect(audio.echoCancellation).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#29 ' + "audio.noiseSuppression" + ' = ' + JSON.stringify(audio.noiseSuppression));
        expect(audio.noiseSuppression).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#30 ' + "audio.micVolume" + ' = ' + JSON.stringify(audio.micVolume));
        expect(audio.micVolume).assertEqual(DEFAULT_VOLUME);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#31 ' + "audio.audioRouting" + ' = ' + JSON.stringify(audio.audioRouting));
        expect(audio.audioRouting).assertEqual('bluetooth');
      }

      const first: HfpNetworkInfo | null = manager.getNetworkInfo();
      const second: HfpNetworkInfo | null = manager.getNetworkInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#32 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();
      if (first !== null) {
        first.carrierName = 'Tampered';
      }
      const untampered = networkOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#33 ' + "untampered !== null" + ' = ' + JSON.stringify(untampered !== null));
      expect(untampered !== null).assertTrue();
      if (untampered !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#34 ' + "untampered.carrierName" + ' = ' + JSON.stringify(untampered.carrierName));
        expect(untampered.carrierName).assertEqual('Mock Carrier');
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#35 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#36 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#37 assert ' + "expect(await manager.startVoiceRecognition()).assertTrue()");
      expect(await manager.startVoiceRecognition()).assertTrue();

      await manager.destroy();
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#38 assert ' + "expect(manager.getCurrentCall()).assertNull()");
      expect(manager.getCurrentCall()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#39 assert ' + "expect(manager.getCallHistory().length).assertEqual(0)");
      expect(manager.getCallHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#40 assert ' + "expect(manager.getNetworkInfo()).assertNull()");
      expect(manager.getNetworkInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#41 assert ' + "expect(manager.getAudioConfig()).assertNull()");
      expect(manager.getAudioConfig()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#42 assert ' + "expect(manager.getBatteryInfo()).assertNull()");
      expect(manager.getBatteryInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#43 assert ' + "expect(service.getActiveCallCount()).assertEqual(0)");
      expect(service.getActiveCallCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#44 assert ' + "expect(service.isVoiceRecognitionActive()).assertFalse()");
      expect(service.isVoiceRecognitionActive()).assertFalse();
      const serviceNetwork: HfpNetworkInfo | null = service.getNetworkInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#45 ' + "serviceNetwork !== null" + ' = ' + JSON.stringify(serviceNetwork !== null));
      expect(serviceNetwork !== null).assertTrue();
      if (serviceNetwork !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#46 ' + "serviceNetwork.carrierName" + ' = ' + JSON.stringify(serviceNetwork.carrierName));
        expect(serviceNetwork.carrierName).assertEqual('Mock Carrier');
      }
      const serviceAudio: HfpAudioConfig | null = service.getAudioConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#47 ' + "serviceAudio !== null" + ' = ' + JSON.stringify(serviceAudio !== null));
      expect(serviceAudio !== null).assertTrue();
      if (serviceAudio !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#48 ' + "serviceAudio.micVolume" + ' = ' + JSON.stringify(serviceAudio.micVolume));
        expect(serviceAudio.micVolume).assertEqual(DEFAULT_VOLUME);
      }
      const serviceBattery: HfpBatteryInfo | null = service.getBatteryInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#49 ' + "serviceBattery !== null" + ' = ' + JSON.stringify(serviceBattery !== null));
      expect(serviceBattery !== null).assertTrue();
      if (serviceBattery !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#50 ' + "serviceBattery.level" + ' = ' + JSON.stringify(serviceBattery.level));
        expect(serviceBattery.level).assertEqual(85);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#51 assert ' + "expect(historyOf(manager).length).assertEqual(1)");
      expect(historyOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#52 assert ' + "expect(historyOf(manager)[0].operation).assertEqual('reset')");
      expect(historyOf(manager)[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#53 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#54 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(4)");
      expect(manager.getStatistics().totalOperations).assertEqual(4);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#55 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const revived = networkOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#56 ' + "revived !== null" + ' = ' + JSON.stringify(revived !== null));
      expect(revived !== null).assertTrue();
      if (revived !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHfpCall0016',
          '#57 ' + "revived.carrierName" + ' = ' + JSON.stringify(revived.carrierName));
        expect(revived.carrierName).assertEqual('Mock Carrier');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHfpCall0016',
        '#58 assert ' + "expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse()");
      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHfpCall0016', 'end');
    });
  });
}
