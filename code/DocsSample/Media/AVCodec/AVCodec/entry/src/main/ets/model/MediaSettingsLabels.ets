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

import { LocalizedText } from '../common/LocalizedText';

export class MediaSettingsLabels {
  static getDecoderTypeLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_decoder_auto')),
      LocalizedText.get($r('app.string.setting_decoder_hardware')),
      LocalizedText.get($r('app.string.setting_decoder_software'))
    ];
  }

  static getRenderModeLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_render_direct')),
      LocalizedText.get($r('app.string.setting_render_buffer')),
      LocalizedText.get($r('app.string.setting_render_opengl')),
      LocalizedText.get($r('app.string.setting_render_vulkan'))
    ];
  }

  static getSyncModeLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_mode_async')),
      LocalizedText.get($r('app.string.setting_mode_sync'))
    ];
  }

  static getRecorderCodecLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_codec_hdr_vivid')),
      LocalizedText.get($r('app.string.setting_codec_h264')),
      LocalizedText.get($r('app.string.setting_codec_h265'))
    ];
  }

  static getResolutionLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_resolution_4k')),
      LocalizedText.get($r('app.string.setting_resolution_1080p')),
      LocalizedText.get($r('app.string.setting_resolution_720p'))
    ];
  }

  static getFrameRateLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_fps_30')),
      LocalizedText.get($r('app.string.setting_fps_60'))
    ];
  }

  static getRecorderBitrateLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_bitrate_10m')),
      LocalizedText.get($r('app.string.setting_bitrate_20m')),
      LocalizedText.get($r('app.string.setting_bitrate_30m'))
    ];
  }

  static getRecorderBitrateModeLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_bitrate_mode_cbr')),
      LocalizedText.get($r('app.string.setting_bitrate_mode_vbr'))
    ];
  }

  static getRecorderIFrameIntervalLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_i_frame_interval_100ms')),
      LocalizedText.get($r('app.string.setting_i_frame_interval_1s')),
      LocalizedText.get($r('app.string.setting_i_frame_interval_2s'))
    ];
  }

  static getRecorderAudioSampleRateLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_audio_sample_rate_44100')),
      LocalizedText.get($r('app.string.setting_audio_sample_rate_48000'))
    ];
  }

  static getRecorderAudioChannelCountLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_audio_channel_mono')),
      LocalizedText.get($r('app.string.setting_audio_channel_stereo'))
    ];
  }

  static getRecorderAudioBitrateLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_audio_bitrate_32k')),
      LocalizedText.get($r('app.string.setting_audio_bitrate_64k')),
      LocalizedText.get($r('app.string.setting_audio_bitrate_128k'))
    ];
  }

  static getRecorderAudioLatencyLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_audio_latency_normal')),
      LocalizedText.get($r('app.string.setting_audio_latency_low'))
    ];
  }

  static getRecorderStabilizationLabels(): string[] {
    return [
      LocalizedText.get($r('app.string.setting_stabilization_disabled')),
      LocalizedText.get($r('app.string.setting_stabilization_auto'))
    ];
  }
}
