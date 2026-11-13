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

const TAG: string = '[Sample_interruptHintTypeCore]';
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

export default function interruptHintTypeCoreTest(): void {
  describe('interruptHintTypeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_HINT_0100
     * @tc.name      testInterruptHintType0001
     * @tc.desc      Verify interruptHintTypeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0200
     * @tc.name      testInterruptHintType0002
     * @tc.desc      Verify interruptHintTypeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0300
     * @tc.name      testInterruptHintType0003
     * @tc.desc      Verify interruptHintTypeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0400
     * @tc.name      testInterruptHintType0004
     * @tc.desc      Verify interruptHintTypeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0500
     * @tc.name      testInterruptHintType0005
     * @tc.desc      Verify interruptHintTypeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0600
     * @tc.name      testInterruptHintType0006
     * @tc.desc      Verify interruptHintTypeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0700
     * @tc.name      testInterruptHintType0007
     * @tc.desc      Verify interruptHintTypeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0800
     * @tc.name      testInterruptHintType0008
     * @tc.desc      Verify interruptHintTypeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_0900
     * @tc.name      testInterruptHintType0009
     * @tc.desc      Verify interruptHintTypeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1000
     * @tc.name      testInterruptHintType0010
     * @tc.desc      Verify interruptHintTypeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1100
     * @tc.name      testInterruptHintType0011
     * @tc.desc      Verify interruptHintTypeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1200
     * @tc.name      testInterruptHintType0012
     * @tc.desc      Verify interruptHintTypeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1300
     * @tc.name      testInterruptHintType0013
     * @tc.desc      Verify interruptHintTypeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1400
     * @tc.name      testInterruptHintType0014
     * @tc.desc      Verify interruptHintTypeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1500
     * @tc.name      testInterruptHintType0015
     * @tc.desc      Verify interruptHintTypeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1600
     * @tc.name      testInterruptHintType0016
     * @tc.desc      Verify interruptHintTypeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1700
     * @tc.name      testInterruptHintType0017
     * @tc.desc      Verify interruptHintTypeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1800
     * @tc.name      testInterruptHintType0018
     * @tc.desc      Verify interruptHintTypeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_1900
     * @tc.name      testInterruptHintType0019
     * @tc.desc      Verify interruptHintTypeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2000
     * @tc.name      testInterruptHintType0020
     * @tc.desc      Verify interruptHintTypeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2100
     * @tc.name      testInterruptHintType0021
     * @tc.desc      Verify interruptHintTypeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2200
     * @tc.name      testInterruptHintType0022
     * @tc.desc      Verify interruptHintTypeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2300
     * @tc.name      testInterruptHintType0023
     * @tc.desc      Verify interruptHintTypeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2400
     * @tc.name      testInterruptHintType0024
     * @tc.desc      Verify interruptHintTypeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2500
     * @tc.name      testInterruptHintType0025
     * @tc.desc      Verify interruptHintTypeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2600
     * @tc.name      testInterruptHintType0026
     * @tc.desc      Verify interruptHintTypeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2700
     * @tc.name      testInterruptHintType0027
     * @tc.desc      Verify interruptHintTypeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2800
     * @tc.name      testInterruptHintType0028
     * @tc.desc      Verify interruptHintTypeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_2900
     * @tc.name      testInterruptHintType0029
     * @tc.desc      Verify interruptHintTypeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3000
     * @tc.name      testInterruptHintType0030
     * @tc.desc      Verify interruptHintTypeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3100
     * @tc.name      testInterruptHintType0031
     * @tc.desc      Verify interruptHintTypeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3200
     * @tc.name      testInterruptHintType0032
     * @tc.desc      Verify interruptHintTypeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3300
     * @tc.name      testInterruptHintType0033
     * @tc.desc      Verify interruptHintTypeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3400
     * @tc.name      testInterruptHintType0034
     * @tc.desc      Verify interruptHintTypeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3500
     * @tc.name      testInterruptHintType0035
     * @tc.desc      Verify interruptHintTypeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3600
     * @tc.name      testInterruptHintType0036
     * @tc.desc      Verify interruptHintTypeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3700
     * @tc.name      testInterruptHintType0037
     * @tc.desc      Verify interruptHintTypeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3800
     * @tc.name      testInterruptHintType0038
     * @tc.desc      Verify interruptHintTypeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_3900
     * @tc.name      testInterruptHintType0039
     * @tc.desc      Verify interruptHintTypeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4000
     * @tc.name      testInterruptHintType0040
     * @tc.desc      Verify interruptHintTypeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4100
     * @tc.name      testInterruptHintType0041
     * @tc.desc      Verify interruptHintTypeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4200
     * @tc.name      testInterruptHintType0042
     * @tc.desc      Verify interruptHintTypeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4300
     * @tc.name      testInterruptHintType0043
     * @tc.desc      Verify interruptHintTypeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4400
     * @tc.name      testInterruptHintType0044
     * @tc.desc      Verify interruptHintTypeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4500
     * @tc.name      testInterruptHintType0045
     * @tc.desc      Verify interruptHintTypeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4600
     * @tc.name      testInterruptHintType0046
     * @tc.desc      Verify interruptHintTypeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4700
     * @tc.name      testInterruptHintType0047
     * @tc.desc      Verify interruptHintTypeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4800
     * @tc.name      testInterruptHintType0048
     * @tc.desc      Verify interruptHintTypeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_4900
     * @tc.name      testInterruptHintType0049
     * @tc.desc      Verify interruptHintTypeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5000
     * @tc.name      testInterruptHintType0050
     * @tc.desc      Verify interruptHintTypeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5100
     * @tc.name      testInterruptHintType0051
     * @tc.desc      Verify interruptHintTypeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5200
     * @tc.name      testInterruptHintType0052
     * @tc.desc      Verify interruptHintTypeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5300
     * @tc.name      testInterruptHintType0053
     * @tc.desc      Verify interruptHintTypeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5400
     * @tc.name      testInterruptHintType0054
     * @tc.desc      Verify interruptHintTypeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5500
     * @tc.name      testInterruptHintType0055
     * @tc.desc      Verify interruptHintTypeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5600
     * @tc.name      testInterruptHintType0056
     * @tc.desc      Verify interruptHintTypeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5700
     * @tc.name      testInterruptHintType0057
     * @tc.desc      Verify interruptHintTypeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5800
     * @tc.name      testInterruptHintType0058
     * @tc.desc      Verify interruptHintTypeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_5900
     * @tc.name      testInterruptHintType0059
     * @tc.desc      Verify interruptHintTypeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6000
     * @tc.name      testInterruptHintType0060
     * @tc.desc      Verify interruptHintTypeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6100
     * @tc.name      testInterruptHintType0061
     * @tc.desc      Verify interruptHintTypeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6200
     * @tc.name      testInterruptHintType0062
     * @tc.desc      Verify interruptHintTypeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6300
     * @tc.name      testInterruptHintType0063
     * @tc.desc      Verify interruptHintTypeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6400
     * @tc.name      testInterruptHintType0064
     * @tc.desc      Verify interruptHintTypeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6500
     * @tc.name      testInterruptHintType0065
     * @tc.desc      Verify interruptHintTypeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6600
     * @tc.name      testInterruptHintType0066
     * @tc.desc      Verify interruptHintTypeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6700
     * @tc.name      testInterruptHintType0067
     * @tc.desc      Verify interruptHintTypeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6800
     * @tc.name      testInterruptHintType0068
     * @tc.desc      Verify interruptHintTypeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_6900
     * @tc.name      testInterruptHintType0069
     * @tc.desc      Verify interruptHintTypeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7000
     * @tc.name      testInterruptHintType0070
     * @tc.desc      Verify interruptHintTypeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7100
     * @tc.name      testInterruptHintType0071
     * @tc.desc      Verify interruptHintTypeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7200
     * @tc.name      testInterruptHintType0072
     * @tc.desc      Verify interruptHintTypeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7300
     * @tc.name      testInterruptHintType0073
     * @tc.desc      Verify interruptHintTypeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7400
     * @tc.name      testInterruptHintType0074
     * @tc.desc      Verify interruptHintTypeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7500
     * @tc.name      testInterruptHintType0075
     * @tc.desc      Verify interruptHintTypeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7600
     * @tc.name      testInterruptHintType0076
     * @tc.desc      Verify interruptHintTypeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7700
     * @tc.name      testInterruptHintType0077
     * @tc.desc      Verify interruptHintTypeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7800
     * @tc.name      testInterruptHintType0078
     * @tc.desc      Verify interruptHintTypeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_7900
     * @tc.name      testInterruptHintType0079
     * @tc.desc      Verify interruptHintTypeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_8000
     * @tc.name      testInterruptHintType0080
     * @tc.desc      Verify interruptHintTypeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_HINT_8100
     * @tc.name      testInterruptHintType0081
     * @tc.desc      Verify interruptHintTypeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInterruptHintType0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [InterruptHintType.INTERRUPT_HINT_NONE, InterruptHintType.INTERRUPT_HINT_RESUME,
        InterruptHintType.INTERRUPT_HINT_PAUSE, InterruptHintType.INTERRUPT_HINT_STOP,
        InterruptHintType.INTERRUPT_HINT_DUCK, InterruptHintType.INTERRUPT_HINT_UNDUCK,
        InterruptHintType.INTERRUPT_HINT_MUTE, InterruptHintType.INTERRUPT_HINT_UNMUTE];
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(8);
    });

  });
}
