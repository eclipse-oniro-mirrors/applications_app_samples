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
  strategyValid,
  strategySummary,
  metricListValid,
  metricName,
} from '../model/PerfTestLogic';

/** StrategyBoundaryMatrixTest logic checks (400 cases). */
export default function strategyBoundaryMatrixTest(): void {
  describe('StrategyBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0001
     * @tc.name      Perf_StrategyMatrix_0001
     * @tc.desc      strategy matrix 1,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0001 begin`);
      logInfo("strategy matrix 1,1,999,,false");
      const actual: string = strategyValid([0], 1, 999, "", false) + '|' + strategySummary([0], 1, 999) + '|' + metricListValid([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION|1|999|true");
      expect(actual).assertEqual("false|DURATION|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0002
     * @tc.name      Perf_StrategyMatrix_0002
     * @tc.desc      strategy matrix 8,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0002 begin`);
      logInfo("strategy matrix 8,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([3], 2, 1000) + '|' + metricListValid([3]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS|2|1000|true");
      expect(actual).assertEqual("true|MEMORY_RSS|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0003
     * @tc.name      Perf_StrategyMatrix_0003
     * @tc.desc      strategy matrix 15,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0003 begin`);
      logInfo("strategy matrix 15,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3], 3, 30000) + '|' + metricListValid([0,1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0004
     * @tc.name      Perf_StrategyMatrix_0004
     * @tc.desc      strategy matrix 22,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0004 begin`);
      logInfo("strategy matrix 22,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4], 4, 50000) + '|' + metricListValid([1,2,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_PSS|4|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_PSS|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0005
     * @tc.name      Perf_StrategyMatrix_0005
     * @tc.desc      strategy matrix 29,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0005 begin`);
      logInfo("strategy matrix 29,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 4], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 4], 5, 60000) + '|' + metricListValid([0,2,3,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0006
     * @tc.name      Perf_StrategyMatrix_0006
     * @tc.desc      strategy matrix 36,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0006 begin`);
      logInfo("strategy matrix 36,6,60001,,true");
      const actual: string = strategyValid([2, 5], 6, 60001, "", true) + '|' + strategySummary([2, 5], 6, 60001) + '|' + metricListValid([2,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0007
     * @tc.name      Perf_StrategyMatrix_0007
     * @tc.desc      strategy matrix 43,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0007 begin`);
      logInfo("strategy matrix 43,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 3, 5], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 3, 5], 7, 999) + '|' + metricListValid([0,1,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0008
     * @tc.name      Perf_StrategyMatrix_0008
     * @tc.desc      strategy matrix 50,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0008 begin`);
      logInfo("strategy matrix 50,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 5], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 5], 8, 1000) + '|' + metricListValid([1,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0009
     * @tc.name      Perf_StrategyMatrix_0009
     * @tc.desc      strategy matrix 57,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0009 begin`);
      logInfo("strategy matrix 57,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 4, 5], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 4, 5], 9, 30000) + '|' + metricListValid([0,3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0010
     * @tc.name      Perf_StrategyMatrix_0010
     * @tc.desc      strategy matrix 64,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0010 begin`);
      logInfo("strategy matrix 64,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([6], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([6], 10, 50000) + '|' + metricListValid([6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|LIST_SWIPE_FPS|10|50000|true");
      expect(actual).assertEqual("true|LIST_SWIPE_FPS|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0011
     * @tc.name      Perf_StrategyMatrix_0011
     * @tc.desc      strategy matrix 71,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0011 begin`);
      logInfo("strategy matrix 71,1,60000,,true");
      const actual: string = strategyValid([0, 1, 2, 6], 1, 60000, "", true) + '|' + strategySummary([0, 1, 2, 6], 1, 60000) + '|' + metricListValid([0,1,2,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0012
     * @tc.name      Perf_StrategyMatrix_0012
     * @tc.desc      strategy matrix 78,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0012 begin`);
      logInfo("strategy matrix 78,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 6], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 6], 2, 60001) + '|' + metricListValid([1,2,3,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|2|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0013
     * @tc.name      Perf_StrategyMatrix_0013
     * @tc.desc      strategy matrix 85,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0013 begin`);
      logInfo("strategy matrix 85,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 4, 6], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 4, 6], 3, 999) + '|' + metricListValid([0,2,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0014
     * @tc.name      Perf_StrategyMatrix_0014
     * @tc.desc      strategy matrix 92,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0014 begin`);
      logInfo("strategy matrix 92,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 6], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 6], 4, 1000) + '|' + metricListValid([2,3,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|4|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0015
     * @tc.name      Perf_StrategyMatrix_0015
     * @tc.desc      strategy matrix 99,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0015 begin`);
      logInfo("strategy matrix 99,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 5, 6], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 5, 6], 5, 30000) + '|' + metricListValid([0,1,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0016
     * @tc.name      Perf_StrategyMatrix_0016
     * @tc.desc      strategy matrix 106,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0016 begin`);
      logInfo("strategy matrix 106,6,50000,,true");
      const actual: string = strategyValid([1, 3, 5, 6], 6, 50000, "", true) + '|' + strategySummary([1, 3, 5, 6], 6, 50000) + '|' + metricListValid([1,3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|6|50000|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0017
     * @tc.name      Perf_StrategyMatrix_0017
     * @tc.desc      strategy matrix 113,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0017 begin`);
      logInfo("strategy matrix 113,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 4, 5, 6], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 4, 5, 6], 7, 60000) + '|' + metricListValid([0,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|7|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0018
     * @tc.name      Perf_StrategyMatrix_0018
     * @tc.desc      strategy matrix 120,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0018 begin`);
      logInfo("strategy matrix 120,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 5, 6], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 5, 6], 8, 60001) + '|' + metricListValid([3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0019
     * @tc.name      Perf_StrategyMatrix_0019
     * @tc.desc      strategy matrix 127,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0019 begin`);
      logInfo("strategy matrix 127,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 5, 6], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 3, 4, 5, 6], 9, 999) + '|' + metricListValid([0,1,2,3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0020
     * @tc.name      Perf_StrategyMatrix_0020
     * @tc.desc      strategy matrix 134,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0020 begin`);
      logInfo("strategy matrix 134,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 7], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 7], 10, 1000) + '|' + metricListValid([1,2,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0021
     * @tc.name      Perf_StrategyMatrix_0021
     * @tc.desc      strategy matrix 141,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0021 begin`);
      logInfo("strategy matrix 141,1,30000,,true");
      const actual: string = strategyValid([0, 2, 3, 7], 1, 30000, "", true) + '|' + strategySummary([0, 2, 3, 7], 1, 30000) + '|' + metricListValid([0,2,3,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0022
     * @tc.name      Perf_StrategyMatrix_0022
     * @tc.desc      strategy matrix 148,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0022 begin`);
      logInfo("strategy matrix 148,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 7], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 7], 2, 50000) + '|' + metricListValid([2,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0023
     * @tc.name      Perf_StrategyMatrix_0023
     * @tc.desc      strategy matrix 155,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0023 begin`);
      logInfo("strategy matrix 155,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 7], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 7], 3, 60000) + '|' + metricListValid([0,1,3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0024
     * @tc.name      Perf_StrategyMatrix_0024
     * @tc.desc      strategy matrix 162,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0024 begin`);
      logInfo("strategy matrix 162,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 5, 7], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 5, 7], 4, 60001) + '|' + metricListValid([1,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0025
     * @tc.name      Perf_StrategyMatrix_0025
     * @tc.desc      strategy matrix 169,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0025 begin`);
      logInfo("strategy matrix 169,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 3, 5, 7], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 3, 5, 7], 5, 999) + '|' + metricListValid([0,3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0026
     * @tc.name      Perf_StrategyMatrix_0026
     * @tc.desc      strategy matrix 176,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0026 begin`);
      logInfo("strategy matrix 176,6,1000,,true");
      const actual: string = strategyValid([4, 5, 7], 6, 1000, "", true) + '|' + strategySummary([4, 5, 7], 6, 1000) + '|' + metricListValid([4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|6|1000|true");
      expect(actual).assertEqual("false|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0027
     * @tc.name      Perf_StrategyMatrix_0027
     * @tc.desc      strategy matrix 183,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0027 begin`);
      logInfo("strategy matrix 183,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 4, 5, 7], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 4, 5, 7], 7, 30000) + '|' + metricListValid([0,1,2,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0028
     * @tc.name      Perf_StrategyMatrix_0028
     * @tc.desc      strategy matrix 190,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0028 begin`);
      logInfo("strategy matrix 190,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 5, 7], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 5, 7], 8, 50000) + '|' + metricListValid([1,2,3,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|8|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0029
     * @tc.name      Perf_StrategyMatrix_0029
     * @tc.desc      strategy matrix 197,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0029 begin`);
      logInfo("strategy matrix 197,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 6, 7], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 6, 7], 9, 60000) + '|' + metricListValid([0,2,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0030
     * @tc.name      Perf_StrategyMatrix_0030
     * @tc.desc      strategy matrix 204,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0030 begin`);
      logInfo("strategy matrix 204,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 6, 7], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 6, 7], 10, 60001) + '|' + metricListValid([2,3,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0031
     * @tc.name      Perf_StrategyMatrix_0031
     * @tc.desc      strategy matrix 211,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0031 begin`);
      logInfo("strategy matrix 211,1,999,,false");
      const actual: string = strategyValid([0, 1, 4, 6, 7], 1, 999, "", false) + '|' + strategySummary([0, 1, 4, 6, 7], 1, 999) + '|' + metricListValid([0,1,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0032
     * @tc.name      Perf_StrategyMatrix_0032
     * @tc.desc      strategy matrix 218,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0032 begin`);
      logInfo("strategy matrix 218,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4, 6, 7], 2, 1000) + '|' + metricListValid([1,3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0033
     * @tc.name      Perf_StrategyMatrix_0033
     * @tc.desc      strategy matrix 225,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0033 begin`);
      logInfo("strategy matrix 225,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 5, 6, 7], 3, 30000) + '|' + metricListValid([0,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0034
     * @tc.name      Perf_StrategyMatrix_0034
     * @tc.desc      strategy matrix 232,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0034 begin`);
      logInfo("strategy matrix 232,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 5, 6, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 5, 6, 7], 4, 50000) + '|' + metricListValid([3,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|50000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0035
     * @tc.name      Perf_StrategyMatrix_0035
     * @tc.desc      strategy matrix 239,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0035 begin`);
      logInfo("strategy matrix 239,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 5, 6, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 5, 6, 7], 5, 60000) + '|' + metricListValid([0,1,2,3,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0036
     * @tc.name      Perf_StrategyMatrix_0036
     * @tc.desc      strategy matrix 246,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0036 begin`);
      logInfo("strategy matrix 246,6,60001,,true");
      const actual: string = strategyValid([1, 2, 4, 5, 6, 7], 6, 60001, "", true) + '|' + strategySummary([1, 2, 4, 5, 6, 7], 6, 60001) + '|' + metricListValid([1,2,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0037
     * @tc.name      Perf_StrategyMatrix_0037
     * @tc.desc      strategy matrix 253,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0037 begin`);
      logInfo("strategy matrix 253,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 3, 4, 5, 6, 7], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 3, 4, 5, 6, 7], 7, 999) + '|' + metricListValid([0,2,3,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0038
     * @tc.name      Perf_StrategyMatrix_0038
     * @tc.desc      strategy matrix 260,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0038 begin`);
      logInfo("strategy matrix 260,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 8], 8, 1000) + '|' + metricListValid([2,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0039
     * @tc.name      Perf_StrategyMatrix_0039
     * @tc.desc      strategy matrix 267,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0039 begin`);
      logInfo("strategy matrix 267,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 8], 9, 30000) + '|' + metricListValid([0,1,3,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0040
     * @tc.name      Perf_StrategyMatrix_0040
     * @tc.desc      strategy matrix 274,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0040 begin`);
      logInfo("strategy matrix 274,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 8], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 8], 10, 50000) + '|' + metricListValid([1,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_PSS,APP_START_COMPLETE_TIME|10|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_PSS,APP_START_COMPLETE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0041
     * @tc.name      Perf_StrategyMatrix_0041
     * @tc.desc      strategy matrix 281,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0041 begin`);
      logInfo("strategy matrix 281,1,60000,,true");
      const actual: string = strategyValid([0, 3, 4, 8], 1, 60000, "", true) + '|' + strategySummary([0, 3, 4, 8], 1, 60000) + '|' + metricListValid([0,3,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0042
     * @tc.name      Perf_StrategyMatrix_0042
     * @tc.desc      strategy matrix 288,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0042 begin`);
      logInfo("strategy matrix 288,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([5, 8], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([5, 8], 2, 60001) + '|' + metricListValid([5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      expect(actual).assertEqual("false|PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0043
     * @tc.name      Perf_StrategyMatrix_0043
     * @tc.desc      strategy matrix 295,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0043 begin`);
      logInfo("strategy matrix 295,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 5, 8], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 5, 8], 3, 999) + '|' + metricListValid([0,1,2,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0044
     * @tc.name      Perf_StrategyMatrix_0044
     * @tc.desc      strategy matrix 302,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0044 begin`);
      logInfo("strategy matrix 302,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 5, 8], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 5, 8], 4, 1000) + '|' + metricListValid([1,2,3,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|4|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0045
     * @tc.name      Perf_StrategyMatrix_0045
     * @tc.desc      strategy matrix 309,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0045 begin`);
      logInfo("strategy matrix 309,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 4, 5, 8], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 4, 5, 8], 5, 30000) + '|' + metricListValid([0,2,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0046
     * @tc.name      Perf_StrategyMatrix_0046
     * @tc.desc      strategy matrix 316,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0046 begin`);
      logInfo("strategy matrix 316,6,50000,,true");
      const actual: string = strategyValid([2, 3, 4, 5, 8], 6, 50000, "", true) + '|' + strategySummary([2, 3, 4, 5, 8], 6, 50000) + '|' + metricListValid([2,3,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|6|50000|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0047
     * @tc.name      Perf_StrategyMatrix_0047
     * @tc.desc      strategy matrix 323,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0047 begin`);
      logInfo("strategy matrix 323,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 6, 8], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 6, 8], 7, 60000) + '|' + metricListValid([0,1,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0048
     * @tc.name      Perf_StrategyMatrix_0048
     * @tc.desc      strategy matrix 330,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0048 begin`);
      logInfo("strategy matrix 330,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 6, 8], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 6, 8], 8, 60001) + '|' + metricListValid([1,3,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0049
     * @tc.name      Perf_StrategyMatrix_0049
     * @tc.desc      strategy matrix 337,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0049 begin`);
      logInfo("strategy matrix 337,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 4, 6, 8], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 4, 6, 8], 9, 999) + '|' + metricListValid([0,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0050
     * @tc.name      Perf_StrategyMatrix_0050
     * @tc.desc      strategy matrix 344,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0050 begin`);
      logInfo("strategy matrix 344,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 6, 8], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 6, 8], 10, 1000) + '|' + metricListValid([3,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|1000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0051
     * @tc.name      Perf_StrategyMatrix_0051
     * @tc.desc      strategy matrix 351,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0051 begin`);
      logInfo("strategy matrix 351,1,30000,,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 6, 8], 1, 30000, "", true) + '|' + strategySummary([0, 1, 2, 3, 4, 6, 8], 1, 30000) + '|' + metricListValid([0,1,2,3,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0052
     * @tc.name      Perf_StrategyMatrix_0052
     * @tc.desc      strategy matrix 358,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0052 begin`);
      logInfo("strategy matrix 358,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 5, 6, 8], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 5, 6, 8], 2, 50000) + '|' + metricListValid([1,2,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0053
     * @tc.name      Perf_StrategyMatrix_0053
     * @tc.desc      strategy matrix 365,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0053 begin`);
      logInfo("strategy matrix 365,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 5, 6, 8], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 5, 6, 8], 3, 60000) + '|' + metricListValid([0,2,3,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0054
     * @tc.name      Perf_StrategyMatrix_0054
     * @tc.desc      strategy matrix 372,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0054 begin`);
      logInfo("strategy matrix 372,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 5, 6, 8], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 5, 6, 8], 4, 60001) + '|' + metricListValid([2,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0055
     * @tc.name      Perf_StrategyMatrix_0055
     * @tc.desc      strategy matrix 379,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0055 begin`);
      logInfo("strategy matrix 379,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 3, 4, 5, 6, 8], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 3, 4, 5, 6, 8], 5, 999) + '|' + metricListValid([0,1,3,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0056
     * @tc.name      Perf_StrategyMatrix_0056
     * @tc.desc      strategy matrix 386,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0056 begin`);
      logInfo("strategy matrix 386,6,1000,,true");
      const actual: string = strategyValid([1, 7, 8], 6, 1000, "", true) + '|' + strategySummary([1, 7, 8], 6, 1000) + '|' + metricListValid([1,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      expect(actual).assertEqual("false|CPU_LOAD,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0057
     * @tc.name      Perf_StrategyMatrix_0057
     * @tc.desc      strategy matrix 393,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0057 begin`);
      logInfo("strategy matrix 393,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 7, 8], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 7, 8], 7, 30000) + '|' + metricListValid([0,3,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0058
     * @tc.name      Perf_StrategyMatrix_0058
     * @tc.desc      strategy matrix 400,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0058 begin`);
      logInfo("strategy matrix 400,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 7, 8], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([4, 7, 8], 8, 50000) + '|' + metricListValid([4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      expect(actual).assertEqual("true|MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0059
     * @tc.name      Perf_StrategyMatrix_0059
     * @tc.desc      strategy matrix 407,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0059 begin`);
      logInfo("strategy matrix 407,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 4, 7, 8], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 4, 7, 8], 9, 60000) + '|' + metricListValid([0,1,2,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0060
     * @tc.name      Perf_StrategyMatrix_0060
     * @tc.desc      strategy matrix 414,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0060 begin`);
      logInfo("strategy matrix 414,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 7, 8], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 7, 8], 10, 60001) + '|' + metricListValid([1,2,3,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0061
     * @tc.name      Perf_StrategyMatrix_0061
     * @tc.desc      strategy matrix 421,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0061 begin`);
      logInfo("strategy matrix 421,1,999,,false");
      const actual: string = strategyValid([0, 2, 5, 7, 8], 1, 999, "", false) + '|' + strategySummary([0, 2, 5, 7, 8], 1, 999) + '|' + metricListValid([0,2,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0062
     * @tc.name      Perf_StrategyMatrix_0062
     * @tc.desc      strategy matrix 428,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0062 begin`);
      logInfo("strategy matrix 428,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 5, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 5, 7, 8], 2, 1000) + '|' + metricListValid([2,3,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0063
     * @tc.name      Perf_StrategyMatrix_0063
     * @tc.desc      strategy matrix 435,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0063 begin`);
      logInfo("strategy matrix 435,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 4, 5, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 4, 5, 7, 8], 3, 30000) + '|' + metricListValid([0,1,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0064
     * @tc.name      Perf_StrategyMatrix_0064
     * @tc.desc      strategy matrix 442,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0064 begin`);
      logInfo("strategy matrix 442,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4, 5, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4, 5, 7, 8], 4, 50000) + '|' + metricListValid([1,3,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0065
     * @tc.name      Perf_StrategyMatrix_0065
     * @tc.desc      strategy matrix 449,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0065 begin`);
      logInfo("strategy matrix 449,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 6, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 6, 7, 8], 5, 60000) + '|' + metricListValid([0,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0066
     * @tc.name      Perf_StrategyMatrix_0066
     * @tc.desc      strategy matrix 456,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0066 begin`);
      logInfo("strategy matrix 456,6,60001,,true");
      const actual: string = strategyValid([3, 6, 7, 8], 6, 60001, "", true) + '|' + strategySummary([3, 6, 7, 8], 6, 60001) + '|' + metricListValid([3,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0067
     * @tc.name      Perf_StrategyMatrix_0067
     * @tc.desc      strategy matrix 463,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0067 begin`);
      logInfo("strategy matrix 463,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 3, 6, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 3, 6, 7, 8], 7, 999) + '|' + metricListValid([0,1,2,3,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0068
     * @tc.name      Perf_StrategyMatrix_0068
     * @tc.desc      strategy matrix 470,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0068 begin`);
      logInfo("strategy matrix 470,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 6, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 6, 7, 8], 8, 1000) + '|' + metricListValid([1,2,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0069
     * @tc.name      Perf_StrategyMatrix_0069
     * @tc.desc      strategy matrix 477,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0069 begin`);
      logInfo("strategy matrix 477,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 4, 6, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 4, 6, 7, 8], 9, 30000) + '|' + metricListValid([0,2,3,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0070
     * @tc.name      Perf_StrategyMatrix_0070
     * @tc.desc      strategy matrix 484,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0070 begin`);
      logInfo("strategy matrix 484,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 5, 6, 7, 8], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 5, 6, 7, 8], 10, 50000) + '|' + metricListValid([2,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0071
     * @tc.name      Perf_StrategyMatrix_0071
     * @tc.desc      strategy matrix 491,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0071 begin`);
      logInfo("strategy matrix 491,1,60000,,true");
      const actual: string = strategyValid([0, 1, 3, 5, 6, 7, 8], 1, 60000, "", true) + '|' + strategySummary([0, 1, 3, 5, 6, 7, 8], 1, 60000) + '|' + metricListValid([0,1,3,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0072
     * @tc.name      Perf_StrategyMatrix_0072
     * @tc.desc      strategy matrix 498,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0072 begin`);
      logInfo("strategy matrix 498,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 5, 6, 7, 8], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 5, 6, 7, 8], 2, 60001) + '|' + metricListValid([1,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0073
     * @tc.name      Perf_StrategyMatrix_0073
     * @tc.desc      strategy matrix 505,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0073 begin`);
      logInfo("strategy matrix 505,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 3, 4, 5, 6, 7, 8], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 3, 4, 5, 6, 7, 8], 3, 999) + '|' + metricListValid([0,3,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0074
     * @tc.name      Perf_StrategyMatrix_0074
     * @tc.desc      strategy matrix 512,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0074 begin`);
      logInfo("strategy matrix 512,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([], 4, 1000) + '|' + metricListValid([]);
      logInfo('actual=' + String(actual) + ', expected=' + "false||4|1000|false");
      expect(actual).assertEqual("false||4|1000|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0075
     * @tc.name      Perf_StrategyMatrix_0075
     * @tc.desc      strategy matrix 519,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0075 begin`);
      logInfo("strategy matrix 519,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2], 5, 30000) + '|' + metricListValid([0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0076
     * @tc.name      Perf_StrategyMatrix_0076
     * @tc.desc      strategy matrix 526,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0076 begin`);
      logInfo("strategy matrix 526,6,50000,,true");
      const actual: string = strategyValid([1, 2, 3], 6, 50000, "", true) + '|' + strategySummary([1, 2, 3], 6, 50000) + '|' + metricListValid([1,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS|6|50000|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0077
     * @tc.name      Perf_StrategyMatrix_0077
     * @tc.desc      strategy matrix 533,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0077 begin`);
      logInfo("strategy matrix 533,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 4], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 4], 7, 60000) + '|' + metricListValid([0,2,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_PSS|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_PSS|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0078
     * @tc.name      Perf_StrategyMatrix_0078
     * @tc.desc      strategy matrix 540,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0078 begin`);
      logInfo("strategy matrix 540,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4], 8, 60001) + '|' + metricListValid([2,3,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS|8|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0079
     * @tc.name      Perf_StrategyMatrix_0079
     * @tc.desc      strategy matrix 547,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0079 begin`);
      logInfo("strategy matrix 547,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 5], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 5], 9, 999) + '|' + metricListValid([0,1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0080
     * @tc.name      Perf_StrategyMatrix_0080
     * @tc.desc      strategy matrix 554,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0080 begin`);
      logInfo("strategy matrix 554,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 5], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 5], 10, 1000) + '|' + metricListValid([1,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0081
     * @tc.name      Perf_StrategyMatrix_0081
     * @tc.desc      strategy matrix 561,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0081 begin`);
      logInfo("strategy matrix 561,1,30000,,true");
      const actual: string = strategyValid([0, 4, 5], 1, 30000, "", true) + '|' + strategySummary([0, 4, 5], 1, 30000) + '|' + metricListValid([0,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0082
     * @tc.name      Perf_StrategyMatrix_0082
     * @tc.desc      strategy matrix 568,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0082 begin`);
      logInfo("strategy matrix 568,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 5], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 5], 2, 50000) + '|' + metricListValid([3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0083
     * @tc.name      Perf_StrategyMatrix_0083
     * @tc.desc      strategy matrix 575,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0083 begin`);
      logInfo("strategy matrix 575,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 5], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 4, 5], 3, 60000) + '|' + metricListValid([0,1,2,3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0084
     * @tc.name      Perf_StrategyMatrix_0084
     * @tc.desc      strategy matrix 582,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0084 begin`);
      logInfo("strategy matrix 582,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 6], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 6], 4, 60001) + '|' + metricListValid([1,2,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS|4|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0085
     * @tc.name      Perf_StrategyMatrix_0085
     * @tc.desc      strategy matrix 589,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0085 begin`);
      logInfo("strategy matrix 589,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 3, 6], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 3, 6], 5, 999) + '|' + metricListValid([0,2,3,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0086
     * @tc.name      Perf_StrategyMatrix_0086
     * @tc.desc      strategy matrix 596,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0086 begin`);
      logInfo("strategy matrix 596,6,1000,,true");
      const actual: string = strategyValid([2, 4, 6], 6, 1000, "", true) + '|' + strategySummary([2, 4, 6], 6, 1000) + '|' + metricListValid([2,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS|6|1000|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0087
     * @tc.name      Perf_StrategyMatrix_0087
     * @tc.desc      strategy matrix 603,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0087 begin`);
      logInfo("strategy matrix 603,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 6], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 6], 7, 30000) + '|' + metricListValid([0,1,3,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0088
     * @tc.name      Perf_StrategyMatrix_0088
     * @tc.desc      strategy matrix 610,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0088 begin`);
      logInfo("strategy matrix 610,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 5, 6], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 5, 6], 8, 50000) + '|' + metricListValid([1,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0089
     * @tc.name      Perf_StrategyMatrix_0089
     * @tc.desc      strategy matrix 617,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0089 begin`);
      logInfo("strategy matrix 617,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 5, 6], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 5, 6], 9, 60000) + '|' + metricListValid([0,3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|9|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0090
     * @tc.name      Perf_StrategyMatrix_0090
     * @tc.desc      strategy matrix 624,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0090 begin`);
      logInfo("strategy matrix 624,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 5, 6], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([4, 5, 6], 10, 60001) + '|' + metricListValid([4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|10|60001|true");
      expect(actual).assertEqual("false|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0091
     * @tc.name      Perf_StrategyMatrix_0091
     * @tc.desc      strategy matrix 631,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0091 begin`);
      logInfo("strategy matrix 631,1,999,,false");
      const actual: string = strategyValid([0, 1, 2, 4, 5, 6], 1, 999, "", false) + '|' + strategySummary([0, 1, 2, 4, 5, 6], 1, 999) + '|' + metricListValid([0,1,2,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0092
     * @tc.name      Perf_StrategyMatrix_0092
     * @tc.desc      strategy matrix 638,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0092 begin`);
      logInfo("strategy matrix 638,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 5, 6], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 5, 6], 2, 1000) + '|' + metricListValid([1,2,3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|2|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0093
     * @tc.name      Perf_StrategyMatrix_0093
     * @tc.desc      strategy matrix 645,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0093 begin`);
      logInfo("strategy matrix 645,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 7], 3, 30000) + '|' + metricListValid([0,2,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,APP_START_RESPONSE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,APP_START_RESPONSE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0094
     * @tc.name      Perf_StrategyMatrix_0094
     * @tc.desc      strategy matrix 652,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0094 begin`);
      logInfo("strategy matrix 652,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 7], 4, 50000) + '|' + metricListValid([2,3,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0095
     * @tc.name      Perf_StrategyMatrix_0095
     * @tc.desc      strategy matrix 659,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0095 begin`);
      logInfo("strategy matrix 659,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 4, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 4, 7], 5, 60000) + '|' + metricListValid([0,1,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_PSS,APP_START_RESPONSE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_PSS,APP_START_RESPONSE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0096
     * @tc.name      Perf_StrategyMatrix_0096
     * @tc.desc      strategy matrix 666,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0096 begin`);
      logInfo("strategy matrix 666,6,60001,,true");
      const actual: string = strategyValid([1, 3, 4, 7], 6, 60001, "", true) + '|' + strategySummary([1, 3, 4, 7], 6, 60001) + '|' + metricListValid([1,3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0097
     * @tc.name      Perf_StrategyMatrix_0097
     * @tc.desc      strategy matrix 673,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0097 begin`);
      logInfo("strategy matrix 673,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 5, 7], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 5, 7], 7, 999) + '|' + metricListValid([0,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0098
     * @tc.name      Perf_StrategyMatrix_0098
     * @tc.desc      strategy matrix 680,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0098 begin`);
      logInfo("strategy matrix 680,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 5, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 5, 7], 8, 1000) + '|' + metricListValid([3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|8|1000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0099
     * @tc.name      Perf_StrategyMatrix_0099
     * @tc.desc      strategy matrix 687,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0099 begin`);
      logInfo("strategy matrix 687,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 5, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 5, 7], 9, 30000) + '|' + metricListValid([0,1,2,3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0100
     * @tc.name      Perf_StrategyMatrix_0100
     * @tc.desc      strategy matrix 694,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0100 begin`);
      logInfo("strategy matrix 694,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 5, 7], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 5, 7], 10, 50000) + '|' + metricListValid([1,2,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|10|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0101
     * @tc.name      Perf_StrategyMatrix_0101
     * @tc.desc      strategy matrix 701,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0101 begin`);
      logInfo("strategy matrix 701,1,60000,,true");
      const actual: string = strategyValid([0, 2, 3, 4, 5, 7], 1, 60000, "", true) + '|' + strategySummary([0, 2, 3, 4, 5, 7], 1, 60000) + '|' + metricListValid([0,2,3,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0102
     * @tc.name      Perf_StrategyMatrix_0102
     * @tc.desc      strategy matrix 708,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0102 begin`);
      logInfo("strategy matrix 708,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 6, 7], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 6, 7], 2, 60001) + '|' + metricListValid([2,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0103
     * @tc.name      Perf_StrategyMatrix_0103
     * @tc.desc      strategy matrix 715,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0103 begin`);
      logInfo("strategy matrix 715,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 3, 6, 7], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 3, 6, 7], 3, 999) + '|' + metricListValid([0,1,3,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0104
     * @tc.name      Perf_StrategyMatrix_0104
     * @tc.desc      strategy matrix 722,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0104 begin`);
      logInfo("strategy matrix 722,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 6, 7], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 6, 7], 4, 1000) + '|' + metricListValid([1,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0105
     * @tc.name      Perf_StrategyMatrix_0105
     * @tc.desc      strategy matrix 729,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0105 begin`);
      logInfo("strategy matrix 729,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 4, 6, 7], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 4, 6, 7], 5, 30000) + '|' + metricListValid([0,3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0106
     * @tc.name      Perf_StrategyMatrix_0106
     * @tc.desc      strategy matrix 736,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0106 begin`);
      logInfo("strategy matrix 736,6,50000,,true");
      const actual: string = strategyValid([5, 6, 7], 6, 50000, "", true) + '|' + strategySummary([5, 6, 7], 6, 50000) + '|' + metricListValid([5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|50000|true");
      expect(actual).assertEqual("false|PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0107
     * @tc.name      Perf_StrategyMatrix_0107
     * @tc.desc      strategy matrix 743,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0107 begin`);
      logInfo("strategy matrix 743,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 5, 6, 7], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 5, 6, 7], 7, 60000) + '|' + metricListValid([0,1,2,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0108
     * @tc.name      Perf_StrategyMatrix_0108
     * @tc.desc      strategy matrix 750,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0108 begin`);
      logInfo("strategy matrix 750,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 5, 6, 7], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 5, 6, 7], 8, 60001) + '|' + metricListValid([1,2,3,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0109
     * @tc.name      Perf_StrategyMatrix_0109
     * @tc.desc      strategy matrix 757,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0109 begin`);
      logInfo("strategy matrix 757,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 4, 5, 6, 7], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 4, 5, 6, 7], 9, 999) + '|' + metricListValid([0,2,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0110
     * @tc.name      Perf_StrategyMatrix_0110
     * @tc.desc      strategy matrix 764,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0110 begin`);
      logInfo("strategy matrix 764,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 5, 6, 7], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 5, 6, 7], 10, 1000) + '|' + metricListValid([2,3,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0111
     * @tc.name      Perf_StrategyMatrix_0111
     * @tc.desc      strategy matrix 771,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0111 begin`);
      logInfo("strategy matrix 771,1,30000,,true");
      const actual: string = strategyValid([0, 1, 8], 1, 30000, "", true) + '|' + strategySummary([0, 1, 8], 1, 30000) + '|' + metricListValid([0,1,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,APP_START_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,APP_START_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0112
     * @tc.name      Perf_StrategyMatrix_0112
     * @tc.desc      strategy matrix 778,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0112 begin`);
      logInfo("strategy matrix 778,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 8], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 8], 2, 50000) + '|' + metricListValid([1,3,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,APP_START_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,APP_START_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0113
     * @tc.name      Perf_StrategyMatrix_0113
     * @tc.desc      strategy matrix 785,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0113 begin`);
      logInfo("strategy matrix 785,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 4, 8], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 4, 8], 3, 60000) + '|' + metricListValid([0,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_PSS,APP_START_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_PSS,APP_START_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0114
     * @tc.name      Perf_StrategyMatrix_0114
     * @tc.desc      strategy matrix 792,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0114 begin`);
      logInfo("strategy matrix 792,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 8], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 8], 4, 60001) + '|' + metricListValid([3,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|4|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0115
     * @tc.name      Perf_StrategyMatrix_0115
     * @tc.desc      strategy matrix 799,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0115 begin`);
      logInfo("strategy matrix 799,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 8], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 3, 4, 8], 5, 999) + '|' + metricListValid([0,1,2,3,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0116
     * @tc.name      Perf_StrategyMatrix_0116
     * @tc.desc      strategy matrix 806,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0116 begin`);
      logInfo("strategy matrix 806,6,1000,,true");
      const actual: string = strategyValid([1, 2, 5, 8], 6, 1000, "", true) + '|' + strategySummary([1, 2, 5, 8], 6, 1000) + '|' + metricListValid([1,2,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0117
     * @tc.name      Perf_StrategyMatrix_0117
     * @tc.desc      strategy matrix 813,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0117 begin`);
      logInfo("strategy matrix 813,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 5, 8], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 5, 8], 7, 30000) + '|' + metricListValid([0,2,3,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0118
     * @tc.name      Perf_StrategyMatrix_0118
     * @tc.desc      strategy matrix 820,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0118 begin`);
      logInfo("strategy matrix 820,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 5, 8], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 5, 8], 8, 50000) + '|' + metricListValid([2,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0119
     * @tc.name      Perf_StrategyMatrix_0119
     * @tc.desc      strategy matrix 827,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0119 begin`);
      logInfo("strategy matrix 827,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 5, 8], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 5, 8], 9, 60000) + '|' + metricListValid([0,1,3,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0120
     * @tc.name      Perf_StrategyMatrix_0120
     * @tc.desc      strategy matrix 834,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0120 begin`);
      logInfo("strategy matrix 834,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 6, 8], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 6, 8], 10, 60001) + '|' + metricListValid([1,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0121
     * @tc.name      Perf_StrategyMatrix_0121
     * @tc.desc      strategy matrix 841,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0121 begin`);
      logInfo("strategy matrix 841,1,999,,false");
      const actual: string = strategyValid([0, 3, 6, 8], 1, 999, "", false) + '|' + strategySummary([0, 3, 6, 8], 1, 999) + '|' + metricListValid([0,3,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0122
     * @tc.name      Perf_StrategyMatrix_0122
     * @tc.desc      strategy matrix 848,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0122 begin`);
      logInfo("strategy matrix 848,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([4, 6, 8], 2, 1000) + '|' + metricListValid([4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|1000|true");
      expect(actual).assertEqual("true|MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0123
     * @tc.name      Perf_StrategyMatrix_0123
     * @tc.desc      strategy matrix 855,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0123 begin`);
      logInfo("strategy matrix 855,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 4, 6, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 4, 6, 8], 3, 30000) + '|' + metricListValid([0,1,2,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0124
     * @tc.name      Perf_StrategyMatrix_0124
     * @tc.desc      strategy matrix 862,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0124 begin`);
      logInfo("strategy matrix 862,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 6, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 6, 8], 4, 50000) + '|' + metricListValid([1,2,3,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0125
     * @tc.name      Perf_StrategyMatrix_0125
     * @tc.desc      strategy matrix 869,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0125 begin`);
      logInfo("strategy matrix 869,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 5, 6, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 5, 6, 8], 5, 60000) + '|' + metricListValid([0,2,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0126
     * @tc.name      Perf_StrategyMatrix_0126
     * @tc.desc      strategy matrix 876,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0126 begin`);
      logInfo("strategy matrix 876,6,60001,,true");
      const actual: string = strategyValid([2, 3, 5, 6, 8], 6, 60001, "", true) + '|' + strategySummary([2, 3, 5, 6, 8], 6, 60001) + '|' + metricListValid([2,3,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0127
     * @tc.name      Perf_StrategyMatrix_0127
     * @tc.desc      strategy matrix 883,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0127 begin`);
      logInfo("strategy matrix 883,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 4, 5, 6, 8], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 4, 5, 6, 8], 7, 999) + '|' + metricListValid([0,1,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0128
     * @tc.name      Perf_StrategyMatrix_0128
     * @tc.desc      strategy matrix 890,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0128 begin`);
      logInfo("strategy matrix 890,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4, 5, 6, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4, 5, 6, 8], 8, 1000) + '|' + metricListValid([1,3,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0129
     * @tc.name      Perf_StrategyMatrix_0129
     * @tc.desc      strategy matrix 897,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0129 begin`);
      logInfo("strategy matrix 897,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 7, 8], 9, 30000) + '|' + metricListValid([0,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0130
     * @tc.name      Perf_StrategyMatrix_0130
     * @tc.desc      strategy matrix 904,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0130 begin`);
      logInfo("strategy matrix 904,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 7, 8], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 7, 8], 10, 50000) + '|' + metricListValid([3,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0131
     * @tc.name      Perf_StrategyMatrix_0131
     * @tc.desc      strategy matrix 911,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0131 begin`);
      logInfo("strategy matrix 911,1,60000,,true");
      const actual: string = strategyValid([0, 1, 2, 3, 7, 8], 1, 60000, "", true) + '|' + strategySummary([0, 1, 2, 3, 7, 8], 1, 60000) + '|' + metricListValid([0,1,2,3,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0132
     * @tc.name      Perf_StrategyMatrix_0132
     * @tc.desc      strategy matrix 918,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0132 begin`);
      logInfo("strategy matrix 918,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 7, 8], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 7, 8], 2, 60001) + '|' + metricListValid([1,2,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0133
     * @tc.name      Perf_StrategyMatrix_0133
     * @tc.desc      strategy matrix 925,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0133 begin`);
      logInfo("strategy matrix 925,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 3, 4, 7, 8], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 3, 4, 7, 8], 3, 999) + '|' + metricListValid([0,2,3,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0134
     * @tc.name      Perf_StrategyMatrix_0134
     * @tc.desc      strategy matrix 932,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0134 begin`);
      logInfo("strategy matrix 932,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 5, 7, 8], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 5, 7, 8], 4, 1000) + '|' + metricListValid([2,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0135
     * @tc.name      Perf_StrategyMatrix_0135
     * @tc.desc      strategy matrix 939,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0135 begin`);
      logInfo("strategy matrix 939,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 5, 7, 8], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 5, 7, 8], 5, 30000) + '|' + metricListValid([0,1,3,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0136
     * @tc.name      Perf_StrategyMatrix_0136
     * @tc.desc      strategy matrix 946,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0136 begin`);
      logInfo("strategy matrix 946,6,50000,,true");
      const actual: string = strategyValid([1, 4, 5, 7, 8], 6, 50000, "", true) + '|' + strategySummary([1, 4, 5, 7, 8], 6, 50000) + '|' + metricListValid([1,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|50000|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0137
     * @tc.name      Perf_StrategyMatrix_0137
     * @tc.desc      strategy matrix 953,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0137 begin`);
      logInfo("strategy matrix 953,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 4, 5, 7, 8], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 4, 5, 7, 8], 7, 60000) + '|' + metricListValid([0,3,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0138
     * @tc.name      Perf_StrategyMatrix_0138
     * @tc.desc      strategy matrix 960,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0138 begin`);
      logInfo("strategy matrix 960,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([6, 7, 8], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([6, 7, 8], 8, 60001) + '|' + metricListValid([6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|60001|true");
      expect(actual).assertEqual("false|LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0139
     * @tc.name      Perf_StrategyMatrix_0139
     * @tc.desc      strategy matrix 967,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0139 begin`);
      logInfo("strategy matrix 967,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 6, 7, 8], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 6, 7, 8], 9, 999) + '|' + metricListValid([0,1,2,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0140
     * @tc.name      Perf_StrategyMatrix_0140
     * @tc.desc      strategy matrix 974,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0140 begin`);
      logInfo("strategy matrix 974,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 6, 7, 8], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 6, 7, 8], 10, 1000) + '|' + metricListValid([1,2,3,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0141
     * @tc.name      Perf_StrategyMatrix_0141
     * @tc.desc      strategy matrix 981,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0141 begin`);
      logInfo("strategy matrix 981,1,30000,,true");
      const actual: string = strategyValid([0, 2, 4, 6, 7, 8], 1, 30000, "", true) + '|' + strategySummary([0, 2, 4, 6, 7, 8], 1, 30000) + '|' + metricListValid([0,2,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0142
     * @tc.name      Perf_StrategyMatrix_0142
     * @tc.desc      strategy matrix 988,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0142 begin`);
      logInfo("strategy matrix 988,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 6, 7, 8], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 6, 7, 8], 2, 50000) + '|' + metricListValid([2,3,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0143
     * @tc.name      Perf_StrategyMatrix_0143
     * @tc.desc      strategy matrix 995,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0143 begin`);
      logInfo("strategy matrix 995,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 5, 6, 7, 8], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 5, 6, 7, 8], 3, 60000) + '|' + metricListValid([0,1,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0144
     * @tc.name      Perf_StrategyMatrix_0144
     * @tc.desc      strategy matrix 1002,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0144 begin`);
      logInfo("strategy matrix 1002,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 5, 6, 7, 8], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 5, 6, 7, 8], 4, 60001) + '|' + metricListValid([1,3,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0145
     * @tc.name      Perf_StrategyMatrix_0145
     * @tc.desc      strategy matrix 1009,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0145 begin`);
      logInfo("strategy matrix 1009,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 4, 5, 6, 7, 8], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 4, 5, 6, 7, 8], 5, 999) + '|' + metricListValid([0,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0146
     * @tc.name      Perf_StrategyMatrix_0146
     * @tc.desc      strategy matrix 1016,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0146 begin`);
      logInfo("strategy matrix 1016,6,1000,,true");
      const actual: string = strategyValid([3, 4, 5, 6, 7, 8], 6, 1000, "", true) + '|' + strategySummary([3, 4, 5, 6, 7, 8], 6, 1000) + '|' + metricListValid([3,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      expect(actual).assertEqual("false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0147
     * @tc.name      Perf_StrategyMatrix_0147
     * @tc.desc      strategy matrix 1023,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0147 begin`);
      logInfo("strategy matrix 1023,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 5, 6, 7, 8], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 4, 5, 6, 7, 8], 7, 30000) + '|' + metricListValid([0,1,2,3,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0148
     * @tc.name      Perf_StrategyMatrix_0148
     * @tc.desc      strategy matrix 1030,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0148 begin`);
      logInfo("strategy matrix 1030,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2], 8, 50000) + '|' + metricListValid([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE|8|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0149
     * @tc.name      Perf_StrategyMatrix_0149
     * @tc.desc      strategy matrix 1037,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0149 begin`);
      logInfo("strategy matrix 1037,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3], 9, 60000) + '|' + metricListValid([0,2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0150
     * @tc.name      Perf_StrategyMatrix_0150
     * @tc.desc      strategy matrix 1044,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0150 begin`);
      logInfo("strategy matrix 1044,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4], 10, 60001) + '|' + metricListValid([2,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_PSS|10|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_PSS|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0151
     * @tc.name      Perf_StrategyMatrix_0151
     * @tc.desc      strategy matrix 1051,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0151 begin`);
      logInfo("strategy matrix 1051,1,999,,false");
      const actual: string = strategyValid([0, 1, 3, 4], 1, 999, "", false) + '|' + strategySummary([0, 1, 3, 4], 1, 999) + '|' + metricListValid([0,1,3,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0152
     * @tc.name      Perf_StrategyMatrix_0152
     * @tc.desc      strategy matrix 1058,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0152 begin`);
      logInfo("strategy matrix 1058,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 5], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 5], 2, 1000) + '|' + metricListValid([1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0153
     * @tc.name      Perf_StrategyMatrix_0153
     * @tc.desc      strategy matrix 1065,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0153 begin`);
      logInfo("strategy matrix 1065,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 5], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 5], 3, 30000) + '|' + metricListValid([0,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0154
     * @tc.name      Perf_StrategyMatrix_0154
     * @tc.desc      strategy matrix 1072,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0154 begin`);
      logInfo("strategy matrix 1072,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 5], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([4, 5], 4, 50000) + '|' + metricListValid([4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0155
     * @tc.name      Perf_StrategyMatrix_0155
     * @tc.desc      strategy matrix 1079,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0155 begin`);
      logInfo("strategy matrix 1079,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 4, 5], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 4, 5], 5, 60000) + '|' + metricListValid([0,1,2,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0156
     * @tc.name      Perf_StrategyMatrix_0156
     * @tc.desc      strategy matrix 1086,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0156 begin`);
      logInfo("strategy matrix 1086,6,60001,,true");
      const actual: string = strategyValid([1, 2, 3, 4, 5], 6, 60001, "", true) + '|' + strategySummary([1, 2, 3, 4, 5], 6, 60001) + '|' + metricListValid([1,2,3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0157
     * @tc.name      Perf_StrategyMatrix_0157
     * @tc.desc      strategy matrix 1093,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0157 begin`);
      logInfo("strategy matrix 1093,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 6], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 6], 7, 999) + '|' + metricListValid([0,2,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,LIST_SWIPE_FPS|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,LIST_SWIPE_FPS|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0158
     * @tc.name      Perf_StrategyMatrix_0158
     * @tc.desc      strategy matrix 1100,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0158 begin`);
      logInfo("strategy matrix 1100,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 6], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 6], 8, 1000) + '|' + metricListValid([2,3,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|8|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0159
     * @tc.name      Perf_StrategyMatrix_0159
     * @tc.desc      strategy matrix 1107,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0159 begin`);
      logInfo("strategy matrix 1107,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 4, 6], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 4, 6], 9, 30000) + '|' + metricListValid([0,1,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0160
     * @tc.name      Perf_StrategyMatrix_0160
     * @tc.desc      strategy matrix 1114,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0160 begin`);
      logInfo("strategy matrix 1114,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4, 6], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4, 6], 10, 50000) + '|' + metricListValid([1,3,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|10|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0161
     * @tc.name      Perf_StrategyMatrix_0161
     * @tc.desc      strategy matrix 1121,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0161 begin`);
      logInfo("strategy matrix 1121,1,60000,,true");
      const actual: string = strategyValid([0, 5, 6], 1, 60000, "", true) + '|' + strategySummary([0, 5, 6], 1, 60000) + '|' + metricListValid([0,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|1|60000|true");
      expect(actual).assertEqual("false|DURATION,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0162
     * @tc.name      Perf_StrategyMatrix_0162
     * @tc.desc      strategy matrix 1128,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0162 begin`);
      logInfo("strategy matrix 1128,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 5, 6], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([3, 5, 6], 2, 60001) + '|' + metricListValid([3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|2|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0163
     * @tc.name      Perf_StrategyMatrix_0163
     * @tc.desc      strategy matrix 1135,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0163 begin`);
      logInfo("strategy matrix 1135,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 3, 5, 6], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 3, 5, 6], 3, 999) + '|' + metricListValid([0,1,2,3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0164
     * @tc.name      Perf_StrategyMatrix_0164
     * @tc.desc      strategy matrix 1142,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0164 begin`);
      logInfo("strategy matrix 1142,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 5, 6], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 5, 6], 4, 1000) + '|' + metricListValid([1,2,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|4|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0165
     * @tc.name      Perf_StrategyMatrix_0165
     * @tc.desc      strategy matrix 1149,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0165 begin`);
      logInfo("strategy matrix 1149,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 4, 5, 6], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 4, 5, 6], 5, 30000) + '|' + metricListValid([0,2,3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0166
     * @tc.name      Perf_StrategyMatrix_0166
     * @tc.desc      strategy matrix 1156,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0166 begin`);
      logInfo("strategy matrix 1156,6,50000,,true");
      const actual: string = strategyValid([2, 7], 6, 50000, "", true) + '|' + strategySummary([2, 7], 6, 50000) + '|' + metricListValid([2,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,APP_START_RESPONSE_TIME|6|50000|true");
      expect(actual).assertEqual("false|CPU_USAGE,APP_START_RESPONSE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0167
     * @tc.name      Perf_StrategyMatrix_0167
     * @tc.desc      strategy matrix 1163,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0167 begin`);
      logInfo("strategy matrix 1163,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 7], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 7], 7, 60000) + '|' + metricListValid([0,1,3,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,APP_START_RESPONSE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,APP_START_RESPONSE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0168
     * @tc.name      Perf_StrategyMatrix_0168
     * @tc.desc      strategy matrix 1170,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0168 begin`);
      logInfo("strategy matrix 1170,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 7], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 7], 8, 60001) + '|' + metricListValid([1,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_PSS,APP_START_RESPONSE_TIME|8|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_PSS,APP_START_RESPONSE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0169
     * @tc.name      Perf_StrategyMatrix_0169
     * @tc.desc      strategy matrix 1177,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0169 begin`);
      logInfo("strategy matrix 1177,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 3, 4, 7], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 3, 4, 7], 9, 999) + '|' + metricListValid([0,3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0170
     * @tc.name      Perf_StrategyMatrix_0170
     * @tc.desc      strategy matrix 1184,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0170 begin`);
      logInfo("strategy matrix 1184,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([5, 7], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([5, 7], 10, 1000) + '|' + metricListValid([5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|10|1000|true");
      expect(actual).assertEqual("true|PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0171
     * @tc.name      Perf_StrategyMatrix_0171
     * @tc.desc      strategy matrix 1191,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0171 begin`);
      logInfo("strategy matrix 1191,1,30000,,true");
      const actual: string = strategyValid([0, 1, 2, 5, 7], 1, 30000, "", true) + '|' + strategySummary([0, 1, 2, 5, 7], 1, 30000) + '|' + metricListValid([0,1,2,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0172
     * @tc.name      Perf_StrategyMatrix_0172
     * @tc.desc      strategy matrix 1198,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0172 begin`);
      logInfo("strategy matrix 1198,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 5, 7], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 5, 7], 2, 50000) + '|' + metricListValid([1,2,3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0173
     * @tc.name      Perf_StrategyMatrix_0173
     * @tc.desc      strategy matrix 1205,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0173 begin`);
      logInfo("strategy matrix 1205,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 4, 5, 7], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 4, 5, 7], 3, 60000) + '|' + metricListValid([0,2,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0174
     * @tc.name      Perf_StrategyMatrix_0174
     * @tc.desc      strategy matrix 1212,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0174 begin`);
      logInfo("strategy matrix 1212,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 5, 7], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 5, 7], 4, 60001) + '|' + metricListValid([2,3,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0175
     * @tc.name      Perf_StrategyMatrix_0175
     * @tc.desc      strategy matrix 1219,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0175 begin`);
      logInfo("strategy matrix 1219,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 6, 7], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 6, 7], 5, 999) + '|' + metricListValid([0,1,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0176
     * @tc.name      Perf_StrategyMatrix_0176
     * @tc.desc      strategy matrix 1226,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0176 begin`);
      logInfo("strategy matrix 1226,6,1000,,true");
      const actual: string = strategyValid([1, 3, 6, 7], 6, 1000, "", true) + '|' + strategySummary([1, 3, 6, 7], 6, 1000) + '|' + metricListValid([1,3,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|1000|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0177
     * @tc.name      Perf_StrategyMatrix_0177
     * @tc.desc      strategy matrix 1233,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0177 begin`);
      logInfo("strategy matrix 1233,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 4, 6, 7], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 4, 6, 7], 7, 30000) + '|' + metricListValid([0,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0178
     * @tc.name      Perf_StrategyMatrix_0178
     * @tc.desc      strategy matrix 1240,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0178 begin`);
      logInfo("strategy matrix 1240,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 6, 7], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 6, 7], 8, 50000) + '|' + metricListValid([3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|50000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0179
     * @tc.name      Perf_StrategyMatrix_0179
     * @tc.desc      strategy matrix 1247,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0179 begin`);
      logInfo("strategy matrix 1247,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 6, 7], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 4, 6, 7], 9, 60000) + '|' + metricListValid([0,1,2,3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0180
     * @tc.name      Perf_StrategyMatrix_0180
     * @tc.desc      strategy matrix 1254,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0180 begin`);
      logInfo("strategy matrix 1254,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 5, 6, 7], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 5, 6, 7], 10, 60001) + '|' + metricListValid([1,2,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0181
     * @tc.name      Perf_StrategyMatrix_0181
     * @tc.desc      strategy matrix 1261,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0181 begin`);
      logInfo("strategy matrix 1261,1,999,,false");
      const actual: string = strategyValid([0, 2, 3, 5, 6, 7], 1, 999, "", false) + '|' + strategySummary([0, 2, 3, 5, 6, 7], 1, 999) + '|' + metricListValid([0,2,3,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0182
     * @tc.name      Perf_StrategyMatrix_0182
     * @tc.desc      strategy matrix 1268,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0182 begin`);
      logInfo("strategy matrix 1268,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 5, 6, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 5, 6, 7], 2, 1000) + '|' + metricListValid([2,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0183
     * @tc.name      Perf_StrategyMatrix_0183
     * @tc.desc      strategy matrix 1275,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0183 begin`);
      logInfo("strategy matrix 1275,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 5, 6, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 5, 6, 7], 3, 30000) + '|' + metricListValid([0,1,3,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0184
     * @tc.name      Perf_StrategyMatrix_0184
     * @tc.desc      strategy matrix 1282,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0184 begin`);
      logInfo("strategy matrix 1282,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 8], 4, 50000) + '|' + metricListValid([1,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,APP_START_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,APP_START_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0185
     * @tc.name      Perf_StrategyMatrix_0185
     * @tc.desc      strategy matrix 1289,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0185 begin`);
      logInfo("strategy matrix 1289,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 8], 5, 60000) + '|' + metricListValid([0,3,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,APP_START_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,APP_START_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0186
     * @tc.name      Perf_StrategyMatrix_0186
     * @tc.desc      strategy matrix 1296,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0186 begin`);
      logInfo("strategy matrix 1296,6,60001,,true");
      const actual: string = strategyValid([4, 8], 6, 60001, "", true) + '|' + strategySummary([4, 8], 6, 60001) + '|' + metricListValid([4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_PSS,APP_START_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|MEMORY_PSS,APP_START_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0187
     * @tc.name      Perf_StrategyMatrix_0187
     * @tc.desc      strategy matrix 1303,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0187 begin`);
      logInfo("strategy matrix 1303,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 4, 8], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 4, 8], 7, 999) + '|' + metricListValid([0,1,2,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0188
     * @tc.name      Perf_StrategyMatrix_0188
     * @tc.desc      strategy matrix 1310,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0188 begin`);
      logInfo("strategy matrix 1310,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 8], 8, 1000) + '|' + metricListValid([1,2,3,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0189
     * @tc.name      Perf_StrategyMatrix_0189
     * @tc.desc      strategy matrix 1317,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0189 begin`);
      logInfo("strategy matrix 1317,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 5, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 5, 8], 9, 30000) + '|' + metricListValid([0,2,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0190
     * @tc.name      Perf_StrategyMatrix_0190
     * @tc.desc      strategy matrix 1324,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0190 begin`);
      logInfo("strategy matrix 1324,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 5, 8], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 5, 8], 10, 50000) + '|' + metricListValid([2,3,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0191
     * @tc.name      Perf_StrategyMatrix_0191
     * @tc.desc      strategy matrix 1331,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0191 begin`);
      logInfo("strategy matrix 1331,1,60000,,true");
      const actual: string = strategyValid([0, 1, 4, 5, 8], 1, 60000, "", true) + '|' + strategySummary([0, 1, 4, 5, 8], 1, 60000) + '|' + metricListValid([0,1,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0192
     * @tc.name      Perf_StrategyMatrix_0192
     * @tc.desc      strategy matrix 1338,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0192 begin`);
      logInfo("strategy matrix 1338,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4, 5, 8], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4, 5, 8], 2, 60001) + '|' + metricListValid([1,3,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0193
     * @tc.name      Perf_StrategyMatrix_0193
     * @tc.desc      strategy matrix 1345,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0193 begin`);
      logInfo("strategy matrix 1345,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 6, 8], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 6, 8], 3, 999) + '|' + metricListValid([0,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0194
     * @tc.name      Perf_StrategyMatrix_0194
     * @tc.desc      strategy matrix 1352,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0194 begin`);
      logInfo("strategy matrix 1352,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 6, 8], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 6, 8], 4, 1000) + '|' + metricListValid([3,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|1000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0195
     * @tc.name      Perf_StrategyMatrix_0195
     * @tc.desc      strategy matrix 1359,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0195 begin`);
      logInfo("strategy matrix 1359,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 6, 8], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 6, 8], 5, 30000) + '|' + metricListValid([0,1,2,3,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0196
     * @tc.name      Perf_StrategyMatrix_0196
     * @tc.desc      strategy matrix 1366,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0196 begin`);
      logInfo("strategy matrix 1366,6,50000,,true");
      const actual: string = strategyValid([1, 2, 4, 6, 8], 6, 50000, "", true) + '|' + strategySummary([1, 2, 4, 6, 8], 6, 50000) + '|' + metricListValid([1,2,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|50000|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0197
     * @tc.name      Perf_StrategyMatrix_0197
     * @tc.desc      strategy matrix 1373,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0197 begin`);
      logInfo("strategy matrix 1373,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 4, 6, 8], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 4, 6, 8], 7, 60000) + '|' + metricListValid([0,2,3,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0198
     * @tc.name      Perf_StrategyMatrix_0198
     * @tc.desc      strategy matrix 1380,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0198 begin`);
      logInfo("strategy matrix 1380,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 5, 6, 8], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 5, 6, 8], 8, 60001) + '|' + metricListValid([2,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0199
     * @tc.name      Perf_StrategyMatrix_0199
     * @tc.desc      strategy matrix 1387,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0199 begin`);
      logInfo("strategy matrix 1387,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 3, 5, 6, 8], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 3, 5, 6, 8], 9, 999) + '|' + metricListValid([0,1,3,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0200
     * @tc.name      Perf_StrategyMatrix_0200
     * @tc.desc      strategy matrix 1394,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0200 begin`);
      logInfo("strategy matrix 1394,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 5, 6, 8], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 5, 6, 8], 10, 1000) + '|' + metricListValid([1,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0201
     * @tc.name      Perf_StrategyMatrix_0201
     * @tc.desc      strategy matrix 1401,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0201 begin`);
      logInfo("strategy matrix 1401,1,30000,,true");
      const actual: string = strategyValid([0, 3, 4, 5, 6, 8], 1, 30000, "", true) + '|' + strategySummary([0, 3, 4, 5, 6, 8], 1, 30000) + '|' + metricListValid([0,3,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0202
     * @tc.name      Perf_StrategyMatrix_0202
     * @tc.desc      strategy matrix 1408,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0202 begin`);
      logInfo("strategy matrix 1408,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([7, 8], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([7, 8], 2, 50000) + '|' + metricListValid([7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0203
     * @tc.name      Perf_StrategyMatrix_0203
     * @tc.desc      strategy matrix 1415,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0203 begin`);
      logInfo("strategy matrix 1415,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 7, 8], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 7, 8], 3, 60000) + '|' + metricListValid([0,1,2,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0204
     * @tc.name      Perf_StrategyMatrix_0204
     * @tc.desc      strategy matrix 1422,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0204 begin`);
      logInfo("strategy matrix 1422,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 7, 8], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 7, 8], 4, 60001) + '|' + metricListValid([1,2,3,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0205
     * @tc.name      Perf_StrategyMatrix_0205
     * @tc.desc      strategy matrix 1429,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0205 begin`);
      logInfo("strategy matrix 1429,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 4, 7, 8], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 4, 7, 8], 5, 999) + '|' + metricListValid([0,2,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0206
     * @tc.name      Perf_StrategyMatrix_0206
     * @tc.desc      strategy matrix 1436,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0206 begin`);
      logInfo("strategy matrix 1436,6,1000,,true");
      const actual: string = strategyValid([2, 3, 4, 7, 8], 6, 1000, "", true) + '|' + strategySummary([2, 3, 4, 7, 8], 6, 1000) + '|' + metricListValid([2,3,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0207
     * @tc.name      Perf_StrategyMatrix_0207
     * @tc.desc      strategy matrix 1443,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0207 begin`);
      logInfo("strategy matrix 1443,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 5, 7, 8], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 5, 7, 8], 7, 30000) + '|' + metricListValid([0,1,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0208
     * @tc.name      Perf_StrategyMatrix_0208
     * @tc.desc      strategy matrix 1450,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0208 begin`);
      logInfo("strategy matrix 1450,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 5, 7, 8], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 5, 7, 8], 8, 50000) + '|' + metricListValid([1,3,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0209
     * @tc.name      Perf_StrategyMatrix_0209
     * @tc.desc      strategy matrix 1457,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0209 begin`);
      logInfo("strategy matrix 1457,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 4, 5, 7, 8], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 4, 5, 7, 8], 9, 60000) + '|' + metricListValid([0,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0210
     * @tc.name      Perf_StrategyMatrix_0210
     * @tc.desc      strategy matrix 1464,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0210 begin`);
      logInfo("strategy matrix 1464,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 5, 7, 8], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 5, 7, 8], 10, 60001) + '|' + metricListValid([3,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0211
     * @tc.name      Perf_StrategyMatrix_0211
     * @tc.desc      strategy matrix 1471,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0211 begin`);
      logInfo("strategy matrix 1471,1,999,,false");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 5, 7, 8], 1, 999, "", false) + '|' + strategySummary([0, 1, 2, 3, 4, 5, 7, 8], 1, 999) + '|' + metricListValid([0,1,2,3,4,5,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0212
     * @tc.name      Perf_StrategyMatrix_0212
     * @tc.desc      strategy matrix 1478,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0212 begin`);
      logInfo("strategy matrix 1478,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 6, 7, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 6, 7, 8], 2, 1000) + '|' + metricListValid([1,2,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0213
     * @tc.name      Perf_StrategyMatrix_0213
     * @tc.desc      strategy matrix 1485,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0213 begin`);
      logInfo("strategy matrix 1485,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 6, 7, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 6, 7, 8], 3, 30000) + '|' + metricListValid([0,2,3,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0214
     * @tc.name      Perf_StrategyMatrix_0214
     * @tc.desc      strategy matrix 1492,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0214 begin`);
      logInfo("strategy matrix 1492,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 6, 7, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 6, 7, 8], 4, 50000) + '|' + metricListValid([2,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0215
     * @tc.name      Perf_StrategyMatrix_0215
     * @tc.desc      strategy matrix 1499,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0215 begin`);
      logInfo("strategy matrix 1499,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 6, 7, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 6, 7, 8], 5, 60000) + '|' + metricListValid([0,1,3,4,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0216
     * @tc.name      Perf_StrategyMatrix_0216
     * @tc.desc      strategy matrix 1506,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0216 begin`);
      logInfo("strategy matrix 1506,6,60001,,true");
      const actual: string = strategyValid([1, 5, 6, 7, 8], 6, 60001, "", true) + '|' + strategySummary([1, 5, 6, 7, 8], 6, 60001) + '|' + metricListValid([1,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0217
     * @tc.name      Perf_StrategyMatrix_0217
     * @tc.desc      strategy matrix 1513,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0217 begin`);
      logInfo("strategy matrix 1513,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 3, 5, 6, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 3, 5, 6, 7, 8], 7, 999) + '|' + metricListValid([0,3,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0218
     * @tc.name      Perf_StrategyMatrix_0218
     * @tc.desc      strategy matrix 1520,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0218 begin`);
      logInfo("strategy matrix 1520,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 5, 6, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([4, 5, 6, 7, 8], 8, 1000) + '|' + metricListValid([4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0219
     * @tc.name      Perf_StrategyMatrix_0219
     * @tc.desc      strategy matrix 1527,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0219 begin`);
      logInfo("strategy matrix 1527,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 4, 5, 6, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 4, 5, 6, 7, 8], 9, 30000) + '|' + metricListValid([0,1,2,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0220
     * @tc.name      Perf_StrategyMatrix_0220
     * @tc.desc      strategy matrix 1534,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0220 begin`);
      logInfo("strategy matrix 1534,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 5, 6, 7, 8], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 5, 6, 7, 8], 10, 50000) + '|' + metricListValid([1,2,3,4,5,6,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0221
     * @tc.name      Perf_StrategyMatrix_0221
     * @tc.desc      strategy matrix 1541,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0221 begin`);
      logInfo("strategy matrix 1541,1,60000,,true");
      const actual: string = strategyValid([0, 2], 1, 60000, "", true) + '|' + strategySummary([0, 2], 1, 60000) + '|' + metricListValid([0,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0222
     * @tc.name      Perf_StrategyMatrix_0222
     * @tc.desc      strategy matrix 1548,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0222 begin`);
      logInfo("strategy matrix 1548,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3], 2, 60001) + '|' + metricListValid([2,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS|2|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0223
     * @tc.name      Perf_StrategyMatrix_0223
     * @tc.desc      strategy matrix 1555,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0223 begin`);
      logInfo("strategy matrix 1555,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 4], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 4], 3, 999) + '|' + metricListValid([0,1,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_PSS|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_PSS|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0224
     * @tc.name      Perf_StrategyMatrix_0224
     * @tc.desc      strategy matrix 1562,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0224 begin`);
      logInfo("strategy matrix 1562,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 4], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 4], 4, 1000) + '|' + metricListValid([1,3,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS|4|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,MEMORY_PSS|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0225
     * @tc.name      Perf_StrategyMatrix_0225
     * @tc.desc      strategy matrix 1569,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0225 begin`);
      logInfo("strategy matrix 1569,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 5], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 5], 5, 30000) + '|' + metricListValid([0,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,PAGE_SWITCH_COMPLETE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,PAGE_SWITCH_COMPLETE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0226
     * @tc.name      Perf_StrategyMatrix_0226
     * @tc.desc      strategy matrix 1576,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0226 begin`);
      logInfo("strategy matrix 1576,6,50000,,true");
      const actual: string = strategyValid([3, 5], 6, 50000, "", true) + '|' + strategySummary([3, 5], 6, 50000) + '|' + metricListValid([3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|6|50000|true");
      expect(actual).assertEqual("false|MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0227
     * @tc.name      Perf_StrategyMatrix_0227
     * @tc.desc      strategy matrix 1583,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0227 begin`);
      logInfo("strategy matrix 1583,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 5], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 5], 7, 60000) + '|' + metricListValid([0,1,2,3,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0228
     * @tc.name      Perf_StrategyMatrix_0228
     * @tc.desc      strategy matrix 1590,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0228 begin`);
      logInfo("strategy matrix 1590,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 5], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 5], 8, 60001) + '|' + metricListValid([1,2,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|8|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0229
     * @tc.name      Perf_StrategyMatrix_0229
     * @tc.desc      strategy matrix 1597,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0229 begin`);
      logInfo("strategy matrix 1597,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 3, 4, 5], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 3, 4, 5], 9, 999) + '|' + metricListValid([0,2,3,4,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0230
     * @tc.name      Perf_StrategyMatrix_0230
     * @tc.desc      strategy matrix 1604,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0230 begin`);
      logInfo("strategy matrix 1604,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 6], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 6], 10, 1000) + '|' + metricListValid([2,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,LIST_SWIPE_FPS|10|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,LIST_SWIPE_FPS|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0231
     * @tc.name      Perf_StrategyMatrix_0231
     * @tc.desc      strategy matrix 1611,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0231 begin`);
      logInfo("strategy matrix 1611,1,30000,,true");
      const actual: string = strategyValid([0, 1, 3, 6], 1, 30000, "", true) + '|' + strategySummary([0, 1, 3, 6], 1, 30000) + '|' + metricListValid([0,1,3,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,LIST_SWIPE_FPS|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0232
     * @tc.name      Perf_StrategyMatrix_0232
     * @tc.desc      strategy matrix 1618,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0232 begin`);
      logInfo("strategy matrix 1618,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 6], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 6], 2, 50000) + '|' + metricListValid([1,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS|2|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_PSS,LIST_SWIPE_FPS|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0233
     * @tc.name      Perf_StrategyMatrix_0233
     * @tc.desc      strategy matrix 1625,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0233 begin`);
      logInfo("strategy matrix 1625,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 4, 6], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 4, 6], 3, 60000) + '|' + metricListValid([0,3,4,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|3|60000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0234
     * @tc.name      Perf_StrategyMatrix_0234
     * @tc.desc      strategy matrix 1632,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0234 begin`);
      logInfo("strategy matrix 1632,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([5, 6], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([5, 6], 4, 60001) + '|' + metricListValid([5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|4|60001|true");
      expect(actual).assertEqual("false|PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0235
     * @tc.name      Perf_StrategyMatrix_0235
     * @tc.desc      strategy matrix 1639,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0235 begin`);
      logInfo("strategy matrix 1639,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 5, 6], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 5, 6], 5, 999) + '|' + metricListValid([0,1,2,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0236
     * @tc.name      Perf_StrategyMatrix_0236
     * @tc.desc      strategy matrix 1646,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0236 begin`);
      logInfo("strategy matrix 1646,6,1000,,true");
      const actual: string = strategyValid([1, 2, 3, 5, 6], 6, 1000, "", true) + '|' + strategySummary([1, 2, 3, 5, 6], 6, 1000) + '|' + metricListValid([1,2,3,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|6|1000|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0237
     * @tc.name      Perf_StrategyMatrix_0237
     * @tc.desc      strategy matrix 1653,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0237 begin`);
      logInfo("strategy matrix 1653,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 4, 5, 6], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 4, 5, 6], 7, 30000) + '|' + metricListValid([0,2,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0238
     * @tc.name      Perf_StrategyMatrix_0238
     * @tc.desc      strategy matrix 1660,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0238 begin`);
      logInfo("strategy matrix 1660,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 5, 6], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 5, 6], 8, 50000) + '|' + metricListValid([2,3,4,5,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0239
     * @tc.name      Perf_StrategyMatrix_0239
     * @tc.desc      strategy matrix 1667,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0239 begin`);
      logInfo("strategy matrix 1667,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 7], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 7], 9, 60000) + '|' + metricListValid([0,1,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,APP_START_RESPONSE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,APP_START_RESPONSE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0240
     * @tc.name      Perf_StrategyMatrix_0240
     * @tc.desc      strategy matrix 1674,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0240 begin`);
      logInfo("strategy matrix 1674,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 7], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 7], 10, 60001) + '|' + metricListValid([1,3,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,APP_START_RESPONSE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,APP_START_RESPONSE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0241
     * @tc.name      Perf_StrategyMatrix_0241
     * @tc.desc      strategy matrix 1681,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0241 begin`);
      logInfo("strategy matrix 1681,1,999,,false");
      const actual: string = strategyValid([0, 4, 7], 1, 999, "", false) + '|' + strategySummary([0, 4, 7], 1, 999) + '|' + metricListValid([0,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_PSS,APP_START_RESPONSE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_PSS,APP_START_RESPONSE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0242
     * @tc.name      Perf_StrategyMatrix_0242
     * @tc.desc      strategy matrix 1688,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0242 begin`);
      logInfo("strategy matrix 1688,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 7], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 7], 2, 1000) + '|' + metricListValid([3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|2|1000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0243
     * @tc.name      Perf_StrategyMatrix_0243
     * @tc.desc      strategy matrix 1695,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0243 begin`);
      logInfo("strategy matrix 1695,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 7], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 4, 7], 3, 30000) + '|' + metricListValid([0,1,2,3,4,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0244
     * @tc.name      Perf_StrategyMatrix_0244
     * @tc.desc      strategy matrix 1702,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0244 begin`);
      logInfo("strategy matrix 1702,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 5, 7], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 5, 7], 4, 50000) + '|' + metricListValid([1,2,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0245
     * @tc.name      Perf_StrategyMatrix_0245
     * @tc.desc      strategy matrix 1709,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0245 begin`);
      logInfo("strategy matrix 1709,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 3, 5, 7], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 3, 5, 7], 5, 60000) + '|' + metricListValid([0,2,3,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0246
     * @tc.name      Perf_StrategyMatrix_0246
     * @tc.desc      strategy matrix 1716,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0246 begin`);
      logInfo("strategy matrix 1716,6,60001,,true");
      const actual: string = strategyValid([2, 4, 5, 7], 6, 60001, "", true) + '|' + strategySummary([2, 4, 5, 7], 6, 60001) + '|' + metricListValid([2,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0247
     * @tc.name      Perf_StrategyMatrix_0247
     * @tc.desc      strategy matrix 1723,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0247 begin`);
      logInfo("strategy matrix 1723,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 3, 4, 5, 7], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 3, 4, 5, 7], 7, 999) + '|' + metricListValid([0,1,3,4,5,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_RESPONSE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0248
     * @tc.name      Perf_StrategyMatrix_0248
     * @tc.desc      strategy matrix 1730,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0248 begin`);
      logInfo("strategy matrix 1730,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 6, 7], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 6, 7], 8, 1000) + '|' + metricListValid([1,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0249
     * @tc.name      Perf_StrategyMatrix_0249
     * @tc.desc      strategy matrix 1737,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0249 begin`);
      logInfo("strategy matrix 1737,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 3, 6, 7], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 3, 6, 7], 9, 30000) + '|' + metricListValid([0,3,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0250
     * @tc.name      Perf_StrategyMatrix_0250
     * @tc.desc      strategy matrix 1744,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0250 begin`);
      logInfo("strategy matrix 1744,10,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([4, 6, 7], 10, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([4, 6, 7], 10, 50000) + '|' + metricListValid([4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|50000|true");
      expect(actual).assertEqual("true|MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|10|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0251
     * @tc.name      Perf_StrategyMatrix_0251
     * @tc.desc      strategy matrix 1751,1,60000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0251 begin`);
      logInfo("strategy matrix 1751,1,60000,,true");
      const actual: string = strategyValid([0, 1, 2, 4, 6, 7], 1, 60000, "", true) + '|' + strategySummary([0, 1, 2, 4, 6, 7], 1, 60000) + '|' + metricListValid([0,1,2,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|60000|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|1|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0252
     * @tc.name      Perf_StrategyMatrix_0252
     * @tc.desc      strategy matrix 1758,2,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0252 begin`);
      logInfo("strategy matrix 1758,2,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 4, 6, 7], 2, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 4, 6, 7], 2, 60001) + '|' + metricListValid([1,2,3,4,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|2|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0253
     * @tc.name      Perf_StrategyMatrix_0253
     * @tc.desc      strategy matrix 1765,3,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0253 begin`);
      logInfo("strategy matrix 1765,3,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 5, 6, 7], 3, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 5, 6, 7], 3, 999) + '|' + metricListValid([0,2,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|3|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0254
     * @tc.name      Perf_StrategyMatrix_0254
     * @tc.desc      strategy matrix 1772,4,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0254 begin`);
      logInfo("strategy matrix 1772,4,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 5, 6, 7], 4, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 5, 6, 7], 4, 1000) + '|' + metricListValid([2,3,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|4|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0255
     * @tc.name      Perf_StrategyMatrix_0255
     * @tc.desc      strategy matrix 1779,5,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0255 begin`);
      logInfo("strategy matrix 1779,5,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 4, 5, 6, 7], 5, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 4, 5, 6, 7], 5, 30000) + '|' + metricListValid([0,1,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|5|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0256
     * @tc.name      Perf_StrategyMatrix_0256
     * @tc.desc      strategy matrix 1786,6,50000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0256 begin`);
      logInfo("strategy matrix 1786,6,50000,,true");
      const actual: string = strategyValid([1, 3, 4, 5, 6, 7], 6, 50000, "", true) + '|' + strategySummary([1, 3, 4, 5, 6, 7], 6, 50000) + '|' + metricListValid([1,3,4,5,6,7]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|50000|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_RESPONSE_TIME|6|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0257
     * @tc.name      Perf_StrategyMatrix_0257
     * @tc.desc      strategy matrix 1793,7,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0257 begin`);
      logInfo("strategy matrix 1793,7,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 8], 7, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 8], 7, 60000) + '|' + metricListValid([0,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,APP_START_COMPLETE_TIME|7|60000|true");
      expect(actual).assertEqual("true|DURATION,APP_START_COMPLETE_TIME|7|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0258
     * @tc.name      Perf_StrategyMatrix_0258
     * @tc.desc      strategy matrix 1800,8,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0258 begin`);
      logInfo("strategy matrix 1800,8,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 8], 8, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([3, 8], 8, 60001) + '|' + metricListValid([3,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|MEMORY_RSS,APP_START_COMPLETE_TIME|8|60001|true");
      expect(actual).assertEqual("false|MEMORY_RSS,APP_START_COMPLETE_TIME|8|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0259
     * @tc.name      Perf_StrategyMatrix_0259
     * @tc.desc      strategy matrix 1807,9,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0259 begin`);
      logInfo("strategy matrix 1807,9,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 1, 2, 3, 8], 9, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 1, 2, 3, 8], 9, 999) + '|' + metricListValid([0,1,2,3,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_COMPLETE_TIME|9|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,APP_START_COMPLETE_TIME|9|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0260
     * @tc.name      Perf_StrategyMatrix_0260
     * @tc.desc      strategy matrix 1814,10,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0260 begin`);
      logInfo("strategy matrix 1814,10,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 4, 8], 10, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 4, 8], 10, 1000) + '|' + metricListValid([1,2,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_COMPLETE_TIME|10|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_PSS,APP_START_COMPLETE_TIME|10|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0261
     * @tc.name      Perf_StrategyMatrix_0261
     * @tc.desc      strategy matrix 1821,1,30000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0261 begin`);
      logInfo("strategy matrix 1821,1,30000,,true");
      const actual: string = strategyValid([0, 2, 3, 4, 8], 1, 30000, "", true) + '|' + strategySummary([0, 2, 3, 4, 8], 1, 30000) + '|' + metricListValid([0,2,3,4,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|1|30000|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,APP_START_COMPLETE_TIME|1|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0262
     * @tc.name      Perf_StrategyMatrix_0262
     * @tc.desc      strategy matrix 1828,2,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0262 begin`);
      logInfo("strategy matrix 1828,2,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 5, 8], 2, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 5, 8], 2, 50000) + '|' + metricListValid([2,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      expect(actual).assertEqual("true|CPU_USAGE,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|2|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0263
     * @tc.name      Perf_StrategyMatrix_0263
     * @tc.desc      strategy matrix 1835,3,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0263 begin`);
      logInfo("strategy matrix 1835,3,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 5, 8], 3, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 5, 8], 3, 60000) + '|' + metricListValid([0,1,3,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|3|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0264
     * @tc.name      Perf_StrategyMatrix_0264
     * @tc.desc      strategy matrix 1842,4,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0264 begin`);
      logInfo("strategy matrix 1842,4,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 4, 5, 8], 4, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([1, 4, 5, 8], 4, 60001) + '|' + metricListValid([1,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|4|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0265
     * @tc.name      Perf_StrategyMatrix_0265
     * @tc.desc      strategy matrix 1849,5,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0265 begin`);
      logInfo("strategy matrix 1849,5,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 3, 4, 5, 8], 5, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 3, 4, 5, 8], 5, 999) + '|' + metricListValid([0,3,4,5,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      expect(actual).assertEqual("false|DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,APP_START_COMPLETE_TIME|5|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0266
     * @tc.name      Perf_StrategyMatrix_0266
     * @tc.desc      strategy matrix 1856,6,1000,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0266 begin`);
      logInfo("strategy matrix 1856,6,1000,,true");
      const actual: string = strategyValid([6, 8], 6, 1000, "", true) + '|' + strategySummary([6, 8], 6, 1000) + '|' + metricListValid([6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|1000|true");
      expect(actual).assertEqual("false|LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|6|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0267
     * @tc.name      Perf_StrategyMatrix_0267
     * @tc.desc      strategy matrix 1863,7,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0267 begin`);
      logInfo("strategy matrix 1863,7,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 6, 8], 7, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 6, 8], 7, 30000) + '|' + metricListValid([0,1,2,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|7|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0268
     * @tc.name      Perf_StrategyMatrix_0268
     * @tc.desc      strategy matrix 1870,8,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0268 begin`);
      logInfo("strategy matrix 1870,8,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 2, 3, 6, 8], 8, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 2, 3, 6, 8], 8, 50000) + '|' + metricListValid([1,2,3,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|50000|true");
      expect(actual).assertEqual("true|CPU_LOAD,CPU_USAGE,MEMORY_RSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|8|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0269
     * @tc.name      Perf_StrategyMatrix_0269
     * @tc.desc      strategy matrix 1877,9,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0269 begin`);
      logInfo("strategy matrix 1877,9,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 2, 4, 6, 8], 9, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 2, 4, 6, 8], 9, 60000) + '|' + metricListValid([0,2,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_USAGE,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|9|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0270
     * @tc.name      Perf_StrategyMatrix_0270
     * @tc.desc      strategy matrix 1884,10,60001,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0270 begin`);
      logInfo("strategy matrix 1884,10,60001,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 3, 4, 6, 8], 10, 60001, "com.samples.test.perftest", true) + '|' + strategySummary([2, 3, 4, 6, 8], 10, 60001) + '|' + metricListValid([2,3,4,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|60001|true");
      expect(actual).assertEqual("false|CPU_USAGE,MEMORY_RSS,MEMORY_PSS,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|10|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0271
     * @tc.name      Perf_StrategyMatrix_0271
     * @tc.desc      strategy matrix 1891,1,999,,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0271 begin`);
      logInfo("strategy matrix 1891,1,999,,false");
      const actual: string = strategyValid([0, 1, 5, 6, 8], 1, 999, "", false) + '|' + strategySummary([0, 1, 5, 6, 8], 1, 999) + '|' + metricListValid([0,1,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_LOAD,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|1|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0272
     * @tc.name      Perf_StrategyMatrix_0272
     * @tc.desc      strategy matrix 1898,2,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0272 begin`);
      logInfo("strategy matrix 1898,2,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([1, 3, 5, 6, 8], 2, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([1, 3, 5, 6, 8], 2, 1000) + '|' + metricListValid([1,3,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|1000|true");
      expect(actual).assertEqual("true|CPU_LOAD,MEMORY_RSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|2|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0273
     * @tc.name      Perf_StrategyMatrix_0273
     * @tc.desc      strategy matrix 1905,3,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_StrategyMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0273 begin`);
      logInfo("strategy matrix 1905,3,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 4, 5, 6, 8], 3, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 4, 5, 6, 8], 3, 30000) + '|' + metricListValid([0,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|30000|true");
      expect(actual).assertEqual("true|DURATION,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|3|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0274
     * @tc.name      Perf_StrategyMatrix_0274
     * @tc.desc      strategy matrix 1912,4,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0274 begin`);
      logInfo("strategy matrix 1912,4,50000,com.samples.test.perftest,true");
      const actual: string = strategyValid([3, 4, 5, 6, 8], 4, 50000, "com.samples.test.perftest", true) + '|' + strategySummary([3, 4, 5, 6, 8], 4, 50000) + '|' + metricListValid([3,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|50000|true");
      expect(actual).assertEqual("true|MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|4|50000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0275
     * @tc.name      Perf_StrategyMatrix_0275
     * @tc.desc      strategy matrix 1919,5,60000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0275 begin`);
      logInfo("strategy matrix 1919,5,60000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 2, 3, 4, 5, 6, 8], 5, 60000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 2, 3, 4, 5, 6, 8], 5, 60000) + '|' + metricListValid([0,1,2,3,4,5,6,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|60000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME,LIST_SWIPE_FPS,APP_START_COMPLETE_TIME|5|60000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0276
     * @tc.name      Perf_StrategyMatrix_0276
     * @tc.desc      strategy matrix 1926,6,60001,,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_StrategyMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0276 begin`);
      logInfo("strategy matrix 1926,6,60001,,true");
      const actual: string = strategyValid([1, 2, 7, 8], 6, 60001, "", true) + '|' + strategySummary([1, 2, 7, 8], 6, 60001) + '|' + metricListValid([1,2,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      expect(actual).assertEqual("false|CPU_LOAD,CPU_USAGE,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|6|60001|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0277
     * @tc.name      Perf_StrategyMatrix_0277
     * @tc.desc      strategy matrix 1933,7,999,com.samples.test.perftest,false keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0277 begin`);
      logInfo("strategy matrix 1933,7,999,com.samples.test.perftest,false");
      const actual: string = strategyValid([0, 2, 3, 7, 8], 7, 999, "com.samples.test.perftest", false) + '|' + strategySummary([0, 2, 3, 7, 8], 7, 999) + '|' + metricListValid([0,2,3,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "false|DURATION,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      expect(actual).assertEqual("false|DURATION,CPU_USAGE,MEMORY_RSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|7|999|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0278
     * @tc.name      Perf_StrategyMatrix_0278
     * @tc.desc      strategy matrix 1940,8,1000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0278 begin`);
      logInfo("strategy matrix 1940,8,1000,com.samples.test.perftest,true");
      const actual: string = strategyValid([2, 4, 7, 8], 8, 1000, "com.samples.test.perftest", true) + '|' + strategySummary([2, 4, 7, 8], 8, 1000) + '|' + metricListValid([2,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      expect(actual).assertEqual("true|CPU_USAGE,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|8|1000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0279
     * @tc.name      Perf_StrategyMatrix_0279
     * @tc.desc      strategy matrix 1947,9,30000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0279 begin`);
      logInfo("strategy matrix 1947,9,30000,com.samples.test.perftest,true");
      const actual: string = strategyValid([0, 1, 3, 4, 7, 8], 9, 30000, "com.samples.test.perftest", true) + '|' + strategySummary([0, 1, 3, 4, 7, 8], 9, 30000) + '|' + metricListValid([0,1,3,4,7,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      expect(actual).assertEqual("true|DURATION,CPU_LOAD,MEMORY_RSS,MEMORY_PSS,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME|9|30000|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}StrategyMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_STRATEGY_MATRIX_0280
     * @tc.name      Perf_StrategyMatrix_0280
     * @tc.desc      strategy matrix 1954,10,50000,com.samples.test.perftest,true keeps validation/summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_StrategyMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StrategyMatrix_0280 begin`);
