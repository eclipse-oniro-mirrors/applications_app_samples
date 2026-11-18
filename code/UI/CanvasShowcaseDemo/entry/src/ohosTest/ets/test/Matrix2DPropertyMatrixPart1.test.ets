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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function Matrix2DPropertyMatrixPart1Test(): void {
  describe('Matrix2DPropertyMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0100
     * @tc.name      testPropertyAssign0001
     * @tc.desc      Verify property scaleX assignment keeps 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0001 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 2;
      expect(m.scaleX).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0200
     * @tc.name      testPropertyAssign0002
     * @tc.desc      Verify property scaleY assignment keeps 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0002 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = 3;
      expect(m.scaleY).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0300
     * @tc.name      testPropertyAssign0003
     * @tc.desc      Verify property rotateX assignment keeps 0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0003 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = 0.2;
      expect(m.rotateX).assertEqual(0.2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0400
     * @tc.name      testPropertyAssign0004
     * @tc.desc      Verify property rotateY assignment keeps -0.4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0004 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = -0.4;
      expect(m.rotateY).assertEqual(-0.4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0500
     * @tc.name      testPropertyAssign0005
     * @tc.desc      Verify property translateX assignment keeps 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0005 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 15;
      expect(m.translateX).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0600
     * @tc.name      testPropertyAssign0006
     * @tc.desc      Verify property translateY assignment keeps -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyAssign0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0006 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = -25;
      expect(m.translateY).assertEqual(-25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyAssign0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0700
     * @tc.name      testTransformThenInvert0007
     * @tc.desc      Verify invert of translate(10,20) scale(2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTransformThenInvert0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransformThenInvert0007 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(10, 20).scale(2, 2).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.5) < 1e-6).assertTrue();
      expect(inv.translateX).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransformThenInvert0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0800
     * @tc.name      testTransformThenInvert0008
     * @tc.desc      Verify invert of translate(-5,8) scale(0.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTransformThenInvert0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransformThenInvert0008 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(-5, 8).scale(0.5, 0.5).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 2.0) < 1e-6).assertTrue();
      expect(inv.translateX).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransformThenInvert0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_0900
     * @tc.name      testPropertyScaleIndependent0009
     * @tc.desc      Verify scaleX assignment does not alter scaleY.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyScaleIndependent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyScaleIndependent0009 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 4;
      expect(m.scaleX).assertEqual(4);
      expect(m.scaleY).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyScaleIndependent0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2PP1_1000
     * @tc.name      testPropertyTranslateIndependent0010
     * @tc.desc      Verify translateX assignment does not alter translateY.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyTranslateIndependent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyTranslateIndependent0010 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 7;
      expect(m.translateX).assertEqual(7);
      expect(m.translateY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyTranslateIndependent0010 end');
    })

  })
}
