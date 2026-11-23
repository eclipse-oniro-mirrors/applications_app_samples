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
  appStartMetrics,
  pageSwitchMetric,
  listSwipeMetric,
} from '../model/PerfTestLogic';

/** AppStartMetricsTest logic checks (32 cases). */
export default function appStartMetricsTest(): void {
  describe('AppStartMetricsTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0001
     * @tc.name      Perf_AppMetrics_0001
     * @tc.desc      fixed app-start metric contract 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_AppMetrics_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppMetrics_0001 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0002
     * @tc.name      Perf_AppMetrics_0002
     * @tc.desc      fixed app-start metric contract 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0002 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0003
     * @tc.name      Perf_AppMetrics_0003
     * @tc.desc      fixed app-start metric contract 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0003 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0004
     * @tc.name      Perf_AppMetrics_0004
     * @tc.desc      fixed app-start metric contract 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0004 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0005
     * @tc.name      Perf_AppMetrics_0005
     * @tc.desc      fixed app-start metric contract 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0005 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0006
     * @tc.name      Perf_AppMetrics_0006
     * @tc.desc      fixed app-start metric contract 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0006 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0007
     * @tc.name      Perf_AppMetrics_0007
     * @tc.desc      fixed app-start metric contract 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0007 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0008
     * @tc.name      Perf_AppMetrics_0008
     * @tc.desc      fixed app-start metric contract 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0008 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0009
     * @tc.name      Perf_AppMetrics_0009
     * @tc.desc      fixed app-start metric contract 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0009 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0010
     * @tc.name      Perf_AppMetrics_0010
     * @tc.desc      fixed app-start metric contract 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0010 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0011
     * @tc.name      Perf_AppMetrics_0011
     * @tc.desc      fixed app-start metric contract 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0011 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0012
     * @tc.name      Perf_AppMetrics_0012
     * @tc.desc      fixed app-start metric contract 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_AppMetrics_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppMetrics_0012 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0013
     * @tc.name      Perf_AppMetrics_0013
     * @tc.desc      fixed app-start metric contract 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0013 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0014
     * @tc.name      Perf_AppMetrics_0014
     * @tc.desc      fixed app-start metric contract 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0014 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0015
     * @tc.name      Perf_AppMetrics_0015
     * @tc.desc      fixed app-start metric contract 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0015 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0016
     * @tc.name      Perf_AppMetrics_0016
     * @tc.desc      fixed app-start metric contract 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0016 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0017
     * @tc.name      Perf_AppMetrics_0017
     * @tc.desc      fixed app-start metric contract 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0017 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0018
     * @tc.name      Perf_AppMetrics_0018
     * @tc.desc      fixed app-start metric contract 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_AppMetrics_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppMetrics_0018 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0019
     * @tc.name      Perf_AppMetrics_0019
     * @tc.desc      fixed app-start metric contract 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0019 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0020
     * @tc.name      Perf_AppMetrics_0020
     * @tc.desc      fixed app-start metric contract 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0020 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0021
     * @tc.name      Perf_AppMetrics_0021
     * @tc.desc      fixed app-start metric contract 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0021 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0022
     * @tc.name      Perf_AppMetrics_0022
     * @tc.desc      fixed app-start metric contract 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0022 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0023
     * @tc.name      Perf_AppMetrics_0023
     * @tc.desc      fixed app-start metric contract 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_AppMetrics_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppMetrics_0023 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0024
     * @tc.name      Perf_AppMetrics_0024
     * @tc.desc      fixed app-start metric contract 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0024 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0025
     * @tc.name      Perf_AppMetrics_0025
     * @tc.desc      fixed app-start metric contract 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0025 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0026
     * @tc.name      Perf_AppMetrics_0026
     * @tc.desc      fixed app-start metric contract 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0026 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0027
     * @tc.name      Perf_AppMetrics_0027
     * @tc.desc      fixed app-start metric contract 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0027 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0028
     * @tc.name      Perf_AppMetrics_0028
     * @tc.desc      fixed app-start metric contract 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0028 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0029
     * @tc.name      Perf_AppMetrics_0029
     * @tc.desc      fixed app-start metric contract 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0029 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0030
     * @tc.name      Perf_AppMetrics_0030
     * @tc.desc      fixed app-start metric contract 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0030 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0031
     * @tc.name      Perf_AppMetrics_0031
     * @tc.desc      fixed app-start metric contract 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0031 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AppMetrics_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_APP_METRICS_0032
     * @tc.name      Perf_AppMetrics_0032
     * @tc.desc      fixed app-start metric contract 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_AppMetrics_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppMetrics_0032 begin`);
      logInfo("appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric()");
      const actual: string = appStartMetrics() + ':' + pageSwitchMetric() + ':' + listSwipeMetric();
      logInfo('actual=' + String(actual) + ', expected=' + "DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      expect(actual).assertEqual("DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME:5:6");
      logInfo(`${BUNDLE}AppMetrics_0032 end`);
    });
  });
}
