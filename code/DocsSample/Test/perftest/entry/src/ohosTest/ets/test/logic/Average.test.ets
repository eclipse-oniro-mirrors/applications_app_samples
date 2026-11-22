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
  average,
} from '../model/PerfTestLogic';

/** AverageTest logic checks (32 cases). */
export default function averageTest(): void {
  describe('AverageTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0001
     * @tc.name      Perf_Average_0001
     * @tc.desc      average([0]) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Average_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Average_0001 begin`);
      logInfo("average([0])");
      const actual: number = average([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0002
     * @tc.name      Perf_Average_0002
     * @tc.desc      average([1,2]) is 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0002 begin`);
      logInfo("average([1,2])");
      const actual: number = average([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo(`${BUNDLE}Average_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0003
     * @tc.name      Perf_Average_0003
     * @tc.desc      average([2,3,5]) is 3.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0003 begin`);
      logInfo("average([2,3,5])");
      const actual: number = average([2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "3.333333");
      expect(actual).assertEqual(3.333333);
      logInfo(`${BUNDLE}Average_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0004
     * @tc.name      Perf_Average_0004
     * @tc.desc      average([3,5,10,20]) is 9.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0004 begin`);
      logInfo("average([3,5,10,20])");
      const actual: number = average([3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "9.5");
      expect(actual).assertEqual(9.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0005
     * @tc.name      Perf_Average_0005
     * @tc.desc      average([5,10,20,50,100]) is 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0005 begin`);
      logInfo("average([5,10,20,50,100])");
      const actual: number = average([5,10,20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "37");
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}Average_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0006
     * @tc.name      Perf_Average_0006
     * @tc.desc      average([10]) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0006 begin`);
      logInfo("average([10])");
      const actual: number = average([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Average_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0007
     * @tc.name      Perf_Average_0007
     * @tc.desc      average([20,50]) is 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0007 begin`);
      logInfo("average([20,50])");
      const actual: number = average([20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0008
     * @tc.name      Perf_Average_0008
     * @tc.desc      average([50,100,1000]) is 383.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0008 begin`);
      logInfo("average([50,100,1000])");
      const actual: number = average([50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "383.333333");
      expect(actual).assertEqual(383.333333);
      logInfo(`${BUNDLE}Average_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0009
     * @tc.name      Perf_Average_0009
     * @tc.desc      average([100,1000,30000,0]) is 7775.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0009 begin`);
      logInfo("average([100,1000,30000,0])");
      const actual: number = average([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "7775");
      expect(actual).assertEqual(7775);
      logInfo(`${BUNDLE}Average_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0010
     * @tc.name      Perf_Average_0010
     * @tc.desc      average([1000,30000,0,1,2]) is 6200.6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0010 begin`);
      logInfo("average([1000,30000,0,1,2])");
      const actual: number = average([1000,30000,0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "6200.6");
      expect(actual).assertEqual(6200.6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0011
     * @tc.name      Perf_Average_0011
     * @tc.desc      average([30000]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0011 begin`);
      logInfo("average([30000])");
      const actual: number = average([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Average_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0012
     * @tc.name      Perf_Average_0012
     * @tc.desc      average([0,1]) is 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Average_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Average_0012 begin`);
      logInfo("average([0,1])");
      const actual: number = average([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo(`${BUNDLE}Average_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0013
     * @tc.name      Perf_Average_0013
     * @tc.desc      average([1,2,3]) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0013 begin`);
      logInfo("average([1,2,3])");
      const actual: number = average([1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0014
     * @tc.name      Perf_Average_0014
     * @tc.desc      average([2,3,5,10]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0014 begin`);
      logInfo("average([2,3,5,10])");
      const actual: number = average([2,3,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Average_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0015
     * @tc.name      Perf_Average_0015
     * @tc.desc      average([3,5,10,20,50]) is 17.6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0015 begin`);
      logInfo("average([3,5,10,20,50])");
      const actual: number = average([3,5,10,20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "17.6");
      expect(actual).assertEqual(17.6);
      logInfo(`${BUNDLE}Average_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0016
     * @tc.name      Perf_Average_0016
     * @tc.desc      average([5]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0016 begin`);
      logInfo("average([5])");
      const actual: number = average([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0017
     * @tc.name      Perf_Average_0017
     * @tc.desc      average([10,20]) is 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0017 begin`);
      logInfo("average([10,20])");
      const actual: number = average([10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}Average_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0018
     * @tc.name      Perf_Average_0018
     * @tc.desc      average([20,50,100]) is 56.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Average_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Average_0018 begin`);
      logInfo("average([20,50,100])");
      const actual: number = average([20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "56.666667");
      expect(actual).assertEqual(56.666667);
      logInfo(`${BUNDLE}Average_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0019
     * @tc.name      Perf_Average_0019
     * @tc.desc      average([50,100,1000,30000]) is 7787.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0019 begin`);
      logInfo("average([50,100,1000,30000])");
      const actual: number = average([50,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "7787.5");
      expect(actual).assertEqual(7787.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0020
     * @tc.name      Perf_Average_0020
     * @tc.desc      average([100,1000,30000,0,1]) is 6220.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0020 begin`);
      logInfo("average([100,1000,30000,0,1])");
      const actual: number = average([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "6220.2");
      expect(actual).assertEqual(6220.2);
      logInfo(`${BUNDLE}Average_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0021
     * @tc.name      Perf_Average_0021
     * @tc.desc      average([1000]) is 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0021 begin`);
      logInfo("average([1000])");
      const actual: number = average([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}Average_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0022
     * @tc.name      Perf_Average_0022
     * @tc.desc      average([30000,0]) is 15000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0022 begin`);
      logInfo("average([30000,0])");
      const actual: number = average([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "15000");
      expect(actual).assertEqual(15000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0023
     * @tc.name      Perf_Average_0023
     * @tc.desc      average([0,1,2]) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Average_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Average_0023 begin`);
      logInfo("average([0,1,2])");
      const actual: number = average([0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Average_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0024
     * @tc.name      Perf_Average_0024
     * @tc.desc      average([1,2,3,5]) is 2.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0024 begin`);
      logInfo("average([1,2,3,5])");
      const actual: number = average([1,2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "2.75");
      expect(actual).assertEqual(2.75);
      logInfo(`${BUNDLE}Average_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0025
     * @tc.name      Perf_Average_0025
     * @tc.desc      average([2,3,5,10,20]) is 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0025 begin`);
      logInfo("average([2,3,5,10,20])");
      const actual: number = average([2,3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0026
     * @tc.name      Perf_Average_0026
     * @tc.desc      average([3]) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0026 begin`);
      logInfo("average([3])");
      const actual: number = average([3]);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}Average_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0027
     * @tc.name      Perf_Average_0027
     * @tc.desc      average([5,10]) is 7.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0027 begin`);
      logInfo("average([5,10])");
      const actual: number = average([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "7.5");
      expect(actual).assertEqual(7.5);
      logInfo(`${BUNDLE}Average_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0028
     * @tc.name      Perf_Average_0028
     * @tc.desc      average([10,20,50]) is 26.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0028 begin`);
      logInfo("average([10,20,50])");
      const actual: number = average([10,20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "26.666667");
      expect(actual).assertEqual(26.666667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0029
     * @tc.name      Perf_Average_0029
     * @tc.desc      average([20,50,100,1000]) is 292.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0029 begin`);
      logInfo("average([20,50,100,1000])");
      const actual: number = average([20,50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "292.5");
      expect(actual).assertEqual(292.5);
      logInfo(`${BUNDLE}Average_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0030
     * @tc.name      Perf_Average_0030
     * @tc.desc      average([50,100,1000,30000,0]) is 6230.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0030 begin`);
      logInfo("average([50,100,1000,30000,0])");
      const actual: number = average([50,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "6230");
      expect(actual).assertEqual(6230);
      logInfo(`${BUNDLE}Average_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0031
     * @tc.name      Perf_Average_0031
     * @tc.desc      average([100]) is 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0031 begin`);
      logInfo("average([100])");
      const actual: number = average([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Average_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0032
     * @tc.name      Perf_Average_0032
     * @tc.desc      average([1000,30000]) is 15500.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Average_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Average_0032 begin`);
      logInfo("average([1000,30000])");
      const actual: number = average([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "15500");
      expect(actual).assertEqual(15500);
      logInfo(`${BUNDLE}Average_0032 end`);
    });
  });
}
