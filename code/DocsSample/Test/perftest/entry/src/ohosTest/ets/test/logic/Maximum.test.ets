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
  maximum,
} from '../model/PerfTestLogic';

/** MaximumTest logic checks (32 cases). */
export default function maximumTest(): void {
  describe('MaximumTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0001
     * @tc.name      Perf_Maximum_0001
     * @tc.desc      maximum([0]) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Maximum_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Maximum_0001 begin`);
      logInfo("maximum([0])");
      const actual: number = maximum([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0002
     * @tc.name      Perf_Maximum_0002
     * @tc.desc      maximum([1,2]) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0002 begin`);
      logInfo("maximum([1,2])");
      const actual: number = maximum([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Maximum_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0003
     * @tc.name      Perf_Maximum_0003
     * @tc.desc      maximum([2,3,5]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0003 begin`);
      logInfo("maximum([2,3,5])");
      const actual: number = maximum([2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Maximum_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0004
     * @tc.name      Perf_Maximum_0004
     * @tc.desc      maximum([3,5,10,20]) is 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0004 begin`);
      logInfo("maximum([3,5,10,20])");
      const actual: number = maximum([3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0005
     * @tc.name      Perf_Maximum_0005
     * @tc.desc      maximum([5,10,20,50,100]) is 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0005 begin`);
      logInfo("maximum([5,10,20,50,100])");
      const actual: number = maximum([5,10,20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}Maximum_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0006
     * @tc.name      Perf_Maximum_0006
     * @tc.desc      maximum([10]) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0006 begin`);
      logInfo("maximum([10])");
      const actual: number = maximum([10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Maximum_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0007
     * @tc.name      Perf_Maximum_0007
     * @tc.desc      maximum([20,50]) is 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0007 begin`);
      logInfo("maximum([20,50])");
      const actual: number = maximum([20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0008
     * @tc.name      Perf_Maximum_0008
     * @tc.desc      maximum([50,100,1000]) is 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0008 begin`);
      logInfo("maximum([50,100,1000])");
      const actual: number = maximum([50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}Maximum_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0009
     * @tc.name      Perf_Maximum_0009
     * @tc.desc      maximum([100,1000,30000,0]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0009 begin`);
      logInfo("maximum([100,1000,30000,0])");
      const actual: number = maximum([100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Maximum_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0010
     * @tc.name      Perf_Maximum_0010
     * @tc.desc      maximum([1000,30000,0,1,2]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0010 begin`);
      logInfo("maximum([1000,30000,0,1,2])");
      const actual: number = maximum([1000,30000,0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0011
     * @tc.name      Perf_Maximum_0011
     * @tc.desc      maximum([30000]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0011 begin`);
      logInfo("maximum([30000])");
      const actual: number = maximum([30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Maximum_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0012
     * @tc.name      Perf_Maximum_0012
     * @tc.desc      maximum([0,1]) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Maximum_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Maximum_0012 begin`);
      logInfo("maximum([0,1])");
      const actual: number = maximum([0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Maximum_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0013
     * @tc.name      Perf_Maximum_0013
     * @tc.desc      maximum([1,2,3]) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0013 begin`);
      logInfo("maximum([1,2,3])");
      const actual: number = maximum([1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0014
     * @tc.name      Perf_Maximum_0014
     * @tc.desc      maximum([2,3,5,10]) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0014 begin`);
      logInfo("maximum([2,3,5,10])");
      const actual: number = maximum([2,3,5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Maximum_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0015
     * @tc.name      Perf_Maximum_0015
     * @tc.desc      maximum([3,5,10,20,50]) is 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0015 begin`);
      logInfo("maximum([3,5,10,20,50])");
      const actual: number = maximum([3,5,10,20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}Maximum_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0016
     * @tc.name      Perf_Maximum_0016
     * @tc.desc      maximum([5]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0016 begin`);
      logInfo("maximum([5])");
      const actual: number = maximum([5]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0017
     * @tc.name      Perf_Maximum_0017
     * @tc.desc      maximum([10,20]) is 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0017 begin`);
      logInfo("maximum([10,20])");
      const actual: number = maximum([10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Maximum_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0018
     * @tc.name      Perf_Maximum_0018
     * @tc.desc      maximum([20,50,100]) is 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Maximum_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Maximum_0018 begin`);
      logInfo("maximum([20,50,100])");
      const actual: number = maximum([20,50,100]);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}Maximum_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0019
     * @tc.name      Perf_Maximum_0019
     * @tc.desc      maximum([50,100,1000,30000]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0019 begin`);
      logInfo("maximum([50,100,1000,30000])");
      const actual: number = maximum([50,100,1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0020
     * @tc.name      Perf_Maximum_0020
     * @tc.desc      maximum([100,1000,30000,0,1]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0020 begin`);
      logInfo("maximum([100,1000,30000,0,1])");
      const actual: number = maximum([100,1000,30000,0,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Maximum_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0021
     * @tc.name      Perf_Maximum_0021
     * @tc.desc      maximum([1000]) is 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0021 begin`);
      logInfo("maximum([1000])");
      const actual: number = maximum([1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}Maximum_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0022
     * @tc.name      Perf_Maximum_0022
     * @tc.desc      maximum([30000,0]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0022 begin`);
      logInfo("maximum([30000,0])");
      const actual: number = maximum([30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0023
     * @tc.name      Perf_Maximum_0023
     * @tc.desc      maximum([0,1,2]) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Maximum_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Maximum_0023 begin`);
      logInfo("maximum([0,1,2])");
      const actual: number = maximum([0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Maximum_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0024
     * @tc.name      Perf_Maximum_0024
     * @tc.desc      maximum([1,2,3,5]) is 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0024 begin`);
      logInfo("maximum([1,2,3,5])");
      const actual: number = maximum([1,2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Maximum_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0025
     * @tc.name      Perf_Maximum_0025
     * @tc.desc      maximum([2,3,5,10,20]) is 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0025 begin`);
      logInfo("maximum([2,3,5,10,20])");
      const actual: number = maximum([2,3,5,10,20]);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0026
     * @tc.name      Perf_Maximum_0026
     * @tc.desc      maximum([3]) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0026 begin`);
      logInfo("maximum([3])");
      const actual: number = maximum([3]);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}Maximum_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0027
     * @tc.name      Perf_Maximum_0027
     * @tc.desc      maximum([5,10]) is 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0027 begin`);
      logInfo("maximum([5,10])");
      const actual: number = maximum([5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Maximum_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0028
     * @tc.name      Perf_Maximum_0028
     * @tc.desc      maximum([10,20,50]) is 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0028 begin`);
      logInfo("maximum([10,20,50])");
      const actual: number = maximum([10,20,50]);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0029
     * @tc.name      Perf_Maximum_0029
     * @tc.desc      maximum([20,50,100,1000]) is 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0029 begin`);
      logInfo("maximum([20,50,100,1000])");
      const actual: number = maximum([20,50,100,1000]);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}Maximum_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0030
     * @tc.name      Perf_Maximum_0030
     * @tc.desc      maximum([50,100,1000,30000,0]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0030 begin`);
      logInfo("maximum([50,100,1000,30000,0])");
      const actual: number = maximum([50,100,1000,30000,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Maximum_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0031
     * @tc.name      Perf_Maximum_0031
     * @tc.desc      maximum([100]) is 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0031 begin`);
      logInfo("maximum([100])");
      const actual: number = maximum([100]);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Maximum_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_MAXIMUM_0032
     * @tc.name      Perf_Maximum_0032
     * @tc.desc      maximum([1000,30000]) is 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Maximum_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Maximum_0032 begin`);
      logInfo("maximum([1000,30000])");
      const actual: number = maximum([1000,30000]);
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}Maximum_0032 end`);
    });
  });
}
