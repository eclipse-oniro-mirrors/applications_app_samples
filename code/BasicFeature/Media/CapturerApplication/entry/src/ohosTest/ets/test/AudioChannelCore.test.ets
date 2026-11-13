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

const TAG: string = '[Sample_audioChannelCore]';
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

export default function audioChannelCoreTest(): void {
  describe('audioChannelCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0100
     * @tc.name      testAudioChannel0001
     * @tc.desc      Verify audioChannelCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0200
     * @tc.name      testAudioChannel0002
     * @tc.desc      Verify audioChannelCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0300
     * @tc.name      testAudioChannel0003
     * @tc.desc      Verify audioChannelCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0400
     * @tc.name      testAudioChannel0004
     * @tc.desc      Verify audioChannelCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0500
     * @tc.name      testAudioChannel0005
     * @tc.desc      Verify audioChannelCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0600
     * @tc.name      testAudioChannel0006
     * @tc.desc      Verify audioChannelCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0700
     * @tc.name      testAudioChannel0007
     * @tc.desc      Verify audioChannelCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0800
     * @tc.name      testAudioChannel0008
     * @tc.desc      Verify audioChannelCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_0900
     * @tc.name      testAudioChannel0009
     * @tc.desc      Verify audioChannelCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1000
     * @tc.name      testAudioChannel0010
     * @tc.desc      Verify audioChannelCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1100
     * @tc.name      testAudioChannel0011
     * @tc.desc      Verify audioChannelCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1200
     * @tc.name      testAudioChannel0012
     * @tc.desc      Verify audioChannelCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1300
     * @tc.name      testAudioChannel0013
     * @tc.desc      Verify audioChannelCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1400
     * @tc.name      testAudioChannel0014
     * @tc.desc      Verify audioChannelCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1500
     * @tc.name      testAudioChannel0015
     * @tc.desc      Verify audioChannelCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1600
     * @tc.name      testAudioChannel0016
     * @tc.desc      Verify audioChannelCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1700
     * @tc.name      testAudioChannel0017
     * @tc.desc      Verify audioChannelCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1800
     * @tc.name      testAudioChannel0018
     * @tc.desc      Verify audioChannelCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_1900
     * @tc.name      testAudioChannel0019
     * @tc.desc      Verify audioChannelCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2000
     * @tc.name      testAudioChannel0020
     * @tc.desc      Verify audioChannelCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2100
     * @tc.name      testAudioChannel0021
     * @tc.desc      Verify audioChannelCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2200
     * @tc.name      testAudioChannel0022
     * @tc.desc      Verify audioChannelCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2300
     * @tc.name      testAudioChannel0023
     * @tc.desc      Verify audioChannelCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2400
     * @tc.name      testAudioChannel0024
     * @tc.desc      Verify audioChannelCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2500
     * @tc.name      testAudioChannel0025
     * @tc.desc      Verify audioChannelCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2600
     * @tc.name      testAudioChannel0026
     * @tc.desc      Verify audioChannelCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2700
     * @tc.name      testAudioChannel0027
     * @tc.desc      Verify audioChannelCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2800
     * @tc.name      testAudioChannel0028
     * @tc.desc      Verify audioChannelCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_2900
     * @tc.name      testAudioChannel0029
     * @tc.desc      Verify audioChannelCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3000
     * @tc.name      testAudioChannel0030
     * @tc.desc      Verify audioChannelCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3100
     * @tc.name      testAudioChannel0031
     * @tc.desc      Verify audioChannelCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3200
     * @tc.name      testAudioChannel0032
     * @tc.desc      Verify audioChannelCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3300
     * @tc.name      testAudioChannel0033
     * @tc.desc      Verify audioChannelCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3400
     * @tc.name      testAudioChannel0034
     * @tc.desc      Verify audioChannelCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3500
     * @tc.name      testAudioChannel0035
     * @tc.desc      Verify audioChannelCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3600
     * @tc.name      testAudioChannel0036
     * @tc.desc      Verify audioChannelCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3700
     * @tc.name      testAudioChannel0037
     * @tc.desc      Verify audioChannelCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3800
     * @tc.name      testAudioChannel0038
     * @tc.desc      Verify audioChannelCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_3900
     * @tc.name      testAudioChannel0039
     * @tc.desc      Verify audioChannelCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4000
     * @tc.name      testAudioChannel0040
     * @tc.desc      Verify audioChannelCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4100
     * @tc.name      testAudioChannel0041
     * @tc.desc      Verify audioChannelCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4200
     * @tc.name      testAudioChannel0042
     * @tc.desc      Verify audioChannelCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4300
     * @tc.name      testAudioChannel0043
     * @tc.desc      Verify audioChannelCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4400
     * @tc.name      testAudioChannel0044
     * @tc.desc      Verify audioChannelCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4500
     * @tc.name      testAudioChannel0045
     * @tc.desc      Verify audioChannelCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4600
     * @tc.name      testAudioChannel0046
     * @tc.desc      Verify audioChannelCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4700
     * @tc.name      testAudioChannel0047
     * @tc.desc      Verify audioChannelCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4800
     * @tc.name      testAudioChannel0048
     * @tc.desc      Verify audioChannelCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_4900
     * @tc.name      testAudioChannel0049
     * @tc.desc      Verify audioChannelCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5000
     * @tc.name      testAudioChannel0050
     * @tc.desc      Verify audioChannelCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5100
     * @tc.name      testAudioChannel0051
     * @tc.desc      Verify audioChannelCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5200
     * @tc.name      testAudioChannel0052
     * @tc.desc      Verify audioChannelCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5300
     * @tc.name      testAudioChannel0053
     * @tc.desc      Verify audioChannelCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5400
     * @tc.name      testAudioChannel0054
     * @tc.desc      Verify audioChannelCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5500
     * @tc.name      testAudioChannel0055
     * @tc.desc      Verify audioChannelCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5600
     * @tc.name      testAudioChannel0056
     * @tc.desc      Verify audioChannelCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5700
     * @tc.name      testAudioChannel0057
     * @tc.desc      Verify audioChannelCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5800
     * @tc.name      testAudioChannel0058
     * @tc.desc      Verify audioChannelCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_5900
     * @tc.name      testAudioChannel0059
     * @tc.desc      Verify audioChannelCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6000
     * @tc.name      testAudioChannel0060
     * @tc.desc      Verify audioChannelCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6100
     * @tc.name      testAudioChannel0061
     * @tc.desc      Verify audioChannelCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6200
     * @tc.name      testAudioChannel0062
     * @tc.desc      Verify audioChannelCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6300
     * @tc.name      testAudioChannel0063
     * @tc.desc      Verify audioChannelCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6400
     * @tc.name      testAudioChannel0064
     * @tc.desc      Verify audioChannelCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6500
     * @tc.name      testAudioChannel0065
     * @tc.desc      Verify audioChannelCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6600
     * @tc.name      testAudioChannel0066
     * @tc.desc      Verify audioChannelCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6700
     * @tc.name      testAudioChannel0067
     * @tc.desc      Verify audioChannelCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6800
     * @tc.name      testAudioChannel0068
     * @tc.desc      Verify audioChannelCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_6900
     * @tc.name      testAudioChannel0069
     * @tc.desc      Verify audioChannelCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7000
     * @tc.name      testAudioChannel0070
     * @tc.desc      Verify audioChannelCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7100
     * @tc.name      testAudioChannel0071
     * @tc.desc      Verify audioChannelCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7200
     * @tc.name      testAudioChannel0072
     * @tc.desc      Verify audioChannelCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7300
     * @tc.name      testAudioChannel0073
     * @tc.desc      Verify audioChannelCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7400
     * @tc.name      testAudioChannel0074
     * @tc.desc      Verify audioChannelCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7500
     * @tc.name      testAudioChannel0075
     * @tc.desc      Verify audioChannelCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7600
     * @tc.name      testAudioChannel0076
     * @tc.desc      Verify audioChannelCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7700
     * @tc.name      testAudioChannel0077
     * @tc.desc      Verify audioChannelCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7800
     * @tc.name      testAudioChannel0078
     * @tc.desc      Verify audioChannelCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_7900
     * @tc.name      testAudioChannel0079
     * @tc.desc      Verify audioChannelCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_8000
     * @tc.name      testAudioChannel0080
     * @tc.desc      Verify audioChannelCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_8100
     * @tc.name      testAudioChannel0081
     * @tc.desc      Verify audioChannelCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioChannel0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioChannel.MONO, AudioChannel.STEREO, AudioChannel.CHANNEL_3];
      const expected: number[] = [1, 2, 3];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(3);
    });

  });
}
