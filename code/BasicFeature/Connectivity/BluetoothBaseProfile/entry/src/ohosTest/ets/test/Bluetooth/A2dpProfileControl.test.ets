/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  A2dpModel,
  A2dpProfileManager,
  A2dpService,
  BluetoothConnectionState
} from 'library';

/**
 * @description Test suite for A2DP profile specific operations of A2dpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'A2dpService';
const DEVICE_A: string = 'a2dp_ctrl_device_a';
const DEVICE_B: string = 'a2dp_ctrl_device_b';
const EXPECTED_CODEC_COUNT: number = 5;
const CODEC_ID_SBC: number = 0;
const CODEC_ID_AAC: number = 2;
const CODEC_ID_APTX_HD: number = 3;
const CODEC_ID_LDAC: number = 4;
const UNSUPPORTED_CODEC_ID: number = 99;
const DEFAULT_VOLUME: number = 50;
const SBC_BIT_RATE: number = 320000;
const AAC_BIT_RATE: number = 320000;
const APTX_HD_BIT_RATE: number = 576000;
const LDAC_BIT_RATE: number = 990000;

interface HistoryView {
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
}

interface PlaybackView {
  trackName: string;
  artistName: string;
  albumName: string;
  positionMs: number;
  durationMs: number;
  isPlaying: boolean;
  isPaused: boolean;
  playbackSpeed: number;
  sourceType: number;
  sourceAppName: string;
  volume: number;
  isMuted: boolean;
  shuffleEnabled: boolean;
  repeatMode: number;
  trackIndex: number;
  totalTracks: number;
  artworkUrl: string;
  genre: string;
  year: number;
}

interface CodecView {
  codecId: number;
  codecName: string;
  maxBitRate: number;
  minBitRate: number;
  isActive: boolean;
  supportsHiRes: boolean;
  latencyMs: number;
  vendorId: number;
}

interface QualityView {
  signalQuality: number;
  codecSwitchCount: number;
  effectiveBitRate: number;
  isStable: boolean;
  sessionDurationMs: number;
  totalBytesTransmitted: number;
}

interface ServiceView {
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
}

function historyOf(manager: A2dpProfileManager): HistoryView[] {
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

function lastHistory(manager: A2dpProfileManager): HistoryView {
  const list = historyOf(manager);
  return list[list.length - 1];
}

function codecAt(manager: A2dpProfileManager, index: number): CodecView {
  const list: ESObject = manager.getSupportedCodecs();
  const item: ESObject = list[index];
  return {
    codecId: item.codecId,
    codecName: item.codecName,
    maxBitRate: item.maxBitRate,
    minBitRate: item.minBitRate,
    isActive: item.isActive,
    supportsHiRes: item.supportsHiRes,
    latencyMs: item.latencyMs,
    vendorId: item.vendorId
  };
}

function activeCodecCount(manager: A2dpProfileManager): number {
  const list: ESObject = manager.getSupportedCodecs();
  const length: number = list.length;
  let count = 0;
  for (let i = 0; i < length; i++) {
    if (list[i].isActive as boolean) {
      count++;
    }
  }
  return count;
}

function activeCodecOf(manager: A2dpProfileManager): CodecView | null {
  const info: ESObject = manager.getActiveCodec();
  if (info === null || info === undefined) {
    return null;
  }
  return {
    codecId: info.codecId,
    codecName: info.codecName,
    maxBitRate: info.maxBitRate,
    minBitRate: info.minBitRate,
    isActive: info.isActive,
    supportsHiRes: info.supportsHiRes,
    latencyMs: info.latencyMs,
    vendorId: info.vendorId
  };
}

function playbackOf(manager: A2dpProfileManager): PlaybackView | null {
  const info: ESObject = manager.getPlaybackInfo();
  if (info === null || info === undefined) {
    return null;
  }
  return {
    trackName: info.trackName,
    artistName: info.artistName,
    albumName: info.albumName,
    positionMs: info.positionMs,
    durationMs: info.durationMs,
    isPlaying: info.isPlaying,
    isPaused: info.isPaused,
    playbackSpeed: info.playbackSpeed,
    sourceType: info.sourceType,
    sourceAppName: info.sourceAppName,
    volume: info.volume,
    isMuted: info.isMuted,
    shuffleEnabled: info.shuffleEnabled,
    repeatMode: info.repeatMode,
    trackIndex: info.trackIndex,
    totalTracks: info.totalTracks,
    artworkUrl: info.artworkUrl,
    genre: info.genre,
    year: info.year
  };
}

function qualityOf(manager: A2dpProfileManager): QualityView | null {
  const metrics: ESObject = manager.getQualityMetrics();
  if (metrics === null || metrics === undefined) {
    return null;
  }
  return {
    signalQuality: metrics.signalQuality,
    codecSwitchCount: metrics.codecSwitchCount,
    effectiveBitRate: metrics.effectiveBitRate,
    isStable: metrics.isStable,
    sessionDurationMs: metrics.sessionDurationMs,
    totalBytesTransmitted: metrics.totalBytesTransmitted
  };
}

function serviceOf(manager: A2dpProfileManager): ServiceView {
  const stats: ESObject = manager.getService().getStatistics();
  return {
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
    operationHistoryCount: stats.operationHistoryCount
  };
}

async function readyManager(): Promise<A2dpProfileManager> {
  const manager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<A2dpProfileManager> {
  const manager = new A2dpProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function a2dpProfileControlTest(): void {
  describe('A2dpProfileControlTest', () => {
    /*
     * @tc.number: SUB_A2DP_CTRL_0100
     * @tc.name: testA2dpCtrl0001
     * @tc.desc: Verify that every audio operation is rejected before the manager is initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0001', 0, async () => {
      const manager = new A2dpProfileManager();
      const service = manager.getService();
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(manager.isPlaying()).assertFalse();
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      expect(manager.getActiveCodec()).assertNull();
      expect(manager.getPlaybackInfo()).assertNull();
      expect(manager.getQualityMetrics()).assertNull();

      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();
      expect(await manager.setVolume(30)).assertFalse();
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertFalse();

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      const stats = serviceOf(manager);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertFalse();
      expect(stats.supportedCodecCount).assertEqual(0);
      expect(stats.currentVolume).assertEqual(DEFAULT_VOLUME);
      expect(stats.activeCodec).assertEqual('None');
      expect(stats.isStreamActive).assertFalse();
      expect(stats.codecSwitchCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0200
     * @tc.name: testA2dpCtrl0002
     * @tc.desc: Verify playback control fails and volume or codec control succeeds without a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpCtrl0002', 0, async () => {
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      const initHistory = historyOf(manager);
      expect(initHistory.length).assertEqual(1);
      expect(initHistory[0].operation).assertEqual('initialize');
      expect(initHistory[0].success).assertTrue();
      expect(initHistory[0].details).assertEqual('Service initialized successfully');

      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();

      const failed = historyOf(manager);
      expect(failed.length).assertEqual(6);
      expect(failed[1].operation).assertEqual('play');
      expect(failed[2].operation).assertEqual('pause');
      expect(failed[3].operation).assertEqual('stop');
      expect(failed[4].operation).assertEqual('skipForward');
      expect(failed[5].operation).assertEqual('skipBackward');
      for (let i = 1; i < 6; i++) {
        expect(failed[i].success).assertFalse();
        expect(failed[i].details).assertEqual('Not connected');
      }
      expect(manager.isPlaying()).assertFalse();
      const infoAfterFailedPlay = playbackOf(manager);
      expect(infoAfterFailedPlay !== null).assertTrue();
      if (infoAfterFailedPlay !== null) {
        expect(infoAfterFailedPlay.isPlaying).assertFalse();
        expect(infoAfterFailedPlay.positionMs).assertEqual(0);
      }

      expect(await manager.setVolume(30)).assertTrue();
      expect(await manager.selectCodec(CODEC_ID_AAC)).assertTrue();
      const model = manager.getModel();
      expect(model.volume).assertEqual(30);
      expect(model.codec).assertEqual(CODEC_ID_AAC);
      expect(model.bitRate).assertEqual(AAC_BIT_RATE);
      expect(model.isPlaying).assertFalse();

      const mixed = historyOf(manager);
      expect(mixed.length).assertEqual(8);
      expect(mixed[6].operation).assertEqual('setVolume');
      expect(mixed[6].success).assertTrue();
      expect(mixed[6].details).assertEqual('Volume set to 30');
      expect(mixed[7].operation).assertEqual('selectCodec');
      expect(mixed[7].success).assertTrue();
      expect(mixed[7].details).assertEqual('Selected codec: AAC');

      const stats = serviceOf(manager);
      expect(stats.currentVolume).assertEqual(30);
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      expect(stats.activeCodec).assertEqual('AAC');
      expect(stats.codecSwitchCount).assertEqual(1);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0300
     * @tc.name: testA2dpCtrl0003
     * @tc.desc: Verify the codec list content and that a fresh copy is returned on every call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0003', 0, async () => {
      const manager = await readyManager();
      expect(activeCodecCount(manager)).assertEqual(1);
      const sbc = codecAt(manager, 0);
      expect(sbc.codecId).assertEqual(CODEC_ID_SBC);
      expect(sbc.codecName).assertEqual('SBC');
      expect(sbc.maxBitRate).assertEqual(SBC_BIT_RATE);
      expect(sbc.minBitRate).assertEqual(192000);
      expect(sbc.isActive).assertTrue();
      expect(sbc.supportsHiRes).assertFalse();
      expect(sbc.latencyMs).assertEqual(40);
      expect(sbc.vendorId).assertEqual(0);

      const aac = codecAt(manager, 1);
      expect(aac.codecId).assertEqual(CODEC_ID_AAC);
      expect(aac.codecName).assertEqual('AAC');
      expect(aac.isActive).assertFalse();
      expect(aac.maxBitRate).assertEqual(AAC_BIT_RATE);
      expect(aac.minBitRate).assertEqual(8000);

      const aptx = codecAt(manager, 2);
      expect(aptx.codecId).assertEqual(1);
      expect(aptx.codecName).assertEqual('aptX');
      expect(aptx.maxBitRate).assertEqual(352000);
      expect(aptx.vendorId).assertEqual(79);

      const aptxHd = codecAt(manager, 3);
      expect(aptxHd.codecId).assertEqual(CODEC_ID_APTX_HD);
      expect(aptxHd.codecName).assertEqual('aptX HD');
      expect(aptxHd.supportsHiRes).assertTrue();
      expect(aptxHd.maxBitRate).assertEqual(APTX_HD_BIT_RATE);

      const ldac = codecAt(manager, 4);
      expect(ldac.codecId).assertEqual(CODEC_ID_LDAC);
      expect(ldac.codecName).assertEqual('LDAC');
      expect(ldac.maxBitRate).assertEqual(LDAC_BIT_RATE);
      expect(ldac.minBitRate).assertEqual(303000);
      expect(ldac.supportsHiRes).assertTrue();
      expect(ldac.vendorId).assertEqual(301);

      const first: ESObject = manager.getSupportedCodecs();
      const second: ESObject = manager.getSupportedCodecs();
      expect(first === second).assertFalse();
      expect(second.length).assertEqual(EXPECTED_CODEC_COUNT);
      expect(first[0] === second[0]).assertTrue();
      first[0].isActive = false;
      expect(codecAt(manager, 0).isActive).assertFalse();
      expect(activeCodecCount(manager)).assertEqual(0);
      expect(manager.getActiveCodec()).assertNull();
      expect(serviceOf(manager).activeCodec).assertEqual('None');

      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      expect(codecAt(manager, 0).isActive).assertFalse();
      expect(codecAt(manager, 4).isActive).assertTrue();
      expect(activeCodecCount(manager)).assertEqual(1);
      expect(serviceOf(manager).supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0400
     * @tc.name: testA2dpCtrl0004
     * @tc.desc: Verify that selecting a codec moves the active flag and updates the model bit rate.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0004', 0, async () => {
      const manager = await readyManager();
      const defaultActive = activeCodecOf(manager);
      expect(defaultActive !== null).assertTrue();
      if (defaultActive !== null) {
        expect(defaultActive.codecId).assertEqual(CODEC_ID_SBC);
        expect(defaultActive.codecName).assertEqual('SBC');
        expect(defaultActive.isActive).assertTrue();
      }
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      expect(manager.getModel().bitRate).assertEqual(0);

      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      const switched = activeCodecOf(manager);
      expect(switched !== null).assertTrue();
      if (switched !== null) {
        expect(switched.codecId).assertEqual(CODEC_ID_LDAC);
        expect(switched.codecName).assertEqual('LDAC');
        expect(switched.maxBitRate).assertEqual(LDAC_BIT_RATE);
        expect(switched.supportsHiRes).assertTrue();
      }
      expect(activeCodecCount(manager)).assertEqual(1);
      expect(codecAt(manager, 0).isActive).assertFalse();
      expect(codecAt(manager, 4).isActive).assertTrue();
      expect(manager.getModel().codec).assertEqual(CODEC_ID_LDAC);
      expect(manager.getModel().bitRate).assertEqual(LDAC_BIT_RATE);

      const last = lastHistory(manager);
      expect(last.operation).assertEqual('selectCodec');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual('Selected codec: LDAC');
      const stats = serviceOf(manager);
      expect(stats.activeCodec).assertEqual('LDAC');
      expect(stats.currentCodec).assertEqual(CODEC_ID_LDAC);
      expect(stats.codecSwitchCount).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0500
     * @tc.name: testA2dpCtrl0005
     * @tc.desc: Verify that an unsupported codec identifier is rejected and leaves the codec state untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpCtrl0005', 0, async () => {
      const manager = await readyManager();
      expect(await manager.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse();
      const rejected = lastHistory(manager);
      expect(rejected.operation).assertEqual('selectCodec');
      expect(rejected.success).assertFalse();
      expect(rejected.details).assertEqual(`Unsupported codec: ${UNSUPPORTED_CODEC_ID}`);
      expect(historyOf(manager).length).assertEqual(2);
      expect(activeCodecCount(manager)).assertEqual(1);
      const active = activeCodecOf(manager);
      expect(active !== null).assertTrue();
      if (active !== null) {
        expect(active.codecId).assertEqual(CODEC_ID_SBC);
        expect(active.isActive).assertTrue();
      }
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      expect(manager.getModel().bitRate).assertEqual(0);
      const stats = serviceOf(manager);
      expect(stats.codecSwitchCount).assertEqual(0);
      expect(stats.activeCodec).assertEqual('SBC');
      const quality = qualityOf(manager);
      expect(quality !== null).assertTrue();
      if (quality !== null) {
        expect(quality.codecSwitchCount).assertEqual(0);
        expect(quality.effectiveBitRate).assertEqual(0);
      }

      expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue();
      expect(lastHistory(manager).details).assertEqual('Selected codec: SBC');
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      expect(manager.getModel().bitRate).assertEqual(SBC_BIT_RATE);
      expect(serviceOf(manager).codecSwitchCount).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0600
     * @tc.name: testA2dpCtrl0006
     * @tc.desc: Verify that quality metrics track every codec switch and expose the effective bit rate.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0006', 0, async () => {
      const manager = await readyManager();
      const baseline = qualityOf(manager);
      expect(baseline !== null).assertTrue();
      if (baseline !== null) {
        expect(baseline.signalQuality).assertEqual(100);
        expect(baseline.codecSwitchCount).assertEqual(0);
        expect(baseline.effectiveBitRate).assertEqual(0);
        expect(baseline.isStable).assertTrue();
        expect(baseline.totalBytesTransmitted).assertEqual(0);
      }
      const first: ESObject = manager.getQualityMetrics();
      const second: ESObject = manager.getQualityMetrics();
      expect(first === second).assertFalse();

      expect(await manager.selectCodec(CODEC_ID_APTX_HD)).assertTrue();
      const afterHd = qualityOf(manager);
      expect(afterHd !== null).assertTrue();
      if (afterHd !== null) {
        expect(afterHd.codecSwitchCount).assertEqual(1);
        expect(afterHd.effectiveBitRate).assertEqual(APTX_HD_BIT_RATE);
      }
      expect(manager.getModel().bitRate).assertEqual(APTX_HD_BIT_RATE);

      expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue();
      const afterSbc = qualityOf(manager);
      expect(afterSbc !== null).assertTrue();
      if (afterSbc !== null) {
        expect(afterSbc.codecSwitchCount).assertEqual(2);
        expect(afterSbc.effectiveBitRate).assertEqual(SBC_BIT_RATE);
      }
      expect(historyOf(manager).length).assertEqual(3);
      expect(manager.getOperationRecords().length).assertEqual(1);
      const stale: ESObject = first;
      expect(stale.codecSwitchCount).assertEqual(0);
      expect(stale.effectiveBitRate).assertEqual(0);
      const current: ESObject = manager.getQualityMetrics();
      expect(current.codecSwitchCount).assertEqual(2);
      expect(current.effectiveBitRate).assertEqual(SBC_BIT_RATE);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0700
     * @tc.name: testA2dpCtrl0007
     * @tc.desc: Verify the default playback information snapshot and its copy semantics.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0007', 0, async () => {
      const manager = await readyManager();
      const info = playbackOf(manager);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.trackName).assertEqual('');
        expect(info.artistName).assertEqual('');
        expect(info.albumName).assertEqual('');
        expect(info.positionMs).assertEqual(0);
        expect(info.durationMs).assertEqual(0);
        expect(info.isPlaying).assertFalse();
        expect(info.isPaused).assertFalse();
        expect(info.playbackSpeed).assertEqual(1);
        expect(info.sourceType).assertEqual(0);
        expect(info.sourceAppName).assertEqual('');
        expect(info.volume).assertEqual(DEFAULT_VOLUME);
        expect(info.isMuted).assertFalse();
        expect(info.shuffleEnabled).assertFalse();
        expect(info.repeatMode).assertEqual(0);
        expect(info.trackIndex).assertEqual(0);
        expect(info.totalTracks).assertEqual(0);
        expect(info.artworkUrl).assertEqual('');
        expect(info.genre).assertEqual('');
        expect(info.year).assertEqual(0);
      }
      const copyA: ESObject = manager.getPlaybackInfo();
      const copyB: ESObject = manager.getPlaybackInfo();
      expect(copyA === copyB).assertFalse();
      copyA.volume = 90;
      const infoAfterTamper = playbackOf(manager);
      expect(infoAfterTamper !== null).assertTrue();
      if (infoAfterTamper !== null) {
        expect(infoAfterTamper.volume).assertEqual(DEFAULT_VOLUME);
      }

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0800
     * @tc.name: testA2dpCtrl0008
     * @tc.desc: Verify that play after a successful connection updates model, playback info and callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0008', 0, async () => {
      const manager = new A2dpProfileManager();
      const service = manager.getService();
      let dataCount = 0;
      let playbackCount = 0;
      let connectionCount = 0;
      const dataCallback = (): void => {
        dataCount += 1;
      };
      const playbackCallback = (): void => {
        playbackCount += 1;
      };
      const connectionCallback = (): void => {
        connectionCount += 1;
      };
      service.addDataCallback(dataCallback);
      service.addPlaybackCallback(playbackCallback);
      service.addConnectionCallback(connectionCallback);

      expect(await manager.initialize()).assertTrue();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.isConnected()).assertTrue();
      expect(manager.getService().isConnected()).assertTrue();
      expect(dataCount).assertEqual(1);
      expect(connectionCount).assertEqual(2);
      expect(playbackCount).assertEqual(0);

      expect(await manager.play()).assertTrue();
      expect(manager.isPlaying()).assertTrue();
      const model = manager.getModel();
      expect(model.isPlaying).assertTrue();
      const info = playbackOf(manager);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.isPlaying).assertTrue();
        expect(info.isPaused).assertFalse();
      }
      expect(serviceOf(manager).isPlaying).assertTrue();
      const last = lastHistory(manager);
      expect(last.operation).assertEqual('play');
      expect(last.success).assertTrue();
      expect(last.details).assertEqual('Playback started');
      expect(dataCount).assertEqual(2);
      expect(playbackCount).assertEqual(1);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(manager.getStatistics().totalOperations).assertEqual(2);

      service.removeDataCallback(dataCallback);
      service.removePlaybackCallback(playbackCallback);
      service.removeConnectionCallback(connectionCallback);
      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_0900
     * @tc.name: testA2dpCtrl0009
     * @tc.desc: Verify that repeated pause calls keep reporting success while the paused flag stays set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0009', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(manager.isPlaying()).assertTrue();
      expect(await manager.pause()).assertTrue();
      expect(manager.isPlaying()).assertFalse();
      expect(await manager.pause()).assertTrue();

      const model = manager.getModel();
      expect(model.isPlaying).assertFalse();
      const info = playbackOf(manager);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.isPlaying).assertFalse();
        expect(info.isPaused).assertTrue();
      }
      const history = historyOf(manager);
      expect(history.length).assertEqual(5);
      expect(history[3].operation).assertEqual('pause');
      expect(history[3].details).assertEqual('Playback paused');
      expect(history[4].operation).assertEqual('pause');
      expect(history[4].success).assertTrue();
      expect(activeCodecCount(manager)).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_1000
     * @tc.name: testA2dpCtrl0010
     * @tc.desc: Verify that stop clears playback position while the configured volume is preserved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0010', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.setVolume(80)).assertTrue();
      expect(await manager.stop()).assertTrue();

      const model = manager.getModel();
      expect(model.isPlaying).assertFalse();
      expect(model.playbackPosition).assertEqual(0);
      expect(model.volume).assertEqual(80);
      const info = playbackOf(manager);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.isPlaying).assertFalse();
        expect(info.isPaused).assertFalse();
        expect(info.positionMs).assertEqual(0);
        expect(info.volume).assertEqual(80);
        expect(info.isMuted).assertFalse();
      }
      const last = lastHistory(manager);
      expect(last.operation).assertEqual('stop');
      expect(last.details).assertEqual('Playback stopped');

      expect(await manager.stop()).assertTrue();
      expect(historyOf(manager).length).assertEqual(6);
      expect(lastHistory(manager).details).assertEqual('Playback stopped');
      expect(manager.isPlaying()).assertFalse();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_1100
     * @tc.name: testA2dpCtrl0011
     * @tc.desc: Verify that track skipping reports success without changing an empty track list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpCtrl0011', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.skipForward()).assertTrue();
      const afterForward = playbackOf(manager);
      expect(afterForward !== null).assertTrue();
      if (afterForward !== null) {
        expect(afterForward.trackIndex).assertEqual(0);
        expect(afterForward.totalTracks).assertEqual(0);
        expect(afterForward.positionMs).assertEqual(0);
        expect(afterForward.isPlaying).assertTrue();
      }
      const forwardEntry = lastHistory(manager);
      expect(forwardEntry.operation).assertEqual('skipForward');
      expect(forwardEntry.success).assertTrue();
      expect(forwardEntry.details).assertEqual('Skipped to next track');

      expect(await manager.skipBackward()).assertTrue();
      const afterBackward = playbackOf(manager);
      expect(afterBackward !== null).assertTrue();
      if (afterBackward !== null) {
        expect(afterBackward.trackIndex).assertEqual(0);
        expect(afterBackward.isPlaying).assertTrue();
      }
      const backwardEntry = lastHistory(manager);
      expect(backwardEntry.operation).assertEqual('skipBackward');
      expect(backwardEntry.details).assertEqual('Skipped to previous track');
      expect(manager.getModel().playbackPosition).assertEqual(0);
      expect(manager.isPlaying()).assertTrue();
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_1200
     * @tc.name: testA2dpCtrl0012
     * @tc.desc: Verify volume clamping and rounding across out of range and fractional input values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpCtrl0012', 0, async () => {
      const manager = await readyManager();
      const volumes: number[] = [-20, 150, 33.6, 0, 100, 55.5];
      const expected: number[] = [0, 100, 34, 0, 100, 56];
      for (let i = 0; i < volumes.length; i++) {
        expect(await manager.setVolume(volumes[i])).assertTrue();
        expect(manager.getModel().volume).assertEqual(expected[i]);
      }
      const history = historyOf(manager);
      expect(history.length).assertEqual(7);
      for (let i = 0; i < expected.length; i++) {
        expect(history[i + 1].operation).assertEqual('setVolume');
        expect(history[i + 1].success).assertTrue();
        expect(history[i + 1].details).assertEqual(`Volume set to ${expected[i]}`);
      }
      const muted = playbackOf(manager);
      expect(muted !== null).assertTrue();
      if (muted !== null) {
        expect(muted.volume).assertEqual(56);
        expect(muted.isMuted).assertFalse();
      }

      expect(await manager.setVolume(0)).assertTrue();
      const zeroInfo = playbackOf(manager);
      expect(zeroInfo !== null).assertTrue();
      if (zeroInfo !== null) {
        expect(zeroInfo.volume).assertEqual(0);
        expect(zeroInfo.isMuted).assertTrue();
      }
      expect(manager.getModel().volume).assertEqual(0);
      expect(serviceOf(manager).currentVolume).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_1300
     * @tc.name: testA2dpCtrl0013
     * @tc.desc: Verify that the playing flag survives a disconnect while new playback attempts are refused.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpCtrl0013', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const modelBefore = manager.getModel();
      expect(await manager.play()).assertTrue();
      expect(manager.isPlaying()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.getService().isConnected()).assertFalse();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.isPlaying()).assertTrue();
      const modelAfter = manager.getModel();
      expect(modelAfter === modelBefore).assertTrue();
      expect(modelAfter.isPlaying).assertTrue();
      const staleInfo = playbackOf(manager);
      expect(staleInfo !== null).assertTrue();
      if (staleInfo !== null) {
        expect(staleInfo.isPlaying).assertTrue();
      }
      expect(serviceOf(manager).isPlaying).assertTrue();

      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(lastHistory(manager).details).assertEqual('Not connected');
      expect(manager.isPlaying()).assertTrue();

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.isPlaying()).assertTrue();
      expect(await manager.play()).assertTrue();
      expect(manager.isPlaying()).assertTrue();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_A2DP_CTRL_1400
     * @tc.name: testA2dpCtrl0014
     * @tc.desc: Verify codec and playback state after destroy and after a repeated initialization cycle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpCtrl0014', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const modelBeforeDestroy = manager.getModel();
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      expect(await manager.play()).assertTrue();
      expect(historyOf(manager).length).assertEqual(4);
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      expect(manager.getActiveCodec()).assertNull();
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      expect(activeCodecCount(manager)).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(1);
      const resetRecord = manager.getOperationRecords()[0];
      expect(resetRecord.operationName).assertEqual('reset');
      expect(resetRecord.details).assertEqual('Manager reset');
      expect(manager.getStatistics().totalOperations).assertEqual(4);
      const serviceStats = serviceOf(manager);
      expect(serviceStats.isInitialized).assertFalse();
      expect(serviceStats.supportedCodecCount).assertEqual(0);
      expect(serviceStats.codecSwitchCount).assertEqual(0);
      expect(serviceStats.operationHistoryCount).assertEqual(1);
      const history = historyOf(manager);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      const rebuilt = playbackOf(manager);
      expect(rebuilt === null).assertTrue();
      const rebuiltQuality = qualityOf(manager);
      expect(rebuiltQuality === null).assertTrue();
      expect(manager.isPlaying()).assertFalse();
      const modelAfterDestroy = manager.getModel();
      expect(modelAfterDestroy === modelBeforeDestroy).assertFalse();
      expect(modelAfterDestroy.isPlaying).assertFalse();
      expect(modelAfterDestroy.bitRate).assertEqual(0);
      expect(modelAfterDestroy.volume).assertEqual(DEFAULT_VOLUME);
      expect(serviceOf(manager).isPlaying).assertFalse();

      expect(await manager.initialize()).assertTrue();
      expect(manager.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
      const revivedActive = activeCodecOf(manager);
      expect(revivedActive !== null).assertTrue();
      if (revivedActive !== null) {
        expect(revivedActive.codecId).assertEqual(CODEC_ID_SBC);
        expect(revivedActive.isActive).assertTrue();
      }
      const revivedPlayback = playbackOf(manager);
      expect(revivedPlayback !== null).assertTrue();
      if (revivedPlayback !== null) {
        expect(revivedPlayback.isPlaying).assertFalse();
        expect(revivedPlayback.volume).assertEqual(DEFAULT_VOLUME);
      }
      const revivedQuality = qualityOf(manager);
      expect(revivedQuality !== null).assertTrue();
      if (revivedQuality !== null) {
        expect(revivedQuality.codecSwitchCount).assertEqual(0);
        expect(revivedQuality.effectiveBitRate).assertEqual(0);
      }
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getOperationRecords()[0].operationId).assertEqual('mgr_op_1');
      expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize');
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(await manager.play()).assertFalse();

      await manager.destroy();
    });
  });
}
