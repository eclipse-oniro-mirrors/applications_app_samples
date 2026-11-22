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

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0127
     * @tc.name      Perf_PageSwipeMatrix_0127
     * @tc.desc      page/swipe matrix 1638,378,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0127 begin`);
      logInfo("page/swipe matrix 1638,378,600,0,true,0");
      const actual: string = flingDistance(1638) + '|' + fpsFromFrames(378, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1638|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1638|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0128
     * @tc.name      Perf_PageSwipeMatrix_0128
     * @tc.desc      page/swipe matrix 1651,381,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0128 begin`);
      logInfo("page/swipe matrix 1651,381,700,1,false,1");
      const actual: string = flingDistance(1651) + '|' + fpsFromFrames(381, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1651|544.285714|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1651|544.285714|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0129
     * @tc.name      Perf_PageSwipeMatrix_0129
     * @tc.desc      page/swipe matrix 1664,384,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0129 begin`);
      logInfo("page/swipe matrix 1664,384,800,2,true,2");
      const actual: string = flingDistance(1664) + '|' + fpsFromFrames(384, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1664|480|pages/Index|||back|Pass");
      expect(actual).assertEqual("1664|480|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0130
     * @tc.name      Perf_PageSwipeMatrix_0130
     * @tc.desc      page/swipe matrix 1677,387,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0130 begin`);
      logInfo("page/swipe matrix 1677,387,900,0,false,0");
      const actual: string = flingDistance(1677) + '|' + fpsFromFrames(387, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1677|430|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1677|430|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0131
     * @tc.name      Perf_PageSwipeMatrix_0131
     * @tc.desc      page/swipe matrix 1690,390,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0131 begin`);
      logInfo("page/swipe matrix 1690,390,0,1,true,1");
      const actual: string = flingDistance(1690) + '|' + fpsFromFrames(390, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1690|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1690|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0132
     * @tc.name      Perf_PageSwipeMatrix_0132
     * @tc.desc      page/swipe matrix 1703,393,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0132 begin`);
      logInfo("page/swipe matrix 1703,393,100,2,false,2");
      const actual: string = flingDistance(1703) + '|' + fpsFromFrames(393, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1703|3930|pages/Index|||back|Error");
      expect(actual).assertEqual("1703|3930|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0133
     * @tc.name      Perf_PageSwipeMatrix_0133
     * @tc.desc      page/swipe matrix 1716,396,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0133 begin`);
      logInfo("page/swipe matrix 1716,396,200,0,true,0");
      const actual: string = flingDistance(1716) + '|' + fpsFromFrames(396, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1716|1980|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1716|1980|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0134
     * @tc.name      Perf_PageSwipeMatrix_0134
     * @tc.desc      page/swipe matrix 1729,399,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0134 begin`);
      logInfo("page/swipe matrix 1729,399,300,1,false,1");
      const actual: string = flingDistance(1729) + '|' + fpsFromFrames(399, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1729|1330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1729|1330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0135
     * @tc.name      Perf_PageSwipeMatrix_0135
     * @tc.desc      page/swipe matrix 1742,402,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0135 begin`);
      logInfo("page/swipe matrix 1742,402,400,2,true,2");
      const actual: string = flingDistance(1742) + '|' + fpsFromFrames(402, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1742|1005|pages/Index|||back|Pass");
      expect(actual).assertEqual("1742|1005|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0136
     * @tc.name      Perf_PageSwipeMatrix_0136
     * @tc.desc      page/swipe matrix 1755,405,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0136 begin`);
      logInfo("page/swipe matrix 1755,405,500,0,false,0");
      const actual: string = flingDistance(1755) + '|' + fpsFromFrames(405, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1755|810|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1755|810|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0137
     * @tc.name      Perf_PageSwipeMatrix_0137
     * @tc.desc      page/swipe matrix 1768,408,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0137 begin`);
      logInfo("page/swipe matrix 1768,408,600,1,true,1");
      const actual: string = flingDistance(1768) + '|' + fpsFromFrames(408, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1768|680|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1768|680|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0138
     * @tc.name      Perf_PageSwipeMatrix_0138
     * @tc.desc      page/swipe matrix 1781,411,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0138 begin`);
      logInfo("page/swipe matrix 1781,411,700,2,false,2");
      const actual: string = flingDistance(1781) + '|' + fpsFromFrames(411, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1781|587.142857|pages/Index|||back|Error");
      expect(actual).assertEqual("1781|587.142857|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0139
     * @tc.name      Perf_PageSwipeMatrix_0139
     * @tc.desc      page/swipe matrix 1794,414,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0139 begin`);
      logInfo("page/swipe matrix 1794,414,800,0,true,0");
      const actual: string = flingDistance(1794) + '|' + fpsFromFrames(414, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1794|517.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1794|517.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0140
     * @tc.name      Perf_PageSwipeMatrix_0140
     * @tc.desc      page/swipe matrix 1807,417,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0140 begin`);
      logInfo("page/swipe matrix 1807,417,900,1,false,1");
      const actual: string = flingDistance(1807) + '|' + fpsFromFrames(417, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1807|463.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1807|463.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0141
     * @tc.name      Perf_PageSwipeMatrix_0141
     * @tc.desc      page/swipe matrix 1820,420,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0141 begin`);
      logInfo("page/swipe matrix 1820,420,0,2,true,2");
      const actual: string = flingDistance(1820) + '|' + fpsFromFrames(420, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1820|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("1820|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0142
     * @tc.name      Perf_PageSwipeMatrix_0142
     * @tc.desc      page/swipe matrix 1833,423,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0142 begin`);
      logInfo("page/swipe matrix 1833,423,100,0,false,0");
      const actual: string = flingDistance(1833) + '|' + fpsFromFrames(423, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1833|4230|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1833|4230|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0143
     * @tc.name      Perf_PageSwipeMatrix_0143
     * @tc.desc      page/swipe matrix 1846,426,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0143 begin`);
      logInfo("page/swipe matrix 1846,426,200,1,true,1");
      const actual: string = flingDistance(1846) + '|' + fpsFromFrames(426, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1846|2130|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1846|2130|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0144
     * @tc.name      Perf_PageSwipeMatrix_0144
     * @tc.desc      page/swipe matrix 1859,429,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0144 begin`);
      logInfo("page/swipe matrix 1859,429,300,2,false,2");
      const actual: string = flingDistance(1859) + '|' + fpsFromFrames(429, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1859|1430|pages/Index|||back|Error");
      expect(actual).assertEqual("1859|1430|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0145
     * @tc.name      Perf_PageSwipeMatrix_0145
     * @tc.desc      page/swipe matrix 1872,432,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0145 begin`);
      logInfo("page/swipe matrix 1872,432,400,0,true,0");
      const actual: string = flingDistance(1872) + '|' + fpsFromFrames(432, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1872|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1872|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0146
     * @tc.name      Perf_PageSwipeMatrix_0146
     * @tc.desc      page/swipe matrix 1885,435,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0146 begin`);
      logInfo("page/swipe matrix 1885,435,500,1,false,1");
      const actual: string = flingDistance(1885) + '|' + fpsFromFrames(435, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1885|870|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1885|870|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0147
     * @tc.name      Perf_PageSwipeMatrix_0147
     * @tc.desc      page/swipe matrix 1898,438,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0147 begin`);
      logInfo("page/swipe matrix 1898,438,600,2,true,2");
      const actual: string = flingDistance(1898) + '|' + fpsFromFrames(438, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1898|730|pages/Index|||back|Pass");
      expect(actual).assertEqual("1898|730|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0148
     * @tc.name      Perf_PageSwipeMatrix_0148
     * @tc.desc      page/swipe matrix 1911,441,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0148 begin`);
      logInfo("page/swipe matrix 1911,441,700,0,false,0");
      const actual: string = flingDistance(1911) + '|' + fpsFromFrames(441, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1911|630|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1911|630|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0149
     * @tc.name      Perf_PageSwipeMatrix_0149
     * @tc.desc      page/swipe matrix 1924,444,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0149 begin`);
      logInfo("page/swipe matrix 1924,444,800,1,true,1");
      const actual: string = flingDistance(1924) + '|' + fpsFromFrames(444, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1924|555|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("1924|555|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0150
     * @tc.name      Perf_PageSwipeMatrix_0150
     * @tc.desc      page/swipe matrix 1937,447,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0150 begin`);
      logInfo("page/swipe matrix 1937,447,900,2,false,2");
      const actual: string = flingDistance(1937) + '|' + fpsFromFrames(447, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1937|496.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("1937|496.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0151
     * @tc.name      Perf_PageSwipeMatrix_0151
     * @tc.desc      page/swipe matrix 1950,450,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0151 begin`);
      logInfo("page/swipe matrix 1950,450,0,0,true,0");
      const actual: string = flingDistance(1950) + '|' + fpsFromFrames(450, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1950|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("1950|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0152
     * @tc.name      Perf_PageSwipeMatrix_0152
     * @tc.desc      page/swipe matrix 1963,453,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0152 begin`);
      logInfo("page/swipe matrix 1963,453,100,1,false,1");
      const actual: string = flingDistance(1963) + '|' + fpsFromFrames(453, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1963|4530|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("1963|4530|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0153
     * @tc.name      Perf_PageSwipeMatrix_0153
     * @tc.desc      page/swipe matrix 1976,456,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0153 begin`);
      logInfo("page/swipe matrix 1976,456,200,2,true,2");
      const actual: string = flingDistance(1976) + '|' + fpsFromFrames(456, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1976|2280|pages/Index|||back|Pass");
      expect(actual).assertEqual("1976|2280|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0154
     * @tc.name      Perf_PageSwipeMatrix_0154
     * @tc.desc      page/swipe matrix 1989,459,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0154 begin`);
      logInfo("page/swipe matrix 1989,459,300,0,false,0");
      const actual: string = flingDistance(1989) + '|' + fpsFromFrames(459, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1989|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("1989|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0155
     * @tc.name      Perf_PageSwipeMatrix_0155
     * @tc.desc      page/swipe matrix 2002,462,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0155 begin`);
      logInfo("page/swipe matrix 2002,462,400,1,true,1");
      const actual: string = flingDistance(2002) + '|' + fpsFromFrames(462, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2002|1155|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2002|1155|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0156
     * @tc.name      Perf_PageSwipeMatrix_0156
     * @tc.desc      page/swipe matrix 2015,465,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0156 begin`);
      logInfo("page/swipe matrix 2015,465,500,2,false,2");
      const actual: string = flingDistance(2015) + '|' + fpsFromFrames(465, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2015|930|pages/Index|||back|Error");
      expect(actual).assertEqual("2015|930|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0157
     * @tc.name      Perf_PageSwipeMatrix_0157
     * @tc.desc      page/swipe matrix 2028,468,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0157 begin`);
      logInfo("page/swipe matrix 2028,468,600,0,true,0");
      const actual: string = flingDistance(2028) + '|' + fpsFromFrames(468, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2028|780|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2028|780|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0158
     * @tc.name      Perf_PageSwipeMatrix_0158
     * @tc.desc      page/swipe matrix 2041,471,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0158 begin`);
      logInfo("page/swipe matrix 2041,471,700,1,false,1");
      const actual: string = flingDistance(2041) + '|' + fpsFromFrames(471, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2041|672.857143|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2041|672.857143|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0159
     * @tc.name      Perf_PageSwipeMatrix_0159
     * @tc.desc      page/swipe matrix 2054,474,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0159 begin`);
      logInfo("page/swipe matrix 2054,474,800,2,true,2");
      const actual: string = flingDistance(2054) + '|' + fpsFromFrames(474, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2054|592.5|pages/Index|||back|Pass");
      expect(actual).assertEqual("2054|592.5|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0160
     * @tc.name      Perf_PageSwipeMatrix_0160
     * @tc.desc      page/swipe matrix 2067,477,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0160 begin`);
      logInfo("page/swipe matrix 2067,477,900,0,false,0");
      const actual: string = flingDistance(2067) + '|' + fpsFromFrames(477, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2067|530|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2067|530|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0161
     * @tc.name      Perf_PageSwipeMatrix_0161
     * @tc.desc      page/swipe matrix 2080,480,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0161 begin`);
      logInfo("page/swipe matrix 2080,480,0,1,true,1");
      const actual: string = flingDistance(2080) + '|' + fpsFromFrames(480, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2080|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2080|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0162
     * @tc.name      Perf_PageSwipeMatrix_0162
     * @tc.desc      page/swipe matrix 2093,483,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0162 begin`);
      logInfo("page/swipe matrix 2093,483,100,2,false,2");
      const actual: string = flingDistance(2093) + '|' + fpsFromFrames(483, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2093|4830|pages/Index|||back|Error");
      expect(actual).assertEqual("2093|4830|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0163
     * @tc.name      Perf_PageSwipeMatrix_0163
     * @tc.desc      page/swipe matrix 2106,486,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0163 begin`);
      logInfo("page/swipe matrix 2106,486,200,0,true,0");
      const actual: string = flingDistance(2106) + '|' + fpsFromFrames(486, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2106|2430|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2106|2430|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0164
     * @tc.name      Perf_PageSwipeMatrix_0164
     * @tc.desc      page/swipe matrix 2119,489,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0164 begin`);
      logInfo("page/swipe matrix 2119,489,300,1,false,1");
      const actual: string = flingDistance(2119) + '|' + fpsFromFrames(489, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2119|1630|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2119|1630|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0165
     * @tc.name      Perf_PageSwipeMatrix_0165
     * @tc.desc      page/swipe matrix 2132,492,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0165 begin`);
      logInfo("page/swipe matrix 2132,492,400,2,true,2");
      const actual: string = flingDistance(2132) + '|' + fpsFromFrames(492, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2132|1230|pages/Index|||back|Pass");
      expect(actual).assertEqual("2132|1230|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0166
     * @tc.name      Perf_PageSwipeMatrix_0166
     * @tc.desc      page/swipe matrix 2145,495,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0166 begin`);
      logInfo("page/swipe matrix 2145,495,500,0,false,0");
      const actual: string = flingDistance(2145) + '|' + fpsFromFrames(495, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2145|990|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2145|990|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0167
     * @tc.name      Perf_PageSwipeMatrix_0167
     * @tc.desc      page/swipe matrix 2158,498,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0167 begin`);
      logInfo("page/swipe matrix 2158,498,600,1,true,1");
      const actual: string = flingDistance(2158) + '|' + fpsFromFrames(498, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2158|830|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2158|830|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0168
     * @tc.name      Perf_PageSwipeMatrix_0168
     * @tc.desc      page/swipe matrix 2171,501,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0168 begin`);
      logInfo("page/swipe matrix 2171,501,700,2,false,2");
      const actual: string = flingDistance(2171) + '|' + fpsFromFrames(501, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2171|715.714286|pages/Index|||back|Error");
      expect(actual).assertEqual("2171|715.714286|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0169
     * @tc.name      Perf_PageSwipeMatrix_0169
     * @tc.desc      page/swipe matrix 2184,504,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0169 begin`);
      logInfo("page/swipe matrix 2184,504,800,0,true,0");
      const actual: string = flingDistance(2184) + '|' + fpsFromFrames(504, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2184|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2184|630|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0170
     * @tc.name      Perf_PageSwipeMatrix_0170
     * @tc.desc      page/swipe matrix 2197,507,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0170 begin`);
      logInfo("page/swipe matrix 2197,507,900,1,false,1");
      const actual: string = flingDistance(2197) + '|' + fpsFromFrames(507, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2197|563.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2197|563.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0171
     * @tc.name      Perf_PageSwipeMatrix_0171
     * @tc.desc      page/swipe matrix 2210,510,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0171 begin`);
      logInfo("page/swipe matrix 2210,510,0,2,true,2");
      const actual: string = flingDistance(2210) + '|' + fpsFromFrames(510, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2210|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("2210|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0172
     * @tc.name      Perf_PageSwipeMatrix_0172
     * @tc.desc      page/swipe matrix 2223,513,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0172 begin`);
      logInfo("page/swipe matrix 2223,513,100,0,false,0");
      const actual: string = flingDistance(2223) + '|' + fpsFromFrames(513, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2223|5130|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2223|5130|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0173
     * @tc.name      Perf_PageSwipeMatrix_0173
     * @tc.desc      page/swipe matrix 2236,516,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0173 begin`);
      logInfo("page/swipe matrix 2236,516,200,1,true,1");
      const actual: string = flingDistance(2236) + '|' + fpsFromFrames(516, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2236|2580|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2236|2580|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0174
     * @tc.name      Perf_PageSwipeMatrix_0174
     * @tc.desc      page/swipe matrix 2249,519,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0174 begin`);
      logInfo("page/swipe matrix 2249,519,300,2,false,2");
      const actual: string = flingDistance(2249) + '|' + fpsFromFrames(519, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2249|1730|pages/Index|||back|Error");
      expect(actual).assertEqual("2249|1730|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0175
     * @tc.name      Perf_PageSwipeMatrix_0175
     * @tc.desc      page/swipe matrix 2262,522,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0175 begin`);
      logInfo("page/swipe matrix 2262,522,400,0,true,0");
      const actual: string = flingDistance(2262) + '|' + fpsFromFrames(522, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2262|1305|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2262|1305|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0176
     * @tc.name      Perf_PageSwipeMatrix_0176
     * @tc.desc      page/swipe matrix 2275,525,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0176 begin`);
      logInfo("page/swipe matrix 2275,525,500,1,false,1");
      const actual: string = flingDistance(2275) + '|' + fpsFromFrames(525, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2275|1050|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2275|1050|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0177
     * @tc.name      Perf_PageSwipeMatrix_0177
     * @tc.desc      page/swipe matrix 2288,528,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0177 begin`);
      logInfo("page/swipe matrix 2288,528,600,2,true,2");
      const actual: string = flingDistance(2288) + '|' + fpsFromFrames(528, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2288|880|pages/Index|||back|Pass");
      expect(actual).assertEqual("2288|880|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0178
     * @tc.name      Perf_PageSwipeMatrix_0178
     * @tc.desc      page/swipe matrix 2301,531,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0178 begin`);
      logInfo("page/swipe matrix 2301,531,700,0,false,0");
      const actual: string = flingDistance(2301) + '|' + fpsFromFrames(531, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2301|758.571429|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2301|758.571429|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0179
     * @tc.name      Perf_PageSwipeMatrix_0179
     * @tc.desc      page/swipe matrix 2314,534,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0179 begin`);
      logInfo("page/swipe matrix 2314,534,800,1,true,1");
      const actual: string = flingDistance(2314) + '|' + fpsFromFrames(534, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2314|667.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2314|667.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0180
     * @tc.name      Perf_PageSwipeMatrix_0180
     * @tc.desc      page/swipe matrix 2327,537,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0180 begin`);
      logInfo("page/swipe matrix 2327,537,900,2,false,2");
      const actual: string = flingDistance(2327) + '|' + fpsFromFrames(537, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2327|596.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("2327|596.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0181
     * @tc.name      Perf_PageSwipeMatrix_0181
     * @tc.desc      page/swipe matrix 2340,540,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0181 begin`);
      logInfo("page/swipe matrix 2340,540,0,0,true,0");
      const actual: string = flingDistance(2340) + '|' + fpsFromFrames(540, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2340|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2340|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0182
     * @tc.name      Perf_PageSwipeMatrix_0182
     * @tc.desc      page/swipe matrix 2353,543,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0182 begin`);
      logInfo("page/swipe matrix 2353,543,100,1,false,1");
      const actual: string = flingDistance(2353) + '|' + fpsFromFrames(543, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2353|5430|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2353|5430|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0183
     * @tc.name      Perf_PageSwipeMatrix_0183
     * @tc.desc      page/swipe matrix 2366,546,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0183 begin`);
      logInfo("page/swipe matrix 2366,546,200,2,true,2");
      const actual: string = flingDistance(2366) + '|' + fpsFromFrames(546, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2366|2730|pages/Index|||back|Pass");
      expect(actual).assertEqual("2366|2730|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0184
     * @tc.name      Perf_PageSwipeMatrix_0184
     * @tc.desc      page/swipe matrix 2379,549,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0184 begin`);
      logInfo("page/swipe matrix 2379,549,300,0,false,0");
      const actual: string = flingDistance(2379) + '|' + fpsFromFrames(549, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2379|1830|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2379|1830|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0185
     * @tc.name      Perf_PageSwipeMatrix_0185
     * @tc.desc      page/swipe matrix 2392,552,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0185 begin`);
      logInfo("page/swipe matrix 2392,552,400,1,true,1");
      const actual: string = flingDistance(2392) + '|' + fpsFromFrames(552, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2392|1380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2392|1380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0186
     * @tc.name      Perf_PageSwipeMatrix_0186
     * @tc.desc      page/swipe matrix 2405,555,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0186 begin`);
      logInfo("page/swipe matrix 2405,555,500,2,false,2");
      const actual: string = flingDistance(2405) + '|' + fpsFromFrames(555, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2405|1110|pages/Index|||back|Error");
      expect(actual).assertEqual("2405|1110|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0187
     * @tc.name      Perf_PageSwipeMatrix_0187
     * @tc.desc      page/swipe matrix 2418,558,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0187 begin`);
      logInfo("page/swipe matrix 2418,558,600,0,true,0");
      const actual: string = flingDistance(2418) + '|' + fpsFromFrames(558, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2418|930|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2418|930|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0188
     * @tc.name      Perf_PageSwipeMatrix_0188
     * @tc.desc      page/swipe matrix 2431,561,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0188 begin`);
      logInfo("page/swipe matrix 2431,561,700,1,false,1");
      const actual: string = flingDistance(2431) + '|' + fpsFromFrames(561, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2431|801.428571|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2431|801.428571|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0189
     * @tc.name      Perf_PageSwipeMatrix_0189
     * @tc.desc      page/swipe matrix 2444,564,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0189 begin`);
      logInfo("page/swipe matrix 2444,564,800,2,true,2");
      const actual: string = flingDistance(2444) + '|' + fpsFromFrames(564, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2444|705|pages/Index|||back|Pass");
      expect(actual).assertEqual("2444|705|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0190
     * @tc.name      Perf_PageSwipeMatrix_0190
     * @tc.desc      page/swipe matrix 2457,567,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0190 begin`);
      logInfo("page/swipe matrix 2457,567,900,0,false,0");
      const actual: string = flingDistance(2457) + '|' + fpsFromFrames(567, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2457|630|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2457|630|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0191
     * @tc.name      Perf_PageSwipeMatrix_0191
     * @tc.desc      page/swipe matrix 2470,570,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0191 begin`);
      logInfo("page/swipe matrix 2470,570,0,1,true,1");
      const actual: string = flingDistance(2470) + '|' + fpsFromFrames(570, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2470|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2470|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0192
     * @tc.name      Perf_PageSwipeMatrix_0192
     * @tc.desc      page/swipe matrix 2483,573,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0192 begin`);
      logInfo("page/swipe matrix 2483,573,100,2,false,2");
      const actual: string = flingDistance(2483) + '|' + fpsFromFrames(573, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2483|5730|pages/Index|||back|Error");
      expect(actual).assertEqual("2483|5730|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0193
     * @tc.name      Perf_PageSwipeMatrix_0193
     * @tc.desc      page/swipe matrix 2496,576,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0193 begin`);
      logInfo("page/swipe matrix 2496,576,200,0,true,0");
      const actual: string = flingDistance(2496) + '|' + fpsFromFrames(576, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2496|2880|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2496|2880|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0194
     * @tc.name      Perf_PageSwipeMatrix_0194
     * @tc.desc      page/swipe matrix 2509,579,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0194 begin`);
      logInfo("page/swipe matrix 2509,579,300,1,false,1");
      const actual: string = flingDistance(2509) + '|' + fpsFromFrames(579, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2509|1930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2509|1930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0195
     * @tc.name      Perf_PageSwipeMatrix_0195
     * @tc.desc      page/swipe matrix 2522,582,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0195 begin`);
      logInfo("page/swipe matrix 2522,582,400,2,true,2");
      const actual: string = flingDistance(2522) + '|' + fpsFromFrames(582, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2522|1455|pages/Index|||back|Pass");
      expect(actual).assertEqual("2522|1455|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0196
     * @tc.name      Perf_PageSwipeMatrix_0196
     * @tc.desc      page/swipe matrix 2535,585,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0196 begin`);
      logInfo("page/swipe matrix 2535,585,500,0,false,0");
      const actual: string = flingDistance(2535) + '|' + fpsFromFrames(585, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2535|1170|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2535|1170|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0197
     * @tc.name      Perf_PageSwipeMatrix_0197
     * @tc.desc      page/swipe matrix 2548,588,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0197 begin`);
      logInfo("page/swipe matrix 2548,588,600,1,true,1");
      const actual: string = flingDistance(2548) + '|' + fpsFromFrames(588, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2548|980|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2548|980|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0198
     * @tc.name      Perf_PageSwipeMatrix_0198
     * @tc.desc      page/swipe matrix 2561,591,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0198 begin`);
      logInfo("page/swipe matrix 2561,591,700,2,false,2");
      const actual: string = flingDistance(2561) + '|' + fpsFromFrames(591, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2561|844.285714|pages/Index|||back|Error");
      expect(actual).assertEqual("2561|844.285714|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0199
     * @tc.name      Perf_PageSwipeMatrix_0199
     * @tc.desc      page/swipe matrix 2574,594,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0199 begin`);
      logInfo("page/swipe matrix 2574,594,800,0,true,0");
      const actual: string = flingDistance(2574) + '|' + fpsFromFrames(594, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2574|742.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2574|742.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0200
     * @tc.name      Perf_PageSwipeMatrix_0200
     * @tc.desc      page/swipe matrix 2587,597,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0200 begin`);
      logInfo("page/swipe matrix 2587,597,900,1,false,1");
      const actual: string = flingDistance(2587) + '|' + fpsFromFrames(597, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2587|663.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2587|663.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0201
     * @tc.name      Perf_PageSwipeMatrix_0201
     * @tc.desc      page/swipe matrix 2600,600,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0201 begin`);
      logInfo("page/swipe matrix 2600,600,0,2,true,2");
      const actual: string = flingDistance(2600) + '|' + fpsFromFrames(600, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2600|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("2600|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0202
     * @tc.name      Perf_PageSwipeMatrix_0202
     * @tc.desc      page/swipe matrix 2613,603,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0202 begin`);
      logInfo("page/swipe matrix 2613,603,100,0,false,0");
      const actual: string = flingDistance(2613) + '|' + fpsFromFrames(603, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2613|6030|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2613|6030|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0203
     * @tc.name      Perf_PageSwipeMatrix_0203
     * @tc.desc      page/swipe matrix 2626,606,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0203 begin`);
      logInfo("page/swipe matrix 2626,606,200,1,true,1");
      const actual: string = flingDistance(2626) + '|' + fpsFromFrames(606, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2626|3030|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2626|3030|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0204
     * @tc.name      Perf_PageSwipeMatrix_0204
     * @tc.desc      page/swipe matrix 2639,609,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0204 begin`);
      logInfo("page/swipe matrix 2639,609,300,2,false,2");
      const actual: string = flingDistance(2639) + '|' + fpsFromFrames(609, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2639|2030|pages/Index|||back|Error");
      expect(actual).assertEqual("2639|2030|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0205
     * @tc.name      Perf_PageSwipeMatrix_0205
     * @tc.desc      page/swipe matrix 2652,612,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0205 begin`);
      logInfo("page/swipe matrix 2652,612,400,0,true,0");
      const actual: string = flingDistance(2652) + '|' + fpsFromFrames(612, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2652|1530|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2652|1530|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0206
     * @tc.name      Perf_PageSwipeMatrix_0206
     * @tc.desc      page/swipe matrix 2665,615,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0206 begin`);
      logInfo("page/swipe matrix 2665,615,500,1,false,1");
      const actual: string = flingDistance(2665) + '|' + fpsFromFrames(615, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2665|1230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2665|1230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0207
     * @tc.name      Perf_PageSwipeMatrix_0207
     * @tc.desc      page/swipe matrix 2678,618,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0207 begin`);
      logInfo("page/swipe matrix 2678,618,600,2,true,2");
      const actual: string = flingDistance(2678) + '|' + fpsFromFrames(618, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2678|1030|pages/Index|||back|Pass");
      expect(actual).assertEqual("2678|1030|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0208
     * @tc.name      Perf_PageSwipeMatrix_0208
     * @tc.desc      page/swipe matrix 2691,621,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0208 begin`);
      logInfo("page/swipe matrix 2691,621,700,0,false,0");
      const actual: string = flingDistance(2691) + '|' + fpsFromFrames(621, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2691|887.142857|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2691|887.142857|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0209
     * @tc.name      Perf_PageSwipeMatrix_0209
     * @tc.desc      page/swipe matrix 2704,624,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0209 begin`);
      logInfo("page/swipe matrix 2704,624,800,1,true,1");
      const actual: string = flingDistance(2704) + '|' + fpsFromFrames(624, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2704|780|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2704|780|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0210
     * @tc.name      Perf_PageSwipeMatrix_0210
     * @tc.desc      page/swipe matrix 2717,627,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0210 begin`);
      logInfo("page/swipe matrix 2717,627,900,2,false,2");
      const actual: string = flingDistance(2717) + '|' + fpsFromFrames(627, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2717|696.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("2717|696.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0211
     * @tc.name      Perf_PageSwipeMatrix_0211
     * @tc.desc      page/swipe matrix 2730,630,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0211 begin`);
      logInfo("page/swipe matrix 2730,630,0,0,true,0");
      const actual: string = flingDistance(2730) + '|' + fpsFromFrames(630, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2730|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2730|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0212
     * @tc.name      Perf_PageSwipeMatrix_0212
     * @tc.desc      page/swipe matrix 2743,633,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0212 begin`);
      logInfo("page/swipe matrix 2743,633,100,1,false,1");
      const actual: string = flingDistance(2743) + '|' + fpsFromFrames(633, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2743|6330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2743|6330|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0213
     * @tc.name      Perf_PageSwipeMatrix_0213
     * @tc.desc      page/swipe matrix 2756,636,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0213 begin`);
      logInfo("page/swipe matrix 2756,636,200,2,true,2");
      const actual: string = flingDistance(2756) + '|' + fpsFromFrames(636, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2756|3180|pages/Index|||back|Pass");
      expect(actual).assertEqual("2756|3180|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0214
     * @tc.name      Perf_PageSwipeMatrix_0214
     * @tc.desc      page/swipe matrix 2769,639,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0214 begin`);
      logInfo("page/swipe matrix 2769,639,300,0,false,0");
      const actual: string = flingDistance(2769) + '|' + fpsFromFrames(639, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2769|2130|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2769|2130|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0215
     * @tc.name      Perf_PageSwipeMatrix_0215
     * @tc.desc      page/swipe matrix 2782,642,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0215 begin`);
      logInfo("page/swipe matrix 2782,642,400,1,true,1");
      const actual: string = flingDistance(2782) + '|' + fpsFromFrames(642, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2782|1605|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2782|1605|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0216
     * @tc.name      Perf_PageSwipeMatrix_0216
     * @tc.desc      page/swipe matrix 2795,645,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0216 begin`);
      logInfo("page/swipe matrix 2795,645,500,2,false,2");
      const actual: string = flingDistance(2795) + '|' + fpsFromFrames(645, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2795|1290|pages/Index|||back|Error");
      expect(actual).assertEqual("2795|1290|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0217
     * @tc.name      Perf_PageSwipeMatrix_0217
     * @tc.desc      page/swipe matrix 2808,648,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0217 begin`);
      logInfo("page/swipe matrix 2808,648,600,0,true,0");
      const actual: string = flingDistance(2808) + '|' + fpsFromFrames(648, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2808|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2808|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0218
     * @tc.name      Perf_PageSwipeMatrix_0218
     * @tc.desc      page/swipe matrix 2821,651,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0218 begin`);
      logInfo("page/swipe matrix 2821,651,700,1,false,1");
      const actual: string = flingDistance(2821) + '|' + fpsFromFrames(651, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2821|930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2821|930|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0219
     * @tc.name      Perf_PageSwipeMatrix_0219
     * @tc.desc      page/swipe matrix 2834,654,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0219 begin`);
      logInfo("page/swipe matrix 2834,654,800,2,true,2");
      const actual: string = flingDistance(2834) + '|' + fpsFromFrames(654, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2834|817.5|pages/Index|||back|Pass");
      expect(actual).assertEqual("2834|817.5|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0220
     * @tc.name      Perf_PageSwipeMatrix_0220
     * @tc.desc      page/swipe matrix 2847,657,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0220 begin`);
      logInfo("page/swipe matrix 2847,657,900,0,false,0");
      const actual: string = flingDistance(2847) + '|' + fpsFromFrames(657, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2847|730|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2847|730|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0221
     * @tc.name      Perf_PageSwipeMatrix_0221
     * @tc.desc      page/swipe matrix 2860,660,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0221 begin`);
      logInfo("page/swipe matrix 2860,660,0,1,true,1");
      const actual: string = flingDistance(2860) + '|' + fpsFromFrames(660, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2860|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2860|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0222
     * @tc.name      Perf_PageSwipeMatrix_0222
     * @tc.desc      page/swipe matrix 2873,663,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0222 begin`);
      logInfo("page/swipe matrix 2873,663,100,2,false,2");
      const actual: string = flingDistance(2873) + '|' + fpsFromFrames(663, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2873|6630|pages/Index|||back|Error");
      expect(actual).assertEqual("2873|6630|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0223
     * @tc.name      Perf_PageSwipeMatrix_0223
     * @tc.desc      page/swipe matrix 2886,666,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0223 begin`);
      logInfo("page/swipe matrix 2886,666,200,0,true,0");
      const actual: string = flingDistance(2886) + '|' + fpsFromFrames(666, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2886|3330|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2886|3330|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0224
     * @tc.name      Perf_PageSwipeMatrix_0224
     * @tc.desc      page/swipe matrix 2899,669,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0224 begin`);
      logInfo("page/swipe matrix 2899,669,300,1,false,1");
      const actual: string = flingDistance(2899) + '|' + fpsFromFrames(669, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2899|2230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2899|2230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0225
     * @tc.name      Perf_PageSwipeMatrix_0225
     * @tc.desc      page/swipe matrix 2912,672,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0225 begin`);
      logInfo("page/swipe matrix 2912,672,400,2,true,2");
      const actual: string = flingDistance(2912) + '|' + fpsFromFrames(672, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2912|1680|pages/Index|||back|Pass");
      expect(actual).assertEqual("2912|1680|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0226
     * @tc.name      Perf_PageSwipeMatrix_0226
     * @tc.desc      page/swipe matrix 2925,675,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0226 begin`);
      logInfo("page/swipe matrix 2925,675,500,0,false,0");
      const actual: string = flingDistance(2925) + '|' + fpsFromFrames(675, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2925|1350|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("2925|1350|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0227
     * @tc.name      Perf_PageSwipeMatrix_0227
     * @tc.desc      page/swipe matrix 2938,678,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0227 begin`);
      logInfo("page/swipe matrix 2938,678,600,1,true,1");
      const actual: string = flingDistance(2938) + '|' + fpsFromFrames(678, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2938|1130|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("2938|1130|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0228
     * @tc.name      Perf_PageSwipeMatrix_0228
     * @tc.desc      page/swipe matrix 2951,681,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0228 begin`);
      logInfo("page/swipe matrix 2951,681,700,2,false,2");
      const actual: string = flingDistance(2951) + '|' + fpsFromFrames(681, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2951|972.857143|pages/Index|||back|Error");
      expect(actual).assertEqual("2951|972.857143|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0229
     * @tc.name      Perf_PageSwipeMatrix_0229
     * @tc.desc      page/swipe matrix 2964,684,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0229 begin`);
      logInfo("page/swipe matrix 2964,684,800,0,true,0");
      const actual: string = flingDistance(2964) + '|' + fpsFromFrames(684, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2964|855|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("2964|855|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0230
     * @tc.name      Perf_PageSwipeMatrix_0230
     * @tc.desc      page/swipe matrix 2977,687,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0230 begin`);
      logInfo("page/swipe matrix 2977,687,900,1,false,1");
      const actual: string = flingDistance(2977) + '|' + fpsFromFrames(687, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "2977|763.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("2977|763.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0231
     * @tc.name      Perf_PageSwipeMatrix_0231
     * @tc.desc      page/swipe matrix 2990,690,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0231 begin`);
      logInfo("page/swipe matrix 2990,690,0,2,true,2");
      const actual: string = flingDistance(2990) + '|' + fpsFromFrames(690, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "2990|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("2990|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0232
     * @tc.name      Perf_PageSwipeMatrix_0232
     * @tc.desc      page/swipe matrix 3003,693,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0232 begin`);
      logInfo("page/swipe matrix 3003,693,100,0,false,0");
      const actual: string = flingDistance(3003) + '|' + fpsFromFrames(693, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3003|6930|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3003|6930|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0233
     * @tc.name      Perf_PageSwipeMatrix_0233
     * @tc.desc      page/swipe matrix 3016,696,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0233 begin`);
      logInfo("page/swipe matrix 3016,696,200,1,true,1");
      const actual: string = flingDistance(3016) + '|' + fpsFromFrames(696, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3016|3480|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3016|3480|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0234
     * @tc.name      Perf_PageSwipeMatrix_0234
     * @tc.desc      page/swipe matrix 3029,699,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0234 begin`);
      logInfo("page/swipe matrix 3029,699,300,2,false,2");
      const actual: string = flingDistance(3029) + '|' + fpsFromFrames(699, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3029|2330|pages/Index|||back|Error");
      expect(actual).assertEqual("3029|2330|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0235
     * @tc.name      Perf_PageSwipeMatrix_0235
     * @tc.desc      page/swipe matrix 3042,702,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0235 begin`);
      logInfo("page/swipe matrix 3042,702,400,0,true,0");
      const actual: string = flingDistance(3042) + '|' + fpsFromFrames(702, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3042|1755|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3042|1755|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0236
     * @tc.name      Perf_PageSwipeMatrix_0236
     * @tc.desc      page/swipe matrix 3055,705,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0236 begin`);
      logInfo("page/swipe matrix 3055,705,500,1,false,1");
      const actual: string = flingDistance(3055) + '|' + fpsFromFrames(705, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3055|1410|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3055|1410|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0237
     * @tc.name      Perf_PageSwipeMatrix_0237
     * @tc.desc      page/swipe matrix 3068,708,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0237 begin`);
      logInfo("page/swipe matrix 3068,708,600,2,true,2");
      const actual: string = flingDistance(3068) + '|' + fpsFromFrames(708, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3068|1180|pages/Index|||back|Pass");
      expect(actual).assertEqual("3068|1180|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0238
     * @tc.name      Perf_PageSwipeMatrix_0238
     * @tc.desc      page/swipe matrix 3081,711,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0238 begin`);
      logInfo("page/swipe matrix 3081,711,700,0,false,0");
      const actual: string = flingDistance(3081) + '|' + fpsFromFrames(711, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3081|1015.714286|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3081|1015.714286|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0239
     * @tc.name      Perf_PageSwipeMatrix_0239
     * @tc.desc      page/swipe matrix 3094,714,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0239 begin`);
      logInfo("page/swipe matrix 3094,714,800,1,true,1");
      const actual: string = flingDistance(3094) + '|' + fpsFromFrames(714, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3094|892.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3094|892.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0240
     * @tc.name      Perf_PageSwipeMatrix_0240
     * @tc.desc      page/swipe matrix 3107,717,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0240 begin`);
      logInfo("page/swipe matrix 3107,717,900,2,false,2");
      const actual: string = flingDistance(3107) + '|' + fpsFromFrames(717, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3107|796.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("3107|796.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0241
     * @tc.name      Perf_PageSwipeMatrix_0241
     * @tc.desc      page/swipe matrix 3120,720,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0241 begin`);
      logInfo("page/swipe matrix 3120,720,0,0,true,0");
      const actual: string = flingDistance(3120) + '|' + fpsFromFrames(720, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3120|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3120|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0242
     * @tc.name      Perf_PageSwipeMatrix_0242
     * @tc.desc      page/swipe matrix 3133,723,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0242 begin`);
      logInfo("page/swipe matrix 3133,723,100,1,false,1");
      const actual: string = flingDistance(3133) + '|' + fpsFromFrames(723, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3133|7230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3133|7230|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0243
     * @tc.name      Perf_PageSwipeMatrix_0243
     * @tc.desc      page/swipe matrix 3146,726,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0243 begin`);
      logInfo("page/swipe matrix 3146,726,200,2,true,2");
      const actual: string = flingDistance(3146) + '|' + fpsFromFrames(726, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3146|3630|pages/Index|||back|Pass");
      expect(actual).assertEqual("3146|3630|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0244
     * @tc.name      Perf_PageSwipeMatrix_0244
     * @tc.desc      page/swipe matrix 3159,729,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0244 begin`);
      logInfo("page/swipe matrix 3159,729,300,0,false,0");
      const actual: string = flingDistance(3159) + '|' + fpsFromFrames(729, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3159|2430|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3159|2430|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0245
     * @tc.name      Perf_PageSwipeMatrix_0245
     * @tc.desc      page/swipe matrix 3172,732,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0245 begin`);
      logInfo("page/swipe matrix 3172,732,400,1,true,1");
      const actual: string = flingDistance(3172) + '|' + fpsFromFrames(732, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3172|1830|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3172|1830|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0246
     * @tc.name      Perf_PageSwipeMatrix_0246
     * @tc.desc      page/swipe matrix 3185,735,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0246 begin`);
      logInfo("page/swipe matrix 3185,735,500,2,false,2");
      const actual: string = flingDistance(3185) + '|' + fpsFromFrames(735, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3185|1470|pages/Index|||back|Error");
      expect(actual).assertEqual("3185|1470|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0247
     * @tc.name      Perf_PageSwipeMatrix_0247
     * @tc.desc      page/swipe matrix 3198,738,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0247 begin`);
      logInfo("page/swipe matrix 3198,738,600,0,true,0");
      const actual: string = flingDistance(3198) + '|' + fpsFromFrames(738, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3198|1230|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3198|1230|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0248
     * @tc.name      Perf_PageSwipeMatrix_0248
     * @tc.desc      page/swipe matrix 3211,741,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0248 begin`);
      logInfo("page/swipe matrix 3211,741,700,1,false,1");
      const actual: string = flingDistance(3211) + '|' + fpsFromFrames(741, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3211|1058.571429|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3211|1058.571429|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0249
     * @tc.name      Perf_PageSwipeMatrix_0249
     * @tc.desc      page/swipe matrix 3224,744,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0249 begin`);
      logInfo("page/swipe matrix 3224,744,800,2,true,2");
      const actual: string = flingDistance(3224) + '|' + fpsFromFrames(744, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3224|930|pages/Index|||back|Pass");
      expect(actual).assertEqual("3224|930|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0250
     * @tc.name      Perf_PageSwipeMatrix_0250
     * @tc.desc      page/swipe matrix 3237,747,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0250 begin`);
      logInfo("page/swipe matrix 3237,747,900,0,false,0");
      const actual: string = flingDistance(3237) + '|' + fpsFromFrames(747, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3237|830|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3237|830|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0251
     * @tc.name      Perf_PageSwipeMatrix_0251
     * @tc.desc      page/swipe matrix 3250,750,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0251 begin`);
      logInfo("page/swipe matrix 3250,750,0,1,true,1");
      const actual: string = flingDistance(3250) + '|' + fpsFromFrames(750, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3250|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3250|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0252
     * @tc.name      Perf_PageSwipeMatrix_0252
     * @tc.desc      page/swipe matrix 3263,753,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0252 begin`);
      logInfo("page/swipe matrix 3263,753,100,2,false,2");
      const actual: string = flingDistance(3263) + '|' + fpsFromFrames(753, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3263|7530|pages/Index|||back|Error");
      expect(actual).assertEqual("3263|7530|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0253
     * @tc.name      Perf_PageSwipeMatrix_0253
     * @tc.desc      page/swipe matrix 3276,756,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0253 begin`);
      logInfo("page/swipe matrix 3276,756,200,0,true,0");
      const actual: string = flingDistance(3276) + '|' + fpsFromFrames(756, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3276|3780|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3276|3780|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0254
     * @tc.name      Perf_PageSwipeMatrix_0254
     * @tc.desc      page/swipe matrix 3289,759,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0254 begin`);
      logInfo("page/swipe matrix 3289,759,300,1,false,1");
      const actual: string = flingDistance(3289) + '|' + fpsFromFrames(759, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3289|2530|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3289|2530|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0255
     * @tc.name      Perf_PageSwipeMatrix_0255
     * @tc.desc      page/swipe matrix 3302,762,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0255 begin`);
      logInfo("page/swipe matrix 3302,762,400,2,true,2");
      const actual: string = flingDistance(3302) + '|' + fpsFromFrames(762, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3302|1905|pages/Index|||back|Pass");
      expect(actual).assertEqual("3302|1905|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0256
     * @tc.name      Perf_PageSwipeMatrix_0256
     * @tc.desc      page/swipe matrix 3315,765,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0256 begin`);
      logInfo("page/swipe matrix 3315,765,500,0,false,0");
      const actual: string = flingDistance(3315) + '|' + fpsFromFrames(765, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3315|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3315|1530|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0257
     * @tc.name      Perf_PageSwipeMatrix_0257
     * @tc.desc      page/swipe matrix 3328,768,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0257 begin`);
      logInfo("page/swipe matrix 3328,768,600,1,true,1");
      const actual: string = flingDistance(3328) + '|' + fpsFromFrames(768, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3328|1280|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3328|1280|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0258
     * @tc.name      Perf_PageSwipeMatrix_0258
     * @tc.desc      page/swipe matrix 3341,771,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0258 begin`);
      logInfo("page/swipe matrix 3341,771,700,2,false,2");
      const actual: string = flingDistance(3341) + '|' + fpsFromFrames(771, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3341|1101.428571|pages/Index|||back|Error");
      expect(actual).assertEqual("3341|1101.428571|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0259
     * @tc.name      Perf_PageSwipeMatrix_0259
     * @tc.desc      page/swipe matrix 3354,774,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0259 begin`);
      logInfo("page/swipe matrix 3354,774,800,0,true,0");
      const actual: string = flingDistance(3354) + '|' + fpsFromFrames(774, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3354|967.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3354|967.5|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0260
     * @tc.name      Perf_PageSwipeMatrix_0260
     * @tc.desc      page/swipe matrix 3367,777,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0260 begin`);
      logInfo("page/swipe matrix 3367,777,900,1,false,1");
      const actual: string = flingDistance(3367) + '|' + fpsFromFrames(777, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3367|863.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3367|863.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0261
     * @tc.name      Perf_PageSwipeMatrix_0261
     * @tc.desc      page/swipe matrix 3380,780,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0261 begin`);
      logInfo("page/swipe matrix 3380,780,0,2,true,2");
      const actual: string = flingDistance(3380) + '|' + fpsFromFrames(780, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3380|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("3380|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0262
     * @tc.name      Perf_PageSwipeMatrix_0262
     * @tc.desc      page/swipe matrix 3393,783,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0262 begin`);
      logInfo("page/swipe matrix 3393,783,100,0,false,0");
      const actual: string = flingDistance(3393) + '|' + fpsFromFrames(783, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3393|7830|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3393|7830|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0263
     * @tc.name      Perf_PageSwipeMatrix_0263
     * @tc.desc      page/swipe matrix 3406,786,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0263 begin`);
      logInfo("page/swipe matrix 3406,786,200,1,true,1");
      const actual: string = flingDistance(3406) + '|' + fpsFromFrames(786, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3406|3930|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3406|3930|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0264
     * @tc.name      Perf_PageSwipeMatrix_0264
     * @tc.desc      page/swipe matrix 3419,789,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0264 begin`);
      logInfo("page/swipe matrix 3419,789,300,2,false,2");
      const actual: string = flingDistance(3419) + '|' + fpsFromFrames(789, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3419|2630|pages/Index|||back|Error");
      expect(actual).assertEqual("3419|2630|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0265
     * @tc.name      Perf_PageSwipeMatrix_0265
     * @tc.desc      page/swipe matrix 3432,792,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0265 begin`);
      logInfo("page/swipe matrix 3432,792,400,0,true,0");
      const actual: string = flingDistance(3432) + '|' + fpsFromFrames(792, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3432|1980|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3432|1980|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0266
     * @tc.name      Perf_PageSwipeMatrix_0266
     * @tc.desc      page/swipe matrix 3445,795,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0266 begin`);
      logInfo("page/swipe matrix 3445,795,500,1,false,1");
      const actual: string = flingDistance(3445) + '|' + fpsFromFrames(795, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3445|1590|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3445|1590|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0267
     * @tc.name      Perf_PageSwipeMatrix_0267
     * @tc.desc      page/swipe matrix 3458,798,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0267 begin`);
      logInfo("page/swipe matrix 3458,798,600,2,true,2");
      const actual: string = flingDistance(3458) + '|' + fpsFromFrames(798, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3458|1330|pages/Index|||back|Pass");
      expect(actual).assertEqual("3458|1330|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0268
     * @tc.name      Perf_PageSwipeMatrix_0268
     * @tc.desc      page/swipe matrix 3471,801,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0268 begin`);
      logInfo("page/swipe matrix 3471,801,700,0,false,0");
      const actual: string = flingDistance(3471) + '|' + fpsFromFrames(801, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3471|1144.285714|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3471|1144.285714|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0269
     * @tc.name      Perf_PageSwipeMatrix_0269
     * @tc.desc      page/swipe matrix 3484,804,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0269 begin`);
      logInfo("page/swipe matrix 3484,804,800,1,true,1");
      const actual: string = flingDistance(3484) + '|' + fpsFromFrames(804, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3484|1005|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3484|1005|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0270
     * @tc.name      Perf_PageSwipeMatrix_0270
     * @tc.desc      page/swipe matrix 3497,807,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0270 begin`);
      logInfo("page/swipe matrix 3497,807,900,2,false,2");
      const actual: string = flingDistance(3497) + '|' + fpsFromFrames(807, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3497|896.666667|pages/Index|||back|Error");
      expect(actual).assertEqual("3497|896.666667|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0271
     * @tc.name      Perf_PageSwipeMatrix_0271
     * @tc.desc      page/swipe matrix 3510,810,0,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0271 begin`);
      logInfo("page/swipe matrix 3510,810,0,0,true,0");
      const actual: string = flingDistance(3510) + '|' + fpsFromFrames(810, 0) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3510|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3510|0|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0272
     * @tc.name      Perf_PageSwipeMatrix_0272
     * @tc.desc      page/swipe matrix 3523,813,100,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0272 begin`);
      logInfo("page/swipe matrix 3523,813,100,1,false,1");
      const actual: string = flingDistance(3523) + '|' + fpsFromFrames(813, 100) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3523|8130|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3523|8130|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0273
     * @tc.name      Perf_PageSwipeMatrix_0273
     * @tc.desc      page/swipe matrix 3536,816,200,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0273 begin`);
      logInfo("page/swipe matrix 3536,816,200,2,true,2");
      const actual: string = flingDistance(3536) + '|' + fpsFromFrames(816, 200) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3536|4080|pages/Index|||back|Pass");
      expect(actual).assertEqual("3536|4080|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0274
     * @tc.name      Perf_PageSwipeMatrix_0274
     * @tc.desc      page/swipe matrix 3549,819,300,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0274 begin`);
      logInfo("page/swipe matrix 3549,819,300,0,false,0");
      const actual: string = flingDistance(3549) + '|' + fpsFromFrames(819, 300) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3549|2730|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3549|2730|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0275
     * @tc.name      Perf_PageSwipeMatrix_0275
     * @tc.desc      page/swipe matrix 3562,822,400,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0275 begin`);
      logInfo("page/swipe matrix 3562,822,400,1,true,1");
      const actual: string = flingDistance(3562) + '|' + fpsFromFrames(822, 400) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3562|2055|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3562|2055|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0276
     * @tc.name      Perf_PageSwipeMatrix_0276
     * @tc.desc      page/swipe matrix 3575,825,500,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0276 begin`);
      logInfo("page/swipe matrix 3575,825,500,2,false,2");
      const actual: string = flingDistance(3575) + '|' + fpsFromFrames(825, 500) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3575|1650|pages/Index|||back|Error");
      expect(actual).assertEqual("3575|1650|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0277
     * @tc.name      Perf_PageSwipeMatrix_0277
     * @tc.desc      page/swipe matrix 3588,828,600,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0277 begin`);
      logInfo("page/swipe matrix 3588,828,600,0,true,0");
      const actual: string = flingDistance(3588) + '|' + fpsFromFrames(828, 600) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3588|1380|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3588|1380|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0278
     * @tc.name      Perf_PageSwipeMatrix_0278
     * @tc.desc      page/swipe matrix 3601,831,700,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0278 begin`);
      logInfo("page/swipe matrix 3601,831,700,1,false,1");
      const actual: string = flingDistance(3601) + '|' + fpsFromFrames(831, 700) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3601|1187.142857|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3601|1187.142857|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0279
     * @tc.name      Perf_PageSwipeMatrix_0279
     * @tc.desc      page/swipe matrix 3614,834,800,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0279 begin`);
      logInfo("page/swipe matrix 3614,834,800,2,true,2");
      const actual: string = flingDistance(3614) + '|' + fpsFromFrames(834, 800) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3614|1042.5|pages/Index|||back|Pass");
      expect(actual).assertEqual("3614|1042.5|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0280
     * @tc.name      Perf_PageSwipeMatrix_0280
     * @tc.desc      page/swipe matrix 3627,837,900,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0280 begin`);
      logInfo("page/swipe matrix 3627,837,900,0,false,0");
      const actual: string = flingDistance(3627) + '|' + fpsFromFrames(837, 900) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3627|930|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3627|930|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0281
     * @tc.name      Perf_PageSwipeMatrix_0281
     * @tc.desc      page/swipe matrix 3640,840,0,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0281 begin`);
      logInfo("page/swipe matrix 3640,840,0,1,true,1");
      const actual: string = flingDistance(3640) + '|' + fpsFromFrames(840, 0) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3640|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3640|0|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0282
     * @tc.name      Perf_PageSwipeMatrix_0282
     * @tc.desc      page/swipe matrix 3653,843,100,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0282 begin`);
      logInfo("page/swipe matrix 3653,843,100,2,false,2");
      const actual: string = flingDistance(3653) + '|' + fpsFromFrames(843, 100) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3653|8430|pages/Index|||back|Error");
      expect(actual).assertEqual("3653|8430|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0283
     * @tc.name      Perf_PageSwipeMatrix_0283
     * @tc.desc      page/swipe matrix 3666,846,200,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0283 begin`);
      logInfo("page/swipe matrix 3666,846,200,0,true,0");
      const actual: string = flingDistance(3666) + '|' + fpsFromFrames(846, 200) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3666|4230|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3666|4230|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0284
     * @tc.name      Perf_PageSwipeMatrix_0284
     * @tc.desc      page/swipe matrix 3679,849,300,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0284 begin`);
      logInfo("page/swipe matrix 3679,849,300,1,false,1");
      const actual: string = flingDistance(3679) + '|' + fpsFromFrames(849, 300) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3679|2830|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3679|2830|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0285
     * @tc.name      Perf_PageSwipeMatrix_0285
     * @tc.desc      page/swipe matrix 3692,852,400,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0285 begin`);
      logInfo("page/swipe matrix 3692,852,400,2,true,2");
      const actual: string = flingDistance(3692) + '|' + fpsFromFrames(852, 400) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3692|2130|pages/Index|||back|Pass");
      expect(actual).assertEqual("3692|2130|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0286
     * @tc.name      Perf_PageSwipeMatrix_0286
     * @tc.desc      page/swipe matrix 3705,855,500,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0286 begin`);
      logInfo("page/swipe matrix 3705,855,500,0,false,0");
      const actual: string = flingDistance(3705) + '|' + fpsFromFrames(855, 500) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3705|1710|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3705|1710|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0287
     * @tc.name      Perf_PageSwipeMatrix_0287
     * @tc.desc      page/swipe matrix 3718,858,600,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0287 begin`);
      logInfo("page/swipe matrix 3718,858,600,1,true,1");
      const actual: string = flingDistance(3718) + '|' + fpsFromFrames(858, 600) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3718|1430|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3718|1430|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0288
     * @tc.name      Perf_PageSwipeMatrix_0288
     * @tc.desc      page/swipe matrix 3731,861,700,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0288 begin`);
      logInfo("page/swipe matrix 3731,861,700,2,false,2");
      const actual: string = flingDistance(3731) + '|' + fpsFromFrames(861, 700) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3731|1230|pages/Index|||back|Error");
      expect(actual).assertEqual("3731|1230|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0289
     * @tc.name      Perf_PageSwipeMatrix_0289
     * @tc.desc      page/swipe matrix 3744,864,800,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0289 begin`);
      logInfo("page/swipe matrix 3744,864,800,0,true,0");
      const actual: string = flingDistance(3744) + '|' + fpsFromFrames(864, 800) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3744|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3744|1080|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0290
     * @tc.name      Perf_PageSwipeMatrix_0290
     * @tc.desc      page/swipe matrix 3757,867,900,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_PageSwipeMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0290 begin`);
      logInfo("page/swipe matrix 3757,867,900,1,false,1");
      const actual: string = flingDistance(3757) + '|' + fpsFromFrames(867, 900) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3757|963.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3757|963.333333|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0291
     * @tc.name      Perf_PageSwipeMatrix_0291
     * @tc.desc      page/swipe matrix 3770,870,0,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0291 begin`);
      logInfo("page/swipe matrix 3770,870,0,2,true,2");
      const actual: string = flingDistance(3770) + '|' + fpsFromFrames(870, 0) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3770|0|pages/Index|||back|Pass");
      expect(actual).assertEqual("3770|0|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0292
     * @tc.name      Perf_PageSwipeMatrix_0292
     * @tc.desc      page/swipe matrix 3783,873,100,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0292 begin`);
      logInfo("page/swipe matrix 3783,873,100,0,false,0");
      const actual: string = flingDistance(3783) + '|' + fpsFromFrames(873, 100) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3783|8730|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3783|8730|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0293
     * @tc.name      Perf_PageSwipeMatrix_0293
     * @tc.desc      page/swipe matrix 3796,876,200,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0293 begin`);
      logInfo("page/swipe matrix 3796,876,200,1,true,1");
      const actual: string = flingDistance(3796) + '|' + fpsFromFrames(876, 200) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3796|4380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3796|4380|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0294
     * @tc.name      Perf_PageSwipeMatrix_0294
     * @tc.desc      page/swipe matrix 3809,879,300,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0294 begin`);
      logInfo("page/swipe matrix 3809,879,300,2,false,2");
      const actual: string = flingDistance(3809) + '|' + fpsFromFrames(879, 300) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3809|2930|pages/Index|||back|Error");
      expect(actual).assertEqual("3809|2930|pages/Index|||back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0295
     * @tc.name      Perf_PageSwipeMatrix_0295
     * @tc.desc      page/swipe matrix 3822,882,400,0,true,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0295 begin`);
      logInfo("page/swipe matrix 3822,882,400,0,true,0");
      const actual: string = flingDistance(3822) + '|' + fpsFromFrames(882, 400) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3822|2205|pages/PageListPage|toPageList|ListPage|push|Pass");
      expect(actual).assertEqual("3822|2205|pages/PageListPage|toPageList|ListPage|push|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0296
     * @tc.name      Perf_PageSwipeMatrix_0296
     * @tc.desc      page/swipe matrix 3835,885,500,1,false,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0296 begin`);
      logInfo("page/swipe matrix 3835,885,500,1,false,1");
      const actual: string = flingDistance(3835) + '|' + fpsFromFrames(885, 500) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3835|1770|pages/navigationPage|toNavigationPage|navigation|back|Error");
      expect(actual).assertEqual("3835|1770|pages/navigationPage|toNavigationPage|navigation|back|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0297
     * @tc.name      Perf_PageSwipeMatrix_0297
     * @tc.desc      page/swipe matrix 3848,888,600,2,true,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0297 begin`);
      logInfo("page/swipe matrix 3848,888,600,2,true,2");
      const actual: string = flingDistance(3848) + '|' + fpsFromFrames(888, 600) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3848|1480|pages/Index|||back|Pass");
      expect(actual).assertEqual("3848|1480|pages/Index|||back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0298
     * @tc.name      Perf_PageSwipeMatrix_0298
     * @tc.desc      page/swipe matrix 3861,891,700,0,false,0 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_PageSwipeMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0298 begin`);
      logInfo("page/swipe matrix 3861,891,700,0,false,0");
      const actual: string = flingDistance(3861) + '|' + fpsFromFrames(891, 700) + '|' + routeUrl(0) + '|' + routeButtonId(0) + '|' + routeText(0) + '|' + navigationAction(0) + '|' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "3861|1272.857143|pages/PageListPage|toPageList|ListPage|push|Error");
      expect(actual).assertEqual("3861|1272.857143|pages/PageListPage|toPageList|ListPage|push|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0299
     * @tc.name      Perf_PageSwipeMatrix_0299
     * @tc.desc      page/swipe matrix 3874,894,800,1,true,1 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0299 begin`);
      logInfo("page/swipe matrix 3874,894,800,1,true,1");
      const actual: string = flingDistance(3874) + '|' + fpsFromFrames(894, 800) + '|' + routeUrl(1) + '|' + routeButtonId(1) + '|' + routeText(1) + '|' + navigationAction(1) + '|' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "3874|1117.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      expect(actual).assertEqual("3874|1117.5|pages/navigationPage|toNavigationPage|navigation|back|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageSwipeMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_PAGE_SWIPE_MATRIX_0300
     * @tc.name      Perf_PageSwipeMatrix_0300
     * @tc.desc      page/swipe matrix 3887,897,900,2,false,2 keeps geometry/route flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_PageSwipeMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageSwipeMatrix_0300 begin`);
      logInfo("page/swipe matrix 3887,897,900,2,false,2");
      const actual: string = flingDistance(3887) + '|' + fpsFromFrames(897, 900) + '|' + routeUrl(2) + '|' + routeButtonId(2) + '|' + routeText(2) + '|' + navigationAction(2) + '|' + routeFlag(false);
