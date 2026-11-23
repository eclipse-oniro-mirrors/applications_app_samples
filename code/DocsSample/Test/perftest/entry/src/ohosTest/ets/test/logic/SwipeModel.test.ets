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
  SwipeModel,
} from '../model/PerfTestLogic';

/** SwipeModelTest logic checks (32 cases). */
export default function swipeModelTest(): void {
  describe('SwipeModelTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0001
     * @tc.name      Perf_Swipe_0001
     * @tc.desc      swipe metrics for center 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Swipe_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Swipe_0001 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(0, 0, 0);
      subject.scrollToTop();
      logInfo("swipe center=0 frames=0 duration=0");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1");
      expect(actual).assertEqual("0:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0002
     * @tc.name      Perf_Swipe_0002
     * @tc.desc      swipe metrics for center 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0002 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(21, 3, 100);
      subject.scrollToTop();
      logInfo("swipe center=21 frames=3 duration=100");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21:30:1:1");
      expect(actual).assertEqual("21:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0003
     * @tc.name      Perf_Swipe_0003
     * @tc.desc      swipe metrics for center 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0003 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(42, 6, 200);
      subject.scrollToTop();
      logInfo("swipe center=42 frames=6 duration=200");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "42:30:1:1");
      expect(actual).assertEqual("42:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0004
     * @tc.name      Perf_Swipe_0004
     * @tc.desc      swipe metrics for center 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0004 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(63, 9, 300);
      subject.scrollToTop();
      logInfo("swipe center=63 frames=9 duration=300");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "63:30:1:1");
      expect(actual).assertEqual("63:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0005
     * @tc.name      Perf_Swipe_0005
     * @tc.desc      swipe metrics for center 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0005 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(84, 12, 400);
      subject.scrollToTop();
      logInfo("swipe center=84 frames=12 duration=400");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "84:30:1:1");
      expect(actual).assertEqual("84:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0006
     * @tc.name      Perf_Swipe_0006
     * @tc.desc      swipe metrics for center 105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0006 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(105, 15, 500);
      subject.scrollToTop();
      logInfo("swipe center=105 frames=15 duration=500");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "105:30:1:1");
      expect(actual).assertEqual("105:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0007
     * @tc.name      Perf_Swipe_0007
     * @tc.desc      swipe metrics for center 126.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0007 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(126, 18, 600);
      subject.scrollToTop();
      logInfo("swipe center=126 frames=18 duration=600");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "126:30:1:1");
      expect(actual).assertEqual("126:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0008
     * @tc.name      Perf_Swipe_0008
     * @tc.desc      swipe metrics for center 147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0008 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(147, 21, 700);
      subject.scrollToTop();
      logInfo("swipe center=147 frames=21 duration=700");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "147:30:1:1");
      expect(actual).assertEqual("147:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0009
     * @tc.name      Perf_Swipe_0009
     * @tc.desc      swipe metrics for center 168.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0009 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(168, 24, 800);
      subject.scrollToTop();
      logInfo("swipe center=168 frames=24 duration=800");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "168:30:1:1");
      expect(actual).assertEqual("168:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0010
     * @tc.name      Perf_Swipe_0010
     * @tc.desc      swipe metrics for center 189.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0010 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(189, 27, 900);
      subject.scrollToTop();
      logInfo("swipe center=189 frames=27 duration=900");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "189:30:1:1");
      expect(actual).assertEqual("189:30:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0011
     * @tc.name      Perf_Swipe_0011
     * @tc.desc      swipe metrics for center 210.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0011 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(210, 30, 0);
      subject.scrollToTop();
      logInfo("swipe center=210 frames=30 duration=0");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "210:0:1:1");
      expect(actual).assertEqual("210:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0012
     * @tc.name      Perf_Swipe_0012
     * @tc.desc      swipe metrics for center 231.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Swipe_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Swipe_0012 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(231, 33, 100);
      subject.scrollToTop();
      logInfo("swipe center=231 frames=33 duration=100");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "231:330:1:1");
      expect(actual).assertEqual("231:330:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0013
     * @tc.name      Perf_Swipe_0013
     * @tc.desc      swipe metrics for center 252.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0013 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(252, 36, 200);
      subject.scrollToTop();
      logInfo("swipe center=252 frames=36 duration=200");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "252:180:1:1");
      expect(actual).assertEqual("252:180:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0014
     * @tc.name      Perf_Swipe_0014
     * @tc.desc      swipe metrics for center 273.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0014 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(273, 39, 300);
      subject.scrollToTop();
      logInfo("swipe center=273 frames=39 duration=300");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "273:130:1:1");
      expect(actual).assertEqual("273:130:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0015
     * @tc.name      Perf_Swipe_0015
     * @tc.desc      swipe metrics for center 294.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0015 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(294, 42, 400);
      subject.scrollToTop();
      logInfo("swipe center=294 frames=42 duration=400");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "294:105:1:1");
      expect(actual).assertEqual("294:105:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0016
     * @tc.name      Perf_Swipe_0016
     * @tc.desc      swipe metrics for center 315.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0016 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(315, 45, 500);
      subject.scrollToTop();
      logInfo("swipe center=315 frames=45 duration=500");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "315:90:1:1");
      expect(actual).assertEqual("315:90:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0017
     * @tc.name      Perf_Swipe_0017
     * @tc.desc      swipe metrics for center 336.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0017 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(336, 48, 600);
      subject.scrollToTop();
      logInfo("swipe center=336 frames=48 duration=600");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "336:80:1:1");
      expect(actual).assertEqual("336:80:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0018
     * @tc.name      Perf_Swipe_0018
     * @tc.desc      swipe metrics for center 357.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Swipe_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Swipe_0018 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(357, 51, 700);
      subject.scrollToTop();
      logInfo("swipe center=357 frames=51 duration=700");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "357:72.857143:1:1");
      expect(actual).assertEqual("357:72.857143:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0019
     * @tc.name      Perf_Swipe_0019
     * @tc.desc      swipe metrics for center 378.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0019 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(378, 54, 800);
      subject.scrollToTop();
      logInfo("swipe center=378 frames=54 duration=800");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "378:67.5:1:1");
      expect(actual).assertEqual("378:67.5:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0020
     * @tc.name      Perf_Swipe_0020
     * @tc.desc      swipe metrics for center 399.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0020 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(399, 57, 900);
      subject.scrollToTop();
      logInfo("swipe center=399 frames=57 duration=900");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "399:63.333333:1:1");
      expect(actual).assertEqual("399:63.333333:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0021
     * @tc.name      Perf_Swipe_0021
     * @tc.desc      swipe metrics for center 420.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0021 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(420, 60, 0);
      subject.scrollToTop();
      logInfo("swipe center=420 frames=60 duration=0");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "420:0:1:1");
      expect(actual).assertEqual("420:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0022
     * @tc.name      Perf_Swipe_0022
     * @tc.desc      swipe metrics for center 441.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0022 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(441, 63, 100);
      subject.scrollToTop();
      logInfo("swipe center=441 frames=63 duration=100");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "441:630:1:1");
      expect(actual).assertEqual("441:630:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0023
     * @tc.name      Perf_Swipe_0023
     * @tc.desc      swipe metrics for center 462.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Swipe_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Swipe_0023 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(462, 66, 200);
      subject.scrollToTop();
      logInfo("swipe center=462 frames=66 duration=200");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "462:330:1:1");
      expect(actual).assertEqual("462:330:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0024
     * @tc.name      Perf_Swipe_0024
     * @tc.desc      swipe metrics for center 483.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0024 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(483, 69, 300);
      subject.scrollToTop();
      logInfo("swipe center=483 frames=69 duration=300");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "483:230:1:1");
      expect(actual).assertEqual("483:230:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0025
     * @tc.name      Perf_Swipe_0025
     * @tc.desc      swipe metrics for center 504.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0025 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(504, 72, 400);
      subject.scrollToTop();
      logInfo("swipe center=504 frames=72 duration=400");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "504:180:1:1");
      expect(actual).assertEqual("504:180:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0026
     * @tc.name      Perf_Swipe_0026
     * @tc.desc      swipe metrics for center 525.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0026 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(525, 75, 500);
      subject.scrollToTop();
      logInfo("swipe center=525 frames=75 duration=500");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "525:150:1:1");
      expect(actual).assertEqual("525:150:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0027
     * @tc.name      Perf_Swipe_0027
     * @tc.desc      swipe metrics for center 546.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0027 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(546, 78, 600);
      subject.scrollToTop();
      logInfo("swipe center=546 frames=78 duration=600");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "546:130:1:1");
      expect(actual).assertEqual("546:130:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0028
     * @tc.name      Perf_Swipe_0028
     * @tc.desc      swipe metrics for center 567.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0028 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(567, 81, 700);
      subject.scrollToTop();
      logInfo("swipe center=567 frames=81 duration=700");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "567:115.714286:1:1");
      expect(actual).assertEqual("567:115.714286:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0029
     * @tc.name      Perf_Swipe_0029
     * @tc.desc      swipe metrics for center 588.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0029 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(588, 84, 800);
      subject.scrollToTop();
      logInfo("swipe center=588 frames=84 duration=800");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "588:105:1:1");
      expect(actual).assertEqual("588:105:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0030
     * @tc.name      Perf_Swipe_0030
     * @tc.desc      swipe metrics for center 609.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0030 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(609, 87, 900);
      subject.scrollToTop();
      logInfo("swipe center=609 frames=87 duration=900");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "609:96.666667:1:1");
      expect(actual).assertEqual("609:96.666667:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0031
     * @tc.name      Perf_Swipe_0031
     * @tc.desc      swipe metrics for center 630.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0031 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(630, 90, 0);
      subject.scrollToTop();
      logInfo("swipe center=630 frames=90 duration=0");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "630:0:1:1");
      expect(actual).assertEqual("630:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_SWIPE_0032
     * @tc.name      Perf_Swipe_0032
     * @tc.desc      swipe metrics for center 651.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Swipe_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Swipe_0032 begin`);
      const subject: SwipeModel = new SwipeModel();
      subject.fling(651, 93, 100);
      subject.scrollToTop();
      logInfo("swipe center=651 frames=93 duration=100");
      const actual: string = subject.distance() + ":" + subject.fps() + ":" + subject.flingCount() + ":" + subject.resetCount();
      logInfo('actual=' + String(actual) + ', expected=' + "651:930:1:1");
      expect(actual).assertEqual("651:930:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Swipe_0032 end`);
    });
  });
}
