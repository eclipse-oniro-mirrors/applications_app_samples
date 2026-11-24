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
  navigationAction,
  routeFlag,
} from '../model/PerfTestLogic';

/** NavigationActionTest logic checks (14 cases). */
export default function navigationActionTest(): void {
  describe('NavigationActionTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0001
     * @tc.name      Perf_NavAction_0001
     * @tc.desc      navigation action for 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_NavAction_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavAction_0001 begin`);
      logInfo("navigationAction(0) + ':' + routeFlag(true)");
      const actual: string = navigationAction(0) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "push:Pass");
      expect(actual).assertEqual("push:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NavAction_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0002
     * @tc.name      Perf_NavAction_0002
     * @tc.desc      navigation action for 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0002 begin`);
      logInfo("navigationAction(1) + ':' + routeFlag(false)");
      const actual: string = navigationAction(1) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo(`${BUNDLE}NavAction_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0003
     * @tc.name      Perf_NavAction_0003
     * @tc.desc      navigation action for 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0003 begin`);
      logInfo("navigationAction(2) + ':' + routeFlag(true)");
      const actual: string = navigationAction(2) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo(`${BUNDLE}NavAction_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0004
     * @tc.name      Perf_NavAction_0004
     * @tc.desc      navigation action for 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0004 begin`);
      logInfo("navigationAction(3) + ':' + routeFlag(false)");
      const actual: string = navigationAction(3) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NavAction_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0005
     * @tc.name      Perf_NavAction_0005
     * @tc.desc      navigation action for 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0005 begin`);
      logInfo("navigationAction(4) + ':' + routeFlag(true)");
      const actual: string = navigationAction(4) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo(`${BUNDLE}NavAction_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0006
     * @tc.name      Perf_NavAction_0006
     * @tc.desc      navigation action for 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0006 begin`);
      logInfo("navigationAction(5) + ':' + routeFlag(false)");
      const actual: string = navigationAction(5) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo(`${BUNDLE}NavAction_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0007
     * @tc.name      Perf_NavAction_0007
     * @tc.desc      navigation action for 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0007 begin`);
      logInfo("navigationAction(6) + ':' + routeFlag(true)");
      const actual: string = navigationAction(6) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NavAction_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0008
     * @tc.name      Perf_NavAction_0008
     * @tc.desc      navigation action for 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0008 begin`);
      logInfo("navigationAction(7) + ':' + routeFlag(false)");
      const actual: string = navigationAction(7) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo(`${BUNDLE}NavAction_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0009
     * @tc.name      Perf_NavAction_0009
     * @tc.desc      navigation action for 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0009 begin`);
      logInfo("navigationAction(8) + ':' + routeFlag(true)");
      const actual: string = navigationAction(8) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo(`${BUNDLE}NavAction_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0010
     * @tc.name      Perf_NavAction_0010
     * @tc.desc      navigation action for 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0010 begin`);
      logInfo("navigationAction(9) + ':' + routeFlag(false)");
      const actual: string = navigationAction(9) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NavAction_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0011
     * @tc.name      Perf_NavAction_0011
     * @tc.desc      navigation action for 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0011 begin`);
      logInfo("navigationAction(10) + ':' + routeFlag(true)");
      const actual: string = navigationAction(10) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo(`${BUNDLE}NavAction_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0012
     * @tc.name      Perf_NavAction_0012
     * @tc.desc      navigation action for 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_NavAction_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavAction_0012 begin`);
      logInfo("navigationAction(11) + ':' + routeFlag(false)");
      const actual: string = navigationAction(11) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo(`${BUNDLE}NavAction_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0013
     * @tc.name      Perf_NavAction_0013
     * @tc.desc      navigation action for 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0013 begin`);
      logInfo("navigationAction(12) + ':' + routeFlag(true)");
      const actual: string = navigationAction(12) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Pass");
      expect(actual).assertEqual("back:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NavAction_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_NAV_ACTION_0014
     * @tc.name      Perf_NavAction_0014
     * @tc.desc      navigation action for 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_NavAction_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavAction_0014 begin`);
      logInfo("navigationAction(13) + ':' + routeFlag(false)");
      const actual: string = navigationAction(13) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "back:Error");
      expect(actual).assertEqual("back:Error");
      logInfo(`${BUNDLE}NavAction_0014 end`);
    });
  });
}
