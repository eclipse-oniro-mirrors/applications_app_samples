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
  A2dpModel,
  A2dpProfileManager,
  A2dpService,
  BluetoothConnectionState
} from 'library';
import { A2dpAudioCodecInfo, A2dpPlaybackInfo, A2dpQualityMetrics, A2dpServiceStatistics } from 'library';

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
  const list: A2dpAudioCodecInfo[] = manager.getSupportedCodecs();
  const item: A2dpAudioCodecInfo = list[index];
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
  const list: A2dpAudioCodecInfo[] = manager.getSupportedCodecs();
  const length: number = list.length;
  let count: number = 0;
  for (let i = 0; i < length; i++) {
    if (list[i].isActive) {
      count++;
    }
  }
  return count;
}

function activeCodecOf(manager: A2dpProfileManager): CodecView | null {
  const info: A2dpAudioCodecInfo | null = manager.getActiveCodec();
  if (info === null) {
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
  const info: A2dpPlaybackInfo | null = manager.getPlaybackInfo();
  if (info === null) {
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
  const metrics: A2dpQualityMetrics | null = manager.getQualityMetrics();
  if (metrics === null) {
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
  const stats: A2dpServiceStatistics = manager.getService().getStatistics();
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
  const manager: A2dpProfileManager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<A2dpProfileManager> {
  const manager: A2dpProfileManager = new A2dpProfileManager();
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0001', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#2 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#3 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#5 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#6 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#7 assert ' + "expect(manager.getSupportedCodecs().length).assertEqual(0)");
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#8 assert ' + "expect(manager.getActiveCodec()).assertNull()");
      expect(manager.getActiveCodec()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#9 assert ' + "expect(manager.getPlaybackInfo()).assertNull()");
      expect(manager.getPlaybackInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#10 assert ' + "expect(manager.getQualityMetrics()).assertNull()");
      expect(manager.getQualityMetrics()).assertNull();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#11 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#12 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#13 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#14 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#15 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#16 assert ' + "expect(await manager.setVolume(30)).assertFalse()");
      expect(await manager.setVolume(30)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#17 assert ' + "expect(await manager.selectCodec(CODEC_ID_LDAC)).assertFalse()");
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#18 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#19 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#20 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#21 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#22 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#23 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#24 ' + "stats.supportedCodecCount" + ' = ' + JSON.stringify(stats.supportedCodecCount));
      expect(stats.supportedCodecCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#25 ' + "stats.currentVolume" + ' = ' + JSON.stringify(stats.currentVolume));
      expect(stats.currentVolume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#26 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('None');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#27 ' + "stats.isStreamActive" + ' = ' + JSON.stringify(stats.isStreamActive));
      expect(stats.isStreamActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0001',
        '#28 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#2 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      const initHistory = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#3 ' + "initHistory.length" + ' = ' + JSON.stringify(initHistory.length));
      expect(initHistory.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#4 ' + "initHistory[0].operation" + ' = ' + JSON.stringify(initHistory[0].operation));
      expect(initHistory[0].operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#5 ' + "initHistory[0].success" + ' = ' + JSON.stringify(initHistory[0].success));
      expect(initHistory[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#6 ' + "initHistory[0].details" + ' = ' + JSON.stringify(initHistory[0].details));
      expect(initHistory[0].details).assertEqual('Service initialized successfully');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#7 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#8 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#9 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#10 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#11 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();

      const failed = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#12 ' + "failed.length" + ' = ' + JSON.stringify(failed.length));
      expect(failed.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#13 ' + "failed[1].operation" + ' = ' + JSON.stringify(failed[1].operation));
      expect(failed[1].operation).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#14 ' + "failed[2].operation" + ' = ' + JSON.stringify(failed[2].operation));
      expect(failed[2].operation).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#15 ' + "failed[3].operation" + ' = ' + JSON.stringify(failed[3].operation));
      expect(failed[3].operation).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#16 ' + "failed[4].operation" + ' = ' + JSON.stringify(failed[4].operation));
      expect(failed[4].operation).assertEqual('skipForward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#17 ' + "failed[5].operation" + ' = ' + JSON.stringify(failed[5].operation));
      expect(failed[5].operation).assertEqual('skipBackward');
      for (let i = 1; i < 6; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
          '#18 ' + "failed[i].success" + ' = ' + JSON.stringify(failed[i].success));
        expect(failed[i].success).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
          '#19 ' + "failed[i].details" + ' = ' + JSON.stringify(failed[i].details));
        expect(failed[i].details).assertEqual('Not connected');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#20 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();
      const infoAfterFailedPlay = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#21 ' + "infoAfterFailedPlay !== null" + ' = ' + JSON.stringify(infoAfterFailedPlay !== null));
      expect(infoAfterFailedPlay !== null).assertTrue();
      if (infoAfterFailedPlay !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
          '#22 ' + "infoAfterFailedPlay.isPlaying" + ' = ' + JSON.stringify(infoAfterFailedPlay.isPlaying));
        expect(infoAfterFailedPlay.isPlaying).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
          '#23 ' + "infoAfterFailedPlay.positionMs" + ' = ' + JSON.stringify(infoAfterFailedPlay.positionMs));
        expect(infoAfterFailedPlay.positionMs).assertEqual(0);
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#24 assert ' + "expect(await manager.setVolume(30)).assertTrue()");
      expect(await manager.setVolume(30)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#25 assert ' + "expect(await manager.selectCodec(CODEC_ID_AAC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_AAC)).assertTrue();
      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#26 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#27 ' + "model.codec" + ' = ' + JSON.stringify(model.codec));
      expect(model.codec).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#28 ' + "model.bitRate" + ' = ' + JSON.stringify(model.bitRate));
      expect(model.bitRate).assertEqual(AAC_BIT_RATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#29 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertFalse();

      const mixed = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#30 ' + "mixed.length" + ' = ' + JSON.stringify(mixed.length));
      expect(mixed.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#31 ' + "mixed[6].operation" + ' = ' + JSON.stringify(mixed[6].operation));
      expect(mixed[6].operation).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#32 ' + "mixed[6].success" + ' = ' + JSON.stringify(mixed[6].success));
      expect(mixed[6].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#33 ' + "mixed[6].details" + ' = ' + JSON.stringify(mixed[6].details));
      expect(mixed[6].details).assertEqual('Volume set to 30');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#34 ' + "mixed[7].operation" + ' = ' + JSON.stringify(mixed[7].operation));
      expect(mixed[7].operation).assertEqual('selectCodec');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#35 ' + "mixed[7].success" + ' = ' + JSON.stringify(mixed[7].success));
      expect(mixed[7].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#36 ' + "mixed[7].details" + ' = ' + JSON.stringify(mixed[7].details));
      expect(mixed[7].details).assertEqual('Selected codec: AAC');

      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#37 ' + "stats.currentVolume" + ' = ' + JSON.stringify(stats.currentVolume));
      expect(stats.currentVolume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#38 ' + "stats.currentCodec" + ' = ' + JSON.stringify(stats.currentCodec));
      expect(stats.currentCodec).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#39 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#40 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#41 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#42 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0002',
        '#43 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0003', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#1 assert ' + "expect(activeCodecCount(manager)).assertEqual(1)");
      expect(activeCodecCount(manager)).assertEqual(1);
      const sbc = codecAt(manager, 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#2 ' + "sbc.codecId" + ' = ' + JSON.stringify(sbc.codecId));
      expect(sbc.codecId).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#3 ' + "sbc.codecName" + ' = ' + JSON.stringify(sbc.codecName));
      expect(sbc.codecName).assertEqual('SBC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#4 ' + "sbc.maxBitRate" + ' = ' + JSON.stringify(sbc.maxBitRate));
      expect(sbc.maxBitRate).assertEqual(SBC_BIT_RATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#5 ' + "sbc.minBitRate" + ' = ' + JSON.stringify(sbc.minBitRate));
      expect(sbc.minBitRate).assertEqual(192000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#6 ' + "sbc.isActive" + ' = ' + JSON.stringify(sbc.isActive));
      expect(sbc.isActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#7 ' + "sbc.supportsHiRes" + ' = ' + JSON.stringify(sbc.supportsHiRes));
      expect(sbc.supportsHiRes).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#8 ' + "sbc.latencyMs" + ' = ' + JSON.stringify(sbc.latencyMs));
      expect(sbc.latencyMs).assertEqual(40);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#9 ' + "sbc.vendorId" + ' = ' + JSON.stringify(sbc.vendorId));
      expect(sbc.vendorId).assertEqual(0);

      const aac = codecAt(manager, 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#10 ' + "aac.codecId" + ' = ' + JSON.stringify(aac.codecId));
      expect(aac.codecId).assertEqual(CODEC_ID_AAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#11 ' + "aac.codecName" + ' = ' + JSON.stringify(aac.codecName));
      expect(aac.codecName).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#12 ' + "aac.isActive" + ' = ' + JSON.stringify(aac.isActive));
      expect(aac.isActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#13 ' + "aac.maxBitRate" + ' = ' + JSON.stringify(aac.maxBitRate));
      expect(aac.maxBitRate).assertEqual(AAC_BIT_RATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#14 ' + "aac.minBitRate" + ' = ' + JSON.stringify(aac.minBitRate));
      expect(aac.minBitRate).assertEqual(8000);

      const aptx = codecAt(manager, 2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#15 ' + "aptx.codecId" + ' = ' + JSON.stringify(aptx.codecId));
      expect(aptx.codecId).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#16 ' + "aptx.codecName" + ' = ' + JSON.stringify(aptx.codecName));
      expect(aptx.codecName).assertEqual('aptX');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#17 ' + "aptx.maxBitRate" + ' = ' + JSON.stringify(aptx.maxBitRate));
      expect(aptx.maxBitRate).assertEqual(352000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#18 ' + "aptx.vendorId" + ' = ' + JSON.stringify(aptx.vendorId));
      expect(aptx.vendorId).assertEqual(79);

      const aptxHd = codecAt(manager, 3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#19 ' + "aptxHd.codecId" + ' = ' + JSON.stringify(aptxHd.codecId));
      expect(aptxHd.codecId).assertEqual(CODEC_ID_APTX_HD);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#20 ' + "aptxHd.codecName" + ' = ' + JSON.stringify(aptxHd.codecName));
      expect(aptxHd.codecName).assertEqual('aptX HD');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#21 ' + "aptxHd.supportsHiRes" + ' = ' + JSON.stringify(aptxHd.supportsHiRes));
      expect(aptxHd.supportsHiRes).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#22 ' + "aptxHd.maxBitRate" + ' = ' + JSON.stringify(aptxHd.maxBitRate));
      expect(aptxHd.maxBitRate).assertEqual(APTX_HD_BIT_RATE);

      const ldac = codecAt(manager, 4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#23 ' + "ldac.codecId" + ' = ' + JSON.stringify(ldac.codecId));
      expect(ldac.codecId).assertEqual(CODEC_ID_LDAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#24 ' + "ldac.codecName" + ' = ' + JSON.stringify(ldac.codecName));
      expect(ldac.codecName).assertEqual('LDAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#25 ' + "ldac.maxBitRate" + ' = ' + JSON.stringify(ldac.maxBitRate));
      expect(ldac.maxBitRate).assertEqual(LDAC_BIT_RATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#26 ' + "ldac.minBitRate" + ' = ' + JSON.stringify(ldac.minBitRate));
      expect(ldac.minBitRate).assertEqual(303000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#27 ' + "ldac.supportsHiRes" + ' = ' + JSON.stringify(ldac.supportsHiRes));
      expect(ldac.supportsHiRes).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#28 ' + "ldac.vendorId" + ' = ' + JSON.stringify(ldac.vendorId));
      expect(ldac.vendorId).assertEqual(301);

      const first: A2dpAudioCodecInfo[] = manager.getSupportedCodecs();
      const second: A2dpAudioCodecInfo[] = manager.getSupportedCodecs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#29 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#30 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(EXPECTED_CODEC_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#31 ' + "first[0] === second[0]" + ' = ' + JSON.stringify(first[0] === second[0]));
      expect(first[0] === second[0]).assertTrue();
      first[0].isActive = false;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#32 assert ' + "expect(codecAt(manager, 0).isActive).assertFalse()");
      expect(codecAt(manager, 0).isActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#33 assert ' + "expect(activeCodecCount(manager)).assertEqual(0)");
      expect(activeCodecCount(manager)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#34 assert ' + "expect(manager.getActiveCodec()).assertNull()");
      expect(manager.getActiveCodec()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#35 assert ' + "expect(serviceOf(manager).activeCodec).assertEqual('None')");
      expect(serviceOf(manager).activeCodec).assertEqual('None');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#36 assert ' + "expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#37 assert ' + "expect(codecAt(manager, 0).isActive).assertFalse()");
      expect(codecAt(manager, 0).isActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#38 assert ' + "expect(codecAt(manager, 4).isActive).assertTrue()");
      expect(codecAt(manager, 4).isActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#39 assert ' + "expect(activeCodecCount(manager)).assertEqual(1)");
      expect(activeCodecCount(manager)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0003',
        '#40 assert ' + "expect(serviceOf(manager).supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT)");
      expect(serviceOf(manager).supportedCodecCount).assertEqual(EXPECTED_CODEC_COUNT);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0004', 'begin');
      const manager = await readyManager();
      const defaultActive = activeCodecOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#1 ' + "defaultActive !== null" + ' = ' + JSON.stringify(defaultActive !== null));
      expect(defaultActive !== null).assertTrue();
      if (defaultActive !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#2 ' + "defaultActive.codecId" + ' = ' + JSON.stringify(defaultActive.codecId));
        expect(defaultActive.codecId).assertEqual(CODEC_ID_SBC);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#3 ' + "defaultActive.codecName" + ' = ' + JSON.stringify(defaultActive.codecName));
        expect(defaultActive.codecName).assertEqual('SBC');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#4 ' + "defaultActive.isActive" + ' = ' + JSON.stringify(defaultActive.isActive));
        expect(defaultActive.isActive).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#5 assert ' + "expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC)");
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#6 assert ' + "expect(manager.getModel().bitRate).assertEqual(0)");
      expect(manager.getModel().bitRate).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#7 assert ' + "expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      const switched = activeCodecOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#8 ' + "switched !== null" + ' = ' + JSON.stringify(switched !== null));
      expect(switched !== null).assertTrue();
      if (switched !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#9 ' + "switched.codecId" + ' = ' + JSON.stringify(switched.codecId));
        expect(switched.codecId).assertEqual(CODEC_ID_LDAC);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#10 ' + "switched.codecName" + ' = ' + JSON.stringify(switched.codecName));
        expect(switched.codecName).assertEqual('LDAC');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#11 ' + "switched.maxBitRate" + ' = ' + JSON.stringify(switched.maxBitRate));
        expect(switched.maxBitRate).assertEqual(LDAC_BIT_RATE);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
          '#12 ' + "switched.supportsHiRes" + ' = ' + JSON.stringify(switched.supportsHiRes));
        expect(switched.supportsHiRes).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#13 assert ' + "expect(activeCodecCount(manager)).assertEqual(1)");
      expect(activeCodecCount(manager)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#14 assert ' + "expect(codecAt(manager, 0).isActive).assertFalse()");
      expect(codecAt(manager, 0).isActive).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#15 assert ' + "expect(codecAt(manager, 4).isActive).assertTrue()");
      expect(codecAt(manager, 4).isActive).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#16 assert ' + "expect(manager.getModel().codec).assertEqual(CODEC_ID_LDAC)");
      expect(manager.getModel().codec).assertEqual(CODEC_ID_LDAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#17 assert ' + "expect(manager.getModel().bitRate).assertEqual(LDAC_BIT_RATE)");
      expect(manager.getModel().bitRate).assertEqual(LDAC_BIT_RATE);

      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#18 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('selectCodec');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#19 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#20 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Selected codec: LDAC');
      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#21 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('LDAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#22 ' + "stats.currentCodec" + ' = ' + JSON.stringify(stats.currentCodec));
      expect(stats.currentCodec).assertEqual(CODEC_ID_LDAC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0004',
        '#23 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0005', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#1 assert ' + "expect(await manager.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse()");
      expect(await manager.selectCodec(UNSUPPORTED_CODEC_ID)).assertFalse();
      const rejected = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#2 ' + "rejected.operation" + ' = ' + JSON.stringify(rejected.operation));
      expect(rejected.operation).assertEqual('selectCodec');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#3 ' + "rejected.success" + ' = ' + JSON.stringify(rejected.success));
      expect(rejected.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#4 ' + "rejected.details" + ' = ' + JSON.stringify(rejected.details));
      expect(rejected.details).assertEqual(`Unsupported codec: ${UNSUPPORTED_CODEC_ID}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#5 assert ' + "expect(historyOf(manager).length).assertEqual(2)");
      expect(historyOf(manager).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#6 assert ' + "expect(activeCodecCount(manager)).assertEqual(1)");
      expect(activeCodecCount(manager)).assertEqual(1);
      const active = activeCodecOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#7 ' + "active !== null" + ' = ' + JSON.stringify(active !== null));
      expect(active !== null).assertTrue();
      if (active !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
          '#8 ' + "active.codecId" + ' = ' + JSON.stringify(active.codecId));
        expect(active.codecId).assertEqual(CODEC_ID_SBC);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
          '#9 ' + "active.isActive" + ' = ' + JSON.stringify(active.isActive));
        expect(active.isActive).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#10 assert ' + "expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC)");
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#11 assert ' + "expect(manager.getModel().bitRate).assertEqual(0)");
      expect(manager.getModel().bitRate).assertEqual(0);
      const stats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#12 ' + "stats.codecSwitchCount" + ' = ' + JSON.stringify(stats.codecSwitchCount));
      expect(stats.codecSwitchCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#13 ' + "stats.activeCodec" + ' = ' + JSON.stringify(stats.activeCodec));
      expect(stats.activeCodec).assertEqual('SBC');
      const quality = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#14 ' + "quality !== null" + ' = ' + JSON.stringify(quality !== null));
      expect(quality !== null).assertTrue();
      if (quality !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
          '#15 ' + "quality.codecSwitchCount" + ' = ' + JSON.stringify(quality.codecSwitchCount));
        expect(quality.codecSwitchCount).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
          '#16 ' + "quality.effectiveBitRate" + ' = ' + JSON.stringify(quality.effectiveBitRate));
        expect(quality.effectiveBitRate).assertEqual(0);
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#17 assert ' + "expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#18 assert ' + "expect(lastHistory(manager).details).assertEqual('Selected codec: SBC')");
      expect(lastHistory(manager).details).assertEqual('Selected codec: SBC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#19 assert ' + "expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC)");
      expect(manager.getModel().codec).assertEqual(CODEC_ID_SBC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#20 assert ' + "expect(manager.getModel().bitRate).assertEqual(SBC_BIT_RATE)");
      expect(manager.getModel().bitRate).assertEqual(SBC_BIT_RATE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0005',
        '#21 assert ' + "expect(serviceOf(manager).codecSwitchCount).assertEqual(1)");
      expect(serviceOf(manager).codecSwitchCount).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0006', 'begin');
      const manager = await readyManager();
      const baseline = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#1 ' + "baseline !== null" + ' = ' + JSON.stringify(baseline !== null));
      expect(baseline !== null).assertTrue();
      if (baseline !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#2 ' + "baseline.signalQuality" + ' = ' + JSON.stringify(baseline.signalQuality));
        expect(baseline.signalQuality).assertEqual(100);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#3 ' + "baseline.codecSwitchCount" + ' = ' + JSON.stringify(baseline.codecSwitchCount));
        expect(baseline.codecSwitchCount).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#4 ' + "baseline.effectiveBitRate" + ' = ' + JSON.stringify(baseline.effectiveBitRate));
        expect(baseline.effectiveBitRate).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#5 ' + "baseline.isStable" + ' = ' + JSON.stringify(baseline.isStable));
        expect(baseline.isStable).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#6 ' + "baseline.totalBytesTransmitted" + ' = ' + JSON.stringify(baseline.totalBytesTransmitted));
        expect(baseline.totalBytesTransmitted).assertEqual(0);
      }
      const first: A2dpQualityMetrics | null = manager.getQualityMetrics();
      const second: A2dpQualityMetrics | null = manager.getQualityMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#7 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#8 assert ' + "expect(await manager.selectCodec(CODEC_ID_APTX_HD)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_APTX_HD)).assertTrue();
      const afterHd = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#9 ' + "afterHd !== null" + ' = ' + JSON.stringify(afterHd !== null));
      expect(afterHd !== null).assertTrue();
      if (afterHd !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#10 ' + "afterHd.codecSwitchCount" + ' = ' + JSON.stringify(afterHd.codecSwitchCount));
        expect(afterHd.codecSwitchCount).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#11 ' + "afterHd.effectiveBitRate" + ' = ' + JSON.stringify(afterHd.effectiveBitRate));
        expect(afterHd.effectiveBitRate).assertEqual(APTX_HD_BIT_RATE);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#12 assert ' + "expect(manager.getModel().bitRate).assertEqual(APTX_HD_BIT_RATE)");
      expect(manager.getModel().bitRate).assertEqual(APTX_HD_BIT_RATE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#13 assert ' + "expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_SBC)).assertTrue();
      const afterSbc = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#14 ' + "afterSbc !== null" + ' = ' + JSON.stringify(afterSbc !== null));
      expect(afterSbc !== null).assertTrue();
      if (afterSbc !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#15 ' + "afterSbc.codecSwitchCount" + ' = ' + JSON.stringify(afterSbc.codecSwitchCount));
        expect(afterSbc.codecSwitchCount).assertEqual(2);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#16 ' + "afterSbc.effectiveBitRate" + ' = ' + JSON.stringify(afterSbc.effectiveBitRate));
        expect(afterSbc.effectiveBitRate).assertEqual(SBC_BIT_RATE);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#17 assert ' + "expect(historyOf(manager).length).assertEqual(3)");
      expect(historyOf(manager).length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
        '#18 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      const stale: A2dpQualityMetrics | null = first;
      if (stale !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#19 ' + "stale.codecSwitchCount" + ' = ' + JSON.stringify(stale.codecSwitchCount));
        expect(stale.codecSwitchCount).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#20 ' + "stale.effectiveBitRate" + ' = ' + JSON.stringify(stale.effectiveBitRate));
        expect(stale.effectiveBitRate).assertEqual(0);
      }
      const current: A2dpQualityMetrics | null = manager.getQualityMetrics();
      if (current !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#21 ' + "current.codecSwitchCount" + ' = ' + JSON.stringify(current.codecSwitchCount));
        expect(current.codecSwitchCount).assertEqual(2);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0006',
          '#22 ' + "current.effectiveBitRate" + ' = ' + JSON.stringify(current.effectiveBitRate));
        expect(current.effectiveBitRate).assertEqual(SBC_BIT_RATE);
      }

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0007', 'begin');
      const manager = await readyManager();
      const info = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
        '#1 ' + "info !== null" + ' = ' + JSON.stringify(info !== null));
      expect(info !== null).assertTrue();
      if (info !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#2 ' + "info.trackName" + ' = ' + JSON.stringify(info.trackName));
        expect(info.trackName).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#3 ' + "info.artistName" + ' = ' + JSON.stringify(info.artistName));
        expect(info.artistName).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#4 ' + "info.albumName" + ' = ' + JSON.stringify(info.albumName));
        expect(info.albumName).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#5 ' + "info.positionMs" + ' = ' + JSON.stringify(info.positionMs));
        expect(info.positionMs).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#6 ' + "info.durationMs" + ' = ' + JSON.stringify(info.durationMs));
        expect(info.durationMs).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#7 ' + "info.isPlaying" + ' = ' + JSON.stringify(info.isPlaying));
        expect(info.isPlaying).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#8 ' + "info.isPaused" + ' = ' + JSON.stringify(info.isPaused));
        expect(info.isPaused).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#9 ' + "info.playbackSpeed" + ' = ' + JSON.stringify(info.playbackSpeed));
        expect(info.playbackSpeed).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#10 ' + "info.sourceType" + ' = ' + JSON.stringify(info.sourceType));
        expect(info.sourceType).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#11 ' + "info.sourceAppName" + ' = ' + JSON.stringify(info.sourceAppName));
        expect(info.sourceAppName).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#12 ' + "info.volume" + ' = ' + JSON.stringify(info.volume));
        expect(info.volume).assertEqual(DEFAULT_VOLUME);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#13 ' + "info.isMuted" + ' = ' + JSON.stringify(info.isMuted));
        expect(info.isMuted).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#14 ' + "info.shuffleEnabled" + ' = ' + JSON.stringify(info.shuffleEnabled));
        expect(info.shuffleEnabled).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#15 ' + "info.repeatMode" + ' = ' + JSON.stringify(info.repeatMode));
        expect(info.repeatMode).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#16 ' + "info.trackIndex" + ' = ' + JSON.stringify(info.trackIndex));
        expect(info.trackIndex).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#17 ' + "info.totalTracks" + ' = ' + JSON.stringify(info.totalTracks));
        expect(info.totalTracks).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#18 ' + "info.artworkUrl" + ' = ' + JSON.stringify(info.artworkUrl));
        expect(info.artworkUrl).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#19 ' + "info.genre" + ' = ' + JSON.stringify(info.genre));
        expect(info.genre).assertEqual('');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#20 ' + "info.year" + ' = ' + JSON.stringify(info.year));
        expect(info.year).assertEqual(0);
      }
      const copyA: A2dpPlaybackInfo | null = manager.getPlaybackInfo();
      const copyB: A2dpPlaybackInfo | null = manager.getPlaybackInfo();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
        '#21 ' + "copyA === copyB" + ' = ' + JSON.stringify(copyA === copyB));
      expect(copyA === copyB).assertFalse();
      if (copyA !== null) {
        copyA.volume = 90;
      }
      const infoAfterTamper = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
        '#22 ' + "infoAfterTamper !== null" + ' = ' + JSON.stringify(infoAfterTamper !== null));
      expect(infoAfterTamper !== null).assertTrue();
      if (infoAfterTamper !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0007',
          '#23 ' + "infoAfterTamper.volume" + ' = ' + JSON.stringify(infoAfterTamper.volume));
        expect(infoAfterTamper.volume).assertEqual(DEFAULT_VOLUME);
      }

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0008', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const service = manager.getService();
      let dataCount: number = 0;
      let playbackCount: number = 0;
      let connectionCount: number = 0;
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#1 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#2 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#4 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#5 assert ' + "expect(manager.getService().isConnected()).assertTrue()");
      expect(manager.getService().isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#6 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#7 ' + "connectionCount" + ' = ' + JSON.stringify(connectionCount));
      expect(connectionCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#8 ' + "playbackCount" + ' = ' + JSON.stringify(playbackCount));
      expect(playbackCount).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#9 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#10 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();
      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#11 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertTrue();
      const info = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#12 ' + "info !== null" + ' = ' + JSON.stringify(info !== null));
      expect(info !== null).assertTrue();
      if (info !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
          '#13 ' + "info.isPlaying" + ' = ' + JSON.stringify(info.isPlaying));
        expect(info.isPlaying).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
          '#14 ' + "info.isPaused" + ' = ' + JSON.stringify(info.isPaused));
        expect(info.isPaused).assertFalse();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#15 assert ' + "expect(serviceOf(manager).isPlaying).assertTrue()");
      expect(serviceOf(manager).isPlaying).assertTrue();
      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#16 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#17 ' + "last.success" + ' = ' + JSON.stringify(last.success));
      expect(last.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#18 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Playback started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#19 ' + "dataCount" + ' = ' + JSON.stringify(dataCount));
      expect(dataCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#20 ' + "playbackCount" + ' = ' + JSON.stringify(playbackCount));
      expect(playbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#21 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0008',
        '#22 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(2)");
      expect(manager.getStatistics().totalOperations).assertEqual(2);

      service.removeDataCallback(dataCallback);
      service.removePlaybackCallback(playbackCallback);
      service.removeConnectionCallback(connectionCallback);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#2 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#3 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#4 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#5 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#6 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertFalse();
      const info = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#7 ' + "info !== null" + ' = ' + JSON.stringify(info !== null));
      expect(info !== null).assertTrue();
      if (info !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
          '#8 ' + "info.isPlaying" + ' = ' + JSON.stringify(info.isPlaying));
        expect(info.isPlaying).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
          '#9 ' + "info.isPaused" + ' = ' + JSON.stringify(info.isPaused));
        expect(info.isPaused).assertTrue();
      }
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#11 ' + "history[3].operation" + ' = ' + JSON.stringify(history[3].operation));
      expect(history[3].operation).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#12 ' + "history[3].details" + ' = ' + JSON.stringify(history[3].details));
      expect(history[3].details).assertEqual('Playback paused');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#13 ' + "history[4].operation" + ' = ' + JSON.stringify(history[4].operation));
      expect(history[4].operation).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#14 ' + "history[4].success" + ' = ' + JSON.stringify(history[4].success));
      expect(history[4].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0009',
        '#15 assert ' + "expect(activeCodecCount(manager)).assertEqual(1)");
      expect(activeCodecCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#2 assert ' + "expect(await manager.setVolume(80)).assertTrue()");
      expect(await manager.setVolume(80)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#3 assert ' + "expect(await manager.stop()).assertTrue()");
      expect(await manager.stop()).assertTrue();

      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#4 ' + "model.isPlaying" + ' = ' + JSON.stringify(model.isPlaying));
      expect(model.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#5 ' + "model.playbackPosition" + ' = ' + JSON.stringify(model.playbackPosition));
      expect(model.playbackPosition).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#6 ' + "model.volume" + ' = ' + JSON.stringify(model.volume));
      expect(model.volume).assertEqual(80);
      const info = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#7 ' + "info !== null" + ' = ' + JSON.stringify(info !== null));
      expect(info !== null).assertTrue();
      if (info !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
          '#8 ' + "info.isPlaying" + ' = ' + JSON.stringify(info.isPlaying));
        expect(info.isPlaying).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
          '#9 ' + "info.isPaused" + ' = ' + JSON.stringify(info.isPaused));
        expect(info.isPaused).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
          '#10 ' + "info.positionMs" + ' = ' + JSON.stringify(info.positionMs));
        expect(info.positionMs).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
          '#11 ' + "info.volume" + ' = ' + JSON.stringify(info.volume));
        expect(info.volume).assertEqual(80);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
          '#12 ' + "info.isMuted" + ' = ' + JSON.stringify(info.isMuted));
        expect(info.isMuted).assertFalse();
      }
      const last = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#13 ' + "last.operation" + ' = ' + JSON.stringify(last.operation));
      expect(last.operation).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#14 ' + "last.details" + ' = ' + JSON.stringify(last.details));
      expect(last.details).assertEqual('Playback stopped');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#15 assert ' + "expect(await manager.stop()).assertTrue()");
      expect(await manager.stop()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#16 assert ' + "expect(historyOf(manager).length).assertEqual(6)");
      expect(historyOf(manager).length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#17 assert ' + "expect(lastHistory(manager).details).assertEqual('Playback stopped')");
      expect(lastHistory(manager).details).assertEqual('Playback stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0010',
        '#18 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#2 assert ' + "expect(await manager.skipForward()).assertTrue()");
      expect(await manager.skipForward()).assertTrue();
      const afterForward = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#3 ' + "afterForward !== null" + ' = ' + JSON.stringify(afterForward !== null));
      expect(afterForward !== null).assertTrue();
      if (afterForward !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#4 ' + "afterForward.trackIndex" + ' = ' + JSON.stringify(afterForward.trackIndex));
        expect(afterForward.trackIndex).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#5 ' + "afterForward.totalTracks" + ' = ' + JSON.stringify(afterForward.totalTracks));
        expect(afterForward.totalTracks).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#6 ' + "afterForward.positionMs" + ' = ' + JSON.stringify(afterForward.positionMs));
        expect(afterForward.positionMs).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#7 ' + "afterForward.isPlaying" + ' = ' + JSON.stringify(afterForward.isPlaying));
        expect(afterForward.isPlaying).assertTrue();
      }
      const forwardEntry = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#8 ' + "forwardEntry.operation" + ' = ' + JSON.stringify(forwardEntry.operation));
      expect(forwardEntry.operation).assertEqual('skipForward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#9 ' + "forwardEntry.success" + ' = ' + JSON.stringify(forwardEntry.success));
      expect(forwardEntry.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#10 ' + "forwardEntry.details" + ' = ' + JSON.stringify(forwardEntry.details));
      expect(forwardEntry.details).assertEqual('Skipped to next track');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#11 assert ' + "expect(await manager.skipBackward()).assertTrue()");
      expect(await manager.skipBackward()).assertTrue();
      const afterBackward = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#12 ' + "afterBackward !== null" + ' = ' + JSON.stringify(afterBackward !== null));
      expect(afterBackward !== null).assertTrue();
      if (afterBackward !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#13 ' + "afterBackward.trackIndex" + ' = ' + JSON.stringify(afterBackward.trackIndex));
        expect(afterBackward.trackIndex).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
          '#14 ' + "afterBackward.isPlaying" + ' = ' + JSON.stringify(afterBackward.isPlaying));
        expect(afterBackward.isPlaying).assertTrue();
      }
      const backwardEntry = lastHistory(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#15 ' + "backwardEntry.operation" + ' = ' + JSON.stringify(backwardEntry.operation));
      expect(backwardEntry.operation).assertEqual('skipBackward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#16 ' + "backwardEntry.details" + ' = ' + JSON.stringify(backwardEntry.details));
      expect(backwardEntry.details).assertEqual('Skipped to previous track');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#17 assert ' + "expect(manager.getModel().playbackPosition).assertEqual(0)");
      expect(manager.getModel().playbackPosition).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#18 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0011',
        '#19 assert ' + "expect(historyOf(manager).length).assertEqual(5)");
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0012', 'begin');
      const manager = await readyManager();
      const volumes: number[] = [-20, 150, 33.6, 0, 100, 55.5];
      const expected: number[] = [0, 100, 34, 0, 100, 56];
      for (let i = 0; i < volumes.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#1 assert ' + "expect(await manager.setVolume(volumes[i])).assertTrue()");
        expect(await manager.setVolume(volumes[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#2 assert ' + "expect(manager.getModel().volume).assertEqual(expected[i])");
        expect(manager.getModel().volume).assertEqual(expected[i]);
      }
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#3 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(7);
      for (let i = 0; i < expected.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#4 ' + "history[i + 1].operation" + ' = ' + JSON.stringify(history[i + 1].operation));
        expect(history[i + 1].operation).assertEqual('setVolume');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#5 ' + "history[i + 1].success" + ' = ' + JSON.stringify(history[i + 1].success));
        expect(history[i + 1].success).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#6 ' + "history[i + 1].details" + ' = ' + JSON.stringify(history[i + 1].details));
        expect(history[i + 1].details).assertEqual(`Volume set to ${expected[i]}`);
      }
      const muted = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#7 ' + "muted !== null" + ' = ' + JSON.stringify(muted !== null));
      expect(muted !== null).assertTrue();
      if (muted !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#8 ' + "muted.volume" + ' = ' + JSON.stringify(muted.volume));
        expect(muted.volume).assertEqual(56);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#9 ' + "muted.isMuted" + ' = ' + JSON.stringify(muted.isMuted));
        expect(muted.isMuted).assertFalse();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#10 assert ' + "expect(await manager.setVolume(0)).assertTrue()");
      expect(await manager.setVolume(0)).assertTrue();
      const zeroInfo = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#11 ' + "zeroInfo !== null" + ' = ' + JSON.stringify(zeroInfo !== null));
      expect(zeroInfo !== null).assertTrue();
      if (zeroInfo !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#12 ' + "zeroInfo.volume" + ' = ' + JSON.stringify(zeroInfo.volume));
        expect(zeroInfo.volume).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
          '#13 ' + "zeroInfo.isMuted" + ' = ' + JSON.stringify(zeroInfo.isMuted));
        expect(zeroInfo.isMuted).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#14 assert ' + "expect(manager.getModel().volume).assertEqual(0)");
      expect(manager.getModel().volume).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#15 assert ' + "expect(serviceOf(manager).currentVolume).assertEqual(0)");
      expect(serviceOf(manager).currentVolume).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0012',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0013', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const modelBefore = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#2 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#3 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#4 assert ' +
        "expect(manager.getService().getConnectionState()) .assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#5 assert ' + "expect(manager.getService().isConnected()).assertFalse()");
      expect(manager.getService().isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#6 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#7 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();
      const modelAfter = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#8 ' + "modelAfter === modelBefore" + ' = ' + JSON.stringify(modelAfter === modelBefore));
      expect(modelAfter === modelBefore).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#9 ' + "modelAfter.isPlaying" + ' = ' + JSON.stringify(modelAfter.isPlaying));
      expect(modelAfter.isPlaying).assertTrue();
      const staleInfo = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#10 ' + "staleInfo !== null" + ' = ' + JSON.stringify(staleInfo !== null));
      expect(staleInfo !== null).assertTrue();
      if (staleInfo !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
          '#11 ' + "staleInfo.isPlaying" + ' = ' + JSON.stringify(staleInfo.isPlaying));
        expect(staleInfo.isPlaying).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#12 assert ' + "expect(serviceOf(manager).isPlaying).assertTrue()");
      expect(serviceOf(manager).isPlaying).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#13 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#14 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#15 assert ' + "expect(lastHistory(manager).details).assertEqual('Not connected')");
      expect(lastHistory(manager).details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#16 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#17 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#18 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#19 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0013',
        '#20 assert ' + "expect(manager.isPlaying()).assertTrue()");
      expect(manager.isPlaying()).assertTrue();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0014', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const modelBeforeDestroy = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#1 assert ' + "expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue()");
      expect(await manager.selectCodec(CODEC_ID_LDAC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#2 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#3 assert ' + "expect(historyOf(manager).length).assertEqual(4)");
      expect(historyOf(manager).length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#4 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#5 assert ' + "expect(manager.getSupportedCodecs().length).assertEqual(0)");
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#6 assert ' + "expect(manager.getActiveCodec()).assertNull()");
      expect(manager.getActiveCodec()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#7 assert ' + "expect(manager.getSupportedCodecs().length).assertEqual(0)");
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#8 assert ' + "expect(activeCodecCount(manager)).assertEqual(0)");
      expect(activeCodecCount(manager)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#9 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      const resetRecord = manager.getOperationRecords()[0];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#10 ' + "resetRecord.operationName" + ' = ' + JSON.stringify(resetRecord.operationName));
      expect(resetRecord.operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#11 ' + "resetRecord.details" + ' = ' + JSON.stringify(resetRecord.details));
      expect(resetRecord.details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#12 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(4)");
      expect(manager.getStatistics().totalOperations).assertEqual(4);
      const serviceStats = serviceOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#13 ' + "serviceStats.isInitialized" + ' = ' + JSON.stringify(serviceStats.isInitialized));
      expect(serviceStats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#14 ' + "serviceStats.supportedCodecCount" + ' = ' + JSON.stringify(serviceStats.supportedCodecCount));
      expect(serviceStats.supportedCodecCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#15 ' + "serviceStats.codecSwitchCount" + ' = ' + JSON.stringify(serviceStats.codecSwitchCount));
      expect(serviceStats.codecSwitchCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#16 ' + "serviceStats.operationHistoryCount" + ' = ' + JSON.stringify(serviceStats.operationHistoryCount));
      expect(serviceStats.operationHistoryCount).assertEqual(1);
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#17 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#18 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#19 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      const rebuilt = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#20 ' + "rebuilt === null" + ' = ' + JSON.stringify(rebuilt === null));
      expect(rebuilt === null).assertTrue();
      const rebuiltQuality = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#21 ' + "rebuiltQuality === null" + ' = ' + JSON.stringify(rebuiltQuality === null));
      expect(rebuiltQuality === null).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#22 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();
      const modelAfterDestroy = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#23 ' + "modelAfterDestroy === modelBeforeDestroy" + ' = ' +
        JSON.stringify(modelAfterDestroy === modelBeforeDestroy));
      expect(modelAfterDestroy === modelBeforeDestroy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#24 ' + "modelAfterDestroy.isPlaying" + ' = ' + JSON.stringify(modelAfterDestroy.isPlaying));
      expect(modelAfterDestroy.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#25 ' + "modelAfterDestroy.bitRate" + ' = ' + JSON.stringify(modelAfterDestroy.bitRate));
      expect(modelAfterDestroy.bitRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#26 ' + "modelAfterDestroy.volume" + ' = ' + JSON.stringify(modelAfterDestroy.volume));
      expect(modelAfterDestroy.volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#27 assert ' + "expect(serviceOf(manager).isPlaying).assertFalse()");
      expect(serviceOf(manager).isPlaying).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#28 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#29 assert ' + "expect(manager.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT)");
      expect(manager.getSupportedCodecs().length).assertEqual(EXPECTED_CODEC_COUNT);
      const revivedActive = activeCodecOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#30 ' + "revivedActive !== null" + ' = ' + JSON.stringify(revivedActive !== null));
      expect(revivedActive !== null).assertTrue();
      if (revivedActive !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#31 ' + "revivedActive.codecId" + ' = ' + JSON.stringify(revivedActive.codecId));
        expect(revivedActive.codecId).assertEqual(CODEC_ID_SBC);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#32 ' + "revivedActive.isActive" + ' = ' + JSON.stringify(revivedActive.isActive));
        expect(revivedActive.isActive).assertTrue();
      }
      const revivedPlayback = playbackOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#33 ' + "revivedPlayback !== null" + ' = ' + JSON.stringify(revivedPlayback !== null));
      expect(revivedPlayback !== null).assertTrue();
      if (revivedPlayback !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#34 ' + "revivedPlayback.isPlaying" + ' = ' + JSON.stringify(revivedPlayback.isPlaying));
        expect(revivedPlayback.isPlaying).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#35 ' + "revivedPlayback.volume" + ' = ' + JSON.stringify(revivedPlayback.volume));
        expect(revivedPlayback.volume).assertEqual(DEFAULT_VOLUME);
      }
      const revivedQuality = qualityOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#36 ' + "revivedQuality !== null" + ' = ' + JSON.stringify(revivedQuality !== null));
      expect(revivedQuality !== null).assertTrue();
      if (revivedQuality !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#37 ' + "revivedQuality.codecSwitchCount" + ' = ' + JSON.stringify(revivedQuality.codecSwitchCount));
        expect(revivedQuality.codecSwitchCount).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
          '#38 ' + "revivedQuality.effectiveBitRate" + ' = ' + JSON.stringify(revivedQuality.effectiveBitRate));
        expect(revivedQuality.effectiveBitRate).assertEqual(0);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#39 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#40 assert ' + "expect(manager.getOperationRecords()[0].operationId).assertEqual('mgr_op_1')");
      expect(manager.getOperationRecords()[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#41 assert ' + "expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize')");
      expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#42 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpCtrl0014',
        '#43 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpCtrl0014', 'end');
    });
  });
}
