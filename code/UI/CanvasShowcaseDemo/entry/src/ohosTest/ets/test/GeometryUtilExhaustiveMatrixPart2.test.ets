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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function GeometryUtilExhaustiveMatrixPart2Test(): void {
  describe('GeometryUtilExhaustiveMatrixPart2', () => {

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4100
     * @tc.name      testRectContains0041
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (60, 71).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0041 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 60, 71)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0041 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4200
     * @tc.name      testRectContains0042
     * @tc.desc      Verify rectContains rect (0, 0, 0, 0) point (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0042 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 0, 0, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0042 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4300
     * @tc.name      testRectContains0043
     * @tc.desc      Verify rectContains rect (-10, -10, 20, 20) point (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0043 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-10, -10, 20, 20, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0043 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4400
     * @tc.name      testRectContains0044
     * @tc.desc      Verify rectContains rect (-10, -10, 20, 20) point (10, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0044 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-10, -10, 20, 20, 10, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0044 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4500
     * @tc.name      testClamp0045
     * @tc.desc      Verify clamp(-10, 0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0045 begin');
      await delayTick();
      expect(GeometryUtil.clamp(-10, 0, 10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0045 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4600
     * @tc.name      testClamp0046
     * @tc.desc      Verify clamp(0, 0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0046 begin');
      await delayTick();
      expect(GeometryUtil.clamp(0, 0, 10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0046 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4700
     * @tc.name      testClamp0047
     * @tc.desc      Verify clamp(5, 0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0047 begin');
      await delayTick();
      expect(GeometryUtil.clamp(5, 0, 10)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0047 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4800
     * @tc.name      testClamp0048
     * @tc.desc      Verify clamp(10, 0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0048 begin');
      await delayTick();
      expect(GeometryUtil.clamp(10, 0, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0048 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_4900
     * @tc.name      testClamp0049
     * @tc.desc      Verify clamp(11, 0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0049 begin');
      await delayTick();
      expect(GeometryUtil.clamp(11, 0, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0049 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5000
     * @tc.name      testClamp0050
     * @tc.desc      Verify clamp(5, 10, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0050 begin');
      await delayTick();
      expect(GeometryUtil.clamp(5, 10, 0)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0050 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5100
     * @tc.name      testClamp0051
     * @tc.desc      Verify clamp(0, -5, 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0051 begin');
      await delayTick();
      expect(GeometryUtil.clamp(0, -5, 5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0051 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5200
     * @tc.name      testClamp0052
     * @tc.desc      Verify clamp(-100, -1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClamp0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0052 begin');
      await delayTick();
      expect(GeometryUtil.clamp(-100, -1, 1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClamp0052 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5300
     * @tc.name      testDistance0053
     * @tc.desc      Verify distance from (0, 0) to (3, 4).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistance0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0053 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 3, 4) - 5.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0053 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5400
     * @tc.name      testDistance0054
     * @tc.desc      Verify distance from (0, 0) to (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistance0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0054 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 0, 0) - 0.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0054 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5500
     * @tc.name      testDistance0055
     * @tc.desc      Verify distance from (-3, -4) to (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistance0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0055 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(-3, -4, 0, 0) - 5.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0055 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5600
     * @tc.name      testDistance0056
     * @tc.desc      Verify distance from (5, 5) to (8, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistance0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0056 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(5, 5, 8, 9) - 5.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0056 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP2_5700
     * @tc.name      testDistance0057
     * @tc.desc      Verify distance from (0, 0) to (0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistance0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0057 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 0, 10) - 10.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistance0057 end');
    })

  })
}
