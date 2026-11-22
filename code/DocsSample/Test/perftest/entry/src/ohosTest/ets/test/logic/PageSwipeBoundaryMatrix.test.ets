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
  flingDistance,
  fpsFromFrames,
  routeUrl,
  routeButtonId,
  routeText,
  navigationAction,
  routeFlag,
} from '../model/PerfTestLogic';

/** PageSwipeBoundaryMatrixTest logic checks (450 cases). */
export default function pageSwipeBoundaryMatrixTest(): void {
  describe('PageSwipeBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0001
     * @tc.name      Perf_PageSwipeMatrix_0001
     * @tc.desc      page/swipe matrix 0,0,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0001 begin`);
      logInfo("page/swipe matrix 0,0,0,0,true,0");
      const actual: string = flingDistance(0) + '|' + fpsFromFrames(0, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("0|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0002
     * @tc.name      Perf_PageSwipeMatrix_0002
     * @tc.desc      page/swipe matrix 13,3,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0002 begin`);
      logInfo("page/swipe matrix 13,3,100,1,false,1");
      const actual: string = flingDistance(13) + '|' + fpsFromFrames(3, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "13|30|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("13|30|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0003
     * @tc.name      Perf_PageSwipeMatrix_0003
     * @tc.desc      page/swipe matrix 26,6,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0003 begin`);
      logInfo("page/swipe matrix 26,6,200,2,true,2");
      const actual: string = flingDistance(26) + '|' + fpsFromFrames(6, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "26|30|pages/Index|||back|Pass");
      expect(actual).assertEqual("26|30|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0004
     * @tc.name      Perf_PageSwipeMatrix_0004
     * @tc.desc      page/swipe matrix 39,9,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0004 begin`);
      logInfo("page/swipe matrix 39,9,300,0,false,0");
      const actual: string = flingDistance(39) + '|' + fpsFromFrames(9, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "39|30|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("39|30|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0005
     * @tc.name      Perf_PageSwipeMatrix_0005
     * @tc.desc      page/swipe matrix 52,12,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0005 begin`);
      logInfo("page/swipe matrix 52,12,400,1,true,1");
      const actual: string = flingDistance(52) + '|' + fpsFromFrames(12, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "52|30|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("52|30|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0006
     * @tc.name      Perf_PageSwipeMatrix_0006
     * @tc.desc      page/swipe matrix 65,15,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0006 begin`);
      logInfo("page/swipe matrix 65,15,500,2,false,2");
      const actual: string = flingDistance(65) + '|' + fpsFromFrames(15, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "65|30|pages/Index|||back|Error");
      expect(actual).assertEqual("65|30|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0007
     * @tc.name      Perf_PageSwipeMatrix_0007
     * @tc.desc      page/swipe matrix 78,18,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0007 begin`);
      logInfo("page/swipe matrix 78,18,600,0,true,0");
      const actual: string = flingDistance(78) + '|' + fpsFromFrames(18, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "78|30|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("78|30|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0008
     * @tc.name      Perf_PageSwipeMatrix_0008
     * @tc.desc      page/swipe matrix 91,21,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0008 begin`);
      logInfo("page/swipe matrix 91,21,700,1,false,1");
      const actual: string = flingDistance(91) + '|' + fpsFromFrames(21, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "91|30|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("91|30|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0009
     * @tc.name      Perf_PageSwipeMatrix_0009
     * @tc.desc      page/swipe matrix 104,24,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0009 begin`);
      logInfo("page/swipe matrix 104,24,800,2,true,2");
      const actual: string = flingDistance(104) + '|' + fpsFromFrames(24, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "104|30|pages/Index|||back|Pass");
      expect(actual).assertEqual("104|30|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0010
     * @tc.name      Perf_PageSwipeMatrix_0010
     * @tc.desc      page/swipe matrix 117,27,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0010 begin`);
      logInfo("page/swipe matrix 117,27,900,0,false,0");
      const actual: string = flingDistance(117) + '|' + fpsFromFrames(27, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "117|30|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("117|30|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0011
     * @tc.name      Perf_PageSwipeMatrix_0011
     * @tc.desc      page/swipe matrix 130,30,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0011 begin`);
      logInfo("page/swipe matrix 130,30,0,1,true,1");
      const actual: string = flingDistance(130) + '|' + fpsFromFrames(30, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "130|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("130|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0012
     * @tc.name      Perf_PageSwipeMatrix_0012
     * @tc.desc      page/swipe matrix 143,33,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0012 begin`);
      logInfo("page/swipe matrix 143,33,100,2,false,2");
      const actual: string = flingDistance(143) + '|' + fpsFromFrames(33, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "143|330|pages/Index|||back|Error");
      expect(actual).assertEqual("143|330|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0013
     * @tc.name      Perf_PageSwipeMatrix_0013
     * @tc.desc      page/swipe matrix 156,36,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0013 begin`);
      logInfo("page/swipe matrix 156,36,200,0,true,0");
      const actual: string = flingDistance(156) + '|' + fpsFromFrames(36, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "156|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("156|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0014
     * @tc.name      Perf_PageSwipeMatrix_0014
     * @tc.desc      page/swipe matrix 169,39,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0014 begin`);
      logInfo("page/swipe matrix 169,39,300,1,false,1");
      const actual: string = flingDistance(169) + '|' + fpsFromFrames(39, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "169|130|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("169|130|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0015
     * @tc.name      Perf_PageSwipeMatrix_0015
     * @tc.desc      page/swipe matrix 182,42,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0015 begin`);
      logInfo("page/swipe matrix 182,42,400,2,true,2");
      const actual: string = flingDistance(182) + '|' + fpsFromFrames(42, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "182|105|pages/Index|||back|Pass");
      expect(actual).assertEqual("182|105|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0016
     * @tc.name      Perf_PageSwipeMatrix_0016
     * @tc.desc      page/swipe matrix 195,45,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0016 begin`);
      logInfo("page/swipe matrix 195,45,500,0,false,0");
      const actual: string = flingDistance(195) + '|' + fpsFromFrames(45, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "195|90|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("195|90|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0017
     * @tc.name      Perf_PageSwipeMatrix_0017
     * @tc.desc      page/swipe matrix 208,48,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0017 begin`);
      logInfo("page/swipe matrix 208,48,600,1,true,1");
      const actual: string = flingDistance(208) + '|' + fpsFromFrames(48, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "208|80|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("208|80|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0018
     * @tc.name      Perf_PageSwipeMatrix_0018
     * @tc.desc      page/swipe matrix 221,51,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0018 begin`);
      logInfo("page/swipe matrix 221,51,700,2,false,2");
      const actual: string = flingDistance(221) + '|' + fpsFromFrames(51, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "221|72.857143|pages/Index|||back|Error");
      expect(actual).assertEqual("221|72.857143|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0019
     * @tc.name      Perf_PageSwipeMatrix_0019
     * @tc.desc      page/swipe matrix 234,54,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0019 begin`);
      logInfo("page/swipe matrix 234,54,800,0,true,0");
      const actual: string = flingDistance(234) + '|' + fpsFromFrames(54, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "234|67.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("234|67.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0020
     * @tc.name      Perf_PageSwipeMatrix_0020
     * @tc.desc      page/swipe matrix 247,57,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0020 begin`);
      logInfo("page/swipe matrix 247,57,900,1,false,1");
      const actual: string = flingDistance(247) + '|' + fpsFromFrames(57, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "247|63.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("247|63.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0021
     * @tc.name      Perf_PageSwipeMatrix_0021
     * @tc.desc      page/swipe matrix 260,60,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0021 begin`);
      logInfo("page/swipe matrix 260,60,0,2,true,2");
      const actual: string = flingDistance(260) + '|' + fpsFromFrames(60, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "260|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("260|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0022
     * @tc.name      Perf_PageSwipeMatrix_0022
     * @tc.desc      page/swipe matrix 273,63,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0022 begin`);
      logInfo("page/swipe matrix 273,63,100,0,false,0");
      const actual: string = flingDistance(273) + '|' + fpsFromFrames(63, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "273|630|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("273|630|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0023
     * @tc.name      Perf_PageSwipeMatrix_0023
     * @tc.desc      page/swipe matrix 286,66,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0023 begin`);
      logInfo("page/swipe matrix 286,66,200,1,true,1");
      const actual: string = flingDistance(286) + '|' + fpsFromFrames(66, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "286|330|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("286|330|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0024
     * @tc.name      Perf_PageSwipeMatrix_0024
     * @tc.desc      page/swipe matrix 299,69,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0024 begin`);
      logInfo("page/swipe matrix 299,69,300,2,false,2");
      const actual: string = flingDistance(299) + '|' + fpsFromFrames(69, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "299|230|pages/Index|||back|Error");
      expect(actual).assertEqual("299|230|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0025
     * @tc.name      Perf_PageSwipeMatrix_0025
     * @tc.desc      page/swipe matrix 312,72,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0025 begin`);
      logInfo("page/swipe matrix 312,72,400,0,true,0");
      const actual: string = flingDistance(312) + '|' + fpsFromFrames(72, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "312|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("312|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0026
     * @tc.name      Perf_PageSwipeMatrix_0026
     * @tc.desc      page/swipe matrix 325,75,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0026 begin`);
      logInfo("page/swipe matrix 325,75,500,1,false,1");
      const actual: string = flingDistance(325) + '|' + fpsFromFrames(75, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "325|150|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("325|150|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0027
     * @tc.name      Perf_PageSwipeMatrix_0027
     * @tc.desc      page/swipe matrix 338,78,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0027 begin`);
      logInfo("page/swipe matrix 338,78,600,2,true,2");
      const actual: string = flingDistance(338) + '|' + fpsFromFrames(78, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "338|130|pages/Index|||back|Pass");
      expect(actual).assertEqual("338|130|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0028
     * @tc.name      Perf_PageSwipeMatrix_0028
     * @tc.desc      page/swipe matrix 351,81,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0028 begin`);
      logInfo("page/swipe matrix 351,81,700,0,false,0");
      const actual: string = flingDistance(351) + '|' + fpsFromFrames(81, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "351|115.714286|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("351|115.714286|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0029
     * @tc.name      Perf_PageSwipeMatrix_0029
     * @tc.desc      page/swipe matrix 364,84,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0029 begin`);
      logInfo("page/swipe matrix 364,84,800,1,true,1");
      const actual: string = flingDistance(364) + '|' + fpsFromFrames(84, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "364|105|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("364|105|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0030
     * @tc.name      Perf_PageSwipeMatrix_0030
     * @tc.desc      page/swipe matrix 377,87,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0030 begin`);
      logInfo("page/swipe matrix 377,87,900,2,false,2");
      const actual: string = flingDistance(377) + '|' + fpsFromFrames(87, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "377|96.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("377|96.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0031
     * @tc.name      Perf_PageSwipeMatrix_0031
     * @tc.desc      page/swipe matrix 390,90,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0031 begin`);
      logInfo("page/swipe matrix 390,90,0,0,true,0");
      const actual: string = flingDistance(390) + '|' + fpsFromFrames(90, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "390|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("390|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0032
     * @tc.name      Perf_PageSwipeMatrix_0032
     * @tc.desc      page/swipe matrix 403,93,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0032 begin`);
      logInfo("page/swipe matrix 403,93,100,1,false,1");
      const actual: string = flingDistance(403) + '|' + fpsFromFrames(93, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "403|930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("403|930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0033
     * @tc.name      Perf_PageSwipeMatrix_0033
     * @tc.desc      page/swipe matrix 416,96,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0033 begin`);
      logInfo("page/swipe matrix 416,96,200,2,true,2");
      const actual: string = flingDistance(416) + '|' + fpsFromFrames(96, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "416|480|pages/Index|||back|Pass");
      expect(actual).assertEqual("416|480|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0034
     * @tc.name      Perf_PageSwipeMatrix_0034
     * @tc.desc      page/swipe matrix 429,99,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0034 begin`);
      logInfo("page/swipe matrix 429,99,300,0,false,0");
      const actual: string = flingDistance(429) + '|' + fpsFromFrames(99, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "429|330|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("429|330|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0035
     * @tc.name      Perf_PageSwipeMatrix_0035
     * @tc.desc      page/swipe matrix 442,102,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0035 begin`);
      logInfo("page/swipe matrix 442,102,400,1,true,1");
      const actual: string = flingDistance(442) + '|' + fpsFromFrames(102, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "442|255|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("442|255|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0036
     * @tc.name      Perf_PageSwipeMatrix_0036
     * @tc.desc      page/swipe matrix 455,105,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0036 begin`);
      logInfo("page/swipe matrix 455,105,500,2,false,2");
      const actual: string = flingDistance(455) + '|' + fpsFromFrames(105, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "455|210|pages/Index|||back|Error");
      expect(actual).assertEqual("455|210|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0037
     * @tc.name      Perf_PageSwipeMatrix_0037
     * @tc.desc      page/swipe matrix 468,108,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0037 begin`);
      logInfo("page/swipe matrix 468,108,600,0,true,0");
      const actual: string = flingDistance(468) + '|' + fpsFromFrames(108, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "468|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("468|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0038
     * @tc.name      Perf_PageSwipeMatrix_0038
     * @tc.desc      page/swipe matrix 481,111,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0038 begin`);
      logInfo("page/swipe matrix 481,111,700,1,false,1");
      const actual: string = flingDistance(481) + '|' + fpsFromFrames(111, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "481|158.571429|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("481|158.571429|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0039
     * @tc.name      Perf_PageSwipeMatrix_0039
     * @tc.desc      page/swipe matrix 494,114,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0039 begin`);
      logInfo("page/swipe matrix 494,114,800,2,true,2");
      const actual: string = flingDistance(494) + '|' + fpsFromFrames(114, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "494|142.5|pages/Index|||back|Pass");
      expect(actual).assertEqual("494|142.5|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0040
     * @tc.name      Perf_PageSwipeMatrix_0040
     * @tc.desc      page/swipe matrix 507,117,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0040 begin`);
      logInfo("page/swipe matrix 507,117,900,0,false,0");
      const actual: string = flingDistance(507) + '|' + fpsFromFrames(117, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "507|130|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("507|130|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0041
     * @tc.name      Perf_PageSwipeMatrix_0041
     * @tc.desc      page/swipe matrix 520,120,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0041 begin`);
      logInfo("page/swipe matrix 520,120,0,1,true,1");
      const actual: string = flingDistance(520) + '|' + fpsFromFrames(120, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "520|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("520|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0042
     * @tc.name      Perf_PageSwipeMatrix_0042
     * @tc.desc      page/swipe matrix 533,123,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0042 begin`);
      logInfo("page/swipe matrix 533,123,100,2,false,2");
      const actual: string = flingDistance(533) + '|' + fpsFromFrames(123, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "533|1230|pages/Index|||back|Error");
      expect(actual).assertEqual("533|1230|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0043
     * @tc.name      Perf_PageSwipeMatrix_0043
     * @tc.desc      page/swipe matrix 546,126,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0043 begin`);
      logInfo("page/swipe matrix 546,126,200,0,true,0");
      const actual: string = flingDistance(546) + '|' + fpsFromFrames(126, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "546|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("546|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0044
     * @tc.name      Perf_PageSwipeMatrix_0044
     * @tc.desc      page/swipe matrix 559,129,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0044 begin`);
      logInfo("page/swipe matrix 559,129,300,1,false,1");
      const actual: string = flingDistance(559) + '|' + fpsFromFrames(129, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "559|430|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("559|430|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0045
     * @tc.name      Perf_PageSwipeMatrix_0045
     * @tc.desc      page/swipe matrix 572,132,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0045 begin`);
      logInfo("page/swipe matrix 572,132,400,2,true,2");
      const actual: string = flingDistance(572) + '|' + fpsFromFrames(132, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "572|330|pages/Index|||back|Pass");
      expect(actual).assertEqual("572|330|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0046
     * @tc.name      Perf_PageSwipeMatrix_0046
     * @tc.desc      page/swipe matrix 585,135,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0046 begin`);
      logInfo("page/swipe matrix 585,135,500,0,false,0");
      const actual: string = flingDistance(585) + '|' + fpsFromFrames(135, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "585|270|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("585|270|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0047
     * @tc.name      Perf_PageSwipeMatrix_0047
     * @tc.desc      page/swipe matrix 598,138,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0047 begin`);
      logInfo("page/swipe matrix 598,138,600,1,true,1");
      const actual: string = flingDistance(598) + '|' + fpsFromFrames(138, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "598|230|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("598|230|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0048
     * @tc.name      Perf_PageSwipeMatrix_0048
     * @tc.desc      page/swipe matrix 611,141,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0048 begin`);
      logInfo("page/swipe matrix 611,141,700,2,false,2");
      const actual: string = flingDistance(611) + '|' + fpsFromFrames(141, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "611|201.428571|pages/Index|||back|Error");
      expect(actual).assertEqual("611|201.428571|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0049
     * @tc.name      Perf_PageSwipeMatrix_0049
     * @tc.desc      page/swipe matrix 624,144,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0049 begin`);
      logInfo("page/swipe matrix 624,144,800,0,true,0");
      const actual: string = flingDistance(624) + '|' + fpsFromFrames(144, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "624|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("624|180|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0050
     * @tc.name      Perf_PageSwipeMatrix_0050
     * @tc.desc      page/swipe matrix 637,147,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0050 begin`);
      logInfo("page/swipe matrix 637,147,900,1,false,1");
      const actual: string = flingDistance(637) + '|' + fpsFromFrames(147, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "637|163.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("637|163.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0051
     * @tc.name      Perf_PageSwipeMatrix_0051
     * @tc.desc      page/swipe matrix 650,150,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0051 begin`);
      logInfo("page/swipe matrix 650,150,0,2,true,2");
      const actual: string = flingDistance(650) + '|' + fpsFromFrames(150, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "650|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("650|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0052
     * @tc.name      Perf_PageSwipeMatrix_0052
     * @tc.desc      page/swipe matrix 663,153,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0052 begin`);
      logInfo("page/swipe matrix 663,153,100,0,false,0");
      const actual: string = flingDistance(663) + '|' + fpsFromFrames(153, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "663|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("663|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0053
     * @tc.name      Perf_PageSwipeMatrix_0053
     * @tc.desc      page/swipe matrix 676,156,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0053 begin`);
      logInfo("page/swipe matrix 676,156,200,1,true,1");
      const actual: string = flingDistance(676) + '|' + fpsFromFrames(156, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "676|780|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("676|780|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0054
     * @tc.name      Perf_PageSwipeMatrix_0054
     * @tc.desc      page/swipe matrix 689,159,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0054 begin`);
      logInfo("page/swipe matrix 689,159,300,2,false,2");
      const actual: string = flingDistance(689) + '|' + fpsFromFrames(159, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "689|530|pages/Index|||back|Error");
      expect(actual).assertEqual("689|530|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0055
     * @tc.name      Perf_PageSwipeMatrix_0055
     * @tc.desc      page/swipe matrix 702,162,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0055 begin`);
      logInfo("page/swipe matrix 702,162,400,0,true,0");
      const actual: string = flingDistance(702) + '|' + fpsFromFrames(162, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "702|405|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("702|405|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0056
     * @tc.name      Perf_PageSwipeMatrix_0056
     * @tc.desc      page/swipe matrix 715,165,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0056 begin`);
      logInfo("page/swipe matrix 715,165,500,1,false,1");
      const actual: string = flingDistance(715) + '|' + fpsFromFrames(165, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "715|330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("715|330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0057
     * @tc.name      Perf_PageSwipeMatrix_0057
     * @tc.desc      page/swipe matrix 728,168,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0057 begin`);
      logInfo("page/swipe matrix 728,168,600,2,true,2");
      const actual: string = flingDistance(728) + '|' + fpsFromFrames(168, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "728|280|pages/Index|||back|Pass");
      expect(actual).assertEqual("728|280|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0058
     * @tc.name      Perf_PageSwipeMatrix_0058
     * @tc.desc      page/swipe matrix 741,171,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0058 begin`);
      logInfo("page/swipe matrix 741,171,700,0,false,0");
      const actual: string = flingDistance(741) + '|' + fpsFromFrames(171, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "741|244.285714|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("741|244.285714|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0059
     * @tc.name      Perf_PageSwipeMatrix_0059
     * @tc.desc      page/swipe matrix 754,174,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0059 begin`);
      logInfo("page/swipe matrix 754,174,800,1,true,1");
      const actual: string = flingDistance(754) + '|' + fpsFromFrames(174, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "754|217.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("754|217.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0060
     * @tc.name      Perf_PageSwipeMatrix_0060
     * @tc.desc      page/swipe matrix 767,177,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0060 begin`);
      logInfo("page/swipe matrix 767,177,900,2,false,2");
      const actual: string = flingDistance(767) + '|' + fpsFromFrames(177, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "767|196.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("767|196.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0061
     * @tc.name      Perf_PageSwipeMatrix_0061
     * @tc.desc      page/swipe matrix 780,180,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0061 begin`);
      logInfo("page/swipe matrix 780,180,0,0,true,0");
      const actual: string = flingDistance(780) + '|' + fpsFromFrames(180, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "780|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("780|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0062
     * @tc.name      Perf_PageSwipeMatrix_0062
     * @tc.desc      page/swipe matrix 793,183,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0062 begin`);
      logInfo("page/swipe matrix 793,183,100,1,false,1");
      const actual: string = flingDistance(793) + '|' + fpsFromFrames(183, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "793|1830|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("793|1830|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0063
     * @tc.name      Perf_PageSwipeMatrix_0063
     * @tc.desc      page/swipe matrix 806,186,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0063 begin`);
      logInfo("page/swipe matrix 806,186,200,2,true,2");
      const actual: string = flingDistance(806) + '|' + fpsFromFrames(186, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "806|930|pages/Index|||back|Pass");
      expect(actual).assertEqual("806|930|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0064
     * @tc.name      Perf_PageSwipeMatrix_0064
     * @tc.desc      page/swipe matrix 819,189,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0064 begin`);
      logInfo("page/swipe matrix 819,189,300,0,false,0");
      const actual: string = flingDistance(819) + '|' + fpsFromFrames(189, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "819|630|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("819|630|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0065
     * @tc.name      Perf_PageSwipeMatrix_0065
     * @tc.desc      page/swipe matrix 832,192,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0065 begin`);
      logInfo("page/swipe matrix 832,192,400,1,true,1");
      const actual: string = flingDistance(832) + '|' + fpsFromFrames(192, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "832|480|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("832|480|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0066
     * @tc.name      Perf_PageSwipeMatrix_0066
     * @tc.desc      page/swipe matrix 845,195,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0066 begin`);
      logInfo("page/swipe matrix 845,195,500,2,false,2");
      const actual: string = flingDistance(845) + '|' + fpsFromFrames(195, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "845|390|pages/Index|||back|Error");
      expect(actual).assertEqual("845|390|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0067
     * @tc.name      Perf_PageSwipeMatrix_0067
     * @tc.desc      page/swipe matrix 858,198,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0067 begin`);
      logInfo("page/swipe matrix 858,198,600,0,true,0");
      const actual: string = flingDistance(858) + '|' + fpsFromFrames(198, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "858|330|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("858|330|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0068
     * @tc.name      Perf_PageSwipeMatrix_0068
     * @tc.desc      page/swipe matrix 871,201,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0068 begin`);
      logInfo("page/swipe matrix 871,201,700,1,false,1");
      const actual: string = flingDistance(871) + '|' + fpsFromFrames(201, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "871|287.142857|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("871|287.142857|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0069
     * @tc.name      Perf_PageSwipeMatrix_0069
     * @tc.desc      page/swipe matrix 884,204,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0069 begin`);
      logInfo("page/swipe matrix 884,204,800,2,true,2");
      const actual: string = flingDistance(884) + '|' + fpsFromFrames(204, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "884|255|pages/Index|||back|Pass");
      expect(actual).assertEqual("884|255|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0070
     * @tc.name      Perf_PageSwipeMatrix_0070
     * @tc.desc      page/swipe matrix 897,207,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0070 begin`);
      logInfo("page/swipe matrix 897,207,900,0,false,0");
      const actual: string = flingDistance(897) + '|' + fpsFromFrames(207, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "897|230|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("897|230|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0071
     * @tc.name      Perf_PageSwipeMatrix_0071
     * @tc.desc      page/swipe matrix 910,210,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0071 begin`);
      logInfo("page/swipe matrix 910,210,0,1,true,1");
      const actual: string = flingDistance(910) + '|' + fpsFromFrames(210, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "910|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("910|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0072
     * @tc.name      Perf_PageSwipeMatrix_0072
     * @tc.desc      page/swipe matrix 923,213,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0072 begin`);
      logInfo("page/swipe matrix 923,213,100,2,false,2");
      const actual: string = flingDistance(923) + '|' + fpsFromFrames(213, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "923|2130|pages/Index|||back|Error");
      expect(actual).assertEqual("923|2130|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0073
     * @tc.name      Perf_PageSwipeMatrix_0073
     * @tc.desc      page/swipe matrix 936,216,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0073 begin`);
      logInfo("page/swipe matrix 936,216,200,0,true,0");
      const actual: string = flingDistance(936) + '|' + fpsFromFrames(216, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "936|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("936|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0074
     * @tc.name      Perf_PageSwipeMatrix_0074
     * @tc.desc      page/swipe matrix 949,219,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0074 begin`);
      logInfo("page/swipe matrix 949,219,300,1,false,1");
      const actual: string = flingDistance(949) + '|' + fpsFromFrames(219, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "949|730|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("949|730|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0075
     * @tc.name      Perf_PageSwipeMatrix_0075
     * @tc.desc      page/swipe matrix 962,222,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0075 begin`);
      logInfo("page/swipe matrix 962,222,400,2,true,2");
      const actual: string = flingDistance(962) + '|' + fpsFromFrames(222, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "962|555|pages/Index|||back|Pass");
      expect(actual).assertEqual("962|555|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0076
     * @tc.name      Perf_PageSwipeMatrix_0076
     * @tc.desc      page/swipe matrix 975,225,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0076 begin`);
      logInfo("page/swipe matrix 975,225,500,0,false,0");
      const actual: string = flingDistance(975) + '|' + fpsFromFrames(225, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "975|450|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("975|450|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0077
     * @tc.name      Perf_PageSwipeMatrix_0077
     * @tc.desc      page/swipe matrix 988,228,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0077 begin`);
      logInfo("page/swipe matrix 988,228,600,1,true,1");
      const actual: string = flingDistance(988) + '|' + fpsFromFrames(228, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "988|380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("988|380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0078
     * @tc.name      Perf_PageSwipeMatrix_0078
     * @tc.desc      page/swipe matrix 1001,231,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0078 begin`);
      logInfo("page/swipe matrix 1001,231,700,2,false,2");
      const actual: string = flingDistance(1001) + '|' + fpsFromFrames(231, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1001|330|pages/Index|||back|Error");
      expect(actual).assertEqual("1001|330|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0079
     * @tc.name      Perf_PageSwipeMatrix_0079
     * @tc.desc      page/swipe matrix 1014,234,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0079 begin`);
      logInfo("page/swipe matrix 1014,234,800,0,true,0");
      const actual: string = flingDistance(1014) + '|' + fpsFromFrames(234, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1014|292.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1014|292.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0080
     * @tc.name      Perf_PageSwipeMatrix_0080
     * @tc.desc      page/swipe matrix 1027,237,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0080 begin`);
      logInfo("page/swipe matrix 1027,237,900,1,false,1");
      const actual: string = flingDistance(1027) + '|' + fpsFromFrames(237, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1027|263.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1027|263.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0081
     * @tc.name      Perf_PageSwipeMatrix_0081
     * @tc.desc      page/swipe matrix 1040,240,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0081 begin`);
      logInfo("page/swipe matrix 1040,240,0,2,true,2");
      const actual: string = flingDistance(1040) + '|' + fpsFromFrames(240, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1040|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("1040|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0082
     * @tc.name      Perf_PageSwipeMatrix_0082
     * @tc.desc      page/swipe matrix 1053,243,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0082 begin`);
      logInfo("page/swipe matrix 1053,243,100,0,false,0");
      const actual: string = flingDistance(1053) + '|' + fpsFromFrames(243, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1053|2430|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1053|2430|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0083
     * @tc.name      Perf_PageSwipeMatrix_0083
     * @tc.desc      page/swipe matrix 1066,246,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0083 begin`);
      logInfo("page/swipe matrix 1066,246,200,1,true,1");
      const actual: string = flingDistance(1066) + '|' + fpsFromFrames(246, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1066|1230|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1066|1230|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0084
     * @tc.name      Perf_PageSwipeMatrix_0084
     * @tc.desc      page/swipe matrix 1079,249,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0084 begin`);
      logInfo("page/swipe matrix 1079,249,300,2,false,2");
      const actual: string = flingDistance(1079) + '|' + fpsFromFrames(249, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1079|830|pages/Index|||back|Error");
      expect(actual).assertEqual("1079|830|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0085
     * @tc.name      Perf_PageSwipeMatrix_0085
     * @tc.desc      page/swipe matrix 1092,252,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0085 begin`);
      logInfo("page/swipe matrix 1092,252,400,0,true,0");
      const actual: string = flingDistance(1092) + '|' + fpsFromFrames(252, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1092|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1092|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0086
     * @tc.name      Perf_PageSwipeMatrix_0086
     * @tc.desc      page/swipe matrix 1105,255,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0086 begin`);
      logInfo("page/swipe matrix 1105,255,500,1,false,1");
      const actual: string = flingDistance(1105) + '|' + fpsFromFrames(255, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1105|510|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1105|510|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0087
     * @tc.name      Perf_PageSwipeMatrix_0087
     * @tc.desc      page/swipe matrix 1118,258,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0087 begin`);
      logInfo("page/swipe matrix 1118,258,600,2,true,2");
      const actual: string = flingDistance(1118) + '|' + fpsFromFrames(258, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1118|430|pages/Index|||back|Pass");
      expect(actual).assertEqual("1118|430|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0088
     * @tc.name      Perf_PageSwipeMatrix_0088
     * @tc.desc      page/swipe matrix 1131,261,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0088 begin`);
      logInfo("page/swipe matrix 1131,261,700,0,false,0");
      const actual: string = flingDistance(1131) + '|' + fpsFromFrames(261, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1131|372.857143|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1131|372.857143|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0089
     * @tc.name      Perf_PageSwipeMatrix_0089
     * @tc.desc      page/swipe matrix 1144,264,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0089 begin`);
      logInfo("page/swipe matrix 1144,264,800,1,true,1");
      const actual: string = flingDistance(1144) + '|' + fpsFromFrames(264, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1144|330|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1144|330|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0090
     * @tc.name      Perf_PageSwipeMatrix_0090
     * @tc.desc      page/swipe matrix 1157,267,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0090 begin`);
      logInfo("page/swipe matrix 1157,267,900,2,false,2");
      const actual: string = flingDistance(1157) + '|' + fpsFromFrames(267, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1157|296.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("1157|296.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0091
     * @tc.name      Perf_PageSwipeMatrix_0091
     * @tc.desc      page/swipe matrix 1170,270,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0091 begin`);
      logInfo("page/swipe matrix 1170,270,0,0,true,0");
      const actual: string = flingDistance(1170) + '|' + fpsFromFrames(270, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1170|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1170|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0092
     * @tc.name      Perf_PageSwipeMatrix_0092
     * @tc.desc      page/swipe matrix 1183,273,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0092 begin`);
      logInfo("page/swipe matrix 1183,273,100,1,false,1");
      const actual: string = flingDistance(1183) + '|' + fpsFromFrames(273, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1183|2730|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1183|2730|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0093
     * @tc.name      Perf_PageSwipeMatrix_0093
     * @tc.desc      page/swipe matrix 1196,276,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0093 begin`);
      logInfo("page/swipe matrix 1196,276,200,2,true,2");
      const actual: string = flingDistance(1196) + '|' + fpsFromFrames(276, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1196|1380|pages/Index|||back|Pass");
      expect(actual).assertEqual("1196|1380|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0094
     * @tc.name      Perf_PageSwipeMatrix_0094
     * @tc.desc      page/swipe matrix 1209,279,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0094 begin`);
      logInfo("page/swipe matrix 1209,279,300,0,false,0");
      const actual: string = flingDistance(1209) + '|' + fpsFromFrames(279, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1209|930|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1209|930|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0095
     * @tc.name      Perf_PageSwipeMatrix_0095
     * @tc.desc      page/swipe matrix 1222,282,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0095 begin`);
      logInfo("page/swipe matrix 1222,282,400,1,true,1");
      const actual: string = flingDistance(1222) + '|' + fpsFromFrames(282, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1222|705|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1222|705|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0096
     * @tc.name      Perf_PageSwipeMatrix_0096
     * @tc.desc      page/swipe matrix 1235,285,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0096 begin`);
      logInfo("page/swipe matrix 1235,285,500,2,false,2");
      const actual: string = flingDistance(1235) + '|' + fpsFromFrames(285, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1235|570|pages/Index|||back|Error");
      expect(actual).assertEqual("1235|570|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0097
     * @tc.name      Perf_PageSwipeMatrix_0097
     * @tc.desc      page/swipe matrix 1248,288,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0097 begin`);
      logInfo("page/swipe matrix 1248,288,600,0,true,0");
      const actual: string = flingDistance(1248) + '|' + fpsFromFrames(288, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1248|480|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1248|480|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0098
     * @tc.name      Perf_PageSwipeMatrix_0098
     * @tc.desc      page/swipe matrix 1261,291,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0098 begin`);
      logInfo("page/swipe matrix 1261,291,700,1,false,1");
      const actual: string = flingDistance(1261) + '|' + fpsFromFrames(291, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1261|415.714286|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1261|415.714286|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0099
     * @tc.name      Perf_PageSwipeMatrix_0099
     * @tc.desc      page/swipe matrix 1274,294,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0099 begin`);
      logInfo("page/swipe matrix 1274,294,800,2,true,2");
      const actual: string = flingDistance(1274) + '|' + fpsFromFrames(294, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1274|367.5|pages/Index|||back|Pass");
      expect(actual).assertEqual("1274|367.5|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0100
     * @tc.name      Perf_PageSwipeMatrix_0100
     * @tc.desc      page/swipe matrix 1287,297,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0100 begin`);
      logInfo("page/swipe matrix 1287,297,900,0,false,0");
      const actual: string = flingDistance(1287) + '|' + fpsFromFrames(297, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1287|330|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1287|330|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0101
     * @tc.name      Perf_PageSwipeMatrix_0101
     * @tc.desc      page/swipe matrix 1300,300,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0101 begin`);
      logInfo("page/swipe matrix 1300,300,0,1,true,1");
      const actual: string = flingDistance(1300) + '|' + fpsFromFrames(300, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1300|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1300|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0102
     * @tc.name      Perf_PageSwipeMatrix_0102
     * @tc.desc      page/swipe matrix 1313,303,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0102 begin`);
      logInfo("page/swipe matrix 1313,303,100,2,false,2");
      const actual: string = flingDistance(1313) + '|' + fpsFromFrames(303, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1313|3030|pages/Index|||back|Error");
      expect(actual).assertEqual("1313|3030|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0103
     * @tc.name      Perf_PageSwipeMatrix_0103
     * @tc.desc      page/swipe matrix 1326,306,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0103 begin`);
      logInfo("page/swipe matrix 1326,306,200,0,true,0");
      const actual: string = flingDistance(1326) + '|' + fpsFromFrames(306, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1326|1530|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1326|1530|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0104
     * @tc.name      Perf_PageSwipeMatrix_0104
     * @tc.desc      page/swipe matrix 1339,309,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0104 begin`);
      logInfo("page/swipe matrix 1339,309,300,1,false,1");
      const actual: string = flingDistance(1339) + '|' + fpsFromFrames(309, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1339|1030|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1339|1030|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0105
     * @tc.name      Perf_PageSwipeMatrix_0105
     * @tc.desc      page/swipe matrix 1352,312,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0105 begin`);
      logInfo("page/swipe matrix 1352,312,400,2,true,2");
      const actual: string = flingDistance(1352) + '|' + fpsFromFrames(312, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1352|780|pages/Index|||back|Pass");
      expect(actual).assertEqual("1352|780|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0106
     * @tc.name      Perf_PageSwipeMatrix_0106
     * @tc.desc      page/swipe matrix 1365,315,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0106 begin`);
      logInfo("page/swipe matrix 1365,315,500,0,false,0");
      const actual: string = flingDistance(1365) + '|' + fpsFromFrames(315, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1365|630|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1365|630|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0107
     * @tc.name      Perf_PageSwipeMatrix_0107
     * @tc.desc      page/swipe matrix 1378,318,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0107 begin`);
      logInfo("page/swipe matrix 1378,318,600,1,true,1");
      const actual: string = flingDistance(1378) + '|' + fpsFromFrames(318, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1378|530|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1378|530|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0108
     * @tc.name      Perf_PageSwipeMatrix_0108
     * @tc.desc      page/swipe matrix 1391,321,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0108 begin`);
      logInfo("page/swipe matrix 1391,321,700,2,false,2");
      const actual: string = flingDistance(1391) + '|' + fpsFromFrames(321, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1391|458.571429|pages/Index|||back|Error");
      expect(actual).assertEqual("1391|458.571429|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0109
     * @tc.name      Perf_PageSwipeMatrix_0109
     * @tc.desc      page/swipe matrix 1404,324,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0109 begin`);
      logInfo("page/swipe matrix 1404,324,800,0,true,0");
      const actual: string = flingDistance(1404) + '|' + fpsFromFrames(324, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1404|405|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1404|405|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0110
     * @tc.name      Perf_PageSwipeMatrix_0110
     * @tc.desc      page/swipe matrix 1417,327,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0110 begin`);
      logInfo("page/swipe matrix 1417,327,900,1,false,1");
      const actual: string = flingDistance(1417) + '|' + fpsFromFrames(327, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1417|363.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1417|363.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0111
     * @tc.name      Perf_PageSwipeMatrix_0111
     * @tc.desc      page/swipe matrix 1430,330,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0111 begin`);
      logInfo("page/swipe matrix 1430,330,0,2,true,2");
      const actual: string = flingDistance(1430) + '|' + fpsFromFrames(330, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1430|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("1430|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0112
     * @tc.name      Perf_PageSwipeMatrix_0112
     * @tc.desc      page/swipe matrix 1443,333,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0112 begin`);
      logInfo("page/swipe matrix 1443,333,100,0,false,0");
      const actual: string = flingDistance(1443) + '|' + fpsFromFrames(333, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1443|3330|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1443|3330|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0113
     * @tc.name      Perf_PageSwipeMatrix_0113
     * @tc.desc      page/swipe matrix 1456,336,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0113 begin`);
      logInfo("page/swipe matrix 1456,336,200,1,true,1");
      const actual: string = flingDistance(1456) + '|' + fpsFromFrames(336, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1456|1680|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1456|1680|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0114
     * @tc.name      Perf_PageSwipeMatrix_0114
     * @tc.desc      page/swipe matrix 1469,339,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0114 begin`);
      logInfo("page/swipe matrix 1469,339,300,2,false,2");
      const actual: string = flingDistance(1469) + '|' + fpsFromFrames(339, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1469|1130|pages/Index|||back|Error");
      expect(actual).assertEqual("1469|1130|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0115
     * @tc.name      Perf_PageSwipeMatrix_0115
     * @tc.desc      page/swipe matrix 1482,342,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0115 begin`);
      logInfo("page/swipe matrix 1482,342,400,0,true,0");
      const actual: string = flingDistance(1482) + '|' + fpsFromFrames(342, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1482|855|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1482|855|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0116
     * @tc.name      Perf_PageSwipeMatrix_0116
     * @tc.desc      page/swipe matrix 1495,345,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0116 begin`);
      logInfo("page/swipe matrix 1495,345,500,1,false,1");
      const actual: string = flingDistance(1495) + '|' + fpsFromFrames(345, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1495|690|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1495|690|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0117
     * @tc.name      Perf_PageSwipeMatrix_0117
     * @tc.desc      page/swipe matrix 1508,348,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0117 begin`);
      logInfo("page/swipe matrix 1508,348,600,2,true,2");
      const actual: string = flingDistance(1508) + '|' + fpsFromFrames(348, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1508|580|pages/Index|||back|Pass");
      expect(actual).assertEqual("1508|580|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0118
     * @tc.name      Perf_PageSwipeMatrix_0118
     * @tc.desc      page/swipe matrix 1521,351,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0118 begin`);
      logInfo("page/swipe matrix 1521,351,700,0,false,0");
      const actual: string = flingDistance(1521) + '|' + fpsFromFrames(351, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1521|501.428571|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1521|501.428571|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0119
     * @tc.name      Perf_PageSwipeMatrix_0119
     * @tc.desc      page/swipe matrix 1534,354,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0119 begin`);
      logInfo("page/swipe matrix 1534,354,800,1,true,1");
      const actual: string = flingDistance(1534) + '|' + fpsFromFrames(354, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1534|442.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1534|442.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0120
     * @tc.name      Perf_PageSwipeMatrix_0120
     * @tc.desc      page/swipe matrix 1547,357,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0120 begin`);
      logInfo("page/swipe matrix 1547,357,900,2,false,2");
      const actual: string = flingDistance(1547) + '|' + fpsFromFrames(357, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1547|396.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("1547|396.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0121
     * @tc.name      Perf_PageSwipeMatrix_0121
     * @tc.desc      page/swipe matrix 1560,360,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0121 begin`);
      logInfo("page/swipe matrix 1560,360,0,0,true,0");
      const actual: string = flingDistance(1560) + '|' + fpsFromFrames(360, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1560|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1560|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0122
     * @tc.name      Perf_PageSwipeMatrix_0122
     * @tc.desc      page/swipe matrix 1573,363,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0122 begin`);
      logInfo("page/swipe matrix 1573,363,100,1,false,1");
      const actual: string = flingDistance(1573) + '|' + fpsFromFrames(363, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1573|3630|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1573|3630|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0123
     * @tc.name      Perf_PageSwipeMatrix_0123
     * @tc.desc      page/swipe matrix 1586,366,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0123 begin`);
      logInfo("page/swipe matrix 1586,366,200,2,true,2");
      const actual: string = flingDistance(1586) + '|' + fpsFromFrames(366, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1586|1830|pages/Index|||back|Pass");
      expect(actual).assertEqual("1586|1830|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0124
     * @tc.name      Perf_PageSwipeMatrix_0124
     * @tc.desc      page/swipe matrix 1599,369,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0124 begin`);
      logInfo("page/swipe matrix 1599,369,300,0,false,0");
      const actual: string = flingDistance(1599) + '|' + fpsFromFrames(369, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1599|1230|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1599|1230|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0125
     * @tc.name      Perf_PageSwipeMatrix_0125
     * @tc.desc      page/swipe matrix 1612,372,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0125 begin`);
      logInfo("page/swipe matrix 1612,372,400,1,true,1");
      const actual: string = flingDistance(1612) + '|' + fpsFromFrames(372, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1612|930|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1612|930|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0126
     * @tc.name      Perf_PageSwipeMatrix_0126
     * @tc.desc      page/swipe matrix 1625,375,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0126 begin`);
      logInfo("page/swipe matrix 1625,375,500,2,false,2");
      const actual: string = flingDistance(1625) + '|' + fpsFromFrames(375, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1625|750|pages/Index|||back|Error");
      expect(actual).assertEqual("1625|750|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0126 end`);
    });
