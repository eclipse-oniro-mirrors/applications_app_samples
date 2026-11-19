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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { formatDuration, formatBytes, formatPercent, progressBucket, pad2, truncateMiddle } from '../../../main/ets/utils/FormatUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function FormatNumericGridMatrixCombinedPart1Test(): void {
  describe('FmtNum1', () => {
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_0100
     * @tc.name      testDurationGrid0001
     * @tc.desc      Verify formatDuration(-5000) returns 0 ms. Plus Verify formatDuration(9) returns 9 ms. Plus Verify formatDuration(100) returns 100 ms. Plus Verify formatDuration(1100) returns 1.1 s. Plus Verify formatDuration(1200) returns 1.2 s. Plus Verify formatDuration(1900) returns 1.9 s. Plus Verify formatDuration(59900) returns 59.9 s. Plus Verify formatDuration(60100) returns 1 min 0 s. Plus Verify formatDuration(119600) returns 1 min 59 s. Plus Verify formatDuration(120000) returns 2 min 0 s. Plus Verify formatDuration(180000) returns 3 min 0 s. Plus Verify formatDuration(3599900) returns 59 min 59 s. Plus Verify formatDuration(7260000) returns 121 min 0 s. Plus Verify formatDuration(1700) returns 1.7 s. Plus Verify formatDuration(2400) returns 2.4 s. Plus Verify formatDuration(3100) returns 3.1 s. Plus Verify formatDuration(3800) returns 3.8 s. Plus Verify formatDuration(4500) returns 4.5 s. Plus Verify formatDuration(5200) returns 5.2 s. Plus Verify formatDuration(5900) returns 5.9 s. Plus Verify formatDuration(6600) returns 6.6 s. Plus Verify formatDuration(7300) returns 7.3 s. Plus Verify formatDuration(8000) returns 8.0 s. Plus Verify formatDuration(8700) returns 8.7 s. Plus Verify formatDuration(9400) returns 9.4 s. Plus Verify formatDuration(10100) returns 10.1 s. Plus Verify formatDuration(10800) returns 10.8 s. Plus Verify formatDuration(11500) returns 11.5 s. Plus Verify formatDuration(12200) returns 12.2 s. Plus Verify formatDuration(12900) returns 12.9 s. Plus Verify formatDuration(13600) returns 13.6 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0001 begin');
      await delayTick();
      expect(formatDuration(-5000)).assertEqual('0 ms');
      {
      expect(formatDuration(9)).assertEqual('9 ms');
      }
      {
      expect(formatDuration(100)).assertEqual('100 ms');
      }
      {
      expect(formatDuration(1100)).assertEqual('1.1 s');
      }
      {
      expect(formatDuration(1200)).assertEqual('1.2 s');
      }
      {
      expect(formatDuration(1900)).assertEqual('1.9 s');
      }
      {
      expect(formatDuration(59900)).assertEqual('59.9 s');
      }
      {
      expect(formatDuration(60100)).assertEqual('1 min 0 s');
      }
      {
      expect(formatDuration(119600)).assertEqual('1 min 59 s');
      }
      {
      expect(formatDuration(120000)).assertEqual('2 min 0 s');
      }
      {
      expect(formatDuration(180000)).assertEqual('3 min 0 s');
      }
      {
      expect(formatDuration(3599900)).assertEqual('59 min 59 s');
      }
      {
      expect(formatDuration(7260000)).assertEqual('121 min 0 s');
      }
      {
      expect(formatDuration(1700)).assertEqual('1.7 s');
      }
      {
      expect(formatDuration(2400)).assertEqual('2.4 s');
      }
      {
      expect(formatDuration(3100)).assertEqual('3.1 s');
      }
      {
      expect(formatDuration(3800)).assertEqual('3.8 s');
      }
      {
      expect(formatDuration(4500)).assertEqual('4.5 s');
      }
      {
      expect(formatDuration(5200)).assertEqual('5.2 s');
      }
      {
      expect(formatDuration(5900)).assertEqual('5.9 s');
      }
      {
      expect(formatDuration(6600)).assertEqual('6.6 s');
      }
      {
      expect(formatDuration(7300)).assertEqual('7.3 s');
      }
      {
      expect(formatDuration(8000)).assertEqual('8.0 s');
      }
      {
      expect(formatDuration(8700)).assertEqual('8.7 s');
      }
      {
      expect(formatDuration(9400)).assertEqual('9.4 s');
      }
      {
      expect(formatDuration(10100)).assertEqual('10.1 s');
      }
      {
      expect(formatDuration(10800)).assertEqual('10.8 s');
      }
      {
      expect(formatDuration(11500)).assertEqual('11.5 s');
      }
      {
      expect(formatDuration(12200)).assertEqual('12.2 s');
      }
      {
      expect(formatDuration(12900)).assertEqual('12.9 s');
      }
      {
      expect(formatDuration(13600)).assertEqual('13.6 s');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0001 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3200
     * @tc.name      testDurationGrid0032
     * @tc.desc      Verify formatDuration(14300) returns 14.3 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0032 begin');
      await delayTick();
      expect(formatDuration(14300)).assertEqual('14.3 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0032 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3300
     * @tc.name      testDurationGrid0033
     * @tc.desc      Verify formatDuration(15000) returns 15.0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0033 begin');
      await delayTick();
      expect(formatDuration(15000)).assertEqual('15.0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0033 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3400
     * @tc.name      testDurationGrid0034
     * @tc.desc      Verify formatDuration(15700) returns 15.7 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0034 begin');
      await delayTick();
      expect(formatDuration(15700)).assertEqual('15.7 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0034 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3500
     * @tc.name      testDurationGrid0035
     * @tc.desc      Verify formatDuration(16400) returns 16.4 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0035 begin');
      await delayTick();
      expect(formatDuration(16400)).assertEqual('16.4 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0035 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3600
     * @tc.name      testDurationGrid0036
     * @tc.desc      Verify formatDuration(17100) returns 17.1 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0036 begin');
      await delayTick();
      expect(formatDuration(17100)).assertEqual('17.1 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0036 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3700
     * @tc.name      testDurationGrid0037
     * @tc.desc      Verify formatDuration(17800) returns 17.8 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0037 begin');
      await delayTick();
      expect(formatDuration(17800)).assertEqual('17.8 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0037 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3800
     * @tc.name      testDurationGrid0038
     * @tc.desc      Verify formatDuration(18500) returns 18.5 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0038 begin');
      await delayTick();
      expect(formatDuration(18500)).assertEqual('18.5 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0038 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_3900
     * @tc.name      testDurationGrid0039
     * @tc.desc      Verify formatDuration(19200) returns 19.2 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0039 begin');
      await delayTick();
      expect(formatDuration(19200)).assertEqual('19.2 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0039 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP1_4000
     * @tc.name      testDurationGrid0040
     * @tc.desc      Verify formatDuration(19900) returns 19.9 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0040 begin');
      await delayTick();
      expect(formatDuration(19900)).assertEqual('19.9 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0040 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4100
     * @tc.name      testDurationGrid0041
     * @tc.desc      Verify formatDuration(20600) returns 20.6 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0041 begin');
      await delayTick();
      expect(formatDuration(20600)).assertEqual('20.6 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0041 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4200
     * @tc.name      testDurationGrid0042
     * @tc.desc      Verify formatDuration(21300) returns 21.3 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0042 begin');
      await delayTick();
      expect(formatDuration(21300)).assertEqual('21.3 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0042 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4300
     * @tc.name      testDurationGrid0043
     * @tc.desc      Verify formatDuration(22000) returns 22.0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0043 begin');
      await delayTick();
      expect(formatDuration(22000)).assertEqual('22.0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0043 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4400
     * @tc.name      testDurationGrid0044
     * @tc.desc      Verify formatDuration(121000) returns 2 min 1 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0044 begin');
      await delayTick();
      expect(formatDuration(121000)).assertEqual('2 min 1 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0044 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4500
     * @tc.name      testDurationGrid0045
     * @tc.desc      Verify formatDuration(182000) returns 3 min 2 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0045 begin');
      await delayTick();
      expect(formatDuration(182000)).assertEqual('3 min 2 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0045 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4600
     * @tc.name      testDurationGrid0046
     * @tc.desc      Verify formatDuration(243000) returns 4 min 3 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0046 begin');
      await delayTick();
      expect(formatDuration(243000)).assertEqual('4 min 3 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0046 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4700
     * @tc.name      testDurationGrid0047
     * @tc.desc      Verify formatDuration(304000) returns 5 min 4 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0047 begin');
      await delayTick();
      expect(formatDuration(304000)).assertEqual('5 min 4 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0047 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4800
     * @tc.name      testDurationGrid0048
     * @tc.desc      Verify formatDuration(365000) returns 6 min 5 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0048 begin');
      await delayTick();
      expect(formatDuration(365000)).assertEqual('6 min 5 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0048 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_4900
     * @tc.name      testDurationGrid0049
     * @tc.desc      Verify formatDuration(426000) returns 7 min 6 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0049 begin');
      await delayTick();
      expect(formatDuration(426000)).assertEqual('7 min 6 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0049 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5000
     * @tc.name      testDurationGrid0050
     * @tc.desc      Verify formatDuration(487000) returns 8 min 7 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0050 begin');
      await delayTick();
      expect(formatDuration(487000)).assertEqual('8 min 7 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0050 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5100
     * @tc.name      testDurationGrid0051
     * @tc.desc      Verify formatDuration(548000) returns 9 min 8 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0051 begin');
      await delayTick();
      expect(formatDuration(548000)).assertEqual('9 min 8 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0051 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5200
     * @tc.name      testDurationGrid0052
     * @tc.desc      Verify formatDuration(609000) returns 10 min 9 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0052 begin');
      await delayTick();
      expect(formatDuration(609000)).assertEqual('10 min 9 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0052 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5300
     * @tc.name      testDurationGrid0053
     * @tc.desc      Verify formatDuration(670000) returns 11 min 10 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0053 begin');
      await delayTick();
      expect(formatDuration(670000)).assertEqual('11 min 10 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0053 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5400
     * @tc.name      testDurationGrid0054
     * @tc.desc      Verify formatDuration(731000) returns 12 min 11 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0054 begin');
      await delayTick();
      expect(formatDuration(731000)).assertEqual('12 min 11 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0054 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5500
     * @tc.name      testDurationGrid0055
     * @tc.desc      Verify formatDuration(792000) returns 13 min 12 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0055 begin');
      await delayTick();
      expect(formatDuration(792000)).assertEqual('13 min 12 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0055 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5600
     * @tc.name      testDurationGrid0056
     * @tc.desc      Verify formatDuration(853000) returns 14 min 13 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0056 begin');
      await delayTick();
      expect(formatDuration(853000)).assertEqual('14 min 13 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0056 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5700
     * @tc.name      testDurationGrid0057
     * @tc.desc      Verify formatDuration(914000) returns 15 min 14 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0057 begin');
      await delayTick();
      expect(formatDuration(914000)).assertEqual('15 min 14 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0057 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5800
     * @tc.name      testDurationGrid0058
     * @tc.desc      Verify formatDuration(975000) returns 16 min 15 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0058 begin');
      await delayTick();
      expect(formatDuration(975000)).assertEqual('16 min 15 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0058 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_5900
     * @tc.name      testDurationGrid0059
     * @tc.desc      Verify formatDuration(1036000) returns 17 min 16 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0059 begin');
      await delayTick();
      expect(formatDuration(1036000)).assertEqual('17 min 16 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0059 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6000
     * @tc.name      testDurationGrid0060
     * @tc.desc      Verify formatDuration(1097000) returns 18 min 17 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0060 begin');
      await delayTick();
      expect(formatDuration(1097000)).assertEqual('18 min 17 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0060 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6100
     * @tc.name      testDurationGrid0061
     * @tc.desc      Verify formatDuration(1158000) returns 19 min 18 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0061 begin');
      await delayTick();
      expect(formatDuration(1158000)).assertEqual('19 min 18 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0061 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6200
     * @tc.name      testDurationGrid0062
     * @tc.desc      Verify formatDuration(1219000) returns 20 min 19 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0062 begin');
      await delayTick();
      expect(formatDuration(1219000)).assertEqual('20 min 19 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0062 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6300
     * @tc.name      testDurationGrid0063
     * @tc.desc      Verify formatDuration(1280000) returns 21 min 20 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDurationGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0063 begin');
      await delayTick();
      expect(formatDuration(1280000)).assertEqual('21 min 20 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDurationGrid0063 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6400
     * @tc.name      testBytesGrid0064
     * @tc.desc      Verify formatBytes(7) returns 7 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0064 begin');
      await delayTick();
      expect(formatBytes(7)).assertEqual('7 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0064 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6500
     * @tc.name      testBytesGrid0065
     * @tc.desc      Verify formatBytes(512) returns 512 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0065 begin');
      await delayTick();
      expect(formatBytes(512)).assertEqual('512 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0065 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6600
     * @tc.name      testBytesGrid0066
     * @tc.desc      Verify formatBytes(1000) returns 1000 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0066 begin');
      await delayTick();
      expect(formatBytes(1000)).assertEqual('1000 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0066 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6700
     * @tc.name      testBytesGrid0067
     * @tc.desc      Verify formatBytes(1025) returns 1.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0067 begin');
      await delayTick();
      expect(formatBytes(1025)).assertEqual('1.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0067 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6800
     * @tc.name      testBytesGrid0068
     * @tc.desc      Verify formatBytes(1100) returns 1.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0068 begin');
      await delayTick();
      expect(formatBytes(1100)).assertEqual('1.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0068 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_6900
     * @tc.name      testBytesGrid0069
     * @tc.desc      Verify formatBytes(1500) returns 1.5 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0069 begin');
      await delayTick();
      expect(formatBytes(1500)).assertEqual('1.5 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0069 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7000
     * @tc.name      testBytesGrid0070
     * @tc.desc      Verify formatBytes(2048) returns 2.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0070 begin');
      await delayTick();
      expect(formatBytes(2048)).assertEqual('2.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0070 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7100
     * @tc.name      testBytesGrid0071
     * @tc.desc      Verify formatBytes(3000) returns 2.9 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0071 begin');
      await delayTick();
      expect(formatBytes(3000)).assertEqual('2.9 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0071 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7200
     * @tc.name      testBytesGrid0072
     * @tc.desc      Verify formatBytes(10240) returns 10.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0072 begin');
      await delayTick();
      expect(formatBytes(10240)).assertEqual('10.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0072 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7300
     * @tc.name      testBytesGrid0073
     * @tc.desc      Verify formatBytes(10241) returns 10.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0073 begin');
      await delayTick();
      expect(formatBytes(10241)).assertEqual('10.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0073 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7400
     * @tc.name      testBytesGrid0074
     * @tc.desc      Verify formatBytes(655360) returns 640.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0074 begin');
      await delayTick();
      expect(formatBytes(655360)).assertEqual('640.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0074 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7500
     * @tc.name      testBytesGrid0075
     * @tc.desc      Verify formatBytes(1048577) returns 1.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0075 begin');
      await delayTick();
      expect(formatBytes(1048577)).assertEqual('1.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0075 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7600
     * @tc.name      testBytesGrid0076
     * @tc.desc      Verify formatBytes(1200000) returns 1.1 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0076 begin');
      await delayTick();
      expect(formatBytes(1200000)).assertEqual('1.1 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0076 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7700
     * @tc.name      testBytesGrid0077
     * @tc.desc      Verify formatBytes(2621440) returns 2.5 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0077 begin');
      await delayTick();
      expect(formatBytes(2621440)).assertEqual('2.5 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0077 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7800
     * @tc.name      testBytesGrid0078
     * @tc.desc      Verify formatBytes(10485760) returns 10.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0078 begin');
      await delayTick();
      expect(formatBytes(10485760)).assertEqual('10.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0078 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_7900
     * @tc.name      testBytesGrid0079
     * @tc.desc      Verify formatBytes(2185) returns 2.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0079 begin');
      await delayTick();
      expect(formatBytes(2185)).assertEqual('2.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0079 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP2_8000
     * @tc.name      testBytesGrid0080
     * @tc.desc      Verify formatBytes(3209) returns 3.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0080 begin');
      await delayTick();
      expect(formatBytes(3209)).assertEqual('3.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0080 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8100
     * @tc.name      testBytesGrid0081
     * @tc.desc      Verify formatBytes(5257) returns 5.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0081 begin');
      await delayTick();
      expect(formatBytes(5257)).assertEqual('5.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0081 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8200
     * @tc.name      testBytesGrid0082
     * @tc.desc      Verify formatBytes(7305) returns 7.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0082 begin');
      await delayTick();
      expect(formatBytes(7305)).assertEqual('7.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0082 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8300
     * @tc.name      testBytesGrid0083
     * @tc.desc      Verify formatBytes(11401) returns 11.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0083 begin');
      await delayTick();
      expect(formatBytes(11401)).assertEqual('11.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0083 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8400
     * @tc.name      testBytesGrid0084
     * @tc.desc      Verify formatBytes(13449) returns 13.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0084 begin');
      await delayTick();
      expect(formatBytes(13449)).assertEqual('13.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0084 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8500
     * @tc.name      testBytesGrid0085
     * @tc.desc      Verify formatBytes(17545) returns 17.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0085 begin');
      await delayTick();
      expect(formatBytes(17545)).assertEqual('17.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0085 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8600
     * @tc.name      testBytesGrid0086
     * @tc.desc      Verify formatBytes(19593) returns 19.1 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0086 begin');
      await delayTick();
      expect(formatBytes(19593)).assertEqual('19.1 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0086 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8700
     * @tc.name      testBytesGrid0087
     * @tc.desc      Verify formatBytes(2097485) returns 2.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0087 begin');
      await delayTick();
      expect(formatBytes(2097485)).assertEqual('2.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0087 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8800
     * @tc.name      testBytesGrid0088
     * @tc.desc      Verify formatBytes(3146061) returns 3.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0088 begin');
      await delayTick();
      expect(formatBytes(3146061)).assertEqual('3.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0088 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_8900
     * @tc.name      testBytesGrid0089
     * @tc.desc      Verify formatBytes(4194637) returns 4.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0089 begin');
      await delayTick();
      expect(formatBytes(4194637)).assertEqual('4.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0089 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9000
     * @tc.name      testBytesGrid0090
     * @tc.desc      Verify formatBytes(5243213) returns 5.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0090 begin');
      await delayTick();
      expect(formatBytes(5243213)).assertEqual('5.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0090 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9100
     * @tc.name      testBytesGrid0091
     * @tc.desc      Verify formatBytes(8388941) returns 8.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytesGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0091 begin');
      await delayTick();
      expect(formatBytes(8388941)).assertEqual('8.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytesGrid0091 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9200
     * @tc.name      testPercentGrid0092
     * @tc.desc      Verify formatPercent(-1, 100) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0092 begin');
      await delayTick();
      expect(formatPercent(-1, 100)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0092 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9300
     * @tc.name      testPercentGrid0093
     * @tc.desc      Verify formatPercent(1, 100) returns 1%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0093 begin');
      await delayTick();
      expect(formatPercent(1, 100)).assertEqual('1%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0093 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9400
     * @tc.name      testPercentGrid0094
     * @tc.desc      Verify formatPercent(24, 100) returns 24%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0094 begin');
      await delayTick();
      expect(formatPercent(24, 100)).assertEqual('24%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0094 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9500
     * @tc.name      testPercentGrid0095
     * @tc.desc      Verify formatPercent(25, 100) returns 25%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0095 begin');
      await delayTick();
      expect(formatPercent(25, 100)).assertEqual('25%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0095 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9600
     * @tc.name      testPercentGrid0096
     * @tc.desc      Verify formatPercent(49, 100) returns 49%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0096 begin');
      await delayTick();
      expect(formatPercent(49, 100)).assertEqual('49%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0096 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9700
     * @tc.name      testPercentGrid0097
     * @tc.desc      Verify formatPercent(100, 100) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0097 begin');
      await delayTick();
      expect(formatPercent(100, 100)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0097 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9800
     * @tc.name      testPercentGrid0098
     * @tc.desc      Verify formatPercent(101, 100) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0098 begin');
      await delayTick();
      expect(formatPercent(101, 100)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0098 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_9900
     * @tc.name      testPercentGrid0099
     * @tc.desc      Verify formatPercent(150, 100) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0099 begin');
      await delayTick();
      expect(formatPercent(150, 100)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0099 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10000
     * @tc.name      testPercentGrid0100
     * @tc.desc      Verify formatPercent(5, 7) returns 71%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0100 begin');
      await delayTick();
      expect(formatPercent(5, 7)).assertEqual('71%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0100 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10100
     * @tc.name      testPercentGrid0101
     * @tc.desc      Verify formatPercent(13, 17) returns 76%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0101 begin');
      await delayTick();
      expect(formatPercent(13, 17)).assertEqual('76%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0101 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10200
     * @tc.name      testPercentGrid0102
     * @tc.desc      Verify formatPercent(250, 300) returns 83%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0102 begin');
      await delayTick();
      expect(formatPercent(250, 300)).assertEqual('83%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0102 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10300
     * @tc.name      testPercentGrid0103
     * @tc.desc      Verify formatPercent(5, 0) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0103 begin');
      await delayTick();
      expect(formatPercent(5, 0)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0103 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10400
     * @tc.name      testPercentGrid0104
     * @tc.desc      Verify formatPercent(7, -4) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0104 begin');
      await delayTick();
      expect(formatPercent(7, -4)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0104 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10500
     * @tc.name      testPercentGrid0105
     * @tc.desc      Verify formatPercent(999999, 1000000) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0105 begin');
      await delayTick();
      expect(formatPercent(999999, 1000000)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0105 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10600
     * @tc.name      testPercentGrid0106
     * @tc.desc      Verify formatPercent(0, 37) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0106 begin');
      await delayTick();
      expect(formatPercent(0, 37)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0106 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10700
     * @tc.name      testPercentGrid0107
     * @tc.desc      Verify formatPercent(2, 37) returns 5%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0107 begin');
      await delayTick();
      expect(formatPercent(2, 37)).assertEqual('5%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0107 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10800
     * @tc.name      testPercentGrid0108
     * @tc.desc      Verify formatPercent(5, 37) returns 14%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0108 begin');
      await delayTick();
      expect(formatPercent(5, 37)).assertEqual('14%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0108 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_10900
     * @tc.name      testPercentGrid0109
     * @tc.desc      Verify formatPercent(9, 37) returns 24%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0109 begin');
      await delayTick();
      expect(formatPercent(9, 37)).assertEqual('24%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0109 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11000
     * @tc.name      testPercentGrid0110
     * @tc.desc      Verify formatPercent(13, 37) returns 35%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0110 begin');
      await delayTick();
      expect(formatPercent(13, 37)).assertEqual('35%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0110 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11100
     * @tc.name      testPercentGrid0111
     * @tc.desc      Verify formatPercent(18, 37) returns 49%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0111 begin');
      await delayTick();
      expect(formatPercent(18, 37)).assertEqual('49%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0111 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11200
     * @tc.name      testPercentGrid0112
     * @tc.desc      Verify formatPercent(22, 37) returns 59%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0112 begin');
      await delayTick();
      expect(formatPercent(22, 37)).assertEqual('59%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0112 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11300
     * @tc.name      testPercentGrid0113
     * @tc.desc      Verify formatPercent(27, 37) returns 73%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0113 begin');
      await delayTick();
      expect(formatPercent(27, 37)).assertEqual('73%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0113 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11400
     * @tc.name      testPercentGrid0114
     * @tc.desc      Verify formatPercent(31, 37) returns 84%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0114 begin');
      await delayTick();
      expect(formatPercent(31, 37)).assertEqual('84%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0114 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11500
     * @tc.name      testPercentGrid0115
     * @tc.desc      Verify formatPercent(36, 37) returns 97%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0115 begin');
      await delayTick();
      expect(formatPercent(36, 37)).assertEqual('97%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0115 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11600
     * @tc.name      testPercentGrid0116
     * @tc.desc      Verify formatPercent(37, 37) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0116 begin');
      await delayTick();
      expect(formatPercent(37, 37)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0116 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11700
     * @tc.name      testPercentGrid0117
     * @tc.desc      Verify formatPercent(41, 37) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercentGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0117 begin');
      await delayTick();
      expect(formatPercent(41, 37)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentGrid0117 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11800
     * @tc.name      testProgressGrid0118
     * @tc.desc      Verify progressBucket(-100) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0118 begin');
      await delayTick();
      expect(progressBucket(-100)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0118 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_11900
     * @tc.name      testProgressGrid0119
     * @tc.desc      Verify progressBucket(-1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0119 begin');
      await delayTick();
      expect(progressBucket(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0119 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP3_12000
     * @tc.name      testProgressGrid0120
     * @tc.desc      Verify progressBucket(0) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0120 begin');
      await delayTick();
      expect(progressBucket(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0120 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12100
     * @tc.name      testProgressGrid0121
     * @tc.desc      Verify progressBucket(0.1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0121 begin');
      await delayTick();
      expect(progressBucket(0.1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0121 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12200
     * @tc.name      testProgressGrid0122
     * @tc.desc      Verify progressBucket(5) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0122 begin');
      await delayTick();
      expect(progressBucket(5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0122 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12300
     * @tc.name      testProgressGrid0123
     * @tc.desc      Verify progressBucket(24) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0123 begin');
      await delayTick();
      expect(progressBucket(24)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0123 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12400
     * @tc.name      testProgressGrid0124
     * @tc.desc      Verify progressBucket(24.9) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0124 begin');
      await delayTick();
      expect(progressBucket(24.9)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0124 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12500
     * @tc.name      testProgressGrid0125
     * @tc.desc      Verify progressBucket(25) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0125 begin');
      await delayTick();
      expect(progressBucket(25)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0125 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12600
     * @tc.name      testProgressGrid0126
     * @tc.desc      Verify progressBucket(25.1) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0126 begin');
      await delayTick();
      expect(progressBucket(25.1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0126 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12700
     * @tc.name      testProgressGrid0127
     * @tc.desc      Verify progressBucket(49) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0127 begin');
      await delayTick();
      expect(progressBucket(49)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0127 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12800
     * @tc.name      testProgressGrid0128
     * @tc.desc      Verify progressBucket(50) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0128 begin');
      await delayTick();
      expect(progressBucket(50)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0128 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_12900
     * @tc.name      testProgressGrid0129
     * @tc.desc      Verify progressBucket(74) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0129 begin');
      await delayTick();
      expect(progressBucket(74)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0129 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13000
     * @tc.name      testProgressGrid0130
     * @tc.desc      Verify progressBucket(75) returns 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0130 begin');
      await delayTick();
      expect(progressBucket(75)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0130 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13100
     * @tc.name      testProgressGrid0131
     * @tc.desc      Verify progressBucket(99) returns 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0131 begin');
      await delayTick();
      expect(progressBucket(99)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0131 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13200
     * @tc.name      testProgressGrid0132
     * @tc.desc      Verify progressBucket(99.9) returns 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0132 begin');
      await delayTick();
      expect(progressBucket(99.9)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0132 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13300
     * @tc.name      testProgressGrid0133
     * @tc.desc      Verify progressBucket(100) returns 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0133 begin');
      await delayTick();
      expect(progressBucket(100)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0133 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13400
     * @tc.name      testProgressGrid0134
     * @tc.desc      Verify progressBucket(100.1) returns 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0134 begin');
      await delayTick();
      expect(progressBucket(100.1)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0134 end');
    })

  })
}
