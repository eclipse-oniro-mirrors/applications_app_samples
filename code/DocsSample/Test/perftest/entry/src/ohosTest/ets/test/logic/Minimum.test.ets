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
  minimum,
} from '../model/PerfTestLogic';

/** MinimumTest logic checks (32 cases). */
export default function minimumTest(): void {
  describe('MinimumTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0001
     * @tc.name      Perf_Minimum_0001
     * @tc.desc      minimum([0]) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Minimum_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Minimum_0001 begin`);
      logInfo("minimum([0])");
      const actual: number = minimum([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Minimum_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0002
     * @tc.name      Perf_Minimum_0002
     * @tc.desc      minimum([1,2]) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0002 begin`);
      logInfo("minimum([1,2])");
      const actual: number = minimum([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Minimum_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0003
     * @tc.name      Perf_Minimum_0003
     * @tc.desc      minimum([2,3,5]) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0003 begin`);
      logInfo("minimum([2,3,5])");
      const actual: number = minimum([2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Minimum_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0004
     * @tc.name      Perf_Minimum_0004
     * @tc.desc      minimum([3,5,10,20]) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0004 begin`);
      logInfo("minimum([3,5,10,20])");
      const actual: number = minimum([3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Minimum_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0005
     * @tc.name      Perf_Minimum_0005
     * @tc.desc      minimum([5,10,20,50,100]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0005 begin`);
      logInfo("minimum([5,10,20,50,100])");
      const actual: number = minimum([5,10,20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Minimum_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0006
     * @tc.name      Perf_Minimum_0006
     * @tc.desc      minimum([10]) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0006 begin`);
      logInfo("minimum([10])");
      const actual: number = minimum([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Minimum_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0007
     * @tc.name      Perf_Minimum_0007
     * @tc.desc      minimum([20,50]) is 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0007 begin`);
      logInfo("minimum([20,50])");
      const actual: number = minimum([20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Minimum_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0008
     * @tc.name      Perf_Minimum_0008
     * @tc.desc      minimum([50,100,1000]) is 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0008 begin`);
      logInfo("minimum([50,100,1000])");
      const actual: number = minimum([50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}Minimum_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0009
     * @tc.name      Perf_Minimum_0009
     * @tc.desc      minimum([100,1000,30000,0]) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0009 begin`);
      logInfo("minimum([100,1000,30000,0])");
      const actual: number = minimum([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Minimum_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0010
     * @tc.name      Perf_Minimum_0010
     * @tc.desc      minimum([1000,30000,0,1,2]) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0010 begin`);
      logInfo("minimum([1000,30000,0,1,2])");
      const actual: number = minimum([1000,30000,0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Minimum_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MINIMUM_0011
     * @tc.name      Perf_Minimum_0011
     * @tc.desc      minimum([30000]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Minimum_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Minimum_0011 begin`);
      logInfo("minimum([30000])");
      const actual: number = minimum([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Minimum_0011 end`);
    });

    /**
