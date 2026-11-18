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

import { AudioSamplingRate, AudioChannel, AudioSourceType, AudioSampleFormat } from './AudioConstants'

export const SAMPLING_RATE_KEY_MAP: Record<string, AudioSamplingRate> = {
  'SR_8000': AudioSamplingRate.SAMPLE_RATE_8000,
  'SR_11025': AudioSamplingRate.SAMPLE_RATE_11025,
  'SR_16000': AudioSamplingRate.SAMPLE_RATE_16000,
  'SR_22050': AudioSamplingRate.SAMPLE_RATE_22050,
  'SR_24000': AudioSamplingRate.SAMPLE_RATE_24000,
  'SR_32000': AudioSamplingRate.SAMPLE_RATE_32000,
  'SR_44100': AudioSamplingRate.SAMPLE_RATE_44100,
  'SR_48000': AudioSamplingRate.SAMPLE_RATE_48000,
  'SR_96000': AudioSamplingRate.SAMPLE_RATE_96000
};

export const SAMPLING_RATE_OPTIONS: SelectOption[] = [
  { value: 'SR_8000' },
  { value: 'SR_11025' },
  { value: 'SR_16000' },
  { value: 'SR_22050' },
  { value: 'SR_24000' },
  { value: 'SR_32000' },
  { value: 'SR_44100' },
  { value: 'SR_48000' },
  { value: 'SR_96000' }
];

export const CHANNEL_OPTIONS: SelectOption[] = [
  { value: 'MONO' },
  { value: 'STEREO' }
];

export const CHANNEL_KEY_MAP: Record<string, AudioChannel> = {
  'MONO': AudioChannel.MONO,
  'STEREO': AudioChannel.STEREO
};

export const SOURCE_TYPE_KEY_MAP: Record<string, AudioSourceType> = {
  'MIC': AudioSourceType.MIC,
  'VOICE_RECOGNITION': AudioSourceType.VOICE_RECOGNITION,
  'PLAYBACK_CAPTURE': AudioSourceType.PLAYBACK_CAPTURE,
  'VOICE_COMMUNICATION': AudioSourceType.VOICE_COMMUNICATION,
  'VOICE_MESSAGE': AudioSourceType.VOICE_MESSAGE,
  'TYPE_CAMCORDER': AudioSourceType.TYPE_CAMCORDER,
  'UNPROCESSED': AudioSourceType.UNPROCESSED,
  'LIVE': AudioSourceType.LIVE
};

export const SOURCE_TYPE_OPTIONS: SelectOption[] = [
  { value: 'MIC' },
  { value: 'VOICE_RECOGNITION' },
  { value: 'PLAYBACK_CAPTURE' },
  { value: 'VOICE_COMMUNICATION' },
  { value: 'VOICE_MESSAGE' },
  { value: 'TYPE_CAMCORDER' },
  { value: 'UNPROCESSED' },
  { value: 'LIVE' }
];

export const SAMPLE_FORMAT_KEY_MAP: Record<string, AudioSampleFormat> = {
  'U8': AudioSampleFormat.U8,
  'S16LE': AudioSampleFormat.S16LE,
  'S24LE': AudioSampleFormat.S24LE,
  'S32LE': AudioSampleFormat.S32LE,
  'F32LE': AudioSampleFormat.F32LE,
};

export const SAMPLE_FORMAT_OPTIONS: SelectOption[] = [
  { value: 'U8' },
  { value: 'S16LE' },
  { value: 'S24LE' },
  { value: 'S32LE' },
  { value: 'F32LE' }
];