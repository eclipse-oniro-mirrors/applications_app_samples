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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Graphics3d]';

export default function g3dVectorMatrix1Test(): void {
  describe('G3dVectorMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_VECTOR_0001
     * @tc.name      g3dVectorVec0001
     * @tc.desc      向量 (1,0,0) 与 (-3,4,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0001 begin');
      const dot: number = 1 * -3 + 0 * 4 + 0 * 0;
      const length: number = Math.sqrt(1 + 0 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-3);
      expect(length.toFixed(3)).assertEqual('1.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0001 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0002
     * @tc.name      g3dVectorVec0002
     * @tc.desc      向量 (1,0,0) 与 (-3,4,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0002 begin');
      const crossX: number = 0 * 0 - 0 * 4;
      const crossY: number = 0 * -3 - 1 * 0;
      const crossZ: number = 1 * 4 - 0 * -3;
      const dotA: number = crossX * 1 + crossY * 0 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(4);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0002 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0003
     * @tc.name      g3dVectorVec0003
     * @tc.desc      向量 (0,1,0) 与 (2,-3,6) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0003 begin');
      const dot: number = 0 * 2 + 1 * -3 + 0 * 6;
      const length: number = Math.sqrt(0 + 1 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-3);
      expect(length.toFixed(3)).assertEqual('1.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0003 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0004
     * @tc.name      g3dVectorVec0004
     * @tc.desc      向量 (0,1,0) 与 (2,-3,6) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0004 begin');
      const crossX: number = 1 * 6 - 0 * -3;
      const crossY: number = 0 * 2 - 0 * 6;
      const crossZ: number = 0 * -3 - 1 * 2;
      const dotA: number = crossX * 0 + crossY * 1 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(6);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(-2);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0004 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0005
     * @tc.name      g3dVectorVec0005
     * @tc.desc      向量 (0,0,1) 与 (10,0,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0005 begin');
      const dot: number = 0 * 10 + 0 * 0 + 1 * 0;
      const length: number = Math.sqrt(0 + 0 + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(0);
      expect(length.toFixed(3)).assertEqual('1.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0005 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0006
     * @tc.name      g3dVectorVec0006
     * @tc.desc      向量 (0,0,1) 与 (10,0,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0006 begin');
      const crossX: number = 0 * 0 - 1 * 0;
      const crossY: number = 1 * 10 - 0 * 0;
      const crossZ: number = 0 * 0 - 0 * 10;
      const dotA: number = crossX * 0 + crossY * 0 + crossZ * 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0);
      expect(crossY).assertEqual(10);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0006 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0007
     * @tc.name      g3dVectorVec0007
     * @tc.desc      向量 (1,1,1) 与 (0,10,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0007 begin');
      const dot: number = 1 * 0 + 1 * 10 + 1 * 0;
      const length: number = Math.sqrt(1 + 1 + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(10);
      expect(length.toFixed(3)).assertEqual('1.732');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0007 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0008
     * @tc.name      g3dVectorVec0008
     * @tc.desc      向量 (1,1,1) 与 (0,10,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0008 begin');
      const crossX: number = 1 * 0 - 1 * 10;
      const crossY: number = 1 * 0 - 1 * 0;
      const crossZ: number = 1 * 10 - 1 * 0;
      const dotA: number = crossX * 1 + crossY * 1 + crossZ * 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-10);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(10);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0008 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0009
     * @tc.name      g3dVectorVec0009
     * @tc.desc      向量 (-1,-1,-1) 与 (0,0,10) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0009 begin');
      const dot: number = -1 * 0 + -1 * 0 + -1 * 10;
      const length: number = Math.sqrt(1 + 1 + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-10);
      expect(length.toFixed(3)).assertEqual('1.732');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0009 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0010
     * @tc.name      g3dVectorVec0010
     * @tc.desc      向量 (-1,-1,-1) 与 (0,0,10) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0010 begin');
      const crossX: number = -1 * 10 - -1 * 0;
      const crossY: number = -1 * 0 - -1 * 10;
      const crossZ: number = -1 * 0 - -1 * 0;
      const dotA: number = crossX * -1 + crossY * -1 + crossZ * -1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-10);
      expect(crossY).assertEqual(10);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0010 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0011
     * @tc.name      g3dVectorVec0011
     * @tc.desc      向量 (3,4,0) 与 (0.5,0.5,0.5) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0011 begin');
      const dot: number = 3 * 0.5 + 4 * 0.5 + 0 * 0.5;
      const length: number = Math.sqrt(9 + 16 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(3.5);
      expect(length.toFixed(3)).assertEqual('5.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0011 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0012
     * @tc.name      g3dVectorVec0012
     * @tc.desc      向量 (3,4,0) 与 (0.5,0.5,0.5) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0012 begin');
      const crossX: number = 4 * 0.5 - 0 * 0.5;
      const crossY: number = 0 * 0.5 - 3 * 0.5;
      const crossZ: number = 3 * 0.5 - 4 * 0.5;
      const dotA: number = crossX * 3 + crossY * 4 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(2);
      expect(crossY).assertEqual(-1.5);
      expect(crossZ).assertEqual(-0.5);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0012 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0013
     * @tc.name      g3dVectorVec0013
     * @tc.desc      向量 (0,3,4) 与 (-0.5,0.25,0.75) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0013 begin');
      const dot: number = 0 * -0.5 + 3 * 0.25 + 4 * 0.75;
      const length: number = Math.sqrt(0 + 9 + 16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(3.75);
      expect(length.toFixed(3)).assertEqual('5.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0013 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0014
     * @tc.name      g3dVectorVec0014
     * @tc.desc      向量 (0,3,4) 与 (-0.5,0.25,0.75) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0014 begin');
      const crossX: number = 3 * 0.75 - 4 * 0.25;
      const crossY: number = 4 * -0.5 - 0 * 0.75;
      const crossZ: number = 0 * 0.25 - 3 * -0.5;
      const dotA: number = crossX * 0 + crossY * 3 + crossZ * 4;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(1.25);
      expect(crossY).assertEqual(-2);
      expect(crossZ).assertEqual(1.5);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0014 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0015
     * @tc.name      g3dVectorVec0015
     * @tc.desc      向量 (-3,4,0) 与 (100,200,300) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0015 begin');
      const dot: number = -3 * 100 + 4 * 200 + 0 * 300;
      const length: number = Math.sqrt(9 + 16 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(500);
      expect(length.toFixed(3)).assertEqual('5.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0015 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0016
     * @tc.name      g3dVectorVec0016
     * @tc.desc      向量 (-3,4,0) 与 (100,200,300) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0016 begin');
      const crossX: number = 4 * 300 - 0 * 200;
      const crossY: number = 0 * 100 - -3 * 300;
      const crossZ: number = -3 * 200 - 4 * 100;
      const dotA: number = crossX * -3 + crossY * 4 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(1200);
      expect(crossY).assertEqual(900);
      expect(crossZ).assertEqual(-1000);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0016 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0017
     * @tc.name      g3dVectorVec0017
     * @tc.desc      向量 (2,-3,6) 与 (-100,-200,-300) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0017 begin');
      const dot: number = 2 * -100 + -3 * -200 + 6 * -300;
      const length: number = Math.sqrt(4 + 9 + 36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-1400);
      expect(length.toFixed(3)).assertEqual('7.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0017 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0018
     * @tc.name      g3dVectorVec0018
     * @tc.desc      向量 (2,-3,6) 与 (-100,-200,-300) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0018 begin');
      const crossX: number = -3 * -300 - 6 * -200;
      const crossY: number = 6 * -100 - 2 * -300;
      const crossZ: number = 2 * -200 - -3 * -100;
      const dotA: number = crossX * 2 + crossY * -3 + crossZ * 6;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(2100);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(-700);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0018 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0019
     * @tc.name      g3dVectorVec0019
     * @tc.desc      向量 (10,0,0) 与 (7,7,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0019 begin');
      const dot: number = 10 * 7 + 0 * 7 + 0 * 0;
      const length: number = Math.sqrt(100 + 0 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(70);
      expect(length.toFixed(3)).assertEqual('10.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0019 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0020
     * @tc.name      g3dVectorVec0020
     * @tc.desc      向量 (10,0,0) 与 (7,7,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0020 begin');
      const crossX: number = 0 * 0 - 0 * 7;
      const crossY: number = 0 * 7 - 10 * 0;
      const crossZ: number = 10 * 7 - 0 * 7;
      const dotA: number = crossX * 10 + crossY * 0 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(70);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0020 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0021
     * @tc.name      g3dVectorVec0021
     * @tc.desc      向量 (0,10,0) 与 (0,7,7) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0021 begin');
      const dot: number = 0 * 0 + 10 * 7 + 0 * 7;
      const length: number = Math.sqrt(0 + 100 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(70);
      expect(length.toFixed(3)).assertEqual('10.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0021 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0022
     * @tc.name      g3dVectorVec0022
     * @tc.desc      向量 (0,10,0) 与 (0,7,7) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0022 begin');
      const crossX: number = 10 * 7 - 0 * 7;
      const crossY: number = 0 * 0 - 0 * 7;
      const crossZ: number = 0 * 7 - 10 * 0;
      const dotA: number = crossX * 0 + crossY * 10 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(70);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0022 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0023
     * @tc.name      g3dVectorVec0023
     * @tc.desc      向量 (0,0,10) 与 (1,2,3) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0023 begin');
      const dot: number = 0 * 1 + 0 * 2 + 10 * 3;
      const length: number = Math.sqrt(0 + 0 + 100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(30);
      expect(length.toFixed(3)).assertEqual('10.000');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0023 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0024
     * @tc.name      g3dVectorVec0024
     * @tc.desc      向量 (0,0,10) 与 (1,2,3) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0024 begin');
      const crossX: number = 0 * 3 - 10 * 2;
      const crossY: number = 10 * 1 - 0 * 3;
      const crossZ: number = 0 * 2 - 0 * 1;
      const dotA: number = crossX * 0 + crossY * 0 + crossZ * 10;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-20);
      expect(crossY).assertEqual(10);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0024 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0025
     * @tc.name      g3dVectorVec0025
     * @tc.desc      向量 (0.5,0.5,0.5) 与 (4,5,6) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0025 begin');
      const dot: number = 0.5 * 4 + 0.5 * 5 + 0.5 * 6;
      const length: number = Math.sqrt(0.25 + 0.25 + 0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(7.5);
      expect(length.toFixed(3)).assertEqual('0.866');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0025 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0026
     * @tc.name      g3dVectorVec0026
     * @tc.desc      向量 (0.5,0.5,0.5) 与 (4,5,6) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0026 begin');
      const crossX: number = 0.5 * 6 - 0.5 * 5;
      const crossY: number = 0.5 * 4 - 0.5 * 6;
      const crossZ: number = 0.5 * 5 - 0.5 * 4;
      const dotA: number = crossX * 0.5 + crossY * 0.5 + crossZ * 0.5;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0.5);
      expect(crossY).assertEqual(-1);
      expect(crossZ).assertEqual(0.5);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0026 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0027
     * @tc.name      g3dVectorVec0027
     * @tc.desc      向量 (-0.5,0.25,0.75) 与 (1,0,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0027 begin');
      const dot: number = -0.5 * 1 + 0.25 * 0 + 0.75 * 0;
      const length: number = Math.sqrt(0.25 + 0.0625 + 0.5625);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-0.5);
      expect(length.toFixed(3)).assertEqual('0.935');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0027 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0028
     * @tc.name      g3dVectorVec0028
     * @tc.desc      向量 (-0.5,0.25,0.75) 与 (1,0,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0028 begin');
      const crossX: number = 0.25 * 0 - 0.75 * 0;
      const crossY: number = 0.75 * 1 - -0.5 * 0;
      const crossZ: number = -0.5 * 0 - 0.25 * 1;
      const dotA: number = crossX * -0.5 + crossY * 0.25 + crossZ * 0.75;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0);
      expect(crossY).assertEqual(0.75);
      expect(crossZ).assertEqual(-0.25);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0028 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0029
     * @tc.name      g3dVectorVec0029
     * @tc.desc      向量 (100,200,300) 与 (0,1,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0029 begin');
      const dot: number = 100 * 0 + 200 * 1 + 300 * 0;
      const length: number = Math.sqrt(10000 + 40000 + 90000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(200);
      expect(length.toFixed(3)).assertEqual('374.166');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0029 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0030
     * @tc.name      g3dVectorVec0030
     * @tc.desc      向量 (100,200,300) 与 (0,1,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0030 begin');
      const crossX: number = 200 * 0 - 300 * 1;
      const crossY: number = 300 * 0 - 100 * 0;
      const crossZ: number = 100 * 1 - 200 * 0;
      const dotA: number = crossX * 100 + crossY * 200 + crossZ * 300;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-300);
      expect(crossY).assertEqual(0);
      expect(crossZ).assertEqual(100);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0030 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0031
     * @tc.name      g3dVectorVec0031
     * @tc.desc      向量 (-100,-200,-300) 与 (0,0,1) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0031 begin');
      const dot: number = -100 * 0 + -200 * 0 + -300 * 1;
      const length: number = Math.sqrt(10000 + 40000 + 90000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-300);
      expect(length.toFixed(3)).assertEqual('374.166');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0031 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0032
     * @tc.name      g3dVectorVec0032
     * @tc.desc      向量 (-100,-200,-300) 与 (0,0,1) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0032 begin');
      const crossX: number = -200 * 1 - -300 * 0;
      const crossY: number = -300 * 0 - -100 * 1;
      const crossZ: number = -100 * 0 - -200 * 0;
      const dotA: number = crossX * -100 + crossY * -200 + crossZ * -300;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-200);
      expect(crossY).assertEqual(100);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0032 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0033
     * @tc.name      g3dVectorVec0033
     * @tc.desc      向量 (7,7,0) 与 (1,1,1) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0033 begin');
      const dot: number = 7 * 1 + 7 * 1 + 0 * 1;
      const length: number = Math.sqrt(49 + 49 + 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(14);
      expect(length.toFixed(3)).assertEqual('9.899');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0033 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0034
     * @tc.name      g3dVectorVec0034
     * @tc.desc      向量 (7,7,0) 与 (1,1,1) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0034 begin');
      const crossX: number = 7 * 1 - 0 * 1;
      const crossY: number = 0 * 1 - 7 * 1;
      const crossZ: number = 7 * 1 - 7 * 1;
      const dotA: number = crossX * 7 + crossY * 7 + crossZ * 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(7);
      expect(crossY).assertEqual(-7);
      expect(crossZ).assertEqual(0);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0034 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0035
     * @tc.name      g3dVectorVec0035
     * @tc.desc      向量 (0,7,7) 与 (-1,-1,-1) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0035 begin');
      const dot: number = 0 * -1 + 7 * -1 + 7 * -1;
      const length: number = Math.sqrt(0 + 49 + 49);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(-14);
      expect(length.toFixed(3)).assertEqual('9.899');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0035 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0036
     * @tc.name      g3dVectorVec0036
     * @tc.desc      向量 (0,7,7) 与 (-1,-1,-1) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0036 begin');
      const crossX: number = 7 * -1 - 7 * -1;
      const crossY: number = 7 * -1 - 0 * -1;
      const crossZ: number = 0 * -1 - 7 * -1;
      const dotA: number = crossX * 0 + crossY * 7 + crossZ * 7;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(0);
      expect(crossY).assertEqual(-7);
      expect(crossZ).assertEqual(7);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0036 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0037
     * @tc.name      g3dVectorVec0037
     * @tc.desc      向量 (1,2,3) 与 (3,4,0) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0037 begin');
      const dot: number = 1 * 3 + 2 * 4 + 3 * 0;
      const length: number = Math.sqrt(1 + 4 + 9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(11);
      expect(length.toFixed(3)).assertEqual('3.742');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0037 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0038
     * @tc.name      g3dVectorVec0038
     * @tc.desc      向量 (1,2,3) 与 (3,4,0) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0038 begin');
      const crossX: number = 2 * 0 - 3 * 4;
      const crossY: number = 3 * 3 - 1 * 0;
      const crossZ: number = 1 * 4 - 2 * 3;
      const dotA: number = crossX * 1 + crossY * 2 + crossZ * 3;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(-12);
      expect(crossY).assertEqual(9);
      expect(crossZ).assertEqual(-2);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0038 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0039
     * @tc.name      g3dVectorVec0039
     * @tc.desc      向量 (4,5,6) 与 (0,3,4) 点积与模长推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0039 begin');
      const dot: number = 4 * 0 + 5 * 3 + 6 * 4;
      const length: number = Math.sqrt(16 + 25 + 36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'dot=' + dot + ' len=' + length.toFixed(3));
      expect(dot).assertEqual(39);
      expect(length.toFixed(3)).assertEqual('8.775');
      expect(length >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0039 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0040
     * @tc.name      g3dVectorVec0040
     * @tc.desc      向量 (4,5,6) 与 (0,3,4) 叉积正交性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0040 begin');
      const crossX: number = 5 * 4 - 6 * 3;
      const crossY: number = 6 * 0 - 4 * 4;
      const crossZ: number = 4 * 3 - 5 * 0;
      const dotA: number = crossX * 4 + crossY * 5 + crossZ * 6;
      hilog.info(DOMAIN, TAG, '%{public}s', 'crossZ=' + crossZ + ' dotA=' + dotA);
      expect(crossX).assertEqual(2);
      expect(crossY).assertEqual(-16);
      expect(crossZ).assertEqual(12);
      expect(dotA).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0040 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0041
     * @tc.name      g3dVectorVec0041
     * @tc.desc      绕 Z 轴旋转 0 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0041 begin');
      const rad: number = 0 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('1.000');
      expect(sinValue.toFixed(3)).assertEqual('0.000');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0041 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0042
     * @tc.name      g3dVectorVec0042
     * @tc.desc      绕 Z 轴旋转 15 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0042 begin');
      const rad: number = 15 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.966');
      expect(sinValue.toFixed(3)).assertEqual('0.259');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0042 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0043
     * @tc.name      g3dVectorVec0043
     * @tc.desc      绕 Z 轴旋转 30 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0043 begin');
      const rad: number = 30 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.866');
      expect(sinValue.toFixed(3)).assertEqual('0.500');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0043 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0044
     * @tc.name      g3dVectorVec0044
     * @tc.desc      绕 Z 轴旋转 45 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0044 begin');
      const rad: number = 45 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.707');
      expect(sinValue.toFixed(3)).assertEqual('0.707');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0044 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0045
     * @tc.name      g3dVectorVec0045
     * @tc.desc      绕 Z 轴旋转 60 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0045 begin');
      const rad: number = 60 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.500');
      expect(sinValue.toFixed(3)).assertEqual('0.866');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0045 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0046
     * @tc.name      g3dVectorVec0046
     * @tc.desc      绕 Z 轴旋转 90 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0046 begin');
      const rad: number = 90 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.000');
      expect(sinValue.toFixed(3)).assertEqual('1.000');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0046 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0047
     * @tc.name      g3dVectorVec0047
     * @tc.desc      绕 Z 轴旋转 120 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0047 begin');
      const rad: number = 120 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('-0.500');
      expect(sinValue.toFixed(3)).assertEqual('0.866');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0047 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0048
     * @tc.name      g3dVectorVec0048
     * @tc.desc      绕 Z 轴旋转 135 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0048 begin');
      const rad: number = 135 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('-0.707');
      expect(sinValue.toFixed(3)).assertEqual('0.707');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0048 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0049
     * @tc.name      g3dVectorVec0049
     * @tc.desc      绕 Z 轴旋转 180 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0049 begin');
      const rad: number = 180 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('-1.000');
      expect(sinValue.toFixed(3)).assertEqual('0.000');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0049 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0050
     * @tc.name      g3dVectorVec0050
     * @tc.desc      绕 Z 轴旋转 225 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0050 begin');
      const rad: number = 225 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('-0.707');
      expect(sinValue.toFixed(3)).assertEqual('-0.707');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0050 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0051
     * @tc.name      g3dVectorVec0051
     * @tc.desc      绕 Z 轴旋转 270 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0051 begin');
      const rad: number = 270 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('-0.000');
      expect(sinValue.toFixed(3)).assertEqual('-1.000');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0051 end');
    })

    /**
     * @tc.number    G3D_VECTOR_0052
     * @tc.name      g3dVectorVec0052
     * @tc.desc      绕 Z 轴旋转 315 度的单位向量三角函数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dVectorVec0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0052 begin');
      const rad: number = 315 * Math.PI / 180;
      const cosValue: number = Math.cos(rad);
      const sinValue: number = Math.sin(rad);
      const squareSum: number = cosValue * cosValue + sinValue * sinValue;
      hilog.info(DOMAIN, TAG, '%{public}s', 'cos=' + cosValue.toFixed(3));
      expect(cosValue.toFixed(3)).assertEqual('0.707');
      expect(sinValue.toFixed(3)).assertEqual('-0.707');
      expect(Math.abs(squareSum - 1) < 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dVectorVec0052 end');
    })
  })
}
