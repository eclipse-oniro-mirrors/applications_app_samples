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
import { formatBytes, formatDuration, formatPercent, truncateMiddle, formatDateTime } from '../../../main/ets/utils/FormatUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function FormatUtilExtraMatrixPart2Test(): void {
  describe('FormatUtilExtraMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4100
     * @tc.name      testTruncate0041
     * @tc.desc      Verify truncateMiddle(abcdefgh, 6) returns abc…gh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0041 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 6)).assertEqual('abc…gh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4200
     * @tc.name      testTruncate0042
     * @tc.desc      Verify truncateMiddle(abcdefgh, 8) returns abcdefgh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0042 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 8)).assertEqual('abcdefgh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4300
     * @tc.name      testTruncate0043
     * @tc.desc      Verify truncateMiddle(1234567890, 0) returns 1234567890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0043 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 0)).assertEqual('1234567890');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4400
     * @tc.name      testTruncate0044
     * @tc.desc      Verify truncateMiddle(1234567890, 1) returns 1234567890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0044 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 1)).assertEqual('1234567890');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4500
     * @tc.name      testTruncate0045
     * @tc.desc      Verify truncateMiddle(1234567890, 2) returns 1234567890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0045 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 2)).assertEqual('1234567890');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4600
     * @tc.name      testTruncate0046
     * @tc.desc      Verify truncateMiddle(1234567890, 3) returns 1234567890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0046 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 3)).assertEqual('1234567890');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4700
     * @tc.name      testTruncate0047
     * @tc.desc      Verify truncateMiddle(1234567890, 4) returns 12…0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0047 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 4)).assertEqual('12…0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4800
     * @tc.name      testTruncate0048
     * @tc.desc      Verify truncateMiddle(1234567890, 5) returns 12…90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0048 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 5)).assertEqual('12…90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0048 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_4900
     * @tc.name      testTruncate0049
     * @tc.desc      Verify truncateMiddle(1234567890, 6) returns 123…90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0049 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 6)).assertEqual('123…90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0049 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5000
     * @tc.name      testTruncate0050
     * @tc.desc      Verify truncateMiddle(1234567890, 8) returns 1234…890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0050 begin');
      await delayTick();
      expect(truncateMiddle('1234567890', 8)).assertEqual('1234…890');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0050 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5100
     * @tc.name      testTruncate0051
     * @tc.desc      Verify truncateMiddle(short, 0) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0051 begin');
      await delayTick();
      expect(truncateMiddle('short', 0)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0051 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5200
     * @tc.name      testTruncate0052
     * @tc.desc      Verify truncateMiddle(short, 1) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0052 begin');
      await delayTick();
      expect(truncateMiddle('short', 1)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0052 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5300
     * @tc.name      testTruncate0053
     * @tc.desc      Verify truncateMiddle(short, 2) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0053 begin');
      await delayTick();
      expect(truncateMiddle('short', 2)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0053 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5400
     * @tc.name      testTruncate0054
     * @tc.desc      Verify truncateMiddle(short, 3) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0054 begin');
      await delayTick();
      expect(truncateMiddle('short', 3)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0054 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5500
     * @tc.name      testTruncate0055
     * @tc.desc      Verify truncateMiddle(short, 4) returns sh…t.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0055 begin');
      await delayTick();
      expect(truncateMiddle('short', 4)).assertEqual('sh…t');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0055 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5600
     * @tc.name      testTruncate0056
     * @tc.desc      Verify truncateMiddle(short, 5) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0056 begin');
      await delayTick();
      expect(truncateMiddle('short', 5)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0056 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5700
     * @tc.name      testTruncate0057
     * @tc.desc      Verify truncateMiddle(short, 6) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0057 begin');
      await delayTick();
      expect(truncateMiddle('short', 6)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0057 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5800
     * @tc.name      testTruncate0058
     * @tc.desc      Verify truncateMiddle(short, 8) returns short.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0058 begin');
      await delayTick();
      expect(truncateMiddle('short', 8)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0058 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_5900
     * @tc.name      testDateTime0059
     * @tc.desc      Verify formatDateTime for 2026-01-01 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0059 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 0, 1, 3, 4, 5))).assertEqual('2026-01-01 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0059 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6000
     * @tc.name      testDateTime0060
     * @tc.desc      Verify formatDateTime for 2026-01-09 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0060 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 0, 9, 3, 4, 5))).assertEqual('2026-01-09 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0060 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6100
     * @tc.name      testDateTime0061
     * @tc.desc      Verify formatDateTime for 2026-01-10 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0061 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 0, 10, 3, 4, 5))).assertEqual('2026-01-10 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0061 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6200
     * @tc.name      testDateTime0062
     * @tc.desc      Verify formatDateTime for 2026-01-28 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0062 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 0, 28, 3, 4, 5))).assertEqual('2026-01-28 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0062 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6300
     * @tc.name      testDateTime0063
     * @tc.desc      Verify formatDateTime for 2026-02-01 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0063 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 1, 1, 3, 4, 5))).assertEqual('2026-02-01 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0063 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6400
     * @tc.name      testDateTime0064
     * @tc.desc      Verify formatDateTime for 2026-02-09 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0064 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 1, 9, 3, 4, 5))).assertEqual('2026-02-09 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0064 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6500
     * @tc.name      testDateTime0065
     * @tc.desc      Verify formatDateTime for 2026-02-10 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0065 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 1, 10, 3, 4, 5))).assertEqual('2026-02-10 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0065 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6600
     * @tc.name      testDateTime0066
     * @tc.desc      Verify formatDateTime for 2026-02-28 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0066 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 1, 28, 3, 4, 5))).assertEqual('2026-02-28 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0066 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6700
     * @tc.name      testDateTime0067
     * @tc.desc      Verify formatDateTime for 2026-06-01 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0067 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 5, 1, 3, 4, 5))).assertEqual('2026-06-01 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0067 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6800
     * @tc.name      testDateTime0068
     * @tc.desc      Verify formatDateTime for 2026-06-09 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0068 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 5, 9, 3, 4, 5))).assertEqual('2026-06-09 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0068 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_6900
     * @tc.name      testDateTime0069
     * @tc.desc      Verify formatDateTime for 2026-06-10 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0069 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 5, 10, 3, 4, 5))).assertEqual('2026-06-10 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0069 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_7000
     * @tc.name      testDateTime0070
     * @tc.desc      Verify formatDateTime for 2026-06-28 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0070 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 5, 28, 3, 4, 5))).assertEqual('2026-06-28 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0070 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_7100
     * @tc.name      testDateTime0071
     * @tc.desc      Verify formatDateTime for 2026-12-01 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0071 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 11, 1, 3, 4, 5))).assertEqual('2026-12-01 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0071 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_7200
     * @tc.name      testDateTime0072
     * @tc.desc      Verify formatDateTime for 2026-12-09 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0072 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 11, 9, 3, 4, 5))).assertEqual('2026-12-09 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0072 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_7300
     * @tc.name      testDateTime0073
     * @tc.desc      Verify formatDateTime for 2026-12-10 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0073 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 11, 10, 3, 4, 5))).assertEqual('2026-12-10 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0073 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP2_7400
     * @tc.name      testDateTime0074
     * @tc.desc      Verify formatDateTime for 2026-12-28 03:04:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateTime0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0074 begin');
      await delayTick();
      expect(formatDateTime(new Date(2026, 11, 28, 3, 4, 5))).assertEqual('2026-12-28 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateTime0074 end');
    })

  })
}
