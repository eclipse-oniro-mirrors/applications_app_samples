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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const TAG: string = '[Sample_mediaToolsCountdownCore]';
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

export default function mediaToolsCountdownCoreTest(): void {
  describe('mediaToolsCountdownCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0100
     * @tc.name      testMediaToolsCountdown0001
     * @tc.desc      Verify mediaToolsCountdownCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0200
     * @tc.name      testMediaToolsCountdown0002
     * @tc.desc      Verify mediaToolsCountdownCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0300
     * @tc.name      testMediaToolsCountdown0003
     * @tc.desc      Verify mediaToolsCountdownCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0400
     * @tc.name      testMediaToolsCountdown0004
     * @tc.desc      Verify mediaToolsCountdownCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0500
     * @tc.name      testMediaToolsCountdown0005
     * @tc.desc      Verify mediaToolsCountdownCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0600
     * @tc.name      testMediaToolsCountdown0006
     * @tc.desc      Verify mediaToolsCountdownCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0700
     * @tc.name      testMediaToolsCountdown0007
     * @tc.desc      Verify mediaToolsCountdownCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0800
     * @tc.name      testMediaToolsCountdown0008
     * @tc.desc      Verify mediaToolsCountdownCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_0900
     * @tc.name      testMediaToolsCountdown0009
     * @tc.desc      Verify mediaToolsCountdownCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1000
     * @tc.name      testMediaToolsCountdown0010
     * @tc.desc      Verify mediaToolsCountdownCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1100
     * @tc.name      testMediaToolsCountdown0011
     * @tc.desc      Verify mediaToolsCountdownCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1200
     * @tc.name      testMediaToolsCountdown0012
     * @tc.desc      Verify mediaToolsCountdownCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1300
     * @tc.name      testMediaToolsCountdown0013
     * @tc.desc      Verify mediaToolsCountdownCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1400
     * @tc.name      testMediaToolsCountdown0014
     * @tc.desc      Verify mediaToolsCountdownCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1500
     * @tc.name      testMediaToolsCountdown0015
     * @tc.desc      Verify mediaToolsCountdownCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1600
     * @tc.name      testMediaToolsCountdown0016
     * @tc.desc      Verify mediaToolsCountdownCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1700
     * @tc.name      testMediaToolsCountdown0017
     * @tc.desc      Verify mediaToolsCountdownCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1800
     * @tc.name      testMediaToolsCountdown0018
     * @tc.desc      Verify mediaToolsCountdownCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_1900
     * @tc.name      testMediaToolsCountdown0019
     * @tc.desc      Verify mediaToolsCountdownCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2000
     * @tc.name      testMediaToolsCountdown0020
     * @tc.desc      Verify mediaToolsCountdownCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2100
     * @tc.name      testMediaToolsCountdown0021
     * @tc.desc      Verify mediaToolsCountdownCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2200
     * @tc.name      testMediaToolsCountdown0022
     * @tc.desc      Verify mediaToolsCountdownCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2300
     * @tc.name      testMediaToolsCountdown0023
     * @tc.desc      Verify mediaToolsCountdownCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2400
     * @tc.name      testMediaToolsCountdown0024
     * @tc.desc      Verify mediaToolsCountdownCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2500
     * @tc.name      testMediaToolsCountdown0025
     * @tc.desc      Verify mediaToolsCountdownCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2600
     * @tc.name      testMediaToolsCountdown0026
     * @tc.desc      Verify mediaToolsCountdownCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2700
     * @tc.name      testMediaToolsCountdown0027
     * @tc.desc      Verify mediaToolsCountdownCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2800
     * @tc.name      testMediaToolsCountdown0028
     * @tc.desc      Verify mediaToolsCountdownCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_2900
     * @tc.name      testMediaToolsCountdown0029
     * @tc.desc      Verify mediaToolsCountdownCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3000
     * @tc.name      testMediaToolsCountdown0030
     * @tc.desc      Verify mediaToolsCountdownCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3100
     * @tc.name      testMediaToolsCountdown0031
     * @tc.desc      Verify mediaToolsCountdownCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3200
     * @tc.name      testMediaToolsCountdown0032
     * @tc.desc      Verify mediaToolsCountdownCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3300
     * @tc.name      testMediaToolsCountdown0033
     * @tc.desc      Verify mediaToolsCountdownCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3400
     * @tc.name      testMediaToolsCountdown0034
     * @tc.desc      Verify mediaToolsCountdownCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3500
     * @tc.name      testMediaToolsCountdown0035
     * @tc.desc      Verify mediaToolsCountdownCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3600
     * @tc.name      testMediaToolsCountdown0036
     * @tc.desc      Verify mediaToolsCountdownCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3700
     * @tc.name      testMediaToolsCountdown0037
     * @tc.desc      Verify mediaToolsCountdownCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3800
     * @tc.name      testMediaToolsCountdown0038
     * @tc.desc      Verify mediaToolsCountdownCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_3900
     * @tc.name      testMediaToolsCountdown0039
     * @tc.desc      Verify mediaToolsCountdownCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4000
     * @tc.name      testMediaToolsCountdown0040
     * @tc.desc      Verify mediaToolsCountdownCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4100
     * @tc.name      testMediaToolsCountdown0041
     * @tc.desc      Verify mediaToolsCountdownCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4200
     * @tc.name      testMediaToolsCountdown0042
     * @tc.desc      Verify mediaToolsCountdownCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4300
     * @tc.name      testMediaToolsCountdown0043
     * @tc.desc      Verify mediaToolsCountdownCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4400
     * @tc.name      testMediaToolsCountdown0044
     * @tc.desc      Verify mediaToolsCountdownCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4500
     * @tc.name      testMediaToolsCountdown0045
     * @tc.desc      Verify mediaToolsCountdownCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4600
     * @tc.name      testMediaToolsCountdown0046
     * @tc.desc      Verify mediaToolsCountdownCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4700
     * @tc.name      testMediaToolsCountdown0047
     * @tc.desc      Verify mediaToolsCountdownCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4800
     * @tc.name      testMediaToolsCountdown0048
     * @tc.desc      Verify mediaToolsCountdownCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_4900
     * @tc.name      testMediaToolsCountdown0049
     * @tc.desc      Verify mediaToolsCountdownCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5000
     * @tc.name      testMediaToolsCountdown0050
     * @tc.desc      Verify mediaToolsCountdownCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5100
     * @tc.name      testMediaToolsCountdown0051
     * @tc.desc      Verify mediaToolsCountdownCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5200
     * @tc.name      testMediaToolsCountdown0052
     * @tc.desc      Verify mediaToolsCountdownCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5300
     * @tc.name      testMediaToolsCountdown0053
     * @tc.desc      Verify mediaToolsCountdownCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5400
     * @tc.name      testMediaToolsCountdown0054
     * @tc.desc      Verify mediaToolsCountdownCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5500
     * @tc.name      testMediaToolsCountdown0055
     * @tc.desc      Verify mediaToolsCountdownCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5600
     * @tc.name      testMediaToolsCountdown0056
     * @tc.desc      Verify mediaToolsCountdownCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5700
     * @tc.name      testMediaToolsCountdown0057
     * @tc.desc      Verify mediaToolsCountdownCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5800
     * @tc.name      testMediaToolsCountdown0058
     * @tc.desc      Verify mediaToolsCountdownCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_5900
     * @tc.name      testMediaToolsCountdown0059
     * @tc.desc      Verify mediaToolsCountdownCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6000
     * @tc.name      testMediaToolsCountdown0060
     * @tc.desc      Verify mediaToolsCountdownCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6100
     * @tc.name      testMediaToolsCountdown0061
     * @tc.desc      Verify mediaToolsCountdownCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6200
     * @tc.name      testMediaToolsCountdown0062
     * @tc.desc      Verify mediaToolsCountdownCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6300
     * @tc.name      testMediaToolsCountdown0063
     * @tc.desc      Verify mediaToolsCountdownCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6400
     * @tc.name      testMediaToolsCountdown0064
     * @tc.desc      Verify mediaToolsCountdownCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6500
     * @tc.name      testMediaToolsCountdown0065
     * @tc.desc      Verify mediaToolsCountdownCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6600
     * @tc.name      testMediaToolsCountdown0066
     * @tc.desc      Verify mediaToolsCountdownCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6700
     * @tc.name      testMediaToolsCountdown0067
     * @tc.desc      Verify mediaToolsCountdownCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6800
     * @tc.name      testMediaToolsCountdown0068
     * @tc.desc      Verify mediaToolsCountdownCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_6900
     * @tc.name      testMediaToolsCountdown0069
     * @tc.desc      Verify mediaToolsCountdownCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7000
     * @tc.name      testMediaToolsCountdown0070
     * @tc.desc      Verify mediaToolsCountdownCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7100
     * @tc.name      testMediaToolsCountdown0071
     * @tc.desc      Verify mediaToolsCountdownCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7200
     * @tc.name      testMediaToolsCountdown0072
     * @tc.desc      Verify mediaToolsCountdownCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7300
     * @tc.name      testMediaToolsCountdown0073
     * @tc.desc      Verify mediaToolsCountdownCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7400
     * @tc.name      testMediaToolsCountdown0074
     * @tc.desc      Verify mediaToolsCountdownCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7500
     * @tc.name      testMediaToolsCountdown0075
     * @tc.desc      Verify mediaToolsCountdownCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7600
     * @tc.name      testMediaToolsCountdown0076
     * @tc.desc      Verify mediaToolsCountdownCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[3]).replace(/\s+/g, '')).assertEqual(expected[3]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7700
     * @tc.name      testMediaToolsCountdown0077
     * @tc.desc      Verify mediaToolsCountdownCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[4]).replace(/\s+/g, '')).assertEqual(expected[4]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7800
     * @tc.name      testMediaToolsCountdown0078
     * @tc.desc      Verify mediaToolsCountdownCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[5]).replace(/\s+/g, '')).assertEqual(expected[5]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_7900
     * @tc.name      testMediaToolsCountdown0079
     * @tc.desc      Verify mediaToolsCountdownCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[0]).replace(/\s+/g, '')).assertEqual(expected[0]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_8000
     * @tc.name      testMediaToolsCountdown0080
     * @tc.desc      Verify mediaToolsCountdownCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[1]).replace(/\s+/g, '')).assertEqual(expected[1]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWN_8100
     * @tc.name      testMediaToolsCountdown0081
     * @tc.desc      Verify mediaToolsCountdownCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsCountdown0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 1000, 61000, 3600000, 3661000, 90061000];
      const expected: string[] = ['00:00', '00:01', '01:01', '01:00:00', '01:01:01', '01:01:01:01'];
      expect(MediaTools.msToCountdownTime(inputs[2]).replace(/\s+/g, '')).assertEqual(expected[2]);
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
    });

  });
}
