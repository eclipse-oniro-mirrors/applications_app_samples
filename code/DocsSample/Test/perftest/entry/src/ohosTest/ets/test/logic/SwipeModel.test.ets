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
