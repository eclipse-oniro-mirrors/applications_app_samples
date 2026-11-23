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

export default function g3dCameraMatrix29Test(): void {
  describe('G3dCameraMatrix29Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_CAMERA_2073
     * @tc.name      g3dCamera2073
     * @tc.desc      相机距离 48 偏航 270 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2073 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -41.5692) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2073 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2074
     * @tc.name      g3dCamera2074
     * @tc.desc      相机距离 48 偏航 270 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2074 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 33.9411) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -33.9411) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2074 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2075
     * @tc.name      g3dCamera2075
     * @tc.desc      相机距离 48 偏航 270 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2075 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -24.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2075 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2076
     * @tc.name      g3dCamera2076
     * @tc.desc      相机距离 48 偏航 270 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2076 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 46.3644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -12.4233) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2076 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2077
     * @tc.name      g3dCamera2077
     * @tc.desc      相机距离 48 偏航 270 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2077 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 48.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2077 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2078
     * @tc.name      g3dCamera2078
     * @tc.desc      相机距离 48 偏航 270 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2078 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 24.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2078 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2079
     * @tc.name      g3dCamera2079
     * @tc.desc      相机距离 48 偏航 270 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2079 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 41.5692) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2079 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2080
     * @tc.name      g3dCamera2080
     * @tc.desc      相机距离 48 偏航 270 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2080 begin');
      const distance: number = 48;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 48.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2080 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2081
     * @tc.name      g3dCamera2081
     * @tc.desc      相机距离 48 偏航 300 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2081 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -41.5692) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2081 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2082
     * @tc.name      g3dCamera2082
     * @tc.desc      相机距离 48 偏航 300 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2082 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 23.1822) < 0.01).assertTrue();
      expect(Math.abs(y - 12.4233) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -40.1528) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2082 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2083
     * @tc.name      g3dCamera2083
     * @tc.desc      相机距离 48 偏航 300 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2083 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 20.7846) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -36.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2083 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2084
     * @tc.name      g3dCamera2084
     * @tc.desc      相机距离 48 偏航 300 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2084 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 16.9706) < 0.01).assertTrue();
      expect(Math.abs(y - 33.9411) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -29.3939) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2084 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2085
     * @tc.name      g3dCamera2085
     * @tc.desc      相机距离 48 偏航 300 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2085 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 12.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -20.7846) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2085 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2086
     * @tc.name      g3dCamera2086
     * @tc.desc      相机距离 48 偏航 300 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2086 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 6.2117) < 0.01).assertTrue();
      expect(Math.abs(y - 46.3644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -10.7589) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2086 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2087
     * @tc.name      g3dCamera2087
     * @tc.desc      相机距离 48 偏航 300 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2087 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 48.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2087 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2088
     * @tc.name      g3dCamera2088
     * @tc.desc      相机距离 48 偏航 300 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2088 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -12.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 20.7846) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2088 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2089
     * @tc.name      g3dCamera2089
     * @tc.desc      相机距离 48 偏航 300 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2089 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -20.7846) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 36.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2089 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2090
     * @tc.name      g3dCamera2090
     * @tc.desc      相机距离 48 偏航 300 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2090 begin');
      const distance: number = 48;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -24.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 41.5692) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2090 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2091
     * @tc.name      g3dCamera2091
     * @tc.desc      相机距离 48 偏航 330 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2091 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -24.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2091 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2092
     * @tc.name      g3dCamera2092
     * @tc.desc      相机距离 48 偏航 330 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2092 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 40.1528) < 0.01).assertTrue();
      expect(Math.abs(y - 12.4233) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -23.1822) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2092 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2093
     * @tc.name      g3dCamera2093
     * @tc.desc      相机距离 48 偏航 330 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2093 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 36.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -20.7846) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2093 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2094
     * @tc.name      g3dCamera2094
     * @tc.desc      相机距离 48 偏航 330 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2094 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 29.3939) < 0.01).assertTrue();
      expect(Math.abs(y - 33.9411) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -16.9706) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2094 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2095
     * @tc.name      g3dCamera2095
     * @tc.desc      相机距离 48 偏航 330 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2095 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 20.7846) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -12.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2095 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2096
     * @tc.name      g3dCamera2096
     * @tc.desc      相机距离 48 偏航 330 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2096 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 10.7589) < 0.01).assertTrue();
      expect(Math.abs(y - 46.3644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.2117) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2096 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2097
     * @tc.name      g3dCamera2097
     * @tc.desc      相机距离 48 偏航 330 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2097 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 48.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2097 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2098
     * @tc.name      g3dCamera2098
     * @tc.desc      相机距离 48 偏航 330 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2098 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -20.7846) < 0.01).assertTrue();
      expect(Math.abs(y - 41.5692) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 12.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2098 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2099
     * @tc.name      g3dCamera2099
     * @tc.desc      相机距离 48 偏航 330 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2099 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -36.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 24.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 20.7846) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2099 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2100
     * @tc.name      g3dCamera2100
     * @tc.desc      相机距离 48 偏航 330 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2100 begin');
      const distance: number = 48;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -41.5692) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 24.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2100 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2101
     * @tc.name      g3dCamera2101
     * @tc.desc      相机距离 64 偏航 0 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2101 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 64.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2101 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2102
     * @tc.name      g3dCamera2102
     * @tc.desc      相机距离 64 偏航 0 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2102 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(y - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2102 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2103
     * @tc.name      g3dCamera2103
     * @tc.desc      相机距离 64 偏航 0 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2103 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2103 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2104
     * @tc.name      g3dCamera2104
     * @tc.desc      相机距离 64 偏航 0 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2104 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(y - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2104 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2105
     * @tc.name      g3dCamera2105
     * @tc.desc      相机距离 64 偏航 0 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2105 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2105 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2106
     * @tc.name      g3dCamera2106
     * @tc.desc      相机距离 64 偏航 0 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2106 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(y - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2106 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2107
     * @tc.name      g3dCamera2107
     * @tc.desc      相机距离 64 偏航 0 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2107 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 64.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2107 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2108
     * @tc.name      g3dCamera2108
     * @tc.desc      相机距离 64 偏航 0 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2108 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -32.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2108 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2109
     * @tc.name      g3dCamera2109
     * @tc.desc      相机距离 64 偏航 0 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2109 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -55.4256) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2109 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2110
     * @tc.name      g3dCamera2110
     * @tc.desc      相机距离 64 偏航 0 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2110 begin');
      const distance: number = 64;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -64.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2110 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2111
     * @tc.name      g3dCamera2111
     * @tc.desc      相机距离 64 偏航 15 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2111 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 16.5644) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2111 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2112
     * @tc.name      g3dCamera2112
     * @tc.desc      相机距离 64 偏航 15 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2112 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 59.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 16.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2112 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2113
     * @tc.name      g3dCamera2113
     * @tc.desc      相机距离 64 偏航 15 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2113 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 53.5370) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 14.3452) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2113 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2114
     * @tc.name      g3dCamera2114
     * @tc.desc      相机距离 64 偏航 15 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2114 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 43.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 11.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2114 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2115
     * @tc.name      g3dCamera2115
     * @tc.desc      相机距离 64 偏航 15 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2115 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 30.9096) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 8.2822) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2115 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2116
     * @tc.name      g3dCamera2116
     * @tc.desc      相机距离 64 偏航 15 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2116 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 16.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.2872) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2116 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2117
     * @tc.name      g3dCamera2117
     * @tc.desc      相机距离 64 偏航 15 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2117 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 64.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2117 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2118
     * @tc.name      g3dCamera2118
     * @tc.desc      相机距离 64 偏航 15 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2118 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -30.9096) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -8.2822) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2118 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2119
     * @tc.name      g3dCamera2119
     * @tc.desc      相机距离 64 偏航 15 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2119 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -53.5370) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -14.3452) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2119 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2120
     * @tc.name      g3dCamera2120
     * @tc.desc      相机距离 64 偏航 15 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2120 begin');
      const distance: number = 64;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -61.8193) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -16.5644) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2120 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2121
     * @tc.name      g3dCamera2121
     * @tc.desc      相机距离 64 偏航 30 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2121 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 32.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2121 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2122
     * @tc.name      g3dCamera2122
     * @tc.desc      相机距离 64 偏航 30 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2122 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 53.5370) < 0.01).assertTrue();
      expect(Math.abs(y - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 30.9096) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2122 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2123
     * @tc.name      g3dCamera2123
     * @tc.desc      相机距离 64 偏航 30 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2123 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 48.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 27.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2123 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2124
     * @tc.name      g3dCamera2124
     * @tc.desc      相机距离 64 偏航 30 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2124 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 39.1918) < 0.01).assertTrue();
      expect(Math.abs(y - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 22.6274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2124 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2125
     * @tc.name      g3dCamera2125
     * @tc.desc      相机距离 64 偏航 30 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2125 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 27.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 16.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2125 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2126
     * @tc.name      g3dCamera2126
     * @tc.desc      相机距离 64 偏航 30 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2126 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 14.3452) < 0.01).assertTrue();
      expect(Math.abs(y - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 8.2822) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2126 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2127
     * @tc.name      g3dCamera2127
     * @tc.desc      相机距离 64 偏航 30 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2127 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 64.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2127 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2128
     * @tc.name      g3dCamera2128
     * @tc.desc      相机距离 64 偏航 30 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2128 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -27.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -16.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2128 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2129
     * @tc.name      g3dCamera2129
     * @tc.desc      相机距离 64 偏航 30 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2129 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -48.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -27.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2129 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2130
     * @tc.name      g3dCamera2130
     * @tc.desc      相机距离 64 偏航 30 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2130 begin');
      const distance: number = 64;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -55.4256) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -32.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2130 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2131
     * @tc.name      g3dCamera2131
     * @tc.desc      相机距离 64 偏航 45 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2131 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 45.2548) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2131 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2132
     * @tc.name      g3dCamera2132
     * @tc.desc      相机距离 64 偏航 45 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2132 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 43.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 43.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2132 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2133
     * @tc.name      g3dCamera2133
     * @tc.desc      相机距离 64 偏航 45 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2133 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 39.1918) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 39.1918) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2133 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2134
     * @tc.name      g3dCamera2134
     * @tc.desc      相机距离 64 偏航 45 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2134 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 32.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2134 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2135
     * @tc.name      g3dCamera2135
     * @tc.desc      相机距离 64 偏航 45 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2135 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 22.6274) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 22.6274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2135 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2136
     * @tc.name      g3dCamera2136
     * @tc.desc      相机距离 64 偏航 45 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2136 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 11.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 11.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2136 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2137
     * @tc.name      g3dCamera2137
     * @tc.desc      相机距离 64 偏航 45 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2137 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 64.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2137 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2138
     * @tc.name      g3dCamera2138
     * @tc.desc      相机距离 64 偏航 45 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2138 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -22.6274) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -22.6274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2138 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2139
     * @tc.name      g3dCamera2139
     * @tc.desc      相机距离 64 偏航 45 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2139 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -39.1918) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -39.1918) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2139 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2140
     * @tc.name      g3dCamera2140
     * @tc.desc      相机距离 64 偏航 45 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2140 begin');
      const distance: number = 64;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -45.2548) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -45.2548) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2140 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2141
     * @tc.name      g3dCamera2141
     * @tc.desc      相机距离 64 偏航 60 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2141 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 55.4256) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2141 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2142
     * @tc.name      g3dCamera2142
     * @tc.desc      相机距离 64 偏航 60 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2142 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 30.9096) < 0.01).assertTrue();
      expect(Math.abs(y - 16.5644) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 53.5370) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2142 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2143
     * @tc.name      g3dCamera2143
     * @tc.desc      相机距离 64 偏航 60 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2143 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 27.7128) < 0.01).assertTrue();
      expect(Math.abs(y - 32.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 48.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2143 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2144
     * @tc.name      g3dCamera2144
     * @tc.desc      相机距离 64 偏航 60 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2144 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 22.6274) < 0.01).assertTrue();
      expect(Math.abs(y - 45.2548) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 39.1918) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2144 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2145
     * @tc.name      g3dCamera2145
     * @tc.desc      相机距离 64 偏航 60 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2145 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 16.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 55.4256) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 27.7128) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2145 end');
    })

    /**
     * @tc.number    G3D_CAMERA_2146
     * @tc.name      g3dCamera2146
     * @tc.desc      相机距离 64 偏航 60 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera2146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2146 begin');
      const distance: number = 64;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 8.2822) < 0.01).assertTrue();
      expect(Math.abs(y - 61.8193) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 14.3452) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera2146 end');
    })
  })
}
