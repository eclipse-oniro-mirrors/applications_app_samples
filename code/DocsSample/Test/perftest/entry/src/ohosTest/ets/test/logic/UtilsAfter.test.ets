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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  utilsNumAfter,
} from '../model/PerfTestLogic';

/** UtilsAfterTest logic checks (32 cases). */
export default function utilsAfterTest(): void {
  describe('UtilsAfterTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0001
     * @tc.name      Perf_UtilsAfter_0001
     * @tc.desc      utilsNumAfter(0, 0) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsAfter_0001 begin`);
      logInfo("utilsNumAfter(0, 0)");
      const actual: number = utilsNumAfter(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0002
     * @tc.name      Perf_UtilsAfter_0002
     * @tc.desc      utilsNumAfter(1, 37) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0002 begin`);
      logInfo("utilsNumAfter(1, 37)");
      const actual: number = utilsNumAfter(1, 37);
      logInfo('actual=' + String(actual) + ', expected=' + "37");
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}UtilsAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0003
     * @tc.name      Perf_UtilsAfter_0003
     * @tc.desc      utilsNumAfter(2, 74) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0003 begin`);
      logInfo("utilsNumAfter(2, 74)");
      const actual: number = utilsNumAfter(2, 74);
      logInfo('actual=' + String(actual) + ', expected=' + "148");
      expect(actual).assertEqual(148);
      logInfo(`${BUNDLE}UtilsAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0004
     * @tc.name      Perf_UtilsAfter_0004
     * @tc.desc      utilsNumAfter(3, 111) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0004 begin`);
      logInfo("utilsNumAfter(3, 111)");
      const actual: number = utilsNumAfter(3, 111);
      logInfo('actual=' + String(actual) + ', expected=' + "333");
      expect(actual).assertEqual(333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0005
     * @tc.name      Perf_UtilsAfter_0005
     * @tc.desc      utilsNumAfter(4, 148) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0005 begin`);
      logInfo("utilsNumAfter(4, 148)");
      const actual: number = utilsNumAfter(4, 148);
      logInfo('actual=' + String(actual) + ', expected=' + "592");
      expect(actual).assertEqual(592);
      logInfo(`${BUNDLE}UtilsAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0006
     * @tc.name      Perf_UtilsAfter_0006
     * @tc.desc      utilsNumAfter(5, 185) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0006 begin`);
      logInfo("utilsNumAfter(5, 185)");
      const actual: number = utilsNumAfter(5, 185);
      logInfo('actual=' + String(actual) + ', expected=' + "925");
      expect(actual).assertEqual(925);
      logInfo(`${BUNDLE}UtilsAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0007
     * @tc.name      Perf_UtilsAfter_0007
     * @tc.desc      utilsNumAfter(6, 222) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0007 begin`);
      logInfo("utilsNumAfter(6, 222)");
      const actual: number = utilsNumAfter(6, 222);
      logInfo('actual=' + String(actual) + ', expected=' + "1332");
      expect(actual).assertEqual(1332);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0008
     * @tc.name      Perf_UtilsAfter_0008
     * @tc.desc      utilsNumAfter(7, 259) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0008 begin`);
      logInfo("utilsNumAfter(7, 259)");
      const actual: number = utilsNumAfter(7, 259);
      logInfo('actual=' + String(actual) + ', expected=' + "1813");
      expect(actual).assertEqual(1813);
      logInfo(`${BUNDLE}UtilsAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0009
     * @tc.name      Perf_UtilsAfter_0009
     * @tc.desc      utilsNumAfter(8, 296) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0009 begin`);
      logInfo("utilsNumAfter(8, 296)");
      const actual: number = utilsNumAfter(8, 296);
      logInfo('actual=' + String(actual) + ', expected=' + "2368");
      expect(actual).assertEqual(2368);
      logInfo(`${BUNDLE}UtilsAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0010
     * @tc.name      Perf_UtilsAfter_0010
     * @tc.desc      utilsNumAfter(0, 333) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0010 begin`);
      logInfo("utilsNumAfter(0, 333)");
      const actual: number = utilsNumAfter(0, 333);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0011
     * @tc.name      Perf_UtilsAfter_0011
     * @tc.desc      utilsNumAfter(1, 370) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0011 begin`);
      logInfo("utilsNumAfter(1, 370)");
      const actual: number = utilsNumAfter(1, 370);
      logInfo('actual=' + String(actual) + ', expected=' + "370");
      expect(actual).assertEqual(370);
      logInfo(`${BUNDLE}UtilsAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0012
     * @tc.name      Perf_UtilsAfter_0012
     * @tc.desc      utilsNumAfter(2, 407) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsAfter_0012 begin`);
      logInfo("utilsNumAfter(2, 407)");
      const actual: number = utilsNumAfter(2, 407);
      logInfo('actual=' + String(actual) + ', expected=' + "814");
      expect(actual).assertEqual(814);
      logInfo(`${BUNDLE}UtilsAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0013
     * @tc.name      Perf_UtilsAfter_0013
     * @tc.desc      utilsNumAfter(3, 444) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0013 begin`);
      logInfo("utilsNumAfter(3, 444)");
      const actual: number = utilsNumAfter(3, 444);
      logInfo('actual=' + String(actual) + ', expected=' + "1332");
      expect(actual).assertEqual(1332);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0014
     * @tc.name      Perf_UtilsAfter_0014
     * @tc.desc      utilsNumAfter(4, 481) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0014 begin`);
      logInfo("utilsNumAfter(4, 481)");
      const actual: number = utilsNumAfter(4, 481);
      logInfo('actual=' + String(actual) + ', expected=' + "1924");
      expect(actual).assertEqual(1924);
      logInfo(`${BUNDLE}UtilsAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0015
     * @tc.name      Perf_UtilsAfter_0015
     * @tc.desc      utilsNumAfter(5, 518) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0015 begin`);
      logInfo("utilsNumAfter(5, 518)");
      const actual: number = utilsNumAfter(5, 518);
      logInfo('actual=' + String(actual) + ', expected=' + "2590");
      expect(actual).assertEqual(2590);
      logInfo(`${BUNDLE}UtilsAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0016
     * @tc.name      Perf_UtilsAfter_0016
     * @tc.desc      utilsNumAfter(6, 555) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0016 begin`);
      logInfo("utilsNumAfter(6, 555)");
      const actual: number = utilsNumAfter(6, 555);
      logInfo('actual=' + String(actual) + ', expected=' + "3330");
      expect(actual).assertEqual(3330);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0017
     * @tc.name      Perf_UtilsAfter_0017
     * @tc.desc      utilsNumAfter(7, 592) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0017 begin`);
      logInfo("utilsNumAfter(7, 592)");
      const actual: number = utilsNumAfter(7, 592);
      logInfo('actual=' + String(actual) + ', expected=' + "4144");
      expect(actual).assertEqual(4144);
      logInfo(`${BUNDLE}UtilsAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0018
     * @tc.name      Perf_UtilsAfter_0018
     * @tc.desc      utilsNumAfter(8, 629) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsAfter_0018 begin`);
      logInfo("utilsNumAfter(8, 629)");
      const actual: number = utilsNumAfter(8, 629);
      logInfo('actual=' + String(actual) + ', expected=' + "5032");
      expect(actual).assertEqual(5032);
      logInfo(`${BUNDLE}UtilsAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0019
     * @tc.name      Perf_UtilsAfter_0019
     * @tc.desc      utilsNumAfter(0, 666) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0019 begin`);
      logInfo("utilsNumAfter(0, 666)");
      const actual: number = utilsNumAfter(0, 666);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0020
     * @tc.name      Perf_UtilsAfter_0020
     * @tc.desc      utilsNumAfter(1, 703) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0020 begin`);
      logInfo("utilsNumAfter(1, 703)");
      const actual: number = utilsNumAfter(1, 703);
      logInfo('actual=' + String(actual) + ', expected=' + "703");
      expect(actual).assertEqual(703);
      logInfo(`${BUNDLE}UtilsAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0021
     * @tc.name      Perf_UtilsAfter_0021
     * @tc.desc      utilsNumAfter(2, 740) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0021 begin`);
      logInfo("utilsNumAfter(2, 740)");
      const actual: number = utilsNumAfter(2, 740);
      logInfo('actual=' + String(actual) + ', expected=' + "1480");
      expect(actual).assertEqual(1480);
      logInfo(`${BUNDLE}UtilsAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0022
     * @tc.name      Perf_UtilsAfter_0022
     * @tc.desc      utilsNumAfter(3, 777) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0022 begin`);
      logInfo("utilsNumAfter(3, 777)");
      const actual: number = utilsNumAfter(3, 777);
      logInfo('actual=' + String(actual) + ', expected=' + "2331");
      expect(actual).assertEqual(2331);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0023
     * @tc.name      Perf_UtilsAfter_0023
     * @tc.desc      utilsNumAfter(4, 814) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsAfter_0023 begin`);
      logInfo("utilsNumAfter(4, 814)");
      const actual: number = utilsNumAfter(4, 814);
      logInfo('actual=' + String(actual) + ', expected=' + "3256");
      expect(actual).assertEqual(3256);
      logInfo(`${BUNDLE}UtilsAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0024
     * @tc.name      Perf_UtilsAfter_0024
     * @tc.desc      utilsNumAfter(5, 851) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0024 begin`);
      logInfo("utilsNumAfter(5, 851)");
      const actual: number = utilsNumAfter(5, 851);
      logInfo('actual=' + String(actual) + ', expected=' + "4255");
      expect(actual).assertEqual(4255);
      logInfo(`${BUNDLE}UtilsAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0025
     * @tc.name      Perf_UtilsAfter_0025
     * @tc.desc      utilsNumAfter(6, 888) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0025 begin`);
      logInfo("utilsNumAfter(6, 888)");
      const actual: number = utilsNumAfter(6, 888);
      logInfo('actual=' + String(actual) + ', expected=' + "5328");
      expect(actual).assertEqual(5328);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0026
     * @tc.name      Perf_UtilsAfter_0026
     * @tc.desc      utilsNumAfter(7, 925) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0026 begin`);
      logInfo("utilsNumAfter(7, 925)");
      const actual: number = utilsNumAfter(7, 925);
      logInfo('actual=' + String(actual) + ', expected=' + "6475");
      expect(actual).assertEqual(6475);
      logInfo(`${BUNDLE}UtilsAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0027
     * @tc.name      Perf_UtilsAfter_0027
     * @tc.desc      utilsNumAfter(8, 962) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0027 begin`);
      logInfo("utilsNumAfter(8, 962)");
      const actual: number = utilsNumAfter(8, 962);
      logInfo('actual=' + String(actual) + ', expected=' + "7696");
      expect(actual).assertEqual(7696);
      logInfo(`${BUNDLE}UtilsAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0028
     * @tc.name      Perf_UtilsAfter_0028
     * @tc.desc      utilsNumAfter(0, 999) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0028 begin`);
      logInfo("utilsNumAfter(0, 999)");
      const actual: number = utilsNumAfter(0, 999);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0029
     * @tc.name      Perf_UtilsAfter_0029
     * @tc.desc      utilsNumAfter(1, 1036) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0029 begin`);
      logInfo("utilsNumAfter(1, 1036)");
      const actual: number = utilsNumAfter(1, 1036);
      logInfo('actual=' + String(actual) + ', expected=' + "1036");
      expect(actual).assertEqual(1036);
      logInfo(`${BUNDLE}UtilsAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0030
     * @tc.name      Perf_UtilsAfter_0030
     * @tc.desc      utilsNumAfter(2, 1073) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0030 begin`);
      logInfo("utilsNumAfter(2, 1073)");
      const actual: number = utilsNumAfter(2, 1073);
      logInfo('actual=' + String(actual) + ', expected=' + "2146");
      expect(actual).assertEqual(2146);
      logInfo(`${BUNDLE}UtilsAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0031
     * @tc.name      Perf_UtilsAfter_0031
     * @tc.desc      utilsNumAfter(3, 1110) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0031 begin`);
      logInfo("utilsNumAfter(3, 1110)");
      const actual: number = utilsNumAfter(3, 1110);
      logInfo('actual=' + String(actual) + ', expected=' + "3330");
      expect(actual).assertEqual(3330);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UtilsAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_AFTER_0032
     * @tc.name      Perf_UtilsAfter_0032
     * @tc.desc      utilsNumAfter(4, 1147) accumulates the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsAfter_0032 begin`);
      logInfo("utilsNumAfter(4, 1147)");
      const actual: number = utilsNumAfter(4, 1147);
      logInfo('actual=' + String(actual) + ', expected=' + "4588");
      expect(actual).assertEqual(4588);
      logInfo(`${BUNDLE}UtilsAfter_0032 end`);
    });
  });
}
