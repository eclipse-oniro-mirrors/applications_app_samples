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

export default function g3dCameraMatrix3Test(): void {
  describe('G3dCameraMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_CAMERA_0149
     * @tc.name      g3dCamera0149
     * @tc.desc      相机距离 1 偏航 330 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0149 begin');
      const distance: number = 1;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.7500) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.4330) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0149 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0150
     * @tc.name      g3dCamera0150
     * @tc.desc      相机距离 1 偏航 330 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0150 begin');
      const distance: number = 1;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0150 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0151
     * @tc.name      g3dCamera0151
     * @tc.desc      相机距离 2 偏航 0 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0151 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0151 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0152
     * @tc.name      g3dCamera0152
     * @tc.desc      相机距离 2 偏航 0 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0152 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0152 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0153
     * @tc.name      g3dCamera0153
     * @tc.desc      相机距离 2 偏航 0 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0153 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0153 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0154
     * @tc.name      g3dCamera0154
     * @tc.desc      相机距离 2 偏航 0 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0154 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0154 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0155
     * @tc.name      g3dCamera0155
     * @tc.desc      相机距离 2 偏航 0 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0155 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0155 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0156
     * @tc.name      g3dCamera0156
     * @tc.desc      相机距离 2 偏航 0 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0156 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0156 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0157
     * @tc.name      g3dCamera0157
     * @tc.desc      相机距离 2 偏航 0 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0157 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0157 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0158
     * @tc.name      g3dCamera0158
     * @tc.desc      相机距离 2 偏航 0 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0158 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0158 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0159
     * @tc.name      g3dCamera0159
     * @tc.desc      相机距离 2 偏航 0 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0159 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0159 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0160
     * @tc.name      g3dCamera0160
     * @tc.desc      相机距离 2 偏航 0 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0160 begin');
      const distance: number = 2;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0160 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0161
     * @tc.name      g3dCamera0161
     * @tc.desc      相机距离 2 偏航 15 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0161 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0161 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0162
     * @tc.name      g3dCamera0162
     * @tc.desc      相机距离 2 偏航 15 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0162 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0162 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0163
     * @tc.name      g3dCamera0163
     * @tc.desc      相机距离 2 偏航 15 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0163 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.6730) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.4483) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0163 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0164
     * @tc.name      g3dCamera0164
     * @tc.desc      相机距离 2 偏航 15 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0164 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.3660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.3660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0164 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0165
     * @tc.name      g3dCamera0165
     * @tc.desc      相机距离 2 偏航 15 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0165 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.9659) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.2588) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0165 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0166
     * @tc.name      g3dCamera0166
     * @tc.desc      相机距离 2 偏航 15 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0166 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.1340) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0166 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0167
     * @tc.name      g3dCamera0167
     * @tc.desc      相机距离 2 偏航 15 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0167 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0167 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0168
     * @tc.name      g3dCamera0168
     * @tc.desc      相机距离 2 偏航 15 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0168 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.9659) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.2588) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0168 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0169
     * @tc.name      g3dCamera0169
     * @tc.desc      相机距离 2 偏航 15 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0169 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.6730) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.4483) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0169 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0170
     * @tc.name      g3dCamera0170
     * @tc.desc      相机距离 2 偏航 15 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0170 begin');
      const distance: number = 2;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0170 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0171
     * @tc.name      g3dCamera0171
     * @tc.desc      相机距离 2 偏航 30 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0171 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0171 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0172
     * @tc.name      g3dCamera0172
     * @tc.desc      相机距离 2 偏航 30 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0172 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.6730) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.9659) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0172 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0173
     * @tc.name      g3dCamera0173
     * @tc.desc      相机距离 2 偏航 30 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0173 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0173 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0174
     * @tc.name      g3dCamera0174
     * @tc.desc      相机距离 2 偏航 30 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0174 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.2247) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7071) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0174 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0175
     * @tc.name      g3dCamera0175
     * @tc.desc      相机距离 2 偏航 30 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0175 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0175 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0176
     * @tc.name      g3dCamera0176
     * @tc.desc      相机距离 2 偏航 30 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0176 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.4483) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.2588) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0176 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0177
     * @tc.name      g3dCamera0177
     * @tc.desc      相机距离 2 偏航 30 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0177 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0177 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0178
     * @tc.name      g3dCamera0178
     * @tc.desc      相机距离 2 偏航 30 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0178 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0178 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0179
     * @tc.name      g3dCamera0179
     * @tc.desc      相机距离 2 偏航 30 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0179 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0179 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0180
     * @tc.name      g3dCamera0180
     * @tc.desc      相机距离 2 偏航 30 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0180 begin');
      const distance: number = 2;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0180 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0181
     * @tc.name      g3dCamera0181
     * @tc.desc      相机距离 2 偏航 45 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0181 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0181 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0182
     * @tc.name      g3dCamera0182
     * @tc.desc      相机距离 2 偏航 45 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0182 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.3660) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.3660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0182 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0183
     * @tc.name      g3dCamera0183
     * @tc.desc      相机距离 2 偏航 45 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0183 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.2247) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.2247) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0183 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0184
     * @tc.name      g3dCamera0184
     * @tc.desc      相机距离 2 偏航 45 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0184 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0184 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0185
     * @tc.name      g3dCamera0185
     * @tc.desc      相机距离 2 偏航 45 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0185 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7071) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7071) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0185 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0186
     * @tc.name      g3dCamera0186
     * @tc.desc      相机距离 2 偏航 45 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0186 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.3660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.3660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0186 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0187
     * @tc.name      g3dCamera0187
     * @tc.desc      相机距离 2 偏航 45 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0187 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0187 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0188
     * @tc.name      g3dCamera0188
     * @tc.desc      相机距离 2 偏航 45 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0188 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.7071) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.7071) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0188 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0189
     * @tc.name      g3dCamera0189
     * @tc.desc      相机距离 2 偏航 45 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0189 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.2247) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.2247) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0189 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0190
     * @tc.name      g3dCamera0190
     * @tc.desc      相机距离 2 偏航 45 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0190 begin');
      const distance: number = 2;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0190 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0191
     * @tc.name      g3dCamera0191
     * @tc.desc      相机距离 2 偏航 60 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0191 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0191 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0192
     * @tc.name      g3dCamera0192
     * @tc.desc      相机距离 2 偏航 60 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0192 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.9659) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.6730) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0192 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0193
     * @tc.name      g3dCamera0193
     * @tc.desc      相机距离 2 偏航 60 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0193 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0193 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0194
     * @tc.name      g3dCamera0194
     * @tc.desc      相机距离 2 偏航 60 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0194 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7071) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.2247) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0194 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0195
     * @tc.name      g3dCamera0195
     * @tc.desc      相机距离 2 偏航 60 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0195 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0195 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0196
     * @tc.name      g3dCamera0196
     * @tc.desc      相机距离 2 偏航 60 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0196 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.2588) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.4483) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0196 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0197
     * @tc.name      g3dCamera0197
     * @tc.desc      相机距离 2 偏航 60 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0197 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0197 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0198
     * @tc.name      g3dCamera0198
     * @tc.desc      相机距离 2 偏航 60 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0198 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0198 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0199
     * @tc.name      g3dCamera0199
     * @tc.desc      相机距离 2 偏航 60 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0199 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.8660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0199 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0200
     * @tc.name      g3dCamera0200
     * @tc.desc      相机距离 2 偏航 60 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0200 begin');
      const distance: number = 2;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0200 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0201
     * @tc.name      g3dCamera0201
     * @tc.desc      相机距离 2 偏航 75 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0201 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0201 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0202
     * @tc.name      g3dCamera0202
     * @tc.desc      相机距离 2 偏航 75 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0202 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0202 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0203
     * @tc.name      g3dCamera0203
     * @tc.desc      相机距离 2 偏航 75 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0203 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.4483) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.6730) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0203 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0204
     * @tc.name      g3dCamera0204
     * @tc.desc      相机距离 2 偏航 75 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0204 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.3660) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.3660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0204 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0205
     * @tc.name      g3dCamera0205
     * @tc.desc      相机距离 2 偏航 75 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0205 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.2588) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.9659) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0205 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0206
     * @tc.name      g3dCamera0206
     * @tc.desc      相机距离 2 偏航 75 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0206 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.1340) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0206 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0207
     * @tc.name      g3dCamera0207
     * @tc.desc      相机距离 2 偏航 75 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0207 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0207 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0208
     * @tc.name      g3dCamera0208
     * @tc.desc      相机距离 2 偏航 75 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0208 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.2588) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.9659) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0208 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0209
     * @tc.name      g3dCamera0209
     * @tc.desc      相机距离 2 偏航 75 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0209 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.4483) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.6730) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0209 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0210
     * @tc.name      g3dCamera0210
     * @tc.desc      相机距离 2 偏航 75 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0210 begin');
      const distance: number = 2;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0210 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0211
     * @tc.name      g3dCamera0211
     * @tc.desc      相机距离 2 偏航 90 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0211 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0211 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0212
     * @tc.name      g3dCamera0212
     * @tc.desc      相机距离 2 偏航 90 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0212 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0212 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0213
     * @tc.name      g3dCamera0213
     * @tc.desc      相机距离 2 偏航 90 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0213 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0213 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0214
     * @tc.name      g3dCamera0214
     * @tc.desc      相机距离 2 偏航 90 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0214 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0214 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0215
     * @tc.name      g3dCamera0215
     * @tc.desc      相机距离 2 偏航 90 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0215 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0215 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0216
     * @tc.name      g3dCamera0216
     * @tc.desc      相机距离 2 偏航 90 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0216 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0216 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0217
     * @tc.name      g3dCamera0217
     * @tc.desc      相机距离 2 偏航 90 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0217 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0217 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0218
     * @tc.name      g3dCamera0218
     * @tc.desc      相机距离 2 偏航 90 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0218 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0218 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0219
     * @tc.name      g3dCamera0219
     * @tc.desc      相机距离 2 偏航 90 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0219 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0219 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0220
     * @tc.name      g3dCamera0220
     * @tc.desc      相机距离 2 偏航 90 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0220 begin');
      const distance: number = 2;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0220 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0221
     * @tc.name      g3dCamera0221
     * @tc.desc      相机距离 2 偏航 105 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0221 begin');
      const distance: number = 2;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0221 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0222
     * @tc.name      g3dCamera0222
     * @tc.desc      相机距离 2 偏航 105 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0222 begin');
      const distance: number = 2;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.8660) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0222 end');
    })
  })
}
