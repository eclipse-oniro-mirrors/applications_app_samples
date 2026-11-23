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

export default function g3dCameraMatrix14Test(): void {
  describe('G3dCameraMatrix14Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_CAMERA_0963
     * @tc.name      g3dCamera0963
     * @tc.desc      相机距离 8 偏航 90 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0963', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0963 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0963 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0964
     * @tc.name      g3dCamera0964
     * @tc.desc      相机距离 8 偏航 90 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0964', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0964 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0964 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0965
     * @tc.name      g3dCamera0965
     * @tc.desc      相机距离 8 偏航 90 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0965', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0965 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0965 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0966
     * @tc.name      g3dCamera0966
     * @tc.desc      相机距离 8 偏航 90 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0966', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0966 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0706) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0966 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0967
     * @tc.name      g3dCamera0967
     * @tc.desc      相机距离 8 偏航 90 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0967', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0967 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0967 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0968
     * @tc.name      g3dCamera0968
     * @tc.desc      相机距离 8 偏航 90 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0968', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0968 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0968 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0969
     * @tc.name      g3dCamera0969
     * @tc.desc      相机距离 8 偏航 90 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0969', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0969 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0969 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0970
     * @tc.name      g3dCamera0970
     * @tc.desc      相机距离 8 偏航 90 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0970', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0970 begin');
      const distance: number = 8;
      const yaw: number = 90 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -8.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0970 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0971
     * @tc.name      g3dCamera0971
     * @tc.desc      相机距离 8 偏航 105 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0971', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0971 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0706) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 7.7274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0971 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0972
     * @tc.name      g3dCamera0972
     * @tc.desc      相机距离 8 偏航 105 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0972', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0972 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 7.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0972 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0973
     * @tc.name      g3dCamera0973
     * @tc.desc      相机距离 8 偏航 105 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0973', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0973 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.7932) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.6921) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0973 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0974
     * @tc.name      g3dCamera0974
     * @tc.desc      相机距离 8 偏航 105 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0974', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0974 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 5.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0974 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0975
     * @tc.name      g3dCamera0975
     * @tc.desc      相机距离 8 偏航 105 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0975', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0975 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.8637) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0975 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0976
     * @tc.name      g3dCamera0976
     * @tc.desc      相机距离 8 偏航 105 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0976', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0976 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.5359) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0976 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0977
     * @tc.name      g3dCamera0977
     * @tc.desc      相机距离 8 偏航 105 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0977', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0977 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0977 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0978
     * @tc.name      g3dCamera0978
     * @tc.desc      相机距离 8 偏航 105 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0978', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0978 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.8637) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0978 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0979
     * @tc.name      g3dCamera0979
     * @tc.desc      相机距离 8 偏航 105 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0979', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0979 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.7932) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.6921) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0979 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0980
     * @tc.name      g3dCamera0980
     * @tc.desc      相机距离 8 偏航 105 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0980', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0980 begin');
      const distance: number = 8;
      const yaw: number = 105 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -7.7274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0980 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0981
     * @tc.name      g3dCamera0981
     * @tc.desc      相机距离 8 偏航 120 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0981', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0981 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0981 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0982
     * @tc.name      g3dCamera0982
     * @tc.desc      相机距离 8 偏航 120 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0982', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0982 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.8637) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.6921) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0982 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0983
     * @tc.name      g3dCamera0983
     * @tc.desc      相机距离 8 偏航 120 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0983', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0983 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0983 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0984
     * @tc.name      g3dCamera0984
     * @tc.desc      相机距离 8 偏航 120 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0984', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0984 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0984 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0985
     * @tc.name      g3dCamera0985
     * @tc.desc      相机距离 8 偏航 120 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0985', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0985 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0985 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0986
     * @tc.name      g3dCamera0986
     * @tc.desc      相机距离 8 偏航 120 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0986', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0986 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.7932) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0986 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0987
     * @tc.name      g3dCamera0987
     * @tc.desc      相机距离 8 偏航 120 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0987', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0987 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0987 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0988
     * @tc.name      g3dCamera0988
     * @tc.desc      相机距离 8 偏航 120 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0988', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0988 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0988 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0989
     * @tc.name      g3dCamera0989
     * @tc.desc      相机距离 8 偏航 120 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0989', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0989 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0989 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0990
     * @tc.name      g3dCamera0990
     * @tc.desc      相机距离 8 偏航 120 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0990', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0990 begin');
      const distance: number = 8;
      const yaw: number = 120 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0990 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0991
     * @tc.name      g3dCamera0991
     * @tc.desc      相机距离 8 偏航 135 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0991', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0991 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -5.6569) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0991 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0992
     * @tc.name      g3dCamera0992
     * @tc.desc      相机距离 8 偏航 135 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0992', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0992 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -5.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 5.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0992 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0993
     * @tc.name      g3dCamera0993
     * @tc.desc      相机距离 8 偏航 135 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0993', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0993 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.8990) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0993 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0994
     * @tc.name      g3dCamera0994
     * @tc.desc      相机距离 8 偏航 135 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0994', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0994 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0994 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0995
     * @tc.name      g3dCamera0995
     * @tc.desc      相机距离 8 偏航 135 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0995', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0995 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0995 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0996
     * @tc.name      g3dCamera0996
     * @tc.desc      相机距离 8 偏航 135 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0996', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0996 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 1.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0996 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0997
     * @tc.name      g3dCamera0997
     * @tc.desc      相机距离 8 偏航 135 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0997', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0997 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0997 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0998
     * @tc.name      g3dCamera0998
     * @tc.desc      相机距离 8 偏航 135 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0998', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0998 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0998 end');
    })

    /**
     * @tc.number    G3D_CAMERA_0999
     * @tc.name      g3dCamera0999
     * @tc.desc      相机距离 8 偏航 135 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera0999', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0999 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.8990) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera0999 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1000
     * @tc.name      g3dCamera1000
     * @tc.desc      相机距离 8 偏航 135 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1000 begin');
      const distance: number = 8;
      const yaw: number = 135 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1000 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1001
     * @tc.name      g3dCamera1001
     * @tc.desc      相机距离 8 偏航 180 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1001 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -8.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1001 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1002
     * @tc.name      g3dCamera1002
     * @tc.desc      相机距离 8 偏航 180 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1002 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -7.7274) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1002 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1003
     * @tc.name      g3dCamera1003
     * @tc.desc      相机距离 8 偏航 180 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1003 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -6.9282) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1003 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1004
     * @tc.name      g3dCamera1004
     * @tc.desc      相机距离 8 偏航 180 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1004 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -5.6569) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1004 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1005
     * @tc.name      g3dCamera1005
     * @tc.desc      相机距离 8 偏航 180 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1005 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1005 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1006
     * @tc.name      g3dCamera1006
     * @tc.desc      相机距离 8 偏航 180 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1006 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.0706) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1006 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1007
     * @tc.name      g3dCamera1007
     * @tc.desc      相机距离 8 偏航 180 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1007 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1007 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1008
     * @tc.name      g3dCamera1008
     * @tc.desc      相机距离 8 偏航 180 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1008 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1008 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1009
     * @tc.name      g3dCamera1009
     * @tc.desc      相机距离 8 偏航 180 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1009 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1009 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1010
     * @tc.name      g3dCamera1010
     * @tc.desc      相机距离 8 偏航 180 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1010 begin');
      const distance: number = 8;
      const yaw: number = 180 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1010 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1011
     * @tc.name      g3dCamera1011
     * @tc.desc      相机距离 8 偏航 225 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1011 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -5.6569) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1011 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1012
     * @tc.name      g3dCamera1012
     * @tc.desc      相机距离 8 偏航 225 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1012 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -5.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -5.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1012 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1013
     * @tc.name      g3dCamera1013
     * @tc.desc      相机距离 8 偏航 225 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1013 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.8990) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1013 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1014
     * @tc.name      g3dCamera1014
     * @tc.desc      相机距离 8 偏航 225 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1014 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1014 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1015
     * @tc.name      g3dCamera1015
     * @tc.desc      相机距离 8 偏航 225 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1015 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1015 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1016
     * @tc.name      g3dCamera1016
     * @tc.desc      相机距离 8 偏航 225 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1016 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -1.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1016 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1017
     * @tc.name      g3dCamera1017
     * @tc.desc      相机距离 8 偏航 225 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1017 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1017 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1018
     * @tc.name      g3dCamera1018
     * @tc.desc      相机距离 8 偏航 225 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1018 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 2.8284) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1018 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1019
     * @tc.name      g3dCamera1019
     * @tc.desc      相机距离 8 偏航 225 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1019 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.8990) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1019 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1020
     * @tc.name      g3dCamera1020
     * @tc.desc      相机距离 8 偏航 225 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1020 begin');
      const distance: number = 8;
      const yaw: number = 225 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1020 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1021
     * @tc.name      g3dCamera1021
     * @tc.desc      相机距离 8 偏航 270 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1021 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -8.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1021 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1022
     * @tc.name      g3dCamera1022
     * @tc.desc      相机距离 8 偏航 270 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1022 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -7.7274) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1022 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1023
     * @tc.name      g3dCamera1023
     * @tc.desc      相机距离 8 偏航 270 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1023 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1023 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1024
     * @tc.name      g3dCamera1024
     * @tc.desc      相机距离 8 偏航 270 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1024 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -5.6569) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1024 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1025
     * @tc.name      g3dCamera1025
     * @tc.desc      相机距离 8 偏航 270 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1025 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1025 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1026
     * @tc.name      g3dCamera1026
     * @tc.desc      相机距离 8 偏航 270 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1026 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -2.0706) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1026 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1027
     * @tc.name      g3dCamera1027
     * @tc.desc      相机距离 8 偏航 270 度俯仰 90 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1027 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 90 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - -0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 8.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -0.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1027 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1028
     * @tc.name      g3dCamera1028
     * @tc.desc      相机距离 8 偏航 270 度俯仰 120 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1028 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 120 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 4.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1028 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1029
     * @tc.name      g3dCamera1029
     * @tc.desc      相机距离 8 偏航 270 度俯仰 150 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1029 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 150 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1029 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1030
     * @tc.name      g3dCamera1030
     * @tc.desc      相机距离 8 偏航 270 度俯仰 180 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1030 begin');
      const distance: number = 8;
      const yaw: number = 270 * Math.PI / 180;
      const pitch: number = 180 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - 8.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1030 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1031
     * @tc.name      g3dCamera1031
     * @tc.desc      相机距离 8 偏航 300 度俯仰 0 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1031 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 0 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 0.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.9282) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1031 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1032
     * @tc.name      g3dCamera1032
     * @tc.desc      相机距离 8 偏航 300 度俯仰 15 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1032 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 15 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.8637) < 0.01).assertTrue();
      expect(Math.abs(y - 2.0706) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.6921) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1032 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1033
     * @tc.name      g3dCamera1033
     * @tc.desc      相机距离 8 偏航 300 度俯仰 30 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1033 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 30 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 3.4641) < 0.01).assertTrue();
      expect(Math.abs(y - 4.0000) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -6.0000) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1033 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1034
     * @tc.name      g3dCamera1034
     * @tc.desc      相机距离 8 偏航 300 度俯仰 45 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1034 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 45 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.8284) < 0.01).assertTrue();
      expect(Math.abs(y - 5.6569) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -4.8990) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1034 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1035
     * @tc.name      g3dCamera1035
     * @tc.desc      相机距离 8 偏航 300 度俯仰 60 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1035 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 60 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 2.0000) < 0.01).assertTrue();
      expect(Math.abs(y - 6.9282) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -3.4641) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1035 end');
    })

    /**
     * @tc.number    G3D_CAMERA_1036
     * @tc.name      g3dCamera1036
     * @tc.desc      相机距离 8 偏航 300 度俯仰 75 度的球坐标解算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dCamera1036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1036 begin');
      const distance: number = 8;
      const yaw: number = 300 * Math.PI / 180;
      const pitch: number = 75 * Math.PI / 180;
      const x: number = distance * Math.cos(pitch) * Math.cos(yaw);
      const y: number = distance * Math.sin(pitch);
      const z: number = distance * Math.cos(pitch) * Math.sin(yaw);
      const radius: number = Math.sqrt(x * x + y * y + z * z);
      expect(Math.abs(x - 1.0353) < 0.01).assertTrue();
      expect(Math.abs(y - 7.7274) < 0.01).assertTrue();
      expect(Math.abs(radius - distance) < 0.01).assertTrue();
      expect(Math.abs(z - -1.7932) < 0.01).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dCamera1036 end');
    })
  })
}
