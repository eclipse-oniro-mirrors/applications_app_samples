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

export default function audioFormatExpandedTest() {
  describe('audioFormatExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0001
     * @tc.name      testExpAudioFormat0001
     * @tc.desc      Audio stream descriptor keeps format 1, rate 8000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 8000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(8000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0002
     * @tc.name      testExpAudioFormat0002
     * @tc.desc      Audio stream descriptor keeps format 1, rate 11025, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 11025,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(11025);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0003
     * @tc.name      testExpAudioFormat0003
     * @tc.desc      Audio stream descriptor keeps format 1, rate 12000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 12000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(12000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0004
     * @tc.name      testExpAudioFormat0004
     * @tc.desc      Audio stream descriptor keeps format 1, rate 16000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 16000,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(16000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0005
     * @tc.name      testExpAudioFormat0005
     * @tc.desc      Audio stream descriptor keeps format 1, rate 22050, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 22050,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(22050);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0006
     * @tc.name      testExpAudioFormat0006
     * @tc.desc      Audio stream descriptor keeps format 1, rate 24000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 24000,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(24000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0007
     * @tc.name      testExpAudioFormat0007
     * @tc.desc      Audio stream descriptor keeps format 1, rate 32000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 32000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(32000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0008
     * @tc.name      testExpAudioFormat0008
     * @tc.desc      Audio stream descriptor keeps format 1, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(44100);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0009
     * @tc.name      testExpAudioFormat0009
     * @tc.desc      Audio stream descriptor keeps format 1, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(48000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0010
     * @tc.name      testExpAudioFormat0010
     * @tc.desc      Audio stream descriptor keeps format 1, rate 64000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 64000,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(64000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0011
     * @tc.name      testExpAudioFormat0011
     * @tc.desc      Audio stream descriptor keeps format 1, rate 88200, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 88200,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(88200);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0012
     * @tc.name      testExpAudioFormat0012
     * @tc.desc      Audio stream descriptor keeps format 1, rate 96000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(96000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0013
     * @tc.name      testExpAudioFormat0013
     * @tc.desc      Audio stream descriptor keeps format 1, rate 176400, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 176400,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(176400);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0014
     * @tc.name      testExpAudioFormat0014
     * @tc.desc      Audio stream descriptor keeps format 1, rate 192000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 192000,
        channels: 2,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(192000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0015
     * @tc.name      testExpAudioFormat0015
     * @tc.desc      Audio stream descriptor keeps format 2, rate 8000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 8000,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(8000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0016
     * @tc.name      testExpAudioFormat0016
     * @tc.desc      Audio stream descriptor keeps format 2, rate 11025, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 11025,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(11025);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0017
     * @tc.name      testExpAudioFormat0017
     * @tc.desc      Audio stream descriptor keeps format 2, rate 12000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 12000,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(12000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0018
     * @tc.name      testExpAudioFormat0018
     * @tc.desc      Audio stream descriptor keeps format 2, rate 16000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 16000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(16000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0019
     * @tc.name      testExpAudioFormat0019
     * @tc.desc      Audio stream descriptor keeps format 2, rate 22050, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 22050,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(22050);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0020
     * @tc.name      testExpAudioFormat0020
     * @tc.desc      Audio stream descriptor keeps format 2, rate 24000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 24000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(24000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0021
     * @tc.name      testExpAudioFormat0021
     * @tc.desc      Audio stream descriptor keeps format 2, rate 32000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 32000,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(32000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0022
     * @tc.name      testExpAudioFormat0022
     * @tc.desc      Audio stream descriptor keeps format 2, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(44100);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0023
     * @tc.name      testExpAudioFormat0023
     * @tc.desc      Audio stream descriptor keeps format 2, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(48000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0024
     * @tc.name      testExpAudioFormat0024
     * @tc.desc      Audio stream descriptor keeps format 2, rate 64000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 64000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(64000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0025
     * @tc.name      testExpAudioFormat0025
     * @tc.desc      Audio stream descriptor keeps format 2, rate 88200, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 88200,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(88200);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0026
     * @tc.name      testExpAudioFormat0026
     * @tc.desc      Audio stream descriptor keeps format 2, rate 96000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(96000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0027
     * @tc.name      testExpAudioFormat0027
     * @tc.desc      Audio stream descriptor keeps format 2, rate 176400, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 176400,
        channels: 1,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(176400);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0028
     * @tc.name      testExpAudioFormat0028
     * @tc.desc      Audio stream descriptor keeps format 2, rate 192000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 192000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(192000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0029
     * @tc.name      testExpAudioFormat0029
     * @tc.desc      Audio stream descriptor keeps format 3, rate 8000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 8000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(8000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0030
     * @tc.name      testExpAudioFormat0030
     * @tc.desc      Audio stream descriptor keeps format 3, rate 11025, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 11025,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(11025);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0031
     * @tc.name      testExpAudioFormat0031
     * @tc.desc      Audio stream descriptor keeps format 3, rate 12000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 12000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(12000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0032
     * @tc.name      testExpAudioFormat0032
     * @tc.desc      Audio stream descriptor keeps format 3, rate 16000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 16000,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(16000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0033
     * @tc.name      testExpAudioFormat0033
     * @tc.desc      Audio stream descriptor keeps format 3, rate 22050, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 22050,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(22050);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0034
     * @tc.name      testExpAudioFormat0034
     * @tc.desc      Audio stream descriptor keeps format 3, rate 24000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 24000,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(24000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0035
     * @tc.name      testExpAudioFormat0035
     * @tc.desc      Audio stream descriptor keeps format 3, rate 32000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 32000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(32000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0036
     * @tc.name      testExpAudioFormat0036
     * @tc.desc      Audio stream descriptor keeps format 3, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(44100);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0037
     * @tc.name      testExpAudioFormat0037
     * @tc.desc      Audio stream descriptor keeps format 3, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(48000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0038
     * @tc.name      testExpAudioFormat0038
     * @tc.desc      Audio stream descriptor keeps format 3, rate 64000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 64000,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(64000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0039
     * @tc.name      testExpAudioFormat0039
     * @tc.desc      Audio stream descriptor keeps format 3, rate 88200, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 88200,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(88200);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0040
     * @tc.name      testExpAudioFormat0040
     * @tc.desc      Audio stream descriptor keeps format 3, rate 96000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(96000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0041
     * @tc.name      testExpAudioFormat0041
     * @tc.desc      Audio stream descriptor keeps format 3, rate 176400, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 176400,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(176400);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0042
     * @tc.name      testExpAudioFormat0042
     * @tc.desc      Audio stream descriptor keeps format 3, rate 192000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 192000,
        channels: 2,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(192000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0043
     * @tc.name      testExpAudioFormat0043
     * @tc.desc      Audio stream descriptor keeps format 4, rate 8000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 8000,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(8000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0044
     * @tc.name      testExpAudioFormat0044
     * @tc.desc      Audio stream descriptor keeps format 4, rate 11025, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 11025,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(11025);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0045
     * @tc.name      testExpAudioFormat0045
     * @tc.desc      Audio stream descriptor keeps format 4, rate 12000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 12000,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(12000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0046
     * @tc.name      testExpAudioFormat0046
     * @tc.desc      Audio stream descriptor keeps format 4, rate 16000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 16000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(16000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0047
     * @tc.name      testExpAudioFormat0047
     * @tc.desc      Audio stream descriptor keeps format 4, rate 22050, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 22050,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(22050);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0048
     * @tc.name      testExpAudioFormat0048
     * @tc.desc      Audio stream descriptor keeps format 4, rate 24000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 24000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(24000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0049
     * @tc.name      testExpAudioFormat0049
     * @tc.desc      Audio stream descriptor keeps format 4, rate 32000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 32000,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(32000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0050
     * @tc.name      testExpAudioFormat0050
     * @tc.desc      Audio stream descriptor keeps format 4, rate 44100, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(44100);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0051
     * @tc.name      testExpAudioFormat0051
     * @tc.desc      Audio stream descriptor keeps format 4, rate 48000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(48000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0052
     * @tc.name      testExpAudioFormat0052
     * @tc.desc      Audio stream descriptor keeps format 4, rate 64000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 64000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(64000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0053
     * @tc.name      testExpAudioFormat0053
     * @tc.desc      Audio stream descriptor keeps format 4, rate 88200, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 88200,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(88200);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0054
     * @tc.name      testExpAudioFormat0054
     * @tc.desc      Audio stream descriptor keeps format 4, rate 96000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(96000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0055
     * @tc.name      testExpAudioFormat0055
     * @tc.desc      Audio stream descriptor keeps format 4, rate 176400, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 176400,
        channels: 1,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(176400);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0056
     * @tc.name      testExpAudioFormat0056
     * @tc.desc      Audio stream descriptor keeps format 4, rate 192000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 192000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(192000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0057
     * @tc.name      testExpAudioFormat0057
     * @tc.desc      Audio stream descriptor keeps format 1, rate 96000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(96000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0058
     * @tc.name      testExpAudioFormat0058
     * @tc.desc      Audio stream descriptor keeps format 2, rate 97000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 97000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(97000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0059
     * @tc.name      testExpAudioFormat0059
     * @tc.desc      Audio stream descriptor keeps format 3, rate 98000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 98000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(98000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0060
     * @tc.name      testExpAudioFormat0060
     * @tc.desc      Audio stream descriptor keeps format 4, rate 99000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 99000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(99000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0061
     * @tc.name      testExpAudioFormat0061
     * @tc.desc      Audio stream descriptor keeps format 1, rate 100000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 100000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(100000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0062
     * @tc.name      testExpAudioFormat0062
     * @tc.desc      Audio stream descriptor keeps format 2, rate 101000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 101000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(101000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0063
     * @tc.name      testExpAudioFormat0063
     * @tc.desc      Audio stream descriptor keeps format 3, rate 102000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 102000,
        channels: 1,
        sampleFormat: 3,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(102000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(3);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0064
     * @tc.name      testExpAudioFormat0064
     * @tc.desc      Audio stream descriptor keeps format 4, rate 103000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 103000,
        channels: 2,
        sampleFormat: 4,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(103000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(4);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0065
     * @tc.name      testExpAudioFormat0065
     * @tc.desc      Audio stream descriptor keeps format 1, rate 104000, channel 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 104000,
        channels: 1,
        sampleFormat: 1,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(104000);
      expect(streamInfo.channels).assertEqual(1);
      expect(streamInfo.sampleFormat).assertEqual(1);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
    /**
     * @tc.number    SUB_AVS_EXP_AFMT_0066
     * @tc.name      testExpAudioFormat0066
     * @tc.desc      Audio stream descriptor keeps format 2, rate 105000, channel 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpAudioFormat0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: 105000,
        channels: 2,
        sampleFormat: 2,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      expect(streamInfo.samplingRate).assertEqual(105000);
      expect(streamInfo.channels).assertEqual(2);
      expect(streamInfo.sampleFormat).assertEqual(2);
      expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
    })
  })
}
