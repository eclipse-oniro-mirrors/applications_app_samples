/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest() {
  describe('NoiseReductionTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number: NoiseReduction_CreateCapturer_001
     * @tc.name: createAudioCapturer
     * @tc.desc: create audio capturer for noise reduction test
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_CreateCapturer_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        expect(capturer).assertNotNull();
        const state = capturer.state;
        expect(state === 1).assertTrue(); // STATE_PREPARED
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: NoiseReduction_SetMode_001
     * @tc.name: setNoiseReductionMode
     * @tc.desc: set noise reduction mode to FIDELITY
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_SetMode_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        capturer.setNoiseReductionMode(audio.NoiseReductionMode.FIDELITY);
        const mode = capturer.getNoiseReductionMode();
        expect(mode === audio.NoiseReductionMode.FIDELITY).assertTrue();
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: NoiseReduction_QueryMode_001
     * @tc.name: getNoiseReductionMode
     * @tc.desc: query current noise reduction mode
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_QueryMode_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        const mode = capturer.getNoiseReductionMode();
        expect(mode >= 0).assertTrue();
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: NoiseReduction_RegisterCallback_001
     * @tc.name: onNoiseReductionModeChanged
     * @tc.desc: register noise reduction mode change callback
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_RegisterCallback_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        const callback = (info: audio.NoiseReductionModeChangeInfo) => {
          expect(info).assertNotNull();
        };
        capturer.onNoiseReductionModeChanged(callback);
        capturer.offNoiseReductionModeChanged(callback);
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: NoiseReduction_UnregisterCallback_001
     * @tc.name: offNoiseReductionModeChanged
     * @tc.desc: unregister noise reduction mode change callback
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_UnregisterCallback_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        const callback = (info: audio.NoiseReductionModeChangeInfo) => {};
        capturer.onNoiseReductionModeChanged(callback);
        capturer.offNoiseReductionModeChanged(callback);
        const mode = capturer.getNoiseReductionMode();
        expect(mode >= 0).assertTrue();
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: NoiseReduction_GetSupportedModes_001
     * @tc.name: getSupportedNoiseReductionModes
     * @tc.desc: query supported noise reduction modes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('NoiseReduction_GetSupportedModes_001', 0, async (done: Function) => {
      try {
        const options: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0,
          },
        };
        const capturer = await audio.createAudioCapturer(options);
        const modes = capturer.getSupportedNoiseReductionModes();
        expect(modes.length > 0).assertTrue();
        await capturer.release();
        done();
      } catch (err) {
        const error = err as BusinessError;
        expect(false).assertTrue();
        done();
      }
    })
  })
}
