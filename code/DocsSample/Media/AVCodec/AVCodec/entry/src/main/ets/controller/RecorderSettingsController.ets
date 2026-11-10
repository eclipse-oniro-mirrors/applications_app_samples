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

import { RecorderSettingsDraft } from '../model/SettingsDraftModels';
import { RecorderSettingsOption } from '../components/recorder/RecorderSettingsPanel';
import { CommonConstants as Const } from '../common/CommonConstants';
import { MediaSettingsLabels } from '../model/MediaSettingsLabels';
import { LocalizedText } from '../common/LocalizedText';

export class RecorderSettingsController {
  static choose(option: RecorderSettingsOption, draft: RecorderSettingsDraft,
    show: (labels: string[], selected: number, onSelected: (index: number) => void) => void): void {
    if (option === RecorderSettingsOption.INPUT_MODE) {
      show([LocalizedText.get($r('app.string.recorder_input_direct')),
        LocalizedText.get($r('app.string.recorder_input_buffer'))], draft.inputMode,
        (index: number): void => {
          draft.inputMode = index;
          if (index === 1) {
            if (draft.codec === 0) { draft.codec = 1; }
            if (draft.resolution === 0) { draft.resolution = 1; }
            draft.frameRate = 0;
            draft.preprocMode = 0;
            draft.dropFrameRate = 0;
            draft.dualOutput = 0;
          }
        });
      return;
    }
    if (option === RecorderSettingsOption.CROP_PERCENT) {
      const percentages: number[] = [50, 75, 90, 100];
      show(['50%', '75%', '90%', '100%'], percentages.indexOf(draft.cropPercent),
        (index: number): void => { draft.cropPercent = percentages[index]; });
      return;
    }
    if (option === RecorderSettingsOption.DOWNSAMPLING_TARGET || option === RecorderSettingsOption.SECONDARY_TARGET) {
      const heights: number[] = [360, 480, 720, 1080];
      const selected: number = option === RecorderSettingsOption.DOWNSAMPLING_TARGET ?
        draft.downsamplingHeight : draft.secondaryHeight;
      show(['360P', '480P', '720P', '1080P'], heights.indexOf(selected),
        (index: number): void => {
          if (option === RecorderSettingsOption.DOWNSAMPLING_TARGET) {
            draft.downsamplingHeight = heights[index];
          } else {
            draft.secondaryHeight = heights[index];
          }
        });
      return;
    }
    if (option === RecorderSettingsOption.OUTPUT_FORMAT) {
      show(Const.OUTPUT_FORMAT, draft.outputFormat,
        (index: number): void => { draft.outputFormat = index; });
    } else if (option === RecorderSettingsOption.VIDEO_CODEC) {
      const offset: number = draft.inputMode === 1 ? 1 : 0;
      show(MediaSettingsLabels.getRecorderCodecLabels().slice(offset), draft.codec - offset,
        (index: number): void => { draft.codec = index + offset; });
    } else if (option === RecorderSettingsOption.VIDEO_RESOLUTION) {
      const offset: number = draft.inputMode === 1 ? 1 : 0;
      show(MediaSettingsLabels.getResolutionLabels().slice(offset), draft.resolution - offset,
        (index: number): void => { draft.resolution = index + offset; });
    } else if (option === RecorderSettingsOption.VIDEO_FRAME_RATE) {
      show(MediaSettingsLabels.getFrameRateLabels(), draft.frameRate,
        (index: number): void => {
          draft.frameRate = index;
          if (index === 0) {
            draft.dropFrameRate = 0;
          }
        });
    } else if (option === RecorderSettingsOption.SYNC_MODE) {
      show(MediaSettingsLabels.getSyncModeLabels(), draft.syncMode,
        (index: number): void => { draft.syncMode = index; });
    } else if (option === RecorderSettingsOption.VIDEO_BITRATE) {
      show(MediaSettingsLabels.getRecorderBitrateLabels(), draft.bitrate,
        (index: number): void => { draft.bitrate = index; });
    } else if (option === RecorderSettingsOption.BITRATE_MODE) {
      show(MediaSettingsLabels.getRecorderBitrateModeLabels(), draft.bitrateMode,
        (index: number): void => { draft.bitrateMode = index; });
    } else if (option === RecorderSettingsOption.I_FRAME_INTERVAL) {
      show(MediaSettingsLabels.getRecorderIFrameIntervalLabels(), draft.iFrameInterval,
        (index: number): void => { draft.iFrameInterval = index; });
    } else if (option === RecorderSettingsOption.AUDIO_SAMPLE_RATE) {
      show(MediaSettingsLabels.getRecorderAudioSampleRateLabels(), draft.audioSampleRate,
        (index: number): void => { draft.audioSampleRate = index; });
    } else if (option === RecorderSettingsOption.AUDIO_CHANNEL_COUNT) {
      show(MediaSettingsLabels.getRecorderAudioChannelCountLabels(),
        draft.audioChannelCount,
        (index: number): void => { draft.audioChannelCount = index; });
    } else if (option === RecorderSettingsOption.AUDIO_BITRATE) {
      show(MediaSettingsLabels.getRecorderAudioBitrateLabels(), draft.audioBitrate,
        (index: number): void => { draft.audioBitrate = index; });
    } else if (option === RecorderSettingsOption.AUDIO_CAPTURE_LATENCY) {
      show(MediaSettingsLabels.getRecorderAudioLatencyLabels(), draft.audioLatency,
        (index: number): void => { draft.audioLatency = index; });
    } else if (option === RecorderSettingsOption.VIDEO_STABILIZATION) {
      show(MediaSettingsLabels.getRecorderStabilizationLabels(), draft.stabilization,
        (index: number): void => { draft.stabilization = index; });
    } else if (option === RecorderSettingsOption.VIDEO_PREPROCESSING) {
      show(Const.VIDEO_PREPROC_MODE, draft.preprocMode,
        (index: number): void => { draft.preprocMode = index; });
    } else if (option === RecorderSettingsOption.DROP_FRAME_RATE) {
      show(Const.VIDEO_DROP_FRAME_RATE, draft.dropFrameRate,
        (index: number): void => { draft.dropFrameRate = index; });
    } else if (option === RecorderSettingsOption.DUAL_OUTPUT) {
      show(Const.DUAL_OUTPUT_MODE, draft.dualOutput,
        (index: number): void => { draft.dualOutput = index; });
    }
  }
}
