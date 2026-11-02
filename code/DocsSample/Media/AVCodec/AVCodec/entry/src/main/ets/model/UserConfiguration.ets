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

import { PlayerSettingsModel } from './PlayerSettingsModel';
import { CameraDataModel } from './CameraDataModel';
import { RecorderPreprocessModel } from './RecorderPreprocessModel';
import { ConfigurationSnapshot } from './ConfigurationStore';
import { DumpPolicyModel } from './DumpPolicyModel';

export class UserConfiguration {
  static capture(player: PlayerSettingsModel, recorder: CameraDataModel): ConfigurationSnapshot {
    return {
      player: [player.videoDecoderType, player.videoDecoderRunMode, player.videoDecoderSyncMode,
        Number(player.enableVideoDump), Number(player.retainLastFrame), Number(player.enableLowLatency),
        Number(player.outputInDecodingOrder), Number(player.convertHdrVividToBt709), player.audioVolume,
        Number(player.enableAudioLowLatency), Number(player.autoHideControls)],
      recorder: [recorder.outputFormat, recorder.isHDRVivid, recorder.videoCodecMime === 'video/hevc' ? 1 : 0,
        recorder.cameraWidth, recorder.cameraHeight, recorder.frameRate, recorder.isSync, recorder.bitRate,
        recorder.bitrateMode, recorder.iFrameInterval, recorder.audioSampleRate, recorder.audioChannelCount,
        recorder.audioBitRate, recorder.audioCaptureLatencyMode, recorder.videoStabilizationMode,
        recorder.preprocMode, recorder.cropPercent, recorder.downsamplingTargetHeight, recorder.secondaryTargetHeight,
        recorder.dropToFrameRate, Number(recorder.enableDualOutput), Number(recorder.enableVideoDump),
        Number(recorder.stopOnLowSpace)],
      dump: [DumpPolicyModel.maxMiB, DumpPolicyModel.maxSeconds]
    };
  }

  static restore(snapshot: ConfigurationSnapshot, player: PlayerSettingsModel, recorder: CameraDataModel): void {
    const p = snapshot.player;
    if (p.length === 11 && UserConfiguration.integers(p) &&
      UserConfiguration.choice(p[0], [0, 1, 2]) && UserConfiguration.choice(p[1], [0, 1, 2, 3]) &&
      UserConfiguration.choice(p[2], [0, 1]) && p[8] >= 0 && p[8] <= 100 &&
      [p[3], p[4], p[5], p[6], p[7], p[9], p[10]].every((v: number): boolean => v === 0 || v === 1)) {
      player.videoDecoderType = p[0];
      player.videoDecoderRunMode = p[1];
      player.videoDecoderSyncMode = p[2];
      player.enableVideoDump = p[3] === 1 && p[1] === 1;
      player.retainLastFrame = p[4] === 1;
      player.enableLowLatency = p[5] === 1;
      player.outputInDecodingOrder = p[6] === 1;
      player.convertHdrVividToBt709 = p[7] === 1 && p[1] === 0;
      player.audioVolume = p[8];
      player.enableAudioLowLatency = p[9] === 1;
      player.autoHideControls = p[10] === 1;
    }
    const r = snapshot.recorder;
    if (UserConfiguration.validRecorder(r)) {
      recorder.outputFormat = r[0];
      recorder.setCodecFormat(r[1], r[2] === 1 ? 'video/hevc' : 'video/avc');
      recorder.setResolution(r[3], r[4], r[7]);
      recorder.frameRate = r[5];
      recorder.isSync = r[6];
      recorder.bitrateMode = r[8];
      recorder.iFrameInterval = r[9];
      recorder.audioSampleRate = r[10];
      recorder.audioChannelCount = r[11];
      recorder.audioBitRate = r[12];
      recorder.audioCaptureLatencyMode = r[13];
      recorder.videoStabilizationMode = r[14];
      recorder.preprocMode = r[15];
      recorder.cropPercent = r[16];
      recorder.downsamplingTargetHeight = r[17];
      recorder.secondaryTargetHeight = r[18];
      recorder.dropToFrameRate = r[19] < r[5] ? r[19] : 0;
      recorder.enableDualOutput = r[20] === 1;
      recorder.enableVideoDump = r[21] === 1;
      recorder.stopOnLowSpace = r.length === 23 && r[22] === 1;
      RecorderPreprocessModel.apply(recorder);
    }
    if (snapshot.dump.length === 2 &&
      UserConfiguration.choice(snapshot.dump[0], DumpPolicyModel.SIZE_OPTIONS) &&
      UserConfiguration.choice(snapshot.dump[1], DumpPolicyModel.DURATION_OPTIONS)) {
      DumpPolicyModel.maxMiB = snapshot.dump[0];
      DumpPolicyModel.maxSeconds = snapshot.dump[1];
    }
  }

  static preset(index: number): ConfigurationSnapshot {
    const player = new PlayerSettingsModel();
    const recorder = new CameraDataModel();
    if (index === 1) {
      // Buffer 检查只改变链路，不自动开启可能占用大量空间的裸帧 Dump。
      player.videoDecoderRunMode = 1;
    } else if (index === 2) {
      recorder.setResolution(1280, 720, 10000000);
      recorder.frameRate = 30;
    } else if (index === 3) {
      recorder.frameRate = 60;
      recorder.bitRate = 30000000;
    }
    const snapshot = UserConfiguration.capture(player, recorder);
    snapshot.dump = [256, 30];
    return snapshot;
  }

  private static integers(items: number[]): boolean {
    return items.every((v: number): boolean => Number.isFinite(v) && Number.isInteger(v));
  }

  private static choice(item: number, choices: number[]): boolean {
    return choices.indexOf(item) >= 0;
  }

  private static validRecorder(r: number[]): boolean {
    return (r.length === 22 || r.length === 23) && UserConfiguration.integers(r) &&
      (r.length === 22 || UserConfiguration.choice(r[22], [0, 1])) &&
      UserConfiguration.choice(r[0], [2, 14]) && UserConfiguration.choice(r[1], [0, 1]) &&
      UserConfiguration.choice(r[2], [0, 1]) && (r[1] === 0 || r[2] === 1) &&
      r[3] >= 2 && r[3] <= 8192 && r[4] >= 2 && r[4] <= 8192 && r[3] % 2 === 0 && r[4] % 2 === 0 &&
      UserConfiguration.choice(r[5], [30, 60]) && UserConfiguration.choice(r[6], [0, 1]) &&
      r[7] > 0 && r[7] <= 100000000 && UserConfiguration.choice(r[8], [0, 1]) &&
      r[9] > 0 && r[9] <= 10000 && UserConfiguration.choice(r[10], [44100, 48000]) &&
      UserConfiguration.choice(r[11], [1, 2]) && UserConfiguration.choice(r[12], [32000, 64000, 128000]) &&
      UserConfiguration.choice(r[13], [0, 1]) && UserConfiguration.choice(r[14], [0, 1]) &&
      UserConfiguration.choice(r[15], [0, 1, 2]) && UserConfiguration.choice(r[16], [50, 75, 90, 100]) &&
      UserConfiguration.choice(r[17], [360, 480, 720, 1080]) &&
      UserConfiguration.choice(r[18], [360, 480, 720, 1080]) && UserConfiguration.choice(r[19], [0, 30]) &&
      UserConfiguration.choice(r[20], [0, 1]) && UserConfiguration.choice(r[21], [0, 1]);
  }
}
