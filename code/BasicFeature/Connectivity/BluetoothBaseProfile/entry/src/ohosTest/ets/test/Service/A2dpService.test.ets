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
  A2dpConnectionState,
  A2dpModel,
  A2dpService,
  BluetoothConnectionState
} from 'library';

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
 * 读取播放信息快照，未初始化时用 -1 标记缺失值。
 * @param {A2dpService} service - 被测服务
 * @returns {PlaybackSnapshot} 播放信息快照
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
 * 读取编解码器快照，包含激活数量与 SBC/AAC 激活状态。
 * @param {A2dpService} service - 被测服务
 * @returns {CodecSnapshot} 编解码器快照
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
 * 读取音质指标快照。
 * @param {A2dpService} service - 被测服务
 * @returns {QualitySnapshot} 音质指标快照
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
 * 读取统计信息快照。getStatistics 返回 object，需通过 ESObject 读取字段。
 * @param {A2dpService} service - 被测服务
 * @returns {ServiceStatsSnapshot} 统计快照
 */
function statsSnapshot(service: A2dpService): ServiceStatsSnapshot {
  const stats: ESObject = service.getStatistics();
  const callbacks: ESObject = stats.callbackCounts;
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
    connectionCallbackCount: callbacks.connection,
    dataCallbackCount: callbacks.data,
    playbackCallbackCount: callbacks.playback,
    qualityCallbackCount: callbacks.quality
  };
  return snapshot;
}

/**
 * 读取最后一条操作历史，空历史返回空记录。
 * @param {A2dpService} service - 被测服务
 * @returns {HistoryEntrySnapshot} 最后一条历史
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
    // ==================== 生命周期与初始化（4 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_0100
     * @tc.name: testA2dpService0001
     * @tc.desc: Verify the default state of a newly created service before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0001', 0, () => {
      const service = new A2dpService();

      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(service.isPlaying()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getSupportedCodecs().length).assertEqual(0);
      expect(service.getActiveCodec()).assertEqual(null);
      expect(service.getPlaybackInfo()).assertEqual(null);
      expect(service.getQualityMetrics()).assertEqual(null);
      expect(service.getStreamConfig()).assertEqual(null);

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertFalse();
      expect(stats.operationHistoryCount).assertEqual(0);
      expect(stats.isStreamActive).assertFalse();
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
      const service = new A2dpService();

      expect(await service.initialize()).assertTrue();

      const codecs = codecSnapshot(service);
      expect(codecs.count).assertEqual(EXPECTED_CODEC_COUNT);
      expect(codecs.activeCount).assertEqual(1);
      expect(codecs.activeId).assertEqual(CODEC_ID_SBC);
      expect(codecs.activeName).assertEqual('SBC');
      expect(codecs.sbcActive).assertTrue();
      expect(codecs.aacActive).assertFalse();

      const playback = playbackSnapshot(service);
      expect(playback.volume).assertEqual(50);
      expect(playback.isPlaying).assertFalse();
      expect(playback.isPaused).assertFalse();
      expect(playback.trackIndex).assertEqual(0);
      expect(playback.totalTracks).assertEqual(0);

      const quality = qualitySnapshot(service);
      expect(quality.signalQuality).assertEqual(100);
      expect(quality.codecSwitchCount).assertEqual(0);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('initialize');
      expect(history.success).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertTrue();
      expect(stats.supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);
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
      const service = new A2dpService();

      expect(await service.initialize()).assertTrue();
      expect(await service.initialize()).assertFalse();

      const codecs = codecSnapshot(service);
      expect(codecs.count).assertEqual(EXPECTED_CODEC_COUNT);
      expect(codecs.activeCount).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('initialize');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Already initialized');

      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(statsSnapshot(service).isInitialized).assertTrue();
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
      const service = new A2dpService();
      let callbackCount: number = 0;
      const callback = (): void => {
        callbackCount += 1;
      };

      expect(await service.initialize()).assertTrue();
      service.addConnectionCallback(callback);
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1);

      await service.destroy();

      const destroyed = statsSnapshot(service);
      expect(destroyed.isInitialized).assertFalse();
      expect(destroyed.connectionCallbackCount).assertEqual(0);
      expect(destroyed.supportedCodecCount).assertEqual(0);
      expect(service.getSupportedCodecs().length).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      expect(callbackCount).assertEqual(0);

      expect(await service.initialize()).assertTrue();
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
      expect(statsSnapshot(service).isInitialized).assertTrue();
    });

    // ==================== 连接与断开（6 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_0500
     * @tc.name: testA2dpService0005
     * @tc.desc: Verify connect is rejected before initialization and records the reason.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0005', 0, async () => {
      const service = new A2dpService();

      expect(await service.connect(TEST_DEVICE_A)).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.isConnected()).assertFalse();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Service not initialized');
      expect(history.timestamp > 0).assertTrue();
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect('')).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Invalid device ID');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.CONNECTED);
      expect(service.getModel().isConnected()).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      expect(deviceIds.length).assertEqual(1);
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_A);

      const stats = statsSnapshot(service);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.isStreamActive).assertTrue();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual(`Connected to ${TEST_DEVICE_A}`);
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      expect(deviceIds.length).assertEqual(1);
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_A);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('connect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Already connected');
      expect(service.getOperationHistory().length).assertEqual(3);
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.connect(TEST_DEVICE_B)).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(2);

      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      expect(deviceIds.length).assertEqual(1);
      expect(deviceIds[0]).assertEqual(TEST_DEVICE_B);
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getModel().isConnected()).assertTrue();
      expect(statsSnapshot(service).connectedDeviceCount).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertTrue();
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.play()).assertTrue();

      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();

      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getA2dpState()).assertEqual(A2dpConnectionState.NOT_CONNECTED);
      expect(service.getModel().isConnected()).assertFalse();
      expect(service.getModel().getLogs().length).assertEqual(0);

      const stats = statsSnapshot(service);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.isStreamActive).assertFalse();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertTrue();
    });

    // ==================== 断开守卫、重置与销毁（4 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_1100
     * @tc.name: testA2dpService0011
     * @tc.desc: Verify disconnect is rejected before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0011', 0, async () => {
      const service = new A2dpService();

      expect(await service.disconnect(TEST_DEVICE_A)).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Service not initialized');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.disconnect('nonexistent_device')).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('disconnect');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Device not connected');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.setVolume(30)).assertTrue();
      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();
      expect(await service.play()).assertTrue();

      await service.reset();

      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);

      const history = service.getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].success).assertTrue();

      const playback = playbackSnapshot(service);
      expect(playback.volume).assertEqual(50);
      expect(playback.isPlaying).assertFalse();
      expect(playback.trackIndex).assertEqual(0);

      expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0);
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertTrue();
      expect(stats.currentCodec).assertEqual(CODEC_ID_SBC);
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
      const service = new A2dpService();
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

      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);

      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      service.addPlaybackCallback(playbackCallback);
      service.addQualityCallback(qualityCallback);

      const registered = statsSnapshot(service);
      expect(registered.connectionCallbackCount).assertEqual(1);
      expect(registered.dataCallbackCount).assertEqual(1);
      expect(registered.playbackCallbackCount).assertEqual(1);
      expect(registered.qualityCallbackCount).assertEqual(1);

      await service.destroy();

      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      expect(service.getSupportedCodecs().length).assertEqual(0);
      expect(callbackCount).assertEqual(0);

      const stats = statsSnapshot(service);
      expect(stats.isInitialized).assertFalse();
      expect(stats.connectionCallbackCount).assertEqual(0);
      expect(stats.dataCallbackCount).assertEqual(0);
      expect(stats.playbackCallbackCount).assertEqual(0);
      expect(stats.qualityCallbackCount).assertEqual(0);
      expect(stats.supportedCodecCount).assertEqual(0);
    });

    // ==================== 播放控制（6 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_1500
     * @tc.name: testA2dpService0015
     * @tc.desc: Verify all playback controls are rejected when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0015', 0, async () => {
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.play()).assertFalse();
      expect(await service.pause()).assertFalse();
      expect(await service.stop()).assertFalse();
      expect(await service.skipForward()).assertFalse();
      expect(await service.skipBackward()).assertFalse();

      expect(service.isPlaying()).assertFalse();
      const playback = playbackSnapshot(service);
      expect(playback.isPlaying).assertFalse();
      expect(playback.isPaused).assertFalse();
      expect(playback.trackIndex).assertEqual(0);

      const history = service.getOperationHistory().slice(1);
      expect(history.length).assertEqual(5);
      expect(history[0].operation).assertEqual('play');
      expect(history[1].operation).assertEqual('pause');
      expect(history[2].operation).assertEqual('stop');
      expect(history[3].operation).assertEqual('skipForward');
      expect(history[4].operation).assertEqual('skipBackward');
      let failedCount: number = 0;
      for (const entry of history) {
        if (!entry.success) {
          failedCount += 1;
        }
      }
      expect(failedCount).assertEqual(5);
      expect(history[4].details).assertEqual('Not connected');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.play()).assertTrue();
      expect(service.isPlaying()).assertTrue();
      expect(service.getModel().isPlaying).assertTrue();

      const playback = playbackSnapshot(service);
      expect(playback.isPlaying).assertTrue();
      expect(playback.isPaused).assertFalse();
      expect(statsSnapshot(service).isPlaying).assertTrue();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('play');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Playback started');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.play()).assertTrue();

      expect(await service.pause()).assertTrue();
      expect(service.isPlaying()).assertFalse();
      expect(service.getModel().isPlaying).assertFalse();

      const playback = playbackSnapshot(service);
      expect(playback.isPlaying).assertFalse();
      expect(playback.isPaused).assertTrue();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('pause');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Playback paused');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.play()).assertTrue();

      expect(await service.stop()).assertTrue();
      expect(service.isPlaying()).assertFalse();
      expect(service.getModel().isPlaying).assertFalse();
      expect(statsSnapshot(service).isPlaying).assertFalse();

      const playback = playbackSnapshot(service);
      expect(playback.isPlaying).assertFalse();
      expect(playback.isPaused).assertFalse();
      expect(playback.positionMs).assertEqual(0);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('stop');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Playback stopped');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const before = playbackSnapshot(service);
      expect(before.totalTracks).assertEqual(0);
      expect(before.trackIndex).assertEqual(0);

      expect(await service.skipForward()).assertTrue();
      expect(await service.skipBackward()).assertTrue();

      const after = playbackSnapshot(service);
      expect(after.totalTracks).assertEqual(0);
      expect(after.trackIndex).assertEqual(0);
      expect(after.positionMs).assertEqual(0);
      expect(service.getModel().playbackPosition).assertEqual(0);

      const history = service.getOperationHistory();
      expect(history[history.length - 2].operation).assertEqual('skipForward');
      expect(history[history.length - 1].operation).assertEqual('skipBackward');
      expect(history[history.length - 1].success).assertTrue();
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.setVolume(65)).assertTrue();
      expect(service.getModel().volume).assertEqual(65);

      const playback = playbackSnapshot(service);
      expect(playback.volume).assertEqual(65);
      expect(playback.isMuted).assertFalse();
      expect(statsSnapshot(service).currentVolume).assertEqual(65);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('setVolume');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Volume set to 65');
    });

    // ==================== 音量边界、编解码与防御性副本（5 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_2100
     * @tc.name: testA2dpService0021
     * @tc.desc: Verify volume clamping, rounding and the mute flag at the range boundaries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpService0021', 0, async () => {
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      expect(await service.setVolume(0)).assertTrue();
      expect(service.getModel().volume).assertEqual(0);
      expect(playbackSnapshot(service).isMuted).assertTrue();

      expect(await service.setVolume(100)).assertTrue();
      expect(service.getModel().volume).assertEqual(100);
      expect(playbackSnapshot(service).isMuted).assertFalse();

      expect(await service.setVolume(50.6)).assertTrue();
      expect(service.getModel().volume).assertEqual(51);

      expect(await service.setVolume(-20)).assertTrue();
      expect(service.getModel().volume).assertEqual(0);

      expect(await service.setVolume(150)).assertTrue();
      expect(service.getModel().volume).assertEqual(100);
      expect(playbackSnapshot(service).volume).assertEqual(100);

      expect(lastHistory(service).details).assertEqual('Volume set to 100');
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
      const service = new A2dpService();

      expect(await service.setVolume(50)).assertFalse();
      expect(service.getModel().volume).assertEqual(50);
      expect(service.getPlaybackInfo()).assertEqual(null);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('setVolume');
      expect(history.success).assertFalse();
      expect(history.details).assertEqual('Not initialized');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();

      const codecs = codecSnapshot(service);
      expect(codecs.activeId).assertEqual(CODEC_ID_AAC);
      expect(codecs.activeName).assertEqual('AAC');
      expect(codecs.activeCount).assertEqual(1);
      expect(codecs.sbcActive).assertFalse();
      expect(codecs.aacActive).assertTrue();

      expect(service.getModel().codec).assertEqual(CODEC_ID_AAC);
      expect(service.getModel().bitRate).assertEqual(CODEC_AAC_BIT_RATE);

      const quality = qualitySnapshot(service);
      expect(quality.codecSwitchCount).assertEqual(1);
      expect(quality.effectiveBitRate).assertEqual(CODEC_AAC_BIT_RATE);

      const stats = statsSnapshot(service);
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      expect(stats.activeCodec).assertEqual('AAC');
      expect(stats.codecSwitchCount).assertEqual(1);

      const history = lastHistory(service);
      expect(history.operation).assertEqual('selectCodec');
      expect(history.success).assertTrue();
      expect(history.details).assertEqual('Selected codec: AAC');
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(await service.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse();

      const codecs = codecSnapshot(service);
      expect(codecs.activeId).assertEqual(CODEC_ID_SBC);
      expect(codecs.activeCount).assertEqual(1);
      expect(service.getModel().codec).assertEqual(CODEC_ID_SBC);
      expect(statsSnapshot(service).codecSwitchCount).assertEqual(0);

      const failed = lastHistory(service);
      expect(failed.operation).assertEqual('selectCodec');
      expect(failed.success).assertFalse();
      expect(failed.details).assertEqual(`Unsupported codec: ${UNSUPPORTED_CODEC_ID}`);

      const uninitialized = new A2dpService();
      expect(await uninitialized.selectCodec(CODEC_ID_SBC)).assertFalse();
      expect(lastHistory(uninitialized).details).assertEqual('Not initialized');
      expect(uninitialized.getActiveCodec()).assertEqual(null);
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      const deviceIds = service.getConnectedDeviceIds();
      deviceIds.push('injected_device');
      expect(deviceIds.length).assertEqual(2);
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(TEST_DEVICE_A);

      const playback = service.getPlaybackInfo();
      expect(playback === null).assertFalse();
      if (playback !== null) {
        playback.volume = 99;
        playback.trackIndex = 7;
      }
      expect(playbackSnapshot(service).volume).assertEqual(50);
      expect(playbackSnapshot(service).trackIndex).assertEqual(0);

      const metrics = service.getQualityMetrics();
      expect(metrics === null).assertFalse();
      if (metrics !== null) {
        metrics.codecSwitchCount = 42;
      }
      expect(qualitySnapshot(service).codecSwitchCount).assertEqual(0);

      const codecs = service.getSupportedCodecs();
      codecs.pop();
      expect(codecs.length).assertEqual(EXPECTED_CODEC_COUNT - 1);
      expect(service.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
    });

    // ==================== 统计、未实现路径与回调（5 条） ====================

    /*
     * @tc.number: SUB_A2DP_SERVICE_2600
     * @tc.name: testA2dpService0026
     * @tc.desc: Verify statistics reflect the connected, playing and codec-switched state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpService0026', 0, async () => {
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(await service.play()).assertTrue();
      expect(await service.selectCodec(CODEC_ID_AAC)).assertTrue();

      const stats = statsSnapshot(service);
      expect(stats.serviceName).assertEqual('A2dpService');
      expect(stats.isInitialized).assertTrue();
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.isPlaying).assertTrue();
      expect(stats.currentVolume).assertEqual(50);
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      expect(stats.activeCodec).assertEqual('AAC');
      expect(stats.supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);
      expect(stats.isStreamActive).assertTrue();
      expect(stats.codecSwitchCount).assertEqual(1);
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      expect(stats.operationHistoryCount).assertEqual(4);
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
      const service = new A2dpService();
      expect(service.getStreamConfig()).assertEqual(null);
      expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null);

      expect(await service.initialize()).assertTrue();
      expect(await service.connect(TEST_DEVICE_A)).assertTrue();

      expect(service.getStreamConfig()).assertEqual(null);
      expect(service.getDeviceCapability(TEST_DEVICE_A)).assertEqual(null);
      expect(service.getDeviceCapability('')).assertEqual(null);
      expect(statsSnapshot(service).isStreamActive).assertTrue();
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();

      const states: BluetoothConnectionState[] = [];
      const callback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };
      service.addConnectionCallback(callback);
      service.addConnectionCallback(callback);
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(1);

      expect(await service.connect(TEST_DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(2);
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);

      service.removeConnectionCallback(callback);
      expect(statsSnapshot(service).connectionCallbackCount).assertEqual(0);

      expect(await service.disconnect(TEST_DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(2);
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
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
      expect(registered.dataCallbackCount).assertEqual(1);
      expect(registered.playbackCallbackCount).assertEqual(1);

      expect(await service.play()).assertTrue();
      expect(dataCount).assertEqual(1);
      expect(lastDataPlaying).assertTrue();
      expect(playbackCount).assertEqual(1);

      service.removePlaybackCallback(playbackCallback);
      expect(statsSnapshot(service).playbackCallbackCount).assertEqual(0);

      expect(await service.stop()).assertTrue();
      expect(dataCount).assertEqual(2);
      expect(lastDataPlaying).assertFalse();
      expect(playbackCount).assertEqual(1);
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
      const service = new A2dpService();
      expect(await service.initialize()).assertTrue();
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
      expect(statsSnapshot(service).dataCallbackCount).assertEqual(2);

      expect(await service.play()).assertTrue();
      expect(healthyCount).assertEqual(1);
      expect(service.isPlaying()).assertTrue();

      const history = lastHistory(service);
      expect(history.operation).assertEqual('play');
      expect(history.success).assertTrue();
    });
  });
}
