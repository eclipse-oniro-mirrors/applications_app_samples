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
