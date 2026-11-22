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

