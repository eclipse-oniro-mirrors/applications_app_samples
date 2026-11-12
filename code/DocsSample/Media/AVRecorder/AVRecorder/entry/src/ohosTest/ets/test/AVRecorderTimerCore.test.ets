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
import { dateTime, getShownTimer } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderTimerCore]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderTimerCoreTest(): void {
  describe('avRecorderTimerCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0001
     * @tc.name      testExtRecTimer0000
     * @tc.desc      Timer 0ms -> 0:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0002
     * @tc.name      testExtRecTimer0001
     * @tc.desc      Timer 1ms -> 0:0, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0003
     * @tc.name      testExtRecTimer0002
     * @tc.desc      Timer 499ms -> 0:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0004
     * @tc.name      testExtRecTimer0003
     * @tc.desc      Timer 500ms -> 0:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0005
     * @tc.name      testExtRecTimer0004
     * @tc.desc      Timer 999ms -> 0:1, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0006
     * @tc.name      testExtRecTimer0005
     * @tc.desc      Timer 1000ms -> 0:1, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0007
     * @tc.name      testExtRecTimer0006
     * @tc.desc      Timer 1500ms -> 0:2, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0008
     * @tc.name      testExtRecTimer0007
     * @tc.desc      Timer 1999ms -> 0:2, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0009
     * @tc.name      testExtRecTimer0008
     * @tc.desc      Timer 2000ms -> 0:2, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0010
     * @tc.name      testExtRecTimer0009
     * @tc.desc      Timer 59999ms -> 1:0, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0011
     * @tc.name      testExtRecTimer0010
     * @tc.desc      Timer 60000ms -> 1:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0012
     * @tc.name      testExtRecTimer0011
     * @tc.desc      Timer 61000ms -> 1:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0013
     * @tc.name      testExtRecTimer0012
     * @tc.desc      Timer 3599999ms -> 60:0, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0014
     * @tc.name      testExtRecTimer0013
     * @tc.desc      Timer 3600000ms -> 60:0, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0015
     * @tc.name      testExtRecTimer0014
     * @tc.desc      Timer 0ms -> 0:0, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0016
     * @tc.name      testExtRecTimer0015
     * @tc.desc      Timer 1ms -> 0:0, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0017
     * @tc.name      testExtRecTimer0016
     * @tc.desc      Timer 499ms -> 0:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0018
     * @tc.name      testExtRecTimer0017
     * @tc.desc      Timer 500ms -> 0:1, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0019
     * @tc.name      testExtRecTimer0018
     * @tc.desc      Timer 999ms -> 0:1, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0020
     * @tc.name      testExtRecTimer0019
     * @tc.desc      Timer 1000ms -> 0:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0021
     * @tc.name      testExtRecTimer0020
     * @tc.desc      Timer 1500ms -> 0:2, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0022
     * @tc.name      testExtRecTimer0021
     * @tc.desc      Timer 1999ms -> 0:2, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0023
     * @tc.name      testExtRecTimer0022
     * @tc.desc      Timer 2000ms -> 0:2, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0024
     * @tc.name      testExtRecTimer0023
     * @tc.desc      Timer 59999ms -> 1:0, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0025
     * @tc.name      testExtRecTimer0024
     * @tc.desc      Timer 60000ms -> 1:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0026
     * @tc.name      testExtRecTimer0025
     * @tc.desc      Timer 61000ms -> 1:1, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0027
     * @tc.name      testExtRecTimer0026
     * @tc.desc      Timer 3599999ms -> 60:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0028
     * @tc.name      testExtRecTimer0027
     * @tc.desc      Timer 3600000ms -> 60:0, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0029
     * @tc.name      testExtRecTimer0028
     * @tc.desc      Timer 0ms -> 0:0, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0030
     * @tc.name      testExtRecTimer0029
     * @tc.desc      Timer 1ms -> 0:0, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0031
     * @tc.name      testExtRecTimer0030
     * @tc.desc      Timer 499ms -> 0:0, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0032
     * @tc.name      testExtRecTimer0031
     * @tc.desc      Timer 500ms -> 0:1, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0033
     * @tc.name      testExtRecTimer0032
     * @tc.desc      Timer 999ms -> 0:1, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0034
     * @tc.name      testExtRecTimer0033
     * @tc.desc      Timer 1000ms -> 0:1, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0035
     * @tc.name      testExtRecTimer0034
     * @tc.desc      Timer 1500ms -> 0:2, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0036
     * @tc.name      testExtRecTimer0035
     * @tc.desc      Timer 1999ms -> 0:2, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0037
     * @tc.name      testExtRecTimer0036
     * @tc.desc      Timer 2000ms -> 0:2, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0038
     * @tc.name      testExtRecTimer0037
     * @tc.desc      Timer 59999ms -> 1:0, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0039
     * @tc.name      testExtRecTimer0038
     * @tc.desc      Timer 60000ms -> 1:0, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0040
     * @tc.name      testExtRecTimer0039
     * @tc.desc      Timer 61000ms -> 1:1, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0041
     * @tc.name      testExtRecTimer0040
     * @tc.desc      Timer 3599999ms -> 60:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0042
     * @tc.name      testExtRecTimer0041
     * @tc.desc      Timer 3600000ms -> 60:0, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0043
     * @tc.name      testExtRecTimer0042
     * @tc.desc      Timer 0ms -> 0:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0044
     * @tc.name      testExtRecTimer0043
     * @tc.desc      Timer 1ms -> 0:0, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0045
     * @tc.name      testExtRecTimer0044
     * @tc.desc      Timer 499ms -> 0:0, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0046
     * @tc.name      testExtRecTimer0045
     * @tc.desc      Timer 500ms -> 0:1, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0047
     * @tc.name      testExtRecTimer0046
     * @tc.desc      Timer 999ms -> 0:1, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0048
     * @tc.name      testExtRecTimer0047
     * @tc.desc      Timer 1000ms -> 0:1, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0049
     * @tc.name      testExtRecTimer0048
     * @tc.desc      Timer 1500ms -> 0:2, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0050
     * @tc.name      testExtRecTimer0049
     * @tc.desc      Timer 1999ms -> 0:2, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0051
     * @tc.name      testExtRecTimer0050
     * @tc.desc      Timer 2000ms -> 0:2, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0052
     * @tc.name      testExtRecTimer0051
     * @tc.desc      Timer 59999ms -> 1:0, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0053
     * @tc.name      testExtRecTimer0052
     * @tc.desc      Timer 60000ms -> 1:0, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0054
     * @tc.name      testExtRecTimer0053
     * @tc.desc      Timer 61000ms -> 1:1, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0055
     * @tc.name      testExtRecTimer0054
     * @tc.desc      Timer 3599999ms -> 60:0, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0056
     * @tc.name      testExtRecTimer0055
     * @tc.desc      Timer 3600000ms -> 60:0, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0057
     * @tc.name      testExtRecTimer0056
     * @tc.desc      Timer 0ms -> 0:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0058
     * @tc.name      testExtRecTimer0057
     * @tc.desc      Timer 1ms -> 0:0, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0059
     * @tc.name      testExtRecTimer0058
     * @tc.desc      Timer 499ms -> 0:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0060
     * @tc.name      testExtRecTimer0059
     * @tc.desc      Timer 500ms -> 0:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0061
     * @tc.name      testExtRecTimer0060
     * @tc.desc      Timer 999ms -> 0:1, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0062
     * @tc.name      testExtRecTimer0061
     * @tc.desc      Timer 1000ms -> 0:1, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0063
     * @tc.name      testExtRecTimer0062
     * @tc.desc      Timer 1500ms -> 0:2, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0064
     * @tc.name      testExtRecTimer0063
     * @tc.desc      Timer 1999ms -> 0:2, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0065
     * @tc.name      testExtRecTimer0064
     * @tc.desc      Timer 2000ms -> 0:2, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0066
     * @tc.name      testExtRecTimer0065
     * @tc.desc      Timer 59999ms -> 1:0, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0067
     * @tc.name      testExtRecTimer0066
     * @tc.desc      Timer 60000ms -> 1:0, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0068
     * @tc.name      testExtRecTimer0067
     * @tc.desc      Timer 61000ms -> 1:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0069
     * @tc.name      testExtRecTimer0068
     * @tc.desc      Timer 3599999ms -> 60:0, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0070
     * @tc.name      testExtRecTimer0069
     * @tc.desc      Timer 3600000ms -> 60:0, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0071
     * @tc.name      testExtRecTimer0070
     * @tc.desc      Timer 0ms -> 0:0, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0072
     * @tc.name      testExtRecTimer0071
     * @tc.desc      Timer 1ms -> 0:0, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0073
     * @tc.name      testExtRecTimer0072
     * @tc.desc      Timer 499ms -> 0:0, seconds 0 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0074
     * @tc.name      testExtRecTimer0073
     * @tc.desc      Timer 500ms -> 0:1, seconds 1 -> 00:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(1)).assertEqual('00:01');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0075
     * @tc.name      testExtRecTimer0074
     * @tc.desc      Timer 999ms -> 0:1, seconds 59 -> 00:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0076
     * @tc.name      testExtRecTimer0075
     * @tc.desc      Timer 1000ms -> 0:1, seconds 60 -> 01:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0077
     * @tc.name      testExtRecTimer0076
     * @tc.desc      Timer 1500ms -> 0:2, seconds 61 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(dateTime(61)).assertEqual('01:01');
      expect(getShownTimer(1500).indexOf(':') > 0).assertTrue();
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0078
     * @tc.name      testExtRecTimer0077
     * @tc.desc      Timer 1999ms -> 0:2, seconds 3599 -> 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0079
     * @tc.name      testExtRecTimer0078
     * @tc.desc      Timer 2000ms -> 0:2, seconds 3600 -> 00:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER_0080
     * @tc.name      testExtRecTimer0079
     * @tc.desc      Timer 59999ms -> 1:0, seconds 3661 -> 01:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimer0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
  });
}
