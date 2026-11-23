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

export default function g3dCameraMatrix5Test(): void {
  describe('G3dCameraMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_CAMERA_0297
     * @tc.name      g3dCamera0297
     * @tc.desc      相机距离 2 偏航 330 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0297 begin');
      const distance: number = 2;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0297 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0298
     * @tc.name      g3dCamera0298
     * @tc.desc      相机距离 2 偏航 330 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0298 begin');
      const distance: number = 2;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0298 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0299
     * @tc.name      g3dCamera0299
     * @tc.desc      相机距离 2 偏航 330 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0299 begin');
      const distance: number = 2;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0299 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0300
     * @tc.name      g3dCamera0300
     * @tc.desc      相机距离 2 偏航 330 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0300 begin');
      const distance: number = 2;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0300 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0301
     * @tc.name      g3dCamera0301
     * @tc.desc      相机距离 3 偏航 0 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0301 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0301 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0302
     * @tc.name      g3dCamera0302
     * @tc.desc      相机距离 3 偏航 0 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0302 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0302 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0303
     * @tc.name      g3dCamera0303
     * @tc.desc      相机距离 3 偏航 0 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0303 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0303 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0304
     * @tc.name      g3dCamera0304
     * @tc.desc      相机距离 3 偏航 0 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0304 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0304 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0305
     * @tc.name      g3dCamera0305
     * @tc.desc      相机距离 3 偏航 0 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0305 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0305 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0306
     * @tc.name      g3dCamera0306
     * @tc.desc      相机距离 3 偏航 0 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0306 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0306 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0307
     * @tc.name      g3dCamera0307
     * @tc.desc      相机距离 3 偏航 0 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0307 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0307 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0308
     * @tc.name      g3dCamera0308
     * @tc.desc      相机距离 3 偏航 0 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0308 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0308 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0309
     * @tc.name      g3dCamera0309
     * @tc.desc      相机距离 3 偏航 0 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0309 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.5981) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0309 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0310
     * @tc.name      g3dCamera0310
     * @tc.desc      相机距离 3 偏航 0 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0310 begin');
      const distance: number = 3;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0310 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0311
     * @tc.name      g3dCamera0311
     * @tc.desc      相机距离 3 偏航 15 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0311 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7765) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0311 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0312
     * @tc.name      g3dCamera0312
     * @tc.desc      相机距离 3 偏航 15 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0312 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.7990) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0312 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0313
     * @tc.name      g3dCamera0313
     * @tc.desc      相机距离 3 偏航 15 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0313 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.5095) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.6724) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0313 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0314
     * @tc.name      g3dCamera0314
     * @tc.desc      相机距离 3 偏航 15 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0314 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0490) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5490) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0314 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0315
     * @tc.name      g3dCamera0315
     * @tc.desc      相机距离 3 偏航 15 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0315 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4489) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.3882) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0315 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0316
     * @tc.name      g3dCamera0316
     * @tc.desc      相机距离 3 偏航 15 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0316 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7500) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.2010) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0316 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0317
     * @tc.name      g3dCamera0317
     * @tc.desc      相机距离 3 偏航 15 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0317 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0317 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0318
     * @tc.name      g3dCamera0318
     * @tc.desc      相机距离 3 偏航 15 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0318 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4489) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.3882) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0318 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0319
     * @tc.name      g3dCamera0319
     * @tc.desc      相机距离 3 偏航 15 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0319 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.5095) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.6724) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0319 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0320
     * @tc.name      g3dCamera0320
     * @tc.desc      相机距离 3 偏航 15 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0320 begin');
      const distance: number = 3;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.8978) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.7765) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0320 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0321
     * @tc.name      g3dCamera0321
     * @tc.desc      相机距离 3 偏航 30 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0321 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0321 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0322
     * @tc.name      g3dCamera0322
     * @tc.desc      相机距离 3 偏航 30 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0322 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.5095) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4489) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0322 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0323
     * @tc.name      g3dCamera0323
     * @tc.desc      相机距离 3 偏航 30 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0323 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.2500) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.2990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0323 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0324
     * @tc.name      g3dCamera0324
     * @tc.desc      相机距离 3 偏航 30 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0324 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.8371) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0607) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0324 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0325
     * @tc.name      g3dCamera0325
     * @tc.desc      相机距离 3 偏航 30 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0325 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0325 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0326
     * @tc.name      g3dCamera0326
     * @tc.desc      相机距离 3 偏航 30 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0326 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.6724) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.3882) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0326 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0327
     * @tc.name      g3dCamera0327
     * @tc.desc      相机距离 3 偏航 30 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0327 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0327 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0328
     * @tc.name      g3dCamera0328
     * @tc.desc      相机距离 3 偏航 30 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0328 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0328 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0329
     * @tc.name      g3dCamera0329
     * @tc.desc      相机距离 3 偏航 30 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0329 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.2500) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.2990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0329 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0330
     * @tc.name      g3dCamera0330
     * @tc.desc      相机距离 3 偏航 30 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0330 begin');
      const distance: number = 3;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.5981) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0330 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0331
     * @tc.name      g3dCamera0331
     * @tc.desc      相机距离 3 偏航 45 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0331 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.1213) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0331 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0332
     * @tc.name      g3dCamera0332
     * @tc.desc      相机距离 3 偏航 45 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0332 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0490) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0490) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0332 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0333
     * @tc.name      g3dCamera0333
     * @tc.desc      相机距离 3 偏航 45 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0333 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.8371) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.8371) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0333 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0334
     * @tc.name      g3dCamera0334
     * @tc.desc      相机距离 3 偏航 45 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0334 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0334 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0335
     * @tc.name      g3dCamera0335
     * @tc.desc      相机距离 3 偏航 45 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0335 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0607) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0607) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0335 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0336
     * @tc.name      g3dCamera0336
     * @tc.desc      相机距离 3 偏航 45 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0336 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5490) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5490) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0336 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0337
     * @tc.name      g3dCamera0337
     * @tc.desc      相机距离 3 偏航 45 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0337 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0337 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0338
     * @tc.name      g3dCamera0338
     * @tc.desc      相机距离 3 偏航 45 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0338 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0607) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.0607) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0338 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0339
     * @tc.name      g3dCamera0339
     * @tc.desc      相机距离 3 偏航 45 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0339 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.8371) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.8371) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0339 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0340
     * @tc.name      g3dCamera0340
     * @tc.desc      相机距离 3 偏航 45 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0340 begin');
      const distance: number = 3;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.1213) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.1213) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0340 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0341
     * @tc.name      g3dCamera0341
     * @tc.desc      相机距离 3 偏航 60 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0341 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.5981) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0341 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0342
     * @tc.name      g3dCamera0342
     * @tc.desc      相机距离 3 偏航 60 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0342 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4489) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.5095) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0342 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0343
     * @tc.name      g3dCamera0343
     * @tc.desc      相机距离 3 偏航 60 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0343 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.2500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0343 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0344
     * @tc.name      g3dCamera0344
     * @tc.desc      相机距离 3 偏航 60 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0344 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0607) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.8371) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0344 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0345
     * @tc.name      g3dCamera0345
     * @tc.desc      相机距离 3 偏航 60 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0345 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7500) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.2990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0345 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0346
     * @tc.name      g3dCamera0346
     * @tc.desc      相机距离 3 偏航 60 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0346 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.3882) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.6724) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0346 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0347
     * @tc.name      g3dCamera0347
     * @tc.desc      相机距离 3 偏航 60 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0347 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0347 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0348
     * @tc.name      g3dCamera0348
     * @tc.desc      相机距离 3 偏航 60 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0348 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.7500) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.2990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0348 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0349
     * @tc.name      g3dCamera0349
     * @tc.desc      相机距离 3 偏航 60 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0349 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.2500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0349 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0350
     * @tc.name      g3dCamera0350
     * @tc.desc      相机距离 3 偏航 60 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0350 begin');
      const distance: number = 3;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.5981) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0350 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0351
     * @tc.name      g3dCamera0351
     * @tc.desc      相机距离 3 偏航 75 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0351 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8978) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0351 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0352
     * @tc.name      g3dCamera0352
     * @tc.desc      相机距离 3 偏航 75 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0352 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7500) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.7990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0352 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0353
     * @tc.name      g3dCamera0353
     * @tc.desc      相机距离 3 偏航 75 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0353 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.6724) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.5095) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0353 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0354
     * @tc.name      g3dCamera0354
     * @tc.desc      相机距离 3 偏航 75 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0354 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5490) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0490) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0354 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0355
     * @tc.name      g3dCamera0355
     * @tc.desc      相机距离 3 偏航 75 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0355 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.3882) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4489) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0355 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0356
     * @tc.name      g3dCamera0356
     * @tc.desc      相机距离 3 偏航 75 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0356 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.2010) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0356 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0357
     * @tc.name      g3dCamera0357
     * @tc.desc      相机距离 3 偏航 75 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0357 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0357 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0358
     * @tc.name      g3dCamera0358
     * @tc.desc      相机距离 3 偏航 75 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0358 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.3882) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.4489) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0358 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0359
     * @tc.name      g3dCamera0359
     * @tc.desc      相机距离 3 偏航 75 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0359 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.6724) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.5095) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0359 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0360
     * @tc.name      g3dCamera0360
     * @tc.desc      相机距离 3 偏航 75 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0360 begin');
      const distance: number = 3;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.7765) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.8978) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0360 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0361
     * @tc.name      g3dCamera0361
     * @tc.desc      相机距离 3 偏航 90 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0361 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0361 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0362
     * @tc.name      g3dCamera0362
     * @tc.desc      相机距离 3 偏航 90 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0362 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.7765) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8978) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0362 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0363
     * @tc.name      g3dCamera0363
     * @tc.desc      相机距离 3 偏航 90 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0363 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.5981) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0363 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0364
     * @tc.name      g3dCamera0364
     * @tc.desc      相机距离 3 偏航 90 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0364 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.1213) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.1213) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0364 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0365
     * @tc.name      g3dCamera0365
     * @tc.desc      相机距离 3 偏航 90 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0365 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0365 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0366
     * @tc.name      g3dCamera0366
     * @tc.desc      相机距离 3 偏航 90 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0366 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7765) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0366 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0367
     * @tc.name      g3dCamera0367
     * @tc.desc      相机距离 3 偏航 90 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0367 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0367 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0368
     * @tc.name      g3dCamera0368
     * @tc.desc      相机距离 3 偏航 90 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0368 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0368 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0369
     * @tc.name      g3dCamera0369
     * @tc.desc      相机距离 3 偏航 90 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0369 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.5981) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0369 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0370
     * @tc.name      g3dCamera0370
     * @tc.desc      相机距离 3 偏航 90 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0370 begin');
      const distance: number = 3;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0370 end');
    })
  })
}
