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
  A2dpConnectionState,
  A2dpModel,
  A2dpService,
  BluetoothConnectionState
} from 'library';
import { A2dpServiceStatistics, ServiceCallbackCounts } from 'library';

const TEST_DEVICE_A: string = 'service_test_device_a';
const TEST_DEVICE_B: string = 'service_test_device_b';
const EXPECTED_CODEC_COUNT: number = 5;
const CODEC_ID_SBC: number = 0x00;
const CODEC_ID_AAC: number = 0x02;
const UNSUPPORTED_CODEC_ID: number = 0x99;
const CODEC_AAC_BIT_RATE: number = 320000;

interface PlaybackSnapshot {
  isPlaying: boolean;
  isPaused: boolean;
  isMuted: boolean;
  volume: number;
  positionMs: number;
  trackIndex: number;
  totalTracks: number;
}

interface CodecSnapshot {
  count: number;
  activeCount: number;
  activeId: number;
  activeName: string;
  sbcActive: boolean;
  aacActive: boolean;
}

interface QualitySnapshot {
  signalQuality: number;
  codecSwitchCount: number;
  effectiveBitRate: number;
}

interface ServiceStatsSnapshot {
  serviceName: string;
  isInitialized: boolean;
  connectionState: string;
  connectedDeviceCount: number;
  isPlaying: boolean;
  currentVolume: number;
  currentCodec: number;
  activeCodec: string;
  supportedCodecCount: number;
  isStreamActive: boolean;
  codecSwitchCount: number;
  operationHistoryCount: number;
  connectionCallbackCount: number;
  dataCallbackCount: number;
  playbackCallbackCount: number;
  qualityCallbackCount: number;
}

interface HistoryEntrySnapshot {
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
}

/**
 * read playback info snapshot, not yet initialize time use -1 mark missing value.
 * @param {A2dpService} service - passive test service
 * @returns {PlaybackSnapshot} playback info snapshot
 */
function playbackSnapshot(service: A2dpService): PlaybackSnapshot {
  const info = service.getPlaybackInfo();
  if (info === null) {
    return {
      isPlaying: false,
      isPaused: false,
      isMuted: false,
      volume: -1,
      positionMs: -1,
      trackIndex: -1,
      totalTracks: -1
    };
  }
  return {
    isPlaying: info.isPlaying,
    isPaused: info.isPaused,
    isMuted: info.isMuted,
    volume: info.volume,
    positionMs: info.positionMs,
    trackIndex: info.trackIndex,
    totalTracks: info.totalTracks
  };
}

/**
 * read codec device snapshot, package contain active count and SBC/AAC activation state.
 * @param {A2dpService} service - passive test service
 * @returns {CodecSnapshot} codec device snapshot
 */
function codecSnapshot(service: A2dpService): CodecSnapshot {
  const codecs = service.getSupportedCodecs();
  const active = service.getActiveCodec();
  let activeCount: number = 0;
  let sbcActive: boolean = false;
  let aacActive: boolean = false;
  for (const codec of codecs) {
    if (codec.isActive) {
      activeCount += 1;
    }
    if (codec.codecId === CODEC_ID_SBC) {
      sbcActive = codec.isActive;
    }
    if (codec.codecId === CODEC_ID_AAC) {
      aacActive = codec.isActive;
    }
  }
  return {
    count: codecs.length,
    activeCount: activeCount,
    activeId: active === null ? -1 : active.codecId,
    activeName: active === null ? '' : active.codecName,
    sbcActive: sbcActive,
    aacActive: aacActive
  };
}

/**
 * read audio quality metric snapshot.
 * @param {A2dpService} service - passive test service
 * @returns {QualitySnapshot} audio quality metric snapshot
 */
function qualitySnapshot(service: A2dpService): QualitySnapshot {
  const metrics = service.getQualityMetrics();
  if (metrics === null) {
    return { signalQuality: -1, codecSwitchCount: -1, effectiveBitRate: -1 };
  }
  return {
    signalQuality: metrics.signalQuality,
    codecSwitchCount: metrics.codecSwitchCount,
    effectiveBitRate: metrics.effectiveBitRate
  };
}

/**
 * read statistics snapshot. getStatistics return typed statistics object, read fields directly.
 * @param {A2dpService} service - passive test service
 * @returns {ServiceStatsSnapshot} statistics snapshot
 */
function statsSnapshot(service: A2dpService): ServiceStatsSnapshot {
  const stats: A2dpServiceStatistics = service.getStatistics();
  const callbacks: ServiceCallbackCounts = stats.callbackCounts;
  const snapshot: ServiceStatsSnapshot = {
    serviceName: stats.serviceName,
    isInitialized: stats.isInitialized,
    connectionState: stats.connectionState,
    connectedDeviceCount: stats.connectedDeviceCount,
    isPlaying: stats.isPlaying,
    currentVolume: stats.currentVolume,
    currentCodec: stats.currentCodec,
    activeCodec: stats.activeCodec,
    supportedCodecCount: stats.supportedCodecCount,
    isStreamActive: stats.isStreamActive,
    codecSwitchCount: stats.codecSwitchCount,
    operationHistoryCount: stats.operationHistoryCount,
    connectionCallbackCount: callbacks.connection ?? 0,
    dataCallbackCount: callbacks.data ?? 0,
    playbackCallbackCount: callbacks.playback ?? 0,
    qualityCallbackCount: callbacks.quality ?? 0
  };
  return snapshot;
}

/**
 * read last one item operation history, empty history return empty record.
 * @param {A2dpService} service - passive test service
 * @returns {HistoryEntrySnapshot} last one item history
 */
function lastHistory(service: A2dpService): HistoryEntrySnapshot {
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
 * @description Test suite for A2dpService
 * @since 26.0.0
 */
export default function a2dpServiceTest(): void {
  describe('A2dpServiceTest', () => {
    // ==================== lifecycle and initialize (4 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_0100
     * @tc.name: testA2dpService0001
     * @tc.desc: Verify the default state of a newly created service before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0001', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#1 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#2 assert ' + "expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED)");
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#4 assert ' + "expect(service.isPlaying()).assertFalse()");
      expect(service.isPlaying()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#5 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#6 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(0)");
      expect(service.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#7 assert ' + "expect(service.getActiveCodec()).assertEqual(null)");
      expect(service.getActiveCodec()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#8 assert ' + "expect(service.getPlaybackInfo()).assertEqual(null)");
      expect(service.getPlaybackInfo()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#9 assert ' + "expect(service.getQualityMetrics()).assertEqual(null)");
      expect(service.getQualityMetrics()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#10 assert ' + "expect(service.getStreamConfig()).assertEqual(null)");
      expect(service.getStreamConfig()).assertEqual(null);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#11 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#12 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0001',
        '#13 ' + "stats.isStreamActive" + ' = ' + JSON.stringify(stats.isStreamActive));
      expect(stats.isStreamActive).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0001', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0200
     * @tc.name: testA2dpService0002
     * @tc.desc: Verify initialization registers five codecs and creates default playback state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0002', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      const codecs = codecSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#2 ' + "codecs.count" + ' = ' + JSON.stringify(codecs.count));
      expect(codecs.count).assertEqual(EXPECTED_CODEC_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#3 ' + "codecs.activeCount" + ' = ' + JSON.stringify(codecs.activeCount));
      expect(codecs.activeCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#4 ' + "codecs.activeId" + ' = ' + JSON.stringify(codecs.activeId));
      expect(codecs.activeId).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#5 ' + "codecs.activeName" + ' = ' + JSON.stringify(codecs.activeName));
      expect(codecs.activeName).assertEqual('SBC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#6 ' + "codecs.sbcActive" + ' = ' + JSON.stringify(codecs.sbcActive));
      expect(codecs.sbcActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#7 ' + "codecs.aacActive" + ' = ' + JSON.stringify(codecs.aacActive));
      expect(codecs.aacActive).assertFalse();

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#8 ' + "playback.volume" + ' = ' + JSON.stringify(playback.volume));
      expect(playback.volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#9 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#10 ' + "playback.isPaused" + ' = ' + JSON.stringify(playback.isPaused));
      expect(playback.isPaused).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#11 ' + "playback.trackIndex" + ' = ' + JSON.stringify(playback.trackIndex));
      expect(playback.trackIndex).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#12 ' + "playback.totalTracks" + ' = ' + JSON.stringify(playback.totalTracks));
      expect(playback.totalTracks).assertEqual(0);

      const quality = qualitySnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#13 ' + "quality.signalQuality" + ' = ' + JSON.stringify(quality.signalQuality));
      expect(quality.signalQuality).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#14 ' + "quality.codecSwitchCount" + ' = ' + JSON.stringify(quality.codecSwitchCount));
      expect(quality.codecSwitchCount).assertEqual(0);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#15 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#16 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#17 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0002',
        '#18 ' + "stats.supportedCodecCount" + ' = ' + JSON.stringify(stats.supportedCodecCount));
      expect(stats.supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0002', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0300
     * @tc.name: testA2dpService0003
     * @tc.desc: Verify a repeated initialization is rejected and recorded as a failed operation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0003', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#2 assert ' + "expect(await service.initialize()).assertFalse()");
      expect(await service.initialize()).assertFalse();

      const codecs = codecSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#3 ' + "codecs.count" + ' = ' + JSON.stringify(codecs.count));
      expect(codecs.count).assertEqual(EXPECTED_CODEC_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#4 ' + "codecs.activeCount" + ' = ' + JSON.stringify(codecs.activeCount));
      expect(codecs.activeCount).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#5 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#6 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#7 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Already initialized');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#8 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0003',
        '#9 assert ' + "expect(statsSnapshot(service).isInitialized).assertTrue()");
      expect(statsSnapshot(service).isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0003', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0400
     * @tc.name: testA2dpService0004
     * @tc.desc: Verify destroy clears callbacks and codecs while allowing a later re-initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0004', 'begin');
      const service: A2dpService = new A2dpService();
      let callbackCount: number = 0;
      const callback = (): void => {
        callbackCount += 1;
      };

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      service.addConnectionCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#2 assert ' + "expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1)");
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1);

      await service.destroy();

      const destroyed = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#3 ' + "destroyed.isInitialized" + ' = ' + JSON.stringify(destroyed.isInitialized));
      expect(destroyed.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#4 ' + "destroyed.connectionCallbackCount" + ' = ' + JSON.stringify(destroyed.connectionCallbackCount));
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#5 ' + "destroyed.supportedCodecCount" + ' = ' + JSON.stringify(destroyed.supportedCodecCount));
      expect(destroyed.supportedCodecCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#6 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(0)");
      expect(service.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#7 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#8 ' + "callbackCount" + ' = ' + JSON.stringify(callbackCount));
      expect(callbackCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#9 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#10 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT)");
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0004',
        '#11 assert ' + "expect(statsSnapshot(service).isInitialized).assertTrue()");
      expect(statsSnapshot(service).isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0004', 'end');
    });

    // ==================== connect and disconnect (6 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_0500
     * @tc.name: testA2dpService0005
     * @tc.desc: Verify connect is rejected before initialization and records the reason.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0005', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#1 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertFalse()");
      expect(await service.connect(TEST_DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#2 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#3 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#5 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#6 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#7 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Service not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0005',
        '#8 ' + "history.timestamp > 0" + ' = ' + JSON.stringify(history.timestamp > 0));
      expect(history.timestamp > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0005', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0600
     * @tc.name: testA2dpService0006
     * @tc.desc: Verify connect rejects an empty device identifier.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0006', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#2 assert ' + "expect(await service.connect('')).assertFalse()");
      expect(await service.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#6 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#7 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0006',
        '#8 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Invalid device ID');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0006', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0700
     * @tc.name: testA2dpService0007
     * @tc.desc: Verify a successful connection updates state, device list and statistics.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0007', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#3 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#5 assert ' + "expect(service.getA2dpState()).assertEqual(A2dpConnectionState.CONNECTED)");
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#6 assert ' + "expect(service.getModel().isConnected()).assertTrue()");
      expect(service.getModel().isConnected()).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#7 ' + "deviceIds.length" + ' = ' + JSON.stringify(deviceIds.length));
      expect(deviceIds.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#8 ' + "deviceIds[0]" + ' = ' + JSON.stringify(deviceIds[0]));
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_A);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#9 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#10 ' + "stats.isStreamActive" + ' = ' + JSON.stringify(stats.isStreamActive));
      expect(stats.isStreamActive).assertTrue();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#11 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#12 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0007',
        '#13 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual(`Connected to ${TEST_DEVICE_A}`);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0007', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0800
     * @tc.name: testA2dpService0008
     * @tc.desc: Verify reconnecting the same device is idempotent but recorded as already connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0008', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#3 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#4 ' + "deviceIds.length" + ' = ' + JSON.stringify(deviceIds.length));
      expect(deviceIds.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#5 ' + "deviceIds[0]" + ' = ' + JSON.stringify(deviceIds[0]));
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#6 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#7 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#8 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#9 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Already connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0008',
        '#10 assert ' + "expect(service.getOperationHistory().length).assertEqual(3)");
      expect(service.getOperationHistory().length).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0008', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_0900
     * @tc.name: testA2dpService0009
     * @tc.desc: Verify disconnecting one of two connected devices keeps the service connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0009', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#3 assert ' + "expect(await service.connect(TEST_DEVICE_B)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(2)");
      expect(service.getConnectedDeviceIds().length).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#5 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#6 ' + "deviceIds.length" + ' = ' + JSON.stringify(deviceIds.length));
      expect(deviceIds.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#7 ' + "deviceIds[0]" + ' = ' + JSON.stringify(deviceIds[0]));
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#8 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#9 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#10 assert ' + "expect(service.getModel().isConnected()).assertTrue()");
      expect(service.getModel().isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#11 assert ' + "expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1)");
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#12 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0009',
        '#13 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0009', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1000
     * @tc.name: testA2dpService0010
     * @tc.desc: Verify disconnecting the last device resets playing state and stream flags.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0010', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#3 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#4 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#5 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#6 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#7 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#8 assert ' + "expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED)");
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#9 assert ' + "expect(service.getModel().isConnected()).assertFalse()");
      expect(service.getModel().isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#10 assert ' + "expect(service.getModel().getLogs().length).assertEqual(0)");
      expect(service.getModel().getLogs().length).assertEqual(0);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#11 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#12 ' + "stats.isStreamActive" + ' = ' + JSON.stringify(stats.isStreamActive));
      expect(stats.isStreamActive).assertFalse();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#13 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0010',
        '#14 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0010', 'end');
    });

    // ==================== disconnect guard, reset and destroy (4 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_1100
     * @tc.name: testA2dpService0011
     * @tc.desc: Verify disconnect is rejected before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0011', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#1 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertFalse()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#2 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#3 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#4 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#5 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0011',
        '#6 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Service not initialized');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0011', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1200
     * @tc.name: testA2dpService0012
     * @tc.desc: Verify disconnect rejects a device that is not connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0012', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0012', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#2 assert ' + "expect(await service.disconnect('nonexistent_device')).assertFalse()");
      expect(await service.disconnect('nonexistent_device')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#6 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#7 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0012',
        '#8 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Device not connected');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0012', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1300
     * @tc.name: testA2dpService0013
     * @tc.desc: Verify reset clears connections and history while restoring playback defaults.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0013', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0013', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#3 assert ' + "expect(await service.setVolume(30)).assertTrue()");
      expect(await service.setVolume(30)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#4 assert ' + "expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue()");
      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#5 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();

      await service.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#6 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#7 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#8 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#9 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#10 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#11 ' + "playback.volume" + ' = ' + JSON.stringify(playback.volume));
      expect(playback.volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#12 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#13 ' + "playback.trackIndex" + ' = ' + JSON.stringify(playback.trackIndex));
      expect(playback.trackIndex).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#14 assert ' + "expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0)");
      expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#15 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT)");
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#16 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0013',
        '#17 ' + "stats.currentCodec" + ' = ' + JSON.stringify(stats.currentCodec));
      expect(stats.currentCodec).assertEqual(CODEC_ID_SBC);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0013', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1400
     * @tc.name: testA2dpService0014
     * @tc.desc: Verify destroy releases connections, callbacks and codec table.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0014', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0014', 'begin');
      const service: A2dpService = new A2dpService();
      let callbackCount: number = 0;
      const connectionCallback = (): void => {
        callbackCount += 1;
      };
      const dataCallback = (): void => {
        callbackCount += 1;
      };
      const playbackCallback = (): void => {
        callbackCount += 1;
      };
      const qualityCallback = (): void => {
        callbackCount += 1;
      };

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#3 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);

      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addPlaybackCallback(playbackCallback);
      service.addQualityCallback(qualityCallback);

      const registered = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#5 ' + "registered.connectionCallbackCount" + ' = ' + JSON.stringify(registered.connectionCallbackCount));
      expect(registered.connectionCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#6 ' + "registered.dataCallbackCount" + ' = ' + JSON.stringify(registered.dataCallbackCount));
      expect(registered.dataCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#7 ' + "registered.playbackCallbackCount" + ' = ' + JSON.stringify(registered.playbackCallbackCount));
      expect(registered.playbackCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#8 ' + "registered.qualityCallbackCount" + ' = ' + JSON.stringify(registered.qualityCallbackCount));
      expect(registered.qualityCallbackCount).assertEqual(1);

      await service.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#9 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#10 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#11 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(0)");
      expect(service.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#12 ' + "callbackCount" + ' = ' + JSON.stringify(callbackCount));
      expect(callbackCount).assertEqual(0);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#13 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#14 ' + "stats.connectionCallbackCount" + ' = ' + JSON.stringify(stats.connectionCallbackCount));
      expect(stats.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#15 ' + "stats.dataCallbackCount" + ' = ' + JSON.stringify(stats.dataCallbackCount));
      expect(stats.dataCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#16 ' + "stats.playbackCallbackCount" + ' = ' + JSON.stringify(stats.playbackCallbackCount));
      expect(stats.playbackCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#17 ' + "stats.qualityCallbackCount" + ' = ' + JSON.stringify(stats.qualityCallbackCount));
      expect(stats.qualityCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0014',
        '#18 ' + "stats.supportedCodecCount" + ' = ' + JSON.stringify(stats.supportedCodecCount));
      expect(stats.supportedCodecCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0014', 'end');
    });

    // ==================== playback control (6 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_1500
     * @tc.name: testA2dpService0015
     * @tc.desc: Verify all playback controls are rejected when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0015', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0015', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#2 assert ' + "expect(await service.play()).assertFalse()");
      expect(await service.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#3 assert ' + "expect(await service.pause()).assertFalse()");
      expect(await service.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#4 assert ' + "expect(await service.stop()).assertFalse()");
      expect(await service.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#5 assert ' + "expect(await service.skipForward()).assertFalse()");
      expect(await service.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#6 assert ' + "expect(await service.skipBackward()).assertFalse()");
      expect(await service.skipBackward()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#7 assert ' + "expect(service.isPlaying()).assertFalse()");
      expect(service.isPlaying()).assertFalse();
      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#8 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#9 ' + "playback.isPaused" + ' = ' + JSON.stringify(playback.isPaused));
      expect(playback.isPaused).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#10 ' + "playback.trackIndex" + ' = ' + JSON.stringify(playback.trackIndex));
      expect(playback.trackIndex).assertEqual(0);

      const history = service.getOperationHistory().slice(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#11 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#12 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#13 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#14 ' + "history[2].operation" + ' = ' + JSON.stringify(history[2].operation));
      expect(history[2].operation).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#15 ' + "history[3].operation" + ' = ' + JSON.stringify(history[3].operation));
      expect(history[3].operation).assertEqual('skipForward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#16 ' + "history[4].operation" + ' = ' + JSON.stringify(history[4].operation));
      expect(history[4].operation).assertEqual('skipBackward');
      let failedCount: number = 0;
      for (const entry of history) {
        if (!entry.success) {
          failedCount += 1;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#17 ' + "failedCount" + ' = ' + JSON.stringify(failedCount));
      expect(failedCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0015',
        '#18 ' + "history[4].details" + ' = ' + JSON.stringify(history[4].details));
      expect(history[4].details).assertEqual('Not connected');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0015', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1600
     * @tc.name: testA2dpService0016
     * @tc.desc: Verify play starts playback and updates model, playback info and history.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0016', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0016', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#3 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#4 assert ' + "expect(service.isPlaying()).assertTrue()");
      expect(service.isPlaying()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#5 assert ' + "expect(service.getModel().isPlaying).assertTrue()");
      expect(service.getModel().isPlaying).assertTrue();

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#6 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#7 ' + "playback.isPaused" + ' = ' + JSON.stringify(playback.isPaused));
      expect(playback.isPaused).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#8 assert ' + "expect(statsSnapshot(service).isPlaying).assertTrue()");
      expect(statsSnapshot(service).isPlaying).assertTrue();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#9 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#10 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0016',
        '#11 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Playback started');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0016', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1700
     * @tc.name: testA2dpService0017
     * @tc.desc: Verify pause clears the playing flag and sets the paused flag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0017', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0017', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#3 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#4 assert ' + "expect(await service.pause()).assertTrue()");
      expect(await service.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#5 assert ' + "expect(service.isPlaying()).assertFalse()");
      expect(service.isPlaying()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#6 assert ' + "expect(service.getModel().isPlaying).assertFalse()");
      expect(service.getModel().isPlaying).assertFalse();

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#7 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#8 ' + "playback.isPaused" + ' = ' + JSON.stringify(playback.isPaused));
      expect(playback.isPaused).assertTrue();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#9 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#10 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0017',
        '#11 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Playback paused');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0017', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1800
     * @tc.name: testA2dpService0018
     * @tc.desc: Verify stop clears playing and paused flags and rewinds the position.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0018', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0018', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#3 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#4 assert ' + "expect(await service.stop()).assertTrue()");
      expect(await service.stop()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#5 assert ' + "expect(service.isPlaying()).assertFalse()");
      expect(service.isPlaying()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#6 assert ' + "expect(service.getModel().isPlaying).assertFalse()");
      expect(service.getModel().isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#7 assert ' + "expect(statsSnapshot(service).isPlaying).assertFalse()");
      expect(statsSnapshot(service).isPlaying).assertFalse();

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#8 ' + "playback.isPlaying" + ' = ' + JSON.stringify(playback.isPlaying));
      expect(playback.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#9 ' + "playback.isPaused" + ' = ' + JSON.stringify(playback.isPaused));
      expect(playback.isPaused).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#10 ' + "playback.positionMs" + ' = ' + JSON.stringify(playback.positionMs));
      expect(playback.positionMs).assertEqual(0);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#11 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#12 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0018',
        '#13 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Playback stopped');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0018', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_1900
     * @tc.name: testA2dpService0019
     * @tc.desc: Verify skip controls report success but keep the track index when the playlist is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0019', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0019', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const before = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#3 ' + "before.totalTracks" + ' = ' + JSON.stringify(before.totalTracks));
      expect(before.totalTracks).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#4 ' + "before.trackIndex" + ' = ' + JSON.stringify(before.trackIndex));
      expect(before.trackIndex).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#5 assert ' + "expect(await service.skipForward()).assertTrue()");
      expect(await service.skipForward()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#6 assert ' + "expect(await service.skipBackward()).assertTrue()");
      expect(await service.skipBackward()).assertTrue();

      const after = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#7 ' + "after.totalTracks" + ' = ' + JSON.stringify(after.totalTracks));
      expect(after.totalTracks).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#8 ' + "after.trackIndex" + ' = ' + JSON.stringify(after.trackIndex));
      expect(after.trackIndex).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#9 ' + "after.positionMs" + ' = ' + JSON.stringify(after.positionMs));
      expect(after.positionMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#10 assert ' + "expect(service.getModel().playbackPosition).assertEqual(0)");
      expect(service.getModel().playbackPosition).assertEqual(0);

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#11 ' + "history[history.length - 2].operation" + ' = ' +
        JSON.stringify(history[history.length - 2].operation));
      expect(history[history.length - 2].operation).assertEqual('skipForward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#12 ' + "history[history.length - 1].operation" + ' = ' +
        JSON.stringify(history[history.length - 1].operation));
      expect(history[history.length - 1].operation).assertEqual('skipBackward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0019',
        '#13 ' + "history[history.length - 1].success" + ' = ' + JSON.stringify(history[history.length - 1].success));
      expect(history[history.length - 1].success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0019', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2000
     * @tc.name: testA2dpService0020
     * @tc.desc: Verify setting a normal volume synchronizes model, playback info and history.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0020', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0020', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#3 assert ' + "expect(await service.setVolume(65)).assertTrue()");
      expect(await service.setVolume(65)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#4 assert ' + "expect(service.getModel().volume).assertEqual(65)");
      expect(service.getModel().volume).assertEqual(65);

      const playback = playbackSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#5 ' + "playback.volume" + ' = ' + JSON.stringify(playback.volume));
      expect(playback.volume).assertEqual(65);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#6 ' + "playback.isMuted" + ' = ' + JSON.stringify(playback.isMuted));
      expect(playback.isMuted).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#7 assert ' + "expect(statsSnapshot(service).currentVolume).assertEqual(65)");
      expect(statsSnapshot(service).currentVolume).assertEqual(65);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#8 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#9 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0020',
        '#10 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Volume set to 65');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0020', 'end');
    });

    // ==================== volume bounds, codec and defensive copy (5 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_2100
     * @tc.name: testA2dpService0021
     * @tc.desc: Verify volume clamping, rounding and the mute flag at the range boundaries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0021', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0021', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#2 assert ' + "expect(await service.setVolume(0)).assertTrue()");
      expect(await service.setVolume(0)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#3 assert ' + "expect(service.getModel().volume).assertEqual(0)");
      expect(service.getModel().volume).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#4 assert ' + "expect(playbackSnapshot(service).isMuted).assertTrue()");
      expect(playbackSnapshot(service).isMuted).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#5 assert ' + "expect(await service.setVolume(100)).assertTrue()");
      expect(await service.setVolume(100)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#6 assert ' + "expect(service.getModel().volume).assertEqual(100)");
      expect(service.getModel().volume).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#7 assert ' + "expect(playbackSnapshot(service).isMuted).assertFalse()");
      expect(playbackSnapshot(service).isMuted).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#8 assert ' + "expect(await service.setVolume(50.6)).assertTrue()");
      expect(await service.setVolume(50.6)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#9 assert ' + "expect(service.getModel().volume).assertEqual(51)");
      expect(service.getModel().volume).assertEqual(51);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#10 assert ' + "expect(await service.setVolume(-20)).assertTrue()");
      expect(await service.setVolume(-20)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#11 assert ' + "expect(service.getModel().volume).assertEqual(0)");
      expect(service.getModel().volume).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#12 assert ' + "expect(await service.setVolume(150)).assertTrue()");
      expect(await service.setVolume(150)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#13 assert ' + "expect(service.getModel().volume).assertEqual(100)");
      expect(service.getModel().volume).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#14 assert ' + "expect(playbackSnapshot(service).volume).assertEqual(100)");
      expect(playbackSnapshot(service).volume).assertEqual(100);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0021',
        '#15 assert ' + "expect(lastHistory(service).details).assertEqual('Volume set to 100')");
      expect(lastHistory(service).details).assertEqual('Volume set to 100');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0021', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2200
     * @tc.name: testA2dpService0022
     * @tc.desc: Verify setVolume is rejected before initialization and keeps the default volume.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0022', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0022', 'begin');
      const service: A2dpService = new A2dpService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#1 assert ' + "expect(await service.setVolume(50)).assertFalse()");
      expect(await service.setVolume(50)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#2 assert ' + "expect(service.getModel().volume).assertEqual(50)");
      expect(service.getModel().volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#3 assert ' + "expect(service.getPlaybackInfo()).assertEqual(null)");
      expect(service.getPlaybackInfo()).assertEqual(null);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#4 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#5 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0022',
        '#6 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Not initialized');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0022', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2300
     * @tc.name: testA2dpService0023
     * @tc.desc: Verify selecting a supported codec switches the single active codec and updates metrics.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0023', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0023', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#3 assert ' + "expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue()");
      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();

      const codecs = codecSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#4 ' + "codecs.activeId" + ' = ' + JSON.stringify(codecs.activeId));
      expect(codecs.activeId).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#5 ' + "codecs.activeName" + ' = ' + JSON.stringify(codecs.activeName));
      expect(codecs.activeName).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#6 ' + "codecs.activeCount" + ' = ' + JSON.stringify(codecs.activeCount));
      expect(codecs.activeCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#7 ' + "codecs.sbcActive" + ' = ' + JSON.stringify(codecs.sbcActive));
      expect(codecs.sbcActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#8 ' + "codecs.aacActive" + ' = ' + JSON.stringify(codecs.aacActive));
      expect(codecs.aacActive).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#9 assert ' + "expect(service.getModel().codec).assertEqual(CODEC_ID_AAC)");
      expect(service.getModel().codec).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#10 assert ' + "expect(service.getModel().bitRate).assertEqual(CODEC_AAC_BIT_RATE)");
      expect(service.getModel().bitRate).assertEqual(CODEC_AAC_BIT_RATE);

      const quality = qualitySnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#11 ' + "quality.codecSwitchCount" + ' = ' + JSON.stringify(quality.codecSwitchCount));
      expect(quality.codecSwitchCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#12 ' + "quality.effectiveBitRate" + ' = ' + JSON.stringify(quality.effectiveBitRate));
      expect(quality.effectiveBitRate).assertEqual(CODEC_AAC_BIT_RATE);

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#13 ' + "stats.currentCodec" + ' = ' + JSON.stringify(stats.currentCodec));
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#14 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#15 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(1);

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#16 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('selectCodec');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#17 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0023',
        '#18 ' + "history.details" + ' = ' + JSON.stringify(history.details));
      expect(history.details).assertEqual('Selected codec: AAC');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0023', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2400
     * @tc.name: testA2dpService0024
     * @tc.desc: Verify an unsupported codec is rejected and leaves the active codec unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0024', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0024', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#3 assert ' + "expect(await service.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse()");
      expect(await service.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse();

      const codecs = codecSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#4 ' + "codecs.activeId" + ' = ' + JSON.stringify(codecs.activeId));
      expect(codecs.activeId).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#5 ' + "codecs.activeCount" + ' = ' + JSON.stringify(codecs.activeCount));
      expect(codecs.activeCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#6 assert ' + "expect(service.getModel().codec).assertEqual(CODEC_ID_SBC)");
      expect(service.getModel().codec).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#7 assert ' + "expect(statsSnapshot(service).codecSwitchCount).assertEqual(0)");
      expect(statsSnapshot(service).codecSwitchCount).assertEqual(0);

      const failed = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#8 ' + "failed.operation" + ' = ' + JSON.stringify(failed.operation));
      expect(failed.operation).assertEqual('selectCodec');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#9 ' + "failed.success" + ' = ' + JSON.stringify(failed.success));
      expect(failed.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#10 ' + "failed.details" + ' = ' + JSON.stringify(failed.details));
      expect(failed.details).assertEqual(`Unsupported codec: ${UNSUPPORTED_CODEC_ID}`);

      const uninitialized: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#11 assert ' + "expect(await uninitialized.selectCodec(CODEC_ID_SBC)).assertFalse()");
      expect(await uninitialized.selectCodec(CODEC_ID_SBC)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#12 assert ' + "expect(lastHistory(uninitialized).details).assertEqual('Not initialized')");
      expect(lastHistory(uninitialized).details).assertEqual('Not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0024',
        '#13 assert ' + "expect(uninitialized.getActiveCodec()).assertEqual(null)");
      expect(uninitialized.getActiveCodec()).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0024', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2500
     * @tc.name: testA2dpService0025
     * @tc.desc: Verify getters return defensive copies for devices, playback info, metrics and codecs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0025', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0025', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      deviceIds.push('injected_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#3 ' + "deviceIds.length" + ' = ' + JSON.stringify(deviceIds.length));
      expect(deviceIds.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#5 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(TEST_DEVICE_A)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(TEST_DEVICE_A);

      const playback = service.getPlaybackInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#6 ' + "playback === null" + ' = ' + JSON.stringify(playback === null));
      expect(playback === null).assertFalse();
      if (playback !== null) {
        playback.volume = 99;
        playback.trackIndex = 7;
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#7 assert ' + "expect(playbackSnapshot(service).volume).assertEqual(50)");
      expect(playbackSnapshot(service).volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#8 assert ' + "expect(playbackSnapshot(service).trackIndex).assertEqual(0)");
      expect(playbackSnapshot(service).trackIndex).assertEqual(0);

      const metrics = service.getQualityMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#9 ' + "metrics === null" + ' = ' + JSON.stringify(metrics === null));
      expect(metrics === null).assertFalse();
      if (metrics !== null) {
        metrics.codecSwitchCount = 42;
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#10 assert ' + "expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0)");
      expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0);

      const codecs = service.getSupportedCodecs();
      codecs.pop();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#11 ' + "codecs.length" + ' = ' + JSON.stringify(codecs.length));
      expect(codecs.length).assertEqual(EXPECTED_CODEC_COUNT - 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0025',
        '#12 assert ' + "expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT)");
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0025', 'end');
    });

    // ==================== statistics, not yet actual current path and callback (5 cases) ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_2600
     * @tc.name: testA2dpService0026
     * @tc.desc: Verify statistics reflect the connected, playing and codec-switched state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0026', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0026', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#3 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#4 assert ' + "expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue()");
      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();

      const stats = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#5 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual('A2dpService');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#6 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#7 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#8 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#9 ' + "stats.isPlaying" + ' = ' + JSON.stringify(stats.isPlaying));
      expect(stats.isPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#10 ' + "stats.currentVolume" + ' = ' + JSON.stringify(stats.currentVolume));
      expect(stats.currentVolume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#11 ' + "stats.currentCodec" + ' = ' + JSON.stringify(stats.currentCodec));
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#12 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#13 ' + "stats.supportedCodecCount" + ' = ' + JSON.stringify(stats.supportedCodecCount));
      expect(stats.supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#14 ' + "stats.isStreamActive" + ' = ' + JSON.stringify(stats.isStreamActive));
      expect(stats.isStreamActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#15 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#16 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0026',
        '#17 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0026', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2700
     * @tc.name: testA2dpService0027
     * @tc.desc: Verify stream config and device capability return null because they are never populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0027', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0027', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#1 assert ' + "expect(service.getStreamConfig()).assertEqual(null)");
      expect(service.getStreamConfig()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#2 assert ' + "expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null)");
      expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#3 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#4 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#5 assert ' + "expect(service.getStreamConfig()).assertEqual(null)");
      expect(service.getStreamConfig()).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#6 assert ' + "expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null)");
      expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#7 assert ' + "expect(service.getDeviceCapability('')).assertEqual(null)");
      expect(service.getDeviceCapability('')).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0027',
        '#8 assert ' + "expect(statsSnapshot(service).isStreamActive).assertTrue()");
      expect(statsSnapshot(service).isStreamActive).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0027', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2800
     * @tc.name: testA2dpService0028
     * @tc.desc: Verify connection callbacks fire for connect transitions and stop after removal.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0028', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0028', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();

      const states: BluetoothConnectionState[] = [];
      const callback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };
      service.addConnectionCallback(callback);
      service.addConnectionCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#2 assert ' + "expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1)");
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#3 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#4 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#5 ' + "states[0]" + ' = ' + JSON.stringify(states[0]));
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#6 ' + "states[1]" + ' = ' + JSON.stringify(states[1]));
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);

      service.removeConnectionCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#7 assert ' + "expect(statsSnapshot(service).connectionCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#8 assert ' + "expect(await service.disconnect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0028',
        '#9 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0028', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_2900
     * @tc.name: testA2dpService0029
     * @tc.desc: Verify data and playback callbacks fire on play and stop firing after removal.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0029', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0029', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      let dataCount: number = 0;
      let lastDataPlaying: boolean = false;
      const dataCallback = (model: A2dpModel): void => {
        dataCount += 1;
        lastDataPlaying = model.isPlaying;
      };
      let playbackCount: number = 0;
      const playbackCallback = (): void => {
        playbackCount += 1;
      };
      service.addDataCallback(dataCallback);
      service.addPlaybackCallback(playbackCallback);

      const registered = statsSnapshot(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#3 ' + "registered.dataCallbackCount" + ' = ' + JSON.stringify(registered.dataCallbackCount));
      expect(registered.dataCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#4 ' + "registered.playbackCallbackCount" + ' = ' + JSON.stringify(registered.playbackCallbackCount));
      expect(registered.playbackCallbackCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#5 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#6 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#7 ' + "lastDataPlaying" + ' = ' + JSON.stringify(lastDataPlaying));
      expect(lastDataPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#8 ' + "playbackCount" + ' = ' + JSON.stringify(playbackCount));
      expect(playbackCount).assertEqual(1);

      service.removePlaybackCallback(playbackCallback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#9 assert ' + "expect(statsSnapshot(service).playbackCallbackCount).assertEqual(0)");
      expect(statsSnapshot(service).playbackCallbackCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#10 assert ' + "expect(await service.stop()).assertTrue()");
      expect(await service.stop()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#11 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#12 ' + "lastDataPlaying" + ' = ' + JSON.stringify(lastDataPlaying));
      expect(lastDataPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0029',
        '#13 ' + "playbackCount" + ' = ' + JSON.stringify(playbackCount));
      expect(playbackCount).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0029', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_SERVICE_3000
     * @tc.name: testA2dpService0030
     * @tc.desc: Verify a throwing data callback does not break play or later callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0030', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0030', 'begin');
      const service: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#2 assert ' + "expect(await service.connect(TEST_DEVICE_A)).assertTrue()");
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      let healthyCount: number = 0;
      const throwingCallback = (): void => {
        throw new Error('data callback failure');
      };
      const healthyCallback = (model: A2dpModel): void => {
        healthyCount += 1;
      };
      service.addDataCallback(throwingCallback);
      service.addDataCallback(healthyCallback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#3 assert ' + "expect(statsSnapshot(service).dataCallbackCount).assertEqual(2)");
      expect(statsSnapshot(service).dataCallbackCount).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#4 assert ' + "expect(await service.play()).assertTrue()");
      expect(await service.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#5 ' + "healthyCount" + ' = ' + JSON.stringify(healthyCount));
      expect(healthyCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#6 assert ' + "expect(service.isPlaying()).assertTrue()");
      expect(service.isPlaying()).assertTrue();

      const history = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#7 ' + "history.operation" + ' = ' + JSON.stringify(history.operation));
      expect(history.operation).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpService0030',
        '#8 ' + "history.success" + ' = ' + JSON.stringify(history.success));
      expect(history.success).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpService0030', 'end');
    });
  });
}
