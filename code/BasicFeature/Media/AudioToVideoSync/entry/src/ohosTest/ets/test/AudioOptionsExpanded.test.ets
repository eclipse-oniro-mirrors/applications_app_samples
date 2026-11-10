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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';

export default function audioOptionsExpandedTest() {
  describe('audioOptionsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0001
     * @tc.name      testExpAudioOption0001
     * @tc.desc      Renderer options keep usage 0, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 0,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(0);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0002
     * @tc.name      testExpAudioOption0002
     * @tc.desc      Renderer options keep usage 0, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 0,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(0);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0003
     * @tc.name      testExpAudioOption0003
     * @tc.desc      Renderer options keep usage 0, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 0,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(0);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0004
     * @tc.name      testExpAudioOption0004
     * @tc.desc      Renderer options keep usage 0, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 0,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(0);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0005
     * @tc.name      testExpAudioOption0005
     * @tc.desc      Renderer options keep usage 1, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 1,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(1);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0006
     * @tc.name      testExpAudioOption0006
     * @tc.desc      Renderer options keep usage 1, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 1,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(1);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0007
     * @tc.name      testExpAudioOption0007
     * @tc.desc      Renderer options keep usage 1, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 1,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(1);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0008
     * @tc.name      testExpAudioOption0008
     * @tc.desc      Renderer options keep usage 1, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 1,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(1);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0009
     * @tc.name      testExpAudioOption0009
     * @tc.desc      Renderer options keep usage 2, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 2,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(2);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0010
     * @tc.name      testExpAudioOption0010
     * @tc.desc      Renderer options keep usage 2, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 2,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(2);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0011
     * @tc.name      testExpAudioOption0011
     * @tc.desc      Renderer options keep usage 2, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 2,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(2);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0012
     * @tc.name      testExpAudioOption0012
     * @tc.desc      Renderer options keep usage 2, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 2,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(2);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0013
     * @tc.name      testExpAudioOption0013
     * @tc.desc      Renderer options keep usage 3, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 3,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(3);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0014
     * @tc.name      testExpAudioOption0014
     * @tc.desc      Renderer options keep usage 3, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 3,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(3);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0015
     * @tc.name      testExpAudioOption0015
     * @tc.desc      Renderer options keep usage 3, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 3,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(3);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0016
     * @tc.name      testExpAudioOption0016
     * @tc.desc      Renderer options keep usage 3, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 3,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(3);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0017
     * @tc.name      testExpAudioOption0017
     * @tc.desc      Renderer options keep usage 4, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 4,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(4);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0018
     * @tc.name      testExpAudioOption0018
     * @tc.desc      Renderer options keep usage 4, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 4,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(4);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0019
     * @tc.name      testExpAudioOption0019
     * @tc.desc      Renderer options keep usage 4, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 4,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(4);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0020
     * @tc.name      testExpAudioOption0020
     * @tc.desc      Renderer options keep usage 4, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 4,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(4);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0021
     * @tc.name      testExpAudioOption0021
     * @tc.desc      Renderer options keep usage 5, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 5,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(5);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0022
     * @tc.name      testExpAudioOption0022
     * @tc.desc      Renderer options keep usage 5, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 5,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(5);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0023
     * @tc.name      testExpAudioOption0023
     * @tc.desc      Renderer options keep usage 5, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 5,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(5);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0024
     * @tc.name      testExpAudioOption0024
     * @tc.desc      Renderer options keep usage 5, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 5,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(5);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0025
     * @tc.name      testExpAudioOption0025
     * @tc.desc      Renderer options keep usage 6, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 6,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(6);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0026
     * @tc.name      testExpAudioOption0026
     * @tc.desc      Renderer options keep usage 6, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 6,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(6);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0027
     * @tc.name      testExpAudioOption0027
     * @tc.desc      Renderer options keep usage 6, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 6,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(6);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0028
     * @tc.name      testExpAudioOption0028
     * @tc.desc      Renderer options keep usage 6, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 6,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(6);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0029
     * @tc.name      testExpAudioOption0029
     * @tc.desc      Renderer options keep usage 7, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 7,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(7);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0030
     * @tc.name      testExpAudioOption0030
     * @tc.desc      Renderer options keep usage 7, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 7,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(7);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0031
     * @tc.name      testExpAudioOption0031
     * @tc.desc      Renderer options keep usage 7, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 7,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(7);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0032
     * @tc.name      testExpAudioOption0032
     * @tc.desc      Renderer options keep usage 7, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 7,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(7);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0033
     * @tc.name      testExpAudioOption0033
     * @tc.desc      Renderer options keep usage 8, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 8,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(8);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0034
     * @tc.name      testExpAudioOption0034
     * @tc.desc      Renderer options keep usage 8, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 8,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(8);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0035
     * @tc.name      testExpAudioOption0035
     * @tc.desc      Renderer options keep usage 8, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 8,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(8);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0036
     * @tc.name      testExpAudioOption0036
     * @tc.desc      Renderer options keep usage 8, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 8,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(8);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0037
     * @tc.name      testExpAudioOption0037
     * @tc.desc      Renderer options keep usage 9, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 9,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(9);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0038
     * @tc.name      testExpAudioOption0038
     * @tc.desc      Renderer options keep usage 9, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 9,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(9);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0039
     * @tc.name      testExpAudioOption0039
     * @tc.desc      Renderer options keep usage 9, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 9,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(9);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0040
     * @tc.name      testExpAudioOption0040
     * @tc.desc      Renderer options keep usage 9, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 9,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(9);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0041
     * @tc.name      testExpAudioOption0041
     * @tc.desc      Renderer options keep usage 10, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 10,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(10);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0042
     * @tc.name      testExpAudioOption0042
     * @tc.desc      Renderer options keep usage 10, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 10,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(10);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0043
     * @tc.name      testExpAudioOption0043
     * @tc.desc      Renderer options keep usage 10, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 10,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(10);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0044
     * @tc.name      testExpAudioOption0044
     * @tc.desc      Renderer options keep usage 10, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 10,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(10);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0045
     * @tc.name      testExpAudioOption0045
     * @tc.desc      Renderer options keep usage 11, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 11,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(11);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0046
     * @tc.name      testExpAudioOption0046
     * @tc.desc      Renderer options keep usage 11, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 11,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(11);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0047
     * @tc.name      testExpAudioOption0047
     * @tc.desc      Renderer options keep usage 11, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 11,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(11);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0048
     * @tc.name      testExpAudioOption0048
     * @tc.desc      Renderer options keep usage 11, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 11,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(11);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0049
     * @tc.name      testExpAudioOption0049
     * @tc.desc      Renderer options keep usage 12, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 12,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(12);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0050
     * @tc.name      testExpAudioOption0050
     * @tc.desc      Renderer options keep usage 12, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 12,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(12);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0051
     * @tc.name      testExpAudioOption0051
     * @tc.desc      Renderer options keep usage 12, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 12,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(12);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0052
     * @tc.name      testExpAudioOption0052
     * @tc.desc      Renderer options keep usage 12, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 12,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(12);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0053
     * @tc.name      testExpAudioOption0053
     * @tc.desc      Renderer options keep usage 13, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 13,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(13);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0054
     * @tc.name      testExpAudioOption0054
     * @tc.desc      Renderer options keep usage 13, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 13,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(13);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0055
     * @tc.name      testExpAudioOption0055
     * @tc.desc      Renderer options keep usage 13, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 13,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(13);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0056
     * @tc.name      testExpAudioOption0056
     * @tc.desc      Renderer options keep usage 13, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 13,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(13);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0057
     * @tc.name      testExpAudioOption0057
     * @tc.desc      Renderer options keep usage 14, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 14,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(14);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0058
     * @tc.name      testExpAudioOption0058
     * @tc.desc      Renderer options keep usage 14, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 14,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(14);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0059
     * @tc.name      testExpAudioOption0059
     * @tc.desc      Renderer options keep usage 14, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 14,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(14);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0060
     * @tc.name      testExpAudioOption0060
     * @tc.desc      Renderer options keep usage 14, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 14,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(14);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0061
     * @tc.name      testExpAudioOption0061
     * @tc.desc      Renderer options keep usage 15, rate 44100, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 15,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(15);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0062
     * @tc.name      testExpAudioOption0062
     * @tc.desc      Renderer options keep usage 15, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 15,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(44100);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(15);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0063
     * @tc.name      testExpAudioOption0063
     * @tc.desc      Renderer options keep usage 15, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 15,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(1);
      expect(options.rendererInfo.usage).assertEqual(15);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AOPT_0064
     * @tc.name      testExpAudioOption0064
     * @tc.desc      Renderer options keep usage 15, rate 48000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioOption0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: 15,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      expect(options.streamInfo.samplingRate).assertEqual(48000);
      expect(options.streamInfo.channels).assertEqual(2);
      expect(options.rendererInfo.usage).assertEqual(15);
      expect(options.rendererInfo.rendererFlags).assertEqual(0);
    })
  })
}
