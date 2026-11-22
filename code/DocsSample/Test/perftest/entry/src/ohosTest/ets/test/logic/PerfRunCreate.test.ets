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

/** PerfRunCreateTest logic checks (32 cases). */
export default function perfRunCreateTest(): void {
  describe('PerfRunCreateTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0001
     * @tc.name      Perf_RunCreate_0001
     * @tc.desc      create with 1 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_RunCreate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RunCreate_0001 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=1 iterations=1");
      const actual: string = subject.create([0], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:1");
      expect(actual).assertEqual("created:true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0002
     * @tc.name      Perf_RunCreate_0002
     * @tc.desc      create with 2 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0002 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=2 iterations=2");
      const actual: string = subject.create([1,2], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:2");
      expect(actual).assertEqual("created:true:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0003
     * @tc.name      Perf_RunCreate_0003
     * @tc.desc      create with 3 metrics and 3 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0003 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=3");
      const actual: string = subject.create([0,1,3], 3) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0004
     * @tc.name      Perf_RunCreate_0004
     * @tc.desc      create with 1 metrics and 4 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0004 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=1 iterations=4");
      const actual: string = subject.create([4], 4) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:1");
      expect(actual).assertEqual("created:true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0005
     * @tc.name      Perf_RunCreate_0005
     * @tc.desc      create with 3 metrics and 5 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0005 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=5");
      const actual: string = subject.create([0,2,4], 5) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0006
     * @tc.name      Perf_RunCreate_0006
     * @tc.desc      create with 3 metrics and 6 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0006 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=6");
      const actual: string = subject.create([1,3,4], 6) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0007
     * @tc.name      Perf_RunCreate_0007
     * @tc.desc      create with 5 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0007 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=5 iterations=1");
      const actual: string = subject.create([0,1,2,3,4], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:5");
      expect(actual).assertEqual("created:true:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0008
     * @tc.name      Perf_RunCreate_0008
     * @tc.desc      create with 2 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0008 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=2 iterations=2");
      const actual: string = subject.create([2,5], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:2");
      expect(actual).assertEqual("created:true:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0009
     * @tc.name      Perf_RunCreate_0009
     * @tc.desc      create with 3 metrics and 3 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0009 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=3");
      const actual: string = subject.create([0,3,5], 3) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0010
     * @tc.name      Perf_RunCreate_0010
     * @tc.desc      create with 4 metrics and 4 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0010 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=4");
      const actual: string = subject.create([1,2,3,5], 4) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0011
     * @tc.name      Perf_RunCreate_0011
     * @tc.desc      create with 4 metrics and 5 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0011 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=5");
      const actual: string = subject.create([0,1,4,5], 5) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0012
     * @tc.name      Perf_RunCreate_0012
     * @tc.desc      create with 3 metrics and 6 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_RunCreate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RunCreate_0012 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=6");
      const actual: string = subject.create([3,4,5], 6) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0013
     * @tc.name      Perf_RunCreate_0013
     * @tc.desc      create with 5 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0013 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=5 iterations=1");
      const actual: string = subject.create([0,2,3,4,5], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:5");
      expect(actual).assertEqual("created:true:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0014
     * @tc.name      Perf_RunCreate_0014
     * @tc.desc      create with 2 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0014 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=2 iterations=2");
      const actual: string = subject.create([1,6], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:2");
      expect(actual).assertEqual("created:true:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0015
     * @tc.name      Perf_RunCreate_0015
     * @tc.desc      create with 4 metrics and 3 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0015 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=3");
      const actual: string = subject.create([0,1,2,6], 3) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0016
     * @tc.name      Perf_RunCreate_0016
     * @tc.desc      create with 3 metrics and 4 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0016 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=4");
      const actual: string = subject.create([2,3,6], 4) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0017
     * @tc.name      Perf_RunCreate_0017
     * @tc.desc      create with 3 metrics and 5 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0017 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=5");
      const actual: string = subject.create([0,4,6], 5) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0018
     * @tc.name      Perf_RunCreate_0018
     * @tc.desc      create with 4 metrics and 6 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_RunCreate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RunCreate_0018 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=6");
      const actual: string = subject.create([1,2,4,6], 6) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0019
     * @tc.name      Perf_RunCreate_0019
     * @tc.desc      create with 5 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0019 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=5 iterations=1");
      const actual: string = subject.create([0,1,3,4,6], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:5");
      expect(actual).assertEqual("created:true:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0020
     * @tc.name      Perf_RunCreate_0020
     * @tc.desc      create with 2 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0020 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=2 iterations=2");
      const actual: string = subject.create([5,6], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:2");
      expect(actual).assertEqual("created:true:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0021
     * @tc.name      Perf_RunCreate_0021
     * @tc.desc      create with 4 metrics and 3 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0021 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=3");
      const actual: string = subject.create([0,2,5,6], 3) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0022
     * @tc.name      Perf_RunCreate_0022
     * @tc.desc      create with 4 metrics and 4 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0022 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=4");
      const actual: string = subject.create([1,3,5,6], 4) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0023
     * @tc.name      Perf_RunCreate_0023
     * @tc.desc      create with 6 metrics and 5 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_RunCreate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RunCreate_0023 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=6 iterations=5");
      const actual: string = subject.create([0,1,2,3,5,6], 5) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:6");
      expect(actual).assertEqual("created:true:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0024
     * @tc.name      Perf_RunCreate_0024
     * @tc.desc      create with 4 metrics and 6 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0024 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=6");
      const actual: string = subject.create([2,4,5,6], 6) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0025
     * @tc.name      Perf_RunCreate_0025
     * @tc.desc      create with 5 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0025 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=5 iterations=1");
      const actual: string = subject.create([0,3,4,5,6], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:5");
      expect(actual).assertEqual("created:true:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0026
     * @tc.name      Perf_RunCreate_0026
     * @tc.desc      create with 6 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0026 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=6 iterations=2");
      const actual: string = subject.create([1,2,3,4,5,6], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:6");
      expect(actual).assertEqual("created:true:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0027
     * @tc.name      Perf_RunCreate_0027
     * @tc.desc      create with 3 metrics and 3 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0027 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=3");
      const actual: string = subject.create([0,1,7], 3) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0028
     * @tc.name      Perf_RunCreate_0028
     * @tc.desc      create with 2 metrics and 4 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0028 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=2 iterations=4");
      const actual: string = subject.create([3,7], 4) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:2");
      expect(actual).assertEqual("created:true:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0029
     * @tc.name      Perf_RunCreate_0029
     * @tc.desc      create with 4 metrics and 5 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0029 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=5");
      const actual: string = subject.create([0,2,3,7], 5) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0030
     * @tc.name      Perf_RunCreate_0030
     * @tc.desc      create with 3 metrics and 6 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0030 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=3 iterations=6");
      const actual: string = subject.create([1,4,7], 6) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:3");
      expect(actual).assertEqual("created:true:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0031
     * @tc.name      Perf_RunCreate_0031
     * @tc.desc      create with 5 metrics and 1 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0031 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=5 iterations=1");
      const actual: string = subject.create([0,1,2,4,7], 1) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:5");
      expect(actual).assertEqual("created:true:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_RUN_CREATE_0032
     * @tc.name      Perf_RunCreate_0032
     * @tc.desc      create with 4 metrics and 2 iterations -> created.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_RunCreate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RunCreate_0032 begin`);
      const subject: PerfRunModel = new PerfRunModel();
      logInfo("create metrics=4 iterations=2");
      const actual: string = subject.create([2,3,4,7], 2) + ':' + subject.isCreated() + ':' + subject.metricCount();
      logInfo('actual=' + String(actual) + ', expected=' + "created:true:4");
      expect(actual).assertEqual("created:true:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RunCreate_0032 end`);
    });
  });
}
