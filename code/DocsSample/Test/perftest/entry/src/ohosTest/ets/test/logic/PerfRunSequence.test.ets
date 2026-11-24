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
  PerfRunModel,
} from '../model/PerfTestLogic';

/** PerfRunSequenceTest logic checks (6 cases). */
export default function perfRunSequenceTest(): void {
  describe('PerfRunSequenceTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0001
     * @tc.name      Perf_RunSeq_0001
     * @tc.desc      run/destroy sequence with 1 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_RunSeq_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RunSeq_0001 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 1);
      subject.run(true);
      subject.getFor(0);
      subject.destroy();
      logInfo("run iterations=1 reset=true get=true");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,run-end,get:DURATION,destroy:1:1");
      expect(actual).assertEqual("create,run,action:0,reset:0,run-end,get:DURATION,destroy:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0002
     * @tc.name      Perf_RunSeq_0002
     * @tc.desc      run/destroy sequence with 2 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunSeq_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunSeq_0002 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 2);
      subject.run(false);
      subject.destroy();
      logInfo("run iterations=2 reset=false get=false");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,run-end,destroy:2:0");
      expect(actual).assertEqual("create,run,action:0,action:1,run-end,destroy:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0003
     * @tc.name      Perf_RunSeq_0003
     * @tc.desc      run/destroy sequence with 3 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunSeq_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunSeq_0003 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 3);
      subject.run(true);
      subject.destroy();
      logInfo("run iterations=3 reset=true get=false");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,destroy:3:3");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,destroy:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0004
     * @tc.name      Perf_RunSeq_0004
     * @tc.desc      run/destroy sequence with 4 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunSeq_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunSeq_0004 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 4);
      subject.run(false);
      subject.getFor(0);
      subject.destroy();
      logInfo("run iterations=4 reset=false get=true");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,run-end,get:DURATION,destroy:4:0");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,run-end,get:DURATION,destroy:4:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0005
     * @tc.name      Perf_RunSeq_0005
     * @tc.desc      run/destroy sequence with 5 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunSeq_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunSeq_0005 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 5);
      subject.run(true);
      subject.destroy();
      logInfo("run iterations=5 reset=true get=false");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy:5:5");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_SEQ_0006
     * @tc.name      Perf_RunSeq_0006
     * @tc.desc      run/destroy sequence with 6 iterations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunSeq_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunSeq_0006 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1], 6);
      subject.run(false);
      subject.destroy();
      logInfo("run iterations=6 reset=false get=false");
      const actual: string = subject.steps() + ":" + subject.actionCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,destroy:6:0");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,destroy:6:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunSeq_0006 end`);
    });
  });
}
