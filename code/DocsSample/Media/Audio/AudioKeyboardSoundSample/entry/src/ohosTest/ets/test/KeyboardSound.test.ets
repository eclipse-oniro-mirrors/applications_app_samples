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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { audio } from '@kit.AudioKit';

const TAG = '[Sample_KeyboardSound]';
const DOMAIN = 0xF811;
const BUNDLE = 'KeyboardSound_';

export default function keyboardSoundTest() {
  describe('KeyboardSoundTest', () => {
    /**
     * Test that AudioRenderer can be created with STREAM_USAGE_MUSIC.
     */
    it(BUNDLE + 'CreateMusicRenderer_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateMusicRenderer_001, begin');
      try {
        const renderer = await audio.createAudioRenderer({
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0,
          },
        });
        expect(renderer).assertNotNull();
        await renderer.release();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateMusicRenderer_001, end');
      } catch (err) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'CreateMusicRenderer_001, error: %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * Test that AudioRenderer can be created with STREAM_USAGE_NOTIFICATION.
     */
    it(BUNDLE + 'CreateNotificationRenderer_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateNotificationRenderer_001, begin');
      try {
        const renderer = await audio.createAudioRenderer({
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
            rendererFlags: 0,
          },
        });
        expect(renderer).assertNotNull();
        await renderer.release();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateNotificationRenderer_001, end');
      } catch (err) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'CreateNotificationRenderer_001, error: %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * Test that AudioSession can be activated with CONCURRENCY_MIX_WITH_OTHERS.
     */
    it(BUNDLE + 'ActivateMixSession_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateMixSession_001, begin');
      try {
        const audioManager = audio.getAudioManager();
        const sessionManager = audioManager.getSessionManager();
        await sessionManager.activateAudioSession({
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
        });
        const isActivated = sessionManager.isAudioSessionActivated();
        expect(isActivated).assertTrue();
        await sessionManager.deactivateAudioSession();
        hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateMixSession_001, end');
      } catch (err) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'ActivateMixSession_001, error: %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    });
  });
}
