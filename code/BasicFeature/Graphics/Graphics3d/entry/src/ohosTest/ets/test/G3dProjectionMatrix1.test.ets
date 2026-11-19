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

export default function g3dProjectionMatrix1Test(): void {
  describe('G3dProjectionMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_PROJECTION_0001
     * @tc.name      g3dProjection0001
     * @tc.desc      视场角 30 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0001 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0001 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0002
     * @tc.name      g3dProjection0002
     * @tc.desc      视场角 30 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0002 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0002 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0003
     * @tc.name      g3dProjection0003
     * @tc.desc      视场角 30 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0003 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0003 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0004
     * @tc.name      g3dProjection0004
     * @tc.desc      视场角 30 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0004 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0004 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0005
     * @tc.name      g3dProjection0005
     * @tc.desc      视场角 30 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0005 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0005 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0006
     * @tc.name      g3dProjection0006
     * @tc.desc      视场角 30 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0006 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0536');
      expect(width.toFixed(4)).assertEqual('0.0953');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0006 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0007
     * @tc.name      g3dProjection0007
     * @tc.desc      视场角 30 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0007 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0007 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0008
     * @tc.name      g3dProjection0008
     * @tc.desc      视场角 30 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0008 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0008 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0009
     * @tc.name      g3dProjection0009
     * @tc.desc      视场角 30 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0009 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0009 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0010
     * @tc.name      g3dProjection0010
     * @tc.desc      视场角 30 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0010 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0010 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0011
     * @tc.name      g3dProjection0011
     * @tc.desc      视场角 30 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0011 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0011 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0012
     * @tc.name      g3dProjection0012
     * @tc.desc      视场角 30 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0012 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1072');
      expect(width.toFixed(4)).assertEqual('0.1905');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0012 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0013
     * @tc.name      g3dProjection0013
     * @tc.desc      视场角 30 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0013 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0013 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0014
     * @tc.name      g3dProjection0014
     * @tc.desc      视场角 30 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0014 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0014 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0015
     * @tc.name      g3dProjection0015
     * @tc.desc      视场角 30 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0015 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0015 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0016
     * @tc.name      g3dProjection0016
     * @tc.desc      视场角 30 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0016 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0016 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0017
     * @tc.name      g3dProjection0017
     * @tc.desc      视场角 30 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0017 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0017 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0018
     * @tc.name      g3dProjection0018
     * @tc.desc      视场角 30 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0018 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2679');
      expect(width.toFixed(4)).assertEqual('0.4764');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0018 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0019
     * @tc.name      g3dProjection0019
     * @tc.desc      视场角 30 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0019 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0019 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0020
     * @tc.name      g3dProjection0020
     * @tc.desc      视场角 30 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0020 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0020 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0021
     * @tc.name      g3dProjection0021
     * @tc.desc      视场角 30 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0021 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0021 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0022
     * @tc.name      g3dProjection0022
     * @tc.desc      视场角 30 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0022 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0022 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0023
     * @tc.name      g3dProjection0023
     * @tc.desc      视场角 30 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0023 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0023 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0024
     * @tc.name      g3dProjection0024
     * @tc.desc      视场角 30 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0024 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5359');
      expect(width.toFixed(4)).assertEqual('0.9527');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0024 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0025
     * @tc.name      g3dProjection0025
     * @tc.desc      视场角 30 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0025 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0025 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0026
     * @tc.name      g3dProjection0026
     * @tc.desc      视场角 30 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0026 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0026 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0027
     * @tc.name      g3dProjection0027
     * @tc.desc      视场角 30 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0027 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0027 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0028
     * @tc.name      g3dProjection0028
     * @tc.desc      视场角 30 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0028 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0028 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0029
     * @tc.name      g3dProjection0029
     * @tc.desc      视场角 30 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0029 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0029 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0030
     * @tc.name      g3dProjection0030
     * @tc.desc      视场角 30 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0030 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0718');
      expect(width.toFixed(4)).assertEqual('1.9054');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0030 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0031
     * @tc.name      g3dProjection0031
     * @tc.desc      视场角 30 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0031 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0031 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0032
     * @tc.name      g3dProjection0032
     * @tc.desc      视场角 30 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0032 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0032 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0033
     * @tc.name      g3dProjection0033
     * @tc.desc      视场角 30 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0033 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0033 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0034
     * @tc.name      g3dProjection0034
     * @tc.desc      视场角 30 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0034 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0034 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0035
     * @tc.name      g3dProjection0035
     * @tc.desc      视场角 30 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0035 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0035 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0036
     * @tc.name      g3dProjection0036
     * @tc.desc      视场角 30 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0036 begin');
      const half: number = 30 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.6795');
      expect(width.toFixed(4)).assertEqual('4.7635');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0036 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0037
     * @tc.name      g3dProjection0037
     * @tc.desc      视场角 45 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0037 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0037 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0038
     * @tc.name      g3dProjection0038
     * @tc.desc      视场角 45 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0038 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0038 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0039
     * @tc.name      g3dProjection0039
     * @tc.desc      视场角 45 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0039 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0039 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0040
     * @tc.name      g3dProjection0040
     * @tc.desc      视场角 45 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0040 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0040 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0041
     * @tc.name      g3dProjection0041
     * @tc.desc      视场角 45 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0041 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0041 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0042
     * @tc.name      g3dProjection0042
     * @tc.desc      视场角 45 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0042 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.0828');
      expect(width.toFixed(4)).assertEqual('0.1473');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0042 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0043
     * @tc.name      g3dProjection0043
     * @tc.desc      视场角 45 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0043 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0043 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0044
     * @tc.name      g3dProjection0044
     * @tc.desc      视场角 45 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0044 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0044 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0045
     * @tc.name      g3dProjection0045
     * @tc.desc      视场角 45 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0045 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0045 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0046
     * @tc.name      g3dProjection0046
     * @tc.desc      视场角 45 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0046 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0046 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0047
     * @tc.name      g3dProjection0047
     * @tc.desc      视场角 45 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0047 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0047 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0048
     * @tc.name      g3dProjection0048
     * @tc.desc      视场角 45 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0048 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1657');
      expect(width.toFixed(4)).assertEqual('0.2946');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0048 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0049
     * @tc.name      g3dProjection0049
     * @tc.desc      视场角 45 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0049 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0049 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0050
     * @tc.name      g3dProjection0050
     * @tc.desc      视场角 45 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0050 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0050 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0051
     * @tc.name      g3dProjection0051
     * @tc.desc      视场角 45 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0051 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0051 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0052
     * @tc.name      g3dProjection0052
     * @tc.desc      视场角 45 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0052 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0052 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0053
     * @tc.name      g3dProjection0053
     * @tc.desc      视场角 45 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0053 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0053 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0054
     * @tc.name      g3dProjection0054
     * @tc.desc      视场角 45 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0054 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4142');
      expect(width.toFixed(4)).assertEqual('0.7364');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0054 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0055
     * @tc.name      g3dProjection0055
     * @tc.desc      视场角 45 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0055 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0055 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0056
     * @tc.name      g3dProjection0056
     * @tc.desc      视场角 45 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0056 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0056 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0057
     * @tc.name      g3dProjection0057
     * @tc.desc      视场角 45 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0057 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0057 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0058
     * @tc.name      g3dProjection0058
     * @tc.desc      视场角 45 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0058 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0058 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0059
     * @tc.name      g3dProjection0059
     * @tc.desc      视场角 45 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0059 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0059 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0060
     * @tc.name      g3dProjection0060
     * @tc.desc      视场角 45 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0060 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.8284');
      expect(width.toFixed(4)).assertEqual('1.4728');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0060 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0061
     * @tc.name      g3dProjection0061
     * @tc.desc      视场角 45 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0061 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0061 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0062
     * @tc.name      g3dProjection0062
     * @tc.desc      视场角 45 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0062 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0062 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0063
     * @tc.name      g3dProjection0063
     * @tc.desc      视场角 45 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0063 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0063 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0064
     * @tc.name      g3dProjection0064
     * @tc.desc      视场角 45 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0064 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0064 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0065
     * @tc.name      g3dProjection0065
     * @tc.desc      视场角 45 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0065 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0065 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0066
     * @tc.name      g3dProjection0066
     * @tc.desc      视场角 45 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0066 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.6569');
      expect(width.toFixed(4)).assertEqual('2.9455');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0066 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0067
     * @tc.name      g3dProjection0067
     * @tc.desc      视场角 45 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0067 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0067 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0068
     * @tc.name      g3dProjection0068
     * @tc.desc      视场角 45 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0068 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0068 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0069
     * @tc.name      g3dProjection0069
     * @tc.desc      视场角 45 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0069 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0069 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0070
     * @tc.name      g3dProjection0070
     * @tc.desc      视场角 45 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0070 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0070 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0071
     * @tc.name      g3dProjection0071
     * @tc.desc      视场角 45 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0071 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0071 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0072
     * @tc.name      g3dProjection0072
     * @tc.desc      视场角 45 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0072 begin');
      const half: number = 45 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.1421');
      expect(width.toFixed(4)).assertEqual('7.3638');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0072 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0073
     * @tc.name      g3dProjection0073
     * @tc.desc      视场角 60 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0073 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0073 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0074
     * @tc.name      g3dProjection0074
     * @tc.desc      视场角 60 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0074 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0074 end');
    })
  })
}
