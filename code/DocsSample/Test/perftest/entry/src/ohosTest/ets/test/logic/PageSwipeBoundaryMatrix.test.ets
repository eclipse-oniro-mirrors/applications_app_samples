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
