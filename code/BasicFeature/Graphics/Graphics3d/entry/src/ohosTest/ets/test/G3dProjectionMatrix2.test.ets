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

export default function g3dProjectionMatrix2Test(): void {
  describe('G3dProjectionMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_PROJECTION_0075
     * @tc.name      g3dProjection0075
     * @tc.desc      视场角 60 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0075 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0075 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0076
     * @tc.name      g3dProjection0076
     * @tc.desc      视场角 60 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0076 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0076 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0077
     * @tc.name      g3dProjection0077
     * @tc.desc      视场角 60 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0077 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0077 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0078
     * @tc.name      g3dProjection0078
     * @tc.desc      视场角 60 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0078 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1155');
      expect(width.toFixed(4)).assertEqual('0.2053');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0078 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0079
     * @tc.name      g3dProjection0079
     * @tc.desc      视场角 60 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0079 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0079 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0080
     * @tc.name      g3dProjection0080
     * @tc.desc      视场角 60 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0080 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0080 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0081
     * @tc.name      g3dProjection0081
     * @tc.desc      视场角 60 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0081 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0081 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0082
     * @tc.name      g3dProjection0082
     * @tc.desc      视场角 60 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0082 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0082 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0083
     * @tc.name      g3dProjection0083
     * @tc.desc      视场角 60 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0083 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0083 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0084
     * @tc.name      g3dProjection0084
     * @tc.desc      视场角 60 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0084 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2309');
      expect(width.toFixed(4)).assertEqual('0.4106');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0084 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0085
     * @tc.name      g3dProjection0085
     * @tc.desc      视场角 60 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0085 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0085 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0086
     * @tc.name      g3dProjection0086
     * @tc.desc      视场角 60 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0086 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0086 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0087
     * @tc.name      g3dProjection0087
     * @tc.desc      视场角 60 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0087 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0087 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0088
     * @tc.name      g3dProjection0088
     * @tc.desc      视场角 60 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0088 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0088 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0089
     * @tc.name      g3dProjection0089
     * @tc.desc      视场角 60 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0089 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0089 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0090
     * @tc.name      g3dProjection0090
     * @tc.desc      视场角 60 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0090 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.5774');
      expect(width.toFixed(4)).assertEqual('1.0264');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0090 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0091
     * @tc.name      g3dProjection0091
     * @tc.desc      视场角 60 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0091 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0091 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0092
     * @tc.name      g3dProjection0092
     * @tc.desc      视场角 60 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0092 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0092 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0093
     * @tc.name      g3dProjection0093
     * @tc.desc      视场角 60 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0093 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0093 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0094
     * @tc.name      g3dProjection0094
     * @tc.desc      视场角 60 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0094 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0094 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0095
     * @tc.name      g3dProjection0095
     * @tc.desc      视场角 60 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0095 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0095 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0096
     * @tc.name      g3dProjection0096
     * @tc.desc      视场角 60 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0096 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.1547');
      expect(width.toFixed(4)).assertEqual('2.0528');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0096 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0097
     * @tc.name      g3dProjection0097
     * @tc.desc      视场角 60 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0097 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0097 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0098
     * @tc.name      g3dProjection0098
     * @tc.desc      视场角 60 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0098 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0098 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0099
     * @tc.name      g3dProjection0099
     * @tc.desc      视场角 60 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0099 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0099 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0100
     * @tc.name      g3dProjection0100
     * @tc.desc      视场角 60 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0100 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0100 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0101
     * @tc.name      g3dProjection0101
     * @tc.desc      视场角 60 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0101 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0101 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0102
     * @tc.name      g3dProjection0102
     * @tc.desc      视场角 60 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0102 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('2.3094');
      expect(width.toFixed(4)).assertEqual('4.1056');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0102 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0103
     * @tc.name      g3dProjection0103
     * @tc.desc      视场角 60 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0103 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0103 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0104
     * @tc.name      g3dProjection0104
     * @tc.desc      视场角 60 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0104 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0104 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0105
     * @tc.name      g3dProjection0105
     * @tc.desc      视场角 60 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0105 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0105 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0106
     * @tc.name      g3dProjection0106
     * @tc.desc      视场角 60 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0106 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0106 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0107
     * @tc.name      g3dProjection0107
     * @tc.desc      视场角 60 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0107 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0107 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0108
     * @tc.name      g3dProjection0108
     * @tc.desc      视场角 60 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0108 begin');
      const half: number = 60 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('5.7735');
      expect(width.toFixed(4)).assertEqual('10.2640');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0108 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0109
     * @tc.name      g3dProjection0109
     * @tc.desc      视场角 75 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0109 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0109 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0110
     * @tc.name      g3dProjection0110
     * @tc.desc      视场角 75 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0110 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0110 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0111
     * @tc.name      g3dProjection0111
     * @tc.desc      视场角 75 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0111 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0111 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0112
     * @tc.name      g3dProjection0112
     * @tc.desc      视场角 75 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0112 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0112 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0113
     * @tc.name      g3dProjection0113
     * @tc.desc      视场角 75 度近平面 0.1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0113 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0113 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0114
     * @tc.name      g3dProjection0114
     * @tc.desc      视场角 75 度近平面 0.1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0114 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.1535');
      expect(width.toFixed(4)).assertEqual('0.2728');
      expect(ratio).assertEqual(20000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0114 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0115
     * @tc.name      g3dProjection0115
     * @tc.desc      视场角 75 度近平面 0.2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0115 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0115 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0116
     * @tc.name      g3dProjection0116
     * @tc.desc      视场角 75 度近平面 0.2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0116 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0116 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0117
     * @tc.name      g3dProjection0117
     * @tc.desc      视场角 75 度近平面 0.2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0117 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0117 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0118
     * @tc.name      g3dProjection0118
     * @tc.desc      视场角 75 度近平面 0.2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0118 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(2500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0118 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0119
     * @tc.name      g3dProjection0119
     * @tc.desc      视场角 75 度近平面 0.2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0119 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0119 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0120
     * @tc.name      g3dProjection0120
     * @tc.desc      视场角 75 度近平面 0.2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0120 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.3069');
      expect(width.toFixed(4)).assertEqual('0.5457');
      expect(ratio).assertEqual(10000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0120 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0121
     * @tc.name      g3dProjection0121
     * @tc.desc      视场角 75 度近平面 0.5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0121 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0121 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0122
     * @tc.name      g3dProjection0122
     * @tc.desc      视场角 75 度近平面 0.5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0122 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0122 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0123
     * @tc.name      g3dProjection0123
     * @tc.desc      视场角 75 度近平面 0.5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0123 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0123 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0124
     * @tc.name      g3dProjection0124
     * @tc.desc      视场角 75 度近平面 0.5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0124 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0124 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0125
     * @tc.name      g3dProjection0125
     * @tc.desc      视场角 75 度近平面 0.5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0125 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0125 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0126
     * @tc.name      g3dProjection0126
     * @tc.desc      视场角 75 度近平面 0.5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0126 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 0.5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.7673');
      expect(width.toFixed(4)).assertEqual('1.3641');
      expect(ratio).assertEqual(4000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0126 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0127
     * @tc.name      g3dProjection0127
     * @tc.desc      视场角 75 度近平面 1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0127 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0127 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0128
     * @tc.name      g3dProjection0128
     * @tc.desc      视场角 75 度近平面 1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0128 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0128 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0129
     * @tc.name      g3dProjection0129
     * @tc.desc      视场角 75 度近平面 1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0129 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0129 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0130
     * @tc.name      g3dProjection0130
     * @tc.desc      视场角 75 度近平面 1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0130 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0130 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0131
     * @tc.name      g3dProjection0131
     * @tc.desc      视场角 75 度近平面 1 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0131 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0131 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0132
     * @tc.name      g3dProjection0132
     * @tc.desc      视场角 75 度近平面 1 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0132 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 1;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('1.5347');
      expect(width.toFixed(4)).assertEqual('2.7283');
      expect(ratio).assertEqual(2000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0132 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0133
     * @tc.name      g3dProjection0133
     * @tc.desc      视场角 75 度近平面 2 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0133 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(5);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0133 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0134
     * @tc.name      g3dProjection0134
     * @tc.desc      视场角 75 度近平面 2 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0134 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(25);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0134 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0135
     * @tc.name      g3dProjection0135
     * @tc.desc      视场角 75 度近平面 2 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0135 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(50);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0135 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0136
     * @tc.name      g3dProjection0136
     * @tc.desc      视场角 75 度近平面 2 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0136 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(250);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0136 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0137
     * @tc.name      g3dProjection0137
     * @tc.desc      视场角 75 度近平面 2 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0137 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0137 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0138
     * @tc.name      g3dProjection0138
     * @tc.desc      视场角 75 度近平面 2 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0138 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 2;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('3.0693');
      expect(width.toFixed(4)).assertEqual('5.4565');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0138 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0139
     * @tc.name      g3dProjection0139
     * @tc.desc      视场角 75 度近平面 5 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0139 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(2);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0139 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0140
     * @tc.name      g3dProjection0140
     * @tc.desc      视场角 75 度近平面 5 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0140 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(10);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0140 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0141
     * @tc.name      g3dProjection0141
     * @tc.desc      视场角 75 度近平面 5 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0141 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(20);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0141 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0142
     * @tc.name      g3dProjection0142
     * @tc.desc      视场角 75 度近平面 5 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0142 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0142 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0143
     * @tc.name      g3dProjection0143
     * @tc.desc      视场角 75 度近平面 5 远平面 1000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0143 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 1000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(200);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0143 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0144
     * @tc.name      g3dProjection0144
     * @tc.desc      视场角 75 度近平面 5 远平面 2000 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0144 begin');
      const half: number = 75 * Math.PI / 360;
      const near: number = 5;
      const far: number = 2000;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('7.6733');
      expect(width.toFixed(4)).assertEqual('13.6414');
      expect(ratio).assertEqual(400);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0144 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0145
     * @tc.name      g3dProjection0145
     * @tc.desc      视场角 90 度近平面 0.1 远平面 10 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0145 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 10;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(100);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0145 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0146
     * @tc.name      g3dProjection0146
     * @tc.desc      视场角 90 度近平面 0.1 远平面 50 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0146 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 50;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(500);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0146 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0147
     * @tc.name      g3dProjection0147
     * @tc.desc      视场角 90 度近平面 0.1 远平面 100 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0147 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 100;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(1000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0147 end');
    })

    /**
     * @tc.number    G3D_PROJECTION_0148
     * @tc.name      g3dProjection0148
     * @tc.desc      视场角 90 度近平面 0.1 远平面 500 的视锥尺寸与深度比
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dProjection0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0148 begin');
      const half: number = 90 * Math.PI / 360;
      const near: number = 0.1;
      const far: number = 500;
      const frustumHeight: number = 2 * near * Math.tan(half);
      const width: number = frustumHeight * 16 / 9;
      const ratio: number = far / near;
      expect(frustumHeight.toFixed(4)).assertEqual('0.2000');
      expect(width.toFixed(4)).assertEqual('0.3556');
      expect(ratio).assertEqual(5000);
      expect(ratio > 1).assertTrue();
      expect(frustumHeight > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dProjection0148 end');
    })
  })
}
