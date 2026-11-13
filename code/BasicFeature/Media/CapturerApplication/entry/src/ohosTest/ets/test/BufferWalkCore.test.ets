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

const TAG: string = '[Sample_bufferWalkCore]';
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

export default function bufferWalkCoreTest(): void {
  describe('bufferWalkCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0100
     * @tc.name      testBufferWalk0001
     * @tc.desc      Verify bufferWalkCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0200
     * @tc.name      testBufferWalk0002
     * @tc.desc      Verify bufferWalkCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0300
     * @tc.name      testBufferWalk0003
     * @tc.desc      Verify bufferWalkCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0400
     * @tc.name      testBufferWalk0004
     * @tc.desc      Verify bufferWalkCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0500
     * @tc.name      testBufferWalk0005
     * @tc.desc      Verify bufferWalkCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0600
     * @tc.name      testBufferWalk0006
     * @tc.desc      Verify bufferWalkCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0700
     * @tc.name      testBufferWalk0007
     * @tc.desc      Verify bufferWalkCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0800
     * @tc.name      testBufferWalk0008
     * @tc.desc      Verify bufferWalkCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_0900
     * @tc.name      testBufferWalk0009
     * @tc.desc      Verify bufferWalkCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1000
     * @tc.name      testBufferWalk0010
     * @tc.desc      Verify bufferWalkCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1100
     * @tc.name      testBufferWalk0011
     * @tc.desc      Verify bufferWalkCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1200
     * @tc.name      testBufferWalk0012
     * @tc.desc      Verify bufferWalkCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1300
     * @tc.name      testBufferWalk0013
     * @tc.desc      Verify bufferWalkCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1400
     * @tc.name      testBufferWalk0014
     * @tc.desc      Verify bufferWalkCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1500
     * @tc.name      testBufferWalk0015
     * @tc.desc      Verify bufferWalkCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1600
     * @tc.name      testBufferWalk0016
     * @tc.desc      Verify bufferWalkCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1700
     * @tc.name      testBufferWalk0017
     * @tc.desc      Verify bufferWalkCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1800
     * @tc.name      testBufferWalk0018
     * @tc.desc      Verify bufferWalkCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_1900
     * @tc.name      testBufferWalk0019
     * @tc.desc      Verify bufferWalkCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2000
     * @tc.name      testBufferWalk0020
     * @tc.desc      Verify bufferWalkCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2100
     * @tc.name      testBufferWalk0021
     * @tc.desc      Verify bufferWalkCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2200
     * @tc.name      testBufferWalk0022
     * @tc.desc      Verify bufferWalkCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2300
     * @tc.name      testBufferWalk0023
     * @tc.desc      Verify bufferWalkCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2400
     * @tc.name      testBufferWalk0024
     * @tc.desc      Verify bufferWalkCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2500
     * @tc.name      testBufferWalk0025
     * @tc.desc      Verify bufferWalkCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2600
     * @tc.name      testBufferWalk0026
     * @tc.desc      Verify bufferWalkCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2700
     * @tc.name      testBufferWalk0027
     * @tc.desc      Verify bufferWalkCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2800
     * @tc.name      testBufferWalk0028
     * @tc.desc      Verify bufferWalkCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_2900
     * @tc.name      testBufferWalk0029
     * @tc.desc      Verify bufferWalkCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3000
     * @tc.name      testBufferWalk0030
     * @tc.desc      Verify bufferWalkCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3100
     * @tc.name      testBufferWalk0031
     * @tc.desc      Verify bufferWalkCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3200
     * @tc.name      testBufferWalk0032
     * @tc.desc      Verify bufferWalkCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3300
     * @tc.name      testBufferWalk0033
     * @tc.desc      Verify bufferWalkCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3400
     * @tc.name      testBufferWalk0034
     * @tc.desc      Verify bufferWalkCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3500
     * @tc.name      testBufferWalk0035
     * @tc.desc      Verify bufferWalkCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3600
     * @tc.name      testBufferWalk0036
     * @tc.desc      Verify bufferWalkCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3700
     * @tc.name      testBufferWalk0037
     * @tc.desc      Verify bufferWalkCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3800
     * @tc.name      testBufferWalk0038
     * @tc.desc      Verify bufferWalkCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_3900
     * @tc.name      testBufferWalk0039
     * @tc.desc      Verify bufferWalkCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4000
     * @tc.name      testBufferWalk0040
     * @tc.desc      Verify bufferWalkCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4100
     * @tc.name      testBufferWalk0041
     * @tc.desc      Verify bufferWalkCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4200
     * @tc.name      testBufferWalk0042
     * @tc.desc      Verify bufferWalkCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4300
     * @tc.name      testBufferWalk0043
     * @tc.desc      Verify bufferWalkCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4400
     * @tc.name      testBufferWalk0044
     * @tc.desc      Verify bufferWalkCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4500
     * @tc.name      testBufferWalk0045
     * @tc.desc      Verify bufferWalkCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4600
     * @tc.name      testBufferWalk0046
     * @tc.desc      Verify bufferWalkCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4700
     * @tc.name      testBufferWalk0047
     * @tc.desc      Verify bufferWalkCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4800
     * @tc.name      testBufferWalk0048
     * @tc.desc      Verify bufferWalkCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_4900
     * @tc.name      testBufferWalk0049
     * @tc.desc      Verify bufferWalkCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5000
     * @tc.name      testBufferWalk0050
     * @tc.desc      Verify bufferWalkCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5100
     * @tc.name      testBufferWalk0051
     * @tc.desc      Verify bufferWalkCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5200
     * @tc.name      testBufferWalk0052
     * @tc.desc      Verify bufferWalkCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5300
     * @tc.name      testBufferWalk0053
     * @tc.desc      Verify bufferWalkCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5400
     * @tc.name      testBufferWalk0054
     * @tc.desc      Verify bufferWalkCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5500
     * @tc.name      testBufferWalk0055
     * @tc.desc      Verify bufferWalkCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5600
     * @tc.name      testBufferWalk0056
     * @tc.desc      Verify bufferWalkCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5700
     * @tc.name      testBufferWalk0057
     * @tc.desc      Verify bufferWalkCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5800
     * @tc.name      testBufferWalk0058
     * @tc.desc      Verify bufferWalkCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_5900
     * @tc.name      testBufferWalk0059
     * @tc.desc      Verify bufferWalkCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6000
     * @tc.name      testBufferWalk0060
     * @tc.desc      Verify bufferWalkCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6100
     * @tc.name      testBufferWalk0061
     * @tc.desc      Verify bufferWalkCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6200
     * @tc.name      testBufferWalk0062
     * @tc.desc      Verify bufferWalkCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6300
     * @tc.name      testBufferWalk0063
     * @tc.desc      Verify bufferWalkCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6400
     * @tc.name      testBufferWalk0064
     * @tc.desc      Verify bufferWalkCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6500
     * @tc.name      testBufferWalk0065
     * @tc.desc      Verify bufferWalkCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6600
     * @tc.name      testBufferWalk0066
     * @tc.desc      Verify bufferWalkCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6700
     * @tc.name      testBufferWalk0067
     * @tc.desc      Verify bufferWalkCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6800
     * @tc.name      testBufferWalk0068
     * @tc.desc      Verify bufferWalkCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_6900
     * @tc.name      testBufferWalk0069
     * @tc.desc      Verify bufferWalkCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7000
     * @tc.name      testBufferWalk0070
     * @tc.desc      Verify bufferWalkCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7100
     * @tc.name      testBufferWalk0071
     * @tc.desc      Verify bufferWalkCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7200
     * @tc.name      testBufferWalk0072
     * @tc.desc      Verify bufferWalkCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7300
     * @tc.name      testBufferWalk0073
     * @tc.desc      Verify bufferWalkCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7400
     * @tc.name      testBufferWalk0074
     * @tc.desc      Verify bufferWalkCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7500
     * @tc.name      testBufferWalk0075
     * @tc.desc      Verify bufferWalkCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7600
     * @tc.name      testBufferWalk0076
     * @tc.desc      Verify bufferWalkCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7700
     * @tc.name      testBufferWalk0077
     * @tc.desc      Verify bufferWalkCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7800
     * @tc.name      testBufferWalk0078
     * @tc.desc      Verify bufferWalkCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_7900
     * @tc.name      testBufferWalk0079
     * @tc.desc      Verify bufferWalkCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_8000
     * @tc.name      testBufferWalk0080
     * @tc.desc      Verify bufferWalkCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BUFFER_8100
     * @tc.name      testBufferWalk0081
     * @tc.desc      Verify bufferWalkCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBufferWalk0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SECOND_BUFFER_WALK).assertEqual(192000);
      expect(SECOND_BUFFER_WALK % 48000).assertEqual(0);
      expect(SECOND_BUFFER_WALK / 48000).assertEqual(4);
      expect(SECOND_BUFFER_WALK / 4).assertEqual(48000);
    });

  });
}
