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

export default function Matrix2DExtraMatrixPart1Test(): void {
  describe('Matrix2DExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0100
     * @tc.name      testScale0001
     * @tc.desc      Verify scale(2, 3).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScale0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0001 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(2, 3);
      expect(m.scaleX).assertEqual(2);
      expect(m.scaleY).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0200
     * @tc.name      testScale0002
     * @tc.desc      Verify scale(0.5, 0.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScale0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0002 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(0.5, 0.5);
      expect(m.scaleX).assertEqual(0.5);
      expect(m.scaleY).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0300
     * @tc.name      testScale0003
     * @tc.desc      Verify scale(-1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScale0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0003 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(-1, 1);
      expect(m.scaleX).assertEqual(-1);
      expect(m.scaleY).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0400
     * @tc.name      testScale0004
     * @tc.desc      Verify scale(0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScale0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0004 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(0, 0);
      expect(m.scaleX).assertEqual(0);
      expect(m.scaleY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0500
     * @tc.name      testScale0005
     * @tc.desc      Verify scale(1.5, 2.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScale0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0005 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(1.5, 2.5);
      expect(m.scaleX).assertEqual(1.5);
      expect(m.scaleY).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScale0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0600
     * @tc.name      testRotate0006
     * @tc.desc      Verify rotate(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0006 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(0);
      expect(Math.abs((m.scaleX ?? 0) - 1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - 0.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + 0.0) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0700
     * @tc.name      testRotate0007
     * @tc.desc      Verify rotate(0.5235987755982988).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0007 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(0.5235987755982988);
      expect(Math.abs((m.scaleX ?? 0) - 0.8660254037844387) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 0.8660254037844387) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - 0.49999999999999994) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + 0.49999999999999994) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0800
     * @tc.name      testRotate0008
     * @tc.desc      Verify rotate(0.7853981633974483).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0008 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(0.7853981633974483);
      expect(Math.abs((m.scaleX ?? 0) - 0.7071067811865476) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 0.7071067811865476) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - 0.7071067811865476) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + 0.7071067811865476) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_0900
     * @tc.name      testRotate0009
     * @tc.desc      Verify rotate(1.5707963267948966).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0009 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(1.5707963267948966);
      expect(Math.abs((m.scaleX ?? 0) - 6.123233995736766e-17) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 6.123233995736766e-17) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - 1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + 1.0) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1000
     * @tc.name      testRotate0010
     * @tc.desc      Verify rotate(3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0010 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(3.141592653589793);
      expect(Math.abs((m.scaleX ?? 0) - -1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - -1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - 1.2246467991473532e-16) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + 1.2246467991473532e-16) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1100
     * @tc.name      testRotate0011
     * @tc.desc      Verify rotate(6.283185307179586).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0011 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(6.283185307179586);
      expect(Math.abs((m.scaleX ?? 0) - 1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - -2.4492935982947064e-16) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + -2.4492935982947064e-16) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1200
     * @tc.name      testRotate0012
     * @tc.desc      Verify rotate(-1.5707963267948966).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0012 begin');
      await delayTick();
      const m = new Matrix2D().identity().rotate(-1.5707963267948966);
      expect(Math.abs((m.scaleX ?? 0) - 6.123233995736766e-17) < 1e-6).assertTrue();
      expect(Math.abs((m.scaleY ?? 0) - 6.123233995736766e-17) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateY ?? 0) - -1.0) < 1e-6).assertTrue();
      expect(Math.abs((m.rotateX ?? 0) + -1.0) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotate0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1300
     * @tc.name      testTranslate0013
     * @tc.desc      Verify translate(10, 20).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTranslate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0013 begin');
      await delayTick();
      const m = new Matrix2D().identity().translate(10, 20);
      expect(m.translateX).assertEqual(10);
      expect(m.translateY).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1400
     * @tc.name      testTranslate0014
     * @tc.desc      Verify translate(-5, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTranslate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0014 begin');
      await delayTick();
      const m = new Matrix2D().identity().translate(-5, 7);
      expect(m.translateX).assertEqual(-5);
      expect(m.translateY).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1500
     * @tc.name      testTranslate0015
     * @tc.desc      Verify translate(0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTranslate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0015 begin');
      await delayTick();
      const m = new Matrix2D().identity().translate(0, 0);
      expect(m.translateX).assertEqual(0);
      expect(m.translateY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1600
     * @tc.name      testTranslate0016
     * @tc.desc      Verify translate(1000, -1000).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTranslate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0016 begin');
      await delayTick();
      const m = new Matrix2D().identity().translate(1000, -1000);
      expect(m.translateX).assertEqual(1000);
      expect(m.translateY).assertEqual(-1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTranslate0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1700
     * @tc.name      testInvertScale0017
     * @tc.desc      Verify invert of scale 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertScale0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0017 begin');
      await delayTick();
      const inv = new Matrix2D().identity().scale(2, 2).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.5) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1800
     * @tc.name      testInvertScale0018
     * @tc.desc      Verify invert of scale 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertScale0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0018 begin');
      await delayTick();
      const inv = new Matrix2D().identity().scale(4, 4).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.25) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_1900
     * @tc.name      testInvertScale0019
     * @tc.desc      Verify invert of scale 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertScale0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0019 begin');
      await delayTick();
      const inv = new Matrix2D().identity().scale(0.5, 0.5).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 2.0) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertScale0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_2000
     * @tc.name      testInvertTranslate0020
     * @tc.desc      Verify invert of translate 100,50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertTranslate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertTranslate0020 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(100, 50).invert();
      expect(inv.translateX).assertEqual(-100);
      expect(inv.translateY).assertEqual(-50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertTranslate0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_2100
     * @tc.name      testInvertTranslate0021
     * @tc.desc      Verify invert of translate -10,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertTranslate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertTranslate0021 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(-10, 20).invert();
      expect(inv.translateX).assertEqual(10);
      expect(inv.translateY).assertEqual(-20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertTranslate0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_M2XP1_2200
     * @tc.name      testIdentityReset0022
     * @tc.desc      Verify identity clears scale and translate.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdentityReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIdentityReset0022 begin');
      await delayTick();
      const m = new Matrix2D().identity().scale(5, 6).translate(9, 9).identity();
      expect(m.scaleX).assertEqual(1);
      expect(m.scaleY).assertEqual(1);
      expect(m.translateX).assertEqual(0);
      expect(m.translateY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIdentityReset0022 end');
    })

  })
}
