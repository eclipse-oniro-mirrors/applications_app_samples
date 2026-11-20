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

export default function MatrixPropertyCubeMatrixPart1Test(): void {
  describe('MatrixPropertyCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0100
     * @tc.name      testPropertyCube0001
     * @tc.desc      Verify property scaleX keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0001 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 0;
      expect(m.scaleX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0200
     * @tc.name      testPropertyCube0002
     * @tc.desc      Verify property scaleX keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0002 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 1;
      expect(m.scaleX).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0300
     * @tc.name      testPropertyCube0003
     * @tc.desc      Verify property scaleX keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0003 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = -1;
      expect(m.scaleX).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0400
     * @tc.name      testPropertyCube0004
     * @tc.desc      Verify property scaleX keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0004 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 0.5;
      expect(m.scaleX).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0500
     * @tc.name      testPropertyCube0005
     * @tc.desc      Verify property scaleX keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0005 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleX = 100;
      expect(m.scaleX).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0600
     * @tc.name      testPropertyCube0006
     * @tc.desc      Verify property scaleY keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0006 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = 0;
      expect(m.scaleY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0700
     * @tc.name      testPropertyCube0007
     * @tc.desc      Verify property scaleY keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0007 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = 1;
      expect(m.scaleY).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0800
     * @tc.name      testPropertyCube0008
     * @tc.desc      Verify property scaleY keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0008 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = -1;
      expect(m.scaleY).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_0900
     * @tc.name      testPropertyCube0009
     * @tc.desc      Verify property scaleY keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0009 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = 0.5;
      expect(m.scaleY).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1000
     * @tc.name      testPropertyCube0010
     * @tc.desc      Verify property scaleY keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0010 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.scaleY = 100;
      expect(m.scaleY).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1100
     * @tc.name      testPropertyCube0011
     * @tc.desc      Verify property rotateX keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0011 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = 0;
      expect(m.rotateX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1200
     * @tc.name      testPropertyCube0012
     * @tc.desc      Verify property rotateX keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0012 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = 1;
      expect(m.rotateX).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1300
     * @tc.name      testPropertyCube0013
     * @tc.desc      Verify property rotateX keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0013 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = -1;
      expect(m.rotateX).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1400
     * @tc.name      testPropertyCube0014
     * @tc.desc      Verify property rotateX keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0014 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = 0.5;
      expect(m.rotateX).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1500
     * @tc.name      testPropertyCube0015
     * @tc.desc      Verify property rotateX keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0015 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateX = 100;
      expect(m.rotateX).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1600
     * @tc.name      testPropertyCube0016
     * @tc.desc      Verify property rotateY keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0016 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = 0;
      expect(m.rotateY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1700
     * @tc.name      testPropertyCube0017
     * @tc.desc      Verify property rotateY keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0017 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = 1;
      expect(m.rotateY).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1800
     * @tc.name      testPropertyCube0018
     * @tc.desc      Verify property rotateY keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0018 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = -1;
      expect(m.rotateY).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_1900
     * @tc.name      testPropertyCube0019
     * @tc.desc      Verify property rotateY keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0019 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = 0.5;
      expect(m.rotateY).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2000
     * @tc.name      testPropertyCube0020
     * @tc.desc      Verify property rotateY keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0020 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.rotateY = 100;
      expect(m.rotateY).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2100
     * @tc.name      testPropertyCube0021
     * @tc.desc      Verify property translateX keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0021 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 0;
      expect(m.translateX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2200
     * @tc.name      testPropertyCube0022
     * @tc.desc      Verify property translateX keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0022 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 1;
      expect(m.translateX).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2300
     * @tc.name      testPropertyCube0023
     * @tc.desc      Verify property translateX keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0023 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = -1;
      expect(m.translateX).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2400
     * @tc.name      testPropertyCube0024
     * @tc.desc      Verify property translateX keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0024 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 0.5;
      expect(m.translateX).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2500
     * @tc.name      testPropertyCube0025
     * @tc.desc      Verify property translateX keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0025 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateX = 100;
      expect(m.translateX).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2600
     * @tc.name      testPropertyCube0026
     * @tc.desc      Verify property translateY keeps value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0026 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = 0;
      expect(m.translateY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2700
     * @tc.name      testPropertyCube0027
     * @tc.desc      Verify property translateY keeps value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0027 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = 1;
      expect(m.translateY).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2800
     * @tc.name      testPropertyCube0028
     * @tc.desc      Verify property translateY keeps value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0028 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = -1;
      expect(m.translateY).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_2900
     * @tc.name      testPropertyCube0029
     * @tc.desc      Verify property translateY keeps value 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0029 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = 0.5;
      expect(m.translateY).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_3000
     * @tc.name      testPropertyCube0030
     * @tc.desc      Verify property translateY keeps value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPropertyCube0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0030 begin');
      await delayTick();
      const m = new Matrix2D().identity();
      m.translateY = 100;
      expect(m.translateY).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPropertyCube0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_3100
     * @tc.name      testInvertCube0031
     * @tc.desc      Verify inverse of translate(20,30) scale 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertCube0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0031 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(20, 30).scale(2, 2).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.5) < 1e-6).assertTrue();
      expect(inv.translateX).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_3200
     * @tc.name      testInvertCube0032
     * @tc.desc      Verify inverse of translate(-10,-20) scale 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertCube0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0032 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(-10, -20).scale(4, 4).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.25) < 1e-6).assertTrue();
      expect(inv.translateX).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_MPCP1_3300
     * @tc.name      testInvertCube0033
     * @tc.desc      Verify inverse of translate(100,-100) scale 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvertCube0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0033 begin');
      await delayTick();
      const inv = new Matrix2D().identity().translate(100, -100).scale(4, 4).invert();
      expect(Math.abs((inv.scaleX ?? 0) - 0.25) < 1e-6).assertTrue();
      expect(inv.translateX).assertEqual(-25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvertCube0033 end');
    })

  })
}
