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
  durationBetween,
} from '../model/PerfTestLogic';

/** DurationBetweenTest logic checks (32 cases). */
export default function durationBetweenTest(): void {
  describe('DurationBetweenTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_DURATION_0001
     * @tc.name      Perf_Duration_0001
     * @tc.desc      durationBetween(0, 0) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Duration_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Duration_0001 begin`);
      logInfo("durationBetween(0, 0)");
      const actual: number = durationBetween(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0002
     * @tc.name      Perf_Duration_0002
     * @tc.desc      durationBetween(10, 7) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0002 begin`);
      logInfo("durationBetween(10, 7)");
      const actual: number = durationBetween(10, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0003
     * @tc.name      Perf_Duration_0003
     * @tc.desc      durationBetween(20, 14) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0003 begin`);
      logInfo("durationBetween(20, 14)");
      const actual: number = durationBetween(20, 14);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0004
     * @tc.name      Perf_Duration_0004
     * @tc.desc      durationBetween(30, 21) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0004 begin`);
      logInfo("durationBetween(30, 21)");
      const actual: number = durationBetween(30, 21);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0005
     * @tc.name      Perf_Duration_0005
     * @tc.desc      durationBetween(40, 28) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0005 begin`);
      logInfo("durationBetween(40, 28)");
      const actual: number = durationBetween(40, 28);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0006
     * @tc.name      Perf_Duration_0006
     * @tc.desc      durationBetween(50, 35) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0006 begin`);
      logInfo("durationBetween(50, 35)");
      const actual: number = durationBetween(50, 35);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0007
     * @tc.name      Perf_Duration_0007
     * @tc.desc      durationBetween(60, 42) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0007 begin`);
      logInfo("durationBetween(60, 42)");
      const actual: number = durationBetween(60, 42);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0008
     * @tc.name      Perf_Duration_0008
     * @tc.desc      durationBetween(70, 49) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0008 begin`);
      logInfo("durationBetween(70, 49)");
      const actual: number = durationBetween(70, 49);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0009
     * @tc.name      Perf_Duration_0009
     * @tc.desc      durationBetween(80, 56) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0009 begin`);
      logInfo("durationBetween(80, 56)");
      const actual: number = durationBetween(80, 56);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0010
     * @tc.name      Perf_Duration_0010
     * @tc.desc      durationBetween(90, 63) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0010 begin`);
      logInfo("durationBetween(90, 63)");
      const actual: number = durationBetween(90, 63);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0011
     * @tc.name      Perf_Duration_0011
     * @tc.desc      durationBetween(100, 70) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0011 begin`);
      logInfo("durationBetween(100, 70)");
      const actual: number = durationBetween(100, 70);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0012
     * @tc.name      Perf_Duration_0012
     * @tc.desc      durationBetween(110, 77) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Duration_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Duration_0012 begin`);
      logInfo("durationBetween(110, 77)");
      const actual: number = durationBetween(110, 77);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0013
     * @tc.name      Perf_Duration_0013
     * @tc.desc      durationBetween(120, 84) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0013 begin`);
      logInfo("durationBetween(120, 84)");
      const actual: number = durationBetween(120, 84);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0014
     * @tc.name      Perf_Duration_0014
     * @tc.desc      durationBetween(130, 91) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0014 begin`);
      logInfo("durationBetween(130, 91)");
      const actual: number = durationBetween(130, 91);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0015
     * @tc.name      Perf_Duration_0015
     * @tc.desc      durationBetween(140, 98) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0015 begin`);
      logInfo("durationBetween(140, 98)");
      const actual: number = durationBetween(140, 98);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0016
     * @tc.name      Perf_Duration_0016
     * @tc.desc      durationBetween(150, 105) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0016 begin`);
      logInfo("durationBetween(150, 105)");
      const actual: number = durationBetween(150, 105);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0017
     * @tc.name      Perf_Duration_0017
     * @tc.desc      durationBetween(160, 112) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0017 begin`);
      logInfo("durationBetween(160, 112)");
      const actual: number = durationBetween(160, 112);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0018
     * @tc.name      Perf_Duration_0018
     * @tc.desc      durationBetween(170, 119) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Duration_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Duration_0018 begin`);
      logInfo("durationBetween(170, 119)");
      const actual: number = durationBetween(170, 119);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Duration_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0019
     * @tc.name      Perf_Duration_0019
     * @tc.desc      durationBetween(180, 126) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Duration_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Duration_0019 begin`);
      logInfo("durationBetween(180, 126)");
      const actual: number = durationBetween(180, 126);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Duration_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_DURATION_0020
     * @tc.name      Perf_Duration_0020
     * @tc.desc      durationBetween(190, 133) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
