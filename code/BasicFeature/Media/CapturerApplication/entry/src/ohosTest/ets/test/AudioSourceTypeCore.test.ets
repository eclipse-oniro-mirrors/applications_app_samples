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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AudioSourceType, AudioSamplingRate, AudioChannel, AudioSampleFormat, InterruptHintType, AudioState, SECOND_BUFFER_WALK } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioSourceTypeCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function audioSourceTypeCoreTest(): void {
  describe('audioSourceTypeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0100
     * @tc.name      testAudioSourceType0001
     * @tc.desc      Verify audioSourceTypeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0200
     * @tc.name      testAudioSourceType0002
     * @tc.desc      Verify audioSourceTypeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0300
     * @tc.name      testAudioSourceType0003
     * @tc.desc      Verify audioSourceTypeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0400
     * @tc.name      testAudioSourceType0004
     * @tc.desc      Verify audioSourceTypeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0500
     * @tc.name      testAudioSourceType0005
     * @tc.desc      Verify audioSourceTypeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0600
     * @tc.name      testAudioSourceType0006
     * @tc.desc      Verify audioSourceTypeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0700
     * @tc.name      testAudioSourceType0007
     * @tc.desc      Verify audioSourceTypeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0800
     * @tc.name      testAudioSourceType0008
     * @tc.desc      Verify audioSourceTypeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_0900
     * @tc.name      testAudioSourceType0009
     * @tc.desc      Verify audioSourceTypeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1000
     * @tc.name      testAudioSourceType0010
     * @tc.desc      Verify audioSourceTypeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1100
     * @tc.name      testAudioSourceType0011
     * @tc.desc      Verify audioSourceTypeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1200
     * @tc.name      testAudioSourceType0012
     * @tc.desc      Verify audioSourceTypeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1300
     * @tc.name      testAudioSourceType0013
     * @tc.desc      Verify audioSourceTypeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1400
     * @tc.name      testAudioSourceType0014
     * @tc.desc      Verify audioSourceTypeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1500
     * @tc.name      testAudioSourceType0015
     * @tc.desc      Verify audioSourceTypeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1600
     * @tc.name      testAudioSourceType0016
     * @tc.desc      Verify audioSourceTypeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1700
     * @tc.name      testAudioSourceType0017
     * @tc.desc      Verify audioSourceTypeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1800
     * @tc.name      testAudioSourceType0018
     * @tc.desc      Verify audioSourceTypeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_1900
     * @tc.name      testAudioSourceType0019
     * @tc.desc      Verify audioSourceTypeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2000
     * @tc.name      testAudioSourceType0020
     * @tc.desc      Verify audioSourceTypeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2100
     * @tc.name      testAudioSourceType0021
     * @tc.desc      Verify audioSourceTypeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2200
     * @tc.name      testAudioSourceType0022
     * @tc.desc      Verify audioSourceTypeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2300
     * @tc.name      testAudioSourceType0023
     * @tc.desc      Verify audioSourceTypeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2400
     * @tc.name      testAudioSourceType0024
     * @tc.desc      Verify audioSourceTypeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2500
     * @tc.name      testAudioSourceType0025
     * @tc.desc      Verify audioSourceTypeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2600
     * @tc.name      testAudioSourceType0026
     * @tc.desc      Verify audioSourceTypeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2700
     * @tc.name      testAudioSourceType0027
     * @tc.desc      Verify audioSourceTypeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2800
     * @tc.name      testAudioSourceType0028
     * @tc.desc      Verify audioSourceTypeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_2900
     * @tc.name      testAudioSourceType0029
     * @tc.desc      Verify audioSourceTypeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3000
     * @tc.name      testAudioSourceType0030
     * @tc.desc      Verify audioSourceTypeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3100
     * @tc.name      testAudioSourceType0031
     * @tc.desc      Verify audioSourceTypeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3200
     * @tc.name      testAudioSourceType0032
     * @tc.desc      Verify audioSourceTypeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3300
     * @tc.name      testAudioSourceType0033
     * @tc.desc      Verify audioSourceTypeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3400
     * @tc.name      testAudioSourceType0034
     * @tc.desc      Verify audioSourceTypeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3500
     * @tc.name      testAudioSourceType0035
     * @tc.desc      Verify audioSourceTypeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3600
     * @tc.name      testAudioSourceType0036
     * @tc.desc      Verify audioSourceTypeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3700
     * @tc.name      testAudioSourceType0037
     * @tc.desc      Verify audioSourceTypeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3800
     * @tc.name      testAudioSourceType0038
     * @tc.desc      Verify audioSourceTypeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_3900
     * @tc.name      testAudioSourceType0039
     * @tc.desc      Verify audioSourceTypeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4000
     * @tc.name      testAudioSourceType0040
     * @tc.desc      Verify audioSourceTypeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4100
     * @tc.name      testAudioSourceType0041
     * @tc.desc      Verify audioSourceTypeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4200
     * @tc.name      testAudioSourceType0042
     * @tc.desc      Verify audioSourceTypeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4300
     * @tc.name      testAudioSourceType0043
     * @tc.desc      Verify audioSourceTypeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4400
     * @tc.name      testAudioSourceType0044
     * @tc.desc      Verify audioSourceTypeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4500
     * @tc.name      testAudioSourceType0045
     * @tc.desc      Verify audioSourceTypeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4600
     * @tc.name      testAudioSourceType0046
     * @tc.desc      Verify audioSourceTypeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4700
     * @tc.name      testAudioSourceType0047
     * @tc.desc      Verify audioSourceTypeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4800
     * @tc.name      testAudioSourceType0048
     * @tc.desc      Verify audioSourceTypeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_4900
     * @tc.name      testAudioSourceType0049
     * @tc.desc      Verify audioSourceTypeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5000
     * @tc.name      testAudioSourceType0050
     * @tc.desc      Verify audioSourceTypeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5100
     * @tc.name      testAudioSourceType0051
     * @tc.desc      Verify audioSourceTypeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5200
     * @tc.name      testAudioSourceType0052
     * @tc.desc      Verify audioSourceTypeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5300
     * @tc.name      testAudioSourceType0053
     * @tc.desc      Verify audioSourceTypeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5400
     * @tc.name      testAudioSourceType0054
     * @tc.desc      Verify audioSourceTypeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5500
     * @tc.name      testAudioSourceType0055
     * @tc.desc      Verify audioSourceTypeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5600
     * @tc.name      testAudioSourceType0056
     * @tc.desc      Verify audioSourceTypeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5700
     * @tc.name      testAudioSourceType0057
     * @tc.desc      Verify audioSourceTypeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5800
     * @tc.name      testAudioSourceType0058
     * @tc.desc      Verify audioSourceTypeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_5900
     * @tc.name      testAudioSourceType0059
     * @tc.desc      Verify audioSourceTypeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6000
     * @tc.name      testAudioSourceType0060
     * @tc.desc      Verify audioSourceTypeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6100
     * @tc.name      testAudioSourceType0061
     * @tc.desc      Verify audioSourceTypeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6200
     * @tc.name      testAudioSourceType0062
     * @tc.desc      Verify audioSourceTypeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6300
     * @tc.name      testAudioSourceType0063
     * @tc.desc      Verify audioSourceTypeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6400
     * @tc.name      testAudioSourceType0064
     * @tc.desc      Verify audioSourceTypeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6500
     * @tc.name      testAudioSourceType0065
     * @tc.desc      Verify audioSourceTypeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6600
     * @tc.name      testAudioSourceType0066
     * @tc.desc      Verify audioSourceTypeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6700
     * @tc.name      testAudioSourceType0067
     * @tc.desc      Verify audioSourceTypeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6800
     * @tc.name      testAudioSourceType0068
     * @tc.desc      Verify audioSourceTypeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_6900
     * @tc.name      testAudioSourceType0069
     * @tc.desc      Verify audioSourceTypeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7000
     * @tc.name      testAudioSourceType0070
     * @tc.desc      Verify audioSourceTypeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7100
     * @tc.name      testAudioSourceType0071
     * @tc.desc      Verify audioSourceTypeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7200
     * @tc.name      testAudioSourceType0072
     * @tc.desc      Verify audioSourceTypeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7300
     * @tc.name      testAudioSourceType0073
     * @tc.desc      Verify audioSourceTypeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7400
     * @tc.name      testAudioSourceType0074
     * @tc.desc      Verify audioSourceTypeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7500
     * @tc.name      testAudioSourceType0075
     * @tc.desc      Verify audioSourceTypeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7600
     * @tc.name      testAudioSourceType0076
     * @tc.desc      Verify audioSourceTypeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7700
     * @tc.name      testAudioSourceType0077
     * @tc.desc      Verify audioSourceTypeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7800
     * @tc.name      testAudioSourceType0078
     * @tc.desc      Verify audioSourceTypeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[5])).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_7900
     * @tc.name      testAudioSourceType0079
     * @tc.desc      Verify audioSourceTypeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[6])).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_8000
     * @tc.name      testAudioSourceType0080
     * @tc.desc      Verify audioSourceTypeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[7])).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_8100
     * @tc.name      testAudioSourceType0081
     * @tc.desc      Verify audioSourceTypeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSourceType0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const values: number[] = [AudioSourceType.MIC, AudioSourceType.VOICE_RECOGNITION,
        AudioSourceType.PLAYBACK_CAPTURE, AudioSourceType.VOICE_COMMUNICATION,
        AudioSourceType.VOICE_MESSAGE, AudioSourceType.TYPE_CAMCORDER,
        AudioSourceType.UNPROCESSED, AudioSourceType.LIVE];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

  });
}
