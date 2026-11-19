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

export default function g3dProjectionMatrix3Test(): void {
  describe('G3dProjectionMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_PROJECTION_0149
     * @tc.name      g3dProjection0149
     * @tc.desc      视场角 90 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0149 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0149 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0150
     * @tc.name      g3dProjection0150
     * @tc.desc      视场角 90 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0150 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0150 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0151
     * @tc.name      g3dProjection0151
     * @tc.desc      视场角 90 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0151 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0151 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0152
     * @tc.name      g3dProjection0152
     * @tc.desc      视场角 90 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0152 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0152 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0153
     * @tc.name      g3dProjection0153
     * @tc.desc      视场角 90 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0153 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0153 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0154
     * @tc.name      g3dProjection0154
     * @tc.desc      视场角 90 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0154 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0154 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0155
     * @tc.name      g3dProjection0155
     * @tc.desc      视场角 90 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0155 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0155 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0156
     * @tc.name      g3dProjection0156
     * @tc.desc      视场角 90 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0156 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4000');
      expect(width.toFixed(4)).assertEqual('0.7111');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0156 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0157
     * @tc.name      g3dProjection0157
     * @tc.desc      视场角 90 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0157 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0157 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0158
     * @tc.name      g3dProjection0158
     * @tc.desc      视场角 90 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0158 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0158 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0159
     * @tc.name      g3dProjection0159
     * @tc.desc      视场角 90 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0159 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0159 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0160
     * @tc.name      g3dProjection0160
     * @tc.desc      视场角 90 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0160 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0160 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0161
     * @tc.name      g3dProjection0161
     * @tc.desc      视场角 90 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0161 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0161 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0162
     * @tc.name      g3dProjection0162
     * @tc.desc      视场角 90 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0162 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.0000');
      expect(width.toFixed(4)).assertEqual('1.7778');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0162 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0163
     * @tc.name      g3dProjection0163
     * @tc.desc      视场角 90 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0163 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0163 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0164
     * @tc.name      g3dProjection0164
     * @tc.desc      视场角 90 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0164 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0164 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0165
     * @tc.name      g3dProjection0165
     * @tc.desc      视场角 90 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0165 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0165 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0166
     * @tc.name      g3dProjection0166
     * @tc.desc      视场角 90 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0166 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0166 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0167
     * @tc.name      g3dProjection0167
     * @tc.desc      视场角 90 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0167 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0167 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0168
     * @tc.name      g3dProjection0168
     * @tc.desc      视场角 90 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0168 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.0000');
      expect(width.toFixed(4)).assertEqual('3.5556');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0168 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0169
     * @tc.name      g3dProjection0169
     * @tc.desc      视场角 90 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0169 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0169 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0170
     * @tc.name      g3dProjection0170
     * @tc.desc      视场角 90 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0170 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0170 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0171
     * @tc.name      g3dProjection0171
     * @tc.desc      视场角 90 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0171 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0171 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0172
     * @tc.name      g3dProjection0172
     * @tc.desc      视场角 90 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0172 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0172 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0173
     * @tc.name      g3dProjection0173
     * @tc.desc      视场角 90 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0173 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0173 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0174
     * @tc.name      g3dProjection0174
     * @tc.desc      视场角 90 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0174 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.0000');
      expect(width.toFixed(4)).assertEqual('7.1111');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0174 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0175
     * @tc.name      g3dProjection0175
     * @tc.desc      视场角 90 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0175 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0175 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0176
     * @tc.name      g3dProjection0176
     * @tc.desc      视场角 90 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0176 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0176 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0177
     * @tc.name      g3dProjection0177
     * @tc.desc      视场角 90 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0177 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0177 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0178
     * @tc.name      g3dProjection0178
     * @tc.desc      视场角 90 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0178 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0178 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0179
     * @tc.name      g3dProjection0179
     * @tc.desc      视场角 90 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0179 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0179 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0180
     * @tc.name      g3dProjection0180
     * @tc.desc      视场角 90 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0180 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('10.0000');
      expect(width.toFixed(4)).assertEqual('17.7778');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0180 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0181
     * @tc.name      g3dProjection0181
     * @tc.desc      视场角 100 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0181 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0181 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0182
     * @tc.name      g3dProjection0182
     * @tc.desc      视场角 100 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0182 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0182 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0183
     * @tc.name      g3dProjection0183
     * @tc.desc      视场角 100 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0183 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0183 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0184
     * @tc.name      g3dProjection0184
     * @tc.desc      视场角 100 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0184 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0184 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0185
     * @tc.name      g3dProjection0185
     * @tc.desc      视场角 100 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0185 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0185 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0186
     * @tc.name      g3dProjection0186
     * @tc.desc      视场角 100 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0186 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2384');
      expect(width.toFixed(4)).assertEqual('0.4237');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0186 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0187
     * @tc.name      g3dProjection0187
     * @tc.desc      视场角 100 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0187 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0187 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0188
     * @tc.name      g3dProjection0188
     * @tc.desc      视场角 100 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0188 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0188 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0189
     * @tc.name      g3dProjection0189
     * @tc.desc      视场角 100 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0189 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0189 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0190
     * @tc.name      g3dProjection0190
     * @tc.desc      视场角 100 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0190 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0190 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0191
     * @tc.name      g3dProjection0191
     * @tc.desc      视场角 100 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0191 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0191 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0192
     * @tc.name      g3dProjection0192
     * @tc.desc      视场角 100 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0192 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.4767');
      expect(width.toFixed(4)).assertEqual('0.8475');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0192 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0193
     * @tc.name      g3dProjection0193
     * @tc.desc      视场角 100 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0193 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0193 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0194
     * @tc.name      g3dProjection0194
     * @tc.desc      视场角 100 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0194 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0194 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0195
     * @tc.name      g3dProjection0195
     * @tc.desc      视场角 100 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0195 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0195 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0196
     * @tc.name      g3dProjection0196
     * @tc.desc      视场角 100 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0196 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0196 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0197
     * @tc.name      g3dProjection0197
     * @tc.desc      视场角 100 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0197 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0197 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0198
     * @tc.name      g3dProjection0198
     * @tc.desc      视场角 100 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0198 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1918');
      expect(width.toFixed(4)).assertEqual('2.1187');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0198 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0199
     * @tc.name      g3dProjection0199
     * @tc.desc      视场角 100 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0199 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0199 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0200
     * @tc.name      g3dProjection0200
     * @tc.desc      视场角 100 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0200 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0200 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0201
     * @tc.name      g3dProjection0201
     * @tc.desc      视场角 100 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0201 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0201 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0202
     * @tc.name      g3dProjection0202
     * @tc.desc      视场角 100 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0202 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0202 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0203
     * @tc.name      g3dProjection0203
     * @tc.desc      视场角 100 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0203 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0203 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0204
     * @tc.name      g3dProjection0204
     * @tc.desc      视场角 100 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0204 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3835');
      expect(width.toFixed(4)).assertEqual('4.2373');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0204 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0205
     * @tc.name      g3dProjection0205
     * @tc.desc      视场角 100 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0205 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0205 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0206
     * @tc.name      g3dProjection0206
     * @tc.desc      视场角 100 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0206 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0206 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0207
     * @tc.name      g3dProjection0207
     * @tc.desc      视场角 100 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0207 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0207 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0208
     * @tc.name      g3dProjection0208
     * @tc.desc      视场角 100 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0208 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0208 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0209
     * @tc.name      g3dProjection0209
     * @tc.desc      视场角 100 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0209 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0209 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0210
     * @tc.name      g3dProjection0210
     * @tc.desc      视场角 100 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0210 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('4.7670');
      expect(width.toFixed(4)).assertEqual('8.4747');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0210 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0211
     * @tc.name      g3dProjection0211
     * @tc.desc      视场角 100 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0211 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0211 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0212
     * @tc.name      g3dProjection0212
     * @tc.desc      视场角 100 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0212 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0212 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0213
     * @tc.name      g3dProjection0213
     * @tc.desc      视场角 100 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0213 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0213 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0214
     * @tc.name      g3dProjection0214
     * @tc.desc      视场角 100 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0214 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0214 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0215
     * @tc.name      g3dProjection0215
     * @tc.desc      视场角 100 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0215 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0215 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0216
     * @tc.name      g3dProjection0216
     * @tc.desc      视场角 100 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0216 begin');
      const half: number = 100 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('11.9175');
      expect(width.toFixed(4)).assertEqual('21.1867');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0216 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0217
     * @tc.name      g3dProjection0217
     * @tc.desc      视场角 110 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0217 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0217 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0218
     * @tc.name      g3dProjection0218
     * @tc.desc      视场角 110 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0218 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0218 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0219
     * @tc.name      g3dProjection0219
     * @tc.desc      视场角 110 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0219 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0219 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0220
     * @tc.name      g3dProjection0220
     * @tc.desc      视场角 110 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0220 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0220 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0221
     * @tc.name      g3dProjection0221
     * @tc.desc      视场角 110 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0221 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0221 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0222
     * @tc.name      g3dProjection0222
     * @tc.desc      视场角 110 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0222 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2856');
      expect(width.toFixed(4)).assertEqual('0.5078');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0222 end');
    })
  })
}
