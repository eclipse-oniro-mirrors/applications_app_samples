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
  PageFlowModel,
} from '../model/PerfTestLogic';

/** PageFlowModelTest logic checks (9 cases). */
export default function pageFlowModelTest(): void {
  describe('PageFlowModelTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0001
     * @tc.name      Perf_PageFlow_0001
     * @tc.desc      page flow push 0 second=true back=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageFlow_0001 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(0, true);
      subject.push(1, true);
      subject.back(true);
      logInfo("page flow 0/true/true");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "0:pages/PageListPage:Pass");
      expect(actual).assertEqual("0:pages/PageListPage:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0002
     * @tc.name      Perf_PageFlow_0002
     * @tc.desc      page flow push 1 second=false back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0002 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(1, true);
      subject.back(false);
      logInfo("page flow 1/false/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "1:pages/navigationPage:Error");
      expect(actual).assertEqual("1:pages/navigationPage:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0003
     * @tc.name      Perf_PageFlow_0003
     * @tc.desc      page flow push 2 second=true back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0003 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(2, true);
      subject.push(0, true);
      subject.back(false);
      logInfo("page flow 2/true/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "0:pages/PageListPage:Error");
      expect(actual).assertEqual("0:pages/PageListPage:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0004
     * @tc.name      Perf_PageFlow_0004
     * @tc.desc      page flow push 0 second=false back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0004 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(0, true);
      subject.back(false);
      logInfo("page flow 0/false/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "0:pages/PageListPage:Error");
      expect(actual).assertEqual("0:pages/PageListPage:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0005
     * @tc.name      Perf_PageFlow_0005
     * @tc.desc      page flow push 1 second=true back=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0005 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(1, true);
      subject.push(2, true);
      subject.back(true);
      logInfo("page flow 1/true/true");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "1:pages/navigationPage:Pass");
      expect(actual).assertEqual("1:pages/navigationPage:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0006
     * @tc.name      Perf_PageFlow_0006
     * @tc.desc      page flow push 2 second=false back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0006 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(2, true);
      subject.back(false);
      logInfo("page flow 2/false/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "2:pages/Index:Error");
      expect(actual).assertEqual("2:pages/Index:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0007
     * @tc.name      Perf_PageFlow_0007
     * @tc.desc      page flow push 0 second=true back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0007 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(0, true);
      subject.push(1, true);
      subject.back(false);
      logInfo("page flow 0/true/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "1:pages/navigationPage:Error");
      expect(actual).assertEqual("1:pages/navigationPage:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0008
     * @tc.name      Perf_PageFlow_0008
     * @tc.desc      page flow push 2 second=true back=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0008 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(2, true);
      subject.push(0, true);
      subject.back(true);
      logInfo("page flow 2/true/true");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "2:pages/Index:Pass");
      expect(actual).assertEqual("2:pages/Index:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_FLOW_0009
     * @tc.name      Perf_PageFlow_0009
     * @tc.desc      page flow push 1 second=true back=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0009 begin`);
      const subject: PageFlowModel = new PageFlowModel();
      subject.push(1, true);
      subject.push(2, true);
      subject.back(false);
      logInfo("page flow 1/true/false");
      const actual: string = subject.current() + ":" + subject.currentUrl() + ":" + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "2:pages/Index:Error");
      expect(actual).assertEqual("2:pages/Index:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageFlow_0009 end`);
    });
  });
}
