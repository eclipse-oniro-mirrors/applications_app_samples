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

export default function FormatUtilExtraMatrixPart1Test(): void {
  describe('FormatUtilExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0100
     * @tc.name      testBytes0001
     * @tc.desc      Verify formatBytes(0) returns 0 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0001 begin');
      await delayTick();
      expect(formatBytes(0)).assertEqual('0 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0200
     * @tc.name      testBytes0002
     * @tc.desc      Verify formatBytes(1) returns 1 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0002 begin');
      await delayTick();
      expect(formatBytes(1)).assertEqual('1 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0300
     * @tc.name      testBytes0003
     * @tc.desc      Verify formatBytes(1023) returns 1023 B.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0003 begin');
      await delayTick();
      expect(formatBytes(1023)).assertEqual('1023 B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0400
     * @tc.name      testBytes0004
     * @tc.desc      Verify formatBytes(1024) returns 1.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0004 begin');
      await delayTick();
      expect(formatBytes(1024)).assertEqual('1.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0500
     * @tc.name      testBytes0005
     * @tc.desc      Verify formatBytes(1536) returns 1.5 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0005 begin');
      await delayTick();
      expect(formatBytes(1536)).assertEqual('1.5 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0600
     * @tc.name      testBytes0006
     * @tc.desc      Verify formatBytes(1048575) returns 1024.0 KB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0006 begin');
      await delayTick();
      expect(formatBytes(1048575)).assertEqual('1024.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0700
     * @tc.name      testBytes0007
     * @tc.desc      Verify formatBytes(1048576) returns 1.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0007 begin');
      await delayTick();
      expect(formatBytes(1048576)).assertEqual('1.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0800
     * @tc.name      testBytes0008
     * @tc.desc      Verify formatBytes(1572864) returns 1.5 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0008 begin');
      await delayTick();
      expect(formatBytes(1572864)).assertEqual('1.5 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_0900
     * @tc.name      testBytes0009
     * @tc.desc      Verify formatBytes(1073741824) returns 1024.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0009 begin');
      await delayTick();
      expect(formatBytes(1073741824)).assertEqual('1024.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1000
     * @tc.name      testBytes0010
     * @tc.desc      Verify formatBytes(2684354560) returns 2560.0 MB.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0010 begin');
      await delayTick();
      expect(formatBytes(2684354560)).assertEqual('2560.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytes0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1100
     * @tc.name      testDuration0011
     * @tc.desc      Verify formatDuration(-1) returns 0 ms.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0011 begin');
      await delayTick();
      expect(formatDuration(-1)).assertEqual('0 ms');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1200
     * @tc.name      testDuration0012
     * @tc.desc      Verify formatDuration(0) returns 0 ms.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0012 begin');
      await delayTick();
      expect(formatDuration(0)).assertEqual('0 ms');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1300
     * @tc.name      testDuration0013
     * @tc.desc      Verify formatDuration(1) returns 1 ms.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0013 begin');
      await delayTick();
      expect(formatDuration(1)).assertEqual('1 ms');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1400
     * @tc.name      testDuration0014
     * @tc.desc      Verify formatDuration(999) returns 999 ms.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0014 begin');
      await delayTick();
      expect(formatDuration(999)).assertEqual('999 ms');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1500
     * @tc.name      testDuration0015
     * @tc.desc      Verify formatDuration(1000) returns 1.0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0015 begin');
      await delayTick();
      expect(formatDuration(1000)).assertEqual('1.0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1600
     * @tc.name      testDuration0016
     * @tc.desc      Verify formatDuration(1500) returns 1.5 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0016 begin');
      await delayTick();
      expect(formatDuration(1500)).assertEqual('1.5 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1700
     * @tc.name      testDuration0017
     * @tc.desc      Verify formatDuration(59999) returns 60.0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0017 begin');
      await delayTick();
      expect(formatDuration(59999)).assertEqual('60.0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1800
     * @tc.name      testDuration0018
     * @tc.desc      Verify formatDuration(60000) returns 1 min 0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0018 begin');
      await delayTick();
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_1900
     * @tc.name      testDuration0019
     * @tc.desc      Verify formatDuration(61000) returns 1 min 1 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0019 begin');
      await delayTick();
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2000
     * @tc.name      testDuration0020
     * @tc.desc      Verify formatDuration(3599999) returns 59 min 59 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0020 begin');
      await delayTick();
      expect(formatDuration(3599999)).assertEqual('59 min 59 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2100
     * @tc.name      testDuration0021
     * @tc.desc      Verify formatDuration(3600000) returns 60 min 0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0021 begin');
      await delayTick();
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2200
     * @tc.name      testDuration0022
     * @tc.desc      Verify formatDuration(86400000) returns 1440 min 0 s.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuration0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0022 begin');
      await delayTick();
      expect(formatDuration(86400000)).assertEqual('1440 min 0 s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuration0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2300
     * @tc.name      testPercent0023
     * @tc.desc      Verify formatPercent(0, 0) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0023 begin');
      await delayTick();
      expect(formatPercent(0, 0)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2400
     * @tc.name      testPercent0024
     * @tc.desc      Verify formatPercent(1, 0) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0024 begin');
      await delayTick();
      expect(formatPercent(1, 0)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2500
     * @tc.name      testPercent0025
     * @tc.desc      Verify formatPercent(0, 100) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0025 begin');
      await delayTick();
      expect(formatPercent(0, 100)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2600
     * @tc.name      testPercent0026
     * @tc.desc      Verify formatPercent(50, 100) returns 50%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0026 begin');
      await delayTick();
      expect(formatPercent(50, 100)).assertEqual('50%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2700
     * @tc.name      testPercent0027
     * @tc.desc      Verify formatPercent(99, 100) returns 99%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0027 begin');
      await delayTick();
      expect(formatPercent(99, 100)).assertEqual('99%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2800
     * @tc.name      testPercent0028
     * @tc.desc      Verify formatPercent(1, 3) returns 33%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0028 begin');
      await delayTick();
      expect(formatPercent(1, 3)).assertEqual('33%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_2900
     * @tc.name      testPercent0029
     * @tc.desc      Verify formatPercent(2, 3) returns 67%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0029 begin');
      await delayTick();
      expect(formatPercent(2, 3)).assertEqual('67%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3000
     * @tc.name      testPercent0030
     * @tc.desc      Verify formatPercent(3, 7) returns 43%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0030 begin');
      await delayTick();
      expect(formatPercent(3, 7)).assertEqual('43%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3100
     * @tc.name      testPercent0031
     * @tc.desc      Verify formatPercent(-5, 100) returns 0%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0031 begin');
      await delayTick();
      expect(formatPercent(-5, 100)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3200
     * @tc.name      testPercent0032
     * @tc.desc      Verify formatPercent(105, 100) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0032 begin');
      await delayTick();
      expect(formatPercent(105, 100)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3300
     * @tc.name      testPercent0033
     * @tc.desc      Verify formatPercent(1, 200) returns 1%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0033 begin');
      await delayTick();
      expect(formatPercent(1, 200)).assertEqual('1%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3400
     * @tc.name      testPercent0034
     * @tc.desc      Verify formatPercent(200, 100) returns 100%.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPercent0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0034 begin');
      await delayTick();
      expect(formatPercent(200, 100)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercent0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3500
     * @tc.name      testTruncate0035
     * @tc.desc      Verify truncateMiddle(abcdefgh, 0) returns abcdefgh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0035 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 0)).assertEqual('abcdefgh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3600
     * @tc.name      testTruncate0036
     * @tc.desc      Verify truncateMiddle(abcdefgh, 1) returns abcdefgh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0036 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 1)).assertEqual('abcdefgh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3700
     * @tc.name      testTruncate0037
     * @tc.desc      Verify truncateMiddle(abcdefgh, 2) returns abcdefgh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0037 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 2)).assertEqual('abcdefgh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3800
     * @tc.name      testTruncate0038
     * @tc.desc      Verify truncateMiddle(abcdefgh, 3) returns abcdefgh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0038 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 3)).assertEqual('abcdefgh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_3900
     * @tc.name      testTruncate0039
     * @tc.desc      Verify truncateMiddle(abcdefgh, 4) returns ab…h.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0039 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 4)).assertEqual('ab…h');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_FEXP1_4000
     * @tc.name      testTruncate0040
     * @tc.desc      Verify truncateMiddle(abcdefgh, 5) returns ab…gh.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTruncate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0040 begin');
      await delayTick();
      expect(truncateMiddle('abcdefgh', 5)).assertEqual('ab…gh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTruncate0040 end');
    })

  })
}
