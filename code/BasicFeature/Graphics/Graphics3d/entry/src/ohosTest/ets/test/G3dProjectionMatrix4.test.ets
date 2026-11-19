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

export default function g3dProjectionMatrix4Test(): void {
  describe('G3dProjectionMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_PROJECTION_0223
     * @tc.name      g3dProjection0223
     * @tc.desc      视场角 110 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0223 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0223 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0224
     * @tc.name      g3dProjection0224
     * @tc.desc      视场角 110 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0224 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0224 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0225
     * @tc.name      g3dProjection0225
     * @tc.desc      视场角 110 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0225 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0225 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0226
     * @tc.name      g3dProjection0226
     * @tc.desc      视场角 110 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0226 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0226 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0227
     * @tc.name      g3dProjection0227
     * @tc.desc      视场角 110 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0227 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0227 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0228
     * @tc.name      g3dProjection0228
     * @tc.desc      视场角 110 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0228 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5713');
      expect(width.toFixed(4)).assertEqual('1.0156');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0228 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0229
     * @tc.name      g3dProjection0229
     * @tc.desc      视场角 110 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0229 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0229 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0230
     * @tc.name      g3dProjection0230
     * @tc.desc      视场角 110 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0230 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0230 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0231
     * @tc.name      g3dProjection0231
     * @tc.desc      视场角 110 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0231 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0231 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0232
     * @tc.name      g3dProjection0232
     * @tc.desc      视场角 110 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0232 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0232 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0233
     * @tc.name      g3dProjection0233
     * @tc.desc      视场角 110 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0233 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0233 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0234
     * @tc.name      g3dProjection0234
     * @tc.desc      视场角 110 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0234 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.4281');
      expect(width.toFixed(4)).assertEqual('2.5389');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0234 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0235
     * @tc.name      g3dProjection0235
     * @tc.desc      视场角 110 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0235 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0235 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0236
     * @tc.name      g3dProjection0236
     * @tc.desc      视场角 110 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0236 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0236 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0237
     * @tc.name      g3dProjection0237
     * @tc.desc      视场角 110 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0237 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0237 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0238
     * @tc.name      g3dProjection0238
     * @tc.desc      视场角 110 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0238 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0238 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0239
     * @tc.name      g3dProjection0239
     * @tc.desc      视场角 110 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0239 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0239 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0240
     * @tc.name      g3dProjection0240
     * @tc.desc      视场角 110 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0240 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.8563');
      expect(width.toFixed(4)).assertEqual('5.0779');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0240 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0241
     * @tc.name      g3dProjection0241
     * @tc.desc      视场角 110 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0241 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0241 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0242
     * @tc.name      g3dProjection0242
     * @tc.desc      视场角 110 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0242 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0242 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0243
     * @tc.name      g3dProjection0243
     * @tc.desc      视场角 110 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0243 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0243 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0244
     * @tc.name      g3dProjection0244
     * @tc.desc      视场角 110 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0244 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0244 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0245
     * @tc.name      g3dProjection0245
     * @tc.desc      视场角 110 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0245 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0245 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0246
     * @tc.name      g3dProjection0246
     * @tc.desc      视场角 110 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0246 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7126');
      expect(width.toFixed(4)).assertEqual('10.1557');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0246 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0247
     * @tc.name      g3dProjection0247
     * @tc.desc      视场角 110 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0247 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0247 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0248
     * @tc.name      g3dProjection0248
     * @tc.desc      视场角 110 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0248 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0248 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0249
     * @tc.name      g3dProjection0249
     * @tc.desc      视场角 110 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0249 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0249 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0250
     * @tc.name      g3dProjection0250
     * @tc.desc      视场角 110 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0250 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0250 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0251
     * @tc.name      g3dProjection0251
     * @tc.desc      视场角 110 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0251 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0251 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0252
     * @tc.name      g3dProjection0252
     * @tc.desc      视场角 110 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0252 begin');
      const half: number = 110 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('14.2815');
      expect(width.toFixed(4)).assertEqual('25.3893');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0252 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0253
     * @tc.name      g3dProjection0253
     * @tc.desc      视场角 120 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0253 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0253 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0254
     * @tc.name      g3dProjection0254
     * @tc.desc      视场角 120 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0254 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0254 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0255
     * @tc.name      g3dProjection0255
     * @tc.desc      视场角 120 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0255 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0255 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0256
     * @tc.name      g3dProjection0256
     * @tc.desc      视场角 120 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0256 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0256 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0257
     * @tc.name      g3dProjection0257
     * @tc.desc      视场角 120 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0257 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0257 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0258
     * @tc.name      g3dProjection0258
     * @tc.desc      视场角 120 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0258 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3464');
      expect(width.toFixed(4)).assertEqual('0.6158');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0258 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0259
     * @tc.name      g3dProjection0259
     * @tc.desc      视场角 120 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0259 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0259 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0260
     * @tc.name      g3dProjection0260
     * @tc.desc      视场角 120 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0260 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0260 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0261
     * @tc.name      g3dProjection0261
     * @tc.desc      视场角 120 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0261 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0261 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0262
     * @tc.name      g3dProjection0262
     * @tc.desc      视场角 120 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0262 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0262 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0263
     * @tc.name      g3dProjection0263
     * @tc.desc      视场角 120 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0263 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0263 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0264
     * @tc.name      g3dProjection0264
     * @tc.desc      视场角 120 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0264 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.6928');
      expect(width.toFixed(4)).assertEqual('1.2317');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0264 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0265
     * @tc.name      g3dProjection0265
     * @tc.desc      视场角 120 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0265 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0265 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0266
     * @tc.name      g3dProjection0266
     * @tc.desc      视场角 120 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0266 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0266 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0267
     * @tc.name      g3dProjection0267
     * @tc.desc      视场角 120 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0267 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0267 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0268
     * @tc.name      g3dProjection0268
     * @tc.desc      视场角 120 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0268 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0268 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0269
     * @tc.name      g3dProjection0269
     * @tc.desc      视场角 120 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0269 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0269 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0270
     * @tc.name      g3dProjection0270
     * @tc.desc      视场角 120 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0270 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.7321');
      expect(width.toFixed(4)).assertEqual('3.0792');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0270 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0271
     * @tc.name      g3dProjection0271
     * @tc.desc      视场角 120 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0271 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0271 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0272
     * @tc.name      g3dProjection0272
     * @tc.desc      视场角 120 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0272 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0272 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0273
     * @tc.name      g3dProjection0273
     * @tc.desc      视场角 120 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0273 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0273 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0274
     * @tc.name      g3dProjection0274
     * @tc.desc      视场角 120 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0274 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0274 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0275
     * @tc.name      g3dProjection0275
     * @tc.desc      视场角 120 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0275 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0275 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0276
     * @tc.name      g3dProjection0276
     * @tc.desc      视场角 120 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0276 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.4641');
      expect(width.toFixed(4)).assertEqual('6.1584');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0276 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0277
     * @tc.name      g3dProjection0277
     * @tc.desc      视场角 120 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0277 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0277 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0278
     * @tc.name      g3dProjection0278
     * @tc.desc      视场角 120 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0278 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0278 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0279
     * @tc.name      g3dProjection0279
     * @tc.desc      视场角 120 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0279 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0279 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0280
     * @tc.name      g3dProjection0280
     * @tc.desc      视场角 120 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0280 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0280 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0281
     * @tc.name      g3dProjection0281
     * @tc.desc      视场角 120 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0281 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0281 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0282
     * @tc.name      g3dProjection0282
     * @tc.desc      视场角 120 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0282 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('6.9282');
      expect(width.toFixed(4)).assertEqual('12.3168');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0282 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0283
     * @tc.name      g3dProjection0283
     * @tc.desc      视场角 120 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0283 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0283 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0284
     * @tc.name      g3dProjection0284
     * @tc.desc      视场角 120 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0284 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0284 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0285
     * @tc.name      g3dProjection0285
     * @tc.desc      视场角 120 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0285 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0285 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0286
     * @tc.name      g3dProjection0286
     * @tc.desc      视场角 120 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0286 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0286 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0287
     * @tc.name      g3dProjection0287
     * @tc.desc      视场角 120 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0287 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0287 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0288
     * @tc.name      g3dProjection0288
     * @tc.desc      视场角 120 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0288 begin');
      const half: number = 120 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('17.3205');
      expect(width.toFixed(4)).assertEqual('30.7920');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0288 end');
    })
  })
}
