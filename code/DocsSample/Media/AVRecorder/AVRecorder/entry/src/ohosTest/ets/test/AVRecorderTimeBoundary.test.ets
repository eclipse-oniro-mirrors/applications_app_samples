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
import { getShownTimer } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderTimeBoundary]';
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

export default function avRecorderTimeBoundaryTest(): void {
  describe('avRecorderTimeBoundaryTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0001
     * @tc.name      testExtRecTimeBound0000
     * @tc.desc      Time boundary -1000ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-1000)).assertEqual('-1:59');
      expect(getShownTimer(-1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0002
     * @tc.name      testExtRecTimeBound0001
     * @tc.desc      Time boundary -500ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-500)).assertEqual('-1:59');
      expect(getShownTimer(-500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0003
     * @tc.name      testExtRecTimeBound0002
     * @tc.desc      Time boundary 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(0).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0004
     * @tc.name      testExtRecTimeBound0003
     * @tc.desc      Time boundary 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0005
     * @tc.name      testExtRecTimeBound0004
     * @tc.desc      Time boundary 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(499).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0006
     * @tc.name      testExtRecTimeBound0005
     * @tc.desc      Time boundary 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0007
     * @tc.name      testExtRecTimeBound0006
     * @tc.desc      Time boundary 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0008
     * @tc.name      testExtRecTimeBound0007
     * @tc.desc      Time boundary 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0009
     * @tc.name      testExtRecTimeBound0008
     * @tc.desc      Time boundary 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0010
     * @tc.name      testExtRecTimeBound0009
     * @tc.desc      Time boundary 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(2000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0011
     * @tc.name      testExtRecTimeBound0010
     * @tc.desc      Time boundary 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(59999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0012
     * @tc.name      testExtRecTimeBound0011
     * @tc.desc      Time boundary 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(60000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0013
     * @tc.name      testExtRecTimeBound0012
     * @tc.desc      Time boundary 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(86399999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0014
     * @tc.name      testExtRecTimeBound0013
     * @tc.desc      Time boundary 86400000ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86400000)).assertEqual('1440:0');
      expect(getShownTimer(86400000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(86400000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0015
     * @tc.name      testExtRecTimeBound0014
     * @tc.desc      Time boundary -1000ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-1000)).assertEqual('-1:59');
      expect(getShownTimer(-1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0016
     * @tc.name      testExtRecTimeBound0015
     * @tc.desc      Time boundary -500ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-500)).assertEqual('-1:59');
      expect(getShownTimer(-500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0017
     * @tc.name      testExtRecTimeBound0016
     * @tc.desc      Time boundary 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(0).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0018
     * @tc.name      testExtRecTimeBound0017
     * @tc.desc      Time boundary 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0019
     * @tc.name      testExtRecTimeBound0018
     * @tc.desc      Time boundary 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(499).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0020
     * @tc.name      testExtRecTimeBound0019
     * @tc.desc      Time boundary 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0021
     * @tc.name      testExtRecTimeBound0020
     * @tc.desc      Time boundary 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0022
     * @tc.name      testExtRecTimeBound0021
     * @tc.desc      Time boundary 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0023
     * @tc.name      testExtRecTimeBound0022
     * @tc.desc      Time boundary 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0024
     * @tc.name      testExtRecTimeBound0023
     * @tc.desc      Time boundary 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(2000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0025
     * @tc.name      testExtRecTimeBound0024
     * @tc.desc      Time boundary 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(59999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0026
     * @tc.name      testExtRecTimeBound0025
     * @tc.desc      Time boundary 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(60000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0027
     * @tc.name      testExtRecTimeBound0026
     * @tc.desc      Time boundary 86399999ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86399999)).assertEqual('1440:0');
      expect(getShownTimer(86399999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(86399999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0028
     * @tc.name      testExtRecTimeBound0027
     * @tc.desc      Time boundary 86400000ms -> 1440:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(86400000)).assertEqual('1440:0');
      expect(getShownTimer(86400000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(86400000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0029
     * @tc.name      testExtRecTimeBound0028
     * @tc.desc      Time boundary -1000ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-1000)).assertEqual('-1:59');
      expect(getShownTimer(-1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0030
     * @tc.name      testExtRecTimeBound0029
     * @tc.desc      Time boundary -500ms -> -1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(-500)).assertEqual('-1:59');
      expect(getShownTimer(-500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(-500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0031
     * @tc.name      testExtRecTimeBound0030
     * @tc.desc      Time boundary 0ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(0).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(0).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0032
     * @tc.name      testExtRecTimeBound0031
     * @tc.desc      Time boundary 1ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(getShownTimer(1).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0033
     * @tc.name      testExtRecTimeBound0032
     * @tc.desc      Time boundary 499ms -> 0:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(getShownTimer(499).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(499).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0034
     * @tc.name      testExtRecTimeBound0033
     * @tc.desc      Time boundary 500ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(getShownTimer(500).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(500).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0035
     * @tc.name      testExtRecTimeBound0034
     * @tc.desc      Time boundary 999ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(getShownTimer(999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0036
     * @tc.name      testExtRecTimeBound0035
     * @tc.desc      Time boundary 1000ms -> 0:1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(getShownTimer(1000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0037
     * @tc.name      testExtRecTimeBound0036
     * @tc.desc      Time boundary 1999ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(1999)).assertEqual('0:2');
      expect(getShownTimer(1999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(1999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0038
     * @tc.name      testExtRecTimeBound0037
     * @tc.desc      Time boundary 2000ms -> 0:2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(2000)).assertEqual('0:2');
      expect(getShownTimer(2000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(2000).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0039
     * @tc.name      testExtRecTimeBound0038
     * @tc.desc      Time boundary 59999ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(getShownTimer(59999).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(59999).length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMEBOUND_0040
     * @tc.name      testExtRecTimeBound0039
     * @tc.desc      Time boundary 60000ms -> 1:0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeBound0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(getShownTimer(60000).indexOf(':') > 0).assertTrue();
      expect(getShownTimer(60000).length).assertLarger(0);
    })
  });
}
