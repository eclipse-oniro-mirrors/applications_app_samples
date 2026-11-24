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
  metricListValid,
} from '../model/PerfTestLogic';

/** MetricListValidTest logic checks (32 cases). */
export default function metricListValidTest(): void {
  describe('MetricListValidTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0001
     * @tc.name      Perf_MetricListValid_0001
     * @tc.desc      metricListValid([0]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricListValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricListValid_0001 begin`);
      logInfo("metricListValid([0])");
      const actual: boolean = metricListValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0002
     * @tc.name      Perf_MetricListValid_0002
     * @tc.desc      metricListValid([3]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0002 begin`);
      logInfo("metricListValid([3])");
      const actual: boolean = metricListValid([3]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0003
     * @tc.name      Perf_MetricListValid_0003
     * @tc.desc      metricListValid([0,1,2,3]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0003 begin`);
      logInfo("metricListValid([0,1,2,3])");
      const actual: boolean = metricListValid([0,1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0004
     * @tc.name      Perf_MetricListValid_0004
     * @tc.desc      metricListValid([1,2,4]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0004 begin`);
      logInfo("metricListValid([1,2,4])");
      const actual: boolean = metricListValid([1,2,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0005
     * @tc.name      Perf_MetricListValid_0005
     * @tc.desc      metricListValid([0,2,3,4]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0005 begin`);
      logInfo("metricListValid([0,2,3,4])");
      const actual: boolean = metricListValid([0,2,3,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0006
     * @tc.name      Perf_MetricListValid_0006
     * @tc.desc      metricListValid([2,5]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0006 begin`);
      logInfo("metricListValid([2,5])");
      const actual: boolean = metricListValid([2,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0007
     * @tc.name      Perf_MetricListValid_0007
     * @tc.desc      metricListValid([0,1,3,5]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0007 begin`);
      logInfo("metricListValid([0,1,3,5])");
      const actual: boolean = metricListValid([0,1,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0008
     * @tc.name      Perf_MetricListValid_0008
     * @tc.desc      metricListValid([1,4,5]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0008 begin`);
      logInfo("metricListValid([1,4,5])");
      const actual: boolean = metricListValid([1,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0009
     * @tc.name      Perf_MetricListValid_0009
     * @tc.desc      metricListValid([0,3,4,5]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0009 begin`);
      logInfo("metricListValid([0,3,4,5])");
      const actual: boolean = metricListValid([0,3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0010
     * @tc.name      Perf_MetricListValid_0010
     * @tc.desc      metricListValid([6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0010 begin`);
      logInfo("metricListValid([6])");
      const actual: boolean = metricListValid([6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0011
     * @tc.name      Perf_MetricListValid_0011
     * @tc.desc      metricListValid([0,1,2,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0011 begin`);
      logInfo("metricListValid([0,1,2,6])");
      const actual: boolean = metricListValid([0,1,2,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0012
     * @tc.name      Perf_MetricListValid_0012
     * @tc.desc      metricListValid([1,2,3,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricListValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricListValid_0012 begin`);
      logInfo("metricListValid([1,2,3,6])");
      const actual: boolean = metricListValid([1,2,3,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0013
     * @tc.name      Perf_MetricListValid_0013
     * @tc.desc      metricListValid([0,2,4,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0013 begin`);
      logInfo("metricListValid([0,2,4,6])");
      const actual: boolean = metricListValid([0,2,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0014
     * @tc.name      Perf_MetricListValid_0014
     * @tc.desc      metricListValid([2,3,4,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0014 begin`);
      logInfo("metricListValid([2,3,4,6])");
      const actual: boolean = metricListValid([2,3,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0015
     * @tc.name      Perf_MetricListValid_0015
     * @tc.desc      metricListValid([0,1,5,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0015 begin`);
      logInfo("metricListValid([0,1,5,6])");
      const actual: boolean = metricListValid([0,1,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0016
     * @tc.name      Perf_MetricListValid_0016
     * @tc.desc      metricListValid([1,3,5,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0016 begin`);
      logInfo("metricListValid([1,3,5,6])");
      const actual: boolean = metricListValid([1,3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0017
     * @tc.name      Perf_MetricListValid_0017
     * @tc.desc      metricListValid([0,4,5,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0017 begin`);
      logInfo("metricListValid([0,4,5,6])");
      const actual: boolean = metricListValid([0,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0018
     * @tc.name      Perf_MetricListValid_0018
     * @tc.desc      metricListValid([3,4,5,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_MetricListValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MetricListValid_0018 begin`);
      logInfo("metricListValid([3,4,5,6])");
      const actual: boolean = metricListValid([3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0019
     * @tc.name      Perf_MetricListValid_0019
     * @tc.desc      metricListValid([0,1,2,3,4,5,6]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0019 begin`);
      logInfo("metricListValid([0,1,2,3,4,5,6])");
      const actual: boolean = metricListValid([0,1,2,3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0020
     * @tc.name      Perf_MetricListValid_0020
     * @tc.desc      metricListValid([1,2,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0020 begin`);
      logInfo("metricListValid([1,2,7])");
      const actual: boolean = metricListValid([1,2,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0021
     * @tc.name      Perf_MetricListValid_0021
     * @tc.desc      metricListValid([0,2,3,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0021 begin`);
      logInfo("metricListValid([0,2,3,7])");
      const actual: boolean = metricListValid([0,2,3,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0022
     * @tc.name      Perf_MetricListValid_0022
     * @tc.desc      metricListValid([2,4,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0022 begin`);
      logInfo("metricListValid([2,4,7])");
      const actual: boolean = metricListValid([2,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0023
     * @tc.name      Perf_MetricListValid_0023
     * @tc.desc      metricListValid([0,1,3,4,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_MetricListValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MetricListValid_0023 begin`);
      logInfo("metricListValid([0,1,3,4,7])");
      const actual: boolean = metricListValid([0,1,3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0024
     * @tc.name      Perf_MetricListValid_0024
     * @tc.desc      metricListValid([1,5,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0024 begin`);
      logInfo("metricListValid([1,5,7])");
      const actual: boolean = metricListValid([1,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0025
     * @tc.name      Perf_MetricListValid_0025
     * @tc.desc      metricListValid([0,3,5,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0025 begin`);
      logInfo("metricListValid([0,3,5,7])");
      const actual: boolean = metricListValid([0,3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0026
     * @tc.name      Perf_MetricListValid_0026
     * @tc.desc      metricListValid([4,5,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0026 begin`);
      logInfo("metricListValid([4,5,7])");
      const actual: boolean = metricListValid([4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0027
     * @tc.name      Perf_MetricListValid_0027
     * @tc.desc      metricListValid([0,1,2,4,5,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0027 begin`);
      logInfo("metricListValid([0,1,2,4,5,7])");
      const actual: boolean = metricListValid([0,1,2,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0028
     * @tc.name      Perf_MetricListValid_0028
     * @tc.desc      metricListValid([1,2,3,4,5,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0028 begin`);
      logInfo("metricListValid([1,2,3,4,5,7])");
      const actual: boolean = metricListValid([1,2,3,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0029
     * @tc.name      Perf_MetricListValid_0029
     * @tc.desc      metricListValid([0,2,6,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0029 begin`);
      logInfo("metricListValid([0,2,6,7])");
      const actual: boolean = metricListValid([0,2,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0030
     * @tc.name      Perf_MetricListValid_0030
     * @tc.desc      metricListValid([2,3,6,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0030 begin`);
      logInfo("metricListValid([2,3,6,7])");
      const actual: boolean = metricListValid([2,3,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0031
     * @tc.name      Perf_MetricListValid_0031
     * @tc.desc      metricListValid([0,1,4,6,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0031 begin`);
      logInfo("metricListValid([0,1,4,6,7])");
      const actual: boolean = metricListValid([0,1,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}MetricListValid_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_METRIC_LIST_VALID_0032
     * @tc.name      Perf_MetricListValid_0032
     * @tc.desc      metricListValid([1,3,4,6,7]) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_MetricListValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MetricListValid_0032 begin`);
      logInfo("metricListValid([1,3,4,6,7])");
      const actual: boolean = metricListValid([1,3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}MetricListValid_0032 end`);
    });
  });
}
