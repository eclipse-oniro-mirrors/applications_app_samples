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
  fpsFromFrames,
} from '../model/PerfTestLogic';

/** FpsFromFramesTest logic checks (32 cases). */
export default function fpsFromFramesTest(): void {
  describe('FpsFromFramesTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_FPS_0001
     * @tc.name      Perf_Fps_0001
     * @tc.desc      fpsFromFrames(0, 0) is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fps_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fps_0001 begin`);
      logInfo("fpsFromFrames(0, 0)");
      const actual: number = fpsFromFrames(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0002
     * @tc.name      Perf_Fps_0002
     * @tc.desc      fpsFromFrames(7, 50) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0002 begin`);
      logInfo("fpsFromFrames(7, 50)");
      const actual: number = fpsFromFrames(7, 50);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0003
     * @tc.name      Perf_Fps_0003
     * @tc.desc      fpsFromFrames(14, 100) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0003 begin`);
      logInfo("fpsFromFrames(14, 100)");
      const actual: number = fpsFromFrames(14, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0004
     * @tc.name      Perf_Fps_0004
     * @tc.desc      fpsFromFrames(21, 150) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0004 begin`);
      logInfo("fpsFromFrames(21, 150)");
      const actual: number = fpsFromFrames(21, 150);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0005
     * @tc.name      Perf_Fps_0005
     * @tc.desc      fpsFromFrames(28, 200) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0005 begin`);
      logInfo("fpsFromFrames(28, 200)");
      const actual: number = fpsFromFrames(28, 200);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0006
     * @tc.name      Perf_Fps_0006
     * @tc.desc      fpsFromFrames(35, 250) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0006 begin`);
      logInfo("fpsFromFrames(35, 250)");
      const actual: number = fpsFromFrames(35, 250);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0007
     * @tc.name      Perf_Fps_0007
     * @tc.desc      fpsFromFrames(42, 300) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0007 begin`);
      logInfo("fpsFromFrames(42, 300)");
      const actual: number = fpsFromFrames(42, 300);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0008
     * @tc.name      Perf_Fps_0008
     * @tc.desc      fpsFromFrames(49, 350) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0008 begin`);
      logInfo("fpsFromFrames(49, 350)");
      const actual: number = fpsFromFrames(49, 350);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0009
     * @tc.name      Perf_Fps_0009
     * @tc.desc      fpsFromFrames(56, 400) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0009 begin`);
      logInfo("fpsFromFrames(56, 400)");
      const actual: number = fpsFromFrames(56, 400);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0010
     * @tc.name      Perf_Fps_0010
     * @tc.desc      fpsFromFrames(63, 450) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0010 begin`);
      logInfo("fpsFromFrames(63, 450)");
      const actual: number = fpsFromFrames(63, 450);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0011
     * @tc.name      Perf_Fps_0011
     * @tc.desc      fpsFromFrames(70, 500) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0011 begin`);
      logInfo("fpsFromFrames(70, 500)");
      const actual: number = fpsFromFrames(70, 500);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0012
     * @tc.name      Perf_Fps_0012
     * @tc.desc      fpsFromFrames(77, 550) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fps_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fps_0012 begin`);
      logInfo("fpsFromFrames(77, 550)");
      const actual: number = fpsFromFrames(77, 550);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0013
     * @tc.name      Perf_Fps_0013
     * @tc.desc      fpsFromFrames(84, 600) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0013 begin`);
      logInfo("fpsFromFrames(84, 600)");
      const actual: number = fpsFromFrames(84, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0014
     * @tc.name      Perf_Fps_0014
     * @tc.desc      fpsFromFrames(91, 650) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0014 begin`);
      logInfo("fpsFromFrames(91, 650)");
      const actual: number = fpsFromFrames(91, 650);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0015
     * @tc.name      Perf_Fps_0015
     * @tc.desc      fpsFromFrames(98, 700) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0015 begin`);
      logInfo("fpsFromFrames(98, 700)");
      const actual: number = fpsFromFrames(98, 700);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0016
     * @tc.name      Perf_Fps_0016
     * @tc.desc      fpsFromFrames(105, 750) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0016 begin`);
      logInfo("fpsFromFrames(105, 750)");
      const actual: number = fpsFromFrames(105, 750);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0017
     * @tc.name      Perf_Fps_0017
     * @tc.desc      fpsFromFrames(112, 800) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0017 begin`);
      logInfo("fpsFromFrames(112, 800)");
      const actual: number = fpsFromFrames(112, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0018
     * @tc.name      Perf_Fps_0018
     * @tc.desc      fpsFromFrames(119, 850) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_Fps_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Fps_0018 begin`);
      logInfo("fpsFromFrames(119, 850)");
      const actual: number = fpsFromFrames(119, 850);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0019
     * @tc.name      Perf_Fps_0019
     * @tc.desc      fpsFromFrames(126, 900) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0019 begin`);
      logInfo("fpsFromFrames(126, 900)");
      const actual: number = fpsFromFrames(126, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0020
     * @tc.name      Perf_Fps_0020
     * @tc.desc      fpsFromFrames(133, 950) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0020 begin`);
      logInfo("fpsFromFrames(133, 950)");
      const actual: number = fpsFromFrames(133, 950);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0021
     * @tc.name      Perf_Fps_0021
     * @tc.desc      fpsFromFrames(140, 1000) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0021 begin`);
      logInfo("fpsFromFrames(140, 1000)");
      const actual: number = fpsFromFrames(140, 1000);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0022
     * @tc.name      Perf_Fps_0022
     * @tc.desc      fpsFromFrames(147, 1050) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0022 begin`);
      logInfo("fpsFromFrames(147, 1050)");
      const actual: number = fpsFromFrames(147, 1050);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0023
     * @tc.name      Perf_Fps_0023
     * @tc.desc      fpsFromFrames(154, 1100) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_Fps_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fps_0023 begin`);
      logInfo("fpsFromFrames(154, 1100)");
      const actual: number = fpsFromFrames(154, 1100);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0024
     * @tc.name      Perf_Fps_0024
     * @tc.desc      fpsFromFrames(161, 1150) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0024 begin`);
      logInfo("fpsFromFrames(161, 1150)");
      const actual: number = fpsFromFrames(161, 1150);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0025
     * @tc.name      Perf_Fps_0025
     * @tc.desc      fpsFromFrames(168, 1200) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0025 begin`);
      logInfo("fpsFromFrames(168, 1200)");
      const actual: number = fpsFromFrames(168, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0026
     * @tc.name      Perf_Fps_0026
     * @tc.desc      fpsFromFrames(175, 1250) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0026 begin`);
      logInfo("fpsFromFrames(175, 1250)");
      const actual: number = fpsFromFrames(175, 1250);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0027
     * @tc.name      Perf_Fps_0027
     * @tc.desc      fpsFromFrames(182, 1300) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0027 begin`);
      logInfo("fpsFromFrames(182, 1300)");
      const actual: number = fpsFromFrames(182, 1300);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0028
     * @tc.name      Perf_Fps_0028
     * @tc.desc      fpsFromFrames(189, 1350) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0028 begin`);
      logInfo("fpsFromFrames(189, 1350)");
      const actual: number = fpsFromFrames(189, 1350);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0029
     * @tc.name      Perf_Fps_0029
     * @tc.desc      fpsFromFrames(196, 1400) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0029 begin`);
      logInfo("fpsFromFrames(196, 1400)");
      const actual: number = fpsFromFrames(196, 1400);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0030
     * @tc.name      Perf_Fps_0030
     * @tc.desc      fpsFromFrames(203, 1450) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0030 begin`);
      logInfo("fpsFromFrames(203, 1450)");
      const actual: number = fpsFromFrames(203, 1450);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0031
     * @tc.name      Perf_Fps_0031
     * @tc.desc      fpsFromFrames(210, 1500) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0031 begin`);
      logInfo("fpsFromFrames(210, 1500)");
      const actual: number = fpsFromFrames(210, 1500);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Fps_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FPS_0032
     * @tc.name      Perf_Fps_0032
     * @tc.desc      fpsFromFrames(217, 1550) is 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_Fps_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fps_0032 begin`);
      logInfo("fpsFromFrames(217, 1550)");
      const actual: number = fpsFromFrames(217, 1550);
      logInfo('actual=' + String(actual) + ', expected=' + "140");
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Fps_0032 end`);
    });
  });
}
