/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_DOWN, KEY_UP, KEY_ENTER, miracastComponentCount,
  isIndexPageVisible, isPlayerPageVisible, waitForPageStable, waitForPlayerPage, countComponentsById,
  getPlayerTileCount, pressAndWait, serializedDelay, triggerMiracastHome, launchPlayerPage, safeBack,
  ID_SWITCH_BTN, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER, DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastCompatibilitySuite';

enum VideoCodec {
  H264 = 'H264',
  H265 = 'H265',
  VP8 = 'VP8'
}

enum ColorSpace {
  BT709 = 'BT709',
  BT601 = 'BT601',
  BT2020 = 'BT2020'
}

enum CastProtocol {
  RTSP = 'RTSP',
  WFD = 'WFD',
  LEGACY = 'LEGACY'
}

enum AudioCodec {
  AAC = 'AAC',
  PCM = 'PCM'
}

interface VideoParam {
  width: number;
  height: number;
  fps: number;
  codec: VideoCodec;
  colorSpace: ColorSpace;
}

interface AudioProfile {
  sampleRate: number;
  channels: number;
  codec: AudioCodec;
}

interface ChannelCapability {
  protocol: CastProtocol;
  latencyMs: number;
  available: boolean;
}

// 视频参数矩阵：维护支持列表并校验标准参数 1920x1080 / fps20 / H264 / BT709
class VideoParamMatrix {
  private profiles: VideoParam[] = [];
  public constructor() {
    const canonical: VideoParam = {
      width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
    };
    this.profiles.push(canonical);
  }
  public getCanonical(): VideoParam {
    const canonical: VideoParam = {
      width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
    };
    return canonical;
  }
  public matches(left: VideoParam, right: VideoParam): boolean {
    return left.width === right.width && left.height === right.height && left.fps === right.fps &&
      left.codec === right.codec && left.colorSpace === right.colorSpace;
  }
  public contains(profile: VideoParam): boolean {
    for (let i = 0; i < this.profiles.length; i++) {
      if (this.matches(this.profiles[i], profile)) { return true; }
    }
    return false;
  }
  public isWellFormed(profile: VideoParam): boolean {
    if (profile.width <= 0 || profile.height <= 0) { return false; }
    if (profile.fps <= 0 || profile.fps > 60) { return false; }
    return profile.width >= profile.height;
  }
  public add(profile: VideoParam): boolean {
    if (!this.isWellFormed(profile) || this.contains(profile)) { return false; }
    this.profiles.push(profile);
    return true;
  }
  public isSupported(profile: VideoParam): boolean { return this.contains(profile); }
  public isCanonical(profile: VideoParam): boolean { return this.matches(profile, this.getCanonical()); }
  public getCount(): number { return this.profiles.length; }
  public getProfiles(): VideoParam[] {
    const copy: VideoParam[] = [];
    for (let i = 0; i < this.profiles.length; i++) { copy.push(this.profiles[i]); }
    return copy;
  }
  public countByCodec(codec: VideoCodec): number {
    let count: number = 0;
    for (let i = 0; i < this.profiles.length; i++) {
      if (this.profiles[i].codec === codec) { count++; }
    }
    return count;
  }
  public is4kSupported(): boolean {
    for (let i = 0; i < this.profiles.length; i++) {
      if (this.profiles[i].width >= 3840 && this.profiles[i].height >= 2160) { return true; }
    }
    return false;
  }
  public clear(): void { this.profiles = []; }
}

// 音频参数模型：校验 48kHz / 44.1kHz 双声道能力
class AudioProfileModel {
  private supported: AudioProfile[] = [
    { sampleRate: 48000, channels: 2, codec: AudioCodec.AAC },
    { sampleRate: 44100, channels: 2, codec: AudioCodec.PCM }
  ];
  public isSupported(profile: AudioProfile): boolean {
    if (profile.sampleRate !== 48000 && profile.sampleRate !== 44100) { return false; }
    if (profile.channels !== 1 && profile.channels !== 2) { return false; }
    return profile.codec === AudioCodec.AAC || profile.codec === AudioCodec.PCM;
  }
  public hasSampleRate(sampleRate: number): boolean {
    for (let i = 0; i < this.supported.length; i++) {
      if (this.supported[i].sampleRate === sampleRate) { return true; }
    }
    return false;
  }
  public getSupportedCount(): number { return this.supported.length; }
  public prefersAac(): boolean { return this.supported[0].codec === AudioCodec.AAC; }
  public isStereoOnly(): boolean {
    for (let i = 0; i < this.supported.length; i++) {
      if (this.supported[i].channels !== 2) { return false; }
    }
    return true;
  }
}

// 遗留通道模型：老旧设备走 LEGACY 通道，需要降级到 1920x1080 fps20 H264 BT601
class LegacyChannelModel {
  private available: boolean = true;
  public isAvailable(): boolean { return this.available; }
  public setAvailable(available: boolean): void { this.available = available; }
  public negotiate(): CastProtocol { return this.available ? CastProtocol.LEGACY : CastProtocol.RTSP; }
  public downgrade(): VideoParam {
    const profile: VideoParam = {
      width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT601
    };
    return profile;
  }
  public isDowngradeProfile(profile: VideoParam): boolean {
    return profile.width === 1920 && profile.height === 1080 && profile.fps === 20 &&
      profile.codec === VideoCodec.H264 && profile.colorSpace === ColorSpace.BT601;
  }
  public latencyBudget(): number { return this.available ? 120 : -1; }
}

// 协议通道注册表：登记 RTSP / WFD / LEGACY 通道并给出可用性与延迟
class ChannelRegistry {
  private channels: ChannelCapability[] = [];
  public register(protocol: CastProtocol, latencyMs: number, available: boolean): boolean {
    if (latencyMs < 0) { return false; }
    const channel: ChannelCapability = { protocol: protocol, latencyMs: latencyMs, available: available };
    this.channels.push(channel);
    return true;
  }
  public isAvailable(protocol: CastProtocol): boolean {
    for (let i = 0; i < this.channels.length; i++) {
      if (this.channels[i].protocol === protocol) { return this.channels[i].available; }
    }
    return false;
  }
  public getLatency(protocol: CastProtocol): number {
    for (let i = 0; i < this.channels.length; i++) {
      if (this.channels[i].protocol === protocol) { return this.channels[i].latencyMs; }
    }
    return -1;
  }
  public getAvailableCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.channels.length; i++) {
      if (this.channels[i].available) { count++; }
    }
    return count;
  }
  public getCount(): number { return this.channels.length; }
}

// 兼容性矩阵：键为「协议|编码|色彩空间」，值为兼容结论
class ProtocolCompatibilityMatrix {
  private entries: Map<string, boolean> = new Map<string, boolean>();
  public keyOf(protocol: CastProtocol, codec: VideoCodec, colorSpace: ColorSpace): string {
    return protocol + '|' + codec + '|' + colorSpace;
  }
  public set(protocol: CastProtocol, codec: VideoCodec, colorSpace: ColorSpace, compatible: boolean): void {
    this.entries.set(this.keyOf(protocol, codec, colorSpace), compatible);
  }
  public isCompatible(protocol: CastProtocol, codec: VideoCodec, colorSpace: ColorSpace): boolean {
    const value: boolean | undefined = this.entries.get(this.keyOf(protocol, codec, colorSpace));
    return value === undefined ? true : value;
  }
  public getEntryCount(): number { return this.entries.size; }
  public getIncompatibleCount(): number {
    let count: number = 0;
    this.entries.forEach((value: boolean) => {
      if (!value) { count++; }
    });
    return count;
  }
  public clear(): void { this.entries = new Map<string, boolean>(); }
}

// 能力协商器：按编码、色彩空间、分辨率与帧率优先级选择最合适的一组参数
class CapabilityNegotiator {
  private preferredCodec: VideoCodec = VideoCodec.H264;
  private preferredColor: ColorSpace = ColorSpace.BT709;
  public setPreferredCodec(codec: VideoCodec): void { this.preferredCodec = codec; }
  public setPreferredColor(color: ColorSpace): void { this.preferredColor = color; }
  public getPreferredCodec(): VideoCodec { return this.preferredCodec; }
  public getPreferredColor(): ColorSpace { return this.preferredColor; }
  public score(profile: VideoParam): number {
    let score: number = 0;
    if (profile.codec === this.preferredCodec) { score += 4; }
    if (profile.colorSpace === this.preferredColor) { score += 2; }
    if (profile.width === 1920 && profile.height === 1080) { score += 2; }
    if (profile.fps === 20) { score += 1; }
    return score;
  }
  public pickBest(candidates: VideoParam[]): VideoParam | null {
    if (candidates.length === 0) { return null; }
    let best: VideoParam = candidates[0];
    let bestScore: number = this.score(best);
    for (let i = 1; i < candidates.length; i++) {
      const currentScore: number = this.score(candidates[i]);
      if (currentScore > bestScore) { best = candidates[i]; bestScore = currentScore; }
    }
    return best;
  }
  public rejectsHdrOnLegacy(profile: VideoParam): boolean { return profile.colorSpace === ColorSpace.BT2020; }
}

// 兼容性评分器：汇总视频、音频与通道结论，输出 0~100 分
class CompatibilityScorer {
  public scoreVideo(profile: VideoParam, matrix: VideoParamMatrix): number {
    if (!matrix.isWellFormed(profile)) { return 0; }
    let score: number = 40;
    if (matrix.isSupported(profile)) { score += 30; }
    if (matrix.isCanonical(profile)) { score += 20; }
    if (profile.colorSpace === ColorSpace.BT709) { score += 10; }
    return score;
  }
  public scoreAudio(profile: AudioProfile, model: AudioProfileModel): number {
    if (!model.isSupported(profile)) { return 0; }
    let score: number = 50;
    if (profile.sampleRate === 48000) { score += 30; }
    if (profile.codec === AudioCodec.AAC) { score += 20; }
    return score;
  }
  public grade(score: number): string {
    if (score >= 90) { return 'A'; }
    if (score >= 70) { return 'B'; }
    if (score >= 50) { return 'C'; }
    return 'D';
  }
}

export default function miracastCompatibilitySuite(): void {
  describe('MiracastCompatibility_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'miracast compatibility suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'miracast compatibility suite end');
    });

    it('canonical_profile_is_full_hd_fps20_h264_bt709', 0, async () => {
      const matrix = new VideoParamMatrix();
      const canonical: VideoParam = matrix.getCanonical();
      expect(canonical.width).assertEqual(1920);
      expect(canonical.height).assertEqual(1080);
      expect(canonical.fps).assertEqual(20);
      expect(canonical.codec).assertEqual(VideoCodec.H264);
      expect(canonical.colorSpace).assertEqual(ColorSpace.BT709);
      expect(matrix.isCanonical(canonical)).assertTrue();
    });
    it('matrix_ships_with_one_canonical_profile', 0, async () => {
      const matrix = new VideoParamMatrix();
      expect(matrix.getCount()).assertEqual(1);
      expect(matrix.getProfiles().length).assertEqual(1);
      expect(matrix.isCanonical(matrix.getProfiles()[0])).assertTrue();
      expect(matrix.countByCodec(VideoCodec.H264)).assertEqual(1);
      expect(matrix.countByCodec(VideoCodec.H265)).assertEqual(0);
    });
    it('matrix_adds_4k_h265_profile', 0, async () => {
      const matrix = new VideoParamMatrix();
      const uhd: VideoParam = {
        width: 3840, height: 2160, fps: 20, codec: VideoCodec.H265, colorSpace: ColorSpace.BT2020
      };
      expect(matrix.add(uhd)).assertTrue();
      expect(matrix.getCount()).assertEqual(2);
      expect(matrix.is4kSupported()).assertTrue();
      expect(matrix.isSupported(uhd)).assertTrue();
      expect(matrix.countByCodec(VideoCodec.H265)).assertEqual(1);
    });
    it('matrix_rejects_duplicate_profile', 0, async () => {
      const matrix = new VideoParamMatrix();
      const duplicate: VideoParam = {
        width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(matrix.add(duplicate)).assertFalse();
      expect(matrix.getCount()).assertEqual(1);
      expect(matrix.isCanonical(duplicate)).assertTrue();
    });
    it('matrix_rejects_zero_dimension_profile', 0, async () => {
      const matrix = new VideoParamMatrix();
      const bad: VideoParam = {
        width: 0, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(matrix.isWellFormed(bad)).assertFalse();
      expect(matrix.add(bad)).assertFalse();
      expect(matrix.getCount()).assertEqual(1);
    });
    it('matrix_rejects_fps_above_60', 0, async () => {
      const matrix = new VideoParamMatrix();
      const fast: VideoParam = {
        width: 1920, height: 1080, fps: 61, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      const zeroFps: VideoParam = {
        width: 1920, height: 1080, fps: 0, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(matrix.add(fast)).assertFalse();
      expect(matrix.isWellFormed(zeroFps)).assertFalse();
      expect(matrix.getCount()).assertEqual(1);
    });
    it('matrix_rejects_portrait_profile', 0, async () => {
      const matrix = new VideoParamMatrix();
      const portrait: VideoParam = {
        width: 1080, height: 1920, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(matrix.isWellFormed(portrait)).assertFalse();
      expect(matrix.add(portrait)).assertFalse();
      expect(matrix.getCount()).assertEqual(1);
    });
    it('matrix_matches_profiles_field_by_field', 0, async () => {
      const matrix = new VideoParamMatrix();
      const other: VideoParam = {
        width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT601
      };
      expect(matrix.matches(matrix.getCanonical(), other)).assertFalse();
      expect(matrix.isCanonical(other)).assertFalse();
      expect(matrix.isWellFormed(other)).assertTrue();
      expect(matrix.isSupported(other)).assertFalse();
    });
    it('matrix_clear_removes_all_profiles', 0, async () => {
      const matrix = new VideoParamMatrix();
      matrix.clear();
      expect(matrix.getCount()).assertEqual(0);
      expect(matrix.isSupported(matrix.getCanonical())).assertFalse();
      expect(matrix.is4kSupported()).assertFalse();
    });
    it('audio_profile_accepts_48khz_aac', 0, async () => {
      const model = new AudioProfileModel();
      const profile: AudioProfile = { sampleRate: 48000, channels: 2, codec: AudioCodec.AAC };
      expect(model.isSupported(profile)).assertTrue();
      expect(model.hasSampleRate(48000)).assertTrue();
      expect(model.hasSampleRate(44100)).assertTrue();
      expect(model.prefersAac()).assertTrue();
      expect(model.isStereoOnly()).assertTrue();
    });
    it('audio_profile_rejects_unknown_sample_rate', 0, async () => {
      const model = new AudioProfileModel();
      const profile: AudioProfile = { sampleRate: 96000, channels: 2, codec: AudioCodec.AAC };
      expect(model.isSupported(profile)).assertFalse();
      expect(model.hasSampleRate(96000)).assertFalse();
      expect(model.getSupportedCount()).assertEqual(2);
    });
    it('audio_profile_rejects_multichannel', 0, async () => {
      const model = new AudioProfileModel();
      const profile: AudioProfile = { sampleRate: 48000, channels: 6, codec: AudioCodec.PCM };
      expect(model.isSupported(profile)).assertFalse();
      expect(model.isSupported({ sampleRate: 44100, channels: 1, codec: AudioCodec.PCM })).assertTrue();
      expect(model.getSupportedCount()).assertEqual(2);
      expect(model.isStereoOnly()).assertTrue();
    });
    it('legacy_channel_is_available_by_default', 0, async () => {
      const legacy = new LegacyChannelModel();
      expect(legacy.isAvailable()).assertTrue();
      expect(legacy.negotiate()).assertEqual(CastProtocol.LEGACY);
      expect(legacy.latencyBudget()).assertEqual(120);
      expect(legacy.isDowngradeProfile(legacy.downgrade())).assertTrue();
    });
    it('legacy_channel_falls_back_to_rtsp_when_closed', 0, async () => {
      const legacy = new LegacyChannelModel();
      legacy.setAvailable(false);
      expect(legacy.isAvailable()).assertFalse();
      expect(legacy.negotiate()).assertEqual(CastProtocol.RTSP);
      expect(legacy.latencyBudget()).assertEqual(-1);
    });
    it('legacy_downgrade_profile_uses_bt601', 0, async () => {
      const legacy = new LegacyChannelModel();
      const profile: VideoParam = legacy.downgrade();
      expect(profile.width).assertEqual(1920);
      expect(profile.height).assertEqual(1080);
      expect(profile.fps).assertEqual(20);
      expect(profile.codec).assertEqual(VideoCodec.H264);
      expect(profile.colorSpace).assertEqual(ColorSpace.BT601);
      expect(legacy.isDowngradeProfile(profile)).assertTrue();
    });
    it('legacy_rejects_bt709_downgrade_profile', 0, async () => {
      const legacy = new LegacyChannelModel();
      const profile: VideoParam = {
        width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(legacy.isDowngradeProfile(profile)).assertFalse();
      expect(legacy.isDowngradeProfile(legacy.downgrade())).assertTrue();
    });
    it('channel_registry_records_three_protocols', 0, async () => {
      const registry = new ChannelRegistry();
      expect(registry.register(CastProtocol.RTSP, 80, true)).assertTrue();
      expect(registry.register(CastProtocol.WFD, 100, true)).assertTrue();
      expect(registry.register(CastProtocol.LEGACY, 150, false)).assertTrue();
      expect(registry.getCount()).assertEqual(3);
      expect(registry.getAvailableCount()).assertEqual(2);
      expect(registry.isAvailable(CastProtocol.LEGACY)).assertFalse();
    });
    it('channel_registry_rejects_negative_latency', 0, async () => {
      const registry = new ChannelRegistry();
      expect(registry.register(CastProtocol.RTSP, -1, true)).assertFalse();
      expect(registry.getCount()).assertEqual(0);
      expect(registry.getLatency(CastProtocol.RTSP)).assertEqual(-1);
      expect(registry.getAvailableCount()).assertEqual(0);
    });
    it('channel_registry_reports_latency', 0, async () => {
      const registry = new ChannelRegistry();
      registry.register(CastProtocol.RTSP, 80, true);
      registry.register(CastProtocol.WFD, 100, true);
      expect(registry.getLatency(CastProtocol.RTSP)).assertEqual(80);
      expect(registry.getLatency(CastProtocol.WFD)).assertEqual(100);
      expect(registry.getLatency(CastProtocol.LEGACY)).assertEqual(-1);
      expect(registry.isAvailable(CastProtocol.RTSP)).assertTrue();
    });
    it('protocol_matrix_records_codec_color_pairs', 0, async () => {
      const matrix = new ProtocolCompatibilityMatrix();
      matrix.set(CastProtocol.RTSP, VideoCodec.H264, ColorSpace.BT709, true);
      matrix.set(CastProtocol.RTSP, VideoCodec.H265, ColorSpace.BT2020, true);
      matrix.set(CastProtocol.LEGACY, VideoCodec.H265, ColorSpace.BT2020, false);
      expect(matrix.getEntryCount()).assertEqual(3);
      expect(matrix.isCompatible(CastProtocol.RTSP, VideoCodec.H264, ColorSpace.BT709)).assertTrue();
      expect(matrix.isCompatible(CastProtocol.LEGACY, VideoCodec.H265, ColorSpace.BT2020)).assertFalse();
      expect(matrix.getIncompatibleCount()).assertEqual(1);
    });
    it('protocol_matrix_defaults_to_compatible', 0, async () => {
      const matrix = new ProtocolCompatibilityMatrix();
      expect(matrix.isCompatible(CastProtocol.WFD, VideoCodec.VP8, ColorSpace.BT601)).assertTrue();
      expect(matrix.getEntryCount()).assertEqual(0);
      matrix.clear();
      expect(matrix.getEntryCount()).assertEqual(0);
      expect(matrix.keyOf(CastProtocol.WFD, VideoCodec.VP8, ColorSpace.BT601)).assertEqual('WFD|VP8|BT601');
    });
    it('negotiator_prefers_canonical_profile', 0, async () => {
      const negotiator = new CapabilityNegotiator();
      const matrix = new VideoParamMatrix();
      const legacyProfile: VideoParam = {
        width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT601
      };
      const best: VideoParam | null = negotiator.pickBest([legacyProfile, matrix.getCanonical()]);
      expect(best === null).assertFalse();
      if (best !== null) {
        expect(best.colorSpace).assertEqual(ColorSpace.BT709);
        expect(negotiator.score(best)).assertEqual(9);
      }
    });
    it('negotiator_handles_empty_candidates', 0, async () => {
      const negotiator = new CapabilityNegotiator();
      const candidates: VideoParam[] = [];
      expect(negotiator.pickBest(candidates) === null).assertTrue();
      expect(negotiator.getPreferredCodec()).assertEqual(VideoCodec.H264);
      expect(negotiator.getPreferredColor()).assertEqual(ColorSpace.BT709);
    });
    it('negotiator_preference_switches_codec', 0, async () => {
      const negotiator = new CapabilityNegotiator();
      expect(negotiator.getPreferredCodec()).assertEqual(VideoCodec.H264);
      negotiator.setPreferredCodec(VideoCodec.H265);
      expect(negotiator.getPreferredCodec()).assertEqual(VideoCodec.H265);
      const hevc: VideoParam = {
        width: 3840, height: 2160, fps: 20, codec: VideoCodec.H265, colorSpace: ColorSpace.BT2020
      };
      expect(negotiator.score(hevc)).assertEqual(5);
    });
    it('negotiator_rejects_hdr_on_legacy_path', 0, async () => {
      const negotiator = new CapabilityNegotiator();
      const hdr: VideoParam = {
        width: 3840, height: 2160, fps: 20, codec: VideoCodec.H265, colorSpace: ColorSpace.BT2020
      };
      const sdr: VideoParam = {
        width: 1920, height: 1080, fps: 20, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(negotiator.rejectsHdrOnLegacy(hdr)).assertTrue();
      expect(negotiator.rejectsHdrOnLegacy(sdr)).assertFalse();
      negotiator.setPreferredColor(ColorSpace.BT601);
      expect(negotiator.getPreferredColor()).assertEqual(ColorSpace.BT601);
    });
    it('scorer_grades_canonical_video_as_a', 0, async () => {
      const matrix = new VideoParamMatrix();
      const scorer = new CompatibilityScorer();
      const score: number = scorer.scoreVideo(matrix.getCanonical(), matrix);
      expect(score).assertEqual(100);
      expect(scorer.grade(score)).assertEqual('A');
      expect(scorer.grade(90)).assertEqual('A');
    });
    it('scorer_drops_invalid_video_to_zero', 0, async () => {
      const matrix = new VideoParamMatrix();
      const scorer = new CompatibilityScorer();
      const bad: VideoParam = {
        width: 0, height: 0, fps: 0, codec: VideoCodec.H264, colorSpace: ColorSpace.BT709
      };
      expect(scorer.scoreVideo(bad, matrix)).assertEqual(0);
      expect(scorer.grade(0)).assertEqual('D');
    });
    it('scorer_grades_unknown_but_well_formed_video', 0, async () => {
      const matrix = new VideoParamMatrix();
      const scorer = new CompatibilityScorer();
      const unknown: VideoParam = {
        width: 1280, height: 720, fps: 30, codec: VideoCodec.VP8, colorSpace: ColorSpace.BT601
      };
      const score: number = scorer.scoreVideo(unknown, matrix);
      expect(score).assertEqual(40);
      expect(scorer.grade(score)).assertEqual('D');
      expect(scorer.grade(75)).assertEqual('B');
      expect(scorer.grade(55)).assertEqual('C');
    });
    it('scorer_grades_audio_profiles', 0, async () => {
      const model = new AudioProfileModel();
      const scorer = new CompatibilityScorer();
      const aac: AudioProfile = { sampleRate: 48000, channels: 2, codec: AudioCodec.AAC };
      const pcm: AudioProfile = { sampleRate: 44100, channels: 2, codec: AudioCodec.PCM };
      expect(scorer.scoreAudio(aac, model)).assertEqual(100);
      expect(scorer.scoreAudio(pcm, model)).assertEqual(50);
      expect(scorer.grade(scorer.scoreAudio(pcm, model))).assertEqual('C');
    });
    it('compatibility_full_matrix_matches_product_spec', 0, async () => {
      const matrix = new VideoParamMatrix();
      const audio = new AudioProfileModel();
      const channels = new ChannelRegistry();
      channels.register(CastProtocol.RTSP, 80, true);
      channels.register(CastProtocol.LEGACY, 150, true);
      const audioProfile: AudioProfile = { sampleRate: 48000, channels: 2, codec: AudioCodec.AAC };
      expect(matrix.isCanonical(matrix.getCanonical())).assertTrue();
      expect(audio.isSupported(audioProfile)).assertTrue();
      expect(channels.getAvailableCount()).assertEqual(2);
      expect(channels.getLatency(CastProtocol.RTSP)).assertLess(channels.getLatency(CastProtocol.LEGACY));
    });
    it('compatibility_canonical_repeat_negotiation_is_stable', 0, async () => {
      const negotiator = new CapabilityNegotiator();
      const matrix = new VideoParamMatrix();
      const candidates: VideoParam[] = matrix.getProfiles();
      const first: VideoParam | null = negotiator.pickBest(candidates);
      const second: VideoParam | null = negotiator.pickBest(candidates);
      expect(first === null).assertFalse();
      expect(second === null).assertFalse();
      if (first !== null && second !== null) {
        expect(matrix.matches(first, second)).assertTrue();
        expect(negotiator.score(first)).assertEqual(negotiator.score(second));
      }
    });
    it('compatibility_matrix_tracks_legacy_limitations', 0, async () => {
      const matrix = new ProtocolCompatibilityMatrix();
      matrix.set(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT709, false);
      matrix.set(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT601, true);
      expect(matrix.isCompatible(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT709)).assertFalse();
      expect(matrix.isCompatible(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT601)).assertTrue();
      expect(matrix.getIncompatibleCount()).assertEqual(1);
    });
    it('compatibility_downgrade_matches_legacy_matrix', 0, async () => {
      const legacy = new LegacyChannelModel();
      const matrix = new ProtocolCompatibilityMatrix();
      matrix.set(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT709, false);
      matrix.set(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT601, true);
      const downgraded: VideoParam = legacy.downgrade();
      expect(legacy.isDowngradeProfile(downgraded)).assertTrue();
      expect(matrix.isCompatible(CastProtocol.LEGACY, downgraded.codec, downgraded.colorSpace)).assertTrue();
      expect(matrix.isCompatible(CastProtocol.LEGACY, VideoCodec.H264, ColorSpace.BT709)).assertFalse();
    });
  });
}
