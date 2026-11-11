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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { dateTime, getShownTimer } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderTimerEdge]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderTimerEdgeTest(): void {
  describe('avRecorderTimerEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0001
     * @tc.name      testExtRecTimerEdge0000
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0002
     * @tc.name      testExtRecTimerEdge0001
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0003
     * @tc.name      testExtRecTimerEdge0002
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0004
     * @tc.name      testExtRecTimerEdge0003
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0005
     * @tc.name      testExtRecTimerEdge0004
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0006
     * @tc.name      testExtRecTimerEdge0005
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0007
     * @tc.name      testExtRecTimerEdge0006
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0008
     * @tc.name      testExtRecTimerEdge0007
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0009
     * @tc.name      testExtRecTimerEdge0008
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0010
     * @tc.name      testExtRecTimerEdge0009
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0011
     * @tc.name      testExtRecTimerEdge0010
     * @tc.desc      Timer edge 61000ms -> 1:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0012
     * @tc.name      testExtRecTimerEdge0011
     * @tc.desc      Timer edge 3599999ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0013
     * @tc.name      testExtRecTimerEdge0012
     * @tc.desc      Timer edge 3600000ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0014
     * @tc.name      testExtRecTimerEdge0013
     * @tc.desc      Timer edge 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0015
     * @tc.name      testExtRecTimerEdge0014
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0016
     * @tc.name      testExtRecTimerEdge0015
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0017
     * @tc.name      testExtRecTimerEdge0016
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0018
     * @tc.name      testExtRecTimerEdge0017
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0019
     * @tc.name      testExtRecTimerEdge0018
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0020
     * @tc.name      testExtRecTimerEdge0019
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0021
     * @tc.name      testExtRecTimerEdge0020
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0022
     * @tc.name      testExtRecTimerEdge0021
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0023
     * @tc.name      testExtRecTimerEdge0022
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0024
     * @tc.name      testExtRecTimerEdge0023
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0025
     * @tc.name      testExtRecTimerEdge0024
     * @tc.desc      Timer edge 61000ms -> 1:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0026
     * @tc.name      testExtRecTimerEdge0025
     * @tc.desc      Timer edge 3599999ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0027
     * @tc.name      testExtRecTimerEdge0026
     * @tc.desc      Timer edge 3600000ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0028
     * @tc.name      testExtRecTimerEdge0027
     * @tc.desc      Timer edge 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0029
     * @tc.name      testExtRecTimerEdge0028
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0030
     * @tc.name      testExtRecTimerEdge0029
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0031
     * @tc.name      testExtRecTimerEdge0030
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0032
     * @tc.name      testExtRecTimerEdge0031
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0033
     * @tc.name      testExtRecTimerEdge0032
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0034
     * @tc.name      testExtRecTimerEdge0033
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0035
     * @tc.name      testExtRecTimerEdge0034
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0036
     * @tc.name      testExtRecTimerEdge0035
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0037
     * @tc.name      testExtRecTimerEdge0036
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0038
     * @tc.name      testExtRecTimerEdge0037
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0039
     * @tc.name      testExtRecTimerEdge0038
     * @tc.desc      Timer edge 61000ms -> 1:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0040
     * @tc.name      testExtRecTimerEdge0039
     * @tc.desc      Timer edge 3599999ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0041
     * @tc.name      testExtRecTimerEdge0040
     * @tc.desc      Timer edge 3600000ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0042
     * @tc.name      testExtRecTimerEdge0041
     * @tc.desc      Timer edge 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0043
     * @tc.name      testExtRecTimerEdge0042
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0044
     * @tc.name      testExtRecTimerEdge0043
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0045
     * @tc.name      testExtRecTimerEdge0044
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0046
     * @tc.name      testExtRecTimerEdge0045
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0047
     * @tc.name      testExtRecTimerEdge0046
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0048
     * @tc.name      testExtRecTimerEdge0047
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0049
     * @tc.name      testExtRecTimerEdge0048
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0050
     * @tc.name      testExtRecTimerEdge0049
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0051
     * @tc.name      testExtRecTimerEdge0050
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0052
     * @tc.name      testExtRecTimerEdge0051
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0053
     * @tc.name      testExtRecTimerEdge0052
     * @tc.desc      Timer edge 61000ms -> 1:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0054
     * @tc.name      testExtRecTimerEdge0053
     * @tc.desc      Timer edge 3599999ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0055
     * @tc.name      testExtRecTimerEdge0054
     * @tc.desc      Timer edge 3600000ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0056
     * @tc.name      testExtRecTimerEdge0055
     * @tc.desc      Timer edge 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0057
     * @tc.name      testExtRecTimerEdge0056
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0058
     * @tc.name      testExtRecTimerEdge0057
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0059
     * @tc.name      testExtRecTimerEdge0058
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0060
     * @tc.name      testExtRecTimerEdge0059
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0061
     * @tc.name      testExtRecTimerEdge0060
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0062
     * @tc.name      testExtRecTimerEdge0061
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0063
     * @tc.name      testExtRecTimerEdge0062
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0064
     * @tc.name      testExtRecTimerEdge0063
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0065
     * @tc.name      testExtRecTimerEdge0064
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0066
     * @tc.name      testExtRecTimerEdge0065
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0067
     * @tc.name      testExtRecTimerEdge0066
     * @tc.desc      Timer edge 61000ms -> 1:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(61000).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0068
     * @tc.name      testExtRecTimerEdge0067
     * @tc.desc      Timer edge 3599999ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(3599999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0069
     * @tc.name      testExtRecTimerEdge0068
     * @tc.desc      Timer edge 3600000ms -> 60:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(3600000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0070
     * @tc.name      testExtRecTimerEdge0069
     * @tc.desc      Timer edge 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0071
     * @tc.name      testExtRecTimerEdge0070
     * @tc.desc      Timer edge 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0072
     * @tc.name      testExtRecTimerEdge0071
     * @tc.desc      Timer edge 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0073
     * @tc.name      testExtRecTimerEdge0072
     * @tc.desc      Timer edge 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(dateTime(0)).assertEqual('00:00');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0074
     * @tc.name      testExtRecTimerEdge0073
     * @tc.desc      Timer edge 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(dateTime(59)).assertEqual('00:59');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0075
     * @tc.name      testExtRecTimerEdge0074
     * @tc.desc      Timer edge 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(dateTime(60)).assertEqual('01:00');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0076
     * @tc.name      testExtRecTimerEdge0075
     * @tc.desc      Timer edge 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3599).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0077
     * @tc.name      testExtRecTimerEdge0076
     * @tc.desc      Timer edge 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(dateTime(3600).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0078
     * @tc.name      testExtRecTimerEdge0077
     * @tc.desc      Timer edge 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(dateTime(3661).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0079
     * @tc.name      testExtRecTimerEdge0078
     * @tc.desc      Timer edge 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(dateTime(7200).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMER2_0080
     * @tc.name      testExtRecTimerEdge0079
     * @tc.desc      Timer edge 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimerEdge0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(dateTime(86399).length).assertEqual(5);
    })
  });
}
