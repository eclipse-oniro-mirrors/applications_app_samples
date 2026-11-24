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
  routeUrl,
  routeButtonId,
  routeText,
} from '../model/PerfTestLogic';

/** RouteUrlTest logic checks (32 cases). */
export default function routeUrlTest(): void {
  describe('RouteUrlTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0001
     * @tc.name      Perf_Route_0001
     * @tc.desc      route contract for page 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Route_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Route_0001 begin`);
      logInfo("routeUrl(0) + ':' + routeButtonId(0) + ':' + routeText(0)");
      const actual: string = routeUrl(0) + ':' + routeButtonId(0) + ':' + routeText(0);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/PageListPage:toPageList:ListPage");
      expect(actual).assertEqual("pages/PageListPage:toPageList:ListPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0002
     * @tc.name      Perf_Route_0002
     * @tc.desc      route contract for page 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0002 begin`);
      logInfo("routeUrl(1) + ':' + routeButtonId(1) + ':' + routeText(1)");
      const actual: string = routeUrl(1) + ':' + routeButtonId(1) + ':' + routeText(1);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/navigationPage:toNavigationPage:navigation");
      expect(actual).assertEqual("pages/navigationPage:toNavigationPage:navigation");
      logInfo(`${BUNDLE}Route_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0003
     * @tc.name      Perf_Route_0003
     * @tc.desc      route contract for page 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0003 begin`);
      logInfo("routeUrl(2) + ':' + routeButtonId(2) + ':' + routeText(2)");
      const actual: string = routeUrl(2) + ':' + routeButtonId(2) + ':' + routeText(2);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/Index::");
      expect(actual).assertEqual("pages/Index::");
      logInfo(`${BUNDLE}Route_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0004
     * @tc.name      Perf_Route_0004
     * @tc.desc      route contract for page 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0004 begin`);
      logInfo("routeUrl(3) + ':' + routeButtonId(3) + ':' + routeText(3)");
      const actual: string = routeUrl(3) + ':' + routeButtonId(3) + ':' + routeText(3);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0005
     * @tc.name      Perf_Route_0005
     * @tc.desc      route contract for page 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0005 begin`);
      logInfo("routeUrl(4) + ':' + routeButtonId(4) + ':' + routeText(4)");
      const actual: string = routeUrl(4) + ':' + routeButtonId(4) + ':' + routeText(4);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0006
     * @tc.name      Perf_Route_0006
     * @tc.desc      route contract for page 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0006 begin`);
      logInfo("routeUrl(5) + ':' + routeButtonId(5) + ':' + routeText(5)");
      const actual: string = routeUrl(5) + ':' + routeButtonId(5) + ':' + routeText(5);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0007
     * @tc.name      Perf_Route_0007
     * @tc.desc      route contract for page 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0007 begin`);
      logInfo("routeUrl(6) + ':' + routeButtonId(6) + ':' + routeText(6)");
      const actual: string = routeUrl(6) + ':' + routeButtonId(6) + ':' + routeText(6);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0008
     * @tc.name      Perf_Route_0008
     * @tc.desc      route contract for page 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0008 begin`);
      logInfo("routeUrl(7) + ':' + routeButtonId(7) + ':' + routeText(7)");
      const actual: string = routeUrl(7) + ':' + routeButtonId(7) + ':' + routeText(7);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0009
     * @tc.name      Perf_Route_0009
     * @tc.desc      route contract for page 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0009 begin`);
      logInfo("routeUrl(8) + ':' + routeButtonId(8) + ':' + routeText(8)");
      const actual: string = routeUrl(8) + ':' + routeButtonId(8) + ':' + routeText(8);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0010
     * @tc.name      Perf_Route_0010
     * @tc.desc      route contract for page 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0010 begin`);
      logInfo("routeUrl(9) + ':' + routeButtonId(9) + ':' + routeText(9)");
      const actual: string = routeUrl(9) + ':' + routeButtonId(9) + ':' + routeText(9);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0011
     * @tc.name      Perf_Route_0011
     * @tc.desc      route contract for page 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0011 begin`);
      logInfo("routeUrl(10) + ':' + routeButtonId(10) + ':' + routeText(10)");
      const actual: string = routeUrl(10) + ':' + routeButtonId(10) + ':' + routeText(10);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0012
     * @tc.name      Perf_Route_0012
     * @tc.desc      route contract for page 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Route_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Route_0012 begin`);
      logInfo("routeUrl(11) + ':' + routeButtonId(11) + ':' + routeText(11)");
      const actual: string = routeUrl(11) + ':' + routeButtonId(11) + ':' + routeText(11);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0013
     * @tc.name      Perf_Route_0013
     * @tc.desc      route contract for page 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0013 begin`);
      logInfo("routeUrl(12) + ':' + routeButtonId(12) + ':' + routeText(12)");
      const actual: string = routeUrl(12) + ':' + routeButtonId(12) + ':' + routeText(12);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0014
     * @tc.name      Perf_Route_0014
     * @tc.desc      route contract for page 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0014 begin`);
      logInfo("routeUrl(13) + ':' + routeButtonId(13) + ':' + routeText(13)");
      const actual: string = routeUrl(13) + ':' + routeButtonId(13) + ':' + routeText(13);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0015
     * @tc.name      Perf_Route_0015
     * @tc.desc      route contract for page 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0015 begin`);
      logInfo("routeUrl(14) + ':' + routeButtonId(14) + ':' + routeText(14)");
      const actual: string = routeUrl(14) + ':' + routeButtonId(14) + ':' + routeText(14);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0016
     * @tc.name      Perf_Route_0016
     * @tc.desc      route contract for page 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0016 begin`);
      logInfo("routeUrl(15) + ':' + routeButtonId(15) + ':' + routeText(15)");
      const actual: string = routeUrl(15) + ':' + routeButtonId(15) + ':' + routeText(15);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0017
     * @tc.name      Perf_Route_0017
     * @tc.desc      route contract for page 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0017 begin`);
      logInfo("routeUrl(16) + ':' + routeButtonId(16) + ':' + routeText(16)");
      const actual: string = routeUrl(16) + ':' + routeButtonId(16) + ':' + routeText(16);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0018
     * @tc.name      Perf_Route_0018
     * @tc.desc      route contract for page -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Route_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Route_0018 begin`);
      logInfo("routeUrl(-1) + ':' + routeButtonId(-1) + ':' + routeText(-1)");
      const actual: string = routeUrl(-1) + ':' + routeButtonId(-1) + ':' + routeText(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0019
     * @tc.name      Perf_Route_0019
     * @tc.desc      route contract for page 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0019 begin`);
      logInfo("routeUrl(20) + ':' + routeButtonId(20) + ':' + routeText(20)");
      const actual: string = routeUrl(20) + ':' + routeButtonId(20) + ':' + routeText(20);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0020
     * @tc.name      Perf_Route_0020
     * @tc.desc      route contract for page 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0020 begin`);
      logInfo("routeUrl(30) + ':' + routeButtonId(30) + ':' + routeText(30)");
      const actual: string = routeUrl(30) + ':' + routeButtonId(30) + ':' + routeText(30);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0021
     * @tc.name      Perf_Route_0021
     * @tc.desc      route contract for page 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0021 begin`);
      logInfo("routeUrl(40) + ':' + routeButtonId(40) + ':' + routeText(40)");
      const actual: string = routeUrl(40) + ':' + routeButtonId(40) + ':' + routeText(40);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0022
     * @tc.name      Perf_Route_0022
     * @tc.desc      route contract for page 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0022 begin`);
      logInfo("routeUrl(50) + ':' + routeButtonId(50) + ':' + routeText(50)");
      const actual: string = routeUrl(50) + ':' + routeButtonId(50) + ':' + routeText(50);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0023
     * @tc.name      Perf_Route_0023
     * @tc.desc      route contract for page 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Route_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Route_0023 begin`);
      logInfo("routeUrl(60) + ':' + routeButtonId(60) + ':' + routeText(60)");
      const actual: string = routeUrl(60) + ':' + routeButtonId(60) + ':' + routeText(60);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0024
     * @tc.name      Perf_Route_0024
     * @tc.desc      route contract for page 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0024 begin`);
      logInfo("routeUrl(70) + ':' + routeButtonId(70) + ':' + routeText(70)");
      const actual: string = routeUrl(70) + ':' + routeButtonId(70) + ':' + routeText(70);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0025
     * @tc.name      Perf_Route_0025
     * @tc.desc      route contract for page 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0025 begin`);
      logInfo("routeUrl(80) + ':' + routeButtonId(80) + ':' + routeText(80)");
      const actual: string = routeUrl(80) + ':' + routeButtonId(80) + ':' + routeText(80);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0026
     * @tc.name      Perf_Route_0026
     * @tc.desc      route contract for page 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0026 begin`);
      logInfo("routeUrl(90) + ':' + routeButtonId(90) + ':' + routeText(90)");
      const actual: string = routeUrl(90) + ':' + routeButtonId(90) + ':' + routeText(90);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0027
     * @tc.name      Perf_Route_0027
     * @tc.desc      route contract for page 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0027 begin`);
      logInfo("routeUrl(100) + ':' + routeButtonId(100) + ':' + routeText(100)");
      const actual: string = routeUrl(100) + ':' + routeButtonId(100) + ':' + routeText(100);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0028
     * @tc.name      Perf_Route_0028
     * @tc.desc      route contract for page 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0028 begin`);
      logInfo("routeUrl(200) + ':' + routeButtonId(200) + ':' + routeText(200)");
      const actual: string = routeUrl(200) + ':' + routeButtonId(200) + ':' + routeText(200);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0029
     * @tc.name      Perf_Route_0029
     * @tc.desc      route contract for page 255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0029 begin`);
      logInfo("routeUrl(255) + ':' + routeButtonId(255) + ':' + routeText(255)");
      const actual: string = routeUrl(255) + ':' + routeButtonId(255) + ':' + routeText(255);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0030
     * @tc.name      Perf_Route_0030
     * @tc.desc      route contract for page 360.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0030 begin`);
      logInfo("routeUrl(360) + ':' + routeButtonId(360) + ':' + routeText(360)");
      const actual: string = routeUrl(360) + ':' + routeButtonId(360) + ':' + routeText(360);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0031
     * @tc.name      Perf_Route_0031
     * @tc.desc      route contract for page 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0031 begin`);
      logInfo("routeUrl(720) + ':' + routeButtonId(720) + ':' + routeText(720)");
      const actual: string = routeUrl(720) + ':' + routeButtonId(720) + ':' + routeText(720);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Route_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_ROUTE_0032
     * @tc.name      Perf_Route_0032
     * @tc.desc      route contract for page 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Route_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Route_0032 begin`);
      logInfo("routeUrl(1080) + ':' + routeButtonId(1080) + ':' + routeText(1080)");
      const actual: string = routeUrl(1080) + ':' + routeButtonId(1080) + ':' + routeText(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "::");
      expect(actual).assertEqual("::");
      logInfo(`${BUNDLE}Route_0032 end`);
    });
  });
}
