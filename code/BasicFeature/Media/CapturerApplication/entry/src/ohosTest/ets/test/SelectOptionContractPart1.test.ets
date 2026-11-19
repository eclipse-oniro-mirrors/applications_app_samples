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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SAMPLING_RATE_KEY_MAP, SAMPLING_RATE_OPTIONS, CHANNEL_KEY_MAP, CHANNEL_OPTIONS,
  SOURCE_TYPE_KEY_MAP, SOURCE_TYPE_OPTIONS, SAMPLE_FORMAT_KEY_MAP, SAMPLE_FORMAT_OPTIONS } from '../../../main/ets/common/constants/SelectConstants';
import { AudioSamplingRate, AudioChannel, AudioSourceType, AudioSampleFormat } from '../../../main/ets/common/constants/AudioConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function SelectOptionContractPart1Test(): void {
  describe('SelectOptionContractPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0100
     * @tc.name      testSamplingMap0001
     * @tc.desc      Verify sampling map key SR_8000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0001 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_8000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_8000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0200
     * @tc.name      testSamplingMap0002
     * @tc.desc      Verify sampling map key SR_11025.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0002 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_11025']).assertEqual(AudioSamplingRate.SAMPLE_RATE_11025);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0300
     * @tc.name      testSamplingMap0003
     * @tc.desc      Verify sampling map key SR_16000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0003 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_16000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_16000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0400
     * @tc.name      testSamplingMap0004
     * @tc.desc      Verify sampling map key SR_22050.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0004 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_22050']).assertEqual(AudioSamplingRate.SAMPLE_RATE_22050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0500
     * @tc.name      testSamplingMap0005
     * @tc.desc      Verify sampling map key SR_24000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0005 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_24000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_24000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0600
     * @tc.name      testSamplingMap0006
     * @tc.desc      Verify sampling map key SR_32000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0006 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_32000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_32000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0700
     * @tc.name      testSamplingMap0007
     * @tc.desc      Verify sampling map key SR_44100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0007 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_44100']).assertEqual(AudioSamplingRate.SAMPLE_RATE_44100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0800
     * @tc.name      testSamplingMap0008
     * @tc.desc      Verify sampling map key SR_48000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0008 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_48000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_48000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_0900
     * @tc.name      testSamplingMap0009
     * @tc.desc      Verify sampling map key SR_96000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0009 begin');
      expect(SAMPLING_RATE_KEY_MAP['SR_96000']).assertEqual(AudioSamplingRate.SAMPLE_RATE_96000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingMap0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1000
     * @tc.name      testChannelMap0010
     * @tc.desc      Verify channel map key MONO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelMap0010 begin');
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(AudioChannel.MONO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelMap0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1100
     * @tc.name      testChannelMap0011
     * @tc.desc      Verify channel map key STEREO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelMap0011 begin');
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(AudioChannel.STEREO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelMap0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1200
     * @tc.name      testSourceMap0012
     * @tc.desc      Verify source map key MIC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0012 begin');
      expect(SOURCE_TYPE_KEY_MAP['MIC']).assertEqual(AudioSourceType.MIC);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1300
     * @tc.name      testSourceMap0013
     * @tc.desc      Verify source map key VOICE_RECOGNITION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0013 begin');
      expect(SOURCE_TYPE_KEY_MAP['VOICE_RECOGNITION']).assertEqual(AudioSourceType.VOICE_RECOGNITION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1400
     * @tc.name      testSourceMap0014
     * @tc.desc      Verify source map key PLAYBACK_CAPTURE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0014 begin');
      expect(SOURCE_TYPE_KEY_MAP['PLAYBACK_CAPTURE']).assertEqual(AudioSourceType.PLAYBACK_CAPTURE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1500
     * @tc.name      testSourceMap0015
     * @tc.desc      Verify source map key VOICE_COMMUNICATION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0015 begin');
      expect(SOURCE_TYPE_KEY_MAP['VOICE_COMMUNICATION']).assertEqual(AudioSourceType.VOICE_COMMUNICATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1600
     * @tc.name      testSourceMap0016
     * @tc.desc      Verify source map key VOICE_MESSAGE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0016 begin');
      expect(SOURCE_TYPE_KEY_MAP['VOICE_MESSAGE']).assertEqual(AudioSourceType.VOICE_MESSAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1700
     * @tc.name      testSourceMap0017
     * @tc.desc      Verify source map key TYPE_CAMCORDER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0017 begin');
      expect(SOURCE_TYPE_KEY_MAP['TYPE_CAMCORDER']).assertEqual(AudioSourceType.TYPE_CAMCORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1800
     * @tc.name      testSourceMap0018
     * @tc.desc      Verify source map key UNPROCESSED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0018 begin');
      expect(SOURCE_TYPE_KEY_MAP['UNPROCESSED']).assertEqual(AudioSourceType.UNPROCESSED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_1900
     * @tc.name      testSourceMap0019
     * @tc.desc      Verify source map key LIVE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0019 begin');
      expect(SOURCE_TYPE_KEY_MAP['LIVE']).assertEqual(AudioSourceType.LIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceMap0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2000
     * @tc.name      testFormatMap0020
     * @tc.desc      Verify format map key U8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0020 begin');
      expect(SAMPLE_FORMAT_KEY_MAP['U8']).assertEqual(AudioSampleFormat.U8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2100
     * @tc.name      testFormatMap0021
     * @tc.desc      Verify format map key S16LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0021 begin');
      expect(SAMPLE_FORMAT_KEY_MAP['S16LE']).assertEqual(AudioSampleFormat.S16LE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2200
     * @tc.name      testFormatMap0022
     * @tc.desc      Verify format map key S24LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0022 begin');
      expect(SAMPLE_FORMAT_KEY_MAP['S24LE']).assertEqual(AudioSampleFormat.S24LE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2300
     * @tc.name      testFormatMap0023
     * @tc.desc      Verify format map key S32LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0023 begin');
      expect(SAMPLE_FORMAT_KEY_MAP['S32LE']).assertEqual(AudioSampleFormat.S32LE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2400
     * @tc.name      testFormatMap0024
     * @tc.desc      Verify format map key F32LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0024 begin');
      expect(SAMPLE_FORMAT_KEY_MAP['F32LE']).assertEqual(AudioSampleFormat.F32LE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatMap0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2500
     * @tc.name      testSamplingSize0025
     * @tc.desc      Verify sampling map size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingSize0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingSize0025 begin');
      expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingSize0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2600
     * @tc.name      testSamplingOptionsSize0026
     * @tc.desc      Verify sampling options size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingOptionsSize0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingOptionsSize0026 begin');
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingOptionsSize0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2700
     * @tc.name      testChannelSize0027
     * @tc.desc      Verify channel map size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSize0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelSize0027 begin');
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelSize0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2800
     * @tc.name      testChannelOptionsSize0028
     * @tc.desc      Verify channel options size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelOptionsSize0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelOptionsSize0028 begin');
      expect(CHANNEL_OPTIONS.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelOptionsSize0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_2900
     * @tc.name      testSourceSize0029
     * @tc.desc      Verify source map size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceSize0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceSize0029 begin');
      expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceSize0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3000
     * @tc.name      testSourceOptionsSize0030
     * @tc.desc      Verify source options size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceOptionsSize0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceOptionsSize0030 begin');
      expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceOptionsSize0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3100
     * @tc.name      testFormatSize0031
     * @tc.desc      Verify format map size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatSize0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatSize0031 begin');
      expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatSize0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3200
     * @tc.name      testFormatOptionsSize0032
     * @tc.desc      Verify format options size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatOptionsSize0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatOptionsSize0032 begin');
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatOptionsSize0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3300
     * @tc.name      testOptionCoverage0033
     * @tc.desc      Verify every sampling option resolves in the map.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionCoverage0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0033 begin');
      for (let i: number = 0; i < SAMPLING_RATE_OPTIONS.length; i++) {
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[i].value as string] !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3400
     * @tc.name      testOptionCoverage0034
     * @tc.desc      Verify every channel option resolves in the map.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionCoverage0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0034 begin');
      for (let i: number = 0; i < CHANNEL_OPTIONS.length; i++) {
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[i].value as string] !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3500
     * @tc.name      testOptionCoverage0035
     * @tc.desc      Verify every source option resolves in the map.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionCoverage0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0035 begin');
      for (let i: number = 0; i < SOURCE_TYPE_OPTIONS.length; i++) {
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[i].value as string] !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3600
     * @tc.name      testOptionCoverage0036
     * @tc.desc      Verify every format option resolves in the map.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionCoverage0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0036 begin');
      for (let i: number = 0; i < SAMPLE_FORMAT_OPTIONS.length; i++) {
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[i].value as string] !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionCoverage0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3700
     * @tc.name      testOptionUnique0037
     * @tc.desc      Verify sampling option values are unique.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionUnique0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0037 begin');
      const seen: Set<string> = new Set<string>();
      for (let i: number = 0; i < SAMPLING_RATE_OPTIONS.length; i++) {
        seen.add(SAMPLING_RATE_OPTIONS[i].value as string);
      }
      expect(seen.size).assertEqual(SAMPLING_RATE_OPTIONS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3800
     * @tc.name      testOptionUnique0038
     * @tc.desc      Verify channel option values are unique.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionUnique0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0038 begin');
      const seen: Set<string> = new Set<string>();
      for (let i: number = 0; i < CHANNEL_OPTIONS.length; i++) {
        seen.add(CHANNEL_OPTIONS[i].value as string);
      }
      expect(seen.size).assertEqual(CHANNEL_OPTIONS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_3900
     * @tc.name      testOptionUnique0039
     * @tc.desc      Verify source option values are unique.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionUnique0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0039 begin');
      const seen: Set<string> = new Set<string>();
      for (let i: number = 0; i < SOURCE_TYPE_OPTIONS.length; i++) {
        seen.add(SOURCE_TYPE_OPTIONS[i].value as string);
      }
      expect(seen.size).assertEqual(SOURCE_TYPE_OPTIONS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_SELECTP1_4000
     * @tc.name      testOptionUnique0040
     * @tc.desc      Verify format option values are unique.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOptionUnique0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0040 begin');
      const seen: Set<string> = new Set<string>();
      for (let i: number = 0; i < SAMPLE_FORMAT_OPTIONS.length; i++) {
        seen.add(SAMPLE_FORMAT_OPTIONS[i].value as string);
      }
      expect(seen.size).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionUnique0040 end');
    })

  })
}
