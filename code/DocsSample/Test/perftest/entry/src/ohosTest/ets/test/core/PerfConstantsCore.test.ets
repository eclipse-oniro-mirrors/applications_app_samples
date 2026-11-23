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
  DEFAULT_MAX_NUM,
  DEFAULT_ITERATIONS,
  DEFAULT_TIMEOUT,
  PAGE_TIMEOUT,
  FLING_STEP,
  FLING_VELOCITY,
  SCROLL_TO_TOP_SPEED,
  BUNDLE_NAME,
  ABILITY_NAME,
  LIST_PAGE,
  NAV_PAGE,
  INDEX_PAGE,
  BUTTON_LIST_ID,
  BUTTON_NAV_ID,
  LIST_TEXT,
  NAV_TEXT,
  PUSH_TEXT,
} from '../model/PerfTestLogic';

/** PerfConstantsCoreTest logic checks (17 cases). */
export default function perfConstantsCoreTest(): void {
  describe('PerfConstantsCoreTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0001
     * @tc.name      Perf_Constants_0001
     * @tc.desc      DEFAULT_MAX_NUM is pinned to 10000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Constants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0001 begin`);
      logInfo("constant DEFAULT_MAX_NUM");
      const actual: number = DEFAULT_MAX_NUM;
      logInfo('actual=' + String(actual) + ', expected=' + "10000");
      expect(actual).assertEqual(10000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0002
     * @tc.name      Perf_Constants_0002
     * @tc.desc      DEFAULT_ITERATIONS is pinned to 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0002 begin`);
      logInfo("constant DEFAULT_ITERATIONS");
      const actual: number = DEFAULT_ITERATIONS;
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0003
     * @tc.name      Perf_Constants_0003
     * @tc.desc      DEFAULT_TIMEOUT is pinned to 30000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0003 begin`);
      logInfo("constant DEFAULT_TIMEOUT");
      const actual: number = DEFAULT_TIMEOUT;
      logInfo('actual=' + String(actual) + ', expected=' + "30000");
      expect(actual).assertEqual(30000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0004
     * @tc.name      Perf_Constants_0004
     * @tc.desc      PAGE_TIMEOUT is pinned to 50000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0004 begin`);
      logInfo("constant PAGE_TIMEOUT");
      const actual: number = PAGE_TIMEOUT;
      logInfo('actual=' + String(actual) + ', expected=' + "50000");
      expect(actual).assertEqual(50000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0005
     * @tc.name      Perf_Constants_0005
     * @tc.desc      FLING_STEP is pinned to 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0005 begin`);
      logInfo("constant FLING_STEP");
      const actual: number = FLING_STEP;
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0006
     * @tc.name      Perf_Constants_0006
     * @tc.desc      FLING_VELOCITY is pinned to 20000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0006 begin`);
      logInfo("constant FLING_VELOCITY");
      const actual: number = FLING_VELOCITY;
      logInfo('actual=' + String(actual) + ', expected=' + "20000");
      expect(actual).assertEqual(20000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0007
     * @tc.name      Perf_Constants_0007
     * @tc.desc      SCROLL_TO_TOP_SPEED is pinned to 40000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0007 begin`);
      logInfo("constant SCROLL_TO_TOP_SPEED");
      const actual: number = SCROLL_TO_TOP_SPEED;
      logInfo('actual=' + String(actual) + ', expected=' + "40000");
      expect(actual).assertEqual(40000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0008
     * @tc.name      Perf_Constants_0008
     * @tc.desc      BUNDLE_NAME is pinned to "com.samples.test.perftest".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0008 begin`);
      logInfo("constant BUNDLE_NAME");
      const actual: string = BUNDLE_NAME;
      logInfo('actual=' + String(actual) + ', expected=' + "com.samples.test.perftest");
      expect(actual).assertEqual("com.samples.test.perftest");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0009
     * @tc.name      Perf_Constants_0009
     * @tc.desc      ABILITY_NAME is pinned to "EntryAbility".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0009 begin`);
      logInfo("constant ABILITY_NAME");
      const actual: string = ABILITY_NAME;
      logInfo('actual=' + String(actual) + ', expected=' + "EntryAbility");
      expect(actual).assertEqual("EntryAbility");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0010
     * @tc.name      Perf_Constants_0010
     * @tc.desc      LIST_PAGE is pinned to "pages/PageListPage".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0010 begin`);
      logInfo("constant LIST_PAGE");
      const actual: string = LIST_PAGE;
      logInfo('actual=' + String(actual) + ', expected=' + "pages/PageListPage");
      expect(actual).assertEqual("pages/PageListPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0011
     * @tc.name      Perf_Constants_0011
     * @tc.desc      NAV_PAGE is pinned to "pages/navigationPage".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0011 begin`);
      logInfo("constant NAV_PAGE");
      const actual: string = NAV_PAGE;
      logInfo('actual=' + String(actual) + ', expected=' + "pages/navigationPage");
      expect(actual).assertEqual("pages/navigationPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0012
     * @tc.name      Perf_Constants_0012
     * @tc.desc      INDEX_PAGE is pinned to "pages/Index".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Constants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0012 begin`);
      logInfo("constant INDEX_PAGE");
      const actual: string = INDEX_PAGE;
      logInfo('actual=' + String(actual) + ', expected=' + "pages/Index");
      expect(actual).assertEqual("pages/Index");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0013
     * @tc.name      Perf_Constants_0013
     * @tc.desc      BUTTON_LIST_ID is pinned to "toPageList".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0013 begin`);
      logInfo("constant BUTTON_LIST_ID");
      const actual: string = BUTTON_LIST_ID;
      logInfo('actual=' + String(actual) + ', expected=' + "toPageList");
      expect(actual).assertEqual("toPageList");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0014
     * @tc.name      Perf_Constants_0014
     * @tc.desc      BUTTON_NAV_ID is pinned to "toNavigationPage".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0014 begin`);
      logInfo("constant BUTTON_NAV_ID");
      const actual: string = BUTTON_NAV_ID;
      logInfo('actual=' + String(actual) + ', expected=' + "toNavigationPage");
      expect(actual).assertEqual("toNavigationPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0015
     * @tc.name      Perf_Constants_0015
     * @tc.desc      LIST_TEXT is pinned to "ListPage".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0015 begin`);
      logInfo("constant LIST_TEXT");
      const actual: string = LIST_TEXT;
      logInfo('actual=' + String(actual) + ', expected=' + "ListPage");
      expect(actual).assertEqual("ListPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0016
     * @tc.name      Perf_Constants_0016
     * @tc.desc      NAV_TEXT is pinned to "navigation".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0016 begin`);
      logInfo("constant NAV_TEXT");
      const actual: string = NAV_TEXT;
      logInfo('actual=' + String(actual) + ', expected=' + "navigation");
      expect(actual).assertEqual("navigation");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_CONSTANTS_0017
     * @tc.name      Perf_Constants_0017
     * @tc.desc      PUSH_TEXT is pinned to "push Page01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Constants_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0017 begin`);
      logInfo("constant PUSH_TEXT");
      const actual: string = PUSH_TEXT;
      logInfo('actual=' + String(actual) + ', expected=' + "push Page01");
      expect(actual).assertEqual("push Page01");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0017 end`);
    });
  });
}
