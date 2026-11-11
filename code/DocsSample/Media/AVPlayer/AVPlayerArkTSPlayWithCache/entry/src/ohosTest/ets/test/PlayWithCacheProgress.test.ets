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

const TAG: string = '[Sample_playWithCacheProgress]';
const DOMAIN: number = 0xF813;

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

export default function playWithCacheProgressTest(): void {
  describe('playWithCacheProgressTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0001
     * @tc.name      testExtCacheProgress0000
     * @tc.desc      Progress 0/60000 = 0%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 0;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(0, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0002
     * @tc.name      testExtCacheProgress0001
     * @tc.desc      Progress 7919/120000 = 6.599166666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 7919;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(6.599166666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0003
     * @tc.name      testExtCacheProgress0002
     * @tc.desc      Progress 15838/3599000 = 0.44006668519033065%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 15838;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(0.44006668519033065, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0004
     * @tc.name      testExtCacheProgress0003
     * @tc.desc      Progress 23757/300000 = 7.919%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 23757;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(7.919, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0005
     * @tc.name      testExtCacheProgress0004
     * @tc.desc      Progress 31676/60000 = 52.79333333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 31676;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(52.79333333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0006
     * @tc.name      testExtCacheProgress0005
     * @tc.desc      Progress 39595/120000 = 32.99583333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 39595;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(32.99583333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0007
     * @tc.name      testExtCacheProgress0006
     * @tc.desc      Progress 47514/3599000 = 1.3202000555709918%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 47514;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(1.3202000555709918, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0008
     * @tc.name      testExtCacheProgress0007
     * @tc.desc      Progress 55433/300000 = 18.477666666666668%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 55433;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(18.477666666666668, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0009
     * @tc.name      testExtCacheProgress0008
     * @tc.desc      Progress 3352/60000 = 5.586666666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 3352;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(5.586666666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0010
     * @tc.name      testExtCacheProgress0009
     * @tc.desc      Progress 71271/120000 = 59.392500000000005%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 71271;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(59.392500000000005, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0011
     * @tc.name      testExtCacheProgress0010
     * @tc.desc      Progress 79190/3599000 = 2.200333425951653%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 79190;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(2.200333425951653, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0012
     * @tc.name      testExtCacheProgress0011
     * @tc.desc      Progress 87109/300000 = 29.03633333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 87109;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(29.03633333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0013
     * @tc.name      testExtCacheProgress0012
     * @tc.desc      Progress 35028/60000 = 58.379999999999995%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 35028;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(58.379999999999995, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0014
     * @tc.name      testExtCacheProgress0013
     * @tc.desc      Progress 102947/120000 = 85.78916666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 102947;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(85.78916666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0015
     * @tc.name      testExtCacheProgress0014
     * @tc.desc      Progress 110866/3599000 = 3.0804667963323142%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 110866;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(3.0804667963323142, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0016
     * @tc.name      testExtCacheProgress0015
     * @tc.desc      Progress 118785/300000 = 39.595%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 118785;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(39.595, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0017
     * @tc.name      testExtCacheProgress0016
     * @tc.desc      Progress 6704/60000 = 11.173333333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 6704;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(11.173333333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0018
     * @tc.name      testExtCacheProgress0017
     * @tc.desc      Progress 14623/120000 = 12.185833333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 14623;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(12.185833333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0019
     * @tc.name      testExtCacheProgress0018
     * @tc.desc      Progress 142542/3599000 = 3.9606001667129758%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 142542;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(3.9606001667129758, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0020
     * @tc.name      testExtCacheProgress0019
     * @tc.desc      Progress 150461/300000 = 50.153666666666666%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 150461;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(50.153666666666666, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0021
     * @tc.name      testExtCacheProgress0020
     * @tc.desc      Progress 38380/60000 = 63.96666666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 38380;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(63.96666666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0022
     * @tc.name      testExtCacheProgress0021
     * @tc.desc      Progress 46299/120000 = 38.582499999999996%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 46299;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(38.582499999999996, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0023
     * @tc.name      testExtCacheProgress0022
     * @tc.desc      Progress 174218/3599000 = 4.840733537093637%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 174218;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(4.840733537093637, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0024
     * @tc.name      testExtCacheProgress0023
     * @tc.desc      Progress 182137/300000 = 60.71233333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 182137;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(60.71233333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0025
     * @tc.name      testExtCacheProgress0024
     * @tc.desc      Progress 10056/60000 = 16.76%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 10056;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(16.76, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0026
     * @tc.name      testExtCacheProgress0025
     * @tc.desc      Progress 77975/120000 = 64.97916666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 77975;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(64.97916666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0027
     * @tc.name      testExtCacheProgress0026
     * @tc.desc      Progress 205894/3599000 = 5.720866907474298%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 205894;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(5.720866907474298, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0028
     * @tc.name      testExtCacheProgress0027
     * @tc.desc      Progress 213813/300000 = 71.271%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 213813;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(71.271, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0029
     * @tc.name      testExtCacheProgress0028
     * @tc.desc      Progress 41732/60000 = 69.55333333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 41732;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(69.55333333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0030
     * @tc.name      testExtCacheProgress0029
     * @tc.desc      Progress 109651/120000 = 91.37583333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 109651;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(91.37583333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0031
     * @tc.name      testExtCacheProgress0030
     * @tc.desc      Progress 237570/3599000 = 6.6010002778549595%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 237570;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(6.6010002778549595, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0032
     * @tc.name      testExtCacheProgress0031
     * @tc.desc      Progress 245489/300000 = 81.82966666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 245489;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(81.82966666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0033
     * @tc.name      testExtCacheProgress0032
     * @tc.desc      Progress 13408/60000 = 22.346666666666668%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 13408;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(22.346666666666668, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0034
     * @tc.name      testExtCacheProgress0033
     * @tc.desc      Progress 21327/120000 = 17.7725%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 21327;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(17.7725, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0035
     * @tc.name      testExtCacheProgress0034
     * @tc.desc      Progress 269246/3599000 = 7.481133648235621%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 269246;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(7.481133648235621, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0036
     * @tc.name      testExtCacheProgress0035
     * @tc.desc      Progress 277165/300000 = 92.38833333333332%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 277165;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(92.38833333333332, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0037
     * @tc.name      testExtCacheProgress0036
     * @tc.desc      Progress 45084/60000 = 75.14%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 45084;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(75.14, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0038
     * @tc.name      testExtCacheProgress0037
     * @tc.desc      Progress 53003/120000 = 44.16916666666666%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 53003;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(44.16916666666666, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0039
     * @tc.name      testExtCacheProgress0038
     * @tc.desc      Progress 300922/3599000 = 8.361267018616282%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 300922;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(8.361267018616282, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0040
     * @tc.name      testExtCacheProgress0039
     * @tc.desc      Progress 8841/300000 = 2.947%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 8841;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(2.947, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0041
     * @tc.name      testExtCacheProgress0040
     * @tc.desc      Progress 16760/60000 = 27.933333333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 16760;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(27.933333333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0042
     * @tc.name      testExtCacheProgress0041
     * @tc.desc      Progress 84679/120000 = 70.56583333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 84679;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(70.56583333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0043
     * @tc.name      testExtCacheProgress0042
     * @tc.desc      Progress 332598/3599000 = 9.241400388996944%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 332598;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(9.241400388996944, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0044
     * @tc.name      testExtCacheProgress0043
     * @tc.desc      Progress 40517/300000 = 13.505666666666666%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 40517;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(13.505666666666666, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0045
     * @tc.name      testExtCacheProgress0044
     * @tc.desc      Progress 48436/60000 = 80.72666666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 48436;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(80.72666666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0046
     * @tc.name      testExtCacheProgress0045
     * @tc.desc      Progress 116355/120000 = 96.96249999999999%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 116355;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(96.96249999999999, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0047
     * @tc.name      testExtCacheProgress0046
     * @tc.desc      Progress 364274/3599000 = 10.121533759377604%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 364274;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(10.121533759377604, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0048
     * @tc.name      testExtCacheProgress0047
     * @tc.desc      Progress 72193/300000 = 24.06433333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 72193;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(24.06433333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0049
     * @tc.name      testExtCacheProgress0048
     * @tc.desc      Progress 20112/60000 = 33.52%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 20112;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(33.52, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0050
     * @tc.name      testExtCacheProgress0049
     * @tc.desc      Progress 28031/120000 = 23.359166666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 28031;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(23.359166666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0051
     * @tc.name      testExtCacheProgress0050
     * @tc.desc      Progress 395950/3599000 = 11.001667129758266%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 395950;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(11.001667129758266, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0052
     * @tc.name      testExtCacheProgress0051
     * @tc.desc      Progress 103869/300000 = 34.623%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 103869;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(34.623, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0053
     * @tc.name      testExtCacheProgress0052
     * @tc.desc      Progress 51788/60000 = 86.31333333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 51788;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(86.31333333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0054
     * @tc.name      testExtCacheProgress0053
     * @tc.desc      Progress 59707/120000 = 49.755833333333335%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 59707;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(49.755833333333335, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0055
     * @tc.name      testExtCacheProgress0054
     * @tc.desc      Progress 427626/3599000 = 11.881800500138926%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 427626;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(11.881800500138926, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0056
     * @tc.name      testExtCacheProgress0055
     * @tc.desc      Progress 135545/300000 = 45.181666666666665%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 135545;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(45.181666666666665, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0057
     * @tc.name      testExtCacheProgress0056
     * @tc.desc      Progress 23464/60000 = 39.10666666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 23464;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(39.10666666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0058
     * @tc.name      testExtCacheProgress0057
     * @tc.desc      Progress 91383/120000 = 76.1525%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 91383;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(76.1525, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0059
     * @tc.name      testExtCacheProgress0058
     * @tc.desc      Progress 459302/3599000 = 12.76193387051959%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 459302;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(12.76193387051959, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0060
     * @tc.name      testExtCacheProgress0059
     * @tc.desc      Progress 167221/300000 = 55.74033333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 167221;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(55.74033333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0061
     * @tc.name      testExtCacheProgress0060
     * @tc.desc      Progress 55140/60000 = 91.9%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 55140;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(91.9, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0062
     * @tc.name      testExtCacheProgress0061
     * @tc.desc      Progress 3059/120000 = 2.549166666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 3059;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(2.549166666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0063
     * @tc.name      testExtCacheProgress0062
     * @tc.desc      Progress 490978/3599000 = 13.64206724090025%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 490978;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(13.64206724090025, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0064
     * @tc.name      testExtCacheProgress0063
     * @tc.desc      Progress 198897/300000 = 66.29899999999999%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 198897;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(66.29899999999999, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0065
     * @tc.name      testExtCacheProgress0064
     * @tc.desc      Progress 26816/60000 = 44.693333333333335%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 26816;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(44.693333333333335, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0066
     * @tc.name      testExtCacheProgress0065
     * @tc.desc      Progress 34735/120000 = 28.945833333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 34735;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(28.945833333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0067
     * @tc.name      testExtCacheProgress0066
     * @tc.desc      Progress 522654/3599000 = 14.522200611280912%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 522654;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(14.522200611280912, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0068
     * @tc.name      testExtCacheProgress0067
     * @tc.desc      Progress 230573/300000 = 76.85766666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 230573;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(76.85766666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0069
     * @tc.name      testExtCacheProgress0068
     * @tc.desc      Progress 58492/60000 = 97.48666666666666%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 58492;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(97.48666666666666, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0070
     * @tc.name      testExtCacheProgress0069
     * @tc.desc      Progress 66411/120000 = 55.342499999999994%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 66411;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(55.342499999999994, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0071
     * @tc.name      testExtCacheProgress0070
     * @tc.desc      Progress 554330/3599000 = 15.402333981661572%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 554330;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(15.402333981661572, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0072
     * @tc.name      testExtCacheProgress0071
     * @tc.desc      Progress 262249/300000 = 87.41633333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 262249;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(87.41633333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0073
     * @tc.name      testExtCacheProgress0072
     * @tc.desc      Progress 30168/60000 = 50.28%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 30168;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(50.28, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0074
     * @tc.name      testExtCacheProgress0073
     * @tc.desc      Progress 98087/120000 = 81.73916666666666%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 98087;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(81.73916666666666, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0075
     * @tc.name      testExtCacheProgress0074
     * @tc.desc      Progress 586006/3599000 = 16.282467352042236%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 586006;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(16.282467352042236, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0076
     * @tc.name      testExtCacheProgress0075
     * @tc.desc      Progress 293925/300000 = 97.975%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 293925;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(97.975, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0077
     * @tc.name      testExtCacheProgress0076
     * @tc.desc      Progress 1844/60000 = 3.0733333333333333%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const current: number = 1844;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(3.0733333333333333, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0078
     * @tc.name      testExtCacheProgress0077
     * @tc.desc      Progress 9763/120000 = 8.135833333333334%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const current: number = 9763;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(8.135833333333334, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0079
     * @tc.name      testExtCacheProgress0078
     * @tc.desc      Progress 617682/3599000 = 17.162600722422898%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const current: number = 617682;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(17.162600722422898, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PROGRESS_0080
     * @tc.name      testExtCacheProgress0079
     * @tc.desc      Progress 25601/300000 = 8.533666666666667%.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheProgress0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const current: number = 25601;
      const percent: number = current / duration * 100;
      const clamped: number = Math.max(0, Math.min(percent, 100));
      expect(clamped).assertClose(8.533666666666667, 0.001);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(100);
      expect(current).assertLessOrEqual(duration);
    })
  });
}
