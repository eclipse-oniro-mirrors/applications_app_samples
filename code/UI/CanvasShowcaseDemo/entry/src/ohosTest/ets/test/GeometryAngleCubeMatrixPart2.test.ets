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

export default function GeometryAngleCubeMatrixPart2Test(): void {
  describe('GeometryAngleCubeMatrixPart2', () => {

    /**
     * @tc.number    SUB_CANVAS_GACP2_4100
     * @tc.name      testAnglePoint0041
     * @tc.desc      Verify point at angle 135 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0041 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 135);
      expect(Math.abs(p.x - 82.32233047033631) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 67.67766952966369) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0041 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4200
     * @tc.name      testAnglePoint0042
     * @tc.desc      Verify point at angle 165 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0042 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 165);
      expect(Math.abs(p.x - 75.8518543427733) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 56.470476127563025) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0042 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4300
     * @tc.name      testAnglePoint0043
     * @tc.desc      Verify point at angle 195 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0043 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 195);
      expect(Math.abs(p.x - 75.8518543427733) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 43.52952387243699) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0043 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4400
     * @tc.name      testAnglePoint0044
     * @tc.desc      Verify point at angle 225 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0044 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 225);
      expect(Math.abs(p.x - 82.32233047033631) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 32.32233047033631) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0044 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4500
     * @tc.name      testAnglePoint0045
     * @tc.desc      Verify point at angle 255 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0045 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 255);
      expect(Math.abs(p.x - 93.52952387243698) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 25.851854342773294) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0045 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4600
     * @tc.name      testAnglePoint0046
     * @tc.desc      Verify point at angle 285 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0046 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 285);
      expect(Math.abs(p.x - 106.47047612756303) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 25.851854342773294) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0046 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4700
     * @tc.name      testAnglePoint0047
     * @tc.desc      Verify point at angle 315 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0047 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 315);
      expect(Math.abs(p.x - 117.67766952966369) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 32.32233047033631) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0047 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP2_4800
     * @tc.name      testAnglePoint0048
     * @tc.desc      Verify point at angle 345 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0048 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 345);
      expect(Math.abs(p.x - 124.1481456572267) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 43.52952387243698) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0048 end');
    })

  })
}
