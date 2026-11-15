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
import { AudioSourceType, AudioSamplingRate, AudioChannel, AudioSampleFormat, InterruptHintType, AudioState, SECOND_BUFFER_WALK } from '../../../main/ets/common/constants/AudioConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function AudioEnumValuesPart1Test(): void {
  describe('AudioEnumValuesPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0100
     * @tc.name      testSourceType0001
     * @tc.desc      Verify AudioSourceType.MIC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0001 begin');
      expect(AudioSourceType.MIC).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0200
     * @tc.name      testSourceType0002
     * @tc.desc      Verify AudioSourceType.VOICE_RECOGNITION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0002 begin');
      expect(AudioSourceType.VOICE_RECOGNITION).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0300
     * @tc.name      testSourceType0003
     * @tc.desc      Verify AudioSourceType.PLAYBACK_CAPTURE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0003 begin');
      expect(AudioSourceType.PLAYBACK_CAPTURE).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0400
     * @tc.name      testSourceType0004
     * @tc.desc      Verify AudioSourceType.VOICE_COMMUNICATION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0004 begin');
      expect(AudioSourceType.VOICE_COMMUNICATION).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0500
     * @tc.name      testSourceType0005
     * @tc.desc      Verify AudioSourceType.VOICE_MESSAGE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0005 begin');
      expect(AudioSourceType.VOICE_MESSAGE).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0600
     * @tc.name      testSourceType0006
     * @tc.desc      Verify AudioSourceType.TYPE_CAMCORDER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0006 begin');
      expect(AudioSourceType.TYPE_CAMCORDER).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0700
     * @tc.name      testSourceType0007
     * @tc.desc      Verify AudioSourceType.UNPROCESSED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0007 begin');
      expect(AudioSourceType.UNPROCESSED).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0800
     * @tc.name      testSourceType0008
     * @tc.desc      Verify AudioSourceType.LIVE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0008 begin');
      expect(AudioSourceType.LIVE).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSourceType0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_0900
     * @tc.name      testSamplingRate0009
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_8000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0009 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_8000).assertEqual(8000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1000
     * @tc.name      testSamplingRate0010
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_11025.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0010 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_11025).assertEqual(11025);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1100
     * @tc.name      testSamplingRate0011
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_16000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0011 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_16000).assertEqual(16000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1200
     * @tc.name      testSamplingRate0012
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_22050.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0012 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_22050).assertEqual(22050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1300
     * @tc.name      testSamplingRate0013
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_24000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0013 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_24000).assertEqual(24000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1400
     * @tc.name      testSamplingRate0014
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_32000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0014 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_32000).assertEqual(32000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1500
     * @tc.name      testSamplingRate0015
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_44100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0015 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_44100).assertEqual(44100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1600
     * @tc.name      testSamplingRate0016
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_48000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0016 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_48000).assertEqual(48000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1700
     * @tc.name      testSamplingRate0017
     * @tc.desc      Verify AudioSamplingRate.SAMPLE_RATE_96000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0017 begin');
      expect(AudioSamplingRate.SAMPLE_RATE_96000).assertEqual(96000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamplingRate0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1800
     * @tc.name      testChannel0018
     * @tc.desc      Verify AudioChannel.MONO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0018 begin');
      expect(AudioChannel.MONO).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_1900
     * @tc.name      testChannel0019
     * @tc.desc      Verify AudioChannel.STEREO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0019 begin');
      expect(AudioChannel.STEREO).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2000
     * @tc.name      testChannel0020
     * @tc.desc      Verify AudioChannel.CHANNEL_3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0020 begin');
      expect(AudioChannel.CHANNEL_3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannel0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2100
     * @tc.name      testSampleFormat0021
     * @tc.desc      Verify AudioSampleFormat.U8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0021 begin');
      expect(AudioSampleFormat.U8).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2200
     * @tc.name      testSampleFormat0022
     * @tc.desc      Verify AudioSampleFormat.S16LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0022 begin');
      expect(AudioSampleFormat.S16LE).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2300
     * @tc.name      testSampleFormat0023
     * @tc.desc      Verify AudioSampleFormat.S24LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0023 begin');
      expect(AudioSampleFormat.S24LE).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2400
     * @tc.name      testSampleFormat0024
     * @tc.desc      Verify AudioSampleFormat.S32LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0024 begin');
      expect(AudioSampleFormat.S32LE).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2500
     * @tc.name      testSampleFormat0025
     * @tc.desc      Verify AudioSampleFormat.F32LE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0025 begin');
      expect(AudioSampleFormat.F32LE).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSampleFormat0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2600
     * @tc.name      testInterruptHint0026
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_NONE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0026 begin');
      expect(InterruptHintType.INTERRUPT_HINT_NONE).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2700
     * @tc.name      testInterruptHint0027
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_RESUME.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0027 begin');
      expect(InterruptHintType.INTERRUPT_HINT_RESUME).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2800
     * @tc.name      testInterruptHint0028
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_PAUSE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0028 begin');
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_2900
     * @tc.name      testInterruptHint0029
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_STOP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0029 begin');
      expect(InterruptHintType.INTERRUPT_HINT_STOP).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3000
     * @tc.name      testInterruptHint0030
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_DUCK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0030 begin');
      expect(InterruptHintType.INTERRUPT_HINT_DUCK).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3100
     * @tc.name      testInterruptHint0031
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_UNDUCK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0031 begin');
      expect(InterruptHintType.INTERRUPT_HINT_UNDUCK).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3200
     * @tc.name      testInterruptHint0032
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_MUTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0032 begin');
      expect(InterruptHintType.INTERRUPT_HINT_MUTE).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3300
     * @tc.name      testInterruptHint0033
     * @tc.desc      Verify InterruptHintType.INTERRUPT_HINT_UNMUTE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHint0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0033 begin');
      expect(InterruptHintType.INTERRUPT_HINT_UNMUTE).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterruptHint0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3400
     * @tc.name      testAudioState0034
     * @tc.desc      Verify AudioState.RUNNING.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0034 begin');
      expect(AudioState.RUNNING).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3500
     * @tc.name      testAudioState0035
     * @tc.desc      Verify AudioState.PAUSED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0035 begin');
      expect(AudioState.PAUSED).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3600
     * @tc.name      testAudioState0036
     * @tc.desc      Verify AudioState.STOPPED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0036 begin');
      expect(AudioState.STOPPED).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3700
     * @tc.name      testAudioState0037
     * @tc.desc      Verify AudioState.MUTED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0037 begin');
      expect(AudioState.MUTED).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3800
     * @tc.name      testAudioState0038
     * @tc.desc      Verify AudioState.UNMUTED.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0038 begin');
      expect(AudioState.UNMUTED).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioState0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ENUMP1_3900
     * @tc.name      testSecondBufferWalk0039
     * @tc.desc      Verify SECOND_BUFFER_WALK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSecondBufferWalk0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSecondBufferWalk0039 begin');
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSecondBufferWalk0039 end');
    })

  })
}
