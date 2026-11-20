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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function GeometryUtilExhaustiveMatrixPart1Test(): void {
  describe('GeometryUtilExhaustiveMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0100
     * @tc.name      testDegToRad0001
     * @tc.desc      Verify degToRad(-720).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0001 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-720) - -12.566370614359172) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0200
     * @tc.name      testDegToRad0002
     * @tc.desc      Verify degToRad(-360).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0002 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-360) - -6.283185307179586) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0300
     * @tc.name      testDegToRad0003
     * @tc.desc      Verify degToRad(-180).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0003 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-180) - -3.141592653589793) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0400
     * @tc.name      testDegToRad0004
     * @tc.desc      Verify degToRad(-90).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0004 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-90) - -1.5707963267948966) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0500
     * @tc.name      testDegToRad0005
     * @tc.desc      Verify degToRad(-45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0005 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-45) - -0.7853981633974483) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0600
     * @tc.name      testDegToRad0006
     * @tc.desc      Verify degToRad(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0006 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(0) - 0.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0700
     * @tc.name      testDegToRad0007
     * @tc.desc      Verify degToRad(30).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0007 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(30) - 0.5235987755982988) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0800
     * @tc.name      testDegToRad0008
     * @tc.desc      Verify degToRad(45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0008 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(45) - 0.7853981633974483) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_0900
     * @tc.name      testDegToRad0009
     * @tc.desc      Verify degToRad(90).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0009 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(90) - 1.5707963267948966) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1000
     * @tc.name      testDegToRad0010
     * @tc.desc      Verify degToRad(180).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0010 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(180) - 3.141592653589793) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1100
     * @tc.name      testDegToRad0011
     * @tc.desc      Verify degToRad(270).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0011 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(270) - 4.71238898038469) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1200
     * @tc.name      testDegToRad0012
     * @tc.desc      Verify degToRad(360).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0012 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(360) - 6.283185307179586) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1300
     * @tc.name      testDegToRad0013
     * @tc.desc      Verify degToRad(720).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0013 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(720) - 12.566370614359172) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1400
     * @tc.name      testRadToDeg0014
     * @tc.desc      Verify radToDeg(-6.283185307179586).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0014 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-6.283185307179586) - -360.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1500
     * @tc.name      testRadToDeg0015
     * @tc.desc      Verify radToDeg(-3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0015 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-3.141592653589793) - -180.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1600
     * @tc.name      testRadToDeg0016
     * @tc.desc      Verify radToDeg(-1.5707963267948966).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0016 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-1.5707963267948966) - -90.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1700
     * @tc.name      testRadToDeg0017
     * @tc.desc      Verify radToDeg(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0017 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(0) - 0.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1800
     * @tc.name      testRadToDeg0018
     * @tc.desc      Verify radToDeg(0.5235987755982988).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0018 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(0.5235987755982988) - 29.999999999999996) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_1900
     * @tc.name      testRadToDeg0019
     * @tc.desc      Verify radToDeg(0.7853981633974483).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0019 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(0.7853981633974483) - 45.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2000
     * @tc.name      testRadToDeg0020
     * @tc.desc      Verify radToDeg(1.5707963267948966).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0020 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(1.5707963267948966) - 90.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2100
     * @tc.name      testRadToDeg0021
     * @tc.desc      Verify radToDeg(3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0021 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(3.141592653589793) - 180.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2200
     * @tc.name      testRadToDeg0022
     * @tc.desc      Verify radToDeg(6.283185307179586).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0022 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(6.283185307179586) - 360.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2300
     * @tc.name      testPointOnCircle0023
     * @tc.desc      Verify pointOnCircle(0, 0, 10, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0023 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 0);
      expect(Math.abs(p.x - 10.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 0.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2400
     * @tc.name      testPointOnCircle0024
     * @tc.desc      Verify pointOnCircle(0, 0, 10, 1.5707963267948966).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0024 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, 10, 1.5707963267948966);
      expect(Math.abs(p.x - 6.123233995736766e-16) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 10.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2500
     * @tc.name      testPointOnCircle0025
     * @tc.desc      Verify pointOnCircle(5, 7, 3, 3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0025 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(5, 7, 3, 3.141592653589793);
      expect(Math.abs(p.x - 2.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 7.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2600
     * @tc.name      testPointOnCircle0026
     * @tc.desc      Verify pointOnCircle(100, 50, 20, 4.71238898038469).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0026 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(100, 50, 20, 4.71238898038469);
      expect(Math.abs(p.x - 100.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 30.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2700
     * @tc.name      testPointOnCircle0027
     * @tc.desc      Verify pointOnCircle(10, 20, 0, 0.7853981633974483).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0027 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(10, 20, 0, 0.7853981633974483);
      expect(Math.abs(p.x - 10.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 20.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2800
     * @tc.name      testPointOnCircle0028
     * @tc.desc      Verify pointOnCircle(0, 0, -5, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircle0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0028 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(0, 0, -5, 0);
      expect(Math.abs(p.x - -5.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 0.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircle0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_2900
     * @tc.name      testPointOnCircleDeg0029
     * @tc.desc      Verify pointOnCircleDeg angle 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0029 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 0);
      expect(Math.abs(p.x - 60.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 50.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3000
     * @tc.name      testPointOnCircleDeg0030
     * @tc.desc      Verify pointOnCircleDeg angle 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0030 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 30);
      expect(Math.abs(p.x - 58.66025403784439) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 55.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3100
     * @tc.name      testPointOnCircleDeg0031
     * @tc.desc      Verify pointOnCircleDeg angle 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0031 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 90);
      expect(Math.abs(p.x - 50.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 60.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3200
     * @tc.name      testPointOnCircleDeg0032
     * @tc.desc      Verify pointOnCircleDeg angle 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0032 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 180);
      expect(Math.abs(p.x - 40.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 50.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3300
     * @tc.name      testPointOnCircleDeg0033
     * @tc.desc      Verify pointOnCircleDeg angle 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0033 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 270);
      expect(Math.abs(p.x - 50.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 40.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0033 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3400
     * @tc.name      testPointOnCircleDeg0034
     * @tc.desc      Verify pointOnCircleDeg angle 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPointOnCircleDeg0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0034 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(50, 50, 10, 360);
      expect(Math.abs(p.x - 60.0) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 50.0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPointOnCircleDeg0034 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3500
     * @tc.name      testRectContains0035
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (10, 20).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0035 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 10, 20)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0035 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3600
     * @tc.name      testRectContains0036
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (110, 70).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0036 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 110, 70)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0036 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3700
     * @tc.name      testRectContains0037
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (60, 45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0037 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 60, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0037 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3800
     * @tc.name      testRectContains0038
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (9, 45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0038 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 9, 45)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0038 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_3900
     * @tc.name      testRectContains0039
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (111, 45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0039 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 111, 45)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0039 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GEXP1_4000
     * @tc.name      testRectContains0040
     * @tc.desc      Verify rectContains rect (10, 20, 100, 50) point (60, 19).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectContains0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0040 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 60, 19)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectContains0040 end');
    })

  })
}
