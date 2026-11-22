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

/** PerfFlowBoundaryMatrixTest logic checks (30 cases). */
export default function perfFlowBoundaryMatrixTest(): void {
  describe('PerfFlowBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0001
     * @tc.name      Perf_FlowMatrix_0001
     * @tc.desc      perf flow matrix 1,true,true,true keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_FlowMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0001 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 1);
      subject.run(true);
      subject.getFor(1);
      subject.getFor(5);
      subject.destroy();
      logInfo("flow matrix 1,true,true,true");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,run-end,get:CPU_LOAD,destroy|1|1|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,run-end,get:CPU_LOAD,destroy|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0002
     * @tc.name      Perf_FlowMatrix_0002
     * @tc.desc      perf flow matrix 2,false,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0002 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 2);
      subject.run(false);
      subject.destroy();
      logInfo("flow matrix 2,false,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,run-end,destroy|2|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,run-end,destroy|2|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0003
     * @tc.name      Perf_FlowMatrix_0003
     * @tc.desc      perf flow matrix 3,true,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0003 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 3);
      subject.run(true);
      subject.destroy();
      logInfo("flow matrix 3,true,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,destroy|3|3|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,destroy|3|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0004
     * @tc.name      Perf_FlowMatrix_0004
     * @tc.desc      perf flow matrix 4,false,true,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0004 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 4);
      subject.run(false);
      subject.getFor(1);
      subject.destroy();
      logInfo("flow matrix 4,false,true,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,run-end,get:CPU_LOAD,destroy|4|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,run-end,get:CPU_LOAD,destroy|4|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0005
     * @tc.name      Perf_FlowMatrix_0005
     * @tc.desc      perf flow matrix 5,true,false,true keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0005 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 5);
      subject.run(true);
      subject.getFor(5);
      subject.destroy();
      logInfo("flow matrix 5,true,false,true");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy|5|5|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0006
     * @tc.name      Perf_FlowMatrix_0006
     * @tc.desc      perf flow matrix 6,false,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0006 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 6);
      subject.run(false);
      subject.destroy();
      logInfo("flow matrix 6,false,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,destroy|6|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,destroy|6|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0007
     * @tc.name      Perf_FlowMatrix_0007
     * @tc.desc      perf flow matrix 7,true,true,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0007 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 7);
      subject.run(true);
      subject.getFor(1);
      subject.destroy();
      logInfo("flow matrix 7,true,true,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,run-end,get:CPU_LOAD,destroy|7|7|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,run-end,get:CPU_LOAD,destroy|7|7|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0008
     * @tc.name      Perf_FlowMatrix_0008
     * @tc.desc      perf flow matrix 8,false,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0008 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 8);
      subject.run(false);
      subject.destroy();
      logInfo("flow matrix 8,false,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,action:4,action:5,action:6,action:7,run-end,destroy|8|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,action:4,action:5,action:6,action:7,run-end,destroy|8|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0009
     * @tc.name      Perf_FlowMatrix_0009
     * @tc.desc      perf flow matrix 9,true,false,true keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0009 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 9);
      subject.run(true);
      subject.getFor(5);
      subject.destroy();
      logInfo("flow matrix 9,true,false,true");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,action:7,reset:7,action:8,reset:8,run-end,destroy|9|9|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,action:7,reset:7,action:8,reset:8,run-end,destroy|9|9|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0010
     * @tc.name      Perf_FlowMatrix_0010
     * @tc.desc      perf flow matrix 10,false,true,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0010 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 10);
      subject.run(false);
      subject.getFor(1);
      subject.destroy();
      logInfo("flow matrix 10,false,true,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,action:4,action:5,action:6,action:7,action:8,action:9,run-end,get:CPU_LOAD,destroy|10|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,action:4,action:5,action:6,action:7,action:8,action:9,run-end,get:CPU_LOAD,destroy|10|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0011
     * @tc.name      Perf_FlowMatrix_0011
     * @tc.desc      perf flow matrix 1,true,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0011 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 1);
      subject.run(true);
      subject.destroy();
      logInfo("flow matrix 1,true,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,run-end,destroy|1|1|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,run-end,destroy|1|1|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0012
     * @tc.name      Perf_FlowMatrix_0012
     * @tc.desc      perf flow matrix 3,true,true,true keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_FlowMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0012 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 3);
      subject.run(true);
      subject.getFor(1);
      subject.getFor(5);
      subject.destroy();
      logInfo("flow matrix 3,true,true,true");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,get:CPU_LOAD,destroy|3|3|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,run-end,get:CPU_LOAD,destroy|3|3|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0013
     * @tc.name      Perf_FlowMatrix_0013
     * @tc.desc      perf flow matrix 4,false,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0013 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 4);
      subject.run(false);
      subject.destroy();
      logInfo("flow matrix 4,false,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,run-end,destroy|4|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,run-end,destroy|4|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0014
     * @tc.name      Perf_FlowMatrix_0014
     * @tc.desc      perf flow matrix 5,true,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0014 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 5);
      subject.run(true);
      subject.destroy();
      logInfo("flow matrix 5,true,false,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy|5|5|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,run-end,destroy|5|5|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0015
     * @tc.name      Perf_FlowMatrix_0015
     * @tc.desc      perf flow matrix 6,false,true,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0015 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 6);
      subject.run(false);
      subject.getFor(1);
      subject.destroy();
      logInfo("flow matrix 6,false,true,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,get:CPU_LOAD,destroy|6|0|true");
      expect(actual).assertEqual("create,run,action:0,action:1,action:2,action:3,action:4,action:5,run-end,get:CPU_LOAD,destroy|6|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0016
     * @tc.name      Perf_FlowMatrix_0016
     * @tc.desc      perf flow matrix 7,true,false,true keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0016 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 7);
      subject.run(true);
      subject.getFor(5);
      subject.destroy();
      logInfo("flow matrix 7,true,false,true");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,run-end,destroy|7|7|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,run-end,destroy|7|7|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0017
     * @tc.name      Perf_FlowMatrix_0017
     * @tc.desc      perf flow matrix 9,true,true,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlowMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0017 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 9);
      subject.run(true);
      subject.getFor(1);
      subject.destroy();
      logInfo("flow matrix 9,true,true,false");
      const actual: string = subject.steps() + "|" + subject.actionCount() + "|" + subject.resetCount() + "|" + subject.isDestroyed();
      logInfo('actual=' + String(actual) + ', expected=' + "create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,action:7,reset:7,action:8,reset:8,run-end,get:CPU_LOAD,destroy|9|9|true");
      expect(actual).assertEqual("create,run,action:0,reset:0,action:1,reset:1,action:2,reset:2,action:3,reset:3,action:4,reset:4,action:5,reset:5,action:6,reset:6,action:7,reset:7,action:8,reset:8,run-end,get:CPU_LOAD,destroy|9|9|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLOW_MATRIX_0018
     * @tc.name      Perf_FlowMatrix_0018
     * @tc.desc      perf flow matrix 10,false,false,false keeps the call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_FlowMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0018 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      subject.create([0, 1, 2], 10);
      subject.run(false);
      subject.destroy();
