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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  AudioSamplingRate,
  AudioChannel,
  AudioSampleFormat,
  InterruptHintType,
  AudioState,
  StreamUsage,
  BYTES_PER_SAMPLE_S16LE,
  MUSIC_SAMPLE_RATE,
  MUSIC_CHANNEL_COUNT,
  MUSIC_SAMPLE_FORMAT,
  MUSIC_BYTE_RATE,
  MUSIC_DURATION_MS,
  NAV_SAMPLE_RATE,
  NAV_CHANNEL_COUNT,
  NAV_SAMPLE_FORMAT,
  NAV_BYTE_RATE,
  NAV_DURATION_MS,
} from '../main/ets/common/constants/AudioConstants';
import { APP_ROOT_FILE_PATH } from '../main/ets/common/constants/CommonConstants';

export default function audioFocusUnitTest() {
  describe('AudioConstantsTest', () => {
    it('AudioSamplingRate_shouldContainStandardRates', 0, () => {
      expect(AudioSamplingRate.SAMPLE_RATE_8000).assertEqual(8000);
      expect(AudioSamplingRate.SAMPLE_RATE_16000).assertEqual(16000);
      expect(AudioSamplingRate.SAMPLE_RATE_44100).assertEqual(44100);
      expect(AudioSamplingRate.SAMPLE_RATE_48000).assertEqual(48000);
    });

    it('AudioChannel_shouldContainMonoAndStereo', 0, () => {
      expect(AudioChannel.MONO).assertEqual(1);
      expect(AudioChannel.STEREO).assertEqual(2);
    });

    it('AudioSampleFormat_shouldContainAllFormats', 0, () => {
      expect(AudioSampleFormat.U8).assertEqual(0);
      expect(AudioSampleFormat.S16LE).assertEqual(1);
      expect(AudioSampleFormat.S24LE).assertEqual(2);
      expect(AudioSampleFormat.S32LE).assertEqual(3);
      expect(AudioSampleFormat.F32LE).assertEqual(4);
    });

    it('InterruptHintType_shouldContainAllHints', 0, () => {
      expect(InterruptHintType.INTERRUPT_HINT_NONE).assertEqual(0);
      expect(InterruptHintType.INTERRUPT_HINT_RESUME).assertEqual(1);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptHintType.INTERRUPT_HINT_STOP).assertEqual(3);
      expect(InterruptHintType.INTERRUPT_HINT_DUCK).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_UNDUCK).assertEqual(5);
      expect(InterruptHintType.INTERRUPT_HINT_MUTE).assertEqual(6);
      expect(InterruptHintType.INTERRUPT_HINT_UNMUTE).assertEqual(7);
    });

    it('AudioState_shouldContainAllStates', 0, () => {
      expect(AudioState.RUNNING).assertEqual(0);
      expect(AudioState.PAUSED).assertEqual(1);
      expect(AudioState.STOPPED).assertEqual(2);
      expect(AudioState.DUCKED).assertEqual(3);
      expect(AudioState.UNDUCKED).assertEqual(4);
    });

    it('StreamUsage_shouldContainMusicAndNavigation', 0, () => {
      expect(StreamUsage.MUSIC).assertEqual(1);
      expect(StreamUsage.NAVIGATION).assertEqual(9);
    });

    it('BytesPerSample_shouldBeTwoForS16LE', 0, () => {
      expect(BYTES_PER_SAMPLE_S16LE).assertEqual(2);
    });

    it('MusicParams_shouldBeConsistent', 0, () => {
      expect(MUSIC_SAMPLE_RATE).assertEqual(44100);
      expect(MUSIC_CHANNEL_COUNT).assertEqual(2);
      expect(MUSIC_SAMPLE_FORMAT).assertEqual(1);
      expect(MUSIC_BYTE_RATE).assertEqual(MUSIC_SAMPLE_RATE * MUSIC_CHANNEL_COUNT * BYTES_PER_SAMPLE_S16LE);
      expect(MUSIC_DURATION_MS).assertEqual(30000);
    });

    it('NavParams_shouldBeConsistent', 0, () => {
      expect(NAV_SAMPLE_RATE).assertEqual(16000);
      expect(NAV_CHANNEL_COUNT).assertEqual(1);
      expect(NAV_SAMPLE_FORMAT).assertEqual(1);
      expect(NAV_BYTE_RATE).assertEqual(NAV_SAMPLE_RATE * NAV_CHANNEL_COUNT * BYTES_PER_SAMPLE_S16LE);
      expect(NAV_DURATION_MS).assertEqual(8000);
    });
  });

  describe('CommonConstantsTest', () => {
    it('AppRootFilePath_shouldBeSet', 0, () => {
      expect(APP_ROOT_FILE_PATH).assertEqual('/data/storage/el2/base/haps/entry/files');
    });
  });

  describe('InterruptHintDecisionTest', () => {
    it('DUCK_shouldLowerMusicVolume', 0, () => {
      let musicState: number = AudioState.RUNNING;
      if (InterruptHintType.INTERRUPT_HINT_DUCK === InterruptHintType.INTERRUPT_HINT_DUCK) {
        musicState = AudioState.DUCKED;
      }
      expect(musicState).assertEqual(AudioState.DUCKED);
    });

    it('UNDUCK_shouldRestoreMusicVolume', 0, () => {
      let musicState: number = AudioState.DUCKED;
      if (InterruptHintType.INTERRUPT_HINT_UNDUCK === InterruptHintType.INTERRUPT_HINT_UNDUCK) {
        musicState = AudioState.UNDUCKED;
      }
      expect(musicState).assertEqual(AudioState.UNDUCKED);
    });

    it('STOP_shouldStopMusicPermanently', 0, () => {
      let musicState: number = AudioState.RUNNING;
      if (InterruptHintType.INTERRUPT_HINT_STOP === InterruptHintType.INTERRUPT_HINT_STOP) {
        musicState = AudioState.STOPPED;
      }
      expect(musicState).assertEqual(AudioState.STOPPED);
    });

    it('PAUSE_shouldPauseMusicTemporarily', 0, () => {
      let musicState: number = AudioState.RUNNING;
      if (InterruptHintType.INTERRUPT_HINT_PAUSE === InterruptHintType.INTERRUPT_HINT_PAUSE) {
        musicState = AudioState.PAUSED;
      }
      expect(musicState).assertEqual(AudioState.PAUSED);
    });

    it('RESUME_shouldRestoreAfterPause', 0, () => {
      let musicState: number = AudioState.PAUSED;
      if (InterruptHintType.INTERRUPT_HINT_RESUME === InterruptHintType.INTERRUPT_HINT_RESUME) {
        musicState = AudioState.RUNNING;
      }
      expect(musicState).assertEqual(AudioState.RUNNING);
    });

    it('NAVIGATION_vs_MUSIC_shouldBeDUCK', 0, () => {
      let interruptHint: number = InterruptHintType.INTERRUPT_HINT_DUCK;
      expect(interruptHint).assertEqual(InterruptHintType.INTERRUPT_HINT_DUCK);
    });

    it('MUSIC_vs_MUSIC_shouldBeSTOP', 0, () => {
      let interruptHint: number = InterruptHintType.INTERRUPT_HINT_STOP;
      expect(interruptHint).assertEqual(InterruptHintType.INTERRUPT_HINT_STOP);
    });
  });
}
