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

export default function g3dCameraMatrix7Test(): void {
  describe('G3dCameraMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_CAMERA_0445
     * @tc.name      g3dCamera0445
     * @tc.desc      相机距离 3 偏航 330 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0445 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0445 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0446
     * @tc.name      g3dCamera0446
     * @tc.desc      相机距离 3 偏航 330 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0446 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.6724) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8978) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.3882) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0446 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0447
     * @tc.name      g3dCamera0447
     * @tc.desc      相机距离 3 偏航 330 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0447 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0447 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0448
     * @tc.name      g3dCamera0448
     * @tc.desc      相机距离 3 偏航 330 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0448 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.2990) < 0.01).assertTrue();
      expect(Math.abs(y - 2.5981) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7500) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0448 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0449
     * @tc.name      g3dCamera0449
     * @tc.desc      相机距离 3 偏航 330 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0449 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.2500) < 0.01).assertTrue();
      expect(Math.abs(y - 1.5000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.2990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0449 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0450
     * @tc.name      g3dCamera0450
     * @tc.desc      相机距离 3 偏航 330 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0450 begin');
      const distance: number = 3;
      const yaw: number = 330 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.5981) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.5000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0450 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0451
     * @tc.name      g3dCamera0451
     * @tc.desc      相机距离 4 偏航 0 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0451 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0451 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0452
     * @tc.name      g3dCamera0452
     * @tc.desc      相机距离 4 偏航 0 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0452 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0452 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0453
     * @tc.name      g3dCamera0453
     * @tc.desc      相机距离 4 偏航 0 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0453 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0453 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0454
     * @tc.name      g3dCamera0454
     * @tc.desc      相机距离 4 偏航 0 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0454 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0454 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0455
     * @tc.name      g3dCamera0455
     * @tc.desc      相机距离 4 偏航 0 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0455 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0455 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0456
     * @tc.name      g3dCamera0456
     * @tc.desc      相机距离 4 偏航 0 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0456 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0456 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0457
     * @tc.name      g3dCamera0457
     * @tc.desc      相机距离 4 偏航 0 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0457 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0457 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0458
     * @tc.name      g3dCamera0458
     * @tc.desc      相机距离 4 偏航 0 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0458 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0458 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0459
     * @tc.name      g3dCamera0459
     * @tc.desc      相机距离 4 偏航 0 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0459 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0459 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0460
     * @tc.name      g3dCamera0460
     * @tc.desc      相机距离 4 偏航 0 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0460 begin');
      const distance: number = 4;
      const yaw: number = 0 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0460 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0461
     * @tc.name      g3dCamera0461
     * @tc.desc      相机距离 4 偏航 15 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0461 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0353) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0461 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0462
     * @tc.name      g3dCamera0462
     * @tc.desc      相机距离 4 偏航 15 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0462 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0462 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0463
     * @tc.name      g3dCamera0463
     * @tc.desc      相机距离 4 偏航 15 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0463 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.3461) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.8966) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0463 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0464
     * @tc.name      g3dCamera0464
     * @tc.desc      相机距离 4 偏航 15 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0464 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0464 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0465
     * @tc.name      g3dCamera0465
     * @tc.desc      相机距离 4 偏航 15 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0465 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0465 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0466
     * @tc.name      g3dCamera0466
     * @tc.desc      相机距离 4 偏航 15 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0466 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.2679) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0466 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0467
     * @tc.name      g3dCamera0467
     * @tc.desc      相机距离 4 偏航 15 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0467 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0467 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0468
     * @tc.name      g3dCamera0468
     * @tc.desc      相机距离 4 偏航 15 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0468 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0468 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0469
     * @tc.name      g3dCamera0469
     * @tc.desc      相机距离 4 偏航 15 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0469 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.3461) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.8966) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0469 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0470
     * @tc.name      g3dCamera0470
     * @tc.desc      相机距离 4 偏航 15 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0470 begin');
      const distance: number = 4;
      const yaw: number = 15 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.8637) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.0353) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0470 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0471
     * @tc.name      g3dCamera0471
     * @tc.desc      相机距离 4 偏航 30 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0471 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0471 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0472
     * @tc.name      g3dCamera0472
     * @tc.desc      相机距离 4 偏航 30 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0472 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.3461) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0472 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0473
     * @tc.name      g3dCamera0473
     * @tc.desc      相机距离 4 偏航 30 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0473 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0473 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0474
     * @tc.name      g3dCamera0474
     * @tc.desc      相机距离 4 偏航 30 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0474 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.4495) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0474 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0475
     * @tc.name      g3dCamera0475
     * @tc.desc      相机距离 4 偏航 30 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0475 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0475 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0476
     * @tc.name      g3dCamera0476
     * @tc.desc      相机距离 4 偏航 30 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0476 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.8966) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.5176) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0476 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0477
     * @tc.name      g3dCamera0477
     * @tc.desc      相机距离 4 偏航 30 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0477 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0477 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0478
     * @tc.name      g3dCamera0478
     * @tc.desc      相机距离 4 偏航 30 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0478 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0478 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0479
     * @tc.name      g3dCamera0479
     * @tc.desc      相机距离 4 偏航 30 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0479 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0479 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0480
     * @tc.name      g3dCamera0480
     * @tc.desc      相机距离 4 偏航 30 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0480 begin');
      const distance: number = 4;
      const yaw: number = 30 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0480 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0481
     * @tc.name      g3dCamera0481
     * @tc.desc      相机距离 4 偏航 45 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0481 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0481 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0482
     * @tc.name      g3dCamera0482
     * @tc.desc      相机距离 4 偏航 45 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0482 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0482 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0483
     * @tc.name      g3dCamera0483
     * @tc.desc      相机距离 4 偏航 45 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0483 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.4495) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.4495) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0483 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0484
     * @tc.name      g3dCamera0484
     * @tc.desc      相机距离 4 偏航 45 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0484 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0484 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0485
     * @tc.name      g3dCamera0485
     * @tc.desc      相机距离 4 偏航 45 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0485 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0485 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0486
     * @tc.name      g3dCamera0486
     * @tc.desc      相机距离 4 偏航 45 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0486 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0486 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0487
     * @tc.name      g3dCamera0487
     * @tc.desc      相机距离 4 偏航 45 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0487 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0487 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0488
     * @tc.name      g3dCamera0488
     * @tc.desc      相机距离 4 偏航 45 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0488 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.4142) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0488 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0489
     * @tc.name      g3dCamera0489
     * @tc.desc      相机距离 4 偏航 45 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0489 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.4495) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.4495) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0489 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0490
     * @tc.name      g3dCamera0490
     * @tc.desc      相机距离 4 偏航 45 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0490 begin');
      const distance: number = 4;
      const yaw: number = 45 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0490 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0491
     * @tc.name      g3dCamera0491
     * @tc.desc      相机距离 4 偏航 60 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0491 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0491 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0492
     * @tc.name      g3dCamera0492
     * @tc.desc      相机距离 4 偏航 60 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0492 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.9319) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.3461) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0492 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0493
     * @tc.name      g3dCamera0493
     * @tc.desc      相机距离 4 偏航 60 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0493 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0493 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0494
     * @tc.name      g3dCamera0494
     * @tc.desc      相机距离 4 偏航 60 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0494 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.4142) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.4495) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0494 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0495
     * @tc.name      g3dCamera0495
     * @tc.desc      相机距离 4 偏航 60 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0495 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0495 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0496
     * @tc.name      g3dCamera0496
     * @tc.desc      相机距离 4 偏航 60 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0496 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.8966) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0496 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0497
     * @tc.name      g3dCamera0497
     * @tc.desc      相机距离 4 偏航 60 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0497 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0497 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0498
     * @tc.name      g3dCamera0498
     * @tc.desc      相机距离 4 偏航 60 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0498 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0498 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0499
     * @tc.name      g3dCamera0499
     * @tc.desc      相机距离 4 偏航 60 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0499 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0499 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0500
     * @tc.name      g3dCamera0500
     * @tc.desc      相机距离 4 偏航 60 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0500 begin');
      const distance: number = 4;
      const yaw: number = 60 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0500 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0501
     * @tc.name      g3dCamera0501
     * @tc.desc      相机距离 4 偏航 75 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0501 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.8637) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0501 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0502
     * @tc.name      g3dCamera0502
     * @tc.desc      相机距离 4 偏航 75 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0502 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0502 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0503
     * @tc.name      g3dCamera0503
     * @tc.desc      相机距离 4 偏航 75 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0503 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.8966) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.3461) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0503 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0504
     * @tc.name      g3dCamera0504
     * @tc.desc      相机距离 4 偏航 75 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0504 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.7321) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.7321) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0504 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0505
     * @tc.name      g3dCamera0505
     * @tc.desc      相机距离 4 偏航 75 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0505 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0505 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0506
     * @tc.name      g3dCamera0506
     * @tc.desc      相机距离 4 偏航 75 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0506 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.2679) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0506 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0507
     * @tc.name      g3dCamera0507
     * @tc.desc      相机距离 4 偏航 75 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0507 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0507 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0508
     * @tc.name      g3dCamera0508
     * @tc.desc      相机距离 4 偏航 75 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0508 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5176) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.9319) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0508 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0509
     * @tc.name      g3dCamera0509
     * @tc.desc      相机距离 4 偏航 75 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0509 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.8966) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.3461) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0509 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0510
     * @tc.name      g3dCamera0510
     * @tc.desc      相机距离 4 偏航 75 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0510 begin');
      const distance: number = 4;
      const yaw: number = 75 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.8637) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0510 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0511
     * @tc.name      g3dCamera0511
     * @tc.desc      相机距离 4 偏航 90 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0511 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0511 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0512
     * @tc.name      g3dCamera0512
     * @tc.desc      相机距离 4 偏航 90 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0512 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.8637) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0512 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0513
     * @tc.name      g3dCamera0513
     * @tc.desc      相机距离 4 偏航 90 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0513 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0513 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0514
     * @tc.name      g3dCamera0514
     * @tc.desc      相机距离 4 偏航 90 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0514 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0514 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0515
     * @tc.name      g3dCamera0515
     * @tc.desc      相机距离 4 偏航 90 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0515 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0515 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0516
     * @tc.name      g3dCamera0516
     * @tc.desc      相机距离 4 偏航 90 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0516 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.0353) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0516 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0517
     * @tc.name      g3dCamera0517
     * @tc.desc      相机距离 4 偏航 90 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0517 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0517 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0518
     * @tc.name      g3dCamera0518
     * @tc.desc      相机距离 4 偏航 90 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0518 begin');
      const distance: number = 4;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0518 end');
    })
  })
}
