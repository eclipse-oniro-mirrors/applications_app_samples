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
  HfpModel,
  HfpProfileManager,
  HfpService
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
  const info: ESObject = manager.getCurrentCall();
  if (info === null || info === undefined) {
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
  const source: ESObject = manager.getCallHistory();
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
  const info: ESObject = manager.getNetworkInfo();
  if (info === null || info === undefined) {
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
  const info: ESObject = manager.getAudioConfig();
  if (info === null || info === undefined) {
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
  const info: ESObject = manager.getBatteryInfo();
  if (info === null || info === undefined) {
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
  const stats: ESObject = manager.getService().getStatistics();
  const callbacks: ESObject = stats.callbackCounts;
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
    callCallbackCount: callbacks.call,
    audioCallbackCount: callbacks.audio
  };
}

async function readyManager(): Promise<HfpProfileManager> {
  const manager = new HfpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HfpProfileManager> {
  const manager = new HfpProfileManager();
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
      const manager = new HfpProfileManager();
      const service = manager.getService();
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getCallHistory().length).assertEqual(0);
      expect(manager.getNetworkInfo()).assertNull();
      expect(manager.getAudioConfig()).assertNull();
      expect(manager.getBatteryInfo()).assertNull();

      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      expect(await manager.answerCall()).assertFalse();
      expect(await manager.rejectCall()).assertFalse();
      expect(await manager.endCall()).assertFalse();
      expect(await manager.holdCall()).assertFalse();
      expect(await manager.resumeCall()).assertFalse();
      expect(await manager.redialLastNumber()).assertFalse();
      expect(await manager.setMicVolume(30)).assertFalse();
      expect(await manager.setSpeakerVolume(40)).assertFalse();
      expect(await manager.toggleMute()).assertFalse();
      expect(await manager.toggleSpeaker()).assertFalse();
      expect(await manager.startVoiceRecognition()).assertFalse();
      expect(await manager.stopVoiceRecognition()).assertFalse();

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(service.isVoiceRecognitionActive()).assertFalse();
      const stats = serviceOf(manager);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertFalse();
      expect(stats.activeCallCount).assertEqual(0);
      expect(stats.totalCallsInHistory).assertEqual(0);
      expect(stats.voiceRecognitionActive).assertFalse();
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
      const manager = await readyManager();
      expect(manager.isConnected()).assertFalse();
      expect(historyOf(manager).length).assertEqual(1);

      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      expect(await manager.answerCall()).assertFalse();
      expect(await manager.rejectCall()).assertFalse();
      expect(await manager.endCall()).assertFalse();
      expect(await manager.startVoiceRecognition()).assertFalse();
      const refused = historyOf(manager);
      expect(refused.length).assertEqual(6);
      for (let i = 1; i < 6; i++) {
        expect(refused[i].success).assertFalse();
        expect(refused[i].details).assertEqual('Not connected');
      }
      expect(refused[1].operation).assertEqual('dialNumber');
      expect(refused[5].operation).assertEqual('startVoiceRecognition');

      expect(await manager.holdCall()).assertFalse();
      expect(await manager.resumeCall()).assertFalse();
      const holdGuard = historyOf(manager);
      expect(holdGuard[6].details).assertEqual('No active call');
      expect(holdGuard[7].details).assertEqual('No held call');
      expect(holdGuard.length).assertEqual(8);

      expect(await manager.setMicVolume(30)).assertTrue();
      expect(await manager.setSpeakerVolume(40)).assertTrue();
      expect(await manager.toggleMute()).assertTrue();
      expect(await manager.toggleSpeaker()).assertTrue();
      expect(await manager.stopVoiceRecognition()).assertTrue();

      const model = manager.getModel();
      expect(model.micVolume).assertEqual(30);
      expect(model.speakerVolume).assertEqual(40);
      expect(model.isMuted).assertTrue();
      expect(model.isSpeakerOn).assertTrue();
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      expect(model.phoneNumber).assertEqual('');

      const audio = audioOf(manager);
      expect(audio !== null).assertTrue();
      if (audio !== null) {
        expect(audio.micVolume).assertEqual(30);
        expect(audio.speakerVolume).assertEqual(40);
        expect(audio.isMuted).assertTrue();
        expect(audio.isSpeakerOn).assertTrue();
        expect(audio.audioRouting).assertEqual('speaker');
      }
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getService().getActiveCallCount()).assertEqual(0);
      expect(manager.getService().isVoiceRecognitionActive()).assertFalse();
      expect(historyOf(manager).length).assertEqual(13);
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
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
      const manager = new HfpProfileManager();
      const service = manager.getService();
      let dataCount = 0;
      let callCount = 0;
      let connectionCount = 0;
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

      expect(await manager.initialize()).assertTrue();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(connectionCount).assertEqual(2);
      expect(dataCount).assertEqual(1);
      expect(callCount).assertEqual(0);

      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      const call = currentCallOf(manager);
      expect(call !== null).assertTrue();
      if (call !== null) {
        expect(call.phoneNumber).assertEqual(PHONE_NUMBER);
        expect(call.contactName).assertEqual('');
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
        expect(call.callDirection).assertEqual('outgoing');
        expect(call.endTime).assertEqual(0);
        expect(call.durationSec).assertEqual(0);
        expect(call.isOnHold).assertFalse();
        expect(call.isConference).assertFalse();
        expect(call.participantCount).assertEqual(1);
        expect(call.callType).assertEqual('voice');
        expect(call.networkType).assertEqual('4G');
        expect(call.hdVoiceEnabled).assertFalse();
        expect(call.echoCancellation).assertTrue();
        expect(call.noiseReduction).assertTrue();
        expect(call.startTime > 0).assertTrue();
      }

      const model = manager.getModel();
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      expect(model.phoneNumber).assertEqual(PHONE_NUMBER);
      expect(service.getActiveCallCount()).assertEqual(1);
      expect(serviceOf(manager).activeCallCount).assertEqual(1);
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(0);
      expect(manager.getCallHistory().length).assertEqual(0);
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(1);

      const last = lastHistory(manager);
      expect(last.operation).assertEqual('dialNumber');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual(`Dialing ${PHONE_NUMBER}`);
      expect(dataCount).assertEqual(2);
      expect(callCount).assertEqual(1);
      expect(manager.getOperationRecords().length).assertEqual(2);

      service.removeDataCallback(dataCallback);
      service.removeCallCallback(callCallback);
      service.removeConnectionCallback(connectionCallback);
      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.dialNumber('')).assertFalse();
      const empty = lastHistory(manager);
      expect(empty.operation).assertEqual('dialNumber');
      expect(empty.success).assertFalse();
      expect(empty.details).assertEqual('Empty phone number');
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE);
      expect(manager.getModel().phoneNumber).assertEqual('');
      expect(manager.getService().getActiveCallCount()).assertEqual(0);

      expect(await manager.dialNumber(BLANK_NUMBER)).assertTrue();
      const call = currentCallOf(manager);
      expect(call !== null).assertTrue();
      if (call !== null) {
        expect(call.phoneNumber).assertEqual(BLANK_NUMBER);
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
      }
      expect(manager.getModel().phoneNumber).assertEqual(BLANK_NUMBER);
      expect(lastHistory(manager).details).assertEqual(`Dialing ${BLANK_NUMBER}`);
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getCurrentCall()).assertNull();
      expect(await manager.answerCall()).assertTrue();

      const model = manager.getModel();
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getService().getActiveCallCount()).assertEqual(1);
      expect(serviceOf(manager).activeCallCount).assertEqual(1);
      const last = lastHistory(manager);
      expect(last.operation).assertEqual('answerCall');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual('Call answered');

      expect(await manager.answerCall()).assertTrue();
      expect(manager.getService().getActiveCallCount()).assertEqual(2);
      expect(historyOf(manager).length).assertEqual(4);
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);

      await manager.destroy();
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
      const manager = await dialedManager();
      const beforeAnswer = currentCallOf(manager);
      expect(beforeAnswer !== null).assertTrue();
      const startedBefore = beforeAnswer !== null ? beforeAnswer.startTime : 0;
      expect(startedBefore > 0).assertTrue();

      expect(await manager.answerCall()).assertTrue();
      const afterAnswer = currentCallOf(manager);
      expect(afterAnswer !== null).assertTrue();
      if (afterAnswer !== null) {
        expect(afterAnswer.callState).assertEqual(CALL_STATE_ACTIVE);
        expect(afterAnswer.phoneNumber).assertEqual(PHONE_NUMBER);
        expect(afterAnswer.isOnHold).assertFalse();
        expect(afterAnswer.startTime >= startedBefore).assertTrue();
      }
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      expect(manager.getService().getActiveCallCount()).assertEqual(2);
      expect(lastHistory(manager).details).assertEqual('Call answered');
      expect(manager.getCallHistory().length).assertEqual(0);

      await manager.destroy();
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
      const manager = await dialedManager();
      expect(await manager.holdCall()).assertTrue();
      const held = currentCallOf(manager);
      expect(held !== null).assertTrue();
      if (held !== null) {
        expect(held.isOnHold).assertTrue();
        expect(held.callState).assertEqual(CALL_STATE_DIALING);
      }
      expect(manager.getModel().callState).assertEqual(CALL_STATE_HOLD);
      expect(lastHistory(manager).details).assertEqual('Call on hold');

      expect(await manager.resumeCall()).assertTrue();
      const resumed = currentCallOf(manager);
      expect(resumed !== null).assertTrue();
      if (resumed !== null) {
        expect(resumed.isOnHold).assertFalse();
        expect(resumed.callState).assertEqual(CALL_STATE_DIALING);
      }
      expect(manager.getModel().callState).assertEqual(CALL_STATE_ACTIVE);
      expect(lastHistory(manager).details).assertEqual('Call resumed');

      expect(await manager.resumeCall()).assertFalse();
      const guard = lastHistory(manager);
      expect(guard.operation).assertEqual('resumeCall');
      expect(guard.success).assertFalse();
      expect(guard.details).assertEqual('No held call');
      expect(historyOf(manager).length).assertEqual(6);
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
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
      const manager = await dialedManager();
      const model = manager.getModel();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(model.callState).assertEqual(CALL_STATE_DIALING);
      expect(model.phoneNumber).assertEqual(PHONE_NUMBER);
      expect(currentCallOf(manager) !== null).assertTrue();
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();
      expect(lastHistory(manager).details).assertEqual('Not connected');

      expect(await manager.holdCall()).assertTrue();
      expect(model.callState).assertEqual(CALL_STATE_HOLD);
      const held = currentCallOf(manager);
      expect(held !== null).assertTrue();
      if (held !== null) {
        expect(held.isOnHold).assertTrue();
      }
      expect(await manager.resumeCall()).assertTrue();
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(model.callState).assertEqual(CALL_STATE_ACTIVE);
      expect(await manager.endCall()).assertTrue();
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      expect(model.phoneNumber).assertEqual('');
      const archived = callHistoryOf(manager);
      expect(archived.length).assertEqual(1);
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      expect(archived[0].callState).assertEqual(CALL_STATE_ENDED);

      await manager.destroy();
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
      const manager = await dialedManager();
      const service = manager.getService();
      let callCount = 0;
      const callCallback = (): void => {
        callCount += 1;
      };
      service.addCallCallback(callCallback);

      expect(await manager.endCall()).assertTrue();
      expect(manager.getCurrentCall()).assertNull();
      const archived = callHistoryOf(manager);
      expect(archived.length).assertEqual(1);
      expect(archived[0].callState).assertEqual(CALL_STATE_ENDED);
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      expect(archived[0].callDirection).assertEqual('outgoing');
      expect(archived[0].callType).assertEqual('voice');
      expect(archived[0].endTime >= archived[0].startTime).assertTrue();
      expect(archived[0].durationSec).assertEqual(0);
      expect(archived[0].isOnHold).assertFalse();

      const model = manager.getModel();
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      expect(model.phoneNumber).assertEqual('');
      expect(model.callDuration).assertEqual(0);
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(1);
      const last = lastHistory(manager);
      expect(last.operation).assertEqual('endCall');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual('Call ended');
      expect(callCount).assertEqual(0);

      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      expect(callCount).assertEqual(1);
      service.removeCallCallback(callCallback);
      await manager.destroy();
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
      const manager = await dialedManager();
      expect(await manager.rejectCall()).assertTrue();

      const archived = callHistoryOf(manager);
      expect(archived.length).assertEqual(1);
      expect(archived[0].callState).assertEqual(CALL_STATE_REJECTED);
      expect(archived[0].phoneNumber).assertEqual(PHONE_NUMBER);
      expect(archived[0].endTime > 0).assertTrue();
      expect(archived[0].durationSec).assertEqual(0);
      const last = lastHistory(manager);
      expect(last.operation).assertEqual('rejectCall');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual('Call rejected');

      const model = manager.getModel();
      expect(model.callState).assertEqual(CALL_STATE_NONE);
      expect(model.phoneNumber).assertEqual('');
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getService().getActiveCallCount()).assertEqual(0);

      expect(await manager.rejectCall()).assertTrue();
      expect(callHistoryOf(manager).length).assertEqual(1);
      expect(lastHistory(manager).details).assertEqual('Call rejected');
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getCallHistory().length).assertEqual(0);
      expect(await manager.redialLastNumber()).assertFalse();

      const last = lastHistory(manager);
      expect(last.operation).assertEqual('redial');
      expect(last.operation === 'redialLastNumber').assertFalse();
      expect(last.success).assertFalse();
      expect(last.details).assertEqual('No previous call to redial');
      expect(historyOf(manager).length).assertEqual(3);
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getModel().callState).assertEqual(CALL_STATE_NONE);
      expect(manager.getService().getActiveCallCount()).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(manager.getStatistics().totalOperations).assertEqual(2);

      await manager.destroy();
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
      const manager = await dialedManager();
      expect(await manager.endCall()).assertTrue();
      expect(historyOf(manager).length).assertEqual(4);

      expect(await manager.redialLastNumber()).assertTrue();
      const history = historyOf(manager);
      expect(history.length).assertEqual(6);
      expect(history[4].operation).assertEqual('dialNumber');
      expect(history[4].details).assertEqual(`Dialing ${PHONE_NUMBER}`);
      expect(history[5].operation).assertEqual('redial');
      expect(history[5].success).assertTrue();
      expect(history[5].details).assertEqual(`Redialing ${PHONE_NUMBER}`);

      const call = currentCallOf(manager);
      expect(call !== null).assertTrue();
      if (call !== null) {
        expect(call.phoneNumber).assertEqual(PHONE_NUMBER);
        expect(call.callState).assertEqual(CALL_STATE_DIALING);
        expect(call.callDirection).assertEqual('outgoing');
      }
      expect(manager.getModel().callState).assertEqual(CALL_STATE_DIALING);
      expect(manager.getCallHistory().length).assertEqual(1);
      expect(serviceOf(manager).totalCallsInHistory).assertEqual(1);
      expect(manager.getService().getActiveCallCount()).assertEqual(1);

      await manager.destroy();
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
      const manager = await readyManager();
      const inputs: number[] = [-10, 150, 33.6, 0, 100, 55.5];
      const expected: number[] = [0, 100, 34, 0, 100, 56];
      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setMicVolume(inputs[i])).assertTrue();
        expect(manager.getModel().micVolume).assertEqual(expected[i]);
        const micAudio = audioOf(manager);
        expect(micAudio !== null).assertTrue();
        if (micAudio !== null) {
          expect(micAudio.micVolume).assertEqual(expected[i]);
        }
        expect(lastHistory(manager).details).assertEqual(`Mic volume: ${expected[i]}`);
      }
      expect(historyOf(manager).length).assertEqual(7);

      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setSpeakerVolume(inputs[i])).assertTrue();
        expect(manager.getModel().speakerVolume).assertEqual(expected[i]);
        const speakerAudio = audioOf(manager);
        expect(speakerAudio !== null).assertTrue();
        if (speakerAudio !== null) {
          expect(speakerAudio.speakerVolume).assertEqual(expected[i]);
          expect(speakerAudio.isMuted).assertFalse();
        }
        expect(lastHistory(manager).details).assertEqual(`Speaker volume: ${expected[i]}`);
      }
      const stats = serviceOf(manager);
      expect(stats.operationHistoryCount).assertEqual(13);
      expect(stats.activeCallCount).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
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
      const manager = await readyManager();
      const model = manager.getModel();
      expect(model.isMuted).assertFalse();
      expect(model.isSpeakerOn).assertFalse();

      expect(await manager.toggleMute()).assertTrue();
      expect(model.isMuted).assertTrue();
      expect(lastHistory(manager).details).assertEqual('Muted: true');
      expect(await manager.toggleMute()).assertTrue();
      expect(model.isMuted).assertFalse();
      expect(lastHistory(manager).details).assertEqual('Muted: false');
      expect(await manager.toggleMute()).assertTrue();
      expect(model.isMuted).assertTrue();

      expect(await manager.toggleSpeaker()).assertTrue();
      expect(model.isSpeakerOn).assertTrue();
      const speakerOn = audioOf(manager);
      expect(speakerOn !== null).assertTrue();
      if (speakerOn !== null) {
        expect(speakerOn.audioRouting).assertEqual('speaker');
        expect(speakerOn.isSpeakerOn).assertTrue();
        expect(speakerOn.isMuted).assertTrue();
        expect(speakerOn.micVolume).assertEqual(DEFAULT_VOLUME);
      }
      expect(lastHistory(manager).details).assertEqual('Speaker: true');

      expect(await manager.toggleSpeaker()).assertTrue();
      expect(model.isSpeakerOn).assertFalse();
      const speakerOff = audioOf(manager);
      expect(speakerOff !== null).assertTrue();
      if (speakerOff !== null) {
        expect(speakerOff.audioRouting).assertEqual('bluetooth');
        expect(speakerOff.isSpeakerOn).assertFalse();
      }
      expect(serviceOf(manager).audioCallbackCount).assertEqual(0);
      expect(historyOf(manager).length).assertEqual(6);
      expect(manager.getCallHistory().length).assertEqual(0);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      const service = manager.getService();
      expect(service.isVoiceRecognitionActive()).assertFalse();

      expect(await manager.startVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertTrue();
      expect(serviceOf(manager).voiceRecognitionActive).assertTrue();
      expect(lastHistory(manager).details).assertEqual('Voice recognition started');

      expect(await manager.startVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertTrue();
      expect(historyOf(manager).length).assertEqual(4);

      expect(await manager.stopVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertFalse();
      expect(lastHistory(manager).details).assertEqual('Voice recognition stopped');

      expect(await manager.stopVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertFalse();
      expect(historyOf(manager).length).assertEqual(6);

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.startVoiceRecognition()).assertFalse();
      expect(lastHistory(manager).details).assertEqual('Not connected');
      expect(await manager.stopVoiceRecognition()).assertTrue();
      expect(service.isVoiceRecognitionActive()).assertFalse();
      expect(historyOf(manager).length).assertEqual(9);
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.destroy();
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
      const manager = new HfpProfileManager();
      expect(manager.getNetworkInfo()).assertNull();
      expect(manager.getAudioConfig()).assertNull();
      expect(manager.getBatteryInfo()).assertNull();

      expect(await manager.initialize()).assertTrue();
      const network = networkOf(manager);
      expect(network !== null).assertTrue();
      if (network !== null) {
        expect(network.registrationStatus).assertEqual(1);
        expect(network.carrierName).assertEqual('Mock Carrier');
        expect(network.signalStrength).assertEqual(-65);
        expect(network.networkType).assertEqual('4G');
        expect(network.isRoaming).assertFalse();
        expect(network.volteAvailable).assertTrue();
        expect(network.cellId).assertEqual('0x1234');
        expect(network.locationAreaCode).assertEqual('0x0001');
        expect(network.mcc).assertEqual('310');
        expect(network.mnc).assertEqual('260');
      }
      const battery = batteryOf(manager);
      expect(battery !== null).assertTrue();
      if (battery !== null) {
        expect(battery.level).assertEqual(85);
        expect(battery.isCharging).assertFalse();
        expect(battery.estimatedTimeMinutes).assertEqual(480);
        expect(battery.healthStatus).assertEqual('good');
        expect(battery.temperature).assertEqual(25);
        expect(battery.voltage).assertEqual(3800);
        expect(battery.chargeCycles).assertEqual(150);
      }
      const audio = audioOf(manager);
      expect(audio !== null).assertTrue();
      if (audio !== null) {
        expect(audio.voiceCodec).assertEqual('CVSD');
        expect(audio.sampleRate).assertEqual(8000);
        expect(audio.widebandSpeech).assertFalse();
        expect(audio.echoCancellation).assertTrue();
        expect(audio.noiseSuppression).assertTrue();
        expect(audio.micVolume).assertEqual(DEFAULT_VOLUME);
        expect(audio.audioRouting).assertEqual('bluetooth');
      }

      const first: ESObject = manager.getNetworkInfo();
      const second: ESObject = manager.getNetworkInfo();
      expect(first === second).assertFalse();
      first.carrierName = 'Tampered';
      const untampered = networkOf(manager);
      expect(untampered !== null).assertTrue();
      if (untampered !== null) {
        expect(untampered.carrierName).assertEqual('Mock Carrier');
      }

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.dialNumber(PHONE_NUMBER)).assertTrue();
      expect(await manager.startVoiceRecognition()).assertTrue();

      await manager.destroy();
      const service = manager.getService();
      expect(manager.getCurrentCall()).assertNull();
      expect(manager.getCallHistory().length).assertEqual(0);
      expect(manager.getNetworkInfo()).assertNull();
      expect(manager.getAudioConfig()).assertNull();
      expect(manager.getBatteryInfo()).assertNull();
      expect(service.getActiveCallCount()).assertEqual(0);
      expect(service.isVoiceRecognitionActive()).assertFalse();
      const serviceNetwork: ESObject = service.getNetworkInfo();
      expect(serviceNetwork !== null).assertTrue();
      expect(serviceNetwork.carrierName).assertEqual('Mock Carrier');
      const serviceAudio: ESObject = service.getAudioConfig();
      expect(serviceAudio !== null).assertTrue();
      expect(serviceAudio.micVolume).assertEqual(DEFAULT_VOLUME);
      const serviceBattery: ESObject = service.getBatteryInfo();
      expect(serviceBattery !== null).assertTrue();
      expect(serviceBattery.level).assertEqual(85);
      expect(historyOf(manager).length).assertEqual(1);
      expect(historyOf(manager)[0].operation).assertEqual('reset');
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(4);

      expect(await manager.initialize()).assertTrue();
      const revived = networkOf(manager);
      expect(revived !== null).assertTrue();
      if (revived !== null) {
        expect(revived.carrierName).assertEqual('Mock Carrier');
      }
      expect(await manager.dialNumber(PHONE_NUMBER)).assertFalse();

      await manager.destroy();
    });
  });
}
