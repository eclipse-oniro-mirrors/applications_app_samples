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
  UtilsModel,
} from '../model/PerfTestLogic';

/** UtilsModelFlowTest logic checks (32 cases). */
export default function utilsModelFlowTest(): void {
  describe('UtilsModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0001
     * @tc.name      Perf_UtilsFlow_0001
     * @tc.desc      UtilsModel calculate x1 max=0 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsFlow_0001 begin`);
      const subject: UtilsModel = new UtilsModel(0);
      subject.calculate();
      logInfo("calculate x1 max=0");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0");
      expect(actual).assertEqual("0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0002
     * @tc.name      Perf_UtilsFlow_0002
     * @tc.desc      UtilsModel calculate x2 max=37 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0002 begin`);
      const subject: UtilsModel = new UtilsModel(37);
      subject.calculate();
      subject.calculate();
      logInfo("calculate x2 max=37");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "74:2:0");
      expect(actual).assertEqual("74:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0003
     * @tc.name      Perf_UtilsFlow_0003
     * @tc.desc      UtilsModel calculate x3 max=74 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0003 begin`);
      const subject: UtilsModel = new UtilsModel(74);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x3 max=74");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "222:3:0");
      expect(actual).assertEqual("222:3:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0004
     * @tc.name      Perf_UtilsFlow_0004
     * @tc.desc      UtilsModel calculate x4 max=111 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0004 begin`);
      const subject: UtilsModel = new UtilsModel(111);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x4 max=111");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "444:4:0");
      expect(actual).assertEqual("444:4:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0005
     * @tc.name      Perf_UtilsFlow_0005
     * @tc.desc      UtilsModel calculate x5 max=148 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0005 begin`);
      const subject: UtilsModel = new UtilsModel(148);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x5 max=148");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "740:5:0");
      expect(actual).assertEqual("740:5:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0006
     * @tc.name      Perf_UtilsFlow_0006
     * @tc.desc      UtilsModel calculate x1 max=185 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0006 begin`);
      const subject: UtilsModel = new UtilsModel(185);
      subject.calculate();
      logInfo("calculate x1 max=185");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "185:1:0");
      expect(actual).assertEqual("185:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0007
     * @tc.name      Perf_UtilsFlow_0007
     * @tc.desc      UtilsModel calculate x2 max=222 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0007 begin`);
      const subject: UtilsModel = new UtilsModel(222);
      subject.calculate();
      subject.calculate();
      logInfo("calculate x2 max=222");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "444:2:0");
      expect(actual).assertEqual("444:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0008
     * @tc.name      Perf_UtilsFlow_0008
     * @tc.desc      UtilsModel calculate x3 max=259 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0008 begin`);
      const subject: UtilsModel = new UtilsModel(259);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x3 max=259");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "777:3:0");
      expect(actual).assertEqual("777:3:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0009
     * @tc.name      Perf_UtilsFlow_0009
     * @tc.desc      UtilsModel calculate x4 max=296 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0009 begin`);
      const subject: UtilsModel = new UtilsModel(296);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x4 max=296");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1184:4:0");
      expect(actual).assertEqual("1184:4:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0010
     * @tc.name      Perf_UtilsFlow_0010
     * @tc.desc      UtilsModel calculate x5 max=333 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0010 begin`);
      const subject: UtilsModel = new UtilsModel(333);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x5 max=333");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1665:5:0");
      expect(actual).assertEqual("1665:5:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0011
     * @tc.name      Perf_UtilsFlow_0011
     * @tc.desc      UtilsModel calculate x1 max=370 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0011 begin`);
      const subject: UtilsModel = new UtilsModel(370);
      subject.calculate();
      logInfo("calculate x1 max=370");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "370:1:0");
      expect(actual).assertEqual("370:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0012
     * @tc.name      Perf_UtilsFlow_0012
     * @tc.desc      UtilsModel calculate x2 max=407 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsFlow_0012 begin`);
      const subject: UtilsModel = new UtilsModel(407);
      subject.calculate();
      subject.calculate();
      logInfo("calculate x2 max=407");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "814:2:0");
      expect(actual).assertEqual("814:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0013
     * @tc.name      Perf_UtilsFlow_0013
     * @tc.desc      UtilsModel calculate x3 max=444 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0013 begin`);
      const subject: UtilsModel = new UtilsModel(444);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x3 max=444");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1332:3:0");
      expect(actual).assertEqual("1332:3:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0014
     * @tc.name      Perf_UtilsFlow_0014
     * @tc.desc      UtilsModel calculate x4 max=481 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0014 begin`);
      const subject: UtilsModel = new UtilsModel(481);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x4 max=481");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1924:4:0");
      expect(actual).assertEqual("1924:4:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0015
     * @tc.name      Perf_UtilsFlow_0015
     * @tc.desc      UtilsModel calculate x5 max=518 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0015 begin`);
      const subject: UtilsModel = new UtilsModel(518);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x5 max=518");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "2590:5:0");
      expect(actual).assertEqual("2590:5:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0016
     * @tc.name      Perf_UtilsFlow_0016
     * @tc.desc      UtilsModel calculate x1 max=555 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0016 begin`);
      const subject: UtilsModel = new UtilsModel(555);
      subject.calculate();
      logInfo("calculate x1 max=555");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "555:1:0");
      expect(actual).assertEqual("555:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0017
     * @tc.name      Perf_UtilsFlow_0017
     * @tc.desc      UtilsModel calculate x2 max=592 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsFlow_0017 begin`);
      const subject: UtilsModel = new UtilsModel(592);
      subject.calculate();
      subject.calculate();
      logInfo("calculate x2 max=592");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1184:2:0");
      expect(actual).assertEqual("1184:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0018
     * @tc.name      Perf_UtilsFlow_0018
     * @tc.desc      UtilsModel calculate x3 max=629 keeps the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsFlow_0018 begin`);
      const subject: UtilsModel = new UtilsModel(629);
      subject.calculate();
      subject.calculate();
      subject.calculate();
      logInfo("calculate x3 max=629");
      const actual: string = subject.value() + ':' + subject.calls() + ':' + subject.resets();
      logInfo('actual=' + String(actual) + ', expected=' + "1887:3:0");
      expect(actual).assertEqual("1887:3:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_FLOW_0019
     * @tc.name      Perf_UtilsFlow_0019
     * @tc.desc      UtilsModel calculate x4 max=666 keeps the counter.
     * @tc.type      FUNCTION
